(function () {

    /*下拉框*/
    function Select(elem,opt) {
        this.$element = $(elem);
        this.$select = null
        this.options = $.extend({}, Select.DEFAULTS, $.isPlainObject(opt) && opt);
        this.zIndex = parseInt(this.$element.css("z-index"));
        this.init();
    }
    Select.create = function (elem,opt) {
        var elemArr = $(elem);
        for(var i=0;i<elemArr.length;i++){
            elemArr[i].select = new Select(elemArr[i],opt);
        }
    };
    Select.prototype = {
        render: function () {
            var select_options = this.getOption();
            var isReadonly = !this.options.canInput?'readonly':'';
            var select_input = '<input type="text" class="input-skin" value="'+this._first_title+'"  '+ isReadonly +'/>';
            var select_header = '<div class="select-title">'+ select_input +'</div>';
            var select_body = '<dl class="select-list">'+ select_options +'</dl>';
            this.$select = $('<div class="select-skin">'+ select_header + select_body +'</div>').insertAfter(this.$element);
        },
        getOption: function () {
            var list = [];
            this._first_title = '';
            var that = this;
            this.$element.children().each(function () {
                var tips,val,selected,disabled; 
                var t = $(this)[0];
                if(t.tagName === 'OPTION'){
                    tips = t.value?'':'select-tips';
                    val = 'data-value= "'+t.value+'"';
                    selected = t.selected?'cur':'';
                    disabled = t.disabled?'disabled':'';
                    list.push('<dd '+ val +' class="'+ tips + ' '+ selected +'" '+ disabled+ '>'+ t.innerText +'</dd>');
                    if(!that._first_title)  that._first_title = t.selected ? t.innerText : '';
                }else if(t.tagName === 'OPTGROUP'){
                    list.push('<dt>'+t.label+'</dt>');
                    for(var i = 0 ;i<t.children.length;i++){
                        tips = t.children[i].value?'':'select-tips';
                        val = 'data-value= "'+t.children[i].value+'"';
                        selected = t.children[i].selected?'cur':'';
                        disabled = t.children[i].disabled?'disabled':'';
                        list.push('<dd '+ val +' class="'+ tips + ' '+ selected +'" '+ disabled+ '>'+ t.children[i].innerText +'</dd>')
                    }
                }

            });
            return list.join('');
        },
        show:function () {
            this.$select.find('.select-list').slideDown(200);
            this.$element.css("z-index",this.zIndex + 1);
        },
        hide:function () {
            this.$select.find('.select-list').slideUp(200);
            this.$element.css("z-index",this.zIndex - 1);
        },
        init:function () {
            this.render();
            this.bind();
        },
        bind: function () {
            var t = this;
            t.$select.on('click','.select-title',function(){
                t.$select.find('.select-list').is(":hidden")?t.show():t.hide();
            });
            t.$select.find("dd").on('click',function(){
                if($(this).hasClass('select-tips')){
                    t.$select.find('.select-title').find('input').val($(this).html());
                    t.$element.find("option").eq(0).attr("selected",true);
                    t.hide();
                }else if(!$(this).attr('disabled')){
                    t.$element.find("option").removeAttr("selected");
                    t.$element.find("option[value="+ $(this).attr('data-value') +"]").attr("selected",true);
                    t.$element.trigger('change');
                    t.$select.find('.select-list').find(".cur").removeClass('cur');
                    $(this).addClass('cur');
                    t.$select.find('.select-title').find('input').val($(this).html());
                    t.hide();
                }
            });

            t.$select.find('.input-skin').on('keyup',function () {
                var dd = $(this).parents('.select-skin').find('.select-list');
                var v = $(this).val();
                var hide_count = 0;
                dd.find('dd').each(function () {
                    if($(this).text().indexOf(v) === -1){
                        $(this).addClass('hide');
                        hide_count++;
                    }else{
                        $(this).removeClass('hide');
                    }
                });
                if(hide_count === dd.find('dd').length && !$('.select-empty').length){
                    dd.append('<p class="select-empty">没有匹配项</p>');
                }else{
                    $('.select-empty').remove();
                }
            });

            $(document).on('click', (this._mouteclick = function (e) {
                var $target = $(e.target);
                var $dropdown,  $input;
                if ($target.is('.input-skin')) {
                    $input = $target;
                }
                if ($target.is('.select-list')) {
                    $dropdown = $target;
                }else if ($target.is('.select-list *')) {
                    $dropdown = $target.parents('.select-list');
                }
                if ((!$input && !$dropdown) ||
                    ($input && $input.get(0) !== (t.$select).find('input').get(0)) ||
                    ($dropdown && $dropdown.get(0) !== t.$select.find('.select-list').get(0))) {
                    t.hide();
                }
            }));



        }
    };
    Select.DEFAULTS = {
        default:'',
        canInput:false
    };
    window.Select = Select;

    /*颜色选择器*/
    var util = {
        css: function(elem,obj){
            for(var i in obj){
                elem.style[i] = obj[i];
            }
        },
        hasClass: function(elem,classN){
            var className = elem.getAttribute("class");
            return className.indexOf(classN) != -1;
        }
    };
    function Colorpicker(elem,opt){

        this.$element = elem; // 绑定的元素
        this.$dropdown = null; // 最外层容器
        this.fixedBg = null; // 拾色器后面固定定位的透明div 用于点击隐藏拾色器
        this.elem_colorPancel = null; // 色彩面板
        this.elem_picker = null; // 拾色器色块按钮
        this.elem_barPicker1 = null; // 颜色条
        this.elem_barPicker2 = null; // 透明条
        this.elem_hexInput = null; // 显示hex的表单
        this.elem_showColor = null; // 显示当前颜色
        this.elem_opacityPancel = null; // 透明度背景元素
        this.elem_showModeBtn = null; // 切换输入框模式按钮
        this.elem_inputWrap = null; // 输入框外层容器

        this.pancelLeft = 0;
        this.pancelTop = 0;

        this.downX = 0;
        this.downY = 0;
        this.moveX = 0;
        this.moveY = 0;

        this.pointLeft = 0;
        this.pointTop = 0;

        this.current_mode = 'hex'; // input框当前的模式

        this.rgba = {
            r:0,
            g:0,
            b:0,
            a:1
        };

        this.hsb = {
            h:0,
            s:100,
            b:100
        };
        this.options =  $.extend({}, Colorpicker.DEFAULTS, $.isPlainObject(opt) && opt);

        for(var prop in opt){
            this.options[prop] = opt[prop];
        }

        this.init();
    }
    Colorpicker.create = function(elem,opt){
        var elemArr = $(elem);
        for(var i=0;i<elemArr.length;i++){
            elemArr[i].colorpicker = new Colorpicker(elemArr[i],opt);
        }

    };
    Colorpicker.prototype = {
        render : function(){
            var tpl = '<div style="position: fixed; top: 0; right: 0; bottom: 0; left: 0;"></div>'+
                '<div style="position: inherit; z-index: 100;">'+
                '<div class="colorpicker-pancel" style="background: rgb(255, 255, 255); border-radius: 2px; box-shadow: 0 1px 6px rgba(0,0,0,.15);border:1px solid #e6e6e6; box-sizing: initial; width: 225px; font-family: Menlo;"><div style="width: 100%; padding-bottom: 55%; position: relative; border-radius: 2px 2px 0 0; overflow: hidden;">'+
                '<div class="color-pancel" style="position: absolute; top: 0; right: 0; bottom: 0; left: 0; background: rgb('+this.rgba.r+','+this.rgba.g+','+this.rgba.b+')">'+
                '<style>'+
                '.saturation-white {background: -webkit-linear-gradient(to right, #fff, rgba(255,255,255,0));background: linear-gradient(to right, #fff, rgba(255,255,255,0));}'+
                '.saturation-black {background: -webkit-linear-gradient(to top, #000, rgba(0,0,0,0));background: linear-gradient(to top, #000, rgba(0,0,0,0));}'+
                '</style>'+
                '<div class="saturation-white" style="position: absolute; top: 0; right: 0; bottom: 0; left: 0;">'+
                '<div class="saturation-black" style="position: absolute; top: 0; right: 0; bottom: 0; left: 0;"></div>'+
                '<div class="pickerBtn" style="position: absolute; top: 0; left: 100%; cursor: default;">'+
                '<div style="width: 12px; height: 12px; border-radius: 6px; box-shadow: rgb(255, 255, 255) 0 0 0 1px inset; transform: translate(-6px, -6px);"></div>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '<div style="padding: 16px 16px 12px;">'+
                '<div class="flexbox-fix" style="display: flex;">'+
                '<div style="width: 32px;">'+
                '<div style="margin-top: 6px; width: 16px; height: 16px; border-radius: 8px; position: relative; overflow: hidden;">'+
                '<div class="colorpicker-showColor" style="position: absolute; top: 0; right: 0; bottom: 0; left: 0; border-radius: 8px; box-shadow: rgba(0, 0, 0, 0.1) 0 0 0 1px inset; background:rgb('+this.rgba.r+','+this.rgba.g+','+this.rgba.b+'); z-index: 2;"></div>'+
                '<div class="" style="position: absolute; top: 0; right: 0; bottom: 0; left: 0; background: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAMUlEQVQ4T2NkYGAQYcAP3uCTZhw1gGGYhAGBZIA/nYDCgBDAm9BGDWAAJyRCgLaBCAAgXwixzAS0pgAAAABJRU5ErkJggg==&quot;) left center;"></div></div></div><div style="-webkit-box-flex: 1; flex: 1 1 0;"><div style="height: 10px; position: relative; margin-bottom: 8px;"><div style="position: absolute; top: 0;'+ 'right: 0; bottom: 0; left: 0;"><div class="hue-horizontal" style="padding: 0 2px; position: relative; height: 100%;">'+
                '<style>'+
                '.hue-horizontal {background: linear-gradient(to right, #f00 0%, #ff0 17%, #0f0 33%, #0ff 50%, #00f 67%, #f0f 83%, #f00 100%);background: -webkit-linear-gradient(to right, #f00 0%, #ff0 17%, #0f0 33%, #0ff 50%, #00f 67%, #f0f 83%, #f00 100%);}'+
                '.hue-vertical {background: linear-gradient(to top, #f00 0%, #ff0 17%, #0f0 33%,#0ff 50%, #00f 67%, #f0f 83%, #f00 100%);background: -webkit-linear-gradient(to top, #f00 0%, #ff0 17%,#0f0 33%, #0ff 50%, #00f 67%, #f0f 83%, #f00 100%);}'+
                '</style>'+
                '<div  class="colorBar-color-picker" style="position: absolute; left: 0%;">'+
                '<div style="width: 12px; height: 12px; border-radius: 6px; transform: translate(-6px, -1px); background-color: rgb(248, 248, 248); box-shadow: rgba(0, 0, 0, 0.37) 0 1px 4px 0;">'+
                '</div>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '<div style="height: 10px; position: relative;">'+
                '<div style="position: absolute; top: 0; right: 0; bottom: 0; left: 0;">'+
                '<div style="position: absolute; top: 0; right: 0; bottom: 0; left: 0; overflow: hidden;">'+
                '<div style="position: absolute; top: 0; right: 0; bottom: 0; left: 0; background: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAMUlEQVQ4T2NkYGAQYcAP3uCTZhw1gGGYhAGBZIA/nYDCgBDAm9BGDWAAJyRCgLaBCAAgXwixzAS0pgAAAABJRU5ErkJggg==&quot;) left center;"></div>'+
                '</div>'+
                '<div style="position: absolute; top: 0; right: 0; bottom: 0; left: 0; background: linear-gradient(to right, rgba('+this.rgba.r+','+this.rgba.g+','+this.rgba.b+',0) 0%, rgb('+this.rgba.r+','+this.rgba.g+','+this.rgba.b+') 100%);"></div>'+
                '<div style="position: relative; height: 100%; margin: 0 3px;">'+
                '<div class="colorBar-opacity-picker" style="position: absolute; left: 100%;">'+
                '<div style="width: 12px; height: 12px; border-radius: 6px; transform: translate(-6px, -1px); background-color: rgb(248, 248, 248); box-shadow: rgba(0, 0, 0, 0.37) 0 1px 4px 0;"></div>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '<div class="flexbox-fix" style="padding-top: 16px; display: flex;">'+
                '<div class="flexbox-fix colorpicker-inputWrap" style="-webkit-box-flex: 1; flex: 1 1 0; display: flex; margin-left: -6px;">';

            tpl += this.getInputTpl();
            tpl += '</div>'+
                '<div class="colorpicker-showModeBtn" style="width: 32px; text-align: right; position: relative;">'+
                '<div style="margin-right: -4px;  cursor: pointer; position: relative;">'+
                '<svg viewBox="0 0 24 24" style="width: 24px; height: 24px; border: 1px solid transparent; border-radius: 5px;"><path fill="#333" d="M12,5.83L15.17,9L16.58,7.59L12,3L7.41,7.59L8.83,9L12,5.83Z"></path><path fill="#333" d="M12,18.17L8.83,15L7.42,16.41L12,21L16.59,16.41L15.17,15Z"></path></svg>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '</div>'+
                '</div>';

            return tpl;
        },
        getInputTpl : function(){
            var current_mode_html = "";
            switch (this.current_mode) {
                case 'hex':
                    var hex = "#"+this.rgbToHex(this.HSBToRGB(this.hsb));

                    current_mode_html += '<div style="padding-left: 6px; width: 100%;">'+
                        '<div style="position: relative;">'+
                        '<input class="colorpicker-hexInput" value="'+hex+'" spellcheck="false" style="font-size: 11px; color: rgb(51, 51, 51); width: 100%; border-radius: 2px; border: none; box-shadow: rgb(218, 218, 218) 0 0 0 1px inset; height: 21px; text-align: center;">'+
                        '<span style="text-transform: uppercase; font-size: 11px; line-height: 11px; color: rgb(150, 150, 150); text-align: center; display: block; margin-top: 12px;">hex</span>'+
                        '</div>'+
                        '</div>';
                    break;
                case 'rgb':
                    for(var i=0;i<3;i++){

                        current_mode_html += '<div style="padding-left: 6px; width: 100%;">'+
                            '<div style="position: relative;">'+
                            '<input class="colorpicker-hexInput" value="'+this.rgba['rgb'[i]]+'" spellcheck="false" style="font-size: 11px; color: rgb(51, 51, 51); width: 100%; border-radius: 2px; border: none; box-shadow: rgb(218, 218, 218) 0 0 0 1px inset; height: 21px; text-align: center;">'+
                            '<span style="text-transform: uppercase; font-size: 11px; line-height: 11px; color: rgb(150, 150, 150); text-align: center; display: block; margin-top: 12px;">'+('rgb'[i])+'</span>'+
                            '</div>'+
                            '</div>';
                    }
                default:

            }
            return current_mode_html;
        },
        init : function(){
            var _this = this,
                initColor = this.options.initColor,
                rgb = initColor.slice(4,-1).split(",");

            this.rgba.r = parseInt(rgb[0]);
            this.rgba.g = parseInt(rgb[1]);
            this.rgba.b = parseInt(rgb[2]);

            var body = document.getElementsByTagName("body")[0],
                div = document.createElement("div");

            div.innerHTML = this.render();
            body.appendChild(div);

            this.$dropdown = div;
            this.fixedBg = div.children[0];
            this.elem_colorPancel = div.getElementsByClassName("color-pancel")[0];
            this.pancel_width = this.elem_colorPancel.offsetWidth;
            this.pancel_height = this.elem_colorPancel.offsetHeight;
            this.elem_picker = div.getElementsByClassName("pickerBtn")[0];
            this.elem_showColor = div.getElementsByClassName("colorpicker-showColor")[0];
            this.elem_barPicker1 = div.getElementsByClassName("colorBar-color-picker")[0];
            this.elem_barPicker2 = div.getElementsByClassName("colorBar-opacity-picker")[0];
            this.elem_hexInput = div.getElementsByClassName("colorpicker-hexInput")[0];
            this.elem_showModeBtn = div.getElementsByClassName("colorpicker-showModeBtn")[0];
            this.elem_inputWrap = div.getElementsByClassName("colorpicker-inputWrap")[0];
            this.elem_opacityPancel = this.elem_barPicker2.parentNode.parentNode.children[1];

            var elem = this.$element;
            var top = elem.offsetTop;
            var left = elem.offsetLeft;
            while(elem.offsetParent) {
                top += elem.offsetParent.offsetTop;
                left += elem.offsetParent.offsetLeft;
                elem = elem.offsetParent;
            }

            this.pancelLeft = left;
            this.pancelTop = top + this.$element.offsetHeight;
            util.css(div,{
                "position": "absolute",
                "z-index": 2,
                "display": 'none',
                "left": left + "px",
                "top": top + this.$element.offsetHeight + "px"
            });

            this.bindMove(this.elem_colorPancel,this.setPosition,true);
            this.bindMove(this.elem_barPicker1.parentNode,this.setBar,false);
            this.bindMove(this.elem_barPicker2.parentNode,this.setBar,false);

            this.$element.addEventListener("click",function(){
                _this.show();
            },false);

            this.fixedBg.addEventListener("click",function(e){
                _this.hide();
            },false);

            this.elem_showModeBtn.addEventListener("click",function(){
                _this.switch_current_mode();
            },false);

            this.$dropdown.addEventListener("input",function(e){
                var target = e.target,
                    value = target.value;

                _this.setColorByInput(value);
            },false)
        },
        setPosition: function(x,y){
            var LEFT = parseInt( x-this.pancelLeft ),
                TOP = parseInt( y-this.pancelTop );

            this.pointLeft = Math.max(0,Math.min(LEFT,this.pancel_width));
            this.pointTop = Math.max(0,Math.min(TOP,this.pancel_height));

            util.css(this.elem_picker,{
                left:this.pointLeft+"px",
                top:this.pointTop+"px"
            });
            this.hsb.s = parseInt( 100*this.pointLeft/this.pancel_width );
            this.hsb.b = parseInt( 100*(this.pancel_height-this.pointTop)/this.pancel_height );

            this.setShowColor();
            this.setValue(this.rgba);

        },
        setBar: function(elem,x){
            var elem_bar = elem.getElementsByTagName("div")[0],
                rect = elem.getBoundingClientRect(),
                elem_width = elem.offsetWidth,
                X = Math.max(0,Math.min(x - rect.x,elem_width));

            if(elem_bar===this.elem_barPicker1){
                util.css(elem_bar,{
                    left:X+"px"
                });
                this.hsb.h = parseInt(360*X/elem_width);
            }else {
                util.css(elem_bar,{
                    left:X+"px"
                });
                this.rgba.a = X/elem_width;
            }

            this.setPancelColor(this.hsb.h);
            this.setShowColor();
            this.setValue(this.rgba);

        },
        setPancelColor: function(h){
            var rgb = this.HSBToRGB({h:h,s:100,b:100});

            util.css(this.elem_colorPancel,{
                background:'rgba('+rgb.r+','+rgb.g+','+rgb.b+','+this.rgba.a+')'
            });
        },
        setShowColor: function(){
            var rgb = this.HSBToRGB(this.hsb);

            this.rgba.r = rgb.r;
            this.rgba.g = rgb.g;
            this.rgba.b = rgb.b;

            util.css(this.elem_showColor,{
                background:'rgba('+rgb.r+','+rgb.g+','+rgb.b+','+this.rgba.a+')'
            });

            util.css(this.elem_opacityPancel,{
                background: 'linear-gradient(to right, rgba('+rgb.r+','+rgb.g+','+rgb.b+',0) 0%, rgba('+rgb.r+','+rgb.g+','+rgb.b+',1))'
            });
        },
        setValue: function(rgb){
            var hex = "#"+this.rgbToHex(rgb);
            this.elem_inputWrap.innerHTML = this.getInputTpl();
            this.options.change(this.$element,hex);

        },
        setColorByInput: function(value){
            var _this = this;
            switch (this.current_mode) {
                case "hex":
                    value = value.slice(1);
                    if(value.length==3){
                        value = '#'+value[0]+value[0]+value[1]+value[1]+value[2]+value[2];
                        this.hsb = this.hexToHsb(value);
                    }else if(value.length==6){
                        this.hsb = this.hexToHsb(value);
                    }
                    break;
                case 'rgb':
                    var inputs = this.$dropdown.getElementsByTagName("input"),
                        rgb = {
                            r:inputs[0].value? parseInt(inputs[0].value):0,
                            g:inputs[1].value? parseInt(inputs[1].value):0,
                            b:inputs[2].value? parseInt(inputs[2].value):0
                        };

                    this.hsb = this.rgbToHsb(rgb);
            }

            this.changeViewByHsb();
        },
        changeViewByHsb: function(){
            this.pointLeft = parseInt(this.hsb.s*this.pancel_width/100);
            this.pointTop = parseInt( (100-this.hsb.b)*this.pancel_height/100);
            util.css(this.elem_picker,{
                left:this.pointLeft+"px",
                top:this.pointTop+"px"
            });

            this.setPancelColor(this.hsb.h);
            this.setShowColor();
            util.css(this.elem_barPicker1,{
                left:this.hsb.h/360*(this.elem_barPicker1.parentNode.offsetWidth)+"px"
            });

            var hex = '#'+this.rgbToHex(this.HSBToRGB(this.hsb));
            this.options.change(this.$element,hex);

        },
        switch_current_mode: function(){
            this.current_mode = this.current_mode == 'hex'? 'rgb':'hex';
            this.elem_inputWrap.innerHTML = this.getInputTpl();
        },
        bindMove: function(elem,fn,bool){
            var _this = this;

            elem.addEventListener("mousedown",function(e){
                _this.downX = e.pageX;
                _this.downY = e.pageY;
                bool? fn.call(_this,_this.downX,_this.downY):fn.call(_this,elem,_this.downX,_this.downY);

                document.addEventListener("mousemove",mousemove,false);
                function mousemove(e){
                    _this.moveX = e.pageX;
                    _this.moveY = e.pageY;
                    bool? fn.call(_this,_this.moveX,_this.moveY):fn.call(_this,elem,_this.moveX,_this.moveY);
                    e.preventDefault();
                }
                document.addEventListener("mouseup",mouseup,false);
                function mouseup(e){
                    document.removeEventListener("mousemove",mousemove,false)
                    document.removeEventListener("mouseup",mouseup,false)
                }
            },false);
        },
        show: function(){
            util.css(this.$dropdown,{
                "display":"block"
            })
        },
        hide: function(){
            util.css(this.$dropdown,{
                "display":"none"
            })
        },
        HSBToRGB : function (hsb) {
            var rgb = { };
            var h = Math.round(hsb.h);
            var s = Math.round(hsb.s * 255 / 100);
            var v = Math.round(hsb.b * 255 / 100);

            if (s == 0) {
                rgb.r = rgb.g = rgb.b = v;
            } else {
                var t1 = v;
                var t2 = (255 - s) * v / 255;
                var t3 = (t1 - t2) * (h % 60) / 60;

                if (h == 360) h = 0;

                if (h < 60) { rgb.r = t1; rgb.b = t2; rgb.g = t2 + t3 }
                else if (h < 120) { rgb.g = t1; rgb.b = t2; rgb.r = t1 - t3 }
                else if (h < 180) { rgb.g = t1; rgb.r = t2; rgb.b = t2 + t3 }
                else if (h < 240) { rgb.b = t1; rgb.r = t2; rgb.g = t1 - t3 }
                else if (h < 300) { rgb.b = t1; rgb.g = t2; rgb.r = t2 + t3 }
                else if (h < 360) { rgb.r = t1; rgb.g = t2; rgb.b = t1 - t3 }
                else { rgb.r = 0; rgb.g = 0; rgb.b = 0 }
            }

            return { r: Math.round(rgb.r), g: Math.round(rgb.g), b: Math.round(rgb.b) };
        },
        rgbToHex : function (rgb) {
            var hex = [
                rgb.r.toString(16),
                rgb.g.toString(16),
                rgb.b.toString(16)
            ];
            hex.map(function(str,i){
                if (str.length == 1) {
                    hex[i] = '0' + str;
                }
            });

            return hex.join('');
        },
        hexToRgb : function (hex) {
            var hex = parseInt(((hex.indexOf('#') > -1) ? hex.substring(1) : hex), 16);
            return {r: hex >> 16, g: (hex & 0x00FF00) >> 8, b: (hex & 0x0000FF)};
        },
        hexToHsb : function (hex) {
            return this.rgbToHsb(this.hexToRgb(hex));
        },
        rgbToHsb : function (rgb) {
            var hsb = {h: 0, s: 0, b: 0};
            var min = Math.min(rgb.r, rgb.g, rgb.b);
            var max = Math.max(rgb.r, rgb.g, rgb.b);
            var delta = max - min;
            hsb.b = max;
            hsb.s = max != 0 ? 255 * delta / max : 0;
            if (hsb.s != 0) {
                if (rgb.r == max) hsb.h = (rgb.g - rgb.b) / delta;
                else if (rgb.g == max) hsb.h = 2 + (rgb.b - rgb.r) / delta;
                else hsb.h = 4 + (rgb.r - rgb.g) / delta;
            } else hsb.h = -1;
            hsb.h *= 60;
            if (hsb.h < 0) hsb.h += 360;
            hsb.s *= 100/255;
            hsb.b *= 100/255;
            return hsb;
        }
    };
    Colorpicker.DEFAULTS= {
        initColor:"rgb(255,0,0)",
        allMode:['hex','rgb']
    };
    window.Colorpicker = Colorpicker;

   /*选项卡*/
   function Tabs(elem,opt) {
       this.$element = $(elem);
       this.options = $.extend({}, Tabs.DEFAULTS, $.isPlainObject(opt) && opt);
       this.deleteBtn = this.options.isDelete?this.options.deleteBtn:null;
       this.addBtn = this.options.isAdd?this.options.addBtn:null;
       this.tab = [];
       this.deleteAfter = this.options.deleteAfter;
       this.tab_content = [];
       this.init();
   }
   Tabs.create = function (elem,opt) {
        var elemArr = $(elem);
        for(var i=0;i<elemArr.length;i++){
            elemArr[i].tabs = new Tabs(elemArr[i],opt);
        }
    };
   Tabs.prototype = {
       init:function () {
           this.tab = this.$element.find('.tab-header').find('li');
           this.tab_content =  this.$element.find('.tab-body').children();
           this.change(this.options.defaultVal);
           this.bind();
       },
       del:function (idx) {
           this.tab.eq(idx).remove();
           this.tab.splice(idx,1);
           this.tab_content.eq(idx).remove();
           this.tab_content.splice(idx,1);
           this.change(this.tab.eq(idx).length?idx:idx-1);
       },
       add:function (title,content) {
           var tab_title = document.createElement('li');
           tab_title.innerHTML = title + '<i class="tab-delete"></i>';
           this.tab.push(tab_title);
           this.$element.find('.tab-header ul').append(tab_title);
           var tab_content = document.createElement('div');
           tab_content.innerHTML = content;
           this.tab_content.push(tab_content);
           this.$element.find('.tab-body').append(tab_content);
       },
       change:function (idx) {
           this.tab.removeClass('on');
           this.tab.eq(idx).addClass('on');
           this.tab_content.removeClass('show');
           this.tab_content.eq(idx).addClass('show');
       },
       bind:function () {
           var that = this;
           this.$element.on('click','li',function (e) {
               that.change($(this).index());
           });

           if(this.deleteBtn){
               this.$element.on('click', that.deleteBtn,function (e) {
                   that.del($(this).parent().index());
                   if (typeof that.deleteAfter == 'function') that.deleteAfter($(this).parent());
               })
           }
           if(this.addBtn){
               this.$element.on('click', that.addBtn,function (e) {
                   that.add('1111','11111111111111');
               })
           }


       }
   };
   Tabs.DEFAULTS = {
        defaultVal: 0,
        isDelete:false,
        isAdd:false,
        deleteBtn:'.tab-delete',
        addBtn:'.tab-add',
        deleteAfter:''
   };
   window.Tabs = Tabs;

   /*进度条*/
   function Progress(elem,opt) {
       this.$element = $(elem);
       this.options = $.extend({}, Progress.DEFAULTS, $.isPlainObject(opt) && opt);
       this.textheight = null;
       this.percentValue = 0;
       this.canvas = null;
       this.init();
   }
   Progress.create = function (elem,opt) {
       var elemArr = $(elem);
       for(var i=0;i<elemArr.length;i++){
           elemArr[i].tabs = new Progress(elemArr[i],opt);
           return elemArr[i].tabs;
       }
   };
   Progress.prototype = {
       init:function () {
            this.render(this.options.type);
       },
       render:function (type) {
           switch(type){
               case 'bar':
                   this.drawBar();
                   break;
               case 'circle':
                   this.drawCircle();
                   break;
               case 'step':
                   this.drawStep();
                   break;
               case 'drag':
                   this.drawDrag();
                   break;
               default:
           }
       },
       /*普通条形进度条*/
       drawBar: function () {
           var setStripe = this.options.barStripe?'progress-striped':'';
           var setMove = this.options.isMove?'progress-animate':'';
           var bar = '<div class="progress-bar" style="width: 0;background-color: '+ this.options.bgColor +'">'+ this.setText(this.options.showText) +'</div>';
           var barWrap = '<div class="progress-wrap '+ setStripe +' '+ setMove +'">'+ bar +'</div>';
           this.$element.html(barWrap);
           this.setPercent(this.options.value);
       },
       setText: function (Text) {
           return this.options.showText?'<span>'+  Text +'%</span>':'';
       },
       /*步骤进度条*/
       drawStep: function () {
            var step_count  = this.options.step;
            this.$element.html('<div class="step"></div>');
            for(var i = 0;i< step_count;i++){
                var step_li = document.createElement('div');
                step_li.className = 'step-item';
                step_li.innerHTML = '<span>' + (i + 1);
                step_li.style.left = ((this.$element.width() / (step_count + 1) * (i + 1)) - 20 ) / this.$element.width() * 100 + '%';
                this.$element.children('div').append(step_li);
            }
            this.$element.children('div').append('<div class="step-process" style="background-color: '+ this.options.bgColor +'"></div>');
            this.setStep(this.options.currentStep);
       },
       setStep:function (i) {
            var step_now = 0;
            i >= this.options.step?step_now = this.options.step :step_now = i ;
            this.$element.find('.step-item').eq(step_now - 1).css('background-color', this.options.bgColor ).prevAll().css('background-color', this.options.bgColor );
            this.$element.find('.step-process').width(step_now === this.options.step ? '100%' : (100 / (this.options.step + 1) * step_now) + '%' );
            this.options.currentStep = step_now;
       },
       /*环形进度条*/
       drawCircle: function() {
           var t = this;
           this.canvas = document.createElement('canvas');
           this.canvas.width = t.$element.width() || t.$element.parent().width();
           this.canvas.height = t.$element.width() || t.$element.parent().width();
           t.$element.html(this.canvas);
           t.setPercent(parseInt(t.options.value));

           $(window).resize(function () {
               var rate = $(document).width()/1920;
               t.canvas.width = t.$element.width() || t.$element.parent().width();
               t.canvas.height = t.$element.width() || t.$element.parent().width();
               t.circle(t.options.rad, parseInt(t.options.value),parseInt(t.options.value),t.options.bgColor);
           });

       },
       circle: function(r, i, percent,bgColor) {
           var context = this.canvas.getContext("2d");
           context.clearRect(0, 0, this.canvas.width, this.canvas.width);
           context.beginPath();
           context.strokeStyle = '#eee';
           context.lineWidth = r;
           context.arc(this.canvas.width / 2, this.canvas.width / 2, this.canvas.width / 2 - r,  2*Math.PI, false);
           context.stroke();
           context.closePath();

           context.beginPath();
           context.strokeStyle = bgColor;
           context.lineCap = "round";
           context.lineWidth = r;
           context.arc(this.canvas.width / 2, this.canvas.width / 2, this.canvas.width / 2 - r, -0.5 * Math.PI, -0.5 * Math.PI + i * 0.02 * Math.PI, false);
           context.stroke();
           context.closePath();

           if(this.options.showText){
               context.beginPath();
               context.font =  (this.canvas.width / 2 -  r) / 2 + "px Arial";
               context.fillStyle = "#3f3a39";
               var text = percent ;
               textwidth = context.measureText(text).width;
               if (this.textheight == null) {
                   var div = document.createElement("div");
                   document.body.appendChild(div);
                   div.innerHTML = text;
                   div.style.fontSize = ((this.canvas.width/2 -  r) / 2) + "px";
                   this.textheight = this.canvas.width / 2 - r * 2 - ((this.canvas.width/2 -  r) / 2)/2;
                   div.parentNode.removeChild(div);
               }
               textheight = this.textheight;
               context.fillText(text, (this.canvas.width - textwidth) / 2, this.canvas.width / 2 + textheight / 4);
               context.fill();
               context.closePath();
           }

       },
       drawDrag: function () {
           var max = this.options.max?this.options.max:100;
           var min = this.options.min?this.options.step:0;
           var default_p = (this.options.value - min) / (max -  min) * 100;
           this.$element.append(' <div class="drag">\n' +
               '                            <div class="drag-process" style="width: '+ default_p +'%;background-color: '+ this.options.bgColor + '">\n' +
               '                                <div class="drag-block" style="background-color: '+ this.options.bgColor + '">\n' +
               '                                    <span class="drag-tag"  style="background-color: '+ this.options.bgColor + '">'+
                                                        this.options.value + this.options.unit +
                                                    '</span>\n' +
                                                    '<i style="border-top-color: '+ this.options.bgColor +'"></i>'+
               '                                </div>\n' +
               '                            </div>\n' +
               '                        </div>');

           var mouseX = 0,
               left = 0,
               isDrag = false,
               t = this;
           this.$element.find('.drag-block').bind('mousedown',function (e) {
               mouseX = e.clientX;
               left = $(this).position().left;
               isDrag = true;
               return false;
           });

           $(document).bind("mousemove", function (e) {
               if(isDrag){
                   t.setDrag(e.clientX - mouseX + left);
               }
           });

           $(document).bind("mouseup", function () {
               isDrag = false;
               return false;
           });

           this.$element.find('.drag').click(function (e) {
               t.setDrag(e.clientX -$(this).position().left);
           });
       },
       //配置拖动条
       setDrag: function (x) {
           var step = this.options.step?this.options.step:0;
           var max = this.options.max?this.options.max:100;
           var min = this.options.min?this.options.step:0;
           var decimal_num = step.toString().split('.')[1] ? step.toString().split('.')[1].length:0; //是否为小数

           // p为当前选择的位置占整个进度条的百分比
           var p = (x/ this.$element.width()) ;
           if(p > 1){
               p = 1;
           }else if(p < 0){
               p = 0;
           }
           var differValue =  p * (max - min) + min;
           var setStep = step ? (Math.round( differValue / step) * step).toFixed(decimal_num) : differValue;

           var stepPercent = step ? (setStep - min) / (max - min) * 100 : p *100;
           this.$element.find('.drag-process').width( stepPercent + '%');
           this.$element.find('.drag-tag').text( setStep + this.options.unit);
       },
       setPercent: function (percent) {
           this.percentValue = percent;
           if(this.options.type === 'bar'){
               //普通进度条
               this.$element.find('.progress-bar').css('width',this.percentValue+'%').html(this.setText(this.percentValue));
           }else if(this.options.type === 'circle'){
               //环境进度条
               var rate = $(document).width()/1920;
               var that = this;
               var i = 0;
               var interval = setInterval(function() {
                   i++;
                   that.circle(that.options.rad, i, i ,that.options.bgColor);
                   if (i >= parseInt(percent)) {
                       clearInterval(interval)
                   }
               },10);
           }
       }

   };
   Progress.DEFAULTS = {
        type: 'bar',
        value: 0,
        showText:false,
        barStripe:false,
        isMove:false,
        bgColor:'#0078ff',
        rad: 10,
        currentStep:1
    };
   window.Progress = Progress;

    /*分页*/
    function Page(elem,opt) {
        this.$element = $(elem);
        this.options = $.extend({}, Page.DEFAULTS, $.isPlainObject(opt) && opt);
        this.pageCount = 0;
        this.currentLimit = this.options.limit;
        this.currentPage = this.options.currentPage || 1;
        this.init();

    }
    Page.create = function (elem,opt) {
        var elemArr = $(elem);
        for(var i=0;i<elemArr.length;i++){
            elemArr[i].tabs = new Page(elemArr[i],opt);
            // return elemArr[i].tabs;
        }
    };
    Page.prototype = {        
        init: function () {
            this.$element[0].className = 'page';
            this.render();

        },
        render: function () {

            var page_layout = new Object();
            page_layout.page = this.page(this.currentPage);
            var isFirst = this.currentPage === 1;
            var isLast = this.currentPage === this.pageCount;
            page_layout.prev = isFirst?'<a class="prev" href="javascript:;" disabled>'+ this.options.prev +'</a>':'<a class="prev" href="javascript:;" >'+ this.options.prev +'</a>';
            page_layout.next = isLast?'<a class="next" href="javascript:;" disabled>'+ this.options.next +'</a>':'<a class="next" href="javascript:;" >'+ this.options.next +'</a>';
            page_layout.count = '<span class="count">共 '+ this.options.count +' 条记录</span>';
            page_layout.limit = this.limit();
            page_layout.skip = '<span>跳到 <input class="skip" type="text" value="1"/> 页</span>';

            this.$element.empty();
            for(var i = 0;i<this.options.layout.length;i++){
                for(var k in page_layout){
                    k === this.options.layout[i]?this.$element.append(page_layout[k]):'';
                }
            }
            this.bind();
        },
        limit:function () {
            var select_html = '<select>';
            for(var i = 0;i<5;i++){
                var limit_num = this.options.limit + this.options.limitGap * i;
                var isSelect = this.currentLimit === limit_num ?'selected':'';
                select_html += '<option value="'+limit_num+'" '+ isSelect +'>'+limit_num+' 条 / 页</option>';
            }
            select_html +='</select>';
            return select_html;

        },
        page: function (num) {
            this.pageCount = Math.ceil(this.options.count / this.currentLimit);
            var isMax = this.pageCount > this.options.group? this.options.group : this.pageCount;
            var page_html = '',isActive ='';

            if(this.pageCount > this.options.group && num >= this.options.group){
                page_html += '<a href="javascript:;" class="num" data-page="1">1</a>';
                page_html += '<span>...</span>';
            }

            //设置中间页数要循环的最大值最小值
            var loop_min = 0,loop_max = 0;
            if(num < this.options.group){
                loop_min = 0;
                loop_max = isMax
            }else if(num > this.pageCount - Math.ceil(this.options.group / 2)){
                loop_min = this.pageCount - this.options.group;
                loop_max = this.pageCount
            }else{
                loop_min = num - Math.ceil(this.options.group / 2);
                loop_max = num + Math.floor(this.options.group / 2);
            }

            for(var i =loop_min ; i <loop_max ; i++){
                isActive = (i + 1) === num ? 'class="on"':'class="num"';
                page_html += '<a href="javascript:;" '+ isActive +' data-page="'+ (i+1) +'">'+ (i+1) +'</a>';
            }

            if(this.pageCount > this.options.group && num < this.pageCount - Math.floor((this.options.group)/ 2)){
                if(num < this.pageCount - Math.ceil((this.options.group + 1) / 2)){
                    page_html += '<span>...</span>';
                }
                page_html += '<a href="javascript:;" class="num" data-page="'+ this.pageCount +'">'+ this.pageCount +'</a>';
            }
            return page_html;
        },
        bind: function () {
            //事件
            var t = this;
            //上一页
            t.$element.find('.prev').on('click',function () {
                if(t.currentPage !==1){
                    t.jump(--t.currentPage);
                }
            });
            //下一页
            t.$element.find('.next').on('click',function () {
                if(t.currentPage !== t.pageCount) {
                    t.jump(++t.currentPage);
                }
            });
            //页数
            t.$element.find('.num').on('click',function () {
                t.jump(parseInt($(this).attr('data-page')));
            });
            //跳转页
            t.$element.find('input').on('blur',function () {
                if(parseInt($(this).val()) < 1){
                    t.jump(1)
                }else if(parseInt($(this).val()) > t.pageCount){
                    t.jump(t.pageCount)
                }else{
                    t.jump(parseInt($(this).val()))
                }

            });
            //回车
            t.$element.find('input').on('focus',function () {
                var $this = $(this);
                document.onkeydown = function (e) {
                    if (!e) e = window.event;
                    if ((e.keyCode || e.which) == 13) {
                        $this.blur();
                    }
                }

            });
            //每页显示
            t.$element.find('select').on('change',function () {
                t.currentLimit = parseInt($(this).val());
                t.pageCount = Math.ceil(t.options.count / t.currentLimit);
                if(t.currentPage>t.pageCount){
                    t.jump(t.pageCount);
                }
                t.render();
            });
            //
            this.options.change && this.options.change.call(this,{
                page: this.currentPage,
                total: this.pageCount,
                limit: this.currentLimit
            });

        },
        jump: function (num) {
            this.currentPage = num;
            this.render();
        }

    };
    Page.DEFAULTS = {
        count:100,  //记录数
        limit:10,   //每页显示数
        limitGap:5,
        currentPage: 1,  //当前页
        layout:['prev','page','next','limit','skip','count'],   //显示布局
        group:5,       // 5 页为一组
        first: '首页',  //跳到第一页的文字
        last:'尾页',    //跳到最后一页的文字
        prev:'上一页',   //跳到上一页的文字
        next:'下一页',   //跳到下一页的文字,
        change:null
    };
    window.Page = Page;

    /*弹出层*/
    function Pop() {
        for(var i = 0 ; i < arguments.length;i++) {
            if(arguments[i] instanceof Array){
                this.photoList = arguments[i];
            } else if (typeof  arguments[i] === 'number') {
                this.type = arguments[i];
            } else if (typeof  arguments[i] === 'string') {
                this.content = arguments[i];
            } else {
                this.options = $.extend({}, Pop.DEFAULTS, $.isPlainObject(arguments[i]) && arguments[i]);
            }
        }
        this.mask = null;
        this.pop = null;
        this.photoCount = 0;
        this.currentScale = [];
        this.currentRotate = [];
        this.init();
    }
    Pop.alert = function (content,opt) {
        new Pop(1,content,$.extend({
            btn:['确定']
        }, opt));
    };
    Pop.confirm = function (content,opt) {
        new Pop(2,content,opt);
    };
    Pop.prompt = function (opt) {
        new Pop(3,opt);
    };
    Pop.msg = function (content, opt) {
        new Pop(4, content, $.extend({
            mask:false
        }, opt))
    };
    Pop.tips = function (content,btn, opt) {
        new Pop(5, content, $.extend({
            popBtn :{
                top :$(btn).offset().top,
                left :$(btn).offset().left,
                width :$(btn).innerWidth(),
                height: $(btn).innerHeight()
            },
            mask:false
        }, opt));
    };
    Pop.closeAll = function () {
        $('.pop').remove();
        $('.pop-mask').remove();
    };
    Pop.create = function (type,content,opt) {
        new Pop(type,content,$.extend({
            btn:false
        }, opt));
    };
    Pop.photo = function (imgList,opt) {
        new Pop(8,imgList,$.extend({
            btn:false,
            maskClose:true
        }, opt));
    };
    Pop.prototype = {
        init: function () {
            this.render();
            this.bind();
        },
        render:function () {
            this.pop = $('<div class="pop"></div>').appendTo('body');
            this.showMask();
            this.options.area? this.pop.css({
                width: this.options.area[0],
                height: this.options.area[1]
            }):'';
            var type = this.type;
            switch(type){
                case 4:
                    /*消息框*/
                    if($(".pop-msg").length){
                        $('.pop-msg').remove();
                    }
                    this.pop.append(this.showMsg());
                    this.hideTimeOut();
                    this.setPosition();
                    break;
                case 5:
                    /*提示框*/
                    if($(".pop-tips").length){
                        $('.pop-tips').remove();
                    }
                    this.pop.append('<div class="pop-tips">' + this.content + '</div>');
                    this.setTips(this.options.position);
                    this.hideTimeOut();
                    break;
                case 6:
                    /*page*/
                    this.pop.addClass('pop-page').append(this.showDialog());
                    this.setPosition();
                    break;
                case 7:
                    /*iframe*/
                    this.pop.addClass('pop-page').append(this.showIframe());
                    this.setPosition();
                    break;
                case 8:
                    /*photo*/
                    this.pop.addClass('pop-photo').append(this.showPhoto());
                    break;
                default:
                    this.pop.append(this.showDialog());
                    this.pop.addClass('pop-dialog');
                    this.setPosition();
                    break;
            }

        },
        showDialog: function () {
            var dialog_input = this.type === 3? '<input type="text" class="input-skin"/>':this.content;
            var body_html = '<div class="pop-body">' + dialog_input  + '</div>';
            return (this.showHeader() + this.showClose() + body_html + this.showBtn(this.options.btn));
        },

        showIframe: function () {
            var body_html = '<div class="pop-body" style="height:' + (this.options.area[1] - 41)  + 'px;"><iframe width="100%" height="100%" frameborder="0" src="'+ this.content +'"></iframe></div>';
            return (this.showHeader() + this.showClose() + body_html + this.showBtn(this.options.btn));
        },

        showPhoto: function () {
            this.photoCount = this.photoList.length;
            var body_html = '<div class="pop-photo-wrap"><span class="pop-close fa fa-close"></span><a href="javascript:;" class="fa fa-angle-left left-btn"></a><div class="pop-photo-item">' +
                '<ul style="left:'+ (-this.options.currentPhotoIndex * $(window).width()*0.8) +'px">';
            for(var i = 0 ;i < this.photoCount; i++){
                body_html += '<li><div><div class="img-box" style="height:'+ ($(window).height()* 0.8).toFixed(1) +'px"><img class="img-item" src="'+ this.photoList[i] +'"/></div></div></li>';
                this.currentScale[i] = 1;
                this.currentRotate[i] = 0;
            }

            body_html += '</div><a href="javascript:;" class="fa fa-angle-right right-btn"></a></ul>' +
                '<div class="photo-tool">' +
                '<div class="photo-num">1/'+this.photoCount+'</div>' +
                '<a href="javascript:;" title="左转" class="fa fa-rotate-left" id="turnLeft"></a>' +
                '<a href="javascript:;" title="右转" class="fa fa-rotate-right" id="turnRight"></a>' +
                '<a href="javascript:;" title="放大" class="fa fa-search-plus" id="zoomUp"></a>' +
                '<a href="javascript:;" title="缩小" class="fa fa-search-minus" id="zoomDown"></a>' +
                '<a href="javascript:;" title="恢复" class="fa fa-photo" id="photoRecover"></a>' +
                '<a href="javascript:;" title="下载" class="fa fa-download" id="photoDownload"></a>' +
                '</div></div>';
            return body_html;
        },

        photoSlideTo:function (i) {
            this.pop.find('.photo-num').text();
            var slide_item = this.pop.find('ul');
            slide_item.css({'left': - slide_item.innerWidth() * i});
            this.pop.find('.photo-num').text( (i+1) + '/'+ this.photoCount );
        },

        photoZoom: function (i,zoomVal) {
            this.pop.find('li').children().eq(i).css({'transform':  'scale('+ zoomVal +')'});
            if(zoomVal > 1){
                this.pop.find('li').find('img').parent().addClass('grab');
            }else{
                this.pop.find('li').find('img').parent().removeClass('grab');
            }
        },

        turnRotate: function (i) {
            this.pop.find('li').find('img').eq(i).css({'transform':'rotate('+ this.currentRotate[i] +'deg)'});
        },

        photoRecover: function (i) {
            this.currentScale[i] = 1;
            this.currentRotate[i] = 0;
            this.photoZoom(i,1);
            this.turnRotate(i);
        },

        photoDownload: function (i,e) {
            $(e).attr({
                'href':this.photoList[i],
                'download': new Date().getTime()
            });
        },

        showMsg: function () {
            return '<div class="pop-msg">'+ this.content + '</div>';
        },

        setPosition: function () {
            var w_w = $(window).width();
            var w_h = $(window).height();
            var p_w = this.pop.width();
            var p_h = this.pop.height();
            this.pop.css({
                left:(w_w - p_w) / 2,
                top:(w_h - p_h) / 2
            });
        },

        setTips: function (p) {
            var p_class_name = '';
            var tips_w = this.pop.find('.pop-tips').innerWidth();
            var tips_h = this.pop.find('.pop-tips').innerHeight();
            var top = 0,left = 0;

            switch (p){
                case 1:
                    p_class_name = 'pop-tips-top';
                    top = this.options.popBtn.top - tips_h - 6;
                    left = this.options.popBtn.left - ((tips_w - this.options.popBtn.width) / 2);
                    break;
                case 2:
                    p_class_name = 'pop-tips-right';
                    top = this.options.popBtn.top + ((this.options.popBtn.height - tips_h ) / 2);
                    left = this.options.popBtn.left + this.options.popBtn.width + 6;
                    break;
                case 3:
                    p_class_name = 'pop-tips-bottom';
                    top = this.options.popBtn.top + this.options.popBtn.height + 6;
                    left = this.options.popBtn.left - ((tips_w - this.options.popBtn.width) / 2);
                    break;
                case 4:
                    p_class_name = 'pop-tips-left';
                    top = this.options.popBtn.top + ((this.options.popBtn.height - tips_h ) / 2);
                    left = this.options.popBtn.left - tips_w - 6;
                    break;
            }
            this.pop.children().addClass(p_class_name);
            this.pop.css({
                top: top,
                left: left
            });

        },

        hideTimeOut:function () {
            this.options.time?setTimeout($.proxy(function () {
                this.close();
            },this),this.options.time):'';
        },

        showHeader: function () {
            return this.options.title ? '<div class="pop-header">'+ this.options.title + '</div>':'';
        },
        showClose: function () {
            var closeBtn = '<a href="javascript:;" class="pop-close"></a>';
            return this.options.close ? closeBtn:'';
        },
        showBtn: function (btnArray) {
            var btn_html = '';
            for (var i = 0;i < btnArray.length;i++){
                btn_html += '<a href="javascript:;" class="pop-btn">' + btnArray[i]+ '</a>'
            }
            var footer_html = this.options.btn?'<div class="pop-footer">'+ btn_html +'</div>':'';

            return footer_html;
        },
        showMask: function () {
            this.mask = this.options.mask ? $('<div class="pop-mask" style="background-color: '+ this.options.maskColor +'"></div>').appendTo('body'):'';
        },
        close: function () {
            this.pop.remove();
            this.mask ?this.mask.remove():'';
        },
        closeAll: function () {
            $('.pop').remove();
            $('.pop-mask').remove();
        },
        bind: function () {
            var t = this;
            this.pop.find('.pop-close').click(function () {
                t.close();
            });

            $(window).resize(function () {
                t.setPosition();
            });

            $(window).keyup(function(event) {
                if (event.keyCode == 27) t.close();
            });

            t.pop.find('.pop-btn').eq(0).click(function () {
                var retrunVal = t.pop.find('input').val() && t.pop.find('input').val()!==''?{val: t.pop.find('input').val()}:{};
                t.options.btn0 && t.options.btn0.call(this,retrunVal);
                if(t.pop.find('input').val() !== ''){
                    t.close();
                }
            });

            t.pop.find('.pop-btn').eq(1).click(function () {
                t.options.btn1 && t.options.btn1.call(this,{});
                t.close();
            });

            t.pop.find('.pop-photo-item').click(function(event) {
                t.close();
            });

            if(this.type === 8){
                t.pop.find('.left-btn').click(function () {
                    t.photoSlideTo(t.options.currentPhotoIndex <= 0? 0 :--t.options.currentPhotoIndex);
                });
                t.pop.find('.right-btn').click(function () {
                    t.photoSlideTo(t.options.currentPhotoIndex >= t.photoCount -1? t.options.currentPhotoIndex :++t.options.currentPhotoIndex );
                });
                t.pop.find('#zoomUp').click(function () {
                    var i = t.options.currentPhotoIndex;
                    var zoomVal = (t.currentScale[i] < t.options.zoomMax?t.currentScale[i] += 0.1:t.options.zoomMax).toFixed(1);
                    t.photoZoom(i,zoomVal);
                });
                t.pop.find('#zoomDown').click(function () {
                    var i = t.options.currentPhotoIndex;
                    var zoomVal = (t.currentScale[i] > t.options.zoomMin +0.1?t.currentScale[i] -= 0.1:t.currentScale[i]).toFixed(1);
                    t.photoZoom(t.options.currentPhotoIndex,zoomVal);
                });
                t.pop.find('#photoDownload').click(function () {
                    t.photoDownload(t.options.currentPhotoIndex,this);
                });
                t.pop.find('#turnLeft').click(function () {
                    var i = t.options.currentPhotoIndex;
                    t.currentRotate[i] -= 90;
                    t.turnRotate(i);
                });
                t.pop.find('#turnRight').click(function () {
                    var i = t.options.currentPhotoIndex;
                    t.currentRotate[i] += 90;
                    t.turnRotate(i);
                });
                t.pop.find('#photoRecover').click(function () {
                    var i = t.options.currentPhotoIndex;
                    t.photoRecover(i);
                });
                t.pop.find('li').on('mousedown','.grab',function (e) {
                    var starX = e.clientX;
                    var starY = e.clientY;
                    var curX = parseFloat($(this).css('left'));
                    var curY = parseFloat($(this).css('top'));
                    $(this).addClass('grabbing');
                    t.pop.find('li').on('mousemove','.grabbing',function (e) {
                        e.preventDefault();
                    });
                });
                t.pop.find('li').on('mouseup','.grab',function (e) {
                    $(this).removeClass('grabbing');
                });

            }
        }

    };
    Pop.DEFAULTS = {
        mask:true,
        maskColor: 'rgba(0,0,0,0.5)',
        close: true,
        title:'标题',
        icon:false,
        position:1,
        btn:['确定','取消'],
        fixed:false,
        time:2000,
        currentPhotoIndex:0,
        zoomMax: 3,
        zoomMin:0.5
    };
    window.Pop = Pop;

    /*轮播*/
    function Carousel(elem,opt) {
        this.$element = $(elem);
        this.width = this.$element.width();
        this.height = this.$element.height();
        this.options = $.extend({}, Carousel.DEFAULTS, $.isPlainObject(opt) && opt);
        this.$prev = this.$element.find(this.options.prev);
        this.$next = this.$element.find(this.options.next);
        this.$pagination = this.$element.find(this.options.pagination);
        this.slideCount = this.$element.find('.carousel-item li').length;
        this.currentSlide = this.options.loop? ((this.options.current+1) || 1):(this.options.current || 0);
        this.$carousel = this.$element.find('.carousel-item');
        this.loop = this.options.animate === 'leftLoop' || this.options.animate === 'topLoop';
        this.init();

    }

    Carousel.create = function (elem,opt) {
        var elemArr = $(elem);
        for(var i=0;i<elemArr.length;i++){
            new Carousel(elemArr[i],opt);
        }
    };

    Carousel.prototype = {
        init: function () {
            this.render();
            this.bind();

        },

        render: function () {

            for(var i = 0; i < this.slideCount; i++){
                this.$pagination.append('<i></i>');
            }
            this.slideDotted();
            if(this.loop){
                var firstSlide = this.$carousel.find('li').first().clone();
                var lastSlide = this.$carousel.find('li').last().clone();
                this.$carousel.append(firstSlide);
                this.$carousel.prepend(lastSlide);
                this.$carousel.css({'left': -this.$carousel.find('li').width()});
                this.currentSlide = 1;
                this.slideCount += 2;
            }
            this.renderSize();
        },
        renderSize: function () {
            if(this.options.animate.indexOf('top')>-1){
                this.$carousel.width(this.width);
                this.$carousel.parent().height(this.height);
            }if(this.options.animate.indexOf('left')>-1){
                this.$carousel.width(this.width * this.slideCount);
                this.$carousel.find('li').width(this.width);
            }
        },

        slideTo: function (i) {
            this.currentSlide = i;
            var effect = this.options.animate,t = this;

            switch (effect){
                case "left":
                    this.$carousel.stop(!0,!0).animate({
                        'left': -this.$carousel.find('li').width() * i
                    }, this.options.interTime,this.options.easing);
                    t.slideDotted(t.currentSlide);
                    break;

                case "top":
                    this.$carousel.stop(!0,!0).animate({
                        'top': -this.$carousel.find('li').height() * i
                    }, this.options.interTime,this.options.easing);
                    t.slideDotted(t.currentSlide);
                    break;

                case "leftLoop":
                    this.$carousel.stop(!0,!0).animate({
                        'left': -this.$carousel.find('li').width() * i
                    }, this.options.interTime,this.options.easing,function () {
                        if(i === 0){
                            t.currentSlide = t.slideCount - 2;
                            t.$carousel.css({'left': -t.$carousel.find('li').width() * t.currentSlide})
                        }
                        if(i === t.slideCount - 1){
                            t.currentSlide = 1;
                            t.$carousel.css({'left': -t.$carousel.find('li').width() * t.currentSlide})
                        }
                        t.slideDotted(t.currentSlide);
                    });

                    break;

                case "topLoop":
                    this.$carousel.stop(!0,!0).animate({
                        'top': -this.$carousel.find('li').height() * i
                    }, this.options.interTime,this.options.easing);
                    t.slideDotted(t.currentSlide);
                    break;

                case "fade":
                    this.$carousel.children().hide();
                    this.$carousel.children().eq(i).stop(!0,!0).animate({
                        'opacity': 'show'
                    }, this.options.interTime,this.options.easing);
                    t.slideDotted(t.currentSlide);
                    break;
            }

        },

        slideDotted: function (i) {
            this.$pagination.children().removeClass('active').eq( i ? (this.options.animate==='leftLoop' || this.options.animate==='topLoop'?(i-1):i) : this.options.current).addClass('active');
        },
        
        bind: function () {
            var t = this;
            this.$prev.click(function (e) {
                var i = t.currentSlide > 0 ? --t.currentSlide:t.slideCount - 1;
                t.slideTo(i);
            });

            this.$next.click(function (e) {
                var i = t.currentSlide < t.slideCount - 1 ? ++t.currentSlide : ++t.currentSlide%t.slideCount;
                t.slideTo(i);
            });

            this.$pagination.find('i').click(function (e) {
                var i = $(this).index();
                t.slideTo(i);
            });

            if(t.options.autoplay){
                var interval = typeof t.options.autoplay === 'boolean'? 3000 : t.options.autoplay;
                setInterval(function () {
                    var slidePage = ++t.currentSlide % t.slideCount;
                    t.slideTo(slidePage);
                },interval);
            }
            
            $(window).resize(function () {
                t.width = t.$element.width();
                t.height = t.$element.height();
                t.renderSize();
            })

        }
    };

    Carousel.DEFAULTS = {
        animate: 'left',  //轮播效果
        autoplay: false,  //设置自动播放时间
        interTime: 100, //运行速度
        current: 0,  //指定当前初始页
        easing: 'swing'  //运行动画， swing 开始跟结束缓慢，中间快  ,linear 匀速

    };

    window.Carousel = Carousel;


    function Upload(elem, opt) {
        this.$element   = $(elem);
        this.options    = $.extend({}, Upload.DEFAULTS, $.isPlainObject(opt) && opt);
        this.$input     = null;
        if (this.$element.siblings("ul").length > 0) {
            this.$list          = this.$element.siblings("ul");

            this.uploadCount    = this.$list.find("li").length;
        } else {
            this.$list          = $('<ul class="upload-thumb icon-list"></ul>');
            this.uploadCount    = 0;
        }
        this.accept         = this.$element.data('accept') ? this.$element.data('accept') : '*';
        this.name           = this.$element.data('name');
        this.ext            = this.$element.data('ext') ? this.$element.data('ext') : '';

        //上传个数限制
        var uploadNum       = this.$element.data("multiple"); 
        this.max            = 1; 

        this.multiple       = uploadNum ? true : false;

        if (typeof uploadNum != 'boolean') {
            //传数字时，为限制个数
            this.max        = uploadNum > 1 ? uploadNum : 1;
        } else if (this.multiple) {
            //默认最大上传数为8条
            this.max        = 8;
        }

        this.init();
    }

    Upload.create = function (elem, opt) {
        var elemArr = $(elem);
        for(var i=0;i<elemArr.length;i++){
            new Upload(elemArr[i],opt);
        }
    };

    Upload.prototype = {
        init: function () {
            this.multiple = this.multiple? 'multiple="multiple" ':'';
            this.$input = $('<input type="file" class="uploadInput" accept="' + this.accept + '" '+ this.multiple +'/>').insertAfter(this.$element);
            this.$list.insertAfter(this.$input);
            this.bind();
        },

        isFiles: function (fileName) {
            var extArr = new Array();
            extArr[0] = '.gif|.jpg|.jpeg|.png'; //图片
            extArr[1] = '.zip|.rar';           //压缩文件
            extArr[2] = '.doc|.docx|.rtf';     //word文档
            extArr[3] = '.xls|.xlsx';          //excel文件
            extArr[4] = '.ppt|.pptx';          //ppt文件
            extArr[5] = '.mp4|.avi|.mov|.rm|.rmvb|.mpeg|.flv';    //视频文件
            extArr[6] = '.wav|.mp3|.wma|.midi|.ogg';             //音频文件
            extArr[7] = '.htm|.html|.css|.js|.php|.java|.scss|.sass';     //源代码文件
            extArr[8] = '.txt';     //源代码文件

            for(var i = 0 ;i <extArr.length;i++){
                var regStr = '('+extArr[i]+')$';
                var reg = new RegExp(regStr);
                if(reg.test(fileName)){
                    return i;
                }
            }

        },
        fileType: function (file, imgid, imgpath) {
            if(this.max == 1){
                this.$list.empty();
            }
            var fileName = file.name;
            switch (this.isFiles(fileName)){
                case 0:
                    // this.$list.append('<li><span class="fa fa-file-image-o"></span><a href="javascript:;">删除</a></li>');
                    this.reviewImage(file, imgid, imgpath);
                    break;
                case 1:
                    this.$list.append('<li><span class="fa fa-file-zip-o"></span><a class="upload-delete" href="javascript:;" data-id="'+imgid+'"><i class="iconfont">&#xe617;</i></a></li>');
                    break;
                case 2:
                    this.$list.append('<li><span class="fa fa-file-word-o"></span><a class="upload-delete" href="javascript:;" data-id="'+imgid+'"><i class="iconfont">&#xe617;</i></a></li>');
                    break;
                case 3:
                    this.$list.append('<li><span class="fa fa-file-excel-o"></span><a class="upload-delete" href="javascript:;" data-id="'+imgid+'"><i class="iconfont">&#xe617;</i></a></li>');
                    break;
                case 4:
                    this.$list.append('<li><span class="fa fa-file-powerpoint-o"></span><a class="upload-delete" href="javascript:;" data-id="'+imgid+'"><i class="iconfont">&#xe617;</i></a></li>');
                    break;
                case 5:
                    this.$list.append('<li><span class="fa fa-file-movie-o"></span><a class="upload-delete" href="javascript:;" data-id="'+imgid+'"><i class="iconfont">&#xe617;</i></a></li>');
                    break;
                case 6:
                    this.$list.append('<li><span class="fa fa-file-audio-o"></span><a class="upload-delete" href="javascript:;" data-id="'+imgid+'"><i class="iconfont">&#xe617;</i></a></li>');
                    break;
                case 7:
                    this.$list.append('<li><span class="fa fa-file-code-o"></span><a class="upload-delete" href="javascript:;" data-id="'+imgid+'"><i class="iconfont">&#xe617;</i></a></li>');
                    break;
                case 8:
                    this.$list.append('<li><span class="fa fa-file-text-o"></span><a class="upload-delete" href="javascript:;" data-id="'+imgid+'"><i class="iconfont">&#xe617;</i></a></li>');
                    break;
                default:
                    this.$list.append('<li><span class="fa fa-file-o"></span><a class="upload-delete" href="javascript:;" data-id="'+imgid+'"><i class="iconfont">&#xe617;</i></a></li>');
                    break
            }
            this.uploadCount++;
        },
        
        reviewImage: function (file, imgid,imgpath) {
            var t = this;
            var reader = new FileReader();
            reader.onload = function(e) {
                var data = e.target.result;
                t.$list.append('<li>\
                    <a href="'+imgpath+'" class="lightbox" title="图片" style="display: block;background-color:transparent">\
                        <img src="'+ imgpath +'"/>\
                    </a>\
                    <a href="javascript:;" class="upload-delete" data-id="'+imgid+'">\
                        <i class="iconfont">&#xe617;</i>\
                    </a>\
                    </li>'
                );
            };
            reader.readAsDataURL(file);
        },
        
        delete: function (this_obj) {
            this_obj.remove();
            this.uploadCount--;
        },
        
        bind: function () {
            var t = this;
            this.$element.click(function () {
                t.$input.trigger('click');
            });

            this.$input.change(function () {
                var showType = t.options.show;
                var files = $(this).prop('files');
                if(!files.length){
                    return false;
                }
                if((t.max > 1 && t.uploadCount > t.max) || (len + t.uploadCount) > t.max){
                    layer.msg('超过最大上传数！', {time:1500,icon:3});
                    return
                }
                layer.load();
                var formData = new FormData();
                for(var i = 0, len = files.length;i<files.length; i++){
                    formData.append("file",files[i]);
                    t.upload(formData, files[i]);
                }
            });
            //删除文件
            t.$list.on('click','a.upload-delete',function () {
                var img_id = $(this).data("id");
                var init_val = $("#"+t.name).val();
                var val_arr = init_val.split(",");
                for (var i= 0,len = val_arr.length; i < len; i++) {
                    if (img_id == val_arr[i]) {
                        val_arr.splice(i,1);
                    }
                }
                $("#"+t.name).val(val_arr.join(","));
                t.delete($(this).parents('li'));
            })
        },
        upload:function(dat, imgdat){
            var t = this;
            $.ajax({
                type:"post",
                url:"/index.php/index/Upload/index.html?ext="+this.ext,
                async:false,
                cache:false,//不需要缓存操作
                data:dat,//传递的参数就是FormData
                contentType:false,//由于提交的对象是FormData,所以要在这里更改上传参数的类型
                processData:false,//提交对象是FormData,不需要对数据做任何处理
                success:function(data){
                    if (data.status == 1) {
                        var file_id = data.info.id;
                        //预览
                        t.fileType(imgdat, file_id, data.info.path);
                        if (t.name.indexOf(']')!= -1) {
                            //上传文件的id
                            var init_val = $("input[name='"+t.name+"']").val();
                            //单传
                            if (!t.multiple || !init_val) {
                                $("input[name='"+t.name+"']").val(file_id);
                                //多传
                            } else {
                                $("input[name='"+t.name+"']").val(init_val + "," + file_id);
                            }
                        } else {
                            //上传文件的id
                            var init_val = $("#"+t.name).val();
                            //单传
                            if (!t.multiple || !init_val) {
                                $("#"+t.name).val(file_id);
                                //多传
                            } else {
                                $("#"+t.name).val(init_val + "," + file_id);
                            }
                        }
                        layer.closeAll();
                    } else {
                        layer.msg(data.info,{time:2500,icon:2},function(){
                            layer.closeAll();
                        });
                    }
                },
                error:function(){
                    layer.msg("上传失败！",{time:2500,icon:2});
                }
            })
        }        
    };

    window.Upload = Upload;

})();

/*显示 HTML原代码*/
var entityMap = {
    '&': '&amp;',
    '<': '&lt;',
    '>': '&gt;',
    '"': '&quot;',
    "'": '&#39;',
    '/': '&#x2F;',
    '`': '&#x60;',
    '=': '&#x3D;'
};

function escapeHtml (string) {
    return String(string).replace(/[&<>"'`=\/]/g, function (s) {
        return entityMap[s];
    });
}



