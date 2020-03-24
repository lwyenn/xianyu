<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category Acl 
 * +------------------------------------------------------------+
 * 后台资源管理类
 * +------------------------------------------------------------+
 *
 * @author gd
 * @copyright http://www.kk30.com 2018
 * @version 1.0
 *
 * Modified at : 2018-07-05 18:44:44
 *
 */
namespace app\index\controller;

use think\Controller;

//当前登录用户是否为超级管理员
defined('IS_SUPER_LOGIN') ? '' : define('IS_SUPER_LOGIN', (int) session('login_utype') == 1);

class Acl extends Controller
{
	/**
	 * [$group_id 当前用户组id]
	 * @var null
	 */
    public static $group_id = null;
	
	/**
	 * [$_resources 系统资源列表]
	 * @var null
	 */
    private static $_resources = null;
	
	/**
	 * [$action_name 本次操作名]
	 * @var null
	 */
	public static $action_name = null;

	/**
	 * 
	 * +------------------------------------------------------------+
	 * @name createLink
	 * +------------------------------------------------------------+
	 * 创建一个超链接标签
	 * +------------------------------------------------------------+
	 * @example
	 *
	 * @param string $note 文字
	 * @param string $a 
	 * @param string $m
	 * @param mixed $params
	 * @param string $attr
	 * @param boolean $txt 无权限操作时是否显示文字描述
	 *
	 */
    public static function a($note, $a='', $m='', $params='', $attr='', $txt=false){
		if (!self::hasAcl($m, $a)) return $txt ? $note : null;
		$a = empty($a) ? request()->action() : $a;
		$m = empty($m) ? request()->controller() : $m;
		$url = url($m.'/'.$a, $params);
		$title = stripos($attr, 'title') !== false ? '' : ' title="'.strip_tags($note).'" ';
		$a = '<a'.$title.' href="'.$url.'" '.$attr.' >'.$note.'</a>';
		
		return $a;
	}

	/**
	 * 获取当前正在操作的资源名称
	 * 
	 * @access public
	 * @Author   LWY
	 * @DateTime 2019-10-22T13:43:02+0800
	 * @param    string $module 当前模块
	 * @param    string $action 当前操作
	 * @param    string $identy 
	 * @return   
	 */
    public static function getAction($module='', $action='', $identy=''){
		$module = strtolower(empty($module) ? request()->controller() : $module);
		$action = strtolower(empty($action) ? request()->action() : $action);
		$key = $module . (empty($identy) ? '' : '_'. $identy ) . '_' . $action;
		$resources = self::$_resources === null ? self::getAcl() : self::$_resources;
		return isset($resources['resource'][$key]) ? $resources['resource'][$key] : '';
	}
	
	/**
	 * 是否有权限
	 * 
	 * @param type 模块
	 * @param type 操作
	 * @return boolean true表示有操作权限，false表示没有操作权限
	 */
	 public static function hasAcl($module='', $action='', $p_resources=null){
		//超级管理员拥有对所有资源进行访问的权限
		if(IS_SUPER_LOGIN) return true;
		
		$module = (empty($module) ? request()->controller() : $module);
		$action = (empty($action) ? request()->action() : $action);
		
		if($p_resources !== null){
			self::$_resources = $p_resources;
		}
		$resources = self::$_resources;
		
		$key = $module . '_' . $action;
		if (isset($resources['resources'][$key])){
			self::$action_name = $resources['resources'][$key][0];
			return $resources['resources'][$key][1] == 1 ? true : false;
		}
		
		return true;
	}
}

?>