<?php
/**
 * 
 * +------------------------------------------------------------+
 * @category Excel 
 * +------------------------------------------------------------+
 * 根据PHPExcel定制的Excel简易工具类
 * +------------------------------------------------------------+
 *
 * @author gd
 * @copyright http://www.kk30.com 2013
 * @version 1.0
 *
 * Modified at : 2013-4-23 09:56:53
 *
 */
namespace Excel;

class Myexcel {
	
	//导入Excel数据源文件或导出数据文件存放目录
	private $_path;
	
	function __construct($path = ''){
		//载入PHPExcel入口文件
		$this->_path = $path;
        require '../vendor/PHPExcel/PHPExcel.php';
	}

    /**
     *
     * +------------------------------------------------------------+
     * @name export
     * +------------------------------------------------------------+
     * 导出数据
     * +------------------------------------------------------------+
     *
     * @param array $header
     * @param array $datas
     * @param string $filename 	//文件名
     * @param string $title 	//标题
     * @param string $other 	//其他信息
     * @param boolean $load
     *
     */
    public function crm_export($header, $datas, $filename='', $title='', $other=array(), $load=true){
        $this->_path = iconv('utf-8', 'gb2312', $this->_path);
        $phpExcel = new \PHPExcel();

        $filename = empty($filename) ? time() : iconv('utf-8', 'gb2312', $filename);

        $writer = new \PHPExcel_Writer_Excel5($phpExcel);
        $phpExcel->setActiveSheetIndex(0);
        $sheet = $phpExcel->getActiveSheet();
        $sheet->setTitle('sheet1');
        $sheet->getDefaultStyle()->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
        $sheet->getDefaultStyle()->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
        $chr = ord('A');
        $ls = ord('Z');
        $pre = '';
        $k = 0;
        $num = 2; //合并几行

        //找出最后一个字母
        $hnum = count($datas[0]);
        $last = chr($chr+$hnum-1);
        if(!empty($header)){
            $sheet->mergeCells('A1:A2');
            $sheet->mergeCells('B1:B2');
            $sheet->mergeCells('C1:E1');
            $sheet->mergeCells('F1:H1');
            $sheet->mergeCells('I1:K1');
            $sheet->mergeCells('L1:N1');
            $sheet->setCellValue('A1', $header[0]);
            $sheet->setCellValue('B1', $header[1]);
            $sheet->setCellValue('C1', $header[2]);
            $sheet->setCellValue('F1', $header[3]);
            $sheet->setCellValue('I1', $header[4]);
            $sheet->setCellValue('L1', $header[5]);
        }
        $other_column = array(
            '',
            '',
            '个人',
            '企业',
            '总数',
            '个人',
            '企业',
            '总数',
            '个人',
            '企业',
            '总数',
            '个人',
            '企业',
            '总数',
        );
        $sheet->setCellValue('C2', $other_column[2]);
        $sheet->setCellValue('D2', $other_column[3]);
        $sheet->setCellValue('E2', $other_column[4]);
        $sheet->setCellValue('F2', $other_column[5]);
        $sheet->setCellValue('G2', $other_column[6]);
        $sheet->setCellValue('H2', $other_column[7]);
        $sheet->setCellValue('I2', $other_column[8]);
        $sheet->setCellValue('J2', $other_column[9]);
        $sheet->setCellValue('K2', $other_column[10]);
        $sheet->setCellValue('L2', $other_column[11]);
        $sheet->setCellValue('M2', $other_column[12]);
        $sheet->setCellValue('N2', $other_column[13]);
        $num = 3;
        //设置边框
        $sheet->getStyle('A'.$num)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $sheet->getStyle('A'.$num)->getBorders()->getTop()->getColor()->setARGB('000000'); // color
        $sheet->getStyle('A'.$num)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $sheet->getStyle('A'.$num)->getBorders()->getBottom()->getColor()->setARGB('000000'); // color
        $sheet->getStyle('A'.$num)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $sheet->getStyle('A'.$num)->getBorders()->getLeft()->getColor()->setARGB('000000'); // color
        $sheet->getStyle('A'.$num)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
        $sheet->getStyle('A'.$num)->getBorders()->getRight()->getColor()->setARGB('000000'); // color

        $test = $chr + $hnum;
        foreach($datas[0] as $vo){
            if ($chr > $ls){
                $chr = ord('A');
                $pre = chr($chr + $k);
                $k++;
            }
            $sheet->setCellValue($pre . chr($chr).$num, $vo);

            //设置单元格的宽度
            if(chr($chr + $k) == "A" || chr($chr + $k) == "B"){
                $sheet->getColumnDimension(chr($chr + $k))->setWidth(20);
            }elseif(chr($chr + $k) == "L" || chr($chr + $k) == "M" || chr($chr + $k) == "N"){
                $sheet->getColumnDimension(chr($chr + $k))->setWidth(10);
            }else{
                $sheet->getColumnDimension(chr($chr + $k))->setWidth(8);
            }
            //设置边框
            $sheet->getStyle(chr($chr + $k).$num)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            $sheet->getStyle(chr($chr + $k).$num)->getBorders()->getTop()->getColor()->setARGB('000000'); // color
            $sheet->getStyle(chr($chr + $k).$num)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            $sheet->getStyle(chr($chr + $k).$num)->getBorders()->getBottom()->getColor()->setARGB('000000'); // color
            $sheet->getStyle(chr($chr + $k).$num)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            $sheet->getStyle(chr($chr + $k).$num)->getBorders()->getLeft()->getColor()->setARGB('000000'); // color
            $sheet->getStyle(chr($chr + $k).$num)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
            $sheet->getStyle(chr($chr + $k).$num)->getBorders()->getRight()->getColor()->setARGB('000000'); // color

            $chr++;
        }

        if ($datas && is_array($datas)){
            $code = $num;
            foreach ($datas as $vo){
                $chr = ord('A');
                $j = 0;
                $pre = '';

                foreach($vo as $key => $v){
                    if ($chr > $ls){
                        $chr = ord('A');
                        $pre = chr($chr + $j);
                        $j++;
                    }
                    $vo[$key] = isset($vo[$key]) ? $vo[$key] : '';
                    //显式指定内容类型
                    $sheet->setCellValueExplicit($pre . chr($chr) . $code, $vo[$key], \PHPExcel_Cell_DataType::TYPE_STRING);
                    //设置边框
                    $sheet->getStyle(chr($chr).$code)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                    $sheet->getStyle(chr($chr).$code)->getBorders()->getTop()->getColor()->setARGB('000000'); // color
                    $sheet->getStyle(chr($chr).$code)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                    $sheet->getStyle(chr($chr).$code)->getBorders()->getBottom()->getColor()->setARGB('000000'); // color
                    $sheet->getStyle(chr($chr).$code)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                    $sheet->getStyle(chr($chr).$code)->getBorders()->getLeft()->getColor()->setARGB('000000'); // color
                    $sheet->getStyle(chr($chr).$code)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                    $sheet->getStyle(chr($chr).$code)->getBorders()->getRight()->getColor()->setARGB('000000'); // color
                    $chr++;
                }
                $code++;
            }
            $total_datas = array();
            foreach ($other as $t => $ot){
                $total_datas[$t][0] = '';
                $total_datas[$t][1] = $ot['team_name'];
                $total_datas[$t][2] = $ot['intention_count'];
                $total_datas[$t][3] = $ot['deal_count'];
                $total_datas[$t][4] = $ot['new_deal_count'];
                $total_datas[$t][5] = $ot['add_count'];
            }
            foreach ($total_datas as $o){
                $chr = ord('A');
                $j = 0;
                $pre = '';
                $t_flag= 0;
                foreach($o as $m => $n){
                    $o[$m] = isset($o[$m]) ? $o[$m] : '';
                    //显式指定内容类型
                    if(chr($chr) == "C" || chr($chr) == "F" || chr($chr) == "I" || chr($chr) == "L"){
//                        echo chr($chr).$code.':'.chr($chr+2).$code;
                        $sheet->mergeCells(chr($chr).$code.':'.chr($chr+2).$code);
                        $sheet->setCellValueExplicit($pre . chr($chr) . $code, $o[$m], \PHPExcel_Cell_DataType::TYPE_STRING);
                        $t_flag = 1;
                        $j      = $j + 3;
                        //设置边框
                        $sheet->getStyle(chr($chr).$code)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                        $sheet->getStyle(chr($chr).$code)->getBorders()->getTop()->getColor()->setARGB('000000'); // color
                        $sheet->getStyle(chr($chr).$code)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                        $sheet->getStyle(chr($chr).$code)->getBorders()->getBottom()->getColor()->setARGB('000000'); // color
                        $sheet->getStyle(chr($chr).$code)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                        $sheet->getStyle(chr($chr).$code)->getBorders()->getLeft()->getColor()->setARGB('000000'); // color
                        $sheet->getStyle(chr($chr).$code)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                        $sheet->getStyle(chr($chr).$code)->getBorders()->getRight()->getColor()->setARGB('000000'); // color

                        //设置边框
                        $sheet->getStyle(chr($chr+1).$code)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                        $sheet->getStyle(chr($chr+1).$code)->getBorders()->getTop()->getColor()->setARGB('000000'); // color
                        $sheet->getStyle(chr($chr+1).$code)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                        $sheet->getStyle(chr($chr+1).$code)->getBorders()->getBottom()->getColor()->setARGB('000000'); // color
                        $sheet->getStyle(chr($chr+1).$code)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                        $sheet->getStyle(chr($chr+1).$code)->getBorders()->getLeft()->getColor()->setARGB('000000'); // color
                        $sheet->getStyle(chr($chr+1).$code)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                        $sheet->getStyle(chr($chr+1).$code)->getBorders()->getRight()->getColor()->setARGB('000000'); // color
                        //设置边框
                        $sheet->getStyle(chr($chr+2).$code)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                        $sheet->getStyle(chr($chr+2).$code)->getBorders()->getTop()->getColor()->setARGB('000000'); // color
                        $sheet->getStyle(chr($chr+2).$code)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                        $sheet->getStyle(chr($chr+2).$code)->getBorders()->getBottom()->getColor()->setARGB('000000'); // color
                        $sheet->getStyle(chr($chr+2).$code)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                        $sheet->getStyle(chr($chr+2).$code)->getBorders()->getLeft()->getColor()->setARGB('000000'); // color
                        $sheet->getStyle(chr($chr+2).$code)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                        $sheet->getStyle(chr($chr+2).$code)->getBorders()->getRight()->getColor()->setARGB('000000'); // color



                        $chr    = $chr + 3;
                    }elseif($t_flag == 0){
                        $sheet->setCellValueExplicit($pre . chr($chr) . $code, $o[$m], \PHPExcel_Cell_DataType::TYPE_STRING);
                        //设置边框
                        $sheet->getStyle(chr($chr).$code)->getBorders()->getTop()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                        $sheet->getStyle(chr($chr).$code)->getBorders()->getTop()->getColor()->setARGB('000000'); // color
                        $sheet->getStyle(chr($chr).$code)->getBorders()->getBottom()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                        $sheet->getStyle(chr($chr).$code)->getBorders()->getBottom()->getColor()->setARGB('000000'); // color
                        $sheet->getStyle(chr($chr).$code)->getBorders()->getLeft()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                        $sheet->getStyle(chr($chr).$code)->getBorders()->getLeft()->getColor()->setARGB('000000'); // color
                        $sheet->getStyle(chr($chr).$code)->getBorders()->getRight()->setBorderStyle(\PHPExcel_Style_Border::BORDER_THIN);
                        $sheet->getStyle(chr($chr).$code)->getBorders()->getRight()->getColor()->setARGB('000000'); // color
                        $chr++;
                    }
                    if ($chr > $ls){
                        $chr = ord('A');
                        $pre = chr($chr + $j);
                        $j++;
                    }
                }
                $code++;
            }
        }
        unset($datas);
        //下载Excel表格
        if ($load){
            header("Content-Type: application/force-download");
            header("Content-Type: application/octet-stream");
            header("Content-Type: application/download");
            header('Content-Disposition:inline;filename="'.$filename.'.xls"');
            header("Content-Transfer-Encoding: binary");
            header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
            header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
            header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
            header("Pragma: no-cache");
            $writer->save('php://output');
        }else{
            //保存表格
            $writer->save($this->_path . $filename . '.xls');

            return iconv('gb2312', 'utf-8', $filename) . '.xls';
        }
    }
}

?>