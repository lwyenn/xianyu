var check_count = 0;  //选中个数
var select_date_type; //下拉选择时间类型
var _submiting  = false; //表单重复提交
$(function () {
    //下拉选择
    if ($(".select-item").length > 0) {
        Select.create('.select-item');
    }

    //单日期选择器
    if ($("#date").length > 0) {
        laydate.render({
            elem:"#date",
            range:true,
			done: function(value, date, endDate){
			 $("#date_range").val(value);
		    }
        })
    }

    //单日期选择器
    if ($("#month").length > 0) {
        laydate.render({
            elem:"#month",
            range:true,
            type:'month',
			done: function(value, date, endDate){
			 $("#date_range").val(value);
		    }
        })
    }

    //单日期选择器
    if ($(".dateSelect").length > 0) {
        $(".dateSelect").each(function(index,el) {
            var that = this;
            laydate.render({
                elem:that
            })
        });
    }

    //时间范围
    if ($(".dateRange").length > 0) {
        $(".dateRange").each(function(index, el) {
            var type = $(this).data("type");
            var that = this;
            if (type == undefined) type = 'date';
            laydate.render({
                elem:that,
                range:true,
                type:type,
            })
        });
    }

    //上传
    if ($(".card-upload").length > 0) {
        $(".card-upload").each(function(index, el) {
            Upload.create(el);
        });
    }

    //全选/反选
    if($(".resource-father").length > 0){
        $(".resource-father").click(function() {
            $(".resource-children").prop("checked", this.checked);
        });
    }

    /*左侧菜单栏*/
   $('.nav-vertical a').click(function () {
       $('#adminUI').removeClass('shrink');
       if($(this).attr('href') === 'javascript:;'){
           $(this).parent().toggleClass('expand').find('.expand').removeClass('expand');
       }else{
           $(this).parents('.nav-vertical').find('.on').removeClass('on');
           $(this).parent().addClass('on');
       }
   });
    $('.nav-vertical dd a').hover(function () {
        /*悬浮在左边导航栏*/
        if($('#adminUI').hasClass('shrink')){
            Pop.tips($(this).find('cite').text(),this,{position:2,time:0});
        }
    }).mouseleave(function () {
       if($('#adminUI').hasClass('shrink')){
           Pop.closeAll();
       }
   });

   /*菜单栏伸缩*/
   $('#flexible').click(function () {
       $(this).toggleClass('rotate90');
       $('#adminUI').toggleClass('shrink');
   });

   /*刷新按钮*/
    $('#refresh').click(function () {
        //http下才有效
        document.getElementById('mainIframe').contentWindow.location.reload(true);
    });

    /*全屏显示*/
    $('#fullScreen').click(function () {
        var el = document.documentElement;
        var rfs = el.requestFullScreen || el.webkitRequestFullScreen || el.mozRequestFullScreen || el.msRequestFullscreen;
        if(typeof rfs != "undefined" && rfs) {
            rfs.call(el);
        }
        $(this).hide();
        $('#smallScreen').show();
    });

    /*退出全屏*/
    $('#smallScreen').click(function () {
        if (document.exitFullscreen) {
            document.exitFullscreen();
        }
        else if (document.mozCancelFullScreen) {
            document.mozCancelFullScreen();
        }
        else if (document.webkitCancelFullScreen) {
            document.webkitCancelFullScreen();
        }
        else if (document.msExitFullscreen) {
            document.msExitFullscreen();
        }
        if(typeof cfs != "undefined" && cfs) {
            cfs.call(el);
        }
        $(this).hide();
        $('#fullScreen').show();
    });

    /*全选*/
    $('[data-checked]').click(function () {
        var name = $(this).data('checked');
        var checked = $(this).prop('checked');
        !checked? check_count = 0 : check_count = 10;
        $('#checkCount').text(check_count)
        $('input[type=checkbox]').each(function () {
            if(name === $(this).data('item')){
                !checked?$(this).prop('checked',false):$(this).prop('checked',true);
            }
        });

    });

    /*单个选*/
    $('input[type=checkbox][data-item]').click(function () {
        var name = $(this).data('item');
        check_count = 0;
        var check_total =  $('input[type=checkbox][data-item='+ name +']').length;
        $('input[type=checkbox][data-item='+ name +']').each(function () {
            $(this).prop('checked')?check_count++:'';
        });
        check_count === check_total? $('[data-checked='+ name +']').prop('checked',true):$('[data-checked='+ name +']').prop('checked',false);
        $('#checkCount').text(check_count);
    });
    //图片预览
    $("body").on('click', 'a.lightbox', function(){
        var objs 		= $(this).siblings("a");
        //上传图片的预览
        if (objs.hasClass('upload-delete') || $(this).parent("li").length) {
            objs = $(this).parent().siblings("li").find("a.lightbox");
        }
        var cur_href 	= this.href;
        var title 		= this.title;
        var src_arr 	= [cur_href]; 
        objs.each(function(i,v){
        	src_arr.push(v.href);
        })
        Pop.photo(src_arr,{
            title:title,
            currentPhotoIndex:0
        })
        return false;
    })
    $(".switch-skin input[type='checkbox']").change(function () {
        var check_status   = this.checked ? 1 : 2;
        var model          = $(this).data('mod');
        var id             = $(this).data('id');
        $.post("/index.php/index/"+model+"/set_switch",{switch_status:check_status,id:id,field:this.name});
    })
    //删除键事件
    $(".btn-del").click(function(){
        var action  = $(this).attr("href");
        var title   = $(this).attr("title");
        var url     = $(this).data("url");
        var ids     = [];
        if($(this).hasClass('btn-all')){
            $('input[type=checkbox][data-item]').each(function(i,v){
                if(v.checked) ids.push($(v).data("id"));
            })
            if (ids.length == 0) {
                layer.alert("未选择数据！",{
                    icon:2,
                    skin: 'pop-custom',
                    title:false,
                    btn:0,
                    time:2000
                })
                return false;
            }
        }
        if (title == '意向') var confirmTitle = "确定转为意向客户吗？";
        else var confirmTitle = '确定'+$.trim(title)+'数据吗？';

        layer.confirm(confirmTitle,{
            icon:3,
            skin: 'pop-custom',
            title:false,
            area:['440px'],
            btn:['取消','确定'],
        },function(){
            layer.closeAll();
        },function(){
            $.ajax({
                url: action,
                data:{ids:ids,items:ids},
                type:'post',
                success:function(dat){
                    var icon_num = dat.code == 1 ? 1 : 2;
                    layer.msg(dat.msg,{icon:icon_num,time:2000},function(){
                        if (url) window.location.href = url;
                        else window.location.reload();
                    })
                },error:function(){
                    layer.msg('操作失败！',{icon:2,time:2000},function(){
                        window.location.reload();
                    })
                }
            })
        })
        return false;
    })

    //弹窗查看
    $(".btn-view").click(function(){
        var action  = $(this).attr("href");
        var title   = $(this).attr("title");
        var w = $(this).data("width") ? $(this).data("width") : "50%";
        var h = $(this).data("height") ? $(this).data("height") : "50%";
        layer.open({
            type: 2,
            title:title ? title : '信息',
            area: [w,h],
            id:"win-box",
            content: [action]
        });
        return false;
    })

    //弹窗获取弹窗列表
    $(".btn-list").click(function(){
        var action  = $(this).data("url");
        var title   = $(this).attr("title");
        var w = $(this).data("width") ? $(this).data("width") : "50%";
        var h = $(this).data("height") ? $(this).data("height") : "50%";
        layer.open({
            type: 2,
            title:title ? title : '信息',
            area: [w,h],
            id:"win-box",
            content: [action]
        });
        return false;
    })

    //总览
    $(".over_view").change(function () {
        var o_close  = $(this).is(':checked') ? 1 : 2;
        var that     = this;
        $.ajax({
            url: $(that).attr('rel'),
            data:{field:$(that).data("mod"), id:$(that).data("id"), status: o_close},
            type:'post',
            success:function (res) {
                
            }
        })
    })

    //打开弹窗页面
    $(".winbox").click(function(){
        var href    = this.href;
        //标题
        var title   = $(this).attr("title");
        //宽度 高度
        var w = $(this).data("width") ? $(this).data("width") : "50%";
        var h = $(this).data("height") ? $(this).data("height") : "50%";

        var ids     = [];
        if($(this).hasClass('btn-all')){
            $('input[type=checkbox][data-item]').each(function(i,v){
                if(v.checked) ids.push($(v).data("id"));
            })
            if (ids.length == 0) {
                layer.msg("未选择数据！", {icon:2,time:2000});
                return false;
            }
            idstr   = ids.join("_");
            href    = href + "?user_id="+ idstr;
        }
        layer.open({
            type: 2,
            title:title ? title : '信息',
            area: [w,h],
            id:"win-box",
            content: [href],
            end:function(){
                clearSession('affairs_binds', 'reload');
            }
        });
        return false;
    })

    //ajax提交按钮
    $(".ajax-post").click(function(){
        var href = this.href;
        var referer = $(this).data('referer');
        if ($(this).hasClass("confirm")) {
            layer.confirm("确定执行此操作",{
                icon:3,
                skin: 'pop-custom',
                title:false,
                area:['440px'],
                btn:['取消','确定'],
            },function(){
                layer.closeAll();
            },function() {
                $.post(href, {}, function (dat) {
                    if (dat.data == 'win') {
                        layer.alert(dat.msg, {
                            icon: 1,
                            title: false,
                            btn: 0,
                            end: function () {
                                window.location.reload();
                            }
                        })
                        return false;
                    }
                    var icon_num = dat.code == 1 ? 1 : 2;
                    layer.msg(dat.msg, {icon: icon_num, time: 2000}, function () {
                        if (referer) window.location.href = referer;
                        else window.location.reload();
                    })
                })
            })
        } else {
            $.post(href, {}, function (dat) {
                if (dat.data == 'win') {
                    layer.alert(dat.msg, {
                        icon: 1,
                        title: false,
                        btn: 0,
                        end: function () {
                            window.location.reload();
                        }
                    })
                    return false;
                }
                var icon_num = dat.code == 1 ? 1 : 2;
                layer.msg(dat.msg, {icon: icon_num, time: 2000}, function () {
                    if (referer) window.location.href = referer;
                    else window.location.reload();
                })
            })
        }

        return false;
    })

    //取消按钮
    $(".form-cancel").click(function(){
        clearSession(['http_referer', 'referer_time']);
    })
    
    //页面返回事件监听
    window.addEventListener("popstate", function(e) { 
        clearSession(['http_referer', 'referer_time']);
    }, false);

    //必填项
    $(".require").blur(function(event) {
        if (!$(this).hasClass('checkbox-skin')) {
            var v       = $.trim(this.value);
            var code    = v ? 1 : 0;
            formTips(code, this, ['不为空', '']);
        } else {
            var $chk_box = $(this).parent().find("input[type='checkbox']");
            var checked_flag = 0;

            if ($chk_box.length > 0) {
                $chk_box.each(function(index, el) {
                    if (el.checked) checked_flag = 1;
                });

                if (!checked_flag) {
                    var $i_fa = $("<span class='error-tips'><i class='fa fa-times-circle'></i> 不为空</span>"); 
                    $(this).parent().append($i_fa);
                } else {
                    $(this).parent().find("span.error-tips").remove();
                }
            }
        }
    });

    //查重复
    $(".unique").change(function(event) {
        //字段名
        var field   = $(this).data("field");
        field       = field ? field : this.name;
        //当前id
        var id      = parseInt($(this).data("id"));
        id = id == NaN ? 0 : id;
        //当前模块
        var model = $(this).data("model");
        var val   = $.trim(this.value);

        var that  = this; 
        if (field && val) {
            $.post("/index.php/index/goods/check_unique", {id:id,field:field,value:val},function(res){
                
                if ($(that).hasClass('exist')) {
                    var code    =  res.code == 0 ? '1' : '0';
                    var tip_arr = ['不存在', ''];
                } else {
                    var code =  res.code;
                    var tip_arr = ['已存在', '可以'];
                }

                formTips(code, that, tip_arr);
            })
        }
        if (!val && !$(that).hasClass('require')) $(that).parent().siblings('.form-tips').remove();
    });

    //设置每页数量
    $(".PAGENUM").change(function(event) {
        var v = $(this).val();
        $.post("/index.php/index/goods/setPageNum",{num:v},function(){
            location.reload();
        });
    });
    
    // 跳转页码
    $(window).keyup(function(event) {

        var isfn = typeof getPageList === 'function';

        if (event.keyCode == 13) {
            if ($(".skip").is(":focus") && !isfn) {
                var v           = $(".skip").val();
                var lastPage    = $(".skip").data("last");
                if (v > lastPage) {
                    layer.msg("超出页码！",{time:1200});
                } else {
                    var newUrl           = replaceParamVal("page", v);
                    window.location.href = newUrl;
                }
            } else {
                var v           = $(".skip").val();
                var lastPage    = $(".skip").data("last");
                if (v > lastPage) {
                    layer.msg("超出页码！",{time:1200});
                } else {
                    getPageList(v);
                }
            }
        }
    });
    
});

