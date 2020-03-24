<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: zhangyajun <448901948@qq.com>
// +----------------------------------------------------------------------

namespace think\paginator\driver;

use think\Paginator;

class Bootstrap extends Paginator
{

    /**
     * 上一页按钮
     * @param string $text
     * @return string
     */
    protected function getPreviousButton($text = "上一页")
    {

        if ($this->currentPage() <= 1) {
            return $this->getDisabledTextWrapper($text);
        }

        $url = $this->url(
            $this->currentPage() - 1
        );

        return $this->getPageLinkWrapper($url, $text);
    }

    /**
     * 下一页按钮
     * @param string $text
     * @return string
     */
    protected function getNextButton($text = '下一页')
    {
        if (!$this->hasMore) {
            return $this->getDisabledTextWrapper($text);
        }

        $url = $this->url($this->currentPage() + 1);

        return $this->getPageLinkWrapper($url, $text);
    }

    /**
     * 页码按钮
     * @return string
     */
    protected function getLinks()
    {
        if ($this->simple) {
            return '';
        }

        $block = [
            'first'  => null,
            'slider' => null,
            'last'   => null,
        ];

        $side   = 3;
        $window = $side * 2;

        if ($this->lastPage < $window + 6) {
            $block['first'] = $this->getUrlRange(1, $this->lastPage);
        } elseif ($this->currentPage <= $window) {
            $block['first'] = $this->getUrlRange(1, $window + 2);
            $block['last']  = $this->getUrlRange($this->lastPage - 1, $this->lastPage);
        } elseif ($this->currentPage > ($this->lastPage - $window)) {
            $block['first'] = $this->getUrlRange(1, 2);
            $block['last']  = $this->getUrlRange($this->lastPage - ($window + 2), $this->lastPage);
        } else {
            $block['first']  = $this->getUrlRange(1, 2);
            $block['slider'] = $this->getUrlRange($this->currentPage - $side, $this->currentPage + $side);
            $block['last']   = $this->getUrlRange($this->lastPage - 1, $this->lastPage);
        }

        $html = '';

        if (is_array($block['first'])) {
            $html .= $this->getUrlLinks($block['first']);
        }

        if (is_array($block['slider'])) {
            $html .= $this->getDots();
            $html .= $this->getUrlLinks($block['slider']);
        }

        if (is_array($block['last'])) {
            $html .= $this->getDots();
            $html .= $this->getUrlLinks($block['last']);
        }

        return $html;
    }

    /**
     * 渲染分页html
     * @return mixed
     */
    public function render()
    {
        // var_dump($this->options);exit;
        if ($this->hasPages()) {
            if ($this->simple) {
                return sprintf(
                    '%s %s %s',
                    $this->getPreviousButton(),
                    $this->getNextButton(),
                    $this->getPageNumTotal()
                );
            } else {
                return sprintf(
                    '%s %s %s %s',
                    $this->getPreviousButton(),
                    $this->getLinks(),
                    $this->getNextButton(),
                    $this->getPageNumTotal()
                );
            }
        }
    }

    /**
     * 生成一个可点击的按钮
     *
     * @param  string $url
     * @param  int    $page
     * @return string
     */
    protected function getAvailablePageWrapper($url, $page)
    {
        if($page == '下一页') return '<a href="' . htmlentities($url) . '" class="next">' . $page . '</a>';
        if($page == '上一页') return '<a href="' . htmlentities($url) . '" class="prev">' . $page . '</a>';
        return '<a href="' . htmlentities($url) . '" data-page="'.$page.'">' . $page . '</a>';
    }

    /**
     * 生成一个禁用的按钮
     *
     * @param  string $text
     * @return string
     */
    protected function getDisabledTextWrapper($text)
    {
        if($text == '下一页') return '<a href="javascript:;" class="next" disabled="">' . $text . '</a>';
        if($text == '上一页') return '<a href="javascript:;" class="prev" disabled="">' . $text . '</a>';
        return '<a href="javascript:;" disabled="">' .$text. '</a>';
    }

    /**
     * 生成一个激活的按钮
     *
     * @param  string $text
     * @return string
     */
    protected function getActivePageWrapper($text)
    {
        return '<a href="javascript:;" class="on" data-page="' .$text. '">' .$text. '</a>';
    }

    /**
     * 生成省略号按钮
     *
     * @return string
     */
    protected function getDots()
    {
        return $this->getDisabledTextWrapper('...');
    }

    /**
     * 批量生成页码按钮.
     *
     * @param  array $urls
     * @return string
     */
    protected function getUrlLinks(array $urls)
    {
        $html = '';

        foreach ($urls as $page => $url) {
            $html .= $this->getPageLinkWrapper($url, $page);
        }

        return $html;
    }

    /**
     * 生成普通页码按钮
     *
     * @param  string $url
     * @param  int    $page
     * @return string
     */
    protected function getPageLinkWrapper($url, $page)
    {
        if ($this->currentPage() == $page) {
            return $this->getActivePageWrapper($page);
        }

        return $this->getAvailablePageWrapper($url, $page);
    }
    /**
     * 获取总页码
     * 
     * @access protected
     * @Author   LWY
     * @DateTime 2019-10-24T11:35:39+0800
     * @return   string
     */
    protected function getPageNumTotal(){
        $pageNumArr     = [10, 15, 20, 25, 30];
        $adminId        = session("admin_id");
        $adminPageNum   = redisGet("admin_page_num_".$adminId);
        $adminPageNum   = $adminPageNum ? $adminPageNum : 10;

        $pageStr        = '<select class="PAGENUM">';

        foreach ($pageNumArr as $key => $value) {
            if ($value == $adminPageNum) {
                $pageStr  .= '<option value="'.$value.'" selected>'.$value.' 条 / 页</option>';
            } else {
                $pageStr  .= '<option value="'.$value.'">'.$value.' 条 / 页</option>';
            }
        }

        $pageStr .= '</select>
                        <span>跳到 <input class="skip" type="text" value="1" data-last='.$this->lastPage.'> 页</span>
                        <span class="count">共 '.$this->total.' 条记录</span>
                    ';

        return $pageStr;
    }
}
