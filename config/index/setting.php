<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category field
 * +------------------------------------------------------------+
 * 资源管理配置
 * +------------------------------------------------------------+
 *
 * @author lwy
 * Created on 2019年8月19日 11:28:33
 */

//配置文件
return [
    'base'   => [
        'WEB_TITLE'     => ['title' => '网站标题', 'type'  => 'text', 'value' => '贤鱼'],
        'WEB_DESC'      => ['title' => '网站描述',  'type'  => 'textarea'],
        'WEB_ICON'      => ['title' => '网站图标',  'type'  => 'picture', 'multiple' => 1],
        'WEB_VERSION'   => ['title' => '网站版本号',  'type'  => 'text'],
        'WEB_PHONE'     => ['title' => '网站电话',   'type'  => 'text'],
        'APIKEY'        => ['title' => 'api密钥','type'  => 'text'],
        'API_NOTE'      => ['title' => 'api日志','type'  => 'radio', 'options' => ['关', '开']],
    ],

//    'score'  => [
//        'ZIDUAN1' => ['title' => '字段1', 'type'  => 'text'],
//        'ZIDUAN2' => ['title' => '单选',  'type'  => 'radio', 'options' => ['否','是']],
//        'ZIDUAN3' => ['title' => '时间',  'type'  => 'time'],
//        'ZIDUAN4' => ['title' => '密码',  'type'  => 'password'],
//        'ZIDUAN5' => ['title' => '文本框','type'  => 'textarea'],
//    ],
//
//    'star'   => [
//        'ZIDUAN1' => ['title' => '字段1', 'type'  => 'text'],
//        'ZIDUAN2' => ['title' => '单选',  'type'  => 'radio', 'options' => ['否','是']],
//        'ZIDUAN3' => ['title' => '时间',  'type'  => 'time'],
//        'ZIDUAN4' => ['title' => '密码',  'type'  => 'password'],
//        'ZIDUAN5' => ['title' => '文本框','type'  => 'textarea'],
//    ],
];