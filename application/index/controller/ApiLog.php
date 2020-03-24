<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category ApiLog
 * +------------------------------------------------------------+
 * 接口日志管理
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

class ApiLog extends Common
{
	/**
	 * 接口日志
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
		if(!empty($getdata['api_url'])){
			$where['api_url'] 	= ['like','%'.trim($_REQUEST['api_url']).'%'];
		}
		if(!empty($getdata['api_param'])){
			$where['api_param'] 	= ['like','%'.trim($_REQUEST['api_param']).'%'];
		}
		if(!empty($getdata['api_res'])){
		    $where['api_res'] 	= ['like','%'.trim($_REQUEST['api_res']).'%'];
		}
        if(!empty($getdata['api_userip'])){
            $where['api_userip'] 	= ['like','%'.trim($_REQUEST['api_userip']).'%'];
        }
		$model = model('ApiLog');
		$datas = $model->getPageData([
			'condition' => $where,
			'order'		=> 'id DESC'
		]);

		foreach ($datas['datas'] as $key => &$value) {

			if (!empty($getdata['api_url'])) {
				$value['api_url'] = str_replace($getdata['api_url'], "<font color='red'>".$getdata['api_url']."</font>", $value['api_url']);
			}
			if (!empty($getdata['api_param'])) {
				$value['api_param'] = str_replace($getdata['api_param'], "<font color='red'>".$getdata['api_param']."</font>", $value['api_param']);
			}
            if (!empty($getdata['api_res'])) {
                $value['api_res'] = str_replace($getdata['api_res'], "<font color='red'>".$getdata['api_res']."</font>", $value['api_res']);
            }
            if (!empty($getdata['api_userip'])) {
                $value['api_userip'] = str_replace($getdata['api_userip'], "<font color='red'>".$getdata['api_userip']."</font>", $value['api_userip']);
            }

		}

		$lister     = new lister();
        $form       = $lister->setTitle("接口日志记录")
                            ->addTextSearch(['title' => '链接关键字', 'name' => 'api_url'])
                            ->addTextSearch(['title' => '参数关键字', 'name' => 'api_param'])
                            ->addTextSearch(['title' => '结果关键字', 'name' => 'api_res'])
                            ->addTextSearch(['title' => '用户IP', 'name' => 'api_userip'])
                            ->addGetUrl(url('index'))
                            ->addTableColumn(['title' => '请求方式','name'=>'api_ajax'])
                            ->addTableColumn(['title' => '链接','name'=>'api_url'])
                            ->addTableColumn(['title' => '参数','name'=>'api_param'])
                            ->addTableColumn(['title' => '结果','name'=>'api_res'])
                            ->addTableColumn(['title' => '用户ip','name'=>'api_userip'])
                            ->addTableColumn(['title' => '时间','name'=>'api_addtime','type'=>'time'])
                            ->setPager($datas)
                            ->display();

		$this->assign("getdata",$getdata);
        return $this->fetch("common/list", $form);
	}

}
