<?php
/**
 *
 * +------------------------------------------------------------+
 * @category KkApi
 * +------------------------------------------------------------+
 * KkApi  快快接口
 * +------------------------------------------------------------+
 *
 * @author wqj
 * @copyright http://www.idc.com 2018
 * @version 1.0
 *
 * Created on 2019年9月04日
 */
namespace KkApi;

use http\http;

class KkApi{
    /**
     * 超时时间
     * @var int
     */
    private $TimeOut    = 30;

    /**
     * 请求参数
     * @var bool
     */
    private $isPost     = true;

    /**
     * 请求地址
     * @var string
     */
    private $url        = 'http://27.148.190.82:89/api.php/';

    // private $url = 'http://kkapi.kk30.com/api.php/';

    /**
     * 设置验证秘钥
     * @return array
     */
    private function setPassWord(){
        $configs = model('System')->getValue();
        return array('HTTP_API_AUTHKEY'=>substr(md5($configs['WEB_HTTP_API_AUTHKEY']),0,26));
    }
    /**
     * curl请求
     * 
     * @access protected
     * @Author   LWY
     * @DateTime 2019-10-12T14:06:58+0800
     * @param    array $parm 参数
     * @param    string $url 请求的链接
     * @return   string
     */
    public function curlRequest($parm = [], $url = '')
    {
        $list   = $this->setPassWord();
        $parms  = array_merge($list,$parm);

        $http   = new http();
        $http->isPost      = $this->isPost;
        $http->TimeOut     = $this->TimeOut;
        $http->PostData    = http_build_query($parms);

        $curl   = $this->url.$url;
        return $http->getdata($curl);
    }
    /**
     *  获取用户账单接口方法
     * @param  array $params
     * @return array|mixed
     *
     */
    public function get_user_account($params=[])
    {
        $result = $this->curlRequest($params, 'crm/get_user_account');
       
        $result_array      = json_decode($result,true);
        return $result_array['data'];
    }

    /**
     *  更新用户账单crm处理标识
     * @param array $params
     * @return mixed
     *
     */
    public function update_user_account($params=[])
    {
        $result = $this->curlRequest($params, 'crm/update_user_account');
   
        $result_array      = json_decode($result,true);
        return $result_array['data'];
    }
    /**
     * 获取华为用户信息 绑定及推荐
     * 
     * @access public
     * @Author   LWY
     * @DateTime 2019-09-07T10:11:46+0800
     * @param    array $param [description]
     * @return   [type] [description]
     */
    public function get_huawei_info($param = [])
    {
        $result = $this->curlRequest($param, 'crm/get_huawei_user');
       
        $result_array      = json_decode($result,true);
        return $result_array['data'];
    }

}
