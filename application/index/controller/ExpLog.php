<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category ExpLog
 * +------------------------------------------------------------+
 * 异常日志管理
 * +------------------------------------------------------------+
 *
 * @author lwy
 * @copyright
 * @version 1.0
 *
 * Modified at : 2019-08-19 14:44:44
 *
 */
namespace app\index\controller;

use builder\builder;
use builder\lister;

class ExpLog extends Common
{
	/**
	 * 系统日志
	 * 
	 * @access public
	 * @Author   LWY
	 * @DateTime 2019-08-20T14:56:55+0800
	 * @param   $id string 操作人id
	 * @return   
	 */
    public function index()
    {
    	//默认数据库
        $where 		= [];
        $getdata    = $this->_get();
		if(!empty($getdata['keyword'])){
			$where['exp_desc'] 	= ['like','%'.trim($_REQUEST['keyword']).'%'];
		}
		if(!empty($getdata['url'])){
			$where['exp_url'] 	= ['like','%'.trim($_REQUEST['exp_url']).'%'];
		}
		if(!empty($getdata['ip'])){
		    $where['userip'] 	= ['like','%'.trim($_REQUEST['ip']).'%'];
		}		
		$model = model('ExpLog');
		$datas = $model->getPageData([
			'condition' => $where,
			'order'		=> 'id DESC'
		]);

		foreach ($datas['datas'] as $key => &$value) {
			if (!empty($getdata['keyword'])) {
				$value['exp_desc'] = str_replace($getdata['keyword'], "<font color='red'>".$getdata['keyword']."</font>", $value['exp_desc']);
			}
			if (!empty($getdata['url'])) {
				$value['exp_url'] = str_replace($getdata['url'], "<font color='red'>".$getdata['url']."</font>", $value['exp_url']);
			}
		}

		$lister     = new lister();
        $form       = $lister->setTitle("异常日志记录")
                            ->addTextSearch(['title' => '内容关键字', 'name' => 'keyword'])
                            ->addTextSearch(['title' => '链接关键字', 'name' => 'url'])
                            ->addTextSearch(['title' => '用户ip', 'name' => 'ip'])
                            ->addGetUrl(url('index'))

                            ->addTableColumn(['title' => '操作人','name'=>'admin_surename'])
                            ->addTableColumn(['title' => '描述','name'=>'exp_desc'])
                            ->addTableColumn(['title' => '链接','name'=>'exp_url'])
                            ->addTableColumn(['title' => '用户ip','name'=>'userip'])
                            ->addTableColumn(['title' => '时间','name'=>'addtime','type'=>'time'])
                            ->setPager($datas)
                            ->display();

		$this->assign("getdata",$getdata);
        return $this->fetch("common/list", $form);
	}

}
