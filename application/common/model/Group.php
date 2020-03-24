<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category Api
 * +------------------------------------------------------------+
 * 处理数据中心接口类
 * +------------------------------------------------------------+
 *
 * @copyright http://www.kk30.com 2018
 * @version 1.0
 *
 * Modified at : 2019年8月19日 15:58:10
 * @author lwy
 *
 */
namespace app\common\model;

class Group extends Common
{
    /**
     * 获取所有角色
     *
     *
     * @Author   LWY
     * @DateTime 2020-03-18 13:45
     */
	public function getAllGroup()
    {
        return $this->getFieldByCondition("group_name", [], true, 'id');
    }
	/**
	 * 获取顶部权限
	 * @param type $RoleID
	 * @return type
	 */
	public function getMenu($p_usgr_id) 
	{
		$menu		 = config("menu.");
		$topMenu	 = array();
		$childMenu	 = array();
		$curMenu	 = array();
		$resources	 = array();
		$fields	     = array();
		
		$group = self::get($p_usgr_id);
		if(empty($group)){
			return array(
				'topMenu'	 => $topMenu,
				'childMenu'	 => $childMenu,
				'curMenu'	 => $curMenu,
				'resources'  => $resources				
			);
		}
		$group['group_resources'] = json_decode($group['group_resources'], true);
		
		foreach ($menu as $m => $val) {
			if ( empty($val['m']) ) {
				$val['m'] = $m;
			}
			if ( empty($val['a']) ) {
				$val['a'] = 'index';
			}
			if ( !empty($val['hide']) ) {
				unset($menu[$m]);
				continue;
			}
			
			$menu[$m]['url'] = url($val['m'] . '/' . $val['a'], 'ch='. (isset($val['ch']) ? $val['ch'] : ''));
			
			//获得二级三级
			if (!empty($val['list']) ) {
				$check = false;
				foreach ($val['list'] as $ak => $av) {
					if ( empty($av['list']) ) {
						continue;
					}
					if ( empty($av['m']) ) {
						$av['m'] = $ak;
					}
					if ( empty($av['a']) ) {
						$av['a'] = 'index';
					}
					$menu[$m]['list'][$ak]['url'] = url($av['m'] . '/' . $av['a'], 'ch='. (isset($av['ch']) ? $av['ch'] : ''));
					
					foreach ($av['list'] as $bk => $bv) {
						if ( empty($bv['m']) ) {
							$bv['m'] = $ak;
						}
						if ( empty($bv['a']) ) {
							$bv['a'] = 'index';
						}
						
						$resources[$bv['m'].'_'.$bv['a']] = array($bv['title'], 1);
                        
						//非系统管理员
						if($group['group_type'] != 2){
    						if(!in_array(strtolower($bv['m'].'_'.$bv['a']), $group['group_resources'])){
    							unset($menu[$m]['list'][$ak]['list'][$bk]);
    							$resources[$bv['m'].'_'.$bv['a']][1] = 0;
    							continue;
    						}
						}
						
						$menu[$m]['list'][$ak]['list'][$bk]['url'] = url($bv['m'] . '/' . $bv['a'], 'ch='. (isset($bv['ch']) ? $bv['ch'] : ''));

						
						if ( request()->controller() == $bv['m'] && request()->action() == $bv['a'] && (empty($bv['ch']) || (!empty($bv['ch']) && $bv['ch'] == $_GET['ch'])) ) {
							$menu[$m]['current']							 = true;
							$menu[$m]['list'][$ak]['current']				 = true;
							$menu[$m]['list'][$ak]['list'][$bk]['current']	 = true;
							$curMenu = $menu[$m]['list'][$ak]['list'][$bk];
							$check = true;
						}elseif (!empty($bv['other'])) {
							foreach ($bv['other'] as $cv) {
								if ( request()->controller() == $bv['m'] && request()->action() == $cv && (empty($bv['ch']) || (!empty($bv['ch']) && $bv['ch'] == $_GET['ch'])) ) {
									$menu[$m]['current']							 = true;
									$menu[$m]['list'][$ak]['current']				 = true;
									$menu[$m]['list'][$ak]['list'][$bk]['current']	 = true;
									$curMenu = $menu[$m]['list'][$ak]['list'][$bk];
									$check = true;
								}
							}
						}

						if ( !empty($bv['hide']) ) {
							unset($menu[$m]['list'][$ak]['list'][$bk]);
							continue;
						}
					}
					if(empty($menu[$m]['list'][$ak]['list'])){
						unset($menu[$m]['list'][$ak]);
						continue;
					}
					$menu[$m]['list'][$ak]['url'] = $this->_get_first($menu[$m]['list'][$ak]['list']);
				}
				if(empty($menu[$m]['list'])){
					unset($menu[$m]);
					continue;
				}
				//一级目录
				$menu[$m]['url'] = $this->_get_first($menu[$m]['list']);
				$topMenu[$m] = $menu[$m];
				//二级
				if ( $check == true ) {
					$childMenu = $menu[$m]['list'];
				}
			}
		}
		return [
			'topMenu'	 => $topMenu,
			'childMenu'	 => $childMenu,
			'curMenu'	 => $curMenu,
			'resources'  => $resources,
		];
	}

	private function _get_first($p_data)
	{
		foreach($p_data as $val){
			return $val['url'];
		}
	}
}

?>