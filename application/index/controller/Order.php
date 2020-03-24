<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category Order
 * +------------------------------------------------------------+
 * 订单
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

class Order extends Common
{
    /**
     * 广告列表
     *
     *
     * @Author   LWY
     * @DateTime 2020-03-18 10:10
     */
    public function index()
    {
        $orderno        = $this->_get("orderno");
        $goods_name     = $this->_get("goods_name");
        $order_status   = (int)$this->_get("order_status");
        $user_username  = $this->_get("user_username");
        $ad_time        = $this->_get("ad_time");

        $condition      = ['a.is_delete' => 1];
        if ($goods_name) {
            $condition['b.goods_name'] = ['like', "%{$goods_name}%"];
        }
        if ($orderno) {
            $condition['a.orderno'] = ['like', "%{$orderno}%"];
        }
        if ($order_status) {
            $condition['a.order_status'] = $order_status;
        }
        if ($user_username) {
            $condition['c.user_username|c.user_surename'] = ['like', "%{$user_username}%"];
        }

        $sqls = '';
        if ($ad_time) {
            $time_range = time_range_cut($ad_time);
            $st = strtotime($time_range['start_time']);
            $et = strtotime($time_range['end_time']);
            $condition['a.order_addtime'] = ['between', [$st, $et]];
        }
        $OrderModel = model("Order");
        $datas      = $OrderModel->getPageData([
            'condition' => $condition,
            'field' => "a.id,a.orderno,a.goods_count,a.order_address,a.order_phone,a.order_price,a.order_addtime,a.order_status,b.goods_name,c.user_username,c.user_surename"
        ]);

        foreach ($datas['datas'] as &$vo){
            $vo['ostatus'] = $OrderModel->getOrderStatus($vo['order_status']);
        }

        $lister     = new lister();
        $form       = $lister->setTitle("订单列表")
                            ->addTextSearch(['title' => '订单号', 'name' => 'orderno'])
                            ->addTextSearch(['title' => '商品名称', 'name' => 'goods_name'])
                            ->addTextSearch(['title' => '用户名称或账号', 'name' => 'user_username'])
                            ->addDateRangeSearch(['title' => '时间范围', 'name' => 'ad_time'])
                            ->addSelectSearch(['title' => '订单状态', 'name' => 'order_status', 'options' => config('logic.order_status')])
                            ->addGetUrl(url('index'))
                            ->addTableColumn(['title' => '订单号','name'=>'orderno'])
                            ->addTableColumn(['title' => '用户账号','name'=>'user_username'])
                            ->addTableColumn(['title' => '用户名称','name'=>'user_surename'])
                            ->addTableColumn(['title' => '商品名称','name'=>'goods_name'])
                            ->addTableColumn(['title' => '购买数量','name'=>'goods_count'])
                            ->addTableColumn(['title' => '购买价格','name'=>'order_price'])
                            ->addTableColumn(['title' => '订单状态','name'=>'ostatus'])
                            ->addTableColumn(['title' => '订单地址','name'=>'order_address'])
                            ->addTableColumn(['title' => '联系方式','name'=>'order_phone'])
                            ->addTableColumn(['title' => '添加时间','name'=>'order_addtime', 'type' => 'time'])
                            ->addRightButton(['title'=>'编辑','controller'=>'Order','action'=>'edit','power'=>1,'param-id'])
                            ->addRightButton(['title'=>'发货','controller'=>'Order','action'=>'delivery','power'=>1,'param-id','class' => 'winbox'])
                            ->addRightButton(['title'=>'退货审核','controller'=>'Order','action'=>'refund','power'=>1,'param-id','class' => 'winbox'])
                            ->addRightButton(['title'=>'删除','controller'=>'Order','action'=>'delete','power'=>1,'param-id','ajax-post confirm'])
                            ->setDataList($datas['datas'])
                            ->setDataPage($datas['pageHtml'])
                            ->display();
        $this->assign('getdata', $this->_get());
        return $this->fetch("common/list", $form);
    }

    /**
     * 订单修改
     *
     * @param string $id 订单id
     *
     * @Author   LWY
     * @DateTime 2020-03-18 10:10
     */
    public function edit($id='')
    {
        if (!empty($id)) {
            $o_info     = model("Order")->getPageData([
                'condition' => ['a.id' => $id],
                'field' => "a.id,a.orderno,a.goods_count,a.order_address,a.order_phone,a.order_price,a.order_addtime,a.order_status,b.goods_name,c.user_username,c.user_surename"
            ]);
            $o_info     = $o_info['datas'][0];
            $continue   = false;
            $title      = "订单编辑";

            if ($o_info['order_status'] >= 2) {
                $this->error("订单已发货，不能编辑！", url('index'));
            }

        } else {
            $this->error("非法操作");
        }
        if (request()->isPost()) {
            $order_address   = $this->_post("order_address");
            $order_phone     = $this->_post("order_phone");

            try{
                $data = [
                    'order_address'  => $order_address,
                    'order_phone'    => $order_phone,
                ];
                if ($id) {
                    model("Order")->where("id={$id}")->update($data);
                }
            } catch (\Exception $e) {
                model("ExpLog")->addLog("{$title}，原数据：".json_encode($o_info)."，新数据：".json_encode($data), $e);
                $this->error("{$title}失败！");
            }
            $this->success("{$title}成功！");
        }
        $builder= new builder();
        $form   = $builder->setTitle($title)
                        ->setPostUrl(url('edit', 'id='.$id))
                        ->addStaticItem(['name' => 'user_username', 'title' => '用户账号'])
                        ->addStaticItem(['name' => 'orderno', 'title' => '订单号'])
                        ->addStaticItem(['name' => 'goods_name', 'title' => '商品名称'])
                        ->addStaticItem(['name' => 'goods_count', 'title' => '购买数量'])
                        ->addStaticItem(['name' => 'order_price', 'title' => '购买价格'])
                        ->addTextItem(['name' => 'order_address', 'title' => '订单地址'])
                        ->addTextItem(['name' => 'order_phone', 'title' => '联系方式'])
                        ->setFormData($o_info)
                        ->setContinue($continue)
                        ->display();
        return $this->fetch("common/builder", $form);
    }

