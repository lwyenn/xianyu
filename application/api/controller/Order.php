<?php
/**
 *
 * +------------------------------------------------------------+
 * @category Order
 * +------------------------------------------------------------+
 * 订单
 * +------------------------------------------------------------+
 *
 * @copyright
 * @version 1.0
 *
 * Modified at :
 * @author lwy
 *
 */
namespace app\api\controller;

use think\Db;

/**
 * @title 订单管理
 * @description 订单接口
 */
class Order extends Common
{
    /**
     * @title 订单列表
     * @description 获取订单列表
     * @author lwy
     * @url /api.php/order/olist
     * @method GET
     *
     *
     * @param name:goodsname type:string desc:商品名称
     * @param name:uid type:int require:1 desc:用户id
     * @param name:order_start_time type:string desc:订单起始时间
     * @param name:order_end_time type:string desc:订单结束时间
     * @param name:orderno type:string desc:订单号
     * @param name:page type:int desc:页码
     * @param name:page_num type:int desc:每页数量
     *
     *
     * @return datas:数据列表@
     * @datas orderno:订单号 goods_name:商品名称 goods_count:商品数量 order_price:商品价格 order_status:订单状态 order_addtime:订单时间 order_address:订单地址 order_phone:联系方式 order_logistics:物流 order_logno:物流号 order_remark:退货时的备注 status_text:状态中文 id:订单id
     * @return total:订单总数量
     */
    public function olist()
    {
        $goodsname          = $this->_get("goodsname");
        $orderno            = $this->_get("orderno");
        $uid                = (int)$this->_get("uid");
        $order_start_time   = $this->_get("order_start_time");
        $order_end_time     = $this->_get("order_end_time");
        $page_num           = $this->_get("page_num");

        $condition = [
            'a.is_delete'   => 1,
            'a.uid'         => $uid
        ];
        $sqls = "(1=1)";
        if ($goodsname) {
            $condition['b.goods_name']  = ['like', "%{$goodsname}%"];
        }
        if ($orderno) {
            $condition['a.orderno']     = ['like', "%{$orderno}%"];
        }
        if ($order_start_time) {
            $st = strtotime($order_start_time);
        }
        if ($order_end_time) {
            $et = strtotime($order_start_time." 23:59:59");
        }
        if (!empty($st)) {
            $sqls .= " and a.order_addtime >= {$st}";
        }
        if (!empty($et)) {
            $sqls .= " and a.order_addtime <= {$et}";
        }
        $OrderModel = model("Order");
        $data       = $OrderModel->getPageData([
            'condition' => $condition,
            'sqls'      => $sqls,
            'field'     => "a.orderno,b.goods_name,a.goods_count,a.order_price,a.order_status,a.order_addtime,a.order_address,a.order_phone,a.order_logistics,a.order_logno,a.order_remark,a.id"
        ], $page_num);

        $status = config('logic.order_status');
        foreach ($data['datas'] as &$vo) {
            $vo['status_text'] = $status[$vo['order_status']];
            $vo['order_addtime'] = date("Y-m-d H:i:s", $vo['order_addtime']);
        }
        unset($data['pageHtml']);
        $this->_success("获取成功！", $data);
    }

    /**
     * @title 下单
     * @description 用户支付下单
     * @author lwy
     * @url /api.php/order/pay
     * @method POST
     *
     *
     * @param name:goods_id type:string require:1 desc:商品id
     * @param name:uid type:string require:1 desc:用户id
     * @param name:gooods_count type:int require:1 desc:购买数量
     * @param name:price type:float require:1 desc:购买总价格
     * @param name:address type:string require:1 desc:用户地址
     * @param name:phone type:string require:1 desc:联系方式
     *
     *
     * @return uid:用户id
     * @return orderno:订单号
     * @return goods_id:商品id
     * @return goods_count:购买数量
     * @return order_price:购买总价
     * @return order_addtime:订单时间
     * @return order_status:订单状态，默认1
     */
    public function pay()
    {
        $goods_id       = (int)$this->_post("goods_id");
        $uid            = (int)$this->_post("uid");
        $goods_count    = (int)$this->_post("goods_count");
        $price          = (float)$this->_post("price");
        $address        = $this->_post("address");
        $phone          = $this->_post("phone");

        if (empty($goods_id) || empty($goods_count) || empty($price) || empty($uid)|| empty($address) || empty($phone)) {
            $this->_error("参数不为空！");
        }
        $goods = model("Goods")->getOneList(['condition' => [
            'id'            => $goods_id,
            'is_grounding'  => 1,
            'is_delete'     => 1
        ]]);
        if (empty($goods)) {
           $this->_error("商品已下架或商品不存在");
        }
        if ($goods['goods_count'] < $goods_count) {
            $this->_error("购买数量大于库存！");
        }
        $user = model("User")->getOneList(['condition' => [
            'id'            => $uid,
            'user_status'   => 1,
            'is_delete'     => 1
        ]]);
        if (empty($user)) {
            $this->_error("用户不存在或已被禁用");
        }
        if ($user['score'] < $price) {
            $this->_error("用户余额不足！");
        }
        try {
            Db::startTrans();
            //生成随机订单号
            $orderno    = build_order_no($user['id']);

            //用户操作
            $r = Db::name("User")->where("id=".$user['id'])->setDec('score', $price);
            if ($r) {
                Db::name("UserScoreRecord")->insert([
                    'uid'       => $user['id'],
                    'content'   => "购买产品".$goods['goods_name']."，总价：{$price}，数量：{$goods_count}",
                    'oldscore'  => $user['score'],
                    'orderno'   => $orderno,
                    'score'     => $price,
                    'addtime'   => time()
                ]);
            }

            //商品操作
            $r = Db::name("Goods")->where("id=".$goods_id)->setDec('goods_count', $goods_count);
            if ($r) {
                $info = [
                    'uid'           => $user['id'],
                    'orderno'       => $orderno,
                    'goods_id'      => $goods_id,
                    'goods_count'   => $goods_count,
                    'order_price'   => $price,
                    'order_addtime' => time(),
                    'order_status'  => 1,
                    'order_address' => $address,
                    'order_phone'   => $phone,
                ];
                Db::name("Order")->insert($info);
            }
            Db::commit();
        } catch (\Exception $e) {
            Db::rollback();
            model("ExpLog")->addLog("用户账号{$user['user_username']}，购买商品{$goods['goods_name']}，总价：{$price}", $e);
            $this->_error('商品已下架或商品不存在');
        }
        $info['order_addtime'] = date("Y-m-d H:i:s", $info['order_addtime']);
        $this->_success("下单成功！", $info);
    }

