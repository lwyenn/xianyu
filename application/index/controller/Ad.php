<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category Ad
 * +------------------------------------------------------------+
 * 广告
 * +------------------------------------------------------------+
 *
 * @author lwy
 * @copyright
 * @version 1.0
 *
 * Modified at : 2018-07-05 18:44:44
 *
 */
namespace app\index\controller;

use builder\builder;
use builder\lister;

class Ad extends Common
{
    /**
     * 广告列表
     *
     *
     * @Author   LWY
     * @DateTime 2020-03-18 10:10
     */
    public function index()
    {
        $keywords       = $this->_get("keywords");
        $ad_time        = $this->_get("ad_time");

        $condition      = ['is_delete' => 1];
        if ($keywords) {
            $condition['ad_desc'] = ['like', "%{$keywords}%"];
        }
        $sqls = '';
        if ($ad_time) {
            $time_range = time_range_cut($ad_time);
            $st = strtotime($time_range['start_time']);
            $et = strtotime($time_range['end_time']);
            $sqls = "ad_stime < {$et} or ad_etime > {$st}";
        }

        $AdModel    = model("Ad");
        $datas      = $AdModel->getPageData(['condition' => $condition,'sqls' => $sqls, 'order' => 'ad_order desc,id desc']);

        foreach ($datas['datas'] as &$vo){
            $vo['ad_status'] = $AdModel->getAdStatus($vo);
            $vo['ad_time']   = $AdModel->getAdExpire($vo);
        }

        $lister     = new lister();
        $form       = $lister->setTitle("广告列表")
                            ->addTopButton(['title' => '增加', 'controller' => 'Ad', 'action' => 'edit', 'power' => 1])
                            ->addTextSearch(['title' => '广告描述', 'name' => 'keywords'])
                            ->addDateRangeSearch(['title' => '时间范围', 'name' => 'ad_time'])
                            ->addGetUrl(url('index'))
                            ->addTableColumn(['title' => '广告描述','name'=>'ad_desc'])
                            ->addTableColumn(['title' => '广告链接','name'=>'ad_url'])
                            ->addPictureColumn(['title' => '广告图片','name'=>'ad_img'])
                            ->addTableColumn(['title' => '状态','name'=>'ad_status'])
                            ->addTableColumn(['title' => '有效期','name'=>'ad_time'])
                            ->addSwitchColumn(['title' => '是否启用','name'=>'is_show'])
                            ->addTableColumn(['title' => '排序号','name'=>'ad_order'])
                            ->addTableColumn(['title' => '添加时间','name'=>'ad_addtime', 'type' => 'time'])
                            ->addRightButton(['title'=>'编辑','controller'=>'Ad','action'=>'edit','power'=>1,'param-id'])
                            ->addRightButton(['title'=>'删除','controller'=>'Ad','action'=>'delete','power'=>1,'param-id','ajax-post confirm'])
                            ->setDataList($datas['datas'])
                            ->setDataPage($datas['pageHtml'])
                            ->display();
        $this->assign('getdata', $this->_get());
        return $this->fetch("common/list", $form);
    }

    /**
     * 广告修改/新增
     *
     * @param string $id 广告id
     *
     * @Author   LWY
     * @DateTime 2020-03-18 10:10
     */
    public function edit($id='')
    {
        $ad_info  = [];
        $continue = true;// 是否继续添加
        $title    = "广告添加";
        if (!empty($id)) {
            $ad_info = model("Ad")->getOneList(['condition' => ['id' => $id]]);
            $continue = false;
            $title    = "广告编辑";
        }
        if (request()->isPost()) {
            $ad_desc    = $this->_post("ad_desc");
            $ad_url     = $this->_post("ad_url");
            $ad_img     = (int)$this->_post("ad_img");
            $ad_target  = $this->_post("ad_target");
            $is_show    = $this->_post("is_show");
            $ad_stime   = $this->_post("ad_stime");
            $ad_etime   = $this->_post("ad_etime");
            $ad_order   = (int)$this->_post("ad_order");

            if (empty($ad_img)) {
                $this->error("请上传图片！");
            }
            $r = 0;
            if (!empty($ad_stime)) {
                $r++;
                $ad_stime = strtotime($ad_stime);
            }
            if (!empty($ad_etime)) {
                $r++;
                $ad_etime = strtotime($ad_etime." 23:59:59");
            }
            if ($r == 2) {
                if ($ad_stime > $ad_etime) {
                    $this->error("时间范围错误！");
                }
            }
            $is_show = $is_show == 'on' ? 1 : 2;

            try{
                $data = [
                    'ad_img'    => $ad_img,
                    'ad_url'    => $ad_url,
                    'ad_target' => $ad_target,
                    'ad_desc'   => $ad_desc,
                    'ad_stime'  => $ad_stime,
                    'ad_etime'  => $ad_etime,
                    'ad_addtime'=> time(),
                    'is_show'   => $is_show,
                    'ad_order'  => $ad_order
                ];
                if ($id) {
                    model("Ad")->where("id={$id}")->update($data);
                } else{
                    model("Ad")->insert($data);
                }
            } catch (\Exception $e) {
                model("ExpLog")->addLog("{$title}，原数据：".json_encode($ad_info)."，新数据：".json_encode($data), $e);
                $this->error("{$title}失败！");
            }
            $this->success("{$title}成功！");
        }
        $builder= new builder();
        $form   = $builder->setTitle($title)
                        ->setPostUrl(url('edit', 'id='.$id))
                        ->addTextItem(['name' => 'ad_desc', 'title' => '广告描述'])
                        ->addTextItem(['name' => 'ad_url', 'title' => '广告链接'])
                        ->addPictureItem(['name' => 'ad_img', 'title' => '广告图片', 'multiple' => '1'])
                        ->addRadioItem(['name' => 'ad_target', 'title' => '是否当前页打开','options' => [1 => '当前页',2 => '另起一页打开']])
                        ->addSwitchItem(['name' => 'is_show', 'title' => '是否启用'])
                        ->addDateItem(['name' => 'ad_stime', 'title' => '广告开始时间'])
                        ->addDateItem(['name' => 'ad_etime', 'title' => '广告结束时间'])
                        ->addNumberItem(['name' => 'ad_order', 'title' => '广告排序','tips'=>'越大越靠前'])
                        ->setFormData($ad_info)
                        ->setContinue($continue)
                        ->display();
        return $this->fetch("common/builder", $form);
    }

    /**
     * 删除广告
     *
     * @param string $id
     *
     * @Author   LWY
     * @DateTime 2020-03-18 13:33
     */
    public function delete($id = '')
    {
        $this->help_delete(2);
    }
}
