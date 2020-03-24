<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category Ad
 * +------------------------------------------------------------+
 * 广告模型
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

class Ad extends Common
{
    /**
     * @var array 广告状态
     */
    protected $ad_status = [
        '0' => "<font color='#deb887'>还未开始</font>",
        '1' => "<font color='#333333'>正在进行</font>",
        '2' => "<font color='red'>已过期</font>",
    ];
    /**
     * 广告有效期判断
     *
     * @param $arr 广告信息
     *
     * @Author   LWY
     * @DateTime 2020-03-18 10:25
     */
    public function getAdStatus($arr)
    {
        $curtime = time();
        if (!empty($arr['ad_stime']) && empty($arr['ad_etime'])) {
            if ($arr['ad_stime'] > $curtime) {
                $ret = 0;
            } else {
                $ret = 1;
            }
        }
        if (empty($arr['ad_stime']) && !empty($arr['ad_etime'])) {
            if ($arr['ad_etime'] >= $curtime) {
                $ret = 1;
            } else {
                $ret = 2;
            }
        }
        if (empty($arr['ad_stime']) && empty($arr['ad_etime'])) {
            $ret = 1;
        }
        if (!empty($arr['ad_stime']) && !empty($arr['ad_etime'])) {
            if ($arr['ad_stime'] >= $curtime) {
                $ret = 0;
            } else if ($arr['ad_etime'] >= $curtime) {
                $ret = 1;
            } else {
                $ret = 2;
            }
        }
        return $this->ad_status[$ret];
    }

    /**
     * 获取广告有效期
     *
     * @param $arr 广告信息
     *
     * @Author   LWY
     * @DateTime 2020-03-18 10:51
     */
    public function getAdExpire($arr)
    {
        if (!empty($arr['ad_stime']) && empty($arr['ad_etime'])) {
            return date('Y-m-d', $arr['ad_stime'])." - 无";
        }
        if (empty($arr['ad_stime']) && !empty($arr['ad_etime'])) {
            return "无 - ".date('Y-m-d', $arr['ad_etime']);
        }
        if (empty($arr['ad_stime']) && empty($arr['ad_etime'])) {
            return '-';
        }
        if (!empty($arr['ad_stime']) && !empty($arr['ad_etime'])) {
            return date('Y-m-d', $arr['ad_stime'])."-".date('Y-m-d', $arr['ad_etime']);
        }
    }
}
?>