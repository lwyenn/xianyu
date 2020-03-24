<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category Upload 
 * +------------------------------------------------------------+
 * 文件上传类
 * +------------------------------------------------------------+
 *
 * @author gd
 * @copyright http://www.kkidc.com 2018
 * @version 2.0
 *
 * Modified at : 2019-03-06 10:42
 * 
 * 上传文件挂件，调用方式
 * {:Upload('Upload/image', array('id'=>'admin_image', 'name'=>'admin_image','value'=>$data['admin_image'],'path'=>'admin_image','ext'=>'img_ext'))}
 */
namespace app\index\controller;

use app\index\controller\Common;

class Upload extends Common {
    /**
     * [$_file_ext 扩展名]
     * @var [type]
     */
    private $_file_ext = [
        //图片扩展名
        'img_ext' => [
            'ext'       => '*.jpg;*.jpeg;*.png;*.gif;*.ico;',
            'ext_name'  => ['jpg','jpeg','png','gif','ico'],
        ],

        //xls,doc扩展名
        'excel_ext' => [
            'ext'       => '*.xls;*xlsx;*.doc;*.docx',
            'ext_name'  => ['xls','xlsx','doc','docx'],
        ],
        //
        'all_ext' => [
            'ext'       => '*.*',
            'ext_name'  => [],
        ],
    ];

    /**
     * [$_file_path 文件上传路径]
     * @var string
     */
    private $_file_path = 'upload/index/';
    
    /**
     * [$_config 上传控件初始化配置]
     * @var array
     */
    private $_config = array(
        'title'         => '',              //控件标题
        'ext'           => 'img_ext',       //文件扩展名，对应$_file_ext中的键值
        'action_name'   => 'image',         //方法名
        'win'           => 1,               //是否显示上传文件弹出框
        'path'          => 'image',         //文件上传路径
        'id'            => 'image_id',      //表单域id
        'name'          => 'image_id',      //表单域变量名
        'multi'         => false,           //是否允许同时上传多个文件
    );
    
    /**
     * [$_firstTime 第一次上传]
     * @var boolean
     */
    private $_firstTime = false;

    /**
     * 运行上传组件
     * 
     * @param null $params
     * @return mixed
     */
    public function run($params = null)
    {
        $data   = extend(input('get.'), input('param.'));
        $params = extend($params, $data);
        $win    = isset($params['win']) ? $params['win'] : 0;

        //是否显示上传控件
        if ($win){
            $this->assign([
                'show_control'  => true,//显示上传图片框
                'controller_id' => 'uploadify-'.time(),//控制器id
            ]);
        }
        
        //用户配置和组件默认配置信息进行合并
        $this->_config = extend($this->_config, $params);
        $this->_config['id'] = str_replace(array('[', ']', '\'', '"'), '_', $this->_config['name']);

        if ($this->_firstTime == false){
            $this->_firstTime = true;
        }

        $this->assign([
            'first_time'    => $this->_firstTime,
        ]);

        $action_name = $params['action_name'];

        if($action_name == 'history'){
            return $this->$action_name($this->_config);
        }else{
            return $this->upload($action_name);
        }

    }

    /**
     * 上传文件处理
     * 
     * @access public
     * @Author   LWY
     * @DateTime 2019-10-23T11:20:42+0800
     * @return   
     */
    public function index()
    {
        if (count($_FILES) > 0){
            $ext = input('param.ext');

            $msg = '';
            $status = 2;
            $savepath = format_dir($this->_config['path'].'/'.date('Ym').'/');

            $upload = new \upload\UploadFile();

            $upload->savePath = $this->_file_path.$savepath;

            if($ext == 'img_ext'){
                $upload->allowExts = $this->_file_ext['img_ext']['ext_name'];
            }else if ($ext == 'excel_ext') {
                $upload->allowExts = $this->_file_ext['excel_ext']['ext_name'];
            }else {
                $upload->allowExts = $this->_file_ext['all_ext']['ext_name'];
            }

            //文件上传成功后将信息保存到数据库中
            if ($upload->upload()){
                $saveinfo = $upload->getUploadFileInfo();

                if(!empty($saveinfo)){
                    $data = [
                        'name'       => $saveinfo[0]['name'],//原始文件名
                        'file_name'  => $saveinfo[0]['savename'],//保存文件名
                        'file_size'  => $saveinfo[0]['size'],//文件名大小
                        'file_ext'   => $saveinfo[0]['extension'],//文件扩展名
                        'save_path'  => $saveinfo[0]['savepath'],//保存文件目录
                        'file_path'  => $saveinfo[0]['savepath'].$saveinfo[0]['savename'],//保存文件路径
                        'root_path'  => '/'.$saveinfo[0]['savepath'].$saveinfo[0]['savename'],//保存文件根目录
                        'upload_time'=> time(),//上传时间
                        'action_user'=> $this->_surename,//操作人
                        'file_system'=> 2,//操作系统
                    ];

                    try {
                        $id = db('File')->insert($data, false, true);
                        $isimg = in_array($data['file_ext'], $this->_file_ext['img_ext']['ext_name']) ? 1 : 0;//是否为图片
                        $msg = [
                            'id'    => $id,
                            'path'  => $data['root_path'],//图片根目录
                            'image' => $isimg,//是否为图片
                            'pos'   => $isimg ? getPos($data['file_path']) : 0,//获取图片位置
                        ];
                        $status = 1;
                    }catch (\Exception $e){
                        $msg = "数据插入失败，请重新上传".$e->getMessage();

                    }

                }else{
                    $msg = "系统出错，上传文件失败";
                }
            }else{
                $msg = $upload->getErrorMsg();
            }
        }else{
            $msg = "没有选择任何文件";
        }

        return json(["info"=>$msg,"url"=>"","status"=>$status]);
    }

    /**
     * 获取文件
     * 
     * @access private
     * @Author   LWY
     * @DateTime 2019-10-23T11:22:16+0800
     * @param    string $file_id 文件id
     * @param    integer $width 宽度
     * @param    integer $height 高度
     * @return   
     */
    private function _getFile($file_id = '', $width=100, $height=100)
    {
        if (empty($file_id)) return;
        if ($file_id){
            $datas = $model = db('File')->whereIn('id',$file_id)->field('id,name,file_ext,file_path,root_path')->select();
            if ($datas){
                foreach ($datas as $key=>$vo){
                    $datas[$key]['path'] = $vo['root_path'];
                    if (in_array($vo['file_ext'], $this->_file_ext['img_ext']['ext_name'])){
                        $datas[$key]['is_image'] = 1;
                        $datas[$key]['pos'] = getPos($vo['file_path']);
                    }else{
                        $datas[$key]['is_image'] = 0;
                    }
                }
            }
            return $datas;
        }
    }
    
}