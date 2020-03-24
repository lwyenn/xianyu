(function () {
    /* 地址选择器 */
    var PROVINCE = 'province';
    var CITY = 'city';
    var DISTRICT = 'district';


    if (typeof provice === 'undefined') {
        throw new Error('请先引入 address-data.js 文件');
    }

    function Addresspicker(element, opt) {
        this.$element = $(element);
        this.$dropdown = null;
        this.options = $.extend({}, Addresspicker.DEFAULTS, $.isPlainObject(opt) && opt);

        this.level = [PROVINCE,CITY,DISTRICT];
        this.dems = [];
        this.needBlur = false;
        this.init();
    }

    Addresspicker.create = function (elem ,opt) {
        var elemArr = $(elem);
        for(var i=0;i<elemArr.length;i++){
            elemArr[i].addresspicker = new Addresspicker(elemArr[i],opt);
        }
    };

    Addresspicker.prototype = {
        render : function () {
            var p = this.position(),
                dropdown = '<div class="city-picker"><ul></ul><div class="city-picker-footer clear borderT">' +
                    '<div class="fr"><a href="javascript:; "  class="btn btn-link clear-btn">清空</a><a href="javascript:;" class="btn btn-primary btn-sm submit-btn">确定</a></div></div></div>';

            this.$element.addClass('city-picker-input');
            this.$dropdown = $(dropdown).insertAfter(this.$element);

            this.refresh();
        },
        init : function () {
            this.defineDems();
            this.render();
            this.bind();
        },
        defineDems : function () {
            var stop = false;
            $.each(this.level, $.proxy(function (i,type) {
                if(!stop){
                    this.dems.push(type);
                }
                if(type === this.options.level){
                    stop = true;
                }
            },this))
        },

        refresh : function (force) {
            var val = (this.$element.val() || '').split(' ');
            $.each(this.dems,$.proxy(function (i,type) {
                if(val[i] && i<val.length){
                    this.options[type] = val[i];
                    this.options[type + 'Id'] = this.getIndex(type,val[i]);
                }else if(force){
                    this.$dropdown.find('li.'+type).remove().prevAll().remove();
                    this.options[type] = '';
                    this.options[type+'Id'] = '';
                }
                this.output(type,this.options[type + 'Id']);
            },this));
        },
        getName : function () {
            var isNullP = !(this.options['provinceId'] === undefined || this.options['provinceId'] === '');
            var isNullC = !(this.options['cityId'] === undefined || this.options['cityId'] === '');
            var isNullD = !(this.options['districtId'] === undefined || this.options['districtId'] === '');

            var p_name = isNullP ? provice[this.options['provinceId']].name:'';
            var c_name = isNullP && isNullC ?provice[this.options['provinceId']].city[this.options['cityId']].name:'';
            var d_name = isNullP && isNullC && isNullD ?provice[this.options['provinceId']].city[this.options['cityId']].area[this.options['districtId']]:'';
            return p_name + ' ' + c_name + ' ' + d_name;
        },
        getIndex : function(type,name){
            var index = '';
            $.each(provice,function (i,v) {
                if(type === 'province' && name === v.name){
                    index = i
                }else{
                    $.each(provice[i].city,function (idx,val) {
                        if(type === 'city' && name === val.name) {
                            index = idx
                        }else{
                            $.each(provice[i].city[idx].area,function (indx,value) {
                                if(type === 'district' && name === value){
                                    index = indx;
                                }
                            })
                        }
                    })
                }
            });
            return index;
        },
        output : function (type) {
            var $select = this.$dropdown.find('ul');
            var data = [], address = '';
            switch (type){
                case PROVINCE:
                    data = provice;
                    break;
                case CITY :
                    var isNullP = !(this.options['provinceId'] === undefined || this.options['provinceId'] === '');
                    var isNullP = !(this.options['provinceId'] === undefined || this.options['provinceId'] === '');
                    data = isNullP?provice[this.options['provinceId']].city:'';
                    break;
                case DISTRICT :
                    var isNullP = !(this.options['provinceId'] === undefined || this.options['provinceId'] === '');
                    var isNullC = !(this.options['cityId'] === undefined || this.options['cityId'] === '');
                    data = isNullP && isNullC?provice[this.options['provinceId']].city[this.options['cityId']].area:'';
                    break;
            }
            this.getList(data,type)?$select.append('<li class="'+ type +'">'+ this.getList(data,type) +'</li>'):'';
        },

        getList : function (data,type) {
            var list = [];
            $.each(data , $.proxy(function (i,n) {
                var seleced = i=== this.options[type+'Id']?'class="on"':'';
                list.push('<span data-id="'+ i  +'"  '+ seleced +'>'+ (n.name?n.name:n) +'</span>');
            },this));
            return list.join('');

        },
        position : function () {
            var p,h,w;
            p = this.$element.position();
            h = this.getSize(this.$element).height;
            w = this.getSize(this.$element).width;
            return {
                top: p.top || 0,
                left: p.left || 0,
                height:h,
                width:w
            }

        },
        getSize : function ($el) {
            var $wrap, $clone,sizes;
            if($el.is(':visible')){
                $wrap = $('<div/>').appendTo($('body'));
                $wrap.css({
                    'position':'absolute !important',
                    'visibility':'hidden !important',
                    'display':'block !important'
                });
                $clone = $el.clone().appendTo($wrap);
                sizes = {
                    width: $clone.outerWidth(),
                    height: $clone.outerHeight()
                };
                $wrap.remove();
            }else{
                sizes = {
                    width: $el.outerWidth(),
                    height: $el.outerHeight()
                };
            }

            return sizes;
        },
        clearSelectedId : function (type) {
            var n = false;
            $.each(this.level,$.proxy(function (i) {
                if(this.level[i] === type){
                    n = this.level.slice(i + 1)
                }
            },this));
            for(var i = 0 ;i < n.length ;i++ ){
                this.options[n[i] + 'Id'] = '';

            }

        },
        bind : function (e) {
            var $this = this;
            this.$element.on('change', (this._changeElement = $.proxy(function () {
                this.close();
                this.refresh(true);
            }, this))).on('focus', (this._focusElement = $.proxy(function () {
                this.needBlur = true;
                this.open();
            }, this))).on('blur', (this._blurElement = $.proxy(function () {
                if (this.needBlur) {
                    this.needBlur = false;
                    this.close();
                }
            }, this)));

            this.$dropdown.on('click','span',$.proxy(function (e) {
                var $parent = $(e.target).parent();
                $parent.nextAll().remove();
                var type = $parent.attr('class');
                $parent.find('.on').removeClass('on');
                $(e.target).addClass('on');
                this.clearSelectedId(type);
                this.options[type + 'Id'] = $(e.target).data('id');
                $.each(this.level,$.proxy(function (i) {
                    if(this.level[i] === type && i <2){
                        this.output(this.level[i+1]);
                    }
                },this));

                this.$element.val(this.getName());
            },this)).on('mousedown', function () {
                $this.needBlur = false;
            });

            this.$dropdown.find('.clear-btn').on('click',this._clickElement = $.proxy(function () {
                this.reset();
            },this));

            this.$dropdown.find('.submit-btn').on('click',this._clickElement = $.proxy(function () {
                this.close();
            },this));

            $(document).on('click', (this._mouteclick = function (e) {
                var $target = $(e.target);
                var $dropdown,  $input;
                if ($target.is('.city-picker-input')) {
                    $input = $target;
                }
                if ($target.is('.city-picker')) {
                    $dropdown = $target;
                }else if ($target.is('.city-picker *')) {
                    $dropdown = $target.parents('.city-picker');
                }
                if ((!$input && !$dropdown) ||
                    ($input && $input.get(0) !== $this.$element.get(0)) ||
                    ($dropdown && $dropdown.get(0) !== $this.$dropdown.get(0))) {
                    $this.close();
                }

            }));

        },
        close : function () {
            this.$dropdown.hide();
        },

        open : function (type) {
            type = type || PROVINCE;
            this.$dropdown.show();
        },

        reset : function () {
            this.$element.val(null).trigger('change');
        },

        submit : function () {
            this.$dropdown.hide();
        }

    };


    Addresspicker.DEFAULTS = {
        placeholder: '请选择省/市/区',
        province: '',
        city: '',
        district: ''
    };
    window.Addresspicker = Addresspicker;
})();