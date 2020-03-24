<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category GoodsCart
 * +------------------------------------------------------------+
 * 购物车
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

class GoodsCart extends Common
{
    /**
     * 获取用户购物车列表
     *
     * @param array $param 条件
     * @param int $page_num 数量
     *
     * @Author   LWY
     * @DateTime 2020-03-20 14:07
     */
    public function getPageData($param = [], $page_num='')
    {
        $con    = empty($param['condition']) ? [] : $param['condition'];
        $con    = $this->resetCondition($con);
        $field  = empty($param['field']) ? '*' : $param['field'];
        $order  = empty($param['order']) ? 'a.id desc' : $param['order'];
        $sql    = empty($param['sqls']) ? '(1=1)' : $param['sqls'];

        $data   = $this->alias("a")
                    ->leftJoin("xy_user b", "a.uid=b.id")
                    ->leftJoin("xy_goods c", "a.gid=c.id")
                    ->field($field)
                    ->order($order)
                    ->where($con)
                    ->where($sql)
                    ->paginate($page_num);

        $pageHtml = $data->render();
        return [
            'datas'     => $data->toArray()['data'],
            'pageHtml'  => $pageHtml,
            'total'     => $data->total()
        ];
    }
}
?>