<?php
/**
 +------------------------------------------------------------------------------
 * builder 创建表单工具类
 +------------------------------------------------------------------------------
 * @author    lwy
 * Modified at : 2019-08-27
 +------------------------------------------------------------------------------
 */
namespace builder;

use app\common\model\File;

class builder
{
	private $_meta_title;            // 页面标题
    private $_tab_nav = array();     // 页面Tab导航
    private $_post_url;              // 表单提交地址
    private $_top_button_list = array();   // 顶部工具栏按钮组
    private $_form_items = array();  // 表单项目
    private $_extra_items = array(); // 额外已经构造好的表单项目
    private $_form_data = array();   // 表单数据
    private $_extra_html;            // 额外功能代码
    private $_child_menu_list;            // 额外功能代码
    private $_ajax_submit = true;    // 是否ajax提交
    private $_is_submit = true;
    private $_left_item = [];
    private $_right_item = [];
    private $_continue = true;
    private $_form_button = [];//表单按钮

    public function setTitle($mtitle = '')
    {
        $this->_meta_title = $mtitle;
        return $this;
    }
    /**
     * 设置表单提交地址
     * 
     * @param $url 提交地址
     * @return $this
     * 
     */
    public function setPostUrl($post_url) 
    {
        $this->_post_url = $post_url;
        return $this;
    }
    /**
     * 加入一个表单项
     * 
     * @param $type 表单类型(取值参考系统配置FORM_ITEM_TYPE)
     * @param $title 表单标题
     * @param $tip 表单提示说明
     * @param $name 表单名
     * @param $options 表单options
     * @param $extra_class 表单项是否隐藏
     * @param $extra_attr 表单项额外属性
     * @return $this
     * 
     */
    public function addFormItem($item = []) 
    {   
        //查重
        $this->addFormUnique($item);
        $this->_form_items[] = $item;
        return $this;
    }
    /**
     * 加入一个表单项
     * 
     * @param $type 表单类型(取值参考系统配置FORM_ITEM_TYPE)
     * @param $title 表单标题
     * @param $tip 表单提示说明
     * @param $name 表单名
     * @param $options 表单options
     * @param $extra_class 表单项是否隐藏
     * @param $extra_attr 表单项额外属性
     * @return $this
     * 
     */
    public function addTextItem($item = []) 
    {
        $item['type']           = "text";

        //查重
        $this->addFormUnique($item);

        $this->_form_items[]    = $item;
        return $this;
    }
    /**
     * 加入一个表单项
     * 
     * @param $type 表单类型(取值参考系统配置FORM_ITEM_TYPE)
     * @param $title 表单标题
     * @param $tip 表单提示说明
     * @param $name 表单名
     * @param $options 表单options
     * @param $extra_class 表单项是否隐藏
     * @param $extra_attr 表单项额外属性
     * @return $this
     * 
     */
    public function addSelectItem($item = []) 
    {
        $item['type']           = "select";
        $this->_form_items[]    = $item;
        return $this;
    }
    /**
     * 加入一个表单项
     * 
     * @param $type 表单类型(取值参考系统配置FORM_ITEM_TYPE)
     * @param $title 表单标题
     * @param $tip 表单提示说明
     * @param $name 表单名
     * @param $options 表单options
     * @param $extra_class 表单项是否隐藏
     * @param $extra_attr 表单项额外属性
     * @return $this
     * 
     */
    public function addRadioItem($item = []) 
    {
        $item['type']           = "radio";
        $this->_form_items[]    = $item;
        return $this;
    }
    /**
     * 加入一个表单项
     * 
     * @param $type 表单类型(取值参考系统配置FORM_ITEM_TYPE)
     * @param $title 表单标题
     * @param $tip 表单提示说明
     * @param $name 表单名
     * @param $options 表单options
     * @param $extra_class 表单项是否隐藏
     * @param $extra_attr 表单项额外属性
     * @return $this
     * 
     */
    public function addSwitchItem($item = []) 
    {
        $item['type']           = "switch";
        $this->_form_items[]    = $item;
        return $this;
    }
    /**
     * 加入一个表单项
     * 
     * @param $type 表单类型(取值参考系统配置FORM_ITEM_TYPE)
     * @param $title 表单标题
     * @param $tip 表单提示说明
     * @param $name 表单名
     * @param $options 表单options
     * @param $extra_class 表单项是否隐藏
     * @param $extra_attr 表单项额外属性
     * @return $this
     * 
     */
    public function addDateItem($item = []) 
    {
        $item['type']           = "date";
        $this->_form_items[]    = $item;
        return $this;
    }
    /**
     * 加入一个表单项
     * 
     * @param $type 表单类型(取值参考系统配置FORM_ITEM_TYPE)
     * @param $title 表单标题
     * @param $tip 表单提示说明
     * @param $name 表单名
     * @param $options 表单options
     * @param $extra_class 表单项是否隐藏
     * @param $extra_attr 表单项额外属性
     * @return $this
     * 
     */
    public function addNumberItem($item = []) 
    {
        $item['type']           = "number";
        $this->_form_items[]    = $item;
        return $this;
    }
    /**
     * 加入一个表单项
     * 
     * @param $type 表单类型(取值参考系统配置FORM_ITEM_TYPE)
     * @param $title 表单标题
     * @param $tip 表单提示说明
     * @param $name 表单名
     * @param $options 表单options
     * @param $extra_class 表单项是否隐藏
     * @param $extra_attr 表单项额外属性
     * @return $this
     * 
     */
    public function addCheckItem($item = []) 
    {
        $item['type']           = "checkbox";
        $this->_form_items[]    = $item;
        return $this;
    }
    /**
     * 加入一个表单项
     * 
     * @param $type 表单类型(取值参考系统配置FORM_ITEM_TYPE)
     * @param $title 表单标题
     * @param $tip 表单提示说明
     * @param $name 表单名
     * @param $options 表单options
     * @param $extra_class 表单项是否隐藏
     * @param $extra_attr 表单项额外属性
     * @return $this
     * 
     */
    public function addStaticItem($item = []) 
    {
        $item['type']           = "static";

        //查重
        $this->addFormUnique($item);

        if (!isset($item['hide'])) $this->_form_items[] = $item;
        else if (!$item['hide']) $this->_form_items[] = $item;

        return $this;
    }
    /**
     * 加入一个表单项
     * 
     * @param $type 表单类型(取值参考系统配置FORM_ITEM_TYPE)
     * @param $title 表单标题
     * @param $tip 表单提示说明
     * @param $name 表单名
     * @param $options 表单options
     * @param $extra_class 表单项是否隐藏
     * @param $extra_attr 表单项额外属性
     * @return $this
     * 
     */
    public function addHiddenItem($item = []) 
    {
        $item['type']           = "hidden";
        $this->_form_items[]    = $item;
        return $this;
    }
    /**
     * 加入一个表单项
     * 
     * @param $type 表单类型(取值参考系统配置FORM_ITEM_TYPE)
     * @param $title 表单标题
     * @param $tip 表单提示说明
     * @param $name 表单名
     * @param $options 表单options
     * @param $extra_class 表单项是否隐藏
     * @param $extra_attr 表单项额外属性
     * @return $this
     * 
     */
    public function addDateRangeItem($item = []) 
    {
        $item['type']           = "date_range";
        $this->_form_items[]    = $item;
        return $this;
    }
    /**
     * 加入一个表单项
     * 
     * @param $type 表单类型(取值参考系统配置FORM_ITEM_TYPE)
     * @param $title 表单标题
     * @param $tip 表单提示说明
     * @param $name 表单名
     * @param $options 表单options
     * @param $extra_class 表单项是否隐藏
     * @param $extra_attr 表单项额外属性
     * @return $this
     * 
     */
    public function addPictureItem($item = []) 
    {
        $item['type']           = "picture";
        $this->_form_items[]    = $item;
        return $this;
    }
    /**
     * 设置表单表单数据
     * 
     * @param $form_data 表单数据
     * @return $this
     * 
     */
    public function setFormData($form_data = []) 
    {
        $this->_form_data = $form_data;
        return $this;
    }
    /**
     * 设置额外功能代码
     * @param $extra_html 额外功能代码
     * @return $this
     * 
     */
    public function setExtraHtml($extra_html) 
    {
        $this->_extra_html = $extra_html;
        return $this;
    }
    /**
     * 设置提交方式
     * 
     * @param $ajax_submit 
     * @return $this
     * 
     */
    public function setAjaxSubmit($ajax_submit = true) 
    {
        $this->_ajax_submit = $ajax_submit;
        return $this;
    }
    /**
     * 是否需要提交按钮
     * 
     * @access public
     * @Author   LWY
     * @DateTime 2019-08-30T12:34:19+0800
     * @param    boolean $bl [description]
     */
    public function setSubmit($bl = true)
    {
        $this->_is_submit = $bl;
        return $this;
    }
    /**
     * 是否继续操作
     * 
     * @access public
     * @Author   LWY
     * @DateTime 2019-09-04T10:02:39+0800
     * @param    boolean $bl [description]
     */
    public function setContinue($bl = true)
    {
        $this->_continue = $bl;
        return $this;
    }
    /**
     * 表单分2列 左列
     * 
     * @access public
     * @Author   LWY
     * @DateTime 2019-09-03T13:45:09+0800
     * @param  $item 属性
     */
    public function setLeftItem($item = [])
    {
        $item['list'] = $this->_form_items;
        $this->_left_item[] = $item;
        $this->_form_items = [];
        return $this;
    }
    /**
     * 表单分2列 右列
     * 
     * @access public
     * @Author   LWY
     * @DateTime 2019-09-03T13:45:09+0800
     * @param  $item 属性
     */
    public function setRightItem($item = [])
    {
        $item['list'] = $this->_form_items;
        $this->_right_item[] = $item;
        $this->_form_items = [];
        return $this;
    }
    /**
     * 搜索的按钮
     * 
     * @access public
     * @Author   LWY
     * @DateTime 2019-09-04T17:14:20+0800
     * @param    array $item [description]
     */
    public function addFormButton($item = [])
    {
        $item['param'] = isset($item['param']) ? $item['param'] : '';
        $this->_form_button[] = $item;
        return $this;
    }
    /**
     * 编译HTML属性
     * 
     * @access protected
     * @Author   LWY
     * @DateTime 2019-08-27T16:24:10+0800
     * @param  $attr  
     * @return   
     */
    protected function compileHtmlAttr($attr) 
    {
        $result = array();
        foreach ($attr as $key => $value) {
            $value = htmlspecialchars($value);
            $result[] = "$key=\"$value\"";
        }
        $result = implode(' ', $result);
        return $result;
    }
    /**
     * 查重字段拼接
     * 
     * @access protected
     * @Author   LWY
     * @DateTime 2019-10-17T15:47:20+0800
     * @param    [type] &$item [参数]
     */
    protected function addFormUnique(&$item)
    {
        if (isset($item['class']) && strpos($item['class'], 'unique') !== false) {
            $field = isset($item['field']) ? $item['field'] : $item['name'];
            $model = isset($item['model']) ? $item['model'] : request()->controller();
            $id    = isset($item['id']) ? $item['id'] : input("param.id");
            $item['extra'] = "data-model=".$model." data-id=".$id;
        }
    }
    /**
     * 输出变量
     * 
     * @access public
     * @Author   LWY
     * @DateTime 2019-08-27T16:20:40+0800
     * @return   array
     */
    public function display($n = '')
    {
        //记录第一次创建表单的地址
        $href_referer       = session("http_referer");
        //有效期5分钟
        $referer_time       = session("referer_time") + 300;
        if ((empty($href_referer) && $referer_time < time()) || $n==1) {
            $href_referer   = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : url("glist");
            session('http_referer', $href_referer);
            session('referer_time', time());
        }

        //编译表单值
        if ($this->_form_data) {
            if(empty($this->_form_items) && (!empty($this->_left_item) || !empty($this->_right_item))){
                foreach ($this->_left_item as $key => $vo){
                    foreach ($vo['list'] as $k => $item) {
                        if(!empty($item['name'])){

                            if(strpos($item['name'], "]") === false){

                                if (isset($this->_left_item[$key]['list'][$k]['value'])) continue;

                                if (isset($this->_form_data[$item['name']])) {
                                    $this->_left_item[$key]['list'][$k]['value'] = $this->_form_data[$item['name']];
                                }else{
                                    $this->_left_item[$key]['list'][$k]['value'] = '';
                                }

                                //图片
                                switch ($item['type']) {
                                    case 'static_img':
                                    case 'picture':
//                                        if (!isset($this->_form_data[$item['name']]) && !empty($item['value'])) {
//                                            $this->_form_data[$item['name']]
//                                        }
                                        if (isset($this->_form_data[$item['name']])) {
                                            //判断是否是图片地址
                                            if (strpos($this->_form_data[$item['name']], "http") !== false) {
                                                $this->_left_item[$key]['list'][$k]['images'] = [$this->_form_data[$item['name']]];
                                                break;
                                            }

                                            $img_idstr = $this->_form_data[$item['name']];
                                            if (!empty($img_idstr)) {
                                                $fileModel      = new File();
                                                $imgRootPath    = $fileModel->getRootPath($img_idstr);
                                                $this->_left_item[$key]['list'][$k]['images'] = $imgRootPath;
                                            } else {
                                                $this->_left_item[$key]['list'][$k]['images'] = [];
                                            }
                                        } else {
                                            $this->_left_item[$key]['list'][$k]['images'] = [];
                                        }
                                        break;
                                    default:
                                        # code...
                                        break;
                                }
                            }
                        }else{
                            $this->_left_item[$key]['list'][$k]['name'] = '';
                        }
                    }
                }
                foreach ($this->_right_item as $key => $vo){
                    foreach ($vo['list'] as $k => $item) {
                        if(!empty($item['name'])){

                            if (isset($this->_right_item[$key]['list'][$k]['value'])) continue;

                            if(strpos($item['name'], "]") === false){
                                if (isset($this->_form_data[$item['name']])) {
                                    $this->_right_item[$key]['list'][$k]['value'] = $this->_form_data[$item['name']];
                                }else{
                                    $this->_right_item[$key]['list'][$k]['value'] = '';
                                }

                                //图片
                                switch ($item['type']) {
                                    case 'static_img':
                                    case 'picture':
                                        if (isset($this->_form_data[$item['name']])) {

                                            //判断是否是图片地址
                                            if (strpos($this->_form_data[$item['name']], "http") !== false) {
                                                $this->_right_item[$key]['list'][$k]['images'] = [$this->_form_data[$item['name']]];
                                                break;
                                            }

                                            $img_idstr = $this->_form_data[$item['name']];
                                            $fileModel      = new File();
                                            $imgRootPath    = $fileModel->getRootPath($img_idstr);
                                            $this->_right_item[$key]['list'][$k]['images'] = $imgRootPath;
                                        } else {
                                            $this->_right_item[$key]['list'][$k]['images'] = [];
                                        }
                                        break;
                                    default:
                                        # code...
                                        break;
                                }
                            }
                        }else{
                            $this->_right_item[$key]['list'][$k]['name'] = '';
                        }
                    }
                }
            }else{
                foreach ($this->_form_items as &$item) {
                    if(!empty($item['name'])){

                        if (isset($item['value'])) continue;

                        //name中有|，2个参数选一个有值的
                        if (strpos($item['name'], "|") !== false) {
                            $item_names = explode("|", $item['name']);
                            foreach ($item_names as $ns) {
                                if (!empty($this->_form_data[$ns])) {
                                    $item['value'] = $this->_form_data[$ns];
                                    break;
                                }
                            }
                            continue;
                        }

                        if(strpos($item['name'], "]") === false){
                            if (isset($this->_form_data[$item['name']])) {
                                $item['value'] = $this->_form_data[$item['name']];
                            }else{
                                $item['value'] = '';
                            }

                            //图片
                            switch ($item['type']) {
                                case 'static_img':
                                case 'picture':
                                    if (isset($this->_form_data[$item['name']])) {
                                        //判断是否是图片地址
                                        if (strpos($this->_form_data[$item['name']], "http") !== false) {
                                            $item['images'] = [$this->_form_data[$item['name']]];
                                            break;
                                        }

                                        $img_idstr = $this->_form_data[$item['name']];
                                        if (!empty($img_idstr)) {
                                            $fileModel      = new File();
                                            $imgRootPath    = $fileModel->getRootPath($img_idstr);
                                            $item['images'] = $imgRootPath;
                                        } else {
                                            $item['images'] = [];
                                        }
                                    } else {
                                        $item['images'] = [];
                                    }
                                    break;
                                case 'date':
                                    if ($item['value'] && strpos($item['value'], '-') === false) {
                                        $item['value'] = date('Y-m-d', $item['value']);
                                    }
                                    break;
                                default:
                                    # code...
                                    break;
                            }
                            
                        }
                    }else{
                        $item['name'] = '';
                    }
                }
            }
        }

        return [
            'ftitle'        => $this->_meta_title,
            'post_url'      => $this->_post_url,
            'form_items'    => $this->_form_items,
            'all_items'     => [$this->_left_item, $this->_right_item],
            'ajax_submit'   => $this->_ajax_submit,
            'extra_html'    => $this->_extra_html,
            'is_submit'     => $this->_is_submit,
            'is_continue'   => $this->_continue,
            'form_button'   => $this->_form_button,
            'href_referer'  => $href_referer,
        ];
    }
}

?>