    /**
     * 订单发货
     *
     * @param string $id 订单id
     *
     * @Author   LWY
     * @DateTime 2020-03-19 14:17
     */
    public function delivery($id = '')
    {
        if (empty($id)) {
            $this->error("非法操作！",url('index'), 'winbox');
        }
        $o_info     = model("Order")->getPageData([
            'condition' => ['a.id' => $id],
            'field' => "a.id,a.orderno,a.goods_count,a.order_address,a.order_phone,a.order_price,a.order_addtime,a.order_status,b.goods_name,c.user_username,c.user_surename"
        ]);
        $o_info     = $o_info['datas'][0];
        if ($o_info['order_status'] >= 2 || $o_info['order_status'] == 0) {
            $this->error("订单状态不符合！", url('index'), 'winbox');
        }
        if (request()->isPost()) {
            $order_logistics    = $this->_post("order_logistics");
            $order_logno        = $this->_post("order_logno");
            if (empty($order_logistics) || empty($order_logno)) {
                $this->error("物流信息不为空！");
            }
            try {
                $data = [
                    'order_logistics'   => $order_logistics,
                    'order_logno'       => $order_logno,
                    'order_status'      => 2
                ];
                model("Order")->where("id={$id}")->update($data);
            } catch (\Exception $e) {
                model("ExpLog")->addLog("物流编辑，原数据：".json_encode($o_info)."，新数据：".json_encode($data), $e);
                $this->error("物流编辑失败！");
            }
            $this->success("物流编辑成功！");
        }

        if (empty($o_info['order_address']) || empty($o_info['order_phone'])) {
            $this->error("订单联系方式或地址未填写！", url('index'), 'winbox');
        }
        $builder= new builder();
        $form   = $builder->setTitle("物流信息")
            ->setPostUrl(url('delivery', 'id='.$id))
            ->addStaticItem(['name' => 'orderno', 'title' => '订单号'])
            ->addStaticItem(['name' => 'goods_name', 'title' => '商品名称'])
            ->addTextItem(['name' => 'order_logistics', 'title' => '订单物流', 'require'=> 1])
            ->addTextItem(['name' => 'order_logno', 'title' => '物流单号', 'require'=> 1])
            ->setFormData($o_info)
            ->setContinue(false)
            ->display();
        return $this->fetch("common/pop", $form);
    }

    /**
     * 订单退货
     *
     * @param string $id 订单id
     *
     * @Author   LWY
     * @DateTime 2020-03-19 14:17
     */
    public function refund($id = '')
    {
        if (empty($id)) {
            $this->error("非法操作！",url('index'), 'winbox');
        }
        $o_info     = model("Order")->getPageData([
            'condition' => ['a.id' => $id],
            'field' => "a.id,a.uid,a.orderno,a.order_user_remark,a.goods_count,a.order_address,a.order_phone,a.order_price,a.order_addtime,a.order_status,b.goods_name,c.user_username,c.user_surename,c.score"
        ]);
        $o_info     = $o_info['datas'][0];
        if ($o_info['order_status'] != 4) {
            $this->error("订单状态不为退货！", url('index'), 'winbox');
        }
        if (request()->isPost()) {
            $order_status    = $this->_post("order_status");
            $order_remark    = $this->_post("order_remark");
            try {
                $db   = model("Order")->db(false);
                $db->startTrans();
                $data = [
                    'order_status'   => $order_status,
                    'order_remark'   => $order_remark,
                ];
                model("Order")->where("id={$id}")->update($data);

                $r = model("User")->where("id=".$o_info['uid'])->setInc('score', $o_info['order_price']);
                if ($r) {
                    model("UserScoreRecord")->insert([
                        'uid'       => $o_info['uid'],
                        'content'   => "退货，产品".$o_info['goods_name']."，总价：{$o_info['order_price']}，数量：{$o_info['goods_count']}",
                        'oldscore'  => $o_info['score'],
                        'orderno'   => $o_info['orderno'],
                        'score'     => $o_info['order_price'],
                        'score_type'=> 2,
                        'addtime'   => time()
                    ]);
                }
                $db->commit();
            } catch (\Exception $e) {
                $db->rollback();
                model("ExpLog")->addLog("订单退货审核，原数据：".json_encode($o_info)."，新数据：".json_encode($data), $e);
                $this->error("订单退货审核失败！");
            }
            $this->success("订单退货审核成功！");
        }

        $builder= new builder();
        $form   = $builder->setPostUrl(url('refund', 'id='.$id))
            ->addStaticItem(['name' => 'user_username', 'title' => '用户账号'])
            ->addStaticItem(['name' => 'orderno', 'title' => '订单号'])
            ->addStaticItem(['name' => 'goods_name', 'title' => '商品名称'])
            ->addStaticItem(['name' => 'order_user_remark', 'title' => '用户备注'])
            ->addRadioItem(['name' => 'order_status', 'title' => '审核','options'=>['5' => '通过', '6' => '不通过']])
            ->addFormItem(['name' => 'order_remark', 'title' => '审核备注', 'type' => 'textarea'])
            ->setFormData($o_info)
            ->setContinue(false)
            ->display();
        return $this->fetch("common/pop", $form);
    }

    /**
     * 删除广告
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