/**
 * 获取时间类型
 * @param val
 */
function select_time_type(object) {
    var time_type = $(object).val();
    if (time_type==1){
       $("#date").show();
       $("#month").hide();
	   $("#date_range").val($("#date").val());
    }else{
       $("#date").hide();
       $("#month").show();
	   $("#date_range").val($("#month").val());
    }
}

/*返回选中*/
function check_num() {
    return check_count;
}

/**
 * 表单提交
 * 
 * @Author   LWY
 * @DateTime 2019-08-28T17:25:06+0800
 * @param    obj obj 当前表单元素
 */
function formSubmit(obj){
    if(_submiting){
        layer.msg('网络不给力，数据还在处理中，请勿进行重复提交',{icon:3});
        return false;
    }

    //是否需要继续操作
    var again    = obj.data("continue");

    //是否是弹窗编辑，提交后刷新当前页
    var openHtml = parent.$("#win-box").html();

    $.ajax({
        url:obj.attr('action'),
        data:obj.serialize(),
        type:"post",
        beforeSend:function(){
            layer.load("数据正在提交，请稍后。。。");
            _submiting = true;
        },
        success:function(dat){
            layer.closeAll();
            _submiting = false;
            if(dat.code == 1){
                if(again && openHtml == undefined){
                    layer.confirm(dat.msg+'，是否继续操作！',{
                        icon:3,
                        skin: 'pop-custom',
                        title:false,
                        area:['440px'],
                        btn:['取消','确定'],
                    },function(){
                        clearSession(['http_referer', 'referer_time']);
                        window.location.href = $(".form-cancel").attr("href");
                    },function(){
                        window.location.href = obj.attr('action');
                    })
                }else if(openHtml == undefined){

                    clearSession(['http_referer', 'referer_time']);

                    layer.msg(dat.msg,{icon:1,time:2000},function(){
                        window.location.href = $(".form-cancel").attr("href");
                    })
                }else{
                    
                    layer.msg(dat.msg,{icon:1,time:2000},function(){
                        window.parent.location.reload();
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                    })
                }
            }else{
                layer.alert(dat.msg,{
                    icon:2,
                    skin: 'pop-custom',
                    title:false,
                    btn:0,
                    time:2000
                })
            }
        },
        error:function(){
            layer.closeAll();
            _submiting = false;
            layer.msg('系统出错，数据提交失败', {icon:2});
        }
    })
    return false;
}
/**
 * 限制长度
 * @param obj
 * @returns int 长度
 */
