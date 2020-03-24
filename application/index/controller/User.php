<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category User
 * +------------------------------------------------------------+
 * 会员
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

class User extends Common
{
    /**
     * 会员列表
     *
     *
     * @Author   LWY
     * @DateTime 2020-03-18 10:10
     */
    public function index()
    {
        $keywords       = $this->_get("keywords");
        $user_regtime   = $this->_get("user_regtime");
        $condition      = ['is_delete' => 1];
        if ($keywords) {
            $condition['user_surename|user_phone'] = ['like', "%{$keywords}%"];
        }
        if ($user_regtime) {
            $time_range = time_range_cut($user_regtime);
            $st = strtotime($time_range['start_time']);
            $et = strtotime($time_range['end_time']);
            $condition['user_regtime'] = ['between', [$st, $et]];
        }

        $AdModel    = model("User");
        $datas      = $AdModel->getPageData(['condition' => $condition]);

        $lister     = new lister();
        $form       = $lister->setTitle("会员列表")
                            ->addTopButton(['title' => '添加会员', 'controller' => 'User', 'action' => 'edit', 'power' => 1])
                            ->addTextSearch(['title' => '用户名称/电话', 'name' => 'keywords'])
                            ->addDateRangeSearch(['title' => '注册时间', 'name' => 'user_regtime'])
                            ->addGetUrl(url('index'))
                            ->addTableColumn(['title' => 'ID','name'=>'id'])
                            ->addTableColumn(['title' => '用户名称','name'=>'user_surename'])
                            ->addSelectColumn(['title' => '性别','name'=>'user_sex', 'options' => config("logic.user_sex")])
                            ->addTableColumn(['title' => '注册手机','name'=>'user_phone'])
                            ->addTableColumn(['title' => '注册时间','name'=>'user_regtime','type' => 'time'])
                            ->addTableColumn(['title' => '地址','name'=>'user_address'])
                            ->addTableColumn(['title' => '用户余额','name'=>'score'])
                            ->addSelectColumn(['title' => '等级','name'=>'user_level', 'options' => config("logic.user_level")])
                            ->addSwitchColumn(['title' => '状态', 'name' => 'user_status'])
                            ->addRightButton(['title'=>'编辑','controller'=>'User','action'=>'edit','power'=>1,'param-id'])
                            ->addRightButton(['title'=>'删除','controller'=>'User','action'=>'delete','power'=>1,'param-id','ajax-post confirm'])
                            ->setDataList($datas['datas'])
                            ->setDataPage($datas['pageHtml'])
                            ->display();
        $this->assign('getdata', $this->_get());
        return $this->fetch("common/list", $form);
    }

