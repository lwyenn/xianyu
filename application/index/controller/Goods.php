<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category Goods
 * +------------------------------------------------------------+
 * 商品
 * +------------------------------------------------------------+
 *
 * @author lwy
 * @copyright
 * @version 1.0
 *
 * Modified at : 2020-03-7
 *
 */
namespace app\index\controller;

use builder\builder;
use builder\lister;

class Goods extends Common
{
    /**
     * 商品列表
     *
     * @return mixed
     */
    public function glist()
    {
        $g_name  = $this->_get("g_name");
        $gt_id   = (int)$this->_get("gt_id");

        $condition = ['is_delete' => 1];

        if ($g_name) {
            $condition['goods_name']    = ['like', "%{$g_name}%"];
        }
        if ($gt_id) {
            $condition['gt_id']         = $gt_id;
        }
        //商品列表
        $datas      = model("Goods")->getPageData(['condition' => $condition]);
        //商品分类
        $gtypes     = model("GoodsType")->getGoodsTypeList();

        $lister     = new lister();
        $form       = $lister->setTitle("商品列表")
                            ->addTopButton(['title' => '增加', 'controller' => 'Goods', 'action' => 'g_edit', 'power' => 1])
                            ->addTextSearch(['title' => '商品名称', 'name' => 'g_name'])
                            ->addSelectSearch(['title' => '商品分类', 'name' => 'gt_id', 'options' => $gtypes])
                            ->addGetUrl(url('glist'))
                            ->addTableColumn(['title' => '商品分类','name'=>'gt_id', 'type' => 'select', 'options' => $gtypes])
                            ->addTableColumn(['title' => '商品名称','name'=>'goods_name'])
                            ->addTableColumn(['title' => '商品数量','name'=>'goods_count'])
                            ->addTableColumn(['title' => '价格','name'=>'goods_price'])
                            ->addPictureColumn(['title' => '图片','name'=>'goods_img'])
                            ->addSwitchColumn(['title' => '上架','name'=>'is_grounding'])
                            ->addTableColumn(['title' => '添加时间','name'=>'addtime', 'type' => 'time'])
                            ->addRightButton(['title' => '编辑', 'power' => 1, 'controller'=>'Goods', 'action' => 'g_edit', 'param-id'])
                            ->addRightButton(['title' => '删除', 'power' => 1, 'controller'=>'Goods', 'action' => 'g_delete', 'param-id', 'ajax-post confirm'])
                            ->setDataList($datas['datas'])
                            ->setDataPage($datas['pageHtml'])
                            ->display(1);
        $this->assign('getdata', $this->_get());
        return $this->fetch("common/list", $form);
    }

    /**
     * 商品编辑或新增
     *
     * @param string $id 商品id
     *
     * @Author   LWY
     * @DateTime 2020-03-17 14:21
     */
    public function g_edit($id='')
    {
        $ginfo = [];
        $title = "增加商品";
        $continue = true;
        if ($id) {
            $ginfo = model("Goods")->getOneList(['condition' => ['id' => $id]]);
            $title = "编辑商品";
            $continue = false;
        }
        if (request()->isPost()) {
            $gt_id          = (int)$this->_post("gt_id");
            $goods_name     = $this->_post("goods_name");
            $goods_price    = (float)$this->_post("goods_price");
            $goods_count    = (int)$this->_post("goods_count");
            $goods_img      = $this->_post("goods_img");
            $is_grounding   = (int)$this->_post("is_grounding");

            try{
                $data       = [
                    'gt_id'         => $gt_id,
                    'goods_name'    => $goods_name,
                    'goods_count'   => $goods_count,
                    'goods_price'   => $goods_price,
                    'goods_img'     => $goods_img,
                    'is_grounding'  => $is_grounding,
                    'addtime'       => time(),
                ];
                if($id){
                    model("goods")->where("id={$id}")->update($data);
                }else{
                    model("goods")->insert($data);
                }
            }catch (\Exception $e) {
                model("ExpLog")->addLog("{$title}，原数据：".json_encode($ginfo), $e);
                $this->error("{$title}失败！");
            }
            $this->success("{$title}成功！");
        }

        //商品类型
        $gtypes = model("GoodsType")->getGoodsTypeList();
        $builder= new builder();
        $form   = $builder->setTitle($title)
                        ->setPostUrl(url('g_edit', 'id='.$id))
                        ->addSelectItem(['name'=>'gt_id','title'=>'商品类型','options' => $gtypes])
                        ->addTextItem(['name' => 'goods_name', 'title' => '商品名称', 'require' => true])
                        ->addNumberItem(['name' => 'goods_count','title' => '商品数量'])
                        ->addNumberItem(['name' => 'goods_price','title' => '商品价格'])
                        ->addPictureItem(['name' => 'goods_img','title' => '商品图片', 'multiple' => 8])
                        ->addRadioItem(['name' => 'is_grounding','title' => '是否上架', 'options' => ['否','是']])
                        ->setFormData($ginfo)
                        ->setContinue($continue)
                        ->display();
        $this->assign($form);
        return $this->fetch("common/builder");
    }

    /**
     * 商品删除
     * @param string $id 商品id
     *
     * @Author   LWY
     * @DateTime 2020-03-17 15:22
     */
    public function g_delete($id = '') {
        $this->help_delete(2);
    }