function limit_words(obj) {
    var v       = $(obj).val();
    var rlen    = get_zh_length(v);

    var cur_obj     = $(obj).next().find('font').eq(0);
    var total_obj   = $(obj).next().find('font').eq(1);

    if(rlen > total_obj.text()){
        rlen = total_obj.text();
        var str = v.substring(0, rlen);
        $(obj).val(str);
    }
    cur_obj.text(rlen);
}

/**
 * 计算长度
 * @param str 字符串
 * @returns int 长度
 */
function get_zh_length(str) {
    return str.replace(/[\u0391-\uFFE5]/g,"a").length;
}

/**
 * chart加载等待
 * @param chart
 */
function chartLoading(chart) {
    chart.showLoading({
        text:"图表数据正在努力加载...",
        color: '#63bf98',
        textColor: '#333',
        effect : 'whirling'
    });
}

/**
 * 列表加载等待
 * @param dataList
 * @param url
 */
function getPageLoading(pageList,url) {
    $("."+pageList).html("<img  style='margin-left:50%' src="+url+"/layer/loading-1.gif>");
}

/**
 * 异步获取列表加载等待
 * @param dataList
 * @param url
 */
function ajaxGetPageLoading(dataList,url) {
    $("#"+dataList).html("<tr><td colspan='14'><img style='display:block;margin:0 auto' src="+url+"/layer/loading-1.gif></td></tr>");
}

