<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category Common
 * +------------------------------------------------------------+
 * 后台公共类
 * +------------------------------------------------------------+
 *
 * @author lwy
 * @copyright http://www.kk30.com 2019
 * @version 1.0
 *
 * Modified at : 2019-08-19 14:42
 *
 */
namespace app\index\controller;

use think\Controller;
use think\response\Json;

class Common extends Controller
{
	/**
     * [$_title 当前页面标题]
     * @access private
     * @var null
     */
	private $_title	        = null;

    /**
     * [$_http_referer 前一个访问URL地址]
     * @access private
     * @var string
     */
    private $_http_referer  = '';

	/**
     * [$_admin_id 当前登陆用户的ID]
     * @access protected
     * @var integer
     */
	protected $_admin_id    = 0;
	
	/**
     * [$_surename 真实姓名]
     * @access protected
     * @var null
     */
	protected $_surename    = null;
	
	/**
     * [$_group_id 用户组ID]
     * @access protected
     * @var integer
     */
	protected $_group_id    = 0;
	
	/**
     * [$_resources 当前登录用户对后台可访问资源列表]
     * @access protected
     * @var null
     */
	protected $_resources   = null;

	/**
     * [$_admin 当前登录的用户信息]
     * @access protected
     * @var array
     */
    protected $_admin       = [];

    /**
     * [$_debug 是否显示数据库debug信息]
     * @access protected
     * @var boolean
     */
    protected $_debug       = true;

    /**
     * [$_table_pre 数据库表前缀]
     * @access protected
     * @var string
     */
    protected $_table_pre   = 'crm_';

    /**
     * 是否开启调试模式
     * @access protected
     * @var bool
     */
    protected $isDebug = true;

    /**
     * 数据格式
     * @access protected
     * @var bool
     */
    protected $format   = "json";

    /**
     * 接口获取成功提示
     * @access protected
     * @var string
     */
    protected $successMsg = '获取成功';

    /**
     * 接口获取失败提示
     * @access protected
     * @var string
     */
    protected $errorMsg = '获取失败';

    /**
     * 初始化
     * 
     * @access public
     * @Author   LWY
     * @DateTime 2019-10-23T10:50:26+0800
     * @return   
     */
	public function initialize() 
    {
		//载入配置
	    $configs = model('System')->getValue();
	    $this->_configs = $configs;
	    $this->assign("configs", $configs);
		
		if(isset($_GET['_URL_'])) unset($_GET['_URL_']);
		
		if ('passport' == strtolower(request()->controller())) return false;

        //检查登陆
        $admin_id = (int)session('admin_id');
        if ( !empty($admin_id) ) {         
            $this->_admin_id        = $admin_id;
            $this->_group_id        = session('group_id');
            $this->_username        = session('admin_username');
        }
        //主题

		//用户未登录则直接跳转到登录界面
        if ($admin_id <= 0){
            cookie('referer_url', request()->isAjax() ? url('Goods/glist') : $_SERVER['PHP_SELF']);
            request()->isAjax() ? $this->error('对不起，登录超时，请重新登录',url('Passport/login')) : $this->redirect(url('Passport/login'));
        }
        $this->assign("USER_SURENAME", $this->_surename ? $this->_surename : '');

        //获取当前用户可操作的权限列表
        if ($this->_resources === null){
            $this->_resources = model('Group')->getMenu($this->_group_id);
        }

        //验证对当前操作是否访问权限
        if(Acl::hasAcl(request()->controller(), request()->action(), $this->_resources) !== true){
            $this->error('对不起无权进行“'. Acl::$action_name .'”操作', url('Goods/glist'));
        }
        $this->assign('navlist', $this->_resources['topMenu']);
        $this->assign('childMenu', $this->_resources['childMenu']);
        $this->assign('curMenu', $this->_resources['curMenu']);
        if(isset($this->_resources['curMenu']['title'])){
            //记录日志
            $logdes = '点击位置 '.$this->_resources['curMenu']['title']."，相关参数".json_encode($this->_get());
            model("Log")->write($logdes);
        }
		unset($resources);
        $this->assign([
            'ACTION'         => request()->action(),
            'MODULE'         => request()->controller(),
            'group_id'       => $this->_group_id,
        ]);
        //页码设置 使用redis 系统必须支持
        $adminPageNum = redisGet("admin_page_num_".$this->_admin_id);
        if ($adminPageNum > 0) {
            config("paginate.list_rows", $adminPageNum);
        }
	}

    /**
     * 通用删除逻辑-帮助方法
     * 
     * @param int $type  1真实删除 2逻辑删除（
     * @param string $table
     * @param string $url
     * @param string $field 或者 ['is_delete' => 2, 'operate' => time()]
     */
    protected function help_delete($type = 1, $table = '', $url = '', $field = 'is_delete')
    {
        $id     = input('param.id', 0, 'int');
        $items  = input('post.item');

        if(!empty($items)){
            foreach ($items as $k=>$v){
                $items[$k] = (int)$v;
            }
        }else{
            $items = $id;
        }

        if(!empty($items)){
            $table = $table ? $table : request()->controller();
            $Model = db($table);
            $msg = '';
            try{
                if($type == 1) {
                    $Model->where('id', 'in', $items)->delete();
                }else{
                    if(is_array($field)){
                        $Model->where('id', 'in', $items)->update($field);
                    }else{
                        $Model->where('id', 'in', $items)->update([$field => 2]);
                    }
                }
            }catch (\Exception $e){
                model("ExpLog")->addLog("当前模块：{$table}，id：{$id}，执行删除", $e);
                $this->error("删除失败".$msg);
            }
            $this->success("删除成功", $url);
        }else{
            $this->error("非法操作");
        }
    }

