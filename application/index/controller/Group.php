<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category Group 
 * +------------------------------------------------------------+
 * 用户管理
 * +------------------------------------------------------------+
 *
 * @author lwy
 * @version 1.0
 *
 * Modified at : 2019-08-19 14:44:44
 *
 */
namespace app\index\controller;

use builder\builder;
use builder\lister;

class Group extends Common
{
	/**
	 * 列表页
	 * 
	 * @access public
	 * @Author   LWY
	 * @DateTime 2019-10-22T10:23:05+0800
	 * @return   [type] [description]
	 */
	public function index()
	{
		$datas  = model("group")->getPageData();

		$lister = new lister();
		$form   = $lister->setTitle("角色列表")

                       ->addTopButton(['title' => '创建角色组', 'controller' => 'Group', 'action' => 'add', 'power' => 1])
                       ->addTopButton(['title' => '批量新增授权', 'controller' => 'Group', 'action' => 'all_add', 'power' => 1, 'class' => 'target-ids'])

                       ->addCheckColumn()
                       ->addTableColumn(['title' => 'ID','name'=>'id'])
                       ->addTableColumn(['title' => '角色名称','name'=>'group_name'])
                       ->addTableColumn(['title' => '角色类型','name'=>'group_type', 'type' => 'select', 'options' => ['1'=>'管理员','2'=>'超级管理员']])

                       ->addRightButton(['title' => '授权管理', 'controller' => 'Group','action'=>'edit', 'param-id', 'power' => 1])
                       ->addRightButton(['title' => '删除', 'controller' => 'Group', 'action'=>'delete', 'param-id', 'power' => 1, 'ajax-post confirm'])
                       ->setPager($datas)
                       ->display(1);

        return $this->fetch("common/list", $form);
	}
	/**
	 * 创建角色组
	 * 
	 * @access public
	 * @Author   LWY
	 * @DateTime 2019-08-22T15:00:13+0800
	 * @param   $id string
	 */
	public function add($id = '')
	{

		//数据处理
		$result = [];
		$group_list = array_column(config("menu."), 'list');

		// 修改
		$datas = [];
		if(!empty($id)){
			$datas = model("Group")->getOneList(['condition' => ['id' => $id]]);
		}

		// post 提交数据处理
		if(request()->isPost()){
			$id      		 		 	= (int) $this->_post("id");

			$data = [];
			$data['group_name']      	= trim($this->_post("group_name", '角色组名称'));
			$data['group_resources']    = json_encode($this->_post("group_resources"));
			$data['group_type']		 	= 1; // 2超管 1管理员

			if ($id > 0) {
				$datas = model("Group")->getOneList(['condition' => ['id' => $id]]);
			}

			$descript = '更新角色组资料 : <br>';
		    $descript .= '【角色组名称】: '.$this->_post('group_name').'<br>';	
		    $descript .= '【角色组权限】: '.json_encode($this->_post("group_resources")).'<br>';	
		    $descript .= '【角色组旧权限】: '.json_encode($datas).'<br>';	
			model("Log")->write($descript);	

			try{
				if ($id > 0 && !empty($datas)) {
					model("Group")->where("id=".$id)->update($data);
					$str = "修改授权";
				} else {
					if ($id > 0) $data['id'] = $id;
					model("Group")->insert($data);
					$str = "增加授权";
				}
				$res = true;
			} catch (Exception $e) {
				$res = false;
			}
			if ($res) $this->success($str."成功");
			$this->error($str."失败");
		}
		
		$title = "创建角色组";
		if(!empty($datas)){
			$group_arr = json_decode($datas['group_resources'], true);
			if (!empty($group_arr)) {
				foreach ($group_list as $key => $value) {
					foreach ($value as $k => $v) {
						foreach ($v['list'] as $i => $item) {
							$mm = isset($item['m']) ? $item['m'] : $k;
							$group_key = strtolower($mm."_".$item['a']);
							if(in_array($group_key, $group_arr)){
								$group_list[$key][$k]['list'][$i]['is_checked'] = true;
							}else{
								$group_list[$key][$k]['list'][$i]['is_checked'] = false;
							}
						}
						
					}
				}
			}
			$title = "授权管理";
		}

		$builder 	= new builder();
		$builder->setTitle($title)->setPostUrl(url('add', 'id='.$id));
						
		if (empty($datas)) {
			$builder->addNumberItem(['name' => 'id','title' => '角色组ID']);
			$continue = true;
		} else {
			$builder->addHiddenItem(['name' => 'id', 'title' => 'ID']);
			$continue = false;
		}				
						
		$form = $builder->addTextItem(['name' => 'group_name', 'title' => '角色组名称', 'require' => true])
						->addCheckItem(['name' => '', 'title' => '可操作权限', 'options' => ['全选/反选'], 'class' => 'check_box_label resource-father'])
						->addFormItem(['name' => 'group_resources[]', 'class' => 'resource-children', 'type' => 'tree_check','title' => '', 'options' => $group_list])
						->setFormData($datas)
						->setContinue($continue)
						->display();
		$this->assign($form);
		return $this->fetch("common/builder");
	}
	/**
	 * 修改角色组
	 * 
	 * @access public
	 * @Author   LWY
	 * @DateTime 2019-08-22T15:25:34+0800
	 */
	public function edit()
	{
		$id = (int)$this->_get("id");
		if($id < 1){
			$this->error("非法操作！");
		}
	    return $this->add($id);
	}

