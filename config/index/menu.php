<?php
/**
 * @filename normal.resource.php
 * @author lwy
 * @version 1.0
 * @copyright 2019
 *
 * Modified at : 2019-8-19 16:54:51
 *
 * 资源管理配置文件
 */

return [
    'Index' => [
        'title' => '商品管理',
        'list'  => [
            'Goods' => [
                'title' => '商品管理',
                'list'  => [

                    ['title' => '商品列表', 'a' => 'glist'],
                    ['title' => '商品编辑', 'a' => 'g_edit','hide'=>true],
                    ['title' => '商品删除', 'a' => 'g_delete','hide'=>true],
                    ['title' => '商品上架', 'a'=>'set_switch', 'hide'=>true],

                    ['title' => '商品分类', 'a' => 'gtype'],
                    ['title' => '商品分类编辑', 'a' => 'gt_edit','hide'=>true],
                    ['title' => '商品分类删除',  'a' => 'gt_delete','hide'=>true],

                    ['title' => '订单列表', 'm'=> 'Order','a' => 'index', ['other' => ['refund', 'delivery','edit','delete']]],
                    ['title' => '退货审核', 'm'=> 'Order','a' => 'refund','hide'=>true],
                    ['title' => '订单发货','m'=> 'Order', 'a' => 'delivery','hide'=>true],
                    ['title' => '订单编辑','m'=> 'Order', 'a' => 'edit','hide'=>true],
                    ['title' => '订单删除','m'=> 'Order', 'a' => 'delete','hide'=>true],

                    ['title' => '购物车列表', 'a' => 'goods_cart'],
                    ['title' => '购物车删除', 'a' => 'cart_delete','hide'=>true],

                ]
            ]
        ]
    ],
    'Ad' => [
        'title' => '广告管理',
        'list' => [
            'Ad' => [
                'title' =>  '广告管理',
                'list'  =>  [
                    ['title'=>'广告列表', 'a'=>'index', 'other'=>['edit']],
                    ['title'=>'修改/新增广告', 'a'=>'edit', 'hide'=>true],
                    ['title'=>'删除广告', 'a'=>'delete', 'hide'=>true],
                    ['title' => '广告状态', 'a'=>'set_switch', 'hide'=>true],

                ]
            ],
        ],
    ],
    'User' => [
        'title' => '会员管理',
        'list' => [
            'User' => [
                'title' =>  '会员管理',
                'list'  =>  [
                    ['title'=>'会员列表', 'a'=>'index', 'other'=>['edit','delete']],
                    ['title'=>'添加会员', 'a'=>'edit', 'hide'=>true],
                    ['title'=>'删除会员', 'a'=>'delete', 'hide'=>true],
                    ['title'=>'会员禁用', 'a'=>'set_switch', 'hide'=>true],

                    ['title'=>'记录管理','a'=>'record','other'=>['record_delete']],
                    ['title'=>'记录删除','a'=>'record_delete', 'hide'=>true],
                ]
            ],
        ],
    ],
    'Group' => [
        'title' => '管理员管理',
        'list' => [
            'Group' => [
                'title' =>  '管理员管理',
                'list'  =>  [
                    ['title'=>'角色组管理', 'a'=>'index', 'other'=>['edit','add', 'all_add']],
                    ['title'=>'创建角色组', 'a'=>'add', 'hide'=>true],
                    ['title'=>'批量授权', 'a'=>'all_add', 'hide'=>true],
                    ['title'=>'修改角色组', 'a'=>'edit', 'hide'=>true],
                    ['title'=>'删除角色组', 'a'=>'delete', 'hide'=>true],
                    ['title'=> '角色禁用', 'a'=>'set_switch', 'hide'=>true],

                    ['title'=>'管理员列表','m'=>'Admin','a'=>'index','other'=>['edit','add']],
                    ['title'=>'管理员修改/新增','m'=>'Admin','a'=>'edit', 'hide'=>true],
                    ['title'=>'管理员删除','m'=>'Admin','a'=>'delete', 'hide'=>true],
                    ['title'=>'管理员禁用','m'=>'Admin','a'=>'set_switch', 'hide'=>true],
                ]
            ],
        ],
    ],
    'Log' => [
        'title' => '日志管理',
        'list' => [
            'Log' => [
                'title' =>  '日志管理',
                'list'  =>  [
                    ['title'=>'系统日志','a'=>'index'],
                    ['title'=>'我的日志','a'=>'my'],
                    ['title'=>'删除日志','a'=>'delete','hide'=>true],

                    ['title'=>'异常日志','m'=>'ExpLog','a'=>'index'],
                    ['title'=>'API日志','m'=>'ApiLog','a'=>'index'],
                ]
            ],
        ]
    ],
    'System' => [
        'title' => '系统设置',
        'list' => [
            'System' => [
                'title' => '相关配置',
                'list'  => [
                    ['title'=>'系统参数设置', 'a'=>'index'],
                    ['title'=>'缓存管理',     'a'=>'memcache'],
                    ['title'=>'删除文件缓存', 'a'=>'flush_file_cache', 'hide'=>true],
                ]
            ],
        ]
    ],
];

