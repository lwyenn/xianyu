<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
/**
 * 获取客户端IP地址
 * @param integer $type 返回类型 0 返回IP地址 1 返回IPV4地址数字
 * @return mixed
 */
function get_client_ip($type = 0) {
    $type       =  $type ? 1 : 0;
    static $ip  =   NULL;
    if ($ip !== NULL) return $ip[$type];
    if (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
        $arr    =   explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
        $pos    =   array_search('unknown',$arr);
        if(false !== $pos) unset($arr[$pos]);
        $ip     =   trim($arr[0]);
    }elseif (isset($_SERVER['HTTP_CLIENT_IP'])) {
        $ip     =   $_SERVER['HTTP_CLIENT_IP'];
    }elseif (isset($_SERVER['REMOTE_ADDR'])) {
        $ip     =   $_SERVER['REMOTE_ADDR'];
    }
    // IP地址合法验证
    $long = sprintf("%u",ip2long($ip));
    $ip   = $long ? array($ip, $long) : array('0.0.0.0', 0);
    return $ip[$type];
}

//智能合并多个数组
function extend($arr){
    $args = func_get_args();
    $arr = array();
    if (!empty($args)){
        foreach ($args as $vo){
            $vo = is_array($vo) ? $vo : (empty($vo) ? array() : array($vo));
            $arr = array_merge($arr, $vo);
        }
    }

    if(!empty($arr)){
        foreach($arr as $k=>$v){
            $arr[$k] = $v;
        }
    }

    return $arr;
}

/**
 * 获取IP地址的归属地
 */
function get_local_ipaddress($ips){
    $ip = new \ip\Ip();
    $addr = $ip -> ip2addr($ips);
     
    return $addr;
}

/**
 * 加密方法
 *
 * @param String $p_string	要加密的字符串
 * @return String
 * @deprecated
 */
function encrypt_pwd($p_string)
{
    //TODO 为前端加密预留，可扩展
    $p_string = md5($p_string);
    return md5(crypt($p_string, substr($p_string, 0, 2)));
}

/**
 *
 * +------------------------------------------------------------+
 * @name format_dir
 * +------------------------------------------------------------+
 * 规划化路径名
 * +------------------------------------------------------------+
 *
 * @param string $pathname
 *
 */
function format_dir($pathname){
    if ($pathname){
        $pathname = str_replace(array('\\','/./', '/.//'), '/', $pathname . '/');
        $pathname = preg_replace('/\/{2,}/','/', $pathname);
        $pathname = preg_replace('/([^\/\.]+?)\.\/'.'/','\\1/', $pathname);
    }
    return $pathname;
}

function is_https() {
    if ( !empty($_SERVER['HTTPS']) && strtolower($_SERVER['HTTPS']) !== 'off') {
        return true;
    } elseif ( isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https' ) {
        return true;
    } elseif ( !empty($_SERVER['HTTP_FRONT_END_HTTPS']) && strtolower($_SERVER['HTTP_FRONT_END_HTTPS']) !== 'off') {
        return true;
    }
    return false;
}

/**
 * 获取基础域名
 */
function get_base_domain()
{
    $base_domain = $_SERVER['HTTP_HOST'];
    if(is_https()){
        $base_domain = "https://".$base_domain;
    }else{
        $base_domain = "http://".$base_domain;
    }
    return $base_domain;
}

/**
 * 生成随机码
 * @param $length
 */