/**
 * 字符截取
 * @param href
 * @param name
 * @returns {string|null}
 * @constructor
 */
function GetQueryString(href,name){
    var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
    var r   = href.match(reg);
    if(r!=null)return  unescape(r[2]); return null;
}

/**
 * 替换指定传入参数的值,paramName为,replaceWith为新值
 * 
 * @access
 * @Author   LWY
 * @DateTime 2019-10-24T10:26:50+0800
 * @param   string  paramName 参数名
 * @param    string  replaceWith 新值
 * @return   
 */
function replaceParamVal(paramName,replaceWith) {
    var oUrl = this.location.href.toString();
    var re   = eval('/('+ paramName+'=)([^&]*)/gi');

    if (!re.test(oUrl)) {
        if (oUrl.indexOf("?") != -1) {
            return oUrl+"&"+paramName+"="+replaceWith;
        } else {
            return oUrl+"?"+paramName+"="+replaceWith;
        }
    }

    return oUrl.replace(re, paramName+'='+replaceWith);
}


/**
 * ajax获取分页的值
 */
$(document).on("click", ".ajax #page a", function () {
    ajaxGetPageLoading('dataList',url)
    //阻止a标签的跳转
    event.preventDefault();
    //获取a标签中和href值
    var href = $(this).attr('href');
    href= href.split("?");
    var page = GetQueryString(href[1],'page');
    //实现ajax分页
    getPageList(page);
});

