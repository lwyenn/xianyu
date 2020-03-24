<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category Admin
 * +------------------------------------------------------------+
 * 管理员列表
 * +------------------------------------------------------------+
 *
 * @author lwy
 * @copyright
 * @version 1.0
 *
 * Modified at : 2018-07-05 18:44:44
 *
 */
namespace app\index\controller;

use builder\builder;
use builder\lister;

class Admin extends Common
{
    /**
     * 管理员列表
     *
     *
     * @Author   LWY
     * @DateTime 2020-03-18 10:10
     */
    public function index()
    {
        $keywords       = $this->_get("keywords");
        $condition      = ['is_delete' => 1];
        if ($keywords) {
            $condition['admin_surename|admin_username'] = ['like', "%{$keywords}%"];
        }
        $AdModel    = model("Admin");
        $datas      = $AdModel->getPageData(['condition' => $condition]);

        $groups     = model("Group")->getAllGroup();

        $lister     = new lister();
        $form       = $lister->setTitle("管理员列表")
                            ->addTopButton(['title' => '增加', 'controller' => 'Admin', 'action' => 'edit', 'power' => 1])
                            ->addTextSearch(['title' => '关键字', 'name' => 'keywords'])
                            ->addGetUrl(url('index'))
                            ->addTableColumn(['title' => '管理账号','name'=>'admin_username'])
                            ->addTableColumn(['title' => '管理名称','name'=>'admin_surename'])
                            ->addSelectColumn(['title' => '管理角色','name'=>'group_id', 'options' => $groups])
                            ->addTableColumn(['title' => '最后登录时间','name'=>'admin_last_login_time', 'type' => 'time'])
                            ->addSwitchColumn(['title' => '是否启用','name'=>'admin_status'])
                            ->addTableColumn(['title' => '添加时间','name'=>'admin_addtime', 'type' => 'time'])
                            ->addRightButton(['title'=>'编辑','controller'=>'Admin','action'=>'edit','power'=>1,'param-id'])
                            ->addRightButton(['title'=>'删除','controller'=>'Admin','action'=>'delete','power'=>1,'param-id','ajax-post confirm'])
                            ->setDataList($datas['datas'])
                            ->setDataPage($datas['pageHtml'])
                            ->display();
        $this->assign('getdata', $this->_get());
        return $this->fetch("common/list", $form);
    }

    /**
     * 管理员修改/新增
     *
     * @param string $id 广告id
     *
     * @Author   LWY
     * @DateTime 2020-03-18 10:10
     */
    public function edit($id='')
    {
        $admin_info = [];
        $continue   = true;// 是否继续添加
        $title      = "管理员添加";
        if (!empty($id)) {
            $admin_info = model("Admin")->getOneList(['condition' => ['id' => $id]]);
            $continue   = false;
            $title      = "管理员编辑";
        }
        if (request()->isPost()) {
            $admin_username     = $this->_post("admin_username");
            $admin_surename     = $this->_post("admin_surename");
            $admin_password     = (int)$this->_post("admin_password");
            $group_id           = $this->_post("group_id");
            $admin_status       = $this->_post("admin_status");

            if (empty($admin_username)) {
                $this->error("账号必须填写！");
            }

            $admin_status       = $admin_status == 'on' ? 1 : 2;
            if (!$id) {
                $admin_password = $admin_password?$admin_password:'123456';
            }
            try{
                $data = [
                    'group_id'          => $group_id,
                    'admin_username'    => $admin_username,
                    'admin_password'    => $admin_password,
                    'admin_surename'    => $admin_surename,
                    'admin_status'      => $admin_status,
                    'admin_addtime'     => time(),
                ];
                if (empty($admin_password)) {
                    unset($data['admin_password']);
                } else {
                    $data['admin_password'] = encrypt_pwd($data['admin_password']);
                }
                if ($id) {
                    model("Admin")->where("id={$id}")->update($data);
                } else{
                    model("Admin")->insert($data);
                }
            } catch (\Exception $e) {
                model("ExpLog")->addLog("{$title}，原数据：".json_encode($admin_info)."，新数据：".json_encode($data), $e);
                $this->error("{$title}失败！");
            }
            $this->success("{$title}成功！");
        }

        $groups     = model("Group")->getAllGroup();

        $builder= new builder();
        $form   = $builder->setTitle($title)
                        ->setPostUrl(url('edit', 'id='.$id))
                        ->addTextItem(['name' => 'admin_username', 'title' => '管理员账号', 'require' => true])
                        ->addTextItem(['name' => 'admin_surename', 'title' => '管理员名称'])
                        ->addFormItem(['name' => 'admin_password', 'title' => '管理员密码','type'=>'password', 'value' => '','tips'=>'放空为不修改，新增时放空默认为123456'])
                        ->addSelectItem(['name' => 'group_id', 'title' => '管理员角色','options' => $groups])
                        ->addSwitchItem(['name' => 'admin_status', 'title' => '是否启用'])
                        ->setFormData($admin_info)
                        ->setContinue($continue)
                        ->display();
        return $this->fetch("common/builder", $form);
    }

    /**
     * 删除管理员
     *
     * @param string $id
     *
     * @Author   LWY
     * @DateTime 2020-03-18 13:33
     */
    public function delete($id = '')
    {
        $this->help_delete(2);
    }
}