    /**
     * GET数据获取
     *
     * @access protected
     * @param string $field 字段名称
     * @param string $msg 提示内容
     * @param int $code 状态码
     * @return string
     */
    protected function _get($field = '', $msg = '', $code = -1)
    {
        $value = input('param.'.$field);

        if (is_string($value)) $value = trim($value);

        if(empty($value) && !empty($msg)){
            $this->result('', $code, $msg, $this->format);
        }
        
        return $value;
    }
    
    /**
     * POST数据获取
     *
     * @access protected
     * @param string $field 字段名称
     * @param string $msg 提示内容
     * @param int $code 状态码
     * @return string
     */
    protected function _post($field = '', $msg = '', $code = -1)
    {
        $value = input('post.'.$field);

        if (is_string($value)) $value = trim($value);

        if(empty($value) && !empty($msg)){
            $this->result('', $code, $msg, $this->format);
        }
        
        return $value;
    }

    /**
     * request数据获取
     *
     * @access protected
     * @param string $field 字段名称
     * @param string $msg 提示内容
     * @param int $code 状态码
     * @return string
     */
    protected function _request($field = '', $msg = '', $code = -1)
    {
        $value = input('request.'.$field);

        if(empty($value) && !empty($msg)){
            $this->result('', $code, $msg, $this->format);
        }
        
        return $value;
    }

    /**
     * 批量勾选
     *
     * @author lwy
     * Modified at : 2019-05-31 14:02
     *
     */
    public function batchIds()
    {
        $id    = $this->_post("id");
        $type  = trim($this->_post("type"));
        $name  = trim($this->_post("name"));
        $style = trim($this->_post("style"));

        $res   = session($name);

        // 增加
        if ($type == 1) {
            if ($res) {
                $res_ids = json_decode($res, true);
                if (isset($style) && $style == 'str') {
                    $ids = explode(",", ltrim($id, ","));
                    foreach ($ids as $key => $vo) {
                        if (!in_array($vo, $res_ids)) {
                            array_push($res_ids, $vo);
                        }
                    }
                } else if (isset($style) && $style == 'key') {
                    $ids    = array_keys($res_ids);
                    foreach ($id as $key => $vo) {
                        if ($vo && !in_array($key, $ids)) {
                            $res_ids[$key] = $vo;
                        }
                    }
                } else {
                    if (!in_array($id, $res_ids)) {
                        array_push($res_ids, $id);
                    }
                }

                session($name, json_encode($res_ids));
            } else {
                $res_ids = array();
                if (isset($style) && $style == 'str') {
                    $ids = explode(",", ltrim($id, ","));
                    foreach ($ids as $key => $vo) {
                        array_push($res_ids, $vo);
                    }
                }else if (isset($style) && $style == 'key') {
                    foreach ($id as $key => $vo) {
                       if ($vo) $res_ids[$key] = $vo;
                    }
                } else {
                    array_push($res_ids, $id);
                }
                session($name, json_encode($res_ids));
            }
        }

        // 删除
        if ($type == 0) {
            if ($res) {
                $res_ids = json_decode($res, true);
                if (isset($style) && $style == 'str') {
                    $ids = explode(",", ltrim($id, ","));
                    foreach ($res_ids as $k=>$v) {
                        if (in_array($v,$ids)) {
                            unset($res_ids[$k]);
                        }
                    }

                }else if (isset($style) && $style == 'key') {
                    $ids    = array_keys($res_ids);
                    foreach ($id as $k => $vo) {
                        if ($vo && in_array($k, $ids)) {
                            unset($res_ids[$k]);
                        }
                    }
                } else {
                    foreach ($res_ids as $k=>$v) {
                        if ($v == $id) {
                            unset($res_ids[$k]);
                        }
                    }
                }
                if (isset($style) && $style == 'key') session($name, json_encode($res_ids));
                else session($name, json_encode(array_values($res_ids)));
            }
        }
    }
    /**
     * 取消勾选
     *
     * @author lwy
     * Modified at : 2019-05-31 14:01
     *
     * @param string $s_name 键名
     */
    public function offCheck($s_name = '')
    {
        $name   = $this->_post("name") ? $this->_post("name") : $s_name;


        if (empty($name)) return;

        if (is_array($name)) {
            foreach ($name as $key => $value) {
                $res = session($value);
                if ($res) {
                    session($value, null);
                }
            }
        } else {
            $name   = trim($name);
            $res    = session($name);
            if ($res) {
                session($name, null);
            }
        }
       
    }

    /**
     * 去除缓存键值
     * 
     * @access public
     * @Author   LWY
     * @DateTime 2019-10-15T10:58:03+0800
     * @return   
     */
    public function removeRedis()
    {
        $key = $this->_get("key");
        if (empty($key)) {
            $key = "admin_preparation_".$this->_admin_id;
        }
        unsetRedis($key);
    }

    /**
     * 设置每页条数
     * 
     * @access public
     * @Author   LWY
     * @DateTime 2019-10-24T09:51:10+0800
     */
    public function setPageNum()
    {
        $num = (int)$this->_post("num");
        if ($num > 0) {
            redisSet("admin_page_num_".$this->_admin_id, $num);
        }
    }

    /**
     * 设置开关
     *
     *
     * @Author   LWY
     * @DateTime 2020-03-17 16:48
     */
    public function set_switch()
    {
        if (request()->isPost()) {
            $model              = request()->controller();
            $field              = $this->_post("field");
            $id                 = (int)$this->_post("id");
            $switch_status      = (int)$this->_post("switch_status");
            try{
                model($model)->where("id={$id}")->update([$field => $switch_status]);
            } catch (\Exception $e){
                model("ExpLog")->addLog("当前模块：{$model}，id：{$id}，字段：{$field}，状态：{$switch_status}", $e);
            }
        }
    }
}