<?php
/**
 *
 * +------------------------------------------------------------+
 * @category Login
 * +------------------------------------------------------------+
 * 登录模型
 * +------------------------------------------------------------+
 *
 * @copyright
 * @version 1.0
 *
 * Modified at :
 * @author lwy
 *
 */
namespace app\api\controller;

/**
 * @title 前端登录
 * @description 前端用户登录
 */
class Login extends Common
{
    /**
     * @title 登录接口
     * @description 用于前端用户登录
     * @author lwy
     * @url /api.php/login/index
     * @method POST
     *
     *
     * @param name:username type:string require:1 desc:用户账号
     * @param name:userpass type:string require:1 desc:用户密码
     *
     * @return user_username:用户账号
     * @return user_surename:用户名称
     */
    public function index()
    {
        $user_username  = $this->_post("username");
        $userpass       = $this->_post("userpass");
        if (empty($user_username) || empty($userpass)) {
            $this->_error("参数不为空！");
        }
        $res = model("User")->login($user_username, $userpass);
        if ($res == 0) {
            $this->_error("账号或密码错误！");
        } elseif ($res == 4) {
            $this->_error("账号已被禁用！");
        }
        $this->_success("登录成功", $res);
    }
}