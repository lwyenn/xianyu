<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category Admin
 * +------------------------------------------------------------+
 * 客户模型
 * +------------------------------------------------------------+
 *
 * @version 1.0
 *
 * Modified at : 2019年8月19日 15:58:10
 * @author lwy
 *
 */
namespace app\common\model;

class Admin extends Common {
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
	    $admin = $this->getOneList(['condition' => ['admin_username' => $username,'admin_status' => 1], 'field' => 'id,group_id,admin_username,admin_style,admin_password']);

	    $data  = [];
	    if(!empty($admin)){
	        if($admin['admin_password'] == encrypt_pwd($password)){
	            $data = [
	                'admin_id'         => $admin['id'],
	                'admin_username'   => $admin['admin_username'],
	                'group_id'         => $admin['group_id'],
	                'admin_style'      => $admin['admin_style']
	            ];
	            $this->where("id=".$admin['id'])->update(['admin_last_login_time'=>time()]);
	        }
	    }

	    return $data;
	}
}

?>
