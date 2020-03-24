<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category Log
 * +------------------------------------------------------------+
 * 日志模型
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

class Log extends Common
{
	
	/**
	 * 写入日志信息
     * type 0 登陆后的记录  1营销记录
	 */
	public function write($descript='')
	{

		//请求方式
		if (isset($_SERVER['HTTP_X_REQUESTED_WITH'])) {
			$method = strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest' ? 'ajax' : '';
		} else {
			$method = isset($_SERVER['REQUEST_METHOD']) ? strtolower($_SERVER['REQUEST_METHOD']) : '';
		}
		if(request()->controller() != 'Log' && !empty($_SESSION["think"]['admin_id'])){
			if(request()->controller() == 'Index'){
				$descript = '点击位置 进入首页';
			}
			$data['admin_id'] 	         = (int) $_SESSION["think"]['admin_id'];
			$data['log_http_type']       = $method;				
			$data['log_module_name']     = request()->controller();		
			$data['log_action_name']     = request()->action();		
			$data['log_content']         = $descript;
			$data['log_action_user']     = $_SESSION["think"]['admin_username'];
			$data['log_action_url']      = $_SERVER['PHP_SELF'];		
			$data['log_action_time']     = time();
			$data['log_action_ip']       = get_client_ip();
			$this->insert($data);
		}
	}
}
?>