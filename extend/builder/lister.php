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
use app\common\model\Group;

class lister
{
	private $_meta_title;                  // 页面标题

    private $_top_button_list = array();   // 顶部工具栏按钮组

    private $_search  = array();           // 搜索参数配置
    private $_msg  = '';           // 搜索参数配置

    private $_tab_nav = array();           // 页面Tab导航

    private $_table_column_list = array(); // 表格标题字段

    private $_table_data_list   = array(); // 表格数据列表

    private $_table_data_page;             // 表格数据分页

    private $_right_button_list = array(); // 表格右侧操作按钮组

    private $_extra_html;                  // 额外功能代码

    private $_resources;                  // 权限

    private $group_id;                  // 权限

    private $_tj_item  = array();

    private $_form_button = array();

    private $_get_url ='';

    private $_check_box = false;
    //权限获取
    public function __construct(){
        $this->group_id     = session("group_id");
        if ($this->group_id) {
            $groupModel         = new Group();
            $this->_resources   = $groupModel->getMenu($this->group_id);
        }
    }

    /**

     * 设置页面标题

     * @param $title 标题文本

     * @return $this

     * 

     */

    public function setTitle($meta_title) {

        $this->_meta_title = $meta_title;

        return $this;

    }

    /**

     * @param array  $item 按钮属性 title class href power controller actionion param

     * @return $this

     * 

     */

    public function addTopButton($item = []) 
    {
        //权限控制
        if (isset($item['power']) && $item['power']) {
            if (controller('Acl')->hasAcl($item['controller'], $item['action'], $this->_resources) !== true){
                return $this;
            }
        }
        if (!isset($item['href'])) {
            $q_param = $item['param'] = isset($item['param']) ? $item['param'] : '';
            $item['href'] = url($item['controller']."/".$item['action'], $q_param);
        }

        if (!isset($item['target'])){
            $item['class'] = "target-ids";
        }elseif ($item['target']){
            $item['class'] = "target-ids";
        }

        $this->_top_button_list[] = $item;
        return $this;
    }

    public function addTopPower($title, $ctrl, $act, $param = '') 
    {
        $item = [
            'title'         => $title,
            'controller'    => $ctrl,
            'action'        => $act,
            'param'         => $param,
        ];
        return $this->addTopButton($item);
    }

    public function addTextSearch($item = []){
        $item['type'] = 'text';
        if (isset($item['power'])) {
            if ($item['power']) $this->_tj_item[] = $item;
        } else {
            $this->_tj_item[] = $item;
        }
        return $this;
    }

    public function addSelectSearch($item = []){
        $item['type'] = 'select';
        if (isset($item['power'])) {
            if ($item['power']) $this->_tj_item[] = $item;
        } else {
            $this->_tj_item[] = $item;
        }
        return $this;
    }

    public function addDateSearch($item = []){
        $item['type'] = 'date';
        if (isset($item['power'])) {
            if ($item['power']) $this->_tj_item[] = $item;
        } else {
            $this->_tj_item[] = $item;
        }
        return $this;
    }

    public function addDateRangeSearch($item = []){
        $item['type'] = 'date_range';
        if (isset($item['power'])) {
            if ($item['power']) $this->_tj_item[] = $item;
        } else {
            $this->_tj_item[] = $item;
        }
        return $this;
    }

    public function addHiddenSearch($item = []){
        $item['type'] = 'hidden';
        if (isset($item['power'])) {
            if ($item['power']) $this->_tj_item[] = $item;
        } else {
            $this->_tj_item[] = $item;
        }
        return $this;
    }

    public function addFormButton($item = []){
        $item['param'] = isset($item['param']) ? $item['param'] : '';

        $this->_form_button[] = $item;
        return $this;
    }

    public function addFormPower($title,$ctrl,$act,$param=''){
        $item = [
            'title'         => $title,
            'controller'    => $ctrl,
            'action'        => $act,
            'param'         => $param,
        ];
        
        return $this->addFormButton($item);
    }


