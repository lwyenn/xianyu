<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category Passport.class.php
 * +------------------------------------------------------------+
 * 登录入口文件
 * +------------------------------------------------------------+
 *
 * @author lwy
 * @copyright kkcrm
 * Created on 2019-8-19 11:36:34
 */

namespace app\index\controller;

use app\index\controller\Common;
use think\Exception;
use think\captcha\Captcha;

class Passport extends Common
{

	/**
	 * [login 登陆页面]
	 * @access
	 * @Author    LWY
	 * @DateTime  2019-08-19T11:59:48+0800
	 * @return   
	 */
	public function login()
	{
		try{
			//用户已登录则直接跳转到用户中心
			$referer = cookie('referer_url');
			$url = $referer ? $referer : url('Goods/glist');
			//用户id已存在
			if ($this->_admin_id > 0){
				cookie('referer_url', false);
				request()->isAjax() ? $this->success('登录成功', $url) : redirect($url);
				exit;
			}
			$this->assign("login_error", session('login_error'));
			if (request()->isPost()){
				$username = $this->_post('username', '用户名不能为空');
				$password = $this->_post('password', '登录密码不能为空');
				$verify = strtolower($this->_post('verify'));//验证码
				
				//登录出错，必须有验证码
				if(session('login_error') == '1'){
					if (empty($verify)) {
						$this->error('验证码不能为空');
					}
					if (!captcha_check($verify)){
						$this->error('验证码错误');
					}
				}

			    $data = model('Admin')->login($username, $password);

			    if($data){
			        session('admin_id',       $data['admin_id']);
			        session('group_id',       $data['group_id']);
			        session('admin_username', $data['admin_username']);
			        
			        session('login_error', '0');//登录成功
			        cookie('referer_url', false);
			        $this->success('登录成功', $url);
			    }else{
			        session('login_error', '1');//登录错误
		        	$this->error("账号或密码错误！");
			    }

			}
			return $this->fetch();
		} catch(Exception $e) {
			if($this->isDebug){
                $msg = $e->getMessage();
            }else{
                $msg = '';
            }
            $this->error($this->errorMsg, $msg);
		}
	}
	
	/**
	 * 生成验证码
	 */
	public function verify()
	{
		$config = [
             // 验证码字体大小
            'fontSize' 	=> 18,
            // 验证码位数
            'length' 	=> 4,
            // 关闭验证码杂点
            'useNoise' 	=> false,
            // 验证码图片高度
            'imageH'   	=> 40,
            // 验证码图片宽度
            'imageW'   	=> 125,
            // 验证码过期时间（s）
            'expire'   	=> 1800,
        ];
        $captcha = new Captcha($config);
        ob_clean();
        return $captcha->entry();
	}
	
	/*
	 * 注销登录
	 */
	public function logout(){
		session(null);
		$this->success('您已安全退出后台管理系统', url('Passport/login'));
	}
}
