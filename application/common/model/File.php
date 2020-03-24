<?php
/**
 *
 * +------------------------------------------------------------+
 * @category File.php
 * +------------------------------------------------------------+
 * 文件模型
 * +------------------------------------------------------------+
 *
 * @author lwy
 * Created on 2019年7月31日 17:00:00
 */

namespace app\common\model;

class File extends Common
{
    /**
     * 获取图片完整路径
     *
     * @access public
     * @param $id int 图片id
     * @param $returnDataType string 返回数据类型
     * @return array
     */
    public function getRootPath($id = '', $returnDataType = 'array')
    {
        if (empty($id)) $returnDataType == 'array' ? [] : '';

        $path = [];
        if(strpos($id, ",") === false){
            $path = $this->where('id', $id)->column("root_path", "id");
        }else{
            $path = $this->where('id', 'IN', $id)->column("root_path", "id");
        }

        if (empty($path)) return $returnDataType == 'array' ? [] : '';

        return $returnDataType == 'array' ? $path : $path[$id];
    }

}