function rand_num($length = 4, $number=false, $surstring='') {
    $chars = ($number ? '0123456789' : 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789') . $surstring;
    $password = '';
    for ( $i = 0; $i < $length; $i++ )
    {
        $password .= $chars[ mt_rand(0, strlen($chars) - 1) ];
    }
    return $password;
}
//只支持中文
function getNeedBetween($kw,$mark1,$mark2){
    $st =strpos($kw,$mark1);
    $ed =strpos($kw,$mark2);
    if(($st===false||$ed===false)||$st>=$ed)
        return '';
    $kw=substr($kw,($st+3),($ed-$st-3));
    return $kw;
}

/**
 * 获取图片的位置
 * @param $img
 * @param int $width
 * @param int $height
 * @return array|bool
 */
function getPos($img, $width=100, $height=100){
    if (!is_file($img))  return false;
    $survey = getimagesize($img);
    //图像文件不存在
    if (false === $survey) return false;
    $top = $left = 0;
    if ($survey[0] <= $width && $survey[1] <= $height){
        $w = $survey[0];
        $h = $survey[1];
    }elseif ($survey[0] <= $width && $survey[1] > $height){
        $h = $height;
        $w = $survey[0] * ($height / $survey[1]);
    }elseif ($survey[0] > $width && $survey[1] <= $height){
        $w = $width;
        $h = $survey[1] * ($width / $survey[0]);
    }else{
        $h = $survey[1] * ($width / $survey[0]);
        if ($h <= $height){
            $w = $survey[0] >= $width ? $width : $survey[0];
        }else{
            $h = $survey[1] >= $height ? $height : $survey[1];
            $w = $survey[0] * ($height / $survey[1]);
        }
    }

    $top = ($height - $h + 1 - 1) / 2;
    $left = ($width - $w + 1 - 1) / 2;

    return array(
        'width' => (int)$w,
        'height' => (int)$h,
        'left' => (int)$left,
        'top' => (int)$top
    );
}

/*
 * 获取指定日期所在月的开始日期与结束日期
 */
function getMonthRange($date){
    $ret=array();
    $timestamp=strtotime($date);
    $mdays=date('t',$timestamp);
    $ret['sdate']=date('Y-m-1 00:00:00',$timestamp);
    $ret['edate']=date('Y-m-'.$mdays.' 23:59:59',$timestamp);
    return $ret;
}
/**
 * 数组分组
 * 
 * @access
 * @Author   LWY
 * @DateTime 2019-08-21T15:53:02+0800
 * @param    array $arr 数组
 * @param    integer $n 个数
 * @return   array
 */
function arraySplit($arr = [], $n = 1){
    $len    = count($arr);
    $m      = ceil($len/$n);
    $result = [];
    for($i=0; $i<$m; $i++){
        $result[] = array_slice($arr, $i*$n, $n);
    }
    return $result;
}
/**
 *  当前客户是几颗星
 * 
 * @access
 * @Author   LWY
 * @DateTime 2019-08-21T17:30:19+0800
 * @param    int $score
 * @return   
 */
function client_star($score = 0)
{
    $config = model('System')->getValue('star');
    if($score >= $config['STAR_5']){
        $img = "<i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>";
    }elseif($score >= $config['STAR_4']){
        $img = "<i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>";
    }elseif($score >= $config['STAR_3']){
        $img = "<i class='fa fa-star'></i><i class='fa fa-star'></i><i class='fa fa-star'></i>";
    }elseif($score >= $config['STAR_2']){
        $img = "<i class='fa fa-star'></i><i class='fa fa-star'></i>";
    }elseif($score >= $config['STAR_1']){
        $img = "<i class='fa fa-star'></i>";
    }else{
        $img = '';
    }

    return $img;
}

/**
 * 左侧栏目菜单是否隐藏
 * 
 * @access
 * @Author   LWY
 * @DateTime 2019-08-22T14:55:48+0800
 * @param    string $mod 
 * @return   bool
 */
function left_menu_hidden($mod = ''){
    $is_show = true;
    if($mod == 'SystemLadder'){
        $is_show = false;
    }else if($mod == 'SystemWatersupply'){
        $is_show = false;
    }
    return $is_show;
}

/**
 * 日期下拉选择框
 * @param $value
 * @return array|mixed
 */
function select_date_type($value=''){
    $array = array();
    $array['1'] = '按日统计';
    $array['2'] = '按月统计';
    if ($value) return isset($array[$value])?$array[$value]:"未知";
    return $array;
}

/**
 * 统计模块获取时间选择
 * @param int $dateType
 * @param string $dateRange
 * @return array
 */
function select_time($dateType=1,$dateRange=''){
    if (empty($dateRange)){
        $time_array['0'] = $dateType==2?date('Y-m',strtotime("-12 month")):date('Y-m-d',strtotime("-15 day"));
        $time_array['1'] = $dateType==2?date('Y-m',time()):date('Y-m-d',time());
    }else{
        $time_array = explode(' - ',$dateRange);
    }
    if ($dateType==2){ //按月
        $start_time  = $time_array['0'].'-01'.' 00:00:00';
        $days        = date('t', strtotime($time_array['1']));
        $end_time    = $time_array['1'].'-'.$days.' 23:59:59';
    }else{ //按日
        $start_time = $time_array['0'].' 00:00:00';
        $end_time   = $time_array['1'].' 23:59:59';
    }
    return ['start_time'=>$start_time,'end_time'=>$end_time];
}

/**
 * 计算两个时间相差天数或月数
 * @param int $dateType
 * @param string $dateRange
 * @return array
 */
function time_differ_num($dateType=1,$dateRange=''){
    if (empty($dateRange)){
        $time_array['0'] = $dateType==2?date('Y-m',strtotime("-12 month")):date('Y-m-d',strtotime("-15 day"));
        $time_array['1'] = $dateType==2?date('Y-m',time()):date('Y-m-d',time());
    }else{
        $time_array = explode(' - ',$dateRange);
    }
    // 取时间差天数或月数
    if ($dateType == 2) {
        $date1 = explode('-',$time_array['0']);
        $date2 = explode('-',$time_array['1']);
        $differ_num =  abs($date1[0] - $date2[0]) * 12 + abs($date1[1] - $date2[1])+1;
    } else {
        $differ_num    = ((strtotime($time_array['1']) - strtotime($time_array['0']))  / 86400) + 1;
    }
    return ['start_time'=>$time_array['0'],'differ_num'=>$differ_num,'end_time'=>$time_array['1']];
}

/**
 * 时间循环计算
 * @param int $dateType 1年月日 2年月
 * @param string $startTime  开始时间
 * @return array
 */
function  time_cycle_key($dateType=1,$startTime){
    if ($dateType == 2) {
        $key = date("Y/m", $startTime);
        $start_time = strtotime(date("Y-m-d", $startTime) . ' 00:00:00');
        $end_time   = strtotime("+1 month -1 day", strtotime(date("Y-m-d", $startTime) . ' 23:59:59'));
        $plusTime   = strtotime("+1 day", strtotime(date("Y-m-d", $end_time)));  // 加一月
    } else{
        $key = date("n/j", $startTime);
        $start_time = strtotime(date("Y-m-d", $startTime) . ' 00:00:00');
        $end_time   = strtotime(date("Y-m-d", $startTime) . ' 23:59:59');
        $plusTime   = strtotime("+1 day", strtotime(date("Y-m-d", $startTime)));  //加一天
    }
    return ['key'=>$key,'start_time'=>date("Y-m-d H:i:s",$start_time),'end_time'=>date("Y-m-d H:i:s",$end_time),'plusTime'=>$plusTime];
}

/**
 * 获取数据相加记录最大值
 * @param array $data
 * @return mixed
 */
function get_sun_max($data){
    if (empty($data)){
       return 0;
    }
    $last_value  = $data['0'];
    $new_array[] = $data['0'];
    for ($i=1;$i<count($data);$i++){
        $new_array[$i] = $last_value+$data[$i];
        $last_value    = $last_value+$data[$i];
    }
    return max($new_array);
}


/**
 * 
 * +------------------------------------------------------------+
 * @name html_editor
 * +------------------------------------------------------------+
 * 调用副文本编辑器
 * +------------------------------------------------------------+
 *
 * @author anzai <sba3198178@126.com>
 * @version 1.0
 *
 * @example
 *
 * @param string    $p_fileType 要上传的文件类型[image|file|flash|media]
 * @param string    $p_name     内容ID
 * @param string    $p_value    默认内容
 * @param int       $p_width    宽度
 * @param int       $p_height   高度
 * @param string    $p_bar      编辑使用的控件序列[默认default]
 *
 */
function html_editor($p_fileType, $p_name='content', $p_value='', $p_width='97%', $p_height=220, $p_bar='default', $loaded=false){
    static $toolbar=null, $load=false, $idx=0;
    if ($toolbar === null){
        $toolbar = config("toolbar.");
    }
    $basePath = config("template.static_plugin") . '/kindeditor/';
    $jsvar = 'FORM_EDITORS['.$idx.']';
    $idx++;
    $item = isset($toolbar[$p_bar]) ? $toolbar[$p_bar] : $toolbar['default'];
    $html = '';
    if ($load === false && $loaded === false){
        $html = '<script charset="utf-8" src="'. $basePath .'kindeditor-min.js"></script>';
        $html .= '<script charset="utf-8" src="'. $basePath .'lang/zh_CN.js"></script>';
        $load = true;
    }

    $html .= '<textarea id="'.$p_name.'" name="'.$p_name.'" style="width:'.$p_width.';height:'.$p_height.'px;">'. $p_value .'</textarea>';
    $html .= '<script>if(!FORM_EDITORS){var FORM_EDITORS = [];}KindEditor.ready(function(K){'.$jsvar.' = K.create("#'.$p_name.'" ,{allowFileManager:true,fileManagerJson:"'. url('Attachment/kindeditorFileManage') .'",pasteType:1,items:'.$item.',uploadJson:"'. url('Attachment/kindeditorUpload', 'cprs=1&from=Kindeditor&file_type='. $p_fileType) .'", afterCreate : function(){this.sync();}, afterBlur:function(){this.sync();}});});</script>';
    return $html;
}

/**
 * 删除指定文件夹
 *
 * @param String $dir   真路径
 * @return boolean
 */
function delDir($p_dir)
{
    if(is_dir($p_dir)){
        $dh      = opendir($p_dir);
        while ($file     = readdir($dh)) {
            if ($file != "." && $file != "..") {
                $fullpath = $p_dir . "/" . $file;
                if (!is_dir($fullpath)) {
                    unlink($fullpath);
                } else {
                    delDir($fullpath);
                }
            }
        }
        closedir($dh);
        if (rmdir($p_dir)) {
            return true;
        } else {
            return false;
        }
    }else{
        return false;
    }
}
/**
 * 后台排序
 * @content 字段内容
 * @dfield 默认字段名称与数据库字段名一致
 * @type 默认排序类型 ASC DESC
 * @field 字段名是否是选中的
 */
function get_order($content, $dfield, $type = '', $field = '')
{
    $getParams = input('param.');
    $type   = isset($type) ? $type : $getParams["sort_type"];
    $field  = isset($field) ? $field : $getParams["field"];
    unset($getParams['page']);
    $param = extend($getParams,array('field'=>$dfield,'sort_type'=>$type));
    $url = url(request()->controller().'/'.request()->action())."?".http_build_query($param);
    if($dfield == $field){
        if(strtolower($type) == 'asc'){
            $title = $content."升序";
            $class = "order-asc";
            $i_tag = '<i class=" fa fa-sort-desc"></i>';
        }else{
            $title = $content."降序";
            $class = "order-desc";
            $i_tag = '<i class=" fa fa-sort-asc"></i>';
        }
    }else{
        $title = $content;
        $i_tag = '<i class="fa fa-sort"></i>';
    }
     
    $a = '<a href="'.$url.'" title="'.$title.'" class="" style="font-weight: bold;">'.$content." ".$i_tag.'</a>';
     
    return $a;
}

/**
 * 当前时间 年月日 时分
 * 
 * @access
 * @Author   LWY
 * @DateTime 2019-09-03T10:41:25+0800
 * @param    string $time [description]
 * @return  string
 */
function nowtime($time = '')
{
    $datetime = date('Y-m-d H:i',$time);
    return $datetime;
}
/**
 * 审核状态
 * 
 * @access
 * @Author   LWY
 * @DateTime 2019-09-03T10:52:42+0800
 * @param    [type] $status [description]
 * @return   
 */
function chooseStatus($status)
{
    if($status == -1){
        return "待审核";
    }elseif($status == 1){
        return "<span style='color:green;'>通过</span>";
    }else{
        return "<span style='color:red;'>不通过</span>";;
    }
}
if (!function_exists("isFirstArrayValue")) {
    /**
     * 判断是否是数组的第一个元素
     * 
     * @access
     * @Author   LWY
     * @DateTime 2019-09-07T12:51:10+0800
     * @param    int $key 索引值
     * @param    array $arr 数组
     * @return   boolean 
     */
    function isFirstArrayValue($key = '', $arr = []) 
    {
        $m = 0;
        foreach (array_filter($arr) as $k => $value) {
            if ($k == $key && $value) break;
            $m++;
        }
        if ($m == 0) return true;
        return false;
    }
}

if (!function_exists("file_write")) {
    /**
     * 文件写入函数
     * 
     * @param String $path 文件路径
     * @param String $content 文件内容
     */
    function file_write($fileName, $content, $wType = 'w+')
    {
        $fp = @fopen($fileName, $wType);
        if (!$fp) {
            return false;
        }
        if (flock($fp, LOCK_EX)) {
            fwrite($fp, $content, strlen($content));
            flock($fp, LOCK_UN);
            fclose($fp);
            return true;
        } else {
            return false;
        }
    }
}

if (!function_exists("extensionTime")) {
    /**
     * 获取延长到期时间
     * 
     * @param String $day 时间
     */
    function extensionTime($day)
    {
        $now = time();
        $endtime = $now+86400*$day;
        $endtime = date('Y-m-d H:i',$endtime);
        return $endtime;
    }
}
if (!function_exists("mkdirs")) {
    /**
     * 自动生成路径的目录
     * 
     * @param string $path  路径
     * @param string $mode  权限
     */
    function mkdirs($path, $mode = '0664')
    {
        $adir    = explode('/', $path);
        $dirlist = '';
        $rootdir = array_shift($adir);
        if (($rootdir != '.' || $rootdir != '..') && !file_exists($rootdir)) {
            @mkdir($rootdir);
        }
        foreach ($adir as $key => $val) {
            if ($val != '.' && $val != '..') {
                $dirlist .= "/" . $val;
                $dirpath = $rootdir . $dirlist;
                if (!file_exists($dirpath)) {
                    mkdir($dirpath);
                    chmod($dirpath, 0777);
                }
            }
        }
    }
}
if(!function_exists("download_rename")){
    /**
     * 下载文件
     * 
     * @access 
     * @Author   LWY
     * @DateTime 2019-09-13T13:56:26+0800
     * @param    string $filename 文件路径
     * @param    string $out_filename 输出文件名
     * @return   
     */
    function download_rename($filename,$out_filename){
        header('Accept-Ranges: bytes');
        header('Accept-Length: ' . filesize($filename));
        header('Content-Transfer-Encoding: binary');
        header('Content-type: application/octet-stream');
        header('Content-Disposition: attachment; filename=' . $out_filename);
        header('Content-Type: application/octet-stream; name=' . $out_filename);
        if(is_file($filename) && is_readable($filename)){
            $file = fopen($filename, "r");
            echo fread($file, filesize($filename));
            fclose($file);
        }
        exit;
    }
}

/**
 * 时间范围分割 没有默认当月起
 * @param string $dateRange
 * @return array
 */
function time_range_cut($dateRange)
{
    $time_array = explode(' - ',$dateRange);
    $start_time = !empty($time_array['0'])?$time_array['0']: '';
    $end_time   = !empty($time_array['1'])?$time_array['1']." 23:59:59": '';
    return ['start_time'=>$start_time,'end_time'=>$end_time];
}

if(!function_exists("time_range")){
    /**
     * 取最近几周 W 几月 M
     *
     * @author lwy
     * Modified at : 2019-06-12 15:56
     *
     * @param $n int
     * @return array
     *
     */
    function time_range($t = 'M',$n){
        $n = $n - 1;//包括本月
        if($t == 'M'){
            $stime = date("Y-m-01",strtotime("-$n month"));
            $etime = date("Y-m-d",strtotime("$stime +1 month -1 day"));
        }else{
            $now 		= time() - 7*24*60*60*$n;    //当时的时间戳
            $number 	= date("w",$now);  //当时是周几
            $number 	= $number == 0 ? 7 : $number; //如遇周末,将0换成7
            $diff_day 	= $number - 1; //求到周一差几天
            $stime 		= date("Y-m-d",$now - ($diff_day * 60 * 60 * 24));
            $etime 		= date("Y-m-d", strtotime($stime ." +6 day"))." 23:59:59";
        }
        return array(strtotime($stime),strtotime($etime));
    }
}

if (!function_exists("arr_to_group")) {
    /**
     * 数组分组
     *
     * @author lwy
     * Modified at : 2019-06-12 10:30
     *
     * @param $arr 数组
     * @param $n 几个一组
     */
    function arr_to_group($arr, $n)
    {
        $len 	= count($arr);
        $m 		= ceil($len/$n);
        $result = array();
        for($i = 0; $i < $m; $i++){
            $aa = array_slice($arr, $i*$n, $n);
            array_push($result, $aa);
        }
        return $result;
    }
}

if (!function_exists("merge_arr")) {
    /**
     * 合并数组，不改变索引值
     * 
     * @access
     * @Author   LWY
     * @DateTime 2019-09-23T10:26:26+0800
     * @param    array $arr1 数组1
     * @param    array $arr2 数组2
     * @return   array 
     */
    function merge_arr($arr1, $arr2) 
    {
        $result = [];
        foreach ($arr1 as $key => $value) {
            $result[$key] = $value;
            if (in_array($key, array_keys($arr2))) {
                $result[$key] = $arr2[$key];
            }
        }

        foreach ($arr2 as $k => $v) {
            if (!in_array($k, array_keys($result))) {
                $result[$k] = $v;
            }
        }
        return $result;
    }
}

if (!function_exists("ismobile")) {
    /**
     * 是否是手机设备
     * 
     * @access
     * @Author   LWY
     * @DateTime 2019-09-30T15:46:15+0800
     * @return   int/bool
     */
    function ismobile() {

        $user_agent = $_SERVER['HTTP_USER_AGENT'];
        //print_r($user_agent);
        if (strpos($user_agent, 'MicroMessenger') === false) {
            //return false;
        }else{
            return 2;
        }

        // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
        if (isset ($_SERVER['HTTP_X_WAP_PROFILE']))
            return true;
        
        //此条摘自TPM智能切换模板引擎，适合TPM开发
        if(isset ($_SERVER['HTTP_CLIENT']) &&'PhoneClient'==$_SERVER['HTTP_CLIENT'])
            return true;
        //如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
        if (isset ($_SERVER['HTTP_VIA']))
            //找不到为flase,否则为true
            return stristr($_SERVER['HTTP_VIA'], 'wap') ? true : false;
        //判断手机发送的客户端标志,兼容性有待提高
        if (isset ($_SERVER['HTTP_USER_AGENT'])) {
            $clientkeywords = array(
                'nokia','sony','ericsson','mot','samsung','htc','sgh','lg','sharp','sie-','philips','panasonic','alcatel','lenovo','iphone','ipod','blackberry','meizu','android','netfront','symbian','ucweb','windowsce','palm','operamini','operamobi','openwave','nexusone','cldc','midp','wap','mobile'
            );
            //从HTTP_USER_AGENT中查找手机浏览器的关键字
            if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {
                return true;
            }
        }
        //协议法，因为有可能不准确，放到最后判断
        if (isset ($_SERVER['HTTP_ACCEPT'])) {
            // 如果只支持wml并且不支持html那一定是移动设备
            // 如果支持wml和html但是wml在html之前则是移动设备
            if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html')))) {
                return true;
            }
        }
        return false;
    }
}

