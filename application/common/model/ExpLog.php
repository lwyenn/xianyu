<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category ExpLog
 * +------------------------------------------------------------+
 * 程序异常模型
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

class ExpLog extends Common
{
    /**
     * 添加日志
     *
     * @param string $desc 日志描述
     * @param string $exception 异常
     * @param string $url 链接
     *
     * @Author   LWY
     * @DateTime 2020-03-17 14:55
     */
    public function addLog($desc='', $exception = '',$url='')
    {
        $data = [];
        $data['admin_id']       = (int)session('admin_id')?:'api';
        $data['admin_surename'] = session('admin_username');
        if (!empty($exception)) {
            $desc .= "<br />".$exception->getMessage()."，文件：".$exception->getFile()."，错误位置：".$exception->getLine();
        }
        $data['exp_desc']       = $desc;
        $data['exp_url']        = $url?$url:request()->controller()."/".request()->action();
        $data['userip']         = get_client_ip();
        $data['addtime']        = time();
        $this->insert($data);
    }
}
?>