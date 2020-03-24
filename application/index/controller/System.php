<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category System 
 * +------------------------------------------------------------+
 * 系统设置
 * +------------------------------------------------------------+
 *
 * @author lwy
 * @copyright http://www.kk30.com 2018
 * @version 1.0
 *
 * Modified at : 2019-08-19 14:44:44
 *
 */
namespace app\index\controller;

use builder\builder;
use think\facade\Env;

class System extends Common
{
	/**
	 * 系统参数设置
	 * 
	 * @access public
	 * @Author   LWY
	 * @DateTime 2019-09-27T13:43:48+0800
	 * @param    string $type 参数类型
	 * @param    string $txt 标题
	 * @param    string $url 修改后跳转
	 * @return   
	 */
    public function index($type = 'base', $txt = '系统变量设置', $url = '')
    {	
    	$setting 	= config("setting.".$type);
    	$Model 		= model("System");
		$data 		= $Model->getValue($type);

    	if(request()->isPost()){
    		// 记录日志
			$descript = $txt.' '.json_encode($this->_post());
			model("Log")->write($descript);

		    $descript = $txt . '设置资料 : <br>';
		    $new_info = $this->_post('config');  //post数据
		    foreach ($data as $key => $value) {
		    	if($value != $new_info[$key]){
		    		$descript .= '【旧'.$setting[$key]['title'].'】: '.$value.' 【新'.$setting[$key]['title'].'】: '.$new_info[$key].'<br>';	
		    	}
		    }
		    model("Log")->write($descript);
			$status = $Model->submitdata($type);		
			if($status) $this->success('修改成功', !empty($url) ? $url : url("index"));
			$this->error("修改失败");
    	}
		$builder = new builder();

		foreach($setting as $key => $vo){
			$item = [
				'title' => $vo['title'],
				'name'	=> "config[".$key."]",
                'type'  => $vo['type']
			];
			$item['options'] = isset($vo['options']) ? $vo['options'] : '';
			if(isset($data[$key])){
				$item['value'] = $data[$key];
			}else{
				$item['value'] = isset($vo['default']) ? $vo['default'] : '';
			}

			switch ($vo['type']) {
				case 'time':
					$item['type'] = 'date';
					$builder->addFormItem($item);
					break;
				case 'password':
					$item['type'] = 'password';
					$builder->addFormItem($item);
					break;	
				case 'textarea':
					$item['type'] 	= 'textarea';
					$item['extra'] 	= 'rows="3" cols="10"';
					$builder->addFormItem($item);
					break;
                case 'picture':
                    $item['multiple'] = $vo['multiple'];
                    $item['images']   = model("File")->getRootPath($item['value']);
                default:
                    $builder->addFormItem($item);
                    break;
			}
		}
		$form = $builder->setTitle($txt)
						->setPostUrl(empty($url) ? url("index") : $url)
						->setContinue(false)
						->setExtraHtml('<div id="win-box" style="display: none;">当前页</div>')
						->display();

    	return $this->fetch("common/builder", $form);
	}
	/**
	 * 客户评分设置
	 * 
	 * @access public
	 * @Author   LWY
	 * @DateTime 2019-08-22T15:00:13+0800
	 */
	public function score()
	{
	   return $this->index("score", "修改客户评分", url("score"));
	}
	/**
	 * 客户星级设置
	 * 
	 * @access public
	 * @Author   LWY
	 * @DateTime 2019-08-22T15:25:34+0800
	 */
	public function star()
	{
	    return $this->index("star", "客户星级设置", url("star"));
	}
	/**
	 * 缓存管理
	 * 
	 * @access public
	 * @Author   LWY
	 * @DateTime 2019-08-22T17:27:14+0800
	 */
	public function memcache()
	{
	    return $this->fetch();
	}
	/**
	 * 删除文件缓存
	 * 
	 * @access public
	 * @Author   LWY
	 * @DateTime 2019-08-22T17:28:19+0800
	 */
	public function flush_file_cache()
	{
		//不删除其他人的总览数据，只删除管理者自己的
		@delDir(Env::get('root_path') . 'runtime/');
		$this->success('删除文件缓存成功！', url("memcache"));
	}
}