if (!function_exists("redisSet")) {
    /**
     * 设置redis缓存
     * 
     * @access
     * @Author   LWY
     * @DateTime 2019-10-09T16:24:00+0800
     * @param    string $key 建值
     * @param    string $val 数据
     * @param    integer $exp 有效时间
     * @return   
     */
    function redisSet($key = '', $val = '', $exp = 0) 
    {
       Cache::store('redis')->set($key, $val, $exp);
    }
}

if (!function_exists("redisGet")) {
    /**
     * 获取redis缓存
     * 
     * @access
     * @Author   LWY
     * @DateTime 2019-10-09T16:24:00+0800
     * @param    string $key 建值
     * @return   
     */
    function redisGet($key = '') 
    {
       return Cache::store('redis')->get($key);
    }
}

if (!function_exists("unsetRedis")) {
    /**
     * 移除缓存
     * 
     * @access
     * @Author   LWY
     * @DateTime 2019-10-15T10:51:40+0800
     * @param    string $key 建值
     * @return   
     */
    function unsetRedis($key = '') 
    {
       return Cache::store('redis')->rm($key);
    }
}
if (!function_exists("build_order_no")) {
    /**
     * 随机获取订单编号
     * 数字位共16位,[订单头字母][6位年月日][8位时间戳后5位+毫秒][2位随机数]
     * @param string $header 订单头字母
     * @return string 订单编号
     */
    function build_order_no($header = '')
    {
        $orderSn = $header . date('ymd') . substr(time(), -5) . substr(microtime(), 2, 4) . sprintf('%02d', mt_rand(0, 99));
        return $orderSn;
    }
}
if (!function_exists("getApiHeader")) {
    /**
     * 获取头部信息
     *
     *
     * @Author   LWY
     * @DateTime 2020-03-20 10:08
     */
    function getApiHeader()
    {
        $headers = array();
        foreach ($_SERVER as $key => $value) {
            if ('HTTP_' == substr($key, 0, 5)) {
                $headers[str_replace('_', '-', substr($key, 5))] = $value;
            }
            if (isset($_SERVER['PHP_AUTH_DIGEST'])) {
                $header['AUTHORIZATION'] = $_SERVER['PHP_AUTH_DIGEST'];
            } elseif (isset($_SERVER['PHP_AUTH_USER']) && isset($_SERVER['PHP_AUTH_PW'])) {
                $header['AUTHORIZATION'] = base64_encode($_SERVER['PHP_AUTH_USER'] . ':' . $_SERVER['PHP_AUTH_PW']);
            }
            if (isset($_SERVER['CONTENT_LENGTH'])) {
                $header['CONTENT-LENGTH'] = $_SERVER['CONTENT_LENGTH'];
            }
            if (isset($_SERVER['CONTENT_TYPE'])) {
                $header['CONTENT-TYPE'] = $_SERVER['CONTENT_TYPE'];
            }
        }
        return $headers;
    }
}