    public function addGetUrl($url = ''){
        
        $this->_get_url = $url;
        return $this;
    }

    /**

     * 设置注释参数

     * @param $title

     * @return $this

     * 

     */

    public function setMsg($title = '') {

        $this->_msg = $title;

        return $this;

    }

    public function addTabNav($tab_list, $idx) {

        foreach ($tab_list as $key => $value) {
            if (isset($value['power']) && $value['power']) {
                if (controller('Acl')->hasAcl($value['controller'], $value['action'], $this->_resources) !== true){
                    unset($tab_list[$key]);
                } else {
                    $param = isset($item['param']) ? $item['param'] : '';
                    $tab_list[$key]['href'] = url($value['controller'].'/'.$value['action'], $param);
                }
            }
        }


        $this->_tab_nav = array(

            'tab_list' => $tab_list,

            'cur_tab' => $idx

        );

        return $this;

    }

    //$item  name  title  type  power  extra  order(boolean) 

    public function addTableColumn($item = []) {
        $item['type'] = isset($item['type']) ? $item['type'] : 'default';
        if ($item['type'] == 'checkbox') $this->_check_box = true;
        $this->_table_column_list[] = $item;
        return $this;

    }
    public function addColumn($name,$title,$type=''){
        $item = [
            'title' => $title,
            'name' => $name,
            'type' => $type,
        ];
        $this->_table_column_list[] = $item;
        return $this;
    }

    public function addSwitchColumn($item = []){
        $item['type'] = 'switch';
        $mod = empty($item['mod']) ? request()->controller() : $item['mod'];
        if (controller('Acl')->hasAcl($mod, "set_switch", $this->_resources) !== true){
            $item['type'] = 'status';
        }
        $this->_table_column_list[] = $item;

        return $this;
    }

    public function addPictureColumn($item = []){
        $item['type'] = 'picture';
        $this->_table_column_list[] = $item;

        return $this;
    }

    public function addCheckColumn($item = []){
        $item['type'] = 'checkbox';
        $this->_check_box = true;
        $this->_table_column_list[] = $item;

        return $this;
    }
    public function addSelectColumn($item=[]){
        $item['type'] = 'select';
        $this->_table_column_list[] = $item;

        return $this;
    }

    /**

     * 表格数据列表

     * 

     */

    public function setDataList($table_data_list) {

        $this->_table_data_list = $table_data_list;

        return $this;

    }


    public function addRightButton($item = []) {
        //权限控制
        if (isset($item['power']) && $item['power']) {
            if (controller('Acl')->hasAcl($item['controller'], $item['action'], $this->_resources) !== true){
                return $this;
            }
        }

        $queryParam = '';
        if (isset($item['param'])) {
            if (is_array($item['param'])) $queryParam = http_build_query($item['param']);
            else $queryParam = $item['param'];
        }

        foreach ($item as $key => $value) {
            if (strpos($value, "param-") !== false) {
                $karr = explode("-", $value);
                if (empty($queryParam)){
                    $queryParam = $karr[1]."=__".strtoupper($karr[1])."__";
                }else{
                    $queryParam = "&".$karr[1]."=__".strtoupper($karr[1])."__";
                }
            }
            if (strpos($value, "ajax-post") !== false) {
                $item['class'] = "ajax-post";
            }
            if (strpos($value, "confirm") !== false) {
                $item['class'] = "ajax-post confirm";
            }
        }

        if (!isset($item['href'])) {
            $item['href'] = url($item['controller']."/".$item['action'], $queryParam);
        } else {
            if (!empty($queryParam)) {
                $item['href'] = $item['href'] . (strpos($item['href'], "?") === false ? "?". $queryParam : "&". $queryParam);
            }
        }

        $this->_right_button_list[] = $item;

        return $this;

    }
    public function addRightPower($title,$ctrl,$act,$param='',$extra=[])
    {
        $item = [
            'title'         => $title,
            'controller'    => $ctrl,
            'action'        => $act,
            'param'         => $param,
        ];
        $item = array_merge($item,$extra);
        return $this->addRightButton($item);
    }