	/**
	 * 批量新增授权
	 * 
	 * @access public
	 * @Author   LWY
	 * @DateTime 2019-09-29T18:16:27+0800
	 * @return   
	 */
	public function all_add()
	{
		//数据处理
		$result = [];
		$group_list = array_column(config("menu."), 'list');

		// 修改
		$datas 	= [];
		$ids	= $this->_get("group_id");
		if (empty($ids)) {
			$this->error("未选择数据！");
		}
		$ids 	= str_replace("_", ",", $ids);
		$idarr  = explode(",", $ids);

		$GroupModel = model("Group");
		//角色名称
		$g_name 	= $GroupModel->getFieldByCondition('group_name', ['id' => ['IN', $ids]], true, 'id');

		// post 提交数据处理
		if(request()->isPost()){
			$id      		 		 	= $this->_post("id");

			$group_name      	= $this->_post("group_name");
			$group_resources    = $this->_post("group_resources");
			$group_type		 	= 1; // 2超管 1管理员

			if (empty($id)) {
				$this->error("非法操作！");
			}

			$group_resources 	= empty($group_resources) ? [] : $group_resources; 

			$descript  = '新增角色组权限资料 : <br>';
		    $descript .= '【角色组名称】: '.json_encode($group_name).'<br>';	
		    $descript .= '【角色组新增权限】: '.json_encode($group_resources).'<br>';	
			model("Log")->write($descript);	

			$old_group = $GroupModel->getAllList(['condition' => ['id' => ['IN', $id]], 'field' => 'id,group_name,group_resources']);

			$GroupModel->startTrans();
			try{
				foreach ($old_group as $key => $value) {
					$update 	= [];
					//角色名称
					$group_name[$value['id']] 		= trim($group_name[$value['id']]);
					if (!empty($group_name[$value['id']])) {
						$update['group_name'] 		= $group_name[$value['id']];
					}
					//角色权限
					if (!empty($group_resources)) {
						//旧权限
						$old_group_resources 		= json_decode($value['group_resources'], true);
						$old_group_resources 		= empty($old_group_resources) ? [] : $old_group_resources; 
						//合并新旧权限
						$new_group_resources 		= array_merge($old_group_resources, $group_resources);

						$update['group_resources'] 	= json_encode($new_group_resources);
					}
					if (!empty($update)) {
						$GroupModel->where("id=".$value['id'])->update($update);
					}
				}
				$res = true;
			} catch (Exception $e) {
				$res = false;
			}
			if ($res) {
				$GroupModel->commit();
				$this->success("批量添加成功");
			} else {
				$GroupModel->rollback();
				$this->error("批量添加失败");
			}
		}
		
		$title 		= "批量新增授权";

		$builder 	= new builder();
						
		$builder->setTitle($title)
				->addHiddenItem(['name' => 'id', 'title' => 'ID', 'value' => $ids]);

		foreach ($idarr as $key => $value) {
			$builder->addTextItem(['name' => 'group_name['.$value.']', 'title' => '角色组名称'.($key+1), 'value' => $g_name[$value]]);
		}
		$form = $builder->addCheckItem(['name' => '', 'title' => '可操作权限', 'options' => ['全选/反选'], 'class' => 'resource-father'])
				->addFormItem(['name' => 'group_resources[]', 'class' => 'resource-children', 'type' => 'tree_check','title' => '', 'options' => $group_list])
				->setFormData($datas)
				->display();
		$this->assign($form);
		return $this->fetch("common/builder");
	}

    /**
     * 角色删除
     *
     * @param string $id 角色id
     *
     * @Author   LWY
     * @DateTime 2020-03-17 17:18
     */
	public function delete($id = '')
    {
        //判断角色下是否还有成员
        $admin_count = model("admin")->getCount(['condition' => ['group_id' => $id]]);
        if (!empty($admin_count)) {
            $this->error("该角色下还有成员，不可删除！");
        }
        $this->help_delete(1);
    }
}