    /**
     * @title 加入购物车
     * @description 购物车
     * @author lwy
     * @url /api.php/order/addcart
     * @method POST
     *
     *
     * @param name:uid type:int require:1 desc:用户id
     * @param name:gid type:int require:1 desc:商品id
     * @param name:gcount type:int require:1 desc:商品数量
     *
     *
     */
    public function addcart()
    {
        $uid    = (int)$this->_post("uid");
        $gid    = (int)$this->_post("gid");
        $gcount = (int)$this->_post("gcount");

        if (empty($uid) || empty($gid) || empty($gcount)) {
            $this->_error("参数不为空！");
        }

        $user = model("User")->getCount(['condition' => ['id' => $uid, 'is_delete' =>1]]);
        if (empty($user)) {
            $this->_error("用户不存在或已被禁用！");
        }


        try {
            Db::startTrans();
            Db::name("GoodsCart")->insert([
                'uid'       => $uid,
                'gid'       => $gid,
                'gcount'    => $gcount,
                'addtime'   => time(),
            ]);
            Db::commit();
        } catch (\Exception $e) {
            Db::rollback();
            model("ExpLog")->addLog("加入购物车：".json_encode($this->_post()), $e);
            $this->_error('加入购物车失败！');
        }
        $this->_success('加入购物车成功！');
    }

    /**
     * @title 查看购物车
     * @description 查看用户购物车
     * @author lwy
     * @url /api.php/order/viewcart
     * @method POST
     *
     *
     * @param name:uid type:int require:1 desc:用户id
     * @param name:page_num type:int desc:每页条数
     * @param name:page type:int desc:当前页码
     *
     * @return datas:数据列表@
     * @datas id:购物车id goods_name:商品名称 gcount:数量 addtime:添加时间 max_count:最大购物数量 price:商品单价
     * @return total:购物车数量
     */
    public function viewcart()
    {
        $uid        = (int)$this->_post("uid");
        $page_num   = (int)$this->_post("page_num");

        if (empty($uid)) {
            $this->_error("参数不为空！");
        }
        $data = model("GoodsCart")->getPageData([
            'condition' => ['a.uid' => $uid, 'a.status' => 1, 'a.is_delete' => 1],
            'field'     => "a.id,c.goods_name,a.gcount,a.addtime,c.goods_count as max_count,c.goods_price as price"
        ],$page_num);
        unset($data['pageHtml']);
        foreach ($data['datas'] as &$vo) {
            $vo['addtime'] = date("Y-m-d H:i:s", $vo['addtime']);
        }
        $this->_success('获取成功！', $data);
    }

    /**
     * @title 订单退货
     * @description 用户退货
     * @author lwy
     * @url /api.php/order/refund
     * @method POST
     *
     *
     * @param name:order_id type:string require:1 desc:订单id
     * @param name:uid type:int require:1 desc:用户id
     * @param name:user_remark type:string desc:用户备注
     *
     *
     */
    public function refund()
    {
        $oid    = (int)$this->_post("order_id");
        $uid    = (int)$this->_post("uid");
        $remark = $this->_post("user_remark");
        if (!$oid || !$uid) {
            $this->_error("非法操作！");
        }
        $info = model("Order")->where("id=".$oid." and uid=".$uid)->find();
        if ($info['order_status'] >= 3) {
            $this->_error("订单状态不符合！");
        }
        try {
            Db::startTrans();
            Db::name("Order")->where("id=".$oid." and uid=".$uid)->update([
                'order_status'      => 4,
                'order_user_remark' => $remark
            ]);
            Db::commit();
        } catch (\Exception $e) {
            Db::rollback();
            model("ExpLog")->addLog("用户id-{$uid}，退货订单信息：".json_encode($info), $e);
            $this->_error('退货申请失败！');
        }
        $this->_success('退货申请成功！');
    }
}