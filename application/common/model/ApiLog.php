<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category ApiLog
 * +------------------------------------------------------------+
 * 接口日记模型
 * +------------------------------------------------------------+
 *
 * @copyright
 * @version 1.0
 *
 * Modified at :
 * @author lwy
 *
 */
namespace app\common\model;

class ApiLog extends Common
{
    /**
     * 添加日志
     *
     * @param string $param 参数
     * @param string $res 结果
     * @param string $url 链接
     *
     * @Author   LWY
     * @DateTime 2020-03-18 15:55
     */
    public function addLog($param='', $res = '',$url = '')
    {
        if (isset($_SERVER['HTTP_X_REQUESTED_WITH'])) {
            $method = strtolower($_SERVER['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest' ? 'ajax' : '';
        } else {
            $method = isset($_SERVER['REQUEST_METHOD']) ? strtolower($_SERVER['REQUEST_METHOD']) : '';
        }

        $data = [];
        $data['api_ajax']       = $method;
        $data['api_url']        = $url?$url:request()->controller()."/".request()->action();
        $data['api_param']      = $param;
        $data['api_res']        = $res;
        $data['api_userip']     = get_client_ip();
        $data['api_addtime']    = time();
        $this->insert($data);
    }
}
?>