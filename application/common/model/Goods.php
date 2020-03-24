<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category Goods
 * +------------------------------------------------------------+
 * 商品模型
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

class Goods extends Common
{
    /**
     * 获取分页信息
     *
     * @access public
     * @Author   LWY
     * @DateTime 2019-08-20T15:48:48+0800
     * @param    array $param 条件
     * @param    int $page_num 每页条数
     * @return   array
     */
    public function getApiPageData($param = [], $page_num = '')
    {
        $con    = empty($param['condition']) ? [] : $param['condition'];
        $con    = $this->resetCondition($con);
        $field  = empty($param['field']) ? '*' : $param['field'];
        $order  = empty($param['order']) ? 'id desc' : $param['order'];
        $sql    = empty($param['sqls']) ? '(1=1)' : $param['sqls'];

        $data   = $this->field($field)
            ->where($con)
            ->where($sql)
            ->order($order)
            ->paginate($page_num);
        return [
            'datas'     => $data->toArray()['data'],
            'total'     => $data->total()
        ];
    }
}
?>