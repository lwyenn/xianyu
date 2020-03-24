<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category Attachment 
 * +------------------------------------------------------------+
 * 附件管理
 * +------------------------------------------------------------+
 *
 * @author lwy
 * @copyright http://www.kk30.com 2018
 * @version 1.0
 *
 * Modified at : 2019-09-05 18:44:44
 *
 */
namespace app\index\controller;

use upload\UploadFile;
use think\facade\Env;

class Attachment extends Common
{
	/**
	 * [$_extArr 定义允许上传的文件扩展名]
	 * @var array
	 */
	private $_extArr = array(
		'image'	 => array('gif', 'jpg', 'jpeg', 'png', 'bmp'),
		'flash'	 => array('swf', 'flv'),
		'video'	 => array('flv'),
		'voice'	 => array('mp3', 'wav', 'wma', 'wmv', 'mid'),
		'file'	 => array('doc', 'docx', 'xls', 'xlsx', 'ppt', 'htm', 'html', 'txt', 'zip', 'rar', 'gz', 'bz2'),
	);
	
	/**
	 * [$_pathArr 根据类型设置默认保存路径]
	 * @var array
	 */
	private $_pathArr = array(
		'ReplyFocusOnNews'	=> '/upload/ReplyFocus/',
		'ReplyNoKeyword'	=> '/upload/ReplyNoKeyword/',
		'Kindeditor'		=> '/upload/Kindeditor/',
		'ShopGood'			=> '/upload/ShopGood/',
		'ShopSlide'			=> '/upload/ShopSlide/',
		'default'			=> '/upload/',
		'SingleNews'		=> '/upload/Material/SingleNews/',			//单图文
		'MultiNews'			=> '/upload/Material/MultiNews/',			//多图文
		'Pic'				=> '/upload/Material/Pic/',					//图片
		'Voice'				=> '/upload/Material/Voice/',				//语音
		'CompanyImage'		=> '/upload/Company/',						//公司
		'SaleImage'			=> '/upload/Sale/',							//销售渠道
	);
	
	/**
	 * 判断是否有登陆
	 * 
	 * @access public
	 * @Author   LWY
	 * @DateTime 2019-10-22T13:48:10+0800
	 */
	public function __construct()
	{
		parent::__construct();

	}
	
	/**
	 * KINDEDITOR编辑器上传
	 * 
	 * @access public
	 * @Author   LWY
	 * @DateTime 2019-10-23T10:47:32+0800
	 * @return   string
	 */
	public function kindeditorUpload()
	{
		if (count($_FILES) > 0){
			
			$from		 = $this->_GET('from');
			$fileType	 = $this->_GET('file_type');

			$fileExts = isset($this->_extArr[$fileType]) ? $this->_extArr[$fileType] : $this->_extArr['file'];
			
			$path = (isset($this->_pathArr[$from]) ? $this->_pathArr[$from] : $this->_pathArr['default']). $this->_admin_id .'/';
			$savePath = Env::get('root_path') . '/public/'. $path;
			@mkdirs($savePath);
			
			$Upload = new UploadFile('', $fileExts, '', $savePath, 'time');
			//文件上传成功后将信息保存到数据库中
			if ($Upload->upload($savePath)){
				$saveinfo = $Upload->getUploadFileInfo();
				$data = array(
					'file_path'  => $path.$saveinfo[0]['savename']
				);
				echo json_encode(array('error' => 0, 'url' => $data['file_path']));
				exit;
			}else{
				echo json_encode(array('error' => 1, 'message' => $Upload->getErrorMsg()));
				exit;
			}
		}else{
			echo json_encode(array('error' => 1, 'message' => '没有选择任何文件'));
			exit;
		}
	}
	
	/**
	 * KINDEDITOR编辑器上传
	 * 
	 * @access public
	 * @Author   LWY
	 * @DateTime 2019-10-23T10:47:56+0800
	 * @return   string
	 */
	public function kindeditorFileManage()
	{
		$path = $this->_pathArr['Kindeditor']. $this->_user_id .'/';
		$savePath = Env::get('root_path') .'/'. $path;
		
		$current_path = $savePath;
		$current_url = '/'. $path;
		$current_dir_path = '/'. $path;
		$moveup_dir_path = preg_replace('/(.*?)[^\/]+\/$/', '$1', $current_dir_path);
		
		//遍历目录取得文件信息
		$file_list = array();
		if ($handle = opendir($current_path)) {
			$i = 0;
			while (false !== ($filename = readdir($handle))) {
				if ($filename{0} == '.') continue;
				$file = $current_path . $filename;
				if (is_dir($file)) {
					$file_list[$i]['is_dir'] = true; //是否文件夹
					$file_list[$i]['has_file'] = (count(scandir($file)) > 2); //文件夹是否包含文件
					$file_list[$i]['filesize'] = 0; //文件大小
					$file_list[$i]['is_photo'] = false; //是否图片
					$file_list[$i]['filetype'] = ''; //文件类别，用扩展名判断
				} else {
					$file_list[$i]['is_dir'] = false;
					$file_list[$i]['has_file'] = false;
					$file_list[$i]['filesize'] = filesize($file);
					$file_list[$i]['dir_path'] = '';
					$file_ext = strtolower(pathinfo($file, PATHINFO_EXTENSION));
					$file_list[$i]['is_photo'] = in_array($file_ext, $this->_extArr['image']);
					$file_list[$i]['filetype'] = $file_ext;
				}
				$file_list[$i]['filename'] = $filename; //文件名，包含扩展名
				$file_list[$i]['datetime'] = date('Y-m-d H:i:s', filemtime($file)); //文件最后修改时间
				$i++;
			}
			closedir($handle);
		}
		
		usort($file_list, 'cmp_func');

		$result = array();
		//相对于根目录的上一级目录
		$result['moveup_dir_path'] = $moveup_dir_path;
		//相对于根目录的当前目录
		$result['current_dir_path'] = $current_dir_path;
		//当前目录的URL
		$result['current_url'] = $current_url;
		//文件数
		$result['total_count'] = count($file_list);
		//文件列表数组
		$result['file_list'] = $file_list;

		//输出JSON字符串
		echo json_encode($result);
	}
}
