<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category User
 * +------------------------------------------------------------+
 * 会员模型
 * +------------------------------------------------------------+
 *
 * @version 1.0
 *
 * Modified at : 2019年8月19日 15:58:10
 * @author lwy
 *
 */
namespace app\common\model;

class User extends Common {
	/**
	 * 登陆
	 * 
	 * @access public
	 * @Author   LWY
	 * @DateTime 2019-10-18T15:01:28+0800
	 * @param string $username
	 * @param string $password
	 * @return   
	 */
	public function login($username='', $password='')
	{
	    $user = $this->getOneList(['condition' => ['user_username' => $username], 'field' => 'id,user_username,user_surename,user_password,user_status']);

	    $data  = 0;
	    if(!empty($user)){
            if ($user['user_status'] != 1) {
                return 4;
            }
	        if($user['user_password'] == encrypt_pwd($password)){
	            $data = [
	                'user_username'    => $user['user_username'],
	                'user_surename'    => $user['user_surename'],
	            ];
	            $this->where("id=".$user['id'])->update(['user_last_login_time'=>time()]);
	        }
	    }

	    return $data;
	}
}

?>
