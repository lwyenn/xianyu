<?php
/**
 *
 * +------------------------------------------------------------+
 * @category Common.php
 * +------------------------------------------------------------+
 * 公共模型
 * +------------------------------------------------------------+
 *
 * @author lwy
 * Created on 2019年7月31日 17:00:00
 */

namespace app\common\model;

use think\Model;

class Common extends Model
{
    /**
     * 获取所有满足条件的数据
     *
     * @access public
     * @param $param 条件 ['condition' => , 'field' => , 'order' => , 'limit' => ]
     * @return array
     */
    public function getAllList($param = [])
    {
        $con    = empty($param['condition']) ? [] : $param['condition'];
        $con    = $this->resetCondition($con);
        $field  = empty($param['field']) ? '*' : $param['field'];
        $order  = empty($param['order']) ? 'id desc' : $param['order'];
        $limit  = empty($param['limit']) ? '' : $param['limit'];
        $group  = empty($param['group']) ? 'id' : $param['group'];
        $sql    = empty($param['sqls']) ? '(1=1)' : $param['sqls'];
        if(!empty($limit)){
            $data = $this->field($field)->where($con)->where($sql)->order($order)->group($group)->limit($limit)->select();
        }else{
            $data = $this->field($field)->where($con)->where($sql)->order($order)->group($group)->select();
        }
        return $data;
    }
    /**
     * 获取分页信息
     * 
     * @access public
     * @Author   LWY
     * @DateTime 2019-08-20T15:48:48+0800
     * @param    array $param 条件
     * @return   array
     */
    public function getPageData($param = [])
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
                      ->paginate();
        $pageHtml = $data->render();
        return [
            'datas'     => $data->toArray()['data'],
            'pageHtml'  => $pageHtml,
            'total'     => $data->total()
        ];                
    }
    /**
     * 获取所有满足条件的单一数据
     *
     * @access public
     * @param $param 条件 ['condition' => , 'field' => , 'order' => ]
     * @return array
     */
    public function getOneList($param = [])
    {
        $con    = empty($param['condition']) ? [] : $param['condition'];
        $con    = $this->resetCondition($con);
        $field  = empty($param['field']) ? '*' : $param['field'];
        $order  = empty($param['order']) ? 'id desc' : $param['order'];
        $sql    = empty($param['sqls']) ? '(1=1)' : $param['sqls'];
        $data   = $this->field($field)->where($con)->where($sql)->order($order)->find();
        return empty($data) ? [] : $data->toArray();
    }

    /**
     * 获取满足条件下的数量
     *
     * @access public
     * @param array $param
     * @return int|mixed
     */
    public function getCount($param = [])
    {
        $con    = empty($param['condition']) ? [] : $param['condition'];
        $con    = $this->resetCondition($con);
        $field  = empty($param['field']) ? 'id' : $param['field'];
        $sql    = empty($param['sqls']) ? '(1=1)' : $param['sqls'];
        $count  = $this->where($con)->where($sql)->value("COUNT({$field})");
        return $count ? $count : 0;
    }
    /**
     * 获取某个字段值
     *
     * @access  public
     * @param string $field 字段名
     * @param array $condition 条件
     * @param bool $bool 是否多个值
     * @param string $idx 索引值
     * @return mixed
     */
    public function getFieldByCondition($field = '', $condition = [], $bool = false, $idx = '')
    {
        $condition = $this->resetCondition($condition);
        if($bool) {
            if ($idx) return $this->where($condition)->column($field, $idx);
            return $this->where($condition)->column($field);
        }
        return $this->where($condition)->value($field);
    }
    /**
     * 重装数组条件
     * 
     * @access protected
     * @Author   LWY
     * @DateTime 2019-08-20T11:55:55+0800
     * @param    array $condition 条件
     * @return   array
     */
    protected function resetCondition($condition = [])
    {
        if(empty($condition)) return [];
        $new_condition = [];
        if(array_keys($condition) !== range(0, count($condition) - 1)){
            foreach ($condition as $key => $value) {
                if(is_array($value)){
                    $key = is_numeric($key) ? '' : $key;
                    $new_condition[] = [$key, $value['0'], $value['1']];
                }else{
                    $new_condition[] = [$key, '=', $value];
                }
            }
            return $new_condition;
        }
        return $condition;
    }
    /**
     * 更新数据
     * 
     * @access public
     * @Author   LWY
     * @DateTime 2019-08-27T17:41:06+0800
     * @param    array $condition [description]
     * @param    array $save [description]
     * @return   [type] [description]
     */
    public function whereSave($condition = [], $save = [])
    {
        $con    = $this->resetCondition($condition);
        try{
            $this->where($con)->update($save);
        } catch (Exception $e) {
            $msg = $e->getMessage();
            // 记录日志
            model("Log")->write("更新数据表".$this->table."错误：".$msg."，条件：".json_encode($con)."，更新信息：".json_encode($save));
            return false;
        }
        return true;
    }
}
