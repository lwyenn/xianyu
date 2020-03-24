<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category GoodsType
 * +------------------------------------------------------------+
 * 商品分类模型
 * +------------------------------------------------------------+
 *
 * @copyright
 * @version 1.0
 *
 * Modified at :
 * @author lwy
 *
 */
namespace app\common\model;

class GoodsType extends Common
{
    /**
     * 获取商品分类
     *
     * @param bool $bool 是否只选择未删除的分类
     *
     * @Author   LWY
     * @DateTime 2020-03-17 14:23
     */
    public function getGoodsTypeList($bool = false)
    {
        if ($bool) return $this->getFieldByCondition('gt_name', ['is_delete' => 1], true, 'id');
        return $this->getFieldByCondition('gt_name', [], true, 'id');
    }
}
?>