<?php
/**
 *
 * +------------------------------------------------------------+
 * @category Goods
 * +------------------------------------------------------------+
 * 商品
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

use Carbon\Carbon;

/**
 * @title 商品
 * @description 商品列表
 */
class Goods extends Common
{
    /**
     * @title 商品
     * @description 用于前端商品展示
     * @author lwy
     * @url /api.php/goods/glist
     * @method GET
     *
     *
     * @param name:goods_name type:string desc:商品名称
     * @param name:goods_type type:int desc:商品分类
     * @param name:page_num type:int desc:每页条数
     * @param name:page type:int desc:当前页
     *
     * @return datas:数据列表@
     * @datas goods_name:商品名称 goods_price:商品价格 goods_count:商品库存 goods_img:商品图片@!
     * @goods_img 2:图片地址 3:图片地址
     */
    public function glist()
    {
        $goods_name = $this->_get("goods_name");
        $goods_type = $this->_get("goods_type");
        $page_num   = $this->_get("page_num");

        $condition = ['is_delete' => 1, 'is_grounding' => 1];
        if ($goods_name) {
            $condition['goods_name']    = ['like', "%{$goods_name}%"];
        }
        if ($goods_type) {
            $condition['gt_id']         = $goods_type;
        }
        $data = model("Goods")->getApiPageData([
            'condition' => $condition,
            'field'     => "goods_name,goods_price,goods_count,goods_img,addtime"
        ], $page_num);
        $FileModel =  model("File");
        foreach ($data['datas'] as &$vo) {
            if (!empty($vo['goods_img'])) {
                $vo['goods_img']    = $FileModel->getRootPath($vo['goods_img']);
            }
            $vo['addtime']          = Carbon::createFromTimestamp($vo['addtime'])->toDateTimeString();
        }
        $this->_success("获取成功", $data);
    }
}