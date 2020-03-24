<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category Page
 * +------------------------------------------------------------+
 * 根据自定义规则生成分页
 * +------------------------------------------------------------+
 *
 * @author anzai <sba3198178@126.com>
 * @copyright http://www.suncco.com 2013
 * @version 1.0
 *
 * Modified at : 2013-2-25 15:52:15
 *
 */
namespace pager;

class Pager{
	
	public $totalPages;
	
	///分页显示格式
	private $_format = '%prev%list%next%total';
	
	///分页变量名
	private $_var = 'page';
	
	///数据总条数
	private $_count;

	//链接
	private $_url;
	
	///每次显示几条
	private $_listnum = 15;
	
	///分栏数目
	private $_column = 5;
	
	///分页a链接标签自定义class
	private $_className = array();
		
	private $_config = array(
		'record' => '条记录',
		'page' => '',
		'prev' => '上一页',
		'next' => '下一页',
		'first'=> '首页',
		'last' => '末页'
	);
	
	/**
	 * 
	 * +------------------------------------------------------------+
	 * @name __construct
	 * +------------------------------------------------------------+
	 * 构造函数
	 * +------------------------------------------------------------+
	 * 
	 * @param int $count  数据总条数
	 * @param int $list	     每页显示条数
	 * @param int $column 分栏数
	 *
	 */
	public function __construct($count, $list = 10, $column = 5, $url = ''){
		$this->_count 	= $count;
		$this->_listnum = (int)$list>0 ? (int) $list : 15;
		$this->_column 	= $column;
		$this->_url 	= $url;
	}
	
	//添加className
	public function addClassName($className){
		$this->_className[] = $className;
		
		return $this; 
	}
	
	//设置显示格式
	public function format($format){
		if(!empty($format)) $this->_format = $format;
		
		return $this;
	}
	
	public function config($config){
		if (!empty($config)){
			$this->_config = extend($this->_config, $config);
		}
		
		return $this;
	}
	/**
	 * 
	 * 原来的  2017年4月7日10:43:59
	 *
	 */
	public function render(){
		$list = $this->_listnum;
		$count = $this->_count;
		if ($count <= $list) return;

		$var = $this->_var;
		$this->totalPages = $totalPages = ceil($count/$list); //总页数
		$var_par = isset($_GET[$var]) ? (int)$_GET[$var] : 1;
		$nowPage = min($totalPages, max(1, $var_par));//当前页;
		$prev = $nowPage > 1 ? $nowPage - 1 : 1;//上一页
		$next = $nowPage < $totalPages ? $nowPage + 1 : $totalPages;//下一页
		
		$className = empty($this->_className) ? '' : ' ' . implode(' ', $this->_className);
		
		$prevHtml  = $nowPage <= 1 ? '<a href="javascript:;" class="prev" disabled="">' . $this->_config['prev'] . '</a>' : '<a  class="prev' . $className . '" href="' . $this->_url($prev) .'">'.$this->_config['prev'].'</a>';


		$nextHtml  = $nowPage >= $totalPages ? '<a href="javascript:;" class="next" disabled="">' . $this->_config['next'] . '</a>' : '<a class="next' . $className . '" href="' .  $this->_url($next) .'">'.$this->_config['next'].'</a>';

		
		$listHtml = '';
		
		if ($totalPages > $this->_column){
			$start = $nowPage <= 1 ? 1 : ($nowPage - 1);
			$end   = $start + $this->_column - 1;
			$end   = $end > $totalPages ? $totalPages : $end;
			$start = $end - $start < $this->_column ? $end - $this->_column + 1 : $start;
			$start = $start <=0 ? 1 : $start;
		}else{
			$start = 1;
			$end   = $totalPages;
		}
		
		
		for ($i = $start; $i <= $end; $i++){
			$listHtml .= $i==$nowPage ? '<a href="javascript:;" class="on" data-page="' .$i. '">' .$i. '</a>' : '<a href="' . $this->_url($i) . '" data-page="'.$i.'">' . $i . '</a>';
		}
		
		$normalHtml = "<input type='number' class='PAGER_INPUT' placeholder='页码'> <a href='' class='PAGER_NORMAL'>跳转</a>";
		$pageHtml = str_ireplace(
			array('%total', '%prev', '%next', '%list', '%normal'), 
			array('<span class="count">共 ' .$count . " ".$this->_config['record'] . '</span>', $prevHtml, $nextHtml, $listHtml, $normalHtml), 
			$this->_format
		);
		unset($count, $totalPages, $nowPage, $prevHtml, $nextHtml, $listHtml, $firstHtml, $lastHtml, $normalHtml);
		return $pageHtml;
	}
	
	private function _url($page){
		static $params = null;
		if(isset($_GET['_URL_'])){
			unset($_GET['_URL_']);
		}
		if ($params === null){
			$params = extend($_GET, $_POST);
		}
		$params = extend($params, array($this->_var => $page));

		$url = $this->_url ? $this->_url : url(request()->controller().'/'.request()->action());

        return $url."?".http_build_query($params);
	}
}

?>