    /**
     * 商品分类列表
     *
     *
     * @Author   LWY
     * @DateTime 2020-03-17 15:51
     */
    public function gtype()
    {
        $gt_name    = $this->_get("gt_name");

        $condition  = ['is_delete' => 1];
        if (!empty($gt_name)) {
           $condition['gt_name'] = ['like', "%{$gt_name}%"];
        }
        $datas = model("GoodsType")->getPageData(['condition' => $condition]);
        $lister     = new lister();
        $form       = $lister->setTitle("商品分类列表")
                            ->addTopButton(['title' => '增加', 'controller' => 'Goods', 'action' => 'gt_edit', 'power' => 1])
                            ->addTextSearch(['title' => '类别名称', 'name' => 'gt_name'])
                            ->addGetUrl(url('gtype'))
                            ->addTableColumn(['title' => '分类名称','name'=>'gt_name'])
                            ->addTableColumn(['title' => '添加时间','name'=>'addtime', 'type' => 'time'])
                            ->addRightButton(['title' => '编辑', 'power' => 1, 'controller'=>'Goods', 'action' => 'gt_edit', 'param-id'])
                            ->addRightButton(['title' => '删除', 'power' => 1, 'controller'=>'Goods', 'action' => 'gt_delete', 'param-id', 'ajax-post confirm'])
                            ->setDataList($datas['datas'])
                            ->setDataPage($datas['pageHtml'])
                            ->display(1);
        $this->assign('getdata', $this->_get());
        return $this->fetch("common/list", $form);
    }

    /**
     * 编辑或添加分类
     *
     * @param string $id 分类id
     *
     * @Author   LWY
     * @DateTime 2020-03-17 16:00
     */
    public function gt_edit($id = '')
    {
        $ginfo      = [];
        $title      = "增加商品分类";
        $continue   = true;
        if ($id) {
            $ginfo = model("GoodsType")->getOneList(['condition' => ['id' => $id]]);
            $title = "编辑商品分类";
            $continue = false;
        }
        if (request()->isPost()) {
            $gt_name     = $this->_post("gt_name");

            try{
                $data       = [
                    'gt_name'   => $gt_name,
                    'addtime'   => time()
                ];
                if($id){
                    model("GoodsType")->where("id={$id}")->update($data);
                }else{
                    model("GoodsType")->insert($data);
                }
            }catch (\Exception $e) {
                model("ExpLog")->addLog("{$title}，原数据：".json_encode($ginfo)."，新数据".json_encode($data), $e);
                $this->error("{$title}失败！");
            }
            $this->success("{$title}成功！");
        }

        $builder= new builder();
        $form   = $builder->setTitle($title)
                        ->setPostUrl(url('gt_edit', 'id='.$id))
                        ->addTextItem(['name' => 'gt_name', 'title' => '商品名称', 'require' => true])
                        ->setFormData($ginfo)
                        ->setContinue($continue)
                        ->display();
        return $this->fetch("common/builder", $form);
    }

    /**
     * 用户购物车
     *
     *
     * @Author   LWY
     * @DateTime 2020-03-20 15:59
     */
    public function goods_cart()
    {
        $username   = $this->_get("username");
        $gname      = $this->_get("gname");
        $gtid       = $this->_get("gtid");


        $condition  = ['a.is_delete' => 1];
        if ($username) {
            $condition['b.user_username|b.user_surename'] = ['like', "%{$username}%"];
        }
        if ($gname) {
            $condition['c.goods_name']  = ['like', "%{$gname}%"];
        }
        if ($gtid) {
            $condition['c.gt_id']       = $gtid;
        }
        //商品分类
        $gtypes     = model("GoodsType")->getGoodsTypeList();
        $cstatus    = ['1'=>'正常','2'=>'已支付','3'=>'已删除'];
        $datas = model("GoodsCart")->getPageData([
            'condition' => $condition,
            'field'     => "a.id,b.user_username,b.user_surename,a.gcount,a.addtime,a.status,c.gt_id,c.goods_name,c.goods_count,c.goods_price"
        ]);
        $lister     = new lister();
        $form       = $lister->setTitle("购物车列表")
                        ->addTextSearch(['title' => '用户账号或名称', 'name' => 'username'])
                        ->addTextSearch(['title' => '商品名称', 'name' => 'g_name'])
                        ->addSelectSearch(['title' => '商品分类', 'name' => 'gtid', 'options' => $gtypes])
                        ->addGetUrl(url('goods_cart'))
                        ->addTableColumn(['title' => '用户账号','name'=>'user_username'])
                        ->addTableColumn(['title' => '用户名称','name'=>'user_surename'])
                        ->addSelectColumn(['title' => '商品分类','name'=>'gt_id', 'options' => $gtypes])
                        ->addTableColumn(['title' => '商品名称','name'=>'goods_name'])
                        ->addTableColumn(['title' => '库存','name'=>'goods_count'])
                        ->addTableColumn(['title' => '购物车数量','name'=>'gcount'])
                        ->addTableColumn(['title' => '价格','name'=>'goods_price'])
                        ->addSelectColumn(['title' => '购物车状态','name'=>'status', 'options' => $cstatus])
                        ->addTableColumn(['title' => '添加时间','name'=>'addtime', 'type' => 'time'])
                        ->addRightButton(['title' => '删除', 'power' => 1, 'controller'=>'Goods', 'action' => 'cart_delete', 'param-id', 'ajax-post confirm'])
                        ->setDataList($datas['datas'])
                        ->setDataPage($datas['pageHtml'])
                        ->display();
        $this->assign('getdata', $this->_get());
        return $this->fetch("common/list", $form);
    }
    /**
     * 删除分类
     *
     * @param string $id 分类id
     *
     * @Author   LWY
     * @DateTime 2020-03-17 16:09
     */
    public function gt_delete($id = '')
    {
        $this->help_delete(2, 'GoodsType');
    }

    /**
     * 删除购物车
     *
     * @param string $id
     *
     * @Author   LWY
     * @DateTime 2020-03-17 16:09
     */
    public function cart_delete($id = '')
    {
        $this->help_delete(2, 'GoodsCart');
    }
}
