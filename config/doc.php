<?php
return [
    'title' => "贤鱼接口文档",  //文档title
    'version'=>'1.0.0', //文档版本
    'copyright'=>'Powered By Zhangweiwei', //版权信息
    'password' => 'api@xy', //访问密码，为空不需要密码
    //静态资源路径--默认为云上路径，解决很多人nginx配置问题
    //可将assets目录拷贝到public下面，具体路径课自行配置
    'static_path' => '',
    'controller' => [
        //需要生成文档的类
//        'app\api\controller\Demo',
        'app\api\controller\Ad',
        'app\api\controller\Login',
        'app\api\controller\Goods',
        'app\api\controller\Order',

    ],
    'filter_method' => [
        //过滤 不解析的方法名称
        '_empty'
    ],
    'return_format' => [
        //数据格式
        'code' => "200成功，400失败",
        'msg' => "提示信息",
    ],
    'public_header' => [
        //全局公共头部参数
        ['name'=>'APIKEY', 'type'=>'string', 'require'=>0, 'default'=>'', 'desc'=>'版本号(全局)，可后台设定']
    ],
    'public_param' => [
        //全局公共请求参数，设置了所以的接口会自动增加次参数
//        ['name'=>'HTTP_API_AUTH', 'type'=>'string', 'require'=>0, 'default'=>'', 'other'=>'' ,'desc'=>'验证（全局），可后台设定']
    ],
];
