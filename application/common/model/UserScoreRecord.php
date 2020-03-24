<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category UserScoreRecord
 * +------------------------------------------------------------+
 * 用户余额记录模型
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

class UserScoreRecord extends Common
{
    /**
     * 获取记录列表
     *
     * @param array $param
     *
     * @Author   LWY
     * @DateTime 2020-03-19 11:48
     */
    public function getPageData($param = [])
    {
        $con    = empty($param['condition']) ? [] : $param['condition'];
        $con    = $this->resetCondition($con);
        $field  = empty($param['field']) ? '*' : $param['field'];
        $order  = empty($param['order']) ? 'a.id desc' : $param['order'];
        $sql    = empty($param['sqls']) ? '(1=1)' : $param['sqls'];

        $data   = $this->alias("a")
                        ->leftJoin("xy_user b","a.uid=b.id")
                        ->field($field)
                        ->where($con)
                        ->where($sql)
                        ->order($order)
                        ->paginate();

        $pageHtml = $data->render();
        return [
            'datas'     => $data->toArray()['data'],
            'pageHtml'  => $pageHtml,
            'total'     => $data->total()
        ];
    }
}
?>