/**
 * 设置是否总览
 * @param id
 * @param type
 */
function set_over(object,id,type) {
    var ckeck_flag = $(object).prop('checked');
    var action  = $(object).data('url');
    $.ajax({
        url: action,
        data: {type:type,id:id,status:ckeck_flag},
        type: "get",
        dataType: "json",
        success: function (data){
            layer.msg(data.msg);
        }
    });
}

/**
 * 排序
 * @param object
 * @param id
 */
function setSort(object,id) {
    var action  = $(object).data('url');
    var model   = $(object).data('model');
    var order_id = $(object).val();
    $.ajax({
        url: action,
        data: {model:model,id:id,order_id:order_id},
        type: "get",
        dataType: "json",
        success: function (data){
            layer.msg(data.msg);
            window.location.reload();
        }
    });
}
/**
 * 清除会话值
 * 
 * @access
 * @Author   LWY
 * @DateTime 2019-09-29T10:40:06+0800
 * @param    {String} name 清除键
 * @param    function|string fn 函数或字符串
 * @return   
 */
function clearSession(name, fn)
{
    $.post("/index.php/index/index/offCheck",{name:name},function(){
        if (typeof fn == 'function') {
            fn();
        }else{
            if (fn == 'reload') {
                window.location.reload();
            }
        }
    });
}
/**
 * 表单提示框
 * 
 * @access
 * @Author   LWY
 * @DateTime 2019-10-17T16:22:26+0800
 * @param $code 0错误 1成功
 * @param obj 表单元素
 * @param arr ['错误提示', '成功提示']
 * @return   
 */
function formTips(code = '', obj, arr = ['已存在', '可以'])
{
    var $tips   = $(obj).parent().parent().find("div.form-tips");
    if ($tips.length == 0) {
        var $tips = $("<div class='col-lg-4 col-md-4 col-sm-4 col-xs-4 form-tips'></div>");
        $(obj).parent().parent().append($tips);
    }
    if (code == 0) {
        $tips.removeClass('success-tips').addClass('error-tips');
        $tips.html("<i class='fa fa-times-circle'></i>&nbsp;"+arr[0]);
    } else {
        $tips.removeClass('error-tips').addClass('success-tips');
        $tips.html("<i class='fa fa-check-circle'></i>&nbsp;"+arr[1])
    }
}