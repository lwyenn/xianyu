<?php
/**
*
* +------------------------------------------------------------+
* @category System.php
* +------------------------------------------------------------+
* 系统配置模型
* +------------------------------------------------------------+
*
* @author lwy
* Created on 2019年8月19日 11:00:00
*/
namespace app\common\model;

class System extends Common 
{
	
	/**
	 * [submitdata description]
	 * @access
	 * @Author    LWY
	 * @DateTime  2019-08-19T11:57:00+0800
	 * @param     string  $type  [description]
	 * @return    [type]  [description]
	 */
	public function submitdata($type = 'base'){
		$config = $_POST['config'];
		$condition = [];
		if (empty($config)) {
			$res = $this->where($condition)->delete();
			if (false !== $res){
				return true;
			}
			return false;
		}
		try{
			foreach ($config as $identy => $value){
				if (empty($identy)) continue;
				$condition['type']   = $type;
				$condition['identy'] = $identy;
				$set = [];
				$set['attvalue'] = $value;
				$set['type'] 	 = $type;
				//如果对应值存在，则更新；不存在，则插入
				$mcount = $this->getCount(['condition' => $condition]);
				if ($mcount > 0){
					$con = $this->resetCondition($condition);
					$this->where($con)->update($set);
				}else{
					$set['identy'] 	= $identy;
					$set['type'] 	= $type;
					$this->insert($set);
				}
			}
		} catch (\Exception $e){
			dump($e->getMessage());
		}
		
		return true;
	}
	/**
	 * [getValue 获取配置信息]
	 * @access public
	 * @Author   LWY
	 * @DateTime 2019-08-19T11:49:33+0800
	 * @param    string $type 类型
	 * @return   array
	 */
	public function getValue($type = '')
	{
		$condition = [];
		if(!empty($type)){
			$condition['type']   = $type;
		}
		$datas = $this->getAllList(['condition' => $condition]);
		$tmp = [];
		if ($datas) {
			foreach ($datas as $vo){
				$tmp[$vo['identy']] = $vo['attvalue'];
			}
		}
		return $tmp;
	}
}

?>