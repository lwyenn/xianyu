<?php
/**
 * @filename menu.php
 * @author lwy
 * @version 1.0
 * @copyright http://www.kkidc.com
 *
 * Modified at : 2019-8-19 15:40
 *
 * 后台基本设置
 */
//调用方法 config('logic.') 
return [
    //正则匹配的格式
    'preg' => [
        //电子邮箱
        'email'     => '/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/',
        //手机号
        'mobile'    => '/^((\(\d{2,3}\))|(\d{3}\-))?(13|15|18|14|17|16)\d{9}$/',
        //QQ号
        'qq'        => '/^[1-9]\d{4,12}$/',
        //IP
        'ip'        => '/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/',
        //身份证
        'card'      => '/^(\d{14}|\d{17})(\d|[xX])$/',
        //普通密码
        'pwd'       => '/^(.){6,20}$/',
        //强密码
        'password'  => '/^([0-9]+[a-zA-Z]+)|([a-zA-Z][0-9]+)|(([a-zA-Z]+|[0-9]+)[^A-Za-z0-9]+)|([^A-Za-z0-9]+([a-zA-Z]+|[0-9]+)).*$/',
        //url地址
        'url'       => '/^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/',
        //纯数字
        'number'    => '/^\d+$/',
        //微信支付js授权目录
        'jsapi_path'=>'/^(http|https):\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*\/$/',
        //货币
        'currency'  =>'/^\d+(\.\d+)?$/',
        'decimal_number'=>'/^\d+(.?\d{1,2})?$/' //正数，最多包含两位小数
    ],
    'user_level' => [
        '1' => '普通用户',
        '2' => '超级会员',
        '3' => 'vip会员'
    ],
    'user_sex' => [
        '1' => '男',
        '2' => '女'
    ],
    'order_status' => [
        '0' => '待支付',
        '1' => '已支付',
        '2' => '已发货',
        '3' => '确认收货',
        '4' => '退货中',
        '5' => '退货成功',
        '6' => '退货失败',
    ],
];