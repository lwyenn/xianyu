<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category Order
 * +------------------------------------------------------------+
 * 订单模型
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

class Order extends Common
{
    /**
     * 获取订单状态
     *
     *
     * @Author   LWY
     * @DateTime 2020-03-19 13:37
     */
    public function getOrderStatus($value)
    {
        $ostatus = config("logic.order_status");
        switch ($value) {
            case '0':
                return "<font color='#faebd7'>".$ostatus[$value]."</font>";
                break;
            case '1':
                return "<font color='#7fffd4'>".$ostatus[$value]."</font>";
                break;
            case '2':
                return "<font color='#7fff00'>".$ostatus[$value]."</font>";
                break;
            case '3':
                return "<font color='black'>".$ostatus[$value]."</font>";
                break;
            case '4':
                return "<font color='#a52a2a'>".$ostatus[$value]."</font>";
                break;
            case '5':
                return "<font color='black'>".$ostatus[$value]."</font>";
                break;
            case '6':
                return "<font color='black'>".$ostatus[$value]."</font>";
                break;
        }
    }

    /**
     * 获取订单分页
     *
     * @param array $param
     * @param int $page_num
     *
     * @Author   LWY
     * @DateTime 2020-03-19 13:48
     */
    public function getPageData($param = [], $page_num='')
    {
        $con    = empty($param['condition']) ? [] : $param['condition'];
        $con    = $this->resetCondition($con);
        $field  = empty($param['field']) ? '*' : $param['field'];
        $order  = empty($param['order']) ? 'a.id desc' : $param['order'];
        $sql    = empty($param['sqls']) ? '(1=1)' : $param['sqls'];

        $data   = $this->alias("a")
                    ->leftJoin("xy_goods b","a.goods_id = b.id")
                    ->leftJoin("xy_user c","a.uid = c.id")
                    ->field($field)
                    ->where($con)
                    ->where($sql)
                    ->order($order)
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