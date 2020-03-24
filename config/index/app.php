<?php
/**
 * @filename app.php
 * @author gd
 * @version 1.0
 * @copyright http://www.kk30.com
 *
 * Modified at : 2018-07-15 15:48
 * 
 * 如果有设置 就会覆盖全局配置-配置文件
 * 
 */
return [
	"version" 		=> "1.1.0",
	"report_show" 	=> 1, //是否显示报表
	'dispatch_success_tmpl'  => Env::get('app_path') . 'index/view/common/msgbox.html',
	'dispatch_error_tmpl'    => Env::get('app_path') . 'index/view/common/msgbox.html',
];