    /**
     * 会员修改/新增
     *
     * @param string $id 会员id
     *
     * @Author   LWY
     * @DateTime 2020-03-18 10:10
     */
    public function edit($id='')
    {
        $user_info  = [];
        $continue   = true;// 是否继续添加
        $title      = "会员添加";
        if (!empty($id)) {
            $user_info  = model("User")->getOneList(['condition' => ['id' => $id]]);
            $continue   = false;
            $title      = "会员编辑";
        }
        if (request()->isPost()) {
            $user_username      = $this->_post("user_username");
            $user_surename      = $this->_post("user_surename");
            $user_password      = $this->_post("user_password");
            $user_phone         = $this->_post("user_phone");
            $user_address       = $this->_post("user_address");
            $user_level         = $this->_post("user_level");
            $user_status        = $this->_post("user_status");
            $user_price         = $this->_post("score");

            if (empty($user_username)) {
                $this->error("账号必须填写！");
            }

            $user_status        = $user_status == 'on' ? 1 : 2;
            if (!$id) {
                $user_password = $user_password?$user_password:'123456';
            }
            try{
                $data = [
                    'user_username'    => $user_username,
                    'user_surename'    => $user_surename,
                    'user_password'    => $user_password,
                    'user_phone'       => $user_phone,
                    'user_address'     => $user_address,
                    'user_level'       => $user_level,
                    'user_status'      => $user_status,
                    'user_regtime'     => time(),
                    'score'            => $user_price
                ];
                if (empty($user_password)) {
                    unset($data['user_password']);
                } else {
                    $data['user_password'] = encrypt_pwd($data['user_password']);
                }
                if ($id) {
                    model("User")->where("id={$id}")->update($data);
                } else{
                    model("User")->insert($data);
                }
            } catch (\Exception $e) {
                model("ExpLog")->addLog("{$title}，原数据：".json_encode($user_info)."，新数据：".json_encode($data), $e);
                $this->error("{$title}失败！");
            }
            $this->success("{$title}成功！");
        }

        $builder= new builder();
        $form   = $builder->setTitle($title)
                        ->setPostUrl(url('edit', 'id='.$id))
                        ->addTextItem(['name' => 'user_username', 'title' => '会员账号', 'require' => true])
                        ->addTextItem(['name' => 'user_surename', 'title' => '会员名称'])
                        ->addFormItem(['name' => 'user_password', 'title' => '会员密码','type'=>'password', 'value' => '','tips'=>'放空为不修改，新增时放空默认为123456'])
                        ->addRadioItem(['name' => 'user_sex', 'title' => '会员性别', 'options' => config("logic.user_sex")])
                        ->addTextItem(['name' => 'user_phone', 'title' => '会员手机号'])
                        ->addFormItem(['name' => 'user_address', 'title' => '会员地址', 'type' => 'textarea'])
                        ->addNumberItem(['name' => 'score', 'title' => '会员金额'])
                        ->addRadioItem(['name' => 'user_level', 'title' => '会员等级', 'options' => config("logic.user_level")])
                        ->addSwitchItem(['name' => 'user_status', 'title' => '会员状态'])
                        ->setFormData($user_info)
                        ->setContinue($continue)
                        ->display();
        return $this->fetch("common/builder", $form);
    }

    /**
     * 删除会员
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

    /**
     * 会员购买记录
     *
     *
     * @Author   LWY
     * @DateTime 2020-03-19 11:30
     */
    public function record()
    {
        $keywords       = $this->_get("keywords");
        $addtime        = $this->_get("addtime");
        $condition      = ['a.is_delete' => 1];
        if ($keywords) {
            $condition['a.content'] = ['like', "%{$keywords}%"];
        }
        if ($addtime) {
            $time_range = time_range_cut($addtime);
            $st = strtotime($time_range['start_time']);
            $et = strtotime($time_range['end_time']);
            $condition['addtime'] = ['between', [$st, $et]];
        }

        $UserScoreRecord    = model("UserScoreRecord");

        $datas      = $UserScoreRecord->getPageData(['condition' => $condition,'field' => "a.score_type,a.id,a.content,a.oldscore,a.score,a.orderno,a.addtime,b.user_username,b.user_surename"]);

        $lister     = new lister();
        $form       = $lister->setTitle("记录列表")
            ->addTextSearch(['title' => '关键字', 'name' => 'keywords'])
            ->addDateRangeSearch(['title' => '时间', 'name' => 'addtime'])
            ->addGetUrl(url('record'))
            ->addTableColumn(['title' => '用户名称','name'=>'user_surename'])
            ->addTableColumn(['title' => '用户账号','name'=>'user_username'])
            ->addTableColumn(['title' => '订单号','name'=>'orderno'])
            ->addSelectColumn(['title' => '类型','name'=>'score_type', 'options' => ['1' => '新购','2'=>'退货']])
            ->addTableColumn(['title' => '备注','name'=>'content'])
            ->addTableColumn(['title' => '操前金额','name'=>'oldscore'])
            ->addTableColumn(['title' => '支付金额','name'=>'score'])
            ->addTableColumn(['title' => '时间','name'=>'addtime', 'type' => 'time'])
            ->addRightButton(['title'=>'删除','controller'=>'User','action'=>'record_delete','power'=>1,'param-id','ajax-post confirm'])
            ->setDataList($datas['datas'])
            ->setDataPage($datas['pageHtml'])
            ->display();
        $this->assign('getdata', $this->_get());
        return $this->fetch("common/list", $form);
    }

    /**
     * 记录删除
     *
     *
     * @Author   LWY
     * @DateTime 2020-03-19 11:55
     */
    public function record_delete()
    {
        $this->help_delete(2, 'UserScoreRecord');
    }
}
