<?php
/**
 *
 * +------------------------------------------------------------+
 * @category Ad
 * +------------------------------------------------------------+
 * 广告
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
 * @title 广告列表
 * @description 广告列表
 */
class Ad extends Common
{
    /**
     * @title 广告列表
     * @description 广告列表
     * @author lwy
     * @url /api.php/Ad/alist
     * @method GET
     *
     *
     * @param name:ad_desc type:string desc:广告描述
     *
     * @return list:返回广告列表@
     * @list ad_img:图片地址 ad_url:轮播图片跳转地址 ad_target:跳转方式 ad_desc:轮播图描述
     */
    public function alist()
    {
        $ad_desc    = $this->_get("ad_desc");
        $condition  = [
            'is_delete' => 1,
            'is_show'   => 1,
        ];
        if ($ad_desc) {
            $condition['ad_desc'] = ['like', "%{$ad_desc}%"];
        }
        $curtime    = time();
        $sqls       = "(((ad_stime is null or ad_stime=0) and ad_etime > {$curtime}) or ad_stime < {$curtime})";

        $res        = model("Ad")->getAllList(['condition' => $condition, 'field' => 'ad_img, ad_url, ad_target, ad_desc','sqls' => $sqls])->toArray();
        $FileModel  = model("File");
        foreach ($res as &$vo) {
            if ($vo['ad_img']) {
                $vo['ad_img'] = $FileModel->getRootPath($vo['ad_img'], 'string');
            }
        }

        $this->_success("获取成功", ['list' => $res]);
    }
}