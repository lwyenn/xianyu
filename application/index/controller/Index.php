<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category Index 
 * +------------------------------------------------------------+
 * 首页
 * +------------------------------------------------------------+
 *
 * @author lwy
 * @copyright http://www.kk30.com 2018
 * @version 1.0
 *
 * Modified at : 2018-07-05 18:44:44
 *
 */
namespace app\index\controller;

use Carbon\Carbon;

class Index extends Common
{
    public function index()
    {
        echo Carbon::yesterday()->addDay(1);
    }
    public function ceshi()
    {
        echo Carbon::tomorrow();
    }
}