    /**

     * 设置分页

     * @param $page

     * @return $this

     * 

     */

    public function setDataPage($table_data_page = '') {

        $this->_table_data_page = $table_data_page;

        return $this;

    }
    /**
     * 设置分页数据
     * 
     * @access public
     * @Author   LWY
     * @DateTime 2019-10-22T14:10:32+0800
     * @param    array $item [description]
     */
    public function setPager($item = [])
    {
        $this->_table_data_page = $item['pageHtml'];
        $this->_table_data_list = $item['datas'];
        return $this;
    }

    /**

     * 设置额外功能代码

     * @param $extra_html 额外功能代码

     * @return $this

     * 

     */

    public function setExtraHtml($extra_html) {

        $this->_extra_html = $extra_html;

        return $this;

    }

    /**

     * 显示页面

     * 

     */

    public function display() {

        // 编译data_list中的值

        foreach ($this->_table_data_list as &$data) {

            $data['right_button'] = [];
            // 编译表格右侧按钮

            if (isset($this->_right_button_list)) {

                foreach ($this->_right_button_list as $right_button) {

                    foreach ($right_button as $value) {
                        if (strpos($value, "param-") !== false) {
                            $karr = explode("-", $value);
                            // 将约定的标记__data_id__替换成真实的数据ID
                            $right_button['href'] = preg_replace(

                                '/__'.strtoupper($karr[1]).'__/i',

                                $data[$karr[1]],

                                $right_button['href']

                            );
                        }
                    }
                    array_push($data['right_button'], $right_button);
                }

            }

            // 根据表格标题字段指定类型编译列表数据

            foreach ($this->_table_column_list as &$column) {
                switch ($column['type']) {
                    case 'picture':
                        $pic_ids        = $data[$column['name']];
                        $fileModel      = new File();
                        if (strpos($pic_ids,",") !== false) {
                            $data[$column['name']] = $fileModel->getRootPath($pic_ids);
                        }else{
                            $data[$column['name']] = $fileModel->getRootPath($pic_ids, 'string');
                        }
                        break;
                    case 'select':
                        if (!empty(!empty($data[$column['name']]))) {
                            $data[$column['name']] = $column['options'][$data[$column['name']]];
                        } else {
                            $data[$column['name']] = '-';
                        }
                        break;
                    case 'time':
                        if (!empty($data[$column['name']])) {
                            $data[$column['name']] = date("Y-m-d H:i:s", $data[$column['name']]);
                        } else {
                            $data[$column['name']] = '-';
                        }
                        break;
                    case 'status':
                        $data[$column['name']] = $data[$column['name']] == 1 ? "<font color='#333333'>启用</font>" : "<font color='red'>禁用</font>";
                        break;
                }
            }
        }

        return [
            'meta_title'        => $this->_meta_title,
            'post_url'          => $this->_get_url,
            'form_items'        => $this->_tj_item,
            'form_button'       => $this->_form_button,
            'top_button_list'   => $this->_top_button_list,
            'msg_notice'        => $this->_msg,
            'tab_nav'           => $this->_tab_nav,
            'table_column_list' => $this->_table_column_list,
            'table_data_list'   => $this->_table_data_list,
            'pageHtml'          => $this->_table_data_page,
            'right_button_list' => $this->_right_button_list,
            'extra_html'        => $this->_extra_html,
            'checkbox'          => $this->_check_box,
        ];

    }



    //编译HTML属性

    protected function compileHtmlAttr($attr) {

        $result = array();

        foreach ($attr as $key => $value) {

            $value = htmlspecialchars($value);

            $result[] = "$key=\"$value\"";

        }

        $result = implode(' ', $result);

        return $result;

    }
}

?>