<?php
/**
 *
 * +------------------------------------------------------------+
 * @category Login
 * +------------------------------------------------------------+
 * 公共
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

use think\Controller;
use think\exception\HttpResponseException;
use think\Response;

class Common extends Controller
{
    protected $api_param    = '';
    protected $api_res      = '';
    protected $is_log       = true;
    /**
     * Common constructor.
     */
    public function __construct()
    {
        if (isset($_SERVER['HTTP_X_REQUESTED_WITH'])) {
            $method = strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest' ? 'ajax' : '';
        } else {
            $method = isset($_SERVER['REQUEST_METHOD']) ? strtolower($_SERVER['REQUEST_METHOD']) : '';
        }
        $this->api_param    = json_encode(input('request.'));

        $apikey = isset($_SERVER['HTTP_APIKEY']) ? $_SERVER['HTTP_APIKEY'] : '';

        //判断密钥
        $api_key    = model("System")->getValue();
        $key        = $api_key['APIKEY'];
        if ($apikey != $key) {
            $this->_error("密钥错误！");
            die;
        }
        //日志是否打开
        $this->is_log = model("System")->getFieldByCondition("attvalue", ['identy' => 'API_NOTE']);

        parent::__construct();
    }

    /**
    * GET数据获取
    *
    * @access protected
    * @param string $field 字段名称
    * @param string $msg 提示内容
    * @param int $code 状态码
    * @return string
    */
    protected function _get($field = '', $msg = '', $code = -1)
    {
        $value = input('param.'.$field);

        if (is_string($value)) $value = trim($value);

        if(empty($value) && !empty($msg)){
            $this->result('', $code, $msg, $this->format);
        }

        return $value;
    }

    /**
     * POST数据获取
     *
     * @access protected
     * @param string $field 字段名称
     * @param string $msg 提示内容
     * @param int $code 状态码
     * @return string
     */
    protected function _post($field = '', $msg = '', $code = -1)
    {
        $value = input('post.'.$field);

        if (is_string($value)) $value = trim($value);

        if(empty($value) && !empty($msg)){
            $this->result('', $code, $msg, $this->format);
        }

        return $value;
    }

    /**
     * request数据获取
     *
     * @access protected
     * @param string $field 字段名称
     * @param string $msg 提示内容
     * @param int $code 状态码
     * @return string
     */
    protected function _request($field = '', $msg = '', $code = -1)
    {
        $value = input('request.'.$field);
        if (is_string($value)) $value = trim($value);

        if(empty($value) && !empty($msg)){
            $this->result('', $code, $msg, $this->format);
        }

        return $value;
    }
    /**
     * 返回封装后的API数据到客户端
     * @access protected
     * @param  mixed     $data 要返回的数据
     * @param  integer   $code 返回的code
     * @param  mixed     $msg 提示信息
     * @param  string    $type 返回数据格式
     * @param  array     $header 发送的Header信息
     * @return void
     */
    protected function _error($msg = '', $data = [], $code = 400, $type = 'json', array $header = [])
    {
        $result = [
            'code' => $code,
            'msg'  => $msg,
            'data' => $data,
        ];
        $this->api_res .= $msg;

        $type     = $type ?: $this->getResponseType();
        $response = Response::create($result, $type)->header($header);

        throw new HttpResponseException($response);
    }

    /**
     * 返回封装后的API数据到客户端
     * @access protected
     * @param  mixed     $data 要返回的数据
     * @param  integer   $code 返回的code
     * @param  mixed     $msg 提示信息
     * @param  string    $type 返回数据格式
     * @param  array     $header 发送的Header信息
     * @return void
     */
    protected function _success($msg = '', $data = [], $code = 200,  $type = 'json', array $header = [])
    {
        $result = [
            'code' => $code,
            'msg'  => $msg,
            'data' => $data,
        ];
        $this->api_res .= $msg.'，返回数据：'.json_encode($data);

        $type     = $type ?: $this->getResponseType();
        $response = Response::create($result, $type)->header($header);

        throw new HttpResponseException($response);
    }

    /**
     * 类的摧毁
     */
    public function __destruct()
    {
        if ($this->is_log) {
            model("ApiLog")->addLog($this->api_param, $this->api_res);
        }
    }
}