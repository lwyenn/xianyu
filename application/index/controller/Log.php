<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category Log 
 * +------------------------------------------------------------+
 * 日志管理
 * +------------------------------------------------------------+
 *
 * @author lwy
 * @copyright
 * @version 1.0
 *
 * Modified at : 2019-08-19 14:44:44
 *
 */
namespace app\index\controller;

use builder\builder;
use builder\lister;

class Log extends Common
{
	/**
	 * 系统日志
	 * 
	 * @access public
	 * @Author   LWY
	 * @DateTime 2019-08-20T14:56:55+0800
	 * @param   $id string 操作人id
	 * @return   
	 */
    public function index($id = '')
    {
    	//默认数据库
        $table_name = "Log";
        $where 		= [];
        $getdata    = $this->_get();
		if($id){
			$where['admin_id'] = $id;
		}
		if(!empty($getdata['keyword'])){
			$where['log_action_user'] 	= ['like','%'.trim($_REQUEST['keyword']).'%'];
		}
		if(!empty($getdata['time'])){
			$where['log_action_time'] 	= ['like','%'.trim($_REQUEST['time']).'%'];
		}
		if(!empty($getdata['ip'])){
		    $where['log_action_ip'] 	= ['like','%'.trim($_REQUEST['ip']).'%'];
		}		
		if(!empty($getdata['content'])){
		    $where['log_content'] 		= ['like','%'.trim($_REQUEST['content']).'%'];
		}
		if(!empty($getdata['table_name'])){
			$table_name = $getdata['table_name'];
		}else{
			$getdata['table_name'] = $table_name;
		}
		$model = model($table_name);
		$datas = $model->getPageData([
			'condition' => $where,
			'field'		=> 'id,log_action_user,log_content,log_action_ip,log_action_time,log_http_type',
			'order'		=> 'id DESC'
		]);

		foreach ($datas['datas'] as $key => &$value) {
			if (!empty($getdata['content'])) {
				$value['log_content'] = str_replace($getdata['content'], "<font color='red'>".$getdata['content']."</font>", $value['log_content']);
			}
			if (!empty($getdata['keyword'])) { 
				$value['log_action_user'] = str_replace($getdata['keyword'], "<font color='red'>".$getdata['keyword']."</font>", $value['log_action_user']);
			}
		}

		$lister     = new lister();
        $form       = $lister->setTitle("日志记录")
                            ->addTextSearch(['title' => '编辑', 'name' => 'log_content'])
                            ->addDateRangeSearch(['title' => '时间范围', 'name' => 'log_actionion_time'])
                            ->addSelectSearch(['title' => '提交模式', 'name' => 'log_http_type', 'options' => ['get' => 'GET参数', 'post' => 'POST参数']])
                            ->addGetUrl(url('index'))

                            ->addCheckColumn()
                            ->addTableColumn(['title' => '操作方式','name'=>'log_http_type'])
                            ->addTableColumn(['title' => '操作人','name'=>'log_action_user'])
                            ->addTableColumn(['title' => '描述','name'=>'log_content'])
                            ->addTableColumn(['title' => '用户ip','name'=>'log_action_ip'])
                            ->addTableColumn(['title' => '时间','name'=>'log_action_time','type'=>'time'])
                            ->setPager($datas)
                            ->display(1);

		$this->assign("getdata",$getdata);
		$this->assign('admin_id', $this->_admin_id);
        return $this->fetch("common/list", $form);
	}

	public function my(){
		return $this->index($this->_admin_id);
	}
}
