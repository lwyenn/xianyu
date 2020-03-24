/*
Navicat MySQL Data Transfer

Source Server         : bendi
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mban

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-10-30 14:34:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for crm_admin
-- ----------------------------
DROP TABLE IF EXISTS `crm_admin`;
CREATE TABLE `crm_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `admin_username` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `admin_password` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `admin_surename` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '真实姓名',
  `admin_addtime` int(10) DEFAULT '0' COMMENT '添加时间',
  `admin_status` tinyint(1) DEFAULT '1' COMMENT '1启用2禁用',
  `admin_style` tinyint(1) DEFAULT '1' COMMENT '默认样式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of crm_admin
-- ----------------------------
INSERT INTO `crm_admin` VALUES ('1', '1', 'lwy', '3c0042ce996b15743753b503f8276bdd', '云天', '1534743442', '1', '1');
INSERT INTO `crm_admin` VALUES ('2', '2', 'lwyenn', '3c0042ce996b15743753b503f8276bdd', 'yunt', '1545805837', '1', '1');

-- ----------------------------
-- Table structure for crm_file
-- ----------------------------
DROP TABLE IF EXISTS `crm_file`;
CREATE TABLE `crm_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '原文件名',
  `file_name` varchar(255) DEFAULT NULL COMMENT '重命名后的文件名',
  `file_size` varchar(50) DEFAULT NULL COMMENT '文件大小',
  `file_ext` varchar(20) DEFAULT NULL COMMENT '文件格式',
  `save_path` varchar(255) DEFAULT NULL COMMENT '存储路径',
  `file_path` varchar(255) DEFAULT NULL COMMENT '文件所在的文件夹',
  `root_path` varchar(255) DEFAULT NULL,
  `upload_time` int(10) DEFAULT NULL COMMENT '上传时间',
  `action_user` varchar(20) DEFAULT NULL COMMENT '上传用户',
  `file_system` tinyint(1) DEFAULT '1' COMMENT '1旧系统2新系统',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=12950 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='上传文件表';

-- ----------------------------
-- Records of crm_file
-- ----------------------------
INSERT INTO `crm_file` VALUES ('12545', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d809994f0bfa.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d809994f0bfa.jpg', '/upload/index/image/201909/5d809994f0bfa.jpg', '1568709012', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12546', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d80a10240e32.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d80a10240e32.jpg', '/upload/index/image/201909/5d80a10240e32.jpg', '1568710914', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12547', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d80a32d716d4.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d80a32d716d4.jpg', '/upload/index/image/201909/5d80a32d716d4.jpg', '1568711469', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12548', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d80a33f8d554.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d80a33f8d554.jpg', '/upload/index/image/201909/5d80a33f8d554.jpg', '1568711487', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12549', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d80a3571c52a.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d80a3571c52a.jpg', '/upload/index/image/201909/5d80a3571c52a.jpg', '1568711511', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12550', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d80a3e9234b9.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d80a3e9234b9.jpg', '/upload/index/image/201909/5d80a3e9234b9.jpg', '1568711657', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12551', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d80a6faee407.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d80a6faee407.jpg', '/upload/index/image/201909/5d80a6faee407.jpg', '1568712442', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12552', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d80a7a6abb73.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d80a7a6abb73.jpg', '/upload/index/image/201909/5d80a7a6abb73.jpg', '1568712614', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12553', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d80a804b20d9.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d80a804b20d9.jpg', '/upload/index/image/201909/5d80a804b20d9.jpg', '1568712708', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12554', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d80a8699d78e.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d80a8699d78e.jpg', '/upload/index/image/201909/5d80a8699d78e.jpg', '1568712809', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12555', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d80a8c959d30.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d80a8c959d30.jpg', '/upload/index/image/201909/5d80a8c959d30.jpg', '1568712905', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12556', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d80aa3b75e7d.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d80aa3b75e7d.jpg', '/upload/index/image/201909/5d80aa3b75e7d.jpg', '1568713275', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12557', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d80ae515affc.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d80ae515affc.jpg', '/upload/index/image/201909/5d80ae515affc.jpg', '1568714321', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12558', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d80af089426c.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d80af089426c.jpg', '/upload/index/image/201909/5d80af089426c.jpg', '1568714504', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12559', '7119492_114440620000_2.jpg', '5d80f370ac19f.jpg', '158334', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d80f370ac19f.jpg', '/upload/index/image/201909/5d80f370ac19f.jpg', '1568732016', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12560', '6f43b5263fbba79c5962514b85d34738_S.jpg', '5d818c0242187.jpg', '21950', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d818c0242187.jpg', '/upload/index/image/201909/5d818c0242187.jpg', '1568771074', '云天', '2');
INSERT INTO `crm_file` VALUES ('12561', '营销模块优化 (1).rar', '5d818c5bb6a07.rar', '1199776', 'rar', 'upload/index/image/201909/', 'upload/index/image/201909/5d818c5bb6a07.rar', '/upload/index/image/201909/5d818c5bb6a07.rar', '1568771163', '云天', '2');
INSERT INTO `crm_file` VALUES ('12562', '营销模块优化 (1).rar', '5d818c734e3af.rar', '1199776', 'rar', 'upload/index/image/201909/', 'upload/index/image/201909/5d818c734e3af.rar', '/upload/index/image/201909/5d818c734e3af.rar', '1568771187', '云天', '2');
INSERT INTO `crm_file` VALUES ('12563', '林文液销售业绩列表-2019-6-01-2019-6-30.xls', '5d818c798952e.xls', '9216', 'xls', 'upload/index/image/201909/', 'upload/index/image/201909/5d818c798952e.xls', '/upload/index/image/201909/5d818c798952e.xls', '1568771193', '云天', '2');
INSERT INTO `crm_file` VALUES ('12564', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d818cf056b8f.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d818cf056b8f.jpg', '/upload/index/image/201909/5d818cf056b8f.jpg', '1568771312', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12565', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d818d0bd243e.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d818d0bd243e.jpg', '/upload/index/image/201909/5d818d0bd243e.jpg', '1568771339', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12566', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d81d52228c1e.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d81d52228c1e.jpg', '/upload/index/image/201909/5d81d52228c1e.jpg', '1568789794', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12567', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d81d577593e5.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d81d577593e5.jpg', '/upload/index/image/201909/5d81d577593e5.jpg', '1568789879', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12568', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d81d64930f6a.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d81d64930f6a.jpg', '/upload/index/image/201909/5d81d64930f6a.jpg', '1568790089', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12569', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d81d6acd100d.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d81d6acd100d.jpg', '/upload/index/image/201909/5d81d6acd100d.jpg', '1568790188', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12570', 'kf.png', '5d81e8ca4a575.png', '10888', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d81e8ca4a575.png', '/upload/index/image/201909/5d81e8ca4a575.png', '1568794826', '云天', '2');
INSERT INTO `crm_file` VALUES ('12571', 'td.png', '5d81eb824fcde.png', '12357', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d81eb824fcde.png', '/upload/index/image/201909/5d81eb824fcde.png', '1568795522', '云天', '2');
INSERT INTO `crm_file` VALUES ('12572', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d81ee322cb69.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d81ee322cb69.jpg', '/upload/index/image/201909/5d81ee322cb69.jpg', '1568796210', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12573', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d81ee64e7b3a.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d81ee64e7b3a.jpg', '/upload/index/image/201909/5d81ee64e7b3a.jpg', '1568796260', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12574', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d81eea857397.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d81eea857397.jpg', '/upload/index/image/201909/5d81eea857397.jpg', '1568796328', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12575', '47e58PICQUR_1024.jpg', '5d81fbdbf271d.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d81fbdbf271d.jpg', '/upload/index/image/201909/5d81fbdbf271d.jpg', '1568799707', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12576', '8164280_104301508000_2.jpg', '5d81fbdc332d8.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d81fbdc332d8.jpg', '/upload/index/image/201909/5d81fbdc332d8.jpg', '1568799708', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12577', '18063302_210604412116_2.jpg', '5d81fbddc7fa0.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d81fbddc7fa0.jpg', '/upload/index/image/201909/5d81fbddc7fa0.jpg', '1568799709', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12578', '18179070_152408117000_2.jpg', '5d81fbdff3b26.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d81fbdff3b26.jpg', '/upload/index/image/201909/5d81fbdff3b26.jpg', '1568799711', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12579', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d81fbe2327fb.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d81fbe2327fb.jpg', '/upload/index/image/201909/5d81fbe2327fb.jpg', '1568799714', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12580', '8164280_104301508000_2.jpg', '5d81fd28ecedf.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d81fd28ecedf.jpg', '/upload/index/image/201909/5d81fd28ecedf.jpg', '1568800040', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12581', '18063302_210604412116_2.jpg', '5d81fd2a384ce.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d81fd2a384ce.jpg', '/upload/index/image/201909/5d81fd2a384ce.jpg', '1568800042', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12582', '47e58PICQUR_1024.jpg', '5d8200208f8b0.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8200208f8b0.jpg', '/upload/index/image/201909/5d8200208f8b0.jpg', '1568800800', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12583', '8164280_104301508000_2.jpg', '5d820020c7f37.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d820020c7f37.jpg', '/upload/index/image/201909/5d820020c7f37.jpg', '1568800800', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12584', '18063302_210604412116_2.jpg', '5d8200226bcb2.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8200226bcb2.jpg', '/upload/index/image/201909/5d8200226bcb2.jpg', '1568800802', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12585', '18179070_152408117000_2.jpg', '5d8200249c79d.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8200249c79d.jpg', '/upload/index/image/201909/5d8200249c79d.jpg', '1568800804', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12586', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d820026df9e9.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d820026df9e9.jpg', '/upload/index/image/201909/5d820026df9e9.jpg', '1568800806', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12587', '18063302_210604412116_2.jpg', '5d82003363e3a.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82003363e3a.jpg', '/upload/index/image/201909/5d82003363e3a.jpg', '1568800819', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12588', '47e58PICQUR_1024.jpg', '5d82003a9486a.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82003a9486a.jpg', '/upload/index/image/201909/5d82003a9486a.jpg', '1568800826', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12589', '8164280_104301508000_2.jpg', '5d82003ac08ff.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82003ac08ff.jpg', '/upload/index/image/201909/5d82003ac08ff.jpg', '1568800826', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12590', '18063302_210604412116_2.jpg', '5d82003af18c1.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82003af18c1.jpg', '/upload/index/image/201909/5d82003af18c1.jpg', '1568800826', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12591', '18179070_152408117000_2.jpg', '5d82003b37c04.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82003b37c04.jpg', '/upload/index/image/201909/5d82003b37c04.jpg', '1568800827', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12592', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d82003b72a6e.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82003b72a6e.jpg', '/upload/index/image/201909/5d82003b72a6e.jpg', '1568800827', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12593', '18179070_152408117000_2.jpg', '5d82023f59c19.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82023f59c19.jpg', '/upload/index/image/201909/5d82023f59c19.jpg', '1568801343', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12594', '18179070_152408117000_2.jpg', '5d8205e0c0f36.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8205e0c0f36.jpg', '/upload/index/image/201909/5d8205e0c0f36.jpg', '1568802272', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12595', '18063302_210604412116_2.jpg', '5d8206818e39f.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8206818e39f.jpg', '/upload/index/image/201909/5d8206818e39f.jpg', '1568802433', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12596', '8164280_104301508000_2.jpg', '5d8206d43bdb9.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8206d43bdb9.jpg', '/upload/index/image/201909/5d8206d43bdb9.jpg', '1568802516', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12597', '18063302_210604412116_2.jpg', '5d8208d99a5b2.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8208d99a5b2.jpg', '/upload/index/image/201909/5d8208d99a5b2.jpg', '1568803033', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12598', 'dhjl.png', '5d820915ab480.png', '4322', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d820915ab480.png', '/upload/index/image/201909/5d820915ab480.png', '1568803093', '云天', '2');
INSERT INTO `crm_file` VALUES ('12599', '18063302_210604412116_2.jpg', '5d82d8c0c7791.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82d8c0c7791.jpg', '/upload/index/image/201909/5d82d8c0c7791.jpg', '1568856256', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12600', '18179070_152408117000_2.jpg', '5d82d8c39b87e.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82d8c39b87e.jpg', '/upload/index/image/201909/5d82d8c39b87e.jpg', '1568856259', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12601', '47e58PICQUR_1024.jpg', '5d82d8c977545.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82d8c977545.jpg', '/upload/index/image/201909/5d82d8c977545.jpg', '1568856265', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12602', '8164280_104301508000_2.jpg', '5d82d8c99df2e.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82d8c99df2e.jpg', '/upload/index/image/201909/5d82d8c99df2e.jpg', '1568856265', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12603', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d82d8c9c41ec.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82d8c9c41ec.jpg', '/upload/index/image/201909/5d82d8c9c41ec.jpg', '1568856265', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12604', 'wddh.png', '5d82d9f755a75.png', '11746', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d82d9f755a75.png', '/upload/index/image/201909/5d82d9f755a75.png', '1568856567', '云天', '2');
INSERT INTO `crm_file` VALUES ('12605', '18179070_152408117000_2.jpg', '5d82dab662433.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82dab662433.jpg', '/upload/index/image/201909/5d82dab662433.jpg', '1568856758', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12606', 'kf.png', '5d82db7b3c916.png', '10888', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d82db7b3c916.png', '/upload/index/image/201909/5d82db7b3c916.png', '1568856955', '云天', '2');
INSERT INTO `crm_file` VALUES ('12607', 'jcls.png', '5d82db8d63fa5.png', '9187', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d82db8d63fa5.png', '/upload/index/image/201909/5d82db8d63fa5.png', '1568856973', '云天', '2');
INSERT INTO `crm_file` VALUES ('12608', '8164280_104301508000_2.jpg', '5d82dc5bb5bd0.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82dc5bb5bd0.jpg', '/upload/index/image/201909/5d82dc5bb5bd0.jpg', '1568857179', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12609', '18179070_152408117000_2.jpg', '5d82dc8b3892a.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82dc8b3892a.jpg', '/upload/index/image/201909/5d82dc8b3892a.jpg', '1568857227', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12610', '18179070_152408117000_2.jpg', '5d82dca8bd6ef.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82dca8bd6ef.jpg', '/upload/index/image/201909/5d82dca8bd6ef.jpg', '1568857256', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12611', '47e58PICQUR_1024.jpg', '5d82e16d8f794.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82e16d8f794.jpg', '/upload/index/image/201909/5d82e16d8f794.jpg', '1568858477', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12612', 'kf.png', '5d82e23f679a0.png', '10888', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d82e23f679a0.png', '/upload/index/image/201909/5d82e23f679a0.png', '1568858687', '云天', '2');
INSERT INTO `crm_file` VALUES ('12613', '18179070_152408117000_2.jpg', '5d82e8d6c22ae.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82e8d6c22ae.jpg', '/upload/index/image/201909/5d82e8d6c22ae.jpg', '1568860374', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12614', '18179070_152408117000_2.jpg', '5d82efa329c0a.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82efa329c0a.jpg', '/upload/index/image/201909/5d82efa329c0a.jpg', '1568862115', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12615', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d82efc2c805f.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82efc2c805f.jpg', '/upload/index/image/201909/5d82efc2c805f.jpg', '1568862146', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12616', '47e58PICQUR_1024.jpg', '5d82f1b0f16f8.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82f1b0f16f8.jpg', '/upload/index/image/201909/5d82f1b0f16f8.jpg', '1568862640', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12617', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d82f20e7e9e6.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82f20e7e9e6.jpg', '/upload/index/image/201909/5d82f20e7e9e6.jpg', '1568862734', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12618', '18179070_152408117000_2.jpg', '5d82f273538c9.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82f273538c9.jpg', '/upload/index/image/201909/5d82f273538c9.jpg', '1568862835', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12619', '18063302_210604412116_2.jpg', '5d82f36a9f280.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d82f36a9f280.jpg', '/upload/index/image/201909/5d82f36a9f280.jpg', '1568863082', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12620', '测试图.jpg', '5d8ad6a76ea4d.jpg', '37280', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8ad6a76ea4d.jpg', '/upload/index/image/201909/5d8ad6a76ea4d.jpg', '1569380007', '柚子哇', '2');
INSERT INTO `crm_file` VALUES ('12621', 'kf.png', '5d8addc918e7f.png', '10888', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d8addc918e7f.png', '/upload/index/image/201909/5d8addc918e7f.png', '1569381833', '云天', '2');
INSERT INTO `crm_file` VALUES ('12622', '18179070_152408117000_2.jpg', '5d8aef700d219.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8aef700d219.jpg', '/upload/index/image/201909/5d8aef700d219.jpg', '1569386352', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12623', '18179070_152408117000_2.jpg', '5d8b0f21be8d4.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8b0f21be8d4.jpg', '/upload/index/image/201909/5d8b0f21be8d4.jpg', '1569394465', '乐乐', '2');
INSERT INTO `crm_file` VALUES ('12624', '18179070_152408117000_2.jpg', '5d8b12591da37.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8b12591da37.jpg', '/upload/index/image/201909/5d8b12591da37.jpg', '1569395289', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12625', '47e58PICQUR_1024.jpg', '5d8b1643d8181.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8b1643d8181.jpg', '/upload/index/image/201909/5d8b1643d8181.jpg', '1569396291', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12626', '8164280_104301508000_2.jpg', '5d8b19c245fae.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8b19c245fae.jpg', '/upload/index/image/201909/5d8b19c245fae.jpg', '1569397186', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12627', '18063302_210604412116_2.jpg', '5d8b1af59b684.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8b1af59b684.jpg', '/upload/index/image/201909/5d8b1af59b684.jpg', '1569397493', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12628', '18063302_210604412116_2.jpg', '5d8b1c574ac88.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8b1c574ac88.jpg', '/upload/index/image/201909/5d8b1c574ac88.jpg', '1569397847', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12629', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d8b2105ec635.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8b2105ec635.jpg', '/upload/index/image/201909/5d8b2105ec635.jpg', '1569399045', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12630', '测试图.jpg', '5d8b22e8cb3e0.jpg', '37280', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8b22e8cb3e0.jpg', '/upload/index/image/201909/5d8b22e8cb3e0.jpg', '1569399528', '柚子哇', '2');
INSERT INTO `crm_file` VALUES ('12631', '测试图.jpg', '5d8b230ee6c19.jpg', '37280', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8b230ee6c19.jpg', '/upload/index/image/201909/5d8b230ee6c19.jpg', '1569399566', '柚子哇', '2');
INSERT INTO `crm_file` VALUES ('12632', '18179070_152408117000_2.jpg', '5d8b2af067880.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8b2af067880.jpg', '/upload/index/image/201909/5d8b2af067880.jpg', '1569401584', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12633', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d8b2c0eeeda0.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8b2c0eeeda0.jpg', '/upload/index/image/201909/5d8b2c0eeeda0.jpg', '1569401870', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12634', '18063302_210604412116_2.jpg', '5d8b2efb4227e.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8b2efb4227e.jpg', '/upload/index/image/201909/5d8b2efb4227e.jpg', '1569402619', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12635', '测试图.jpg', '5d8b312f5165a.jpg', '37280', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8b312f5165a.jpg', '/upload/index/image/201909/5d8b312f5165a.jpg', '1569403183', '柚子哇', '2');
INSERT INTO `crm_file` VALUES ('12636', 'B4-1080-1920.jpg', '5d8b3611cfc2e.jpg', '1272221', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8b3611cfc2e.jpg', '/upload/index/image/201909/5d8b3611cfc2e.jpg', '1569404433', 'aaa', '2');
INSERT INTO `crm_file` VALUES ('12637', 'B1-1080-1920.jpg', '5d8b46ac6590e.jpg', '1261152', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8b46ac6590e.jpg', '/upload/index/image/201909/5d8b46ac6590e.jpg', '1569408684', 'aaa', '2');
INSERT INTO `crm_file` VALUES ('12638', '18063302_210604412116_2.jpg', '5d8b471077b1d.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8b471077b1d.jpg', '/upload/index/image/201909/5d8b471077b1d.jpg', '1569408784', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12639', 'B3-1080-1920.jpg', '5d8b484cf104a.jpg', '1256152', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8b484cf104a.jpg', '/upload/index/image/201909/5d8b484cf104a.jpg', '1569409100', 'aaa', '2');
INSERT INTO `crm_file` VALUES ('12640', '18179070_152408117000_2.jpg', '5d8b48cc96182.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8b48cc96182.jpg', '/upload/index/image/201909/5d8b48cc96182.jpg', '1569409228', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12641', '47e58PICQUR_1024.jpg', '5d8c5d0336bcc.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8c5d0336bcc.jpg', '/upload/index/image/201909/5d8c5d0336bcc.jpg', '1569479939', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12642', '18063302_210604412116_2.jpg', '5d8c5db7064db.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8c5db7064db.jpg', '/upload/index/image/201909/5d8c5db7064db.jpg', '1569480119', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12643', '47e58PICQUR_1024.jpg', '5d8c5f05a4d76.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8c5f05a4d76.jpg', '/upload/index/image/201909/5d8c5f05a4d76.jpg', '1569480453', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12644', '测试图.jpg', '5d8c6c07ad909.jpg', '37280', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8c6c07ad909.jpg', '/upload/index/image/201909/5d8c6c07ad909.jpg', '1569483783', '柚子哇', '2');
INSERT INTO `crm_file` VALUES ('12645', 'kf.png', '5d8c99bba62cf.png', '10888', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d8c99bba62cf.png', '/upload/index/image/201909/5d8c99bba62cf.png', '1569495483', '云天', '2');
INSERT INTO `crm_file` VALUES ('12646', 'jcls.png', '5d8c99ebb1b5c.png', '9187', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d8c99ebb1b5c.png', '/upload/index/image/201909/5d8c99ebb1b5c.png', '1569495531', '云天', '2');
INSERT INTO `crm_file` VALUES ('12647', '18179070_152408117000_2.jpg', '5d8c9a1b0a2c1.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8c9a1b0a2c1.jpg', '/upload/index/image/201909/5d8c9a1b0a2c1.jpg', '1569495579', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12648', '18179070_152408117000_2.jpg', '5d8ca3d50e823.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8ca3d50e823.jpg', '/upload/index/image/201909/5d8ca3d50e823.jpg', '1569498069', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12649', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d8ca3d8e3275.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8ca3d8e3275.jpg', '/upload/index/image/201909/5d8ca3d8e3275.jpg', '1569498072', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12650', '47e58PICQUR_1024.jpg', '5d8d66ff0c433.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d66ff0c433.jpg', '/upload/index/image/201909/5d8d66ff0c433.jpg', '1569548031', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12651', '8164280_104301508000_2.jpg', '5d8d67903ad2d.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d67903ad2d.jpg', '/upload/index/image/201909/5d8d67903ad2d.jpg', '1569548176', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12652', '8164280_104301508000_2.jpg', '5d8d6865c1267.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d6865c1267.jpg', '/upload/index/image/201909/5d8d6865c1267.jpg', '1569548389', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12653', '18179070_152408117000_2.jpg', '5d8d6bf9bcc00.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d6bf9bcc00.jpg', '/upload/index/image/201909/5d8d6bf9bcc00.jpg', '1569549305', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12654', '测试图.jpg', '5d8d6d301a674.jpg', '37280', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d6d301a674.jpg', '/upload/index/image/201909/5d8d6d301a674.jpg', '1569549616', '柚子哇', '2');
INSERT INTO `crm_file` VALUES ('12655', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d8d75869f52c.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d75869f52c.jpg', '/upload/index/image/201909/5d8d75869f52c.jpg', '1569551750', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12656', '8164280_104301508000_2.jpg', '5d8d7ae64247b.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d7ae64247b.jpg', '/upload/index/image/201909/5d8d7ae64247b.jpg', '1569553126', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12657', 'jcls.png', '5d8d7c7183d50.png', '9187', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d7c7183d50.png', '/upload/index/image/201909/5d8d7c7183d50.png', '1569553521', '云天', '2');
INSERT INTO `crm_file` VALUES ('12658', 'jcls.png', '5d8d7cdb599d2.png', '9187', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d7cdb599d2.png', '/upload/index/image/201909/5d8d7cdb599d2.png', '1569553627', '云天', '2');
INSERT INTO `crm_file` VALUES ('12659', '8164280_104301508000_2.jpg', '5d8d7da9c96a4.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d7da9c96a4.jpg', '/upload/index/image/201909/5d8d7da9c96a4.jpg', '1569553833', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12660', '18179070_152408117000_2.jpg', '5d8d7ef726ea3.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d7ef726ea3.jpg', '/upload/index/image/201909/5d8d7ef726ea3.jpg', '1569554167', '林乐乐', '2');
INSERT INTO `crm_file` VALUES ('12661', '18063302_210604412116_2.jpg', '5d8d8061326b7.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d8061326b7.jpg', '/upload/index/image/201909/5d8d8061326b7.jpg', '1569554529', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12662', '测试图.jpg', '5d8d831dd02ce.jpg', '37280', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d831dd02ce.jpg', '/upload/index/image/201909/5d8d831dd02ce.jpg', '1569555229', '柚子哇', '2');
INSERT INTO `crm_file` VALUES ('12663', 'wddh.png', '5d8d8378b8745.png', '11746', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d8378b8745.png', '/upload/index/image/201909/5d8d8378b8745.png', '1569555320', '云天', '2');
INSERT INTO `crm_file` VALUES ('12664', 'kf.png', '5d8d84a2d4c54.png', '10888', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d84a2d4c54.png', '/upload/index/image/201909/5d8d84a2d4c54.png', '1569555618', '云天', '2');
INSERT INTO `crm_file` VALUES ('12665', 'td.png', '5d8d85219f20e.png', '12357', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d85219f20e.png', '/upload/index/image/201909/5d8d85219f20e.png', '1569555745', '云天', '2');
INSERT INTO `crm_file` VALUES ('12666', 'jcls.png', '5d8d859e1a526.png', '9187', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d859e1a526.png', '/upload/index/image/201909/5d8d859e1a526.png', '1569555870', '云天', '2');
INSERT INTO `crm_file` VALUES ('12667', 'jcls.png', '5d8d85b56fcaa.png', '9187', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d85b56fcaa.png', '/upload/index/image/201909/5d8d85b56fcaa.png', '1569555893', '云天', '2');
INSERT INTO `crm_file` VALUES ('12668', 'jcls.png', '5d8d85c3a2b6a.png', '9187', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d85c3a2b6a.png', '/upload/index/image/201909/5d8d85c3a2b6a.png', '1569555907', '云天', '2');
INSERT INTO `crm_file` VALUES ('12669', 'img02.jpg', '5d8d85df9d758.jpg', '220378', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d85df9d758.jpg', '/upload/index/image/201909/5d8d85df9d758.jpg', '1569555935', '云天', '2');
INSERT INTO `crm_file` VALUES ('12670', '202559.jpg', '5d8d85ee66382.jpg', '428730', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d85ee66382.jpg', '/upload/index/image/201909/5d8d85ee66382.jpg', '1569555950', '云天', '2');
INSERT INTO `crm_file` VALUES ('12671', 'You know the Power of Commad Line - By PCbots.png', '5d8d864a0d5d3.png', '717066', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d864a0d5d3.png', '/upload/index/image/201909/5d8d864a0d5d3.png', '1569556042', '云天', '2');
INSERT INTO `crm_file` VALUES ('12672', 'Steve jobs Make a Good Team.png', '5d8d86908f0d1.png', '1037971', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d86908f0d1.png', '/upload/index/image/201909/5d8d86908f0d1.png', '1569556112', '云天', '2');
INSERT INTO `crm_file` VALUES ('12673', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d8d905f216f2.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d905f216f2.jpg', '/upload/index/image/201909/5d8d905f216f2.jpg', '1569558623', '林乐乐', '2');
INSERT INTO `crm_file` VALUES ('12674', '18179070_152408117000_2.jpg', '5d8d970456d44.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d970456d44.jpg', '/upload/index/image/201909/5d8d970456d44.jpg', '1569560324', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12675', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d8d9708b6516.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8d9708b6516.jpg', '/upload/index/image/201909/5d8d9708b6516.jpg', '1569560328', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12676', 'You know the Power of Commad Line - By PCbots.png', '5d8da2b790699.png', '717066', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d8da2b790699.png', '/upload/index/image/201909/5d8da2b790699.png', '1569563319', '云天', '2');
INSERT INTO `crm_file` VALUES ('12677', 'internet.jpg', '5d8da34de5343.jpg', '124506', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8da34de5343.jpg', '/upload/index/image/201909/5d8da34de5343.jpg', '1569563469', '云天', '2');
INSERT INTO `crm_file` VALUES ('12678', 'Try it.png', '5d8da3c99aff9.png', '1665400', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d8da3c99aff9.png', '/upload/index/image/201909/5d8da3c99aff9.png', '1569563593', '云天', '2');
INSERT INTO `crm_file` VALUES ('12679', '111123.jpg', '5d8da3fce08c4.jpg', '634122', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8da3fce08c4.jpg', '/upload/index/image/201909/5d8da3fce08c4.jpg', '1569563644', '云天', '2');
INSERT INTO `crm_file` VALUES ('12680', '18179070_152408117000_2.jpg', '5d8da8eb02c6a.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8da8eb02c6a.jpg', '/upload/index/image/201909/5d8da8eb02c6a.jpg', '1569564907', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12681', '18179070_152408117000_2.jpg', '5d8db14183337.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8db14183337.jpg', '/upload/index/image/201909/5d8db14183337.jpg', '1569567041', '林乐乐', '2');
INSERT INTO `crm_file` VALUES ('12682', '18063302_210604412116_2.jpg', '5d8db14b67656.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8db14b67656.jpg', '/upload/index/image/201909/5d8db14b67656.jpg', '1569567051', '林乐乐', '2');
INSERT INTO `crm_file` VALUES ('12683', '47e58PICQUR_1024.jpg', '5d8db1567027b.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8db1567027b.jpg', '/upload/index/image/201909/5d8db1567027b.jpg', '1569567062', '林乐乐', '2');
INSERT INTO `crm_file` VALUES ('12684', '8164280_104301508000_2.jpg', '5d8db15a7b3c6.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8db15a7b3c6.jpg', '/upload/index/image/201909/5d8db15a7b3c6.jpg', '1569567066', '林乐乐', '2');
INSERT INTO `crm_file` VALUES ('12685', '47e58PICQUR_1024.jpg', '5d8db373007ec.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8db373007ec.jpg', '/upload/index/image/201909/5d8db373007ec.jpg', '1569567603', '林乐乐', '2');
INSERT INTO `crm_file` VALUES ('12686', '8164280_104301508000_2.jpg', '5d8db37323392.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8db37323392.jpg', '/upload/index/image/201909/5d8db37323392.jpg', '1569567603', '林乐乐', '2');
INSERT INTO `crm_file` VALUES ('12687', '18063302_210604412116_2.jpg', '5d8dd80ddbbba.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8dd80ddbbba.jpg', '/upload/index/image/201909/5d8dd80ddbbba.jpg', '1569576973', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12688', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d8dd818bbfcb.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8dd818bbfcb.jpg', '/upload/index/image/201909/5d8dd818bbfcb.jpg', '1569576984', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12689', '47e58PICQUR_1024.jpg', '5d8dd81d8f5fa.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8dd81d8f5fa.jpg', '/upload/index/image/201909/5d8dd81d8f5fa.jpg', '1569576989', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12690', '8164280_104301508000_2.jpg', '5d8dd81db0d3f.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8dd81db0d3f.jpg', '/upload/index/image/201909/5d8dd81db0d3f.jpg', '1569576989', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12691', '18063302_210604412116_2.jpg', '5d8dd81dd6746.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8dd81dd6746.jpg', '/upload/index/image/201909/5d8dd81dd6746.jpg', '1569576989', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12692', '18179070_152408117000_2.jpg', '5d8dd81f16bc4.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8dd81f16bc4.jpg', '/upload/index/image/201909/5d8dd81f16bc4.jpg', '1569576991', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12693', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d8dd836300cf.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8dd836300cf.jpg', '/upload/index/image/201909/5d8dd836300cf.jpg', '1569577014', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12694', '18063302_210604412116_2.jpg', '5d8dd83e2255b.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8dd83e2255b.jpg', '/upload/index/image/201909/5d8dd83e2255b.jpg', '1569577022', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12695', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d8dd8459ca4b.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8dd8459ca4b.jpg', '/upload/index/image/201909/5d8dd8459ca4b.jpg', '1569577029', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12696', '47e58PICQUR_1024.jpg', '5d8dd89890a5d.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d8dd89890a5d.jpg', '/upload/index/image/201909/5d8dd89890a5d.jpg', '1569577112', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12697', '18179070_152408117000_2.jpg', '5d900f2c67ef4.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d900f2c67ef4.jpg', '/upload/index/image/201909/5d900f2c67ef4.jpg', '1569722156', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12698', '测试图.jpg', '5d901e2a352c6.jpg', '37280', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d901e2a352c6.jpg', '/upload/index/image/201909/5d901e2a352c6.jpg', '1569725994', '彭于晏', '2');
INSERT INTO `crm_file` VALUES ('12699', '测试图.jpg', '5d90216a24e64.jpg', '37280', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90216a24e64.jpg', '/upload/index/image/201909/5d90216a24e64.jpg', '1569726826', '彭于晏', '2');
INSERT INTO `crm_file` VALUES ('12700', '测试图.jpg', '5d904322b7d38.jpg', '37280', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d904322b7d38.jpg', '/upload/index/image/201909/5d904322b7d38.jpg', '1569735458', '柚子哇', '2');
INSERT INTO `crm_file` VALUES ('12701', '18179070_152408117000_2.jpg', '5d9044a6e9f06.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d9044a6e9f06.jpg', '/upload/index/image/201909/5d9044a6e9f06.jpg', '1569735846', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12702', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d9044af8568d.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d9044af8568d.jpg', '/upload/index/image/201909/5d9044af8568d.jpg', '1569735855', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12703', '18179070_152408117000_2.jpg', '5d9044b5984ee.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d9044b5984ee.jpg', '/upload/index/image/201909/5d9044b5984ee.jpg', '1569735861', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12704', '8164280_104301508000_2.jpg', '5d9044cc98e64.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d9044cc98e64.jpg', '/upload/index/image/201909/5d9044cc98e64.jpg', '1569735884', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12705', 'hackers got an idea.png', '5d9046d023c08.png', '110172', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d9046d023c08.png', '/upload/index/image/201909/5d9046d023c08.png', '1569736400', '云天', '2');
INSERT INTO `crm_file` VALUES ('12706', '测试图.jpg', '5d904b18eb7bf.jpg', '37280', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d904b18eb7bf.jpg', '/upload/index/image/201909/5d904b18eb7bf.jpg', '1569737496', '彭于晏', '2');
INSERT INTO `crm_file` VALUES ('12707', 'internet.jpg', '5d904d78bc00e.jpg', '124506', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d904d78bc00e.jpg', '/upload/index/image/201909/5d904d78bc00e.jpg', '1569738104', '云天', '2');
INSERT INTO `crm_file` VALUES ('12708', '18063302_210604412116_2.jpg', '5d90537a7e33a.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90537a7e33a.jpg', '/upload/index/image/201909/5d90537a7e33a.jpg', '1569739642', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12709', '18179070_152408117000_2.jpg', '5d90547ef2804.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90547ef2804.jpg', '/upload/index/image/201909/5d90547ef2804.jpg', '1569739902', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12710', '47e58PICQUR_1024.jpg', '5d90562396734.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90562396734.jpg', '/upload/index/image/201909/5d90562396734.jpg', '1569740323', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12711', '8164280_104301508000_2.jpg', '5d905623b8f48.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d905623b8f48.jpg', '/upload/index/image/201909/5d905623b8f48.jpg', '1569740323', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12712', '18063302_210604412116_2.jpg', '5d905623dc84d.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d905623dc84d.jpg', '/upload/index/image/201909/5d905623dc84d.jpg', '1569740323', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12713', '18179070_152408117000_2.jpg', '5d90562416045.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90562416045.jpg', '/upload/index/image/201909/5d90562416045.jpg', '1569740324', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12714', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d90562444e4c.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90562444e4c.jpg', '/upload/index/image/201909/5d90562444e4c.jpg', '1569740324', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12715', '6dde4830bad6b44af690f59fa3fcacbc.jpg', '5d90568ff2649.jpg', '48403', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90568ff2649.jpg', '/upload/index/image/201909/5d90568ff2649.jpg', '1569740431', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12716', '20121114001249_x5V2c.jpeg', '5d9056901b596.jpeg', '146425', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d9056901b596.jpeg', '/upload/index/image/201909/5d9056901b596.jpeg', '1569740432', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12717', '20141015144312_NixPw.jpeg', '5d9056903a2e2.jpeg', '55249', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d9056903a2e2.jpeg', '/upload/index/image/201909/5d9056903a2e2.jpeg', '1569740432', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12718', '20160407145436_8rVYj.jpeg', '5d9056905dd53.jpeg', '159047', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d9056905dd53.jpeg', '/upload/index/image/201909/5d9056905dd53.jpeg', '1569740432', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12719', 'banner03.png', '5d905e052cf79.png', '83220', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d905e052cf79.png', '/upload/index/image/201909/5d905e052cf79.png', '1569742341', '云天', '2');
INSERT INTO `crm_file` VALUES ('12720', 'dhjl.png', '5d905e0584ffa.png', '4322', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d905e0584ffa.png', '/upload/index/image/201909/5d905e0584ffa.png', '1569742341', '云天', '2');
INSERT INTO `crm_file` VALUES ('12721', 'img02.jpg', '5d905e05df2fe.jpg', '220378', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d905e05df2fe.jpg', '/upload/index/image/201909/5d905e05df2fe.jpg', '1569742341', '云天', '2');
INSERT INTO `crm_file` VALUES ('12722', 'jcls.png', '5d905e0643f39.png', '9187', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d905e0643f39.png', '/upload/index/image/201909/5d905e0643f39.png', '1569742342', '云天', '2');
INSERT INTO `crm_file` VALUES ('12723', 'kf.png', '5d905e069c524.png', '10888', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d905e069c524.png', '/upload/index/image/201909/5d905e069c524.png', '1569742342', '云天', '2');
INSERT INTO `crm_file` VALUES ('12724', 'jcls.png', '5d905e1c0adf5.png', '9187', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d905e1c0adf5.png', '/upload/index/image/201909/5d905e1c0adf5.png', '1569742364', '云天', '2');
INSERT INTO `crm_file` VALUES ('12725', 'kf.png', '5d905e1c7b065.png', '10888', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d905e1c7b065.png', '/upload/index/image/201909/5d905e1c7b065.png', '1569742364', '云天', '2');
INSERT INTO `crm_file` VALUES ('12726', 'sz.png', '5d905e1d1f4f9.png', '11451', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d905e1d1f4f9.png', '/upload/index/image/201909/5d905e1d1f4f9.png', '1569742365', '云天', '2');
INSERT INTO `crm_file` VALUES ('12727', 'td.png', '5d905e1d92144.png', '12357', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d905e1d92144.png', '/upload/index/image/201909/5d905e1d92144.png', '1569742365', '云天', '2');
INSERT INTO `crm_file` VALUES ('12728', 'tjls.png', '5d905e1e08ce8.png', '8926', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d905e1e08ce8.png', '/upload/index/image/201909/5d905e1e08ce8.png', '1569742366', '云天', '2');
INSERT INTO `crm_file` VALUES ('12729', 'tjr.png', '5d905e1e7db51.png', '12304', 'png', 'upload/index/image/201909/', 'upload/index/image/201909/5d905e1e7db51.png', '/upload/index/image/201909/5d905e1e7db51.png', '1569742366', '云天', '2');
INSERT INTO `crm_file` VALUES ('12730', '6dde4830bad6b44af690f59fa3fcacbc.jpg', '5d90660b3c3c9.jpg', '48403', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90660b3c3c9.jpg', '/upload/index/image/201909/5d90660b3c3c9.jpg', '1569744395', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12731', '47e58PICQUR_1024.jpg', '5d90660b55cae.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90660b55cae.jpg', '/upload/index/image/201909/5d90660b55cae.jpg', '1569744395', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12732', '8164280_104301508000_2.jpg', '5d90660b7a369.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90660b7a369.jpg', '/upload/index/image/201909/5d90660b7a369.jpg', '1569744395', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12733', '18063302_210604412116_2.jpg', '5d90660b9fd24.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90660b9fd24.jpg', '/upload/index/image/201909/5d90660b9fd24.jpg', '1569744395', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12734', '18179070_152408117000_2.jpg', '5d90660bd1201.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90660bd1201.jpg', '/upload/index/image/201909/5d90660bd1201.jpg', '1569744395', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12735', '20121114001249_x5V2c.jpeg', '5d90660c13997.jpeg', '146425', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90660c13997.jpeg', '/upload/index/image/201909/5d90660c13997.jpeg', '1569744396', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12736', '20141015144312_NixPw.jpeg', '5d90660c462d0.jpeg', '55249', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90660c462d0.jpeg', '/upload/index/image/201909/5d90660c462d0.jpeg', '1569744396', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12737', '20160407145436_8rVYj.jpeg', '5d90660c7eef4.jpeg', '159047', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90660c7eef4.jpeg', '/upload/index/image/201909/5d90660c7eef4.jpeg', '1569744396', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12738', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d90660cb8422.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90660cb8422.jpg', '/upload/index/image/201909/5d90660cb8422.jpg', '1569744396', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12739', '测试图.jpg', '5d90661f183b1.jpg', '37280', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90661f183b1.jpg', '/upload/index/image/201909/5d90661f183b1.jpg', '1569744415', '彭于晏', '2');
INSERT INTO `crm_file` VALUES ('12740', '测试图.jpg', '5d90669878341.jpg', '37280', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90669878341.jpg', '/upload/index/image/201909/5d90669878341.jpg', '1569744536', '彭于晏', '2');
INSERT INTO `crm_file` VALUES ('12741', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d9066c77115f.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d9066c77115f.jpg', '/upload/index/image/201909/5d9066c77115f.jpg', '1569744583', '火狼主管', '2');
INSERT INTO `crm_file` VALUES ('12742', '测试图.jpg', '5d90699285185.jpg', '37280', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90699285185.jpg', '/upload/index/image/201909/5d90699285185.jpg', '1569745298', '彭于晏', '2');
INSERT INTO `crm_file` VALUES ('12743', '测试图.jpg', '5d906cc80209a.jpg', '37280', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d906cc80209a.jpg', '/upload/index/image/201909/5d906cc80209a.jpg', '1569746120', '柚子哇', '2');
INSERT INTO `crm_file` VALUES ('12744', '6dde4830bad6b44af690f59fa3fcacbc.jpg', '5d907a55c4002.jpg', '48403', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d907a55c4002.jpg', '/upload/index/image/201909/5d907a55c4002.jpg', '1569749589', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12745', '6dde4830bad6b44af690f59fa3fcacbc.jpg', '5d907a5e367f1.jpg', '48403', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d907a5e367f1.jpg', '/upload/index/image/201909/5d907a5e367f1.jpg', '1569749598', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12746', '47e58PICQUR_1024.jpg', '5d907a5e51207.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d907a5e51207.jpg', '/upload/index/image/201909/5d907a5e51207.jpg', '1569749598', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12747', '8164280_104301508000_2.jpg', '5d907ae2383aa.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d907ae2383aa.jpg', '/upload/index/image/201909/5d907ae2383aa.jpg', '1569749730', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12748', '测试图.jpg', '5d90843646831.jpg', '37280', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90843646831.jpg', '/upload/index/image/201909/5d90843646831.jpg', '1569752118', '柚子哇', '2');
INSERT INTO `crm_file` VALUES ('12749', '6dde4830bad6b44af690f59fa3fcacbc.jpg', '5d90b1420cffe.jpg', '48403', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90b1420cffe.jpg', '/upload/index/image/201909/5d90b1420cffe.jpg', '1569763650', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12750', '7119492_114440620000_2.jpg', '5d90b19d52a02.jpg', '158334', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90b19d52a02.jpg', '/upload/index/image/201909/5d90b19d52a02.jpg', '1569763741', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12751', '20130713124056_jB8hn.jpeg', '5d90b1b0b73cc.jpeg', '2642508', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90b1b0b73cc.jpeg', '/upload/index/image/201909/5d90b1b0b73cc.jpeg', '1569763760', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12752', '20130713124056_jB8hn.jpeg', '5d90b2dd9f3f5.jpeg', '2642508', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90b2dd9f3f5.jpeg', '/upload/index/image/201909/5d90b2dd9f3f5.jpeg', '1569764061', '火狼主管', '2');
INSERT INTO `crm_file` VALUES ('12753', '20130713124056_jB8hn.jpeg', '5d90b2e91319e.jpeg', '2642508', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90b2e91319e.jpeg', '/upload/index/image/201909/5d90b2e91319e.jpeg', '1569764073', '火狼主管', '2');
INSERT INTO `crm_file` VALUES ('12754', '20170508135435_2jaGJ.jpeg', '5d90b321be67b.jpeg', '48716', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90b321be67b.jpeg', '/upload/index/image/201909/5d90b321be67b.jpeg', '1569764129', '火狼主管', '2');
INSERT INTO `crm_file` VALUES ('12755', '20170508135435_2jaGJ.jpeg', '5d90bc25c7dc4.jpeg', '48716', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90bc25c7dc4.jpeg', '/upload/index/image/201909/5d90bc25c7dc4.jpeg', '1569766437', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12756', '6dde4830bad6b44af690f59fa3fcacbc.jpg', '5d90bc2b875ce.jpg', '48403', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90bc2b875ce.jpg', '/upload/index/image/201909/5d90bc2b875ce.jpg', '1569766443', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12757', '7119492_114440620000_2.jpg', '5d90bd765fa38.jpg', '158334', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90bd765fa38.jpg', '/upload/index/image/201909/5d90bd765fa38.jpg', '1569766774', '火狼主管', '2');
INSERT INTO `crm_file` VALUES ('12758', '20130713124056_jB8hn.jpeg', '5d90c597ccba6.jpeg', '2642508', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90c597ccba6.jpeg', '/upload/index/image/201909/5d90c597ccba6.jpeg', '1569768855', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12759', '6dde4830bad6b44af690f59fa3fcacbc.jpg', '5d90c8c3ca332.jpg', '48403', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d90c8c3ca332.jpg', '/upload/index/image/201909/5d90c8c3ca332.jpg', '1569769667', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12760', '6dde4830bad6b44af690f59fa3fcacbc.jpg', '5d915d8aa3d86.jpg', '48403', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915d8aa3d86.jpg', '/upload/index/image/201909/5d915d8aa3d86.jpg', '1569807754', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12761', '47e58PICQUR_1024.jpg', '5d915d8abb0f4.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915d8abb0f4.jpg', '/upload/index/image/201909/5d915d8abb0f4.jpg', '1569807754', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12762', '8164280_104301508000_2.jpg', '5d915d8adac81.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915d8adac81.jpg', '/upload/index/image/201909/5d915d8adac81.jpg', '1569807754', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12763', '18063302_210604412116_2.jpg', '5d915d8b09d86.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915d8b09d86.jpg', '/upload/index/image/201909/5d915d8b09d86.jpg', '1569807755', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12764', '18179070_152408117000_2.jpg', '5d915d8b37398.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915d8b37398.jpg', '/upload/index/image/201909/5d915d8b37398.jpg', '1569807755', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12765', '20121114001249_x5V2c.jpeg', '5d915d8b6a747.jpeg', '146425', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915d8b6a747.jpeg', '/upload/index/image/201909/5d915d8b6a747.jpeg', '1569807755', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12766', '20141015144312_NixPw.jpeg', '5d915d8b9e439.jpeg', '55249', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915d8b9e439.jpeg', '/upload/index/image/201909/5d915d8b9e439.jpeg', '1569807755', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12767', '20160407145436_8rVYj.jpeg', '5d915d8bd525d.jpeg', '159047', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915d8bd525d.jpeg', '/upload/index/image/201909/5d915d8bd525d.jpeg', '1569807755', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12768', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d915d8c18702.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915d8c18702.jpg', '/upload/index/image/201909/5d915d8c18702.jpg', '1569807756', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12769', '6dde4830bad6b44af690f59fa3fcacbc.jpg', '5d915daf90579.jpg', '48403', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915daf90579.jpg', '/upload/index/image/201909/5d915daf90579.jpg', '1569807791', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12770', '47e58PICQUR_1024.jpg', '5d915dafa8929.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915dafa8929.jpg', '/upload/index/image/201909/5d915dafa8929.jpg', '1569807791', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12771', '8164280_104301508000_2.jpg', '5d915dafc8673.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915dafc8673.jpg', '/upload/index/image/201909/5d915dafc8673.jpg', '1569807791', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12772', '18063302_210604412116_2.jpg', '5d915db04c759.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915db04c759.jpg', '/upload/index/image/201909/5d915db04c759.jpg', '1569807792', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12773', '18179070_152408117000_2.jpg', '5d915db1825d8.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915db1825d8.jpg', '/upload/index/image/201909/5d915db1825d8.jpg', '1569807793', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12774', '20121114001249_x5V2c.jpeg', '5d915db2f3d26.jpeg', '146425', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915db2f3d26.jpeg', '/upload/index/image/201909/5d915db2f3d26.jpeg', '1569807794', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12775', '20141015144312_NixPw.jpeg', '5d915db41034b.jpeg', '55249', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915db41034b.jpeg', '/upload/index/image/201909/5d915db41034b.jpeg', '1569807796', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12776', '20160407145436_8rVYj.jpeg', '5d915db58fcbd.jpeg', '159047', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915db58fcbd.jpeg', '/upload/index/image/201909/5d915db58fcbd.jpeg', '1569807797', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12777', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d915db726dcf.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915db726dcf.jpg', '/upload/index/image/201909/5d915db726dcf.jpg', '1569807799', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12778', '6dde4830bad6b44af690f59fa3fcacbc.jpg', '5d915f829e5c0.jpg', '48403', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915f829e5c0.jpg', '/upload/index/image/201909/5d915f829e5c0.jpg', '1569808258', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12779', '47e58PICQUR_1024.jpg', '5d915f82ba180.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915f82ba180.jpg', '/upload/index/image/201909/5d915f82ba180.jpg', '1569808258', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12780', '8164280_104301508000_2.jpg', '5d915f8347d67.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915f8347d67.jpg', '/upload/index/image/201909/5d915f8347d67.jpg', '1569808259', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12781', '18063302_210604412116_2.jpg', '5d915f84d68b7.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915f84d68b7.jpg', '/upload/index/image/201909/5d915f84d68b7.jpg', '1569808260', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12782', '18179070_152408117000_2.jpg', '5d915f8715f51.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915f8715f51.jpg', '/upload/index/image/201909/5d915f8715f51.jpg', '1569808263', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12783', '20121114001249_x5V2c.jpeg', '5d915f89e7c05.jpeg', '146425', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915f89e7c05.jpeg', '/upload/index/image/201909/5d915f89e7c05.jpeg', '1569808265', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12784', '20141015144312_NixPw.jpeg', '5d915f8c7c01a.jpeg', '55249', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915f8c7c01a.jpeg', '/upload/index/image/201909/5d915f8c7c01a.jpeg', '1569808268', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12785', '20160407145436_8rVYj.jpeg', '5d915f8f89c24.jpeg', '159047', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915f8f89c24.jpeg', '/upload/index/image/201909/5d915f8f89c24.jpeg', '1569808271', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12786', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d915f92e0f7c.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d915f92e0f7c.jpg', '/upload/index/image/201909/5d915f92e0f7c.jpg', '1569808274', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12787', '测试图.jpg', '5d91640846e41.jpg', '37280', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d91640846e41.jpg', '/upload/index/image/201909/5d91640846e41.jpg', '1569809416', '柚子哇', '2');
INSERT INTO `crm_file` VALUES ('12788', '6dde4830bad6b44af690f59fa3fcacbc.jpg', '5d9167df028f4.jpg', '48403', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d9167df028f4.jpg', '/upload/index/image/201909/5d9167df028f4.jpg', '1569810399', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12789', '47e58PICQUR_1024.jpg', '5d9167df1c8bc.jpg', '80359', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d9167df1c8bc.jpg', '/upload/index/image/201909/5d9167df1c8bc.jpg', '1569810399', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12790', '8164280_104301508000_2.jpg', '5d9167df3d11e.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d9167df3d11e.jpg', '/upload/index/image/201909/5d9167df3d11e.jpg', '1569810399', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12791', '18063302_210604412116_2.jpg', '5d9167df61cf4.jpg', '169890', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d9167df61cf4.jpg', '/upload/index/image/201909/5d9167df61cf4.jpg', '1569810399', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12792', '18179070_152408117000_2.jpg', '5d9167e4c5e99.jpg', '462460', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d9167e4c5e99.jpg', '/upload/index/image/201909/5d9167e4c5e99.jpg', '1569810404', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12793', '20121114001249_x5V2c.jpeg', '5d9167e4e93fa.jpeg', '146425', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d9167e4e93fa.jpeg', '/upload/index/image/201909/5d9167e4e93fa.jpeg', '1569810404', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12794', '20141015144312_NixPw.jpeg', '5d9167e5b89a7.jpeg', '55249', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d9167e5b89a7.jpeg', '/upload/index/image/201909/5d9167e5b89a7.jpeg', '1569810405', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12795', '20160407145436_8rVYj.jpeg', '5d9167e686ed8.jpeg', '159047', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d9167e686ed8.jpeg', '/upload/index/image/201909/5d9167e686ed8.jpeg', '1569810406', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12796', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d9167e757075.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d9167e757075.jpg', '/upload/index/image/201909/5d9167e757075.jpg', '1569810407', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12797', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d9177c7bfc33.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d9177c7bfc33.jpg', '/upload/index/image/201909/5d9177c7bfc33.jpg', '1569814471', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12798', '测试图.jpg', '5d9199d5545b1.jpg', '37280', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d9199d5545b1.jpg', '/upload/index/image/201909/5d9199d5545b1.jpg', '1569823189', '柚子哇', '2');
INSERT INTO `crm_file` VALUES ('12799', 'B4-1080-1920.jpg', '5d919a5f69c54.jpg', '1272221', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d919a5f69c54.jpg', '/upload/index/image/201909/5d919a5f69c54.jpg', '1569823327', 'aaa', '2');
INSERT INTO `crm_file` VALUES ('12800', '8164280_104301508000_2.jpg', '5d91b2e642a70.jpg', '447247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d91b2e642a70.jpg', '/upload/index/image/201909/5d91b2e642a70.jpg', '1569829606', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12801', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d91b8fc4168f.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d91b8fc4168f.jpg', '/upload/index/image/201909/5d91b8fc4168f.jpg', '1569831164', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12802', '测试图.jpg', '5d91ba026ad44.jpg', '37280', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d91ba026ad44.jpg', '/upload/index/image/201909/5d91ba026ad44.jpg', '1569831426', '柚子哇', '2');
INSERT INTO `crm_file` VALUES ('12803', '测试图.jpg', '5d91bb3a60ad6.jpg', '37280', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d91bb3a60ad6.jpg', '/upload/index/image/201909/5d91bb3a60ad6.jpg', '1569831738', '柚子哇', '2');
INSERT INTO `crm_file` VALUES ('12804', '20121114001249_x5V2c.jpeg', '5d91ca78a772a.jpeg', '146425', 'jpeg', 'upload/index/image/201909/', 'upload/index/image/201909/5d91ca78a772a.jpeg', '/upload/index/image/201909/5d91ca78a772a.jpeg', '1569835640', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12805', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d91d90ad9d6e.jpg', '9247', 'jpg', 'upload/index/image/201909/', 'upload/index/image/201909/5d91d90ad9d6e.jpg', '/upload/index/image/201909/5d91d90ad9d6e.jpg', '1569839370', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12806', '6dde4830bad6b44af690f59fa3fcacbc.jpg', '5d9be9379d385.jpg', '48403', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9be9379d385.jpg', '/upload/index/image/201910/5d9be9379d385.jpg', '1570498871', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12807', '47e58PICQUR_1024.jpg', '5d9be93f5f1f6.jpg', '80359', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9be93f5f1f6.jpg', '/upload/index/image/201910/5d9be93f5f1f6.jpg', '1570498879', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12808', '8164280_104301508000_2.jpg', '5d9be93fe7f68.jpg', '447247', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9be93fe7f68.jpg', '/upload/index/image/201910/5d9be93fe7f68.jpg', '1570498879', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12809', '18063302_210604412116_2.jpg', '5d9be9412a246.jpg', '169890', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9be9412a246.jpg', '/upload/index/image/201910/5d9be9412a246.jpg', '1570498881', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12810', '18179070_152408117000_2.jpg', '5d9be94343ae5.jpg', '462460', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9be94343ae5.jpg', '/upload/index/image/201910/5d9be94343ae5.jpg', '1570498883', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12811', '20121114001249_x5V2c.jpeg', '5d9be9461f291.jpeg', '146425', 'jpeg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9be9461f291.jpeg', '/upload/index/image/201910/5d9be9461f291.jpeg', '1570498886', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12812', '20141015144312_NixPw.jpeg', '5d9be948a65cc.jpeg', '55249', 'jpeg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9be948a65cc.jpeg', '/upload/index/image/201910/5d9be948a65cc.jpeg', '1570498888', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12813', '20160407145436_8rVYj.jpeg', '5d9be94ba5543.jpeg', '159047', 'jpeg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9be94ba5543.jpeg', '/upload/index/image/201910/5d9be94ba5543.jpeg', '1570498891', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12814', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d9be94e8a5b9.jpg', '9247', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9be94e8a5b9.jpg', '/upload/index/image/201910/5d9be94e8a5b9.jpg', '1570498894', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12815', '测试图.jpg', '5d9bed6d1d413.jpg', '37280', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9bed6d1d413.jpg', '/upload/index/image/201910/5d9bed6d1d413.jpg', '1570499949', '彭于晏', '2');
INSERT INTO `crm_file` VALUES ('12816', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d9bedfce18ec.jpg', '9247', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9bedfce18ec.jpg', '/upload/index/image/201910/5d9bedfce18ec.jpg', '1570500092', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12817', '18179070_152408117000_2.jpg', '5d9c03fb368f6.jpg', '462460', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9c03fb368f6.jpg', '/upload/index/image/201910/5d9c03fb368f6.jpg', '1570505723', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12818', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d9c24ed20f9f.jpg', '9247', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9c24ed20f9f.jpg', '/upload/index/image/201910/5d9c24ed20f9f.jpg', '1570514157', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12819', '测试图.jpg', '5d9c31176c560.jpg', '37280', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9c31176c560.jpg', '/upload/index/image/201910/5d9c31176c560.jpg', '1570517271', '彭于晏', '2');
INSERT INTO `crm_file` VALUES ('12820', '20121114001249_x5V2c.jpeg', '5d9c42161930f.jpeg', '146425', 'jpeg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9c42161930f.jpeg', '/upload/index/image/201910/5d9c42161930f.jpeg', '1570521622', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12821', '测试图.jpg', '5d9c42f10bea2.jpg', '37280', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9c42f10bea2.jpg', '/upload/index/image/201910/5d9c42f10bea2.jpg', '1570521841', '彭于晏', '2');
INSERT INTO `crm_file` VALUES ('12822', '测试图.jpg', '5d9c43eb95fec.jpg', '37280', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9c43eb95fec.jpg', '/upload/index/image/201910/5d9c43eb95fec.jpg', '1570522091', '彭于晏', '2');
INSERT INTO `crm_file` VALUES ('12823', '47e58PICQUR_1024.jpg', '5d9c45d23be73.jpg', '80359', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9c45d23be73.jpg', '/upload/index/image/201910/5d9c45d23be73.jpg', '1570522578', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12824', '20160407145436_8rVYj.jpeg', '5d9c461eae51c.jpeg', '159047', 'jpeg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9c461eae51c.jpeg', '/upload/index/image/201910/5d9c461eae51c.jpeg', '1570522654', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12825', '18179070_152408117000_2.jpg', '5d9c4d7805516.jpg', '462460', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9c4d7805516.jpg', '/upload/index/image/201910/5d9c4d7805516.jpg', '1570524536', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12826', '8164280_104301508000_2.jpg', '5d9c5a5a57984.jpg', '447247', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9c5a5a57984.jpg', '/upload/index/image/201910/5d9c5a5a57984.jpg', '1570527834', '第三组销售', '2');
INSERT INTO `crm_file` VALUES ('12827', '18063302_210604412116_2.jpg', '5d9c5a5cb9da0.jpg', '169890', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9c5a5cb9da0.jpg', '/upload/index/image/201910/5d9c5a5cb9da0.jpg', '1570527836', '第三组销售', '2');
INSERT INTO `crm_file` VALUES ('12828', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d9c5acc0fc56.jpg', '9247', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9c5acc0fc56.jpg', '/upload/index/image/201910/5d9c5acc0fc56.jpg', '1570527948', '第三组销售', '2');
INSERT INTO `crm_file` VALUES ('12829', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d9c5dd483c43.jpg', '9247', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9c5dd483c43.jpg', '/upload/index/image/201910/5d9c5dd483c43.jpg', '1570528724', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12830', '18179070_152408117000_2.jpg', '5d9c656896bc0.jpg', '462460', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9c656896bc0.jpg', '/upload/index/image/201910/5d9c656896bc0.jpg', '1570530664', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12831', '20160407145436_8rVYj.jpeg', '5d9c67f22e8cd.jpeg', '159047', 'jpeg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9c67f22e8cd.jpeg', '/upload/index/image/201910/5d9c67f22e8cd.jpeg', '1570531314', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12832', '20121114001249_x5V2c.jpeg', '5d9d3c58584be.jpeg', '146425', 'jpeg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9d3c58584be.jpeg', '/upload/index/image/201910/5d9d3c58584be.jpeg', '1570585688', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12833', '8164280_104301508000_2.jpg', '5d9d40e283987.jpg', '447247', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9d40e283987.jpg', '/upload/index/image/201910/5d9d40e283987.jpg', '1570586850', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12834', 'timg.jpg', '5d9d463f2f8f9.jpg', '105830', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9d463f2f8f9.jpg', '/upload/index/image/201910/5d9d463f2f8f9.jpg', '1570588223', null, '2');
INSERT INTO `crm_file` VALUES ('12835', 'timg.jpg', '5d9d46af39cad.jpg', '105830', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9d46af39cad.jpg', '/upload/index/image/201910/5d9d46af39cad.jpg', '1570588335', null, '2');
INSERT INTO `crm_file` VALUES ('12836', 'timg.jpg', '5d9d4831b36be.jpg', '105830', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9d4831b36be.jpg', '/upload/index/image/201910/5d9d4831b36be.jpg', '1570588721', null, '2');
INSERT INTO `crm_file` VALUES ('12837', 'timg.jpg', '5d9d48bb81589.jpg', '105830', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9d48bb81589.jpg', '/upload/index/image/201910/5d9d48bb81589.jpg', '1570588859', null, '2');
INSERT INTO `crm_file` VALUES ('12838', '测试图.jpg', '5d9d56004907f.jpg', '37280', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9d56004907f.jpg', '/upload/index/image/201910/5d9d56004907f.jpg', '1570592256', '测试地址-柚子', '2');
INSERT INTO `crm_file` VALUES ('12839', '20121114001249_x5V2c.jpeg', '5d9d621837fc1.jpeg', '146425', 'jpeg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9d621837fc1.jpeg', '/upload/index/image/201910/5d9d621837fc1.jpeg', '1570595352', null, '2');
INSERT INTO `crm_file` VALUES ('12840', '20141015144312_NixPw.jpeg', '5d9d67e5dc236.jpeg', '55249', 'jpeg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9d67e5dc236.jpeg', '/upload/index/image/201910/5d9d67e5dc236.jpeg', '1570596837', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12841', 'td.png', '5d9d7bcd9f76a.png', '12357', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5d9d7bcd9f76a.png', '/upload/index/image/201910/5d9d7bcd9f76a.png', '1570601933', '云天', '2');
INSERT INTO `crm_file` VALUES ('12842', 'kf.png', '5d9d8252c6354.png', '10888', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5d9d8252c6354.png', '/upload/index/image/201910/5d9d8252c6354.png', '1570603602', '云项目团队销售', '2');
INSERT INTO `crm_file` VALUES ('12843', '6dde4830bad6b44af690f59fa3fcacbc.jpg', '5d9d862b409a1.jpg', '48403', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9d862b409a1.jpg', '/upload/index/image/201910/5d9d862b409a1.jpg', '1570604587', '第三组销售', '2');
INSERT INTO `crm_file` VALUES ('12844', '47e58PICQUR_1024.jpg', '5d9d862b5d973.jpg', '80359', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9d862b5d973.jpg', '/upload/index/image/201910/5d9d862b5d973.jpg', '1570604587', '第三组销售', '2');
INSERT INTO `crm_file` VALUES ('12845', '8164280_104301508000_2.jpg', '5d9d862be8a8b.jpg', '447247', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9d862be8a8b.jpg', '/upload/index/image/201910/5d9d862be8a8b.jpg', '1570604587', '第三组销售', '2');
INSERT INTO `crm_file` VALUES ('12846', '18063302_210604412116_2.jpg', '5d9d90460b872.jpg', '169890', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9d90460b872.jpg', '/upload/index/image/201910/5d9d90460b872.jpg', '1570607174', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12847', '6dde4830bad6b44af690f59fa3fcacbc.jpg', '5d9d96bfc2a2d.jpg', '48403', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9d96bfc2a2d.jpg', '/upload/index/image/201910/5d9d96bfc2a2d.jpg', '1570608831', '第三组销售', '2');
INSERT INTO `crm_file` VALUES ('12848', '47e58PICQUR_1024.jpg', '5d9d96c266143.jpg', '80359', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9d96c266143.jpg', '/upload/index/image/201910/5d9d96c266143.jpg', '1570608834', '第三组销售', '2');
INSERT INTO `crm_file` VALUES ('12849', '47e58PICQUR_1024.jpg', '5d9d99c25172f.jpg', '80359', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9d99c25172f.jpg', '/upload/index/image/201910/5d9d99c25172f.jpg', '1570609602', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12850', 'dhjl.png', '5d9d9bf9cb5fc.png', '4322', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5d9d9bf9cb5fc.png', '/upload/index/image/201910/5d9d9bf9cb5fc.png', '1570610169', '云天', '2');
INSERT INTO `crm_file` VALUES ('12851', '8164280_104301508000_2.jpg', '5d9da26bdb3d7.jpg', '447247', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9da26bdb3d7.jpg', '/upload/index/image/201910/5d9da26bdb3d7.jpg', '1570611819', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12852', '18179070_152408117000_2.jpg', '5d9da270b6f26.jpg', '462460', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9da270b6f26.jpg', '/upload/index/image/201910/5d9da270b6f26.jpg', '1570611824', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12853', '20121114001249_x5V2c.jpeg', '5d9da2720f4e7.jpeg', '146425', 'jpeg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9da2720f4e7.jpeg', '/upload/index/image/201910/5d9da2720f4e7.jpeg', '1570611826', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12854', '20141015144312_NixPw.jpeg', '5d9da273613ad.jpeg', '55249', 'jpeg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9da273613ad.jpeg', '/upload/index/image/201910/5d9da273613ad.jpeg', '1570611827', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12855', '18063302_210604412116_2.jpg', '5d9da30a910cd.jpg', '169890', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9da30a910cd.jpg', '/upload/index/image/201910/5d9da30a910cd.jpg', '1570611978', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12856', 'kf.png', '5d9da353e3f53.png', '10888', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5d9da353e3f53.png', '/upload/index/image/201910/5d9da353e3f53.png', '1570612051', '云天', '2');
INSERT INTO `crm_file` VALUES ('12857', '47e58PICQUR_1024.jpg', '5d9da4b9bf29b.jpg', '80359', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9da4b9bf29b.jpg', '/upload/index/image/201910/5d9da4b9bf29b.jpg', '1570612409', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12858', '6dde4830bad6b44af690f59fa3fcacbc.jpg', '5d9da6a6c362f.jpg', '48403', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9da6a6c362f.jpg', '/upload/index/image/201910/5d9da6a6c362f.jpg', '1570612902', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12859', '47e58PICQUR_1024.jpg', '5d9da6a6e4627.jpg', '80359', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9da6a6e4627.jpg', '/upload/index/image/201910/5d9da6a6e4627.jpg', '1570612902', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12860', '8164280_104301508000_2.jpg', '5d9da6a7790c4.jpg', '447247', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9da6a7790c4.jpg', '/upload/index/image/201910/5d9da6a7790c4.jpg', '1570612903', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12861', '18063302_210604412116_2.jpg', '5d9da6a8c5cfe.jpg', '169890', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9da6a8c5cfe.jpg', '/upload/index/image/201910/5d9da6a8c5cfe.jpg', '1570612904', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12862', '18063302_210604412116_2.jpg', '5d9daa9bce0d5.jpg', '169890', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9daa9bce0d5.jpg', '/upload/index/image/201910/5d9daa9bce0d5.jpg', '1570613915', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12863', 'B4-1080-1920.jpg', '5d9db922aeb61.jpg', '1272221', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9db922aeb61.jpg', '/upload/index/image/201910/5d9db922aeb61.jpg', '1570617634', 'aaa', '2');
INSERT INTO `crm_file` VALUES ('12864', '20121114001249_x5V2c.jpeg', '5d9dbad4905b8.jpeg', '146425', 'jpeg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9dbad4905b8.jpeg', '/upload/index/image/201910/5d9dbad4905b8.jpeg', '1570618068', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12865', '20121114001249_x5V2c.jpeg', '5d9dbdb6639bb.jpeg', '146425', 'jpeg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9dbdb6639bb.jpeg', '/upload/index/image/201910/5d9dbdb6639bb.jpeg', '1570618806', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12866', '6dde4830bad6b44af690f59fa3fcacbc.jpg', '5d9dbddda3e98.jpg', '48403', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9dbddda3e98.jpg', '/upload/index/image/201910/5d9dbddda3e98.jpg', '1570618845', '火狼销售主管', '2');
INSERT INTO `crm_file` VALUES ('12867', '6dde4830bad6b44af690f59fa3fcacbc.jpg', '5d9ddfe6789e6.jpg', '48403', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9ddfe6789e6.jpg', '/upload/index/image/201910/5d9ddfe6789e6.jpg', '1570627558', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12868', '7119492_114440620000_2.jpg', '5d9de246f0109.jpg', '158334', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9de246f0109.jpg', '/upload/index/image/201910/5d9de246f0109.jpg', '1570628166', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12869', '7119492_114440620000_2.jpg', '5d9de31f09186.jpg', '158334', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9de31f09186.jpg', '/upload/index/image/201910/5d9de31f09186.jpg', '1570628383', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12870', '6dde4830bad6b44af690f59fa3fcacbc.jpg', '5d9de611dc2e4.jpg', '48403', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9de611dc2e4.jpg', '/upload/index/image/201910/5d9de611dc2e4.jpg', '1570629137', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12871', '20130713124056_jB8hn.jpeg', '5d9de6bf79b34.jpeg', '2642508', 'jpeg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9de6bf79b34.jpeg', '/upload/index/image/201910/5d9de6bf79b34.jpeg', '1570629311', '火狼销售主管', '2');
INSERT INTO `crm_file` VALUES ('12872', '20170508135435_2jaGJ.jpeg', '5d9df92bf2969.jpeg', '48716', 'jpeg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9df92bf2969.jpeg', '/upload/index/image/201910/5d9df92bf2969.jpeg', '1570634027', '云项目销售01', '2');
INSERT INTO `crm_file` VALUES ('12873', '7119492_114440620000_2.jpg', '5d9dfefee80b5.jpg', '158334', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9dfefee80b5.jpg', '/upload/index/image/201910/5d9dfefee80b5.jpg', '1570635518', '第三组销售', '2');
INSERT INTO `crm_file` VALUES ('12874', '【互联网+大数据测评系统】产品参数20190320.docx', '5d9e01190b552.docx', '23195', 'docx', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e01190b552.docx', '/upload/index/image/201910/5d9e01190b552.docx', '1570636057', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12875', '20130713124056_jB8hn.jpeg', '5d9e01640e718.jpeg', '2642508', 'jpeg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e01640e718.jpeg', '/upload/index/image/201910/5d9e01640e718.jpeg', '1570636132', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12876', '7119492_114440620000_2.jpg', '5d9e01818f704.jpg', '158334', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e01818f704.jpg', '/upload/index/image/201910/5d9e01818f704.jpg', '1570636161', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12877', '6dde4830bad6b44af690f59fa3fcacbc.jpg', '5d9e02e4b0cfd.jpg', '48403', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e02e4b0cfd.jpg', '/upload/index/image/201910/5d9e02e4b0cfd.jpg', '1570636516', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12878', '7119492_114440620000_2.jpg', '5d9e02e4dfae2.jpg', '158334', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e02e4dfae2.jpg', '/upload/index/image/201910/5d9e02e4dfae2.jpg', '1570636516', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12879', '20130713124056_jB8hn.jpeg', '5d9e02e580f06.jpeg', '2642508', 'jpeg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e02e580f06.jpeg', '/upload/index/image/201910/5d9e02e580f06.jpeg', '1570636517', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12880', '20170508135435_2jaGJ.jpeg', '5d9e02e626ab4.jpeg', '48716', 'jpeg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e02e626ab4.jpeg', '/upload/index/image/201910/5d9e02e626ab4.jpeg', '1570636518', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12881', '测试图.jpg', '5d9e89b899d77.jpg', '37280', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e89b899d77.jpg', '/upload/index/image/201910/5d9e89b899d77.jpg', '1570671032', '测试地址-柚子', '2');
INSERT INTO `crm_file` VALUES ('12882', '测试图.jpg', '5d9e8ba58c9b2.jpg', '37280', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e8ba58c9b2.jpg', '/upload/index/image/201910/5d9e8ba58c9b2.jpg', '1570671525', '测试地址-柚子', '2');
INSERT INTO `crm_file` VALUES ('12883', 'kf.png', '5d9e8bc1ba442.png', '10888', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e8bc1ba442.png', '/upload/index/image/201910/5d9e8bc1ba442.png', '1570671553', '云天', '2');
INSERT INTO `crm_file` VALUES ('12884', '测试图.jpg', '5d9e8c0886902.jpg', '37280', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e8c0886902.jpg', '/upload/index/image/201910/5d9e8c0886902.jpg', '1570671624', '测试地址-柚子', '2');
INSERT INTO `crm_file` VALUES ('12885', 'sz.png', '5d9e8d2413f59.png', '11451', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e8d2413f59.png', '/upload/index/image/201910/5d9e8d2413f59.png', '1570671908', '云天', '2');
INSERT INTO `crm_file` VALUES ('12886', '47e58PICQUR_1024.jpg', '5d9e948b43afb.jpg', '80359', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e948b43afb.jpg', '/upload/index/image/201910/5d9e948b43afb.jpg', '1570673803', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12887', '47e58PICQUR_1024.jpg', '5d9e95deeadf1.jpg', '80359', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e95deeadf1.jpg', '/upload/index/image/201910/5d9e95deeadf1.jpg', '1570674142', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12888', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5d9e96dcd6781.jpg', '9247', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e96dcd6781.jpg', '/upload/index/image/201910/5d9e96dcd6781.jpg', '1570674396', '火狼销售主管', '2');
INSERT INTO `crm_file` VALUES ('12889', '20121114001249_x5V2c.jpeg', '5d9e9ca05bf04.jpeg', '146425', 'jpeg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e9ca05bf04.jpeg', '/upload/index/image/201910/5d9e9ca05bf04.jpeg', '1570675872', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12890', '47e58PICQUR_1024.jpg', '5d9e9d6429929.jpg', '80359', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e9d6429929.jpg', '/upload/index/image/201910/5d9e9d6429929.jpg', '1570676068', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12891', '8164280_104301508000_2.jpg', '5d9e9d64578bb.jpg', '447247', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e9d64578bb.jpg', '/upload/index/image/201910/5d9e9d64578bb.jpg', '1570676068', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12892', '18063302_210604412116_2.jpg', '5d9e9d65ddbb6.jpg', '169890', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e9d65ddbb6.jpg', '/upload/index/image/201910/5d9e9d65ddbb6.jpg', '1570676069', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12893', '47e58PICQUR_1024.jpg', '5d9e9d6e197ef.jpg', '80359', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e9d6e197ef.jpg', '/upload/index/image/201910/5d9e9d6e197ef.jpg', '1570676078', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12894', '8164280_104301508000_2.jpg', '5d9e9d6e4ec56.jpg', '447247', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e9d6e4ec56.jpg', '/upload/index/image/201910/5d9e9d6e4ec56.jpg', '1570676078', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12895', '18063302_210604412116_2.jpg', '5d9e9d6fc2d4a.jpg', '169890', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e9d6fc2d4a.jpg', '/upload/index/image/201910/5d9e9d6fc2d4a.jpg', '1570676079', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12896', '18179070_152408117000_2.jpg', '5d9e9d720e8d5.jpg', '462460', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e9d720e8d5.jpg', '/upload/index/image/201910/5d9e9d720e8d5.jpg', '1570676082', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12897', '47e58PICQUR_1024.jpg', '5d9e9e4488400.jpg', '80359', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e9e4488400.jpg', '/upload/index/image/201910/5d9e9e4488400.jpg', '1570676292', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12898', '47e58PICQUR_1024.jpg', '5d9e9f0d036dd.jpg', '80359', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e9f0d036dd.jpg', '/upload/index/image/201910/5d9e9f0d036dd.jpg', '1570676493', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12899', '权限.doc', '5d9e9f5d51af0.doc', '594944', 'doc', 'upload/index/image/201910/', 'upload/index/image/201910/5d9e9f5d51af0.doc', '/upload/index/image/201910/5d9e9f5d51af0.doc', '1570676573', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12900', 'kf.png', '5d9ea585e2fab.png', '10888', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5d9ea585e2fab.png', '/upload/index/image/201910/5d9ea585e2fab.png', '1570678149', '云天', '2');
INSERT INTO `crm_file` VALUES ('12901', 'kf.png', '5d9ea5d620db2.png', '10888', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5d9ea5d620db2.png', '/upload/index/image/201910/5d9ea5d620db2.png', '1570678230', '云天', '2');
INSERT INTO `crm_file` VALUES ('12902', 'kf.png', '5d9eac1f0a54c.png', '10888', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5d9eac1f0a54c.png', '/upload/index/image/201910/5d9eac1f0a54c.png', '1570679839', '云天', '2');
INSERT INTO `crm_file` VALUES ('12903', 'magazine-unlock-01-2.3.1922-7D3FAD0E44979D0A0C59D.jpg', '5d9ec3b8e34b8.jpg', '529433', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9ec3b8e34b8.jpg', '/upload/index/image/201910/5d9ec3b8e34b8.jpg', '1570685880', 'wqj', '2');
INSERT INTO `crm_file` VALUES ('12904', 'QQ图片20190919102832.png', '5d9ec9aa8e961.png', '174533', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5d9ec9aa8e961.png', '/upload/index/image/201910/5d9ec9aa8e961.png', '1570687402', null, '2');
INSERT INTO `crm_file` VALUES ('12905', '18063302_210604412116_2.jpg', '5d9ed2f046211.jpg', '169890', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9ed2f046211.jpg', '/upload/index/image/201910/5d9ed2f046211.jpg', '1570689776', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12906', '18179070_152408117000_2.jpg', '5d9ed51831592.jpg', '462460', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9ed51831592.jpg', '/upload/index/image/201910/5d9ed51831592.jpg', '1570690328', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12907', '羽毛球赛事.xls', '5d9ee08e66549.xls', '21504', 'xls', 'upload/index/image/201910/', 'upload/index/image/201910/5d9ee08e66549.xls', '/upload/index/image/201910/5d9ee08e66549.xls', '1570693262', '云天', '2');
INSERT INTO `crm_file` VALUES ('12908', 'B4-1080-1920.jpg', '5d9f05b843eed.jpg', '1272221', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9f05b843eed.jpg', '/upload/index/image/201910/5d9f05b843eed.jpg', '1570702776', 'aaa', '2');
INSERT INTO `crm_file` VALUES ('12909', '8164280_104301508000_2.jpg', '5d9f147b49cc9.jpg', '447247', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9f147b49cc9.jpg', '/upload/index/image/201910/5d9f147b49cc9.jpg', '1570706555', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12910', 'QQ图片20190919102832.png', '5d9f1cd276e58.png', '174533', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5d9f1cd276e58.png', '/upload/index/image/201910/5d9f1cd276e58.png', '1570708690', 'wqj', '2');
INSERT INTO `crm_file` VALUES ('12911', 'QQ图片20190919102832.png', '5d9f1d34dafe8.png', '174533', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5d9f1d34dafe8.png', '/upload/index/image/201910/5d9f1d34dafe8.png', '1570708788', 'wqj', '2');
INSERT INTO `crm_file` VALUES ('12912', 'QQ图片20190919102832.png', '5d9f1d6636718.png', '174533', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5d9f1d6636718.png', '/upload/index/image/201910/5d9f1d6636718.png', '1570708838', 'wqj', '2');
INSERT INTO `crm_file` VALUES ('12913', 'B3-1080-1920.jpg', '5d9f24373e78b.jpg', '1256152', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9f24373e78b.jpg', '/upload/index/image/201910/5d9f24373e78b.jpg', '1570710583', 'aaa', '2');
INSERT INTO `crm_file` VALUES ('12914', 'B4-1080-1920.jpg', '5d9f24868952b.jpg', '1272221', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9f24868952b.jpg', '/upload/index/image/201910/5d9f24868952b.jpg', '1570710662', 'aaa', '2');
INSERT INTO `crm_file` VALUES ('12915', 'B2-1080-1920.jpg', '5d9f24ac6a0b7.jpg', '1268850', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9f24ac6a0b7.jpg', '/upload/index/image/201910/5d9f24ac6a0b7.jpg', '1570710700', 'aaa', '2');
INSERT INTO `crm_file` VALUES ('12916', 'magazine-unlock-01-2.3.1922-7D3FAD0E44979D0A0C59D.jpg', '5d9f24e355730.jpg', '529433', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9f24e355730.jpg', '/upload/index/image/201910/5d9f24e355730.jpg', '1570710755', 'wqj', '2');
INSERT INTO `crm_file` VALUES ('12917', 'B3-1080-1920.jpg', '5d9f258e311e4.jpg', '1256152', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5d9f258e311e4.jpg', '/upload/index/image/201910/5d9f258e311e4.jpg', '1570710926', 'aaa', '2');
INSERT INTO `crm_file` VALUES ('12918', '羽毛球比赛.xls', '5d9fe1e3633e3.xls', '25088', 'xls', 'upload/index/image/201910/', 'upload/index/image/201910/5d9fe1e3633e3.xls', '/upload/index/image/201910/5d9fe1e3633e3.xls', '1570759139', '云天', '2');
INSERT INTO `crm_file` VALUES ('12919', '羽毛球赛事.xls', '5d9fe1e3c95e9.xls', '21504', 'xls', 'upload/index/image/201910/', 'upload/index/image/201910/5d9fe1e3c95e9.xls', '/upload/index/image/201910/5d9fe1e3c95e9.xls', '1570759139', '云天', '2');
INSERT INTO `crm_file` VALUES ('12920', '快快羽毛球俱乐部会员签到表.xls', '5d9fe431b31f0.xls', '32768', 'xls', 'upload/index/image/201910/', 'upload/index/image/201910/5d9fe431b31f0.xls', '/upload/index/image/201910/5d9fe431b31f0.xls', '1570759729', '云天', '2');
INSERT INTO `crm_file` VALUES ('12921', '快快羽毛球俱乐部花名册.xlsx', '5d9fe437037b6.xlsx', '14995', 'xlsx', 'upload/index/image/201910/', 'upload/index/image/201910/5d9fe437037b6.xlsx', '/upload/index/image/201910/5d9fe437037b6.xlsx', '1570759735', '云天', '2');
INSERT INTO `crm_file` VALUES ('12922', '羽毛球赛事.xls', '5d9fe4a4d832f.xls', '21504', 'xls', 'upload/index/image/201910/', 'upload/index/image/201910/5d9fe4a4d832f.xls', '/upload/index/image/201910/5d9fe4a4d832f.xls', '1570759844', '云天', '2');
INSERT INTO `crm_file` VALUES ('12923', '羽毛球比赛.xls', '5d9fe52948e85.xls', '25088', 'xls', 'upload/index/image/201910/', 'upload/index/image/201910/5d9fe52948e85.xls', '/upload/index/image/201910/5d9fe52948e85.xls', '1570759977', '云天', '2');
INSERT INTO `crm_file` VALUES ('12924', '羽毛球比赛.xls', '5d9fe5391376e.xls', '25088', 'xls', 'upload/index/image/201910/', 'upload/index/image/201910/5d9fe5391376e.xls', '/upload/index/image/201910/5d9fe5391376e.xls', '1570759993', '云天', '2');
INSERT INTO `crm_file` VALUES ('12925', '羽毛球赛事.xls', '5d9fe53989998.xls', '21504', 'xls', 'upload/index/image/201910/', 'upload/index/image/201910/5d9fe53989998.xls', '/upload/index/image/201910/5d9fe53989998.xls', '1570759993', '云天', '2');
INSERT INTO `crm_file` VALUES ('12926', '羽毛球比赛.xls', '5d9fe569cd5a0.xls', '25088', 'xls', 'upload/index/image/201910/', 'upload/index/image/201910/5d9fe569cd5a0.xls', '/upload/index/image/201910/5d9fe569cd5a0.xls', '1570760041', '云天', '2');
INSERT INTO `crm_file` VALUES ('12927', '羽毛球赛事.xls', '5d9fe56a81146.xls', '21504', 'xls', 'upload/index/image/201910/', 'upload/index/image/201910/5d9fe56a81146.xls', '/upload/index/image/201910/5d9fe56a81146.xls', '1570760042', '云天', '2');
INSERT INTO `crm_file` VALUES ('12928', '羽毛球比赛.xls', '5d9fe89e82b41.xls', '25088', 'xls', 'upload/index/image/201910/', 'upload/index/image/201910/5d9fe89e82b41.xls', '/upload/index/image/201910/5d9fe89e82b41.xls', '1570760862', '云天', '2');
INSERT INTO `crm_file` VALUES ('12929', 'zz.js', '5d9fe8ed6c268.js', '1282', 'js', 'upload/index/image/201910/', 'upload/index/image/201910/5d9fe8ed6c268.js', '/upload/index/image/201910/5d9fe8ed6c268.js', '1570760941', '云天', '2');
INSERT INTO `crm_file` VALUES ('12930', 'zz.js', '5d9fec663ff9c.js', '1282', 'js', 'upload/index/image/201910/', 'upload/index/image/201910/5d9fec663ff9c.js', '/upload/index/image/201910/5d9fec663ff9c.js', '1570761830', '云天', '2');
INSERT INTO `crm_file` VALUES ('12931', '快快网络羽毛球俱乐部群聊二维码.png', '5d9ff17613f8d.png', '9698', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5d9ff17613f8d.png', '/upload/index/image/201910/5d9ff17613f8d.png', '1570763126', '云天', '2');
INSERT INTO `crm_file` VALUES ('12932', 'crm.txt', '5da045246918a.txt', '87', 'txt', 'upload/index/image/201910/', 'upload/index/image/201910/5da045246918a.txt', '/upload/index/image/201910/5da045246918a.txt', '1570784548', '云天', '2');
INSERT INTO `crm_file` VALUES ('12933', '89BC8F07-C231-4016-A873-93D68D924B24.jpeg', '5da3e9b030a29.jpeg', '88175', 'jpeg', 'upload/index/image/201910/', 'upload/index/image/201910/5da3e9b030a29.jpeg', '/upload/index/image/201910/5da3e9b030a29.jpeg', '1571023280', '林婷婷', '2');
INSERT INTO `crm_file` VALUES ('12934', '47e58PICQUR_1024.jpg', '5da67bb4a4479.jpg', '80359', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5da67bb4a4479.jpg', '/upload/index/image/201910/5da67bb4a4479.jpg', '1571191732', '林茂茂', '2');
INSERT INTO `crm_file` VALUES ('12935', 'u=1688026885,2773767715&fm=26&gp=0.jpg', '5da67c10c18a3.jpg', '9247', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5da67c10c18a3.jpg', '/upload/index/image/201910/5da67c10c18a3.jpg', '1571191824', '火狼销售主管', '2');
INSERT INTO `crm_file` VALUES ('12936', '测试图.jpg', '5da81ab999e1d.jpg', '37280', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5da81ab999e1d.jpg', '/upload/index/image/201910/5da81ab999e1d.jpg', '1571297977', '测试地址-柚子', '2');
INSERT INTO `crm_file` VALUES ('12937', '5b9f51c2d188f.png', '5da8218c8c1de.png', '3417', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5da8218c8c1de.png', '/upload/index/image/201910/5da8218c8c1de.png', '1571299724', '云天', '2');
INSERT INTO `crm_file` VALUES ('12938', '5b9f51d8d743c.png', '5da8218ce9504.png', '4411', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5da8218ce9504.png', '/upload/index/image/201910/5da8218ce9504.png', '1571299724', '云天', '2');
INSERT INTO `crm_file` VALUES ('12939', '5b9f52700e8a7.png', '5da8218d502a6.png', '4254', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5da8218d502a6.png', '/upload/index/image/201910/5da8218d502a6.png', '1571299725', '云天', '2');
INSERT INTO `crm_file` VALUES ('12940', '5b9f51c2d188f.png', '5da822847f195.png', '3417', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5da822847f195.png', '/upload/index/image/201910/5da822847f195.png', '1571299972', '云天', '2');
INSERT INTO `crm_file` VALUES ('12941', '5b9f51d8d743c.png', '5da82284c28dc.png', '4411', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5da82284c28dc.png', '/upload/index/image/201910/5da82284c28dc.png', '1571299972', '云天', '2');
INSERT INTO `crm_file` VALUES ('12942', '5b9f52700e8a7.png', '5da82284e9b1c.png', '4254', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5da82284e9b1c.png', '/upload/index/image/201910/5da82284e9b1c.png', '1571299972', '云天', '2');
INSERT INTO `crm_file` VALUES ('12943', '5b9f51c2d188f.png', '5da82f11e8dc3.png', '3417', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5da82f11e8dc3.png', '/upload/index/image/201910/5da82f11e8dc3.png', '1571303185', '云天', '2');
INSERT INTO `crm_file` VALUES ('12944', '5b9f51ed360a2.png', '5da82f1568667.png', '3571', 'png', 'upload/index/image/201910/', 'upload/index/image/201910/5da82f1568667.png', '/upload/index/image/201910/5da82f1568667.png', '1571303189', '云天', '2');
INSERT INTO `crm_file` VALUES ('12945', 'index2.html', '5dafff9d1b8af.html', '3185', 'html', 'upload/index/image/201910/', 'upload/index/image/201910/5dafff9d1b8af.html', '/upload/index/image/201910/5dafff9d1b8af.html', '1571815325', '云天', '1');
INSERT INTO `crm_file` VALUES ('12946', '0b1ad7a7b79268a1f4558db78e092446_S.jpg', '5dafffa6b6526.jpg', '18858', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5dafffa6b6526.jpg', '/upload/index/image/201910/5dafffa6b6526.jpg', '1571815334', '云天', '1');
INSERT INTO `crm_file` VALUES ('12947', '0b1ad7a7b79268a1f4558db78e092446_S.jpg', '5dafffb0f3a46.jpg', '18858', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5dafffb0f3a46.jpg', '/upload/index/image/201910/5dafffb0f3a46.jpg', '1571815345', '云天', '1');
INSERT INTO `crm_file` VALUES ('12948', '1c0ae2205709722b62e843abc0471a55_S.jpg', '5dafffb465d92.jpg', '14912', 'jpg', 'upload/index/image/201910/', 'upload/index/image/201910/5dafffb465d92.jpg', '/upload/index/image/201910/5dafffb465d92.jpg', '1571815348', '云天', '1');
INSERT INTO `crm_file` VALUES ('12949', 'index3.html', '5dafffb988181.html', '4326', 'html', 'upload/index/image/201910/', 'upload/index/image/201910/5dafffb988181.html', '/upload/index/image/201910/5dafffb988181.html', '1571815353', '云天', '1');

-- ----------------------------
-- Table structure for crm_group
-- ----------------------------
DROP TABLE IF EXISTS `crm_group`;
CREATE TABLE `crm_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) DEFAULT NULL COMMENT '用户组名称',
  `group_type` tinyint(1) DEFAULT '1' COMMENT '类型 1管理员 2超级管理员',
  `group_resources` text COMMENT '可操作权限列表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权限组表';

-- ----------------------------
-- Records of crm_group
-- ----------------------------
INSERT INTO `crm_group` VALUES ('1', '超级管理员', '2', null);
INSERT INTO `crm_group` VALUES ('2', '角色1', '1', '[\"index_index\",\"group_index\",\"system_memcache\",\"system_flush_file_cache\"]');
INSERT INTO `crm_group` VALUES ('3', '角色2', '1', '[\"index_index\",\"client_index\",\"client_affairs\",\"client_survey\",\"client_edit\",\"client_company_intention_edit\",\"client_company_edit\",\"client_add\",\"client_delete\",\"client_deal_edit\",\"client_company_deal_edit\",\"client_general_to_intention\",\"client_client_record\",\"client_deal_client_record\",\"client_company_client_record\",\"client_company_deal_client_record\",\"client_add_record_list\",\"client_client_record_list\",\"client_delete_client_record\",\"client_client_record_edit\",\"client_company_record_edit\",\"client_audit\",\"client_company_audit\",\"client_follow\",\"client_protect\",\"client_protect_edit\",\"client_release_client\",\"client_protect_client\",\"client_custom\",\"client_get_record\",\"client_history\",\"client_acquisition_audit\",\"client_custom_edit\",\"client_custom_audit\",\"client_inner\",\"accompanyvisit_record\",\"accompanyvisit_edit\",\"accompanyvisit_record_edit\",\"statistics_new_add\",\"statistics_attr_analysis\",\"statistics_top_score\",\"statistics_top_deal\",\"statistics_deal_analysis\",\"statistics_consumption\",\"statistics_bussiness\",\"marketurl_over_view\",\"marketurl_qq_contact\",\"marketurl_market_action\",\"marketurl_market_channel\",\"marketurl_market_zwei\",\"marketurl_action_detail\",\"marketurl_market_medium\",\"marketurl_market_log\",\"msg_index\",\"msg_view\",\"question_index\",\"question_category\",\"question_cate_edit\",\"question_cate_delete\",\"consult_index\",\"consult_service_list\",\"system_memcache\",\"system_flush_file_cache\"]');
INSERT INTO `crm_group` VALUES ('4', '角色3', '1', '[\"index_index\",\"newstatistics_index\",\"newstatistics_export\",\"newstatistics_export_csv\",\"index_index\",\"client_index\"]');
INSERT INTO `crm_group` VALUES ('5', '角色4', '1', '[\"index_index\",\"newstatistics_index\",\"newstatistics_export\",\"newstatistics_export_csv\",\"index_index\",\"client_index\"]');
INSERT INTO `crm_group` VALUES ('6', '角色5', '1', '[\"index_index\",\"client_index\",\"client_affairs\",\"client_survey\",\"client_edit\",\"client_company_intention_edit\",\"client_company_edit\",\"client_delete\",\"client_deal_edit\",\"client_company_deal_edit\",\"client_general_to_intention\",\"client_client_record\",\"client_deal_client_record\",\"client_company_client_record\",\"client_company_deal_client_record\",\"client_add_record_list\",\"client_client_record_list\",\"client_client_record_edit\",\"client_company_record_edit\",\"client_audit\",\"client_company_audit\",\"client_follow\",\"client_protect\",\"client_release_client\",\"client_protect_client\",\"client_custom\",\"client_get_record\",\"client_history\",\"client_acquisition_audit\",\"client_custom_edit\",\"client_custom_audit\",\"client_aliyun_paid_record\",\"accompanyvisit_index\",\"accompanyvisit_edit\",\"accompanyvisit_delete\",\"accompanyvisit_record\",\"statistics_new_add\",\"statistics_attr_analysis\",\"statistics_top_score\",\"statistics_top_deal\",\"statistics_deal_analysis\",\"statistics_consumption\",\"statistics_bussiness\",\"msg_index\",\"msg_view\",\"question_index\",\"consult_index\",\"system_memcache\",\"system_flush_file_cache\"]');

-- ----------------------------
-- Table structure for crm_log
-- ----------------------------
DROP TABLE IF EXISTS `crm_log`;
CREATE TABLE `crm_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '登陆id',
  `log_http_type` enum('post','get','api','ajax') DEFAULT 'get' COMMENT '请求方式',
  `log_module_name` varchar(30) DEFAULT NULL COMMENT '操作所在的控制器名',
  `log_action_name` varchar(30) DEFAULT NULL COMMENT 'Action名称',
  `log_content` text COMMENT '操作内容',
  `log_action_user` varchar(20) DEFAULT NULL COMMENT '操作者',
  `log_action_url` varchar(255) DEFAULT NULL COMMENT '对应操作的资源链接地址',
  `log_action_time` datetime DEFAULT NULL COMMENT '操作时间',
  `log_action_ip` varchar(25) DEFAULT NULL COMMENT '操作所在IP地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=401 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日志表';

-- ----------------------------
-- Records of crm_log
-- ----------------------------
INSERT INTO `crm_log` VALUES ('1', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-18 15:18:17', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('2', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-18 15:22:19', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('3', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-18 17:25:54', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('4', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-18 17:37:15', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('5', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-18 17:38:31', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('6', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-18 17:38:44', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('7', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-18 17:39:23', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('8', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-18 17:39:58', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('9', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-18 17:40:17', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('10', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-18 17:41:39', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('11', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-18 17:42:41', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('12', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-18 17:43:07', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('13', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-18 17:45:33', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('14', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-18 17:46:52', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('15', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-18 17:47:44', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('16', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-18 17:48:23', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('17', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-18 17:48:57', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('18', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-18 17:50:17', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('19', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-18 17:57:36', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('20', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 09:42:10', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('21', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 09:44:26', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('22', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 09:44:57', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('23', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 09:45:15', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('24', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 09:45:28', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('25', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 09:52:07', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('26', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 09:53:27', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('27', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 09:56:50', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('28', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 09:57:25', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('29', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"\"}，post参数[]', '云天', '/index.php', '2019-10-21 09:58:42', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('30', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 09:58:43', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('31', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 09:58:46', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('32', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 09:58:47', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('33', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 09:58:48', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('34', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 09:59:24', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('35', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:00:29', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('36', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:01:01', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('37', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:01:48', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('38', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:24:55', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('39', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:25:15', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('40', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:25:22', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('41', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:25:29', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('42', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:25:59', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('43', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:26:54', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('44', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:27:43', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('45', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:27:59', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('46', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:28:38', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('47', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:29:04', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('48', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:29:13', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('49', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:29:55', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('50', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:30:11', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('51', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:30:24', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('52', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:31:16', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('53', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:31:47', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('54', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:31:55', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('55', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:32:37', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('56', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:34:01', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('57', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-21 10:34:30', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('58', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-21 10:34:38', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('59', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"3\"}，post参数[]', '云天', '/index.php', '2019-10-21 10:34:40', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('60', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"1\"}，post参数[]', '云天', '/index.php', '2019-10-21 10:34:41', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('61', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"1\"}，post参数[]', '云天', '/index.php', '2019-10-21 10:35:01', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('62', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"1\"}，post参数[]', '云天', '/index.php', '2019-10-21 10:35:13', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('63', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"1\"}，post参数[]', '云天', '/index.php', '2019-10-21 10:35:21', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('64', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"1\"}，post参数[]', '云天', '/index.php', '2019-10-21 10:35:53', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('65', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"get\"}，post参数[]', '云天', '/index.php', '2019-10-21 10:58:54', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('66', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\"}，post参数[]', '云天', '/index.php', '2019-10-21 10:58:59', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('67', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\"}，post参数[]', '云天', '/index.php', '2019-10-21 11:00:55', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('68', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\",\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-21 11:00:57', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('69', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\",\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-21 11:07:39', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('70', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\",\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 09:41:14', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('71', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\",\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 09:41:24', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('72', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\",\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 09:43:29', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('73', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\",\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 09:44:13', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('74', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\",\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 09:44:42', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('75', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\",\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 09:47:23', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('76', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\",\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 09:47:52', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('77', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\",\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 09:48:49', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('78', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\",\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 09:49:24', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('79', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\",\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 09:50:19', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('80', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\",\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 09:50:24', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('81', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\",\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 10:05:16', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('82', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\",\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 10:06:58', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('83', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\",\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 10:07:12', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('84', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\",\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 10:08:42', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('85', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\",\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 10:09:13', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('86', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\",\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 10:09:30', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('87', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"\",\"log_actionion_time\":\"\",\"log_http_type\":\"post\",\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 10:09:47', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('88', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 10:09:51', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('89', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 10:09:54', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('90', '328', 'get', 'Index', 'index', 'get参数{\"log_http_type\":\"get\"}，post参数[]', '云天', '/index.php', '2019-10-22 10:09:58', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('91', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:10:34', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('92', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:10:36', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('93', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:14:06', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('94', '328', 'get', 'Index', 'edit', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:14:09', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('95', '328', 'get', 'Index', 'edit', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:14:22', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('96', '328', 'get', 'Index', 'edit', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:14:32', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('97', '328', 'get', 'Index', 'edit', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:14:55', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('98', '328', 'get', 'Index', 'edit', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:15:25', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('99', '328', 'get', 'Index', 'edit', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:15:57', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('100', '328', 'get', 'Index', 'edit', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:16:44', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('101', '328', 'get', 'Index', 'edit', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:19:22', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('102', '328', 'get', 'System', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:19:29', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('103', '328', 'get', 'System', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:20:44', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('104', '328', 'get', 'System', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:20:53', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('105', '328', 'get', 'System', 'score', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:21:11', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('106', '328', 'get', 'System', 'star', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:21:12', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('107', '328', 'get', 'System', 'memcache', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:21:13', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('108', '328', 'ajax', 'System', 'flush_file_cache', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:21:14', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('109', '328', 'ajax', 'Index', 'offcheck', 'get参数{\"name\":[\"http_referer\",\"referer_time\"]}，post参数{\"name\":[\"http_referer\",\"referer_time\"]}', '云天', '/index.php/index/index/offCheck', '2019-10-22 10:21:15', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('110', '328', 'get', 'System', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:21:16', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('111', '328', 'get', 'System', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:22:30', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('112', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:22:31', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('113', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:35:55', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('114', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:36:33', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('115', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:37:34', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('116', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:44:02', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('117', '328', 'get', 'Group', 'all_add', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:45:59', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('118', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:46:01', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('119', '328', 'get', 'Group', 'all_add', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:46:28', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('120', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 10:46:29', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('121', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 11:09:21', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('122', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 11:09:24', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('123', '328', 'get', 'Group', 'all_add', 'get参数{\"group_id\":\"61\"}，post参数[]', '云天', '/index.php', '2019-10-22 11:09:29', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('124', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 11:09:34', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('125', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 11:21:56', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('126', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 11:23:49', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('127', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 11:24:31', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('128', '328', 'get', 'Group', 'add', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 11:24:33', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('129', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 11:24:34', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('130', '328', 'get', 'Group', 'add', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 14:41:58', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('131', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php', '2019-10-22 14:42:01', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('132', '328', 'get', 'Group', 'index', 'get参数{\"page\":\"2\"}，post参数[]', '云天', '/index.php', '2019-10-22 14:42:25', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('133', '328', 'get', 'Group', 'edit', 'get参数{\"id\":\"22\"}，post参数[]', '云天', '/index.php', '2019-10-22 14:42:28', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('134', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-22 14:43:04', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('135', '328', 'get', 'System', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/system/index.html', '2019-10-22 14:43:11', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('136', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-22 14:43:12', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('137', '328', 'get', 'Group', 'index', 'get参数{\"page\":\"2\"}，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-22 14:43:14', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('138', '328', 'get', 'Group', 'edit', 'get参数{\"id\":\"22\"}，post参数[]', '云天', '/index.php/index/group/edit/id/22.html', '2019-10-22 14:43:16', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('139', '328', 'get', 'Group', 'edit', 'get参数{\"id\":\"22\"}，post参数[]', '云天', '/index.php/index/group/edit/id/22.html', '2019-10-22 14:43:21', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('140', '328', 'ajax', 'Group', 'add', 'get参数{\"id\":\"22\",\"group_name\":\"\\u9500\\u552e\",\"group_resources\":[\"index_index\",\"group_index\",\"system_memcache\",\"system_flush_file_cache\"]}，post参数{\"id\":\"22\",\"group_name\":\"\\u9500\\u552e\",\"group_resources\":[\"index_index\",\"group_index\",\"system_memcache\",\"system_flush_file_cache\"]}', '云天', '/index.php/index/group/add/id/22.html', '2019-10-22 14:43:24', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('141', '328', 'ajax', 'Group', 'add', '更新角色组资料 : <br>【角色组名称】: 销售<br>【角色组权限】: [\"index_index\",\"group_index\",\"system_memcache\",\"system_flush_file_cache\"]<br>【角色组旧权限】: {\"id\":22,\"group_name\":\"\\u9500\\u552e\",\"group_type\":1,\"group_resources\":\"[\\\"index_index\\\",\\\"client_index\\\",\\\"client_affairs\\\",\\\"client_survey\\\",\\\"client_edit\\\",\\\"client_company_intention_edit\\\",\\\"client_company_edit\\\",\\\"client_add\\\",\\\"client_deal_edit\\\",\\\"client_company_deal_edit\\\",\\\"client_general_to_intention\\\",\\\"client_client_record\\\",\\\"client_deal_client_record\\\",\\\"client_company_client_record\\\",\\\"client_company_deal_client_record\\\",\\\"client_add_record_list\\\",\\\"client_client_record_list\\\",\\\"client_client_record_edit\\\",\\\"client_company_record_edit\\\",\\\"client_follow\\\",\\\"client_custom\\\",\\\"client_get_record\\\",\\\"client_history\\\",\\\"client_acquisition_audit\\\",\\\"client_custom_edit\\\",\\\"client_aliyun_paid_record\\\",\\\"accompanyvisit_record\\\",\\\"accompanyvisit_record_edit\\\",\\\"statistics_new_add\\\",\\\"statistics_attr_analysis\\\",\\\"statistics_top_score\\\",\\\"statistics_top_deal\\\",\\\"statistics_deal_analysis\\\",\\\"statistics_consumption\\\",\\\"statistics_bussiness\\\",\\\"msg_index\\\",\\\"msg_view\\\",\\\"question_index\\\",\\\"consult_index\\\",\\\"system_memcache\\\",\\\"system_flush_file_cache\\\"]\"}<br>', '云天', '/index.php/index/group/add/id/22.html', '2019-10-22 14:43:24', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('142', '328', 'ajax', 'Index', 'offcheck', 'get参数{\"name\":[\"http_referer\",\"referer_time\"]}，post参数{\"name\":[\"http_referer\",\"referer_time\"]}', '云天', '/index.php/index/index/offCheck', '2019-10-22 14:43:24', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('143', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-22 14:43:27', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('144', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-22 14:43:50', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('145', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-22 14:43:51', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('146', '328', 'get', 'Group', 'add', 'get参数[]，post参数[]', '云天', '/index.php/index/group/add.html', '2019-10-22 14:43:54', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('147', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-22 14:43:57', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('148', '328', 'get', 'Group', 'index', 'get参数{\"page\":\"2\"}，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-22 14:43:59', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('149', '328', 'get', 'Group', 'edit', 'get参数{\"id\":\"22\"}，post参数[]', '云天', '/index.php/index/group/edit/id/22.html', '2019-10-22 14:44:00', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('150', '328', 'get', 'Group', 'index', 'get参数{\"page\":\"2\"}，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-22 14:44:03', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('151', '328', 'get', 'Group', 'edit', 'get参数{\"id\":\"22\"}，post参数[]', '云天', '/index.php/index/group/edit/id/22.html', '2019-10-22 14:44:09', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('152', '328', 'get', 'Group', 'edit', 'get参数{\"id\":\"22\"}，post参数[]', '云天', '/index.php/index/group/edit/id/22.html', '2019-10-22 14:44:50', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('153', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-22 14:45:19', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('154', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-22 14:45:24', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('155', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-22 14:45:25', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('156', '328', 'get', 'Index', 'edit', 'get参数[]，post参数[]', '云天', '/index.php/index/index/edit.html', '2019-10-22 14:45:27', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('157', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-22 14:45:30', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('158', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-22 14:45:32', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('159', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-22 14:45:33', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('160', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"3\"}，post参数[]', '云天', '/index.php/index/index/index/sy/3.html', '2019-10-22 14:46:18', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('161', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-22 14:46:20', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('162', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-22 14:48:39', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('163', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-22 14:49:18', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('164', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-22 14:49:40', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('165', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-22 14:49:43', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('166', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-22 14:49:45', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('167', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-22 14:49:58', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('168', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-22 14:50:34', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('169', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-22 14:50:40', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('170', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-22 14:50:47', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('171', '328', 'get', 'System', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/system/index.html', '2019-10-22 14:51:14', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('172', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-22 14:51:33', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('173', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-22 14:51:34', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('174', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-22 14:51:34', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('175', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"3\"}，post参数[]', '云天', '/index.php/index/index/index/sy/3.html', '2019-10-22 14:51:35', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('176', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-22 14:51:35', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('177', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"3\"}，post参数[]', '云天', '/index.php/index/index/index/sy/3.html', '2019-10-22 14:51:36', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('178', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-22 14:51:37', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('179', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-22 14:51:37', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('180', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-22 14:51:38', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('181', '328', 'get', 'System', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/system/index.html', '2019-10-22 14:51:39', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('182', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-22 14:51:41', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('183', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-22 14:51:42', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('184', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-22 14:51:43', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('185', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"3\"}，post参数[]', '云天', '/index.php/index/index/index/sy/3.html', '2019-10-22 14:51:45', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('186', '331', 'get', 'Index', 'index', 'get参数{\"sy\":\"3\"}，post参数[]', 'yunt', '/index.php/index/index/index/sy/3.html', '2019-10-22 16:29:49', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('187', '331', 'get', 'Group', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/group/index.html', '2019-10-22 16:30:04', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('188', '331', 'get', 'Index', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/index/index.html', '2019-10-22 16:30:14', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('189', '331', 'get', 'Group', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/group/index.html', '2019-10-22 16:30:16', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('190', '331', 'get', 'Group', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/group/index.html', '2019-10-22 16:30:41', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('191', '331', 'get', 'Group', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/group/index.html', '2019-10-22 16:31:29', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('192', '331', 'get', 'Group', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/group/index.html', '2019-10-22 16:33:17', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('193', '331', 'get', 'Group', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/group/index.html', '2019-10-22 16:35:20', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('194', '331', 'get', 'Index', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/index/index.html', '2019-10-22 16:35:46', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('195', '331', 'get', 'Group', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/group/index.html', '2019-10-22 16:36:05', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('196', '331', 'get', 'Group', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/group/index.html', '2019-10-22 16:37:24', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('197', '331', 'get', 'Index', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/index/index.html', '2019-10-22 16:37:30', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('198', '331', 'get', 'Index', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/index/index.html', '2019-10-22 16:37:55', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('199', '331', 'get', 'Group', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/group/index.html', '2019-10-22 16:38:03', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('200', '331', 'get', 'Group', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/group/index.html', '2019-10-22 16:39:16', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('201', '331', 'get', 'Group', 'index', 'get参数{\"page\":\"2\"}，post参数[]', 'yunt', '/index.php/index/group/index.html', '2019-10-22 16:39:52', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('202', '331', 'get', 'Group', 'index', 'get参数{\"page\":\"1\"}，post参数[]', 'yunt', '/index.php/index/group/index.html', '2019-10-22 16:39:54', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('203', '331', 'get', 'System', 'memcache', 'get参数[]，post参数[]', 'yunt', '/index.php/index/system/memcache.html', '2019-10-22 16:39:58', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('204', '331', 'get', 'Index', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/index/index.html', '2019-10-22 16:40:00', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('205', '331', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', 'yunt', '/index.php/index/index/index/sy/2.html', '2019-10-22 16:41:56', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('206', '331', 'get', 'Index', 'index', 'get参数{\"sy\":\"3\"}，post参数[]', 'yunt', '/index.php/index/index/index/sy/3.html', '2019-10-22 16:41:59', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('207', '331', 'get', 'Index', 'index', 'get参数{\"sy\":\"3\"}，post参数[]', 'yunt', '/index.php/index/index/index/sy/3.html', '2019-10-22 16:43:27', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('208', '331', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', 'yunt', '/index.php/index/index/index/sy/2.html', '2019-10-22 16:43:30', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('209', '331', 'get', 'Index', 'index', 'get参数{\"sy\":\"1\"}，post参数[]', 'yunt', '/index.php/index/index/index/sy/1.html', '2019-10-22 16:43:33', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('210', '331', 'get', 'Index', 'index', 'get参数{\"sy\":\"1\"}，post参数[]', 'yunt', '/index.php/index/index/index/sy/1.html', '2019-10-22 16:58:27', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('211', '331', 'get', 'Group', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/group/index.html', '2019-10-22 16:58:28', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('212', '331', 'get', 'System', 'memcache', 'get参数[]，post参数[]', 'yunt', '/index.php/index/system/memcache.html', '2019-10-22 16:58:30', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('213', '331', 'get', 'Index', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/index/index.html', '2019-10-22 16:58:33', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('214', '331', 'get', 'Index', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/index/index.html', '2019-10-22 16:58:55', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('215', '331', 'get', 'Index', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/index/index.html', '2019-10-22 16:59:45', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('216', '331', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', 'yunt', '/index.php/index/index/index/sy/2.html', '2019-10-22 16:59:50', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('217', '331', 'get', 'Index', 'index', 'get参数{\"sy\":\"3\"}，post参数[]', 'yunt', '/index.php/index/index/index/sy/3.html', '2019-10-22 16:59:53', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('218', '331', 'get', 'Index', 'index', 'get参数{\"sy\":\"1\"}，post参数[]', 'yunt', '/index.php/index/index/index/sy/1.html', '2019-10-22 16:59:56', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('219', '331', 'get', 'Index', 'edit', 'get参数[]，post参数[]', 'yunt', '/index.php/index/index/edit.html', '2019-10-22 17:00:07', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('220', '331', 'get', 'Index', 'index', 'get参数{\"sy\":\"1\"}，post参数[]', 'yunt', '/index.php/index/index/index/sy/1.html', '2019-10-22 17:00:09', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('221', '331', 'get', 'Index', 'edit', 'get参数[]，post参数[]', 'yunt', '/index.php/index/index/edit.html', '2019-10-22 17:00:10', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('222', '331', 'get', 'Index', 'index', 'get参数{\"sy\":\"1\"}，post参数[]', 'yunt', '/index.php/index/index/index/sy/1.html', '2019-10-22 17:00:11', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('223', '331', 'get', 'Index', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/index/index.html', '2019-10-22 17:00:13', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('224', '331', 'get', 'Index', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/index/index.html', '2019-10-22 17:00:14', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('225', '331', 'get', 'Index', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/index/index.html', '2019-10-22 17:00:15', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('226', '331', 'get', 'Index', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/index/index.html', '2019-10-22 17:00:15', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('227', '331', 'get', 'Index', 'index', 'get参数{\"index_content\":\"\",\"index_actionion_time\":\"\",\"index_http_type\":\"\"}，post参数[]', 'yunt', '/index.php/index/index/index.html', '2019-10-22 17:00:16', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('228', '331', 'get', 'Index', 'index', 'get参数{\"log_http_type\":\"get\"}，post参数[]', 'yunt', '/index.php/index/index/index.html', '2019-10-22 17:00:18', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('229', '331', 'get', 'Index', 'index', 'get参数{\"index_content\":\"\",\"index_actionion_time\":\"\",\"index_http_type\":\"\"}，post参数[]', 'yunt', '/index.php/index/index/index.html', '2019-10-22 17:00:20', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('230', '331', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', 'yunt', '/index.php/index/index/index/sy/2.html', '2019-10-22 17:00:22', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('231', '331', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', 'yunt', '/index.php/index/index/index/sy/2.html', '2019-10-22 17:00:23', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('232', '331', 'get', 'Index', 'index', 'get参数{\"log_http_type\":\"get\"}，post参数[]', 'yunt', '/index.php/index/index/index.html', '2019-10-22 17:00:24', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('233', '331', 'get', 'Index', 'index', 'get参数{\"log_http_type\":\"get\",\"page\":\"2\"}，post参数[]', 'yunt', '/index.php/index/index/index.html', '2019-10-22 17:00:28', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('234', '331', 'get', 'System', 'memcache', 'get参数[]，post参数[]', 'yunt', '/index.php/index/system/memcache.html', '2019-10-22 17:00:34', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('235', '331', 'ajax', 'System', 'flush_file_cache', 'get参数[]，post参数[]', 'yunt', '/index.php/index/system/flush_file_cache.html', '2019-10-22 17:00:36', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('236', '331', 'ajax', 'Index', 'offcheck', 'get参数{\"name\":[\"http_referer\",\"referer_time\"]}，post参数{\"name\":[\"http_referer\",\"referer_time\"]}', 'yunt', '/index.php/index/index/offCheck', '2019-10-22 17:00:36', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('237', '331', 'get', 'Group', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/group/index.html', '2019-10-22 17:00:37', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('238', '331', 'get', 'Group', 'index', 'get参数{\"page\":\"2\"}，post参数[]', 'yunt', '/index.php/index/group/index.html', '2019-10-22 17:00:40', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('239', '331', 'ajax', 'System', 'flush_file_cache', 'get参数[]，post参数[]', 'yunt', '/index.php/index/system/flush_file_cache.html', '2019-10-22 17:00:43', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('240', '331', 'get', 'Group', 'index', 'get参数{\"page\":\"2\"}，post参数[]', 'yunt', '/index.php/index/group/index.html', '2019-10-22 17:00:45', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('241', '331', 'get', 'Index', 'index', 'get参数[]，post参数[]', 'yunt', '/index.php/index/index/index.html', '2019-10-22 17:00:46', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('242', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 10:24:00', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('243', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-23 10:24:02', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('244', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"3\"}，post参数[]', '云天', '/index.php/index/index/index/sy/3.html', '2019-10-23 10:24:03', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('245', '328', 'get', 'Index', 'edit', 'get参数[]，post参数[]', '云天', '/index.php/index/index/edit.html', '2019-10-23 10:24:10', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('246', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"3\"}，post参数[]', '云天', '/index.php/index/index/index/sy/3.html', '2019-10-23 10:24:12', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('247', '328', 'get', 'Index', 'edit', 'get参数[]，post参数[]', '云天', '/index.php/index/index/edit.html', '2019-10-23 10:24:13', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('248', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"3\"}，post参数[]', '云天', '/index.php/index/index/index/sy/3.html', '2019-10-23 10:24:14', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('249', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 10:24:16', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('250', '328', 'get', 'Index', 'index', 'get参数{\"page\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 10:24:20', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('251', '328', 'get', 'Index', 'index', 'get参数{\"page\":\"3\"}，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 10:24:22', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('252', '328', 'get', 'Index', 'index', 'get参数{\"page\":\"4\"}，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 10:24:24', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('253', '328', 'get', 'Index', 'index', 'get参数{\"page\":\"5\"}，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 10:24:26', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('254', '328', 'get', 'Index', 'index', 'get参数{\"page\":\"6\"}，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 10:24:27', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('255', '328', 'get', 'Index', 'index', 'get参数{\"page\":\"7\"}，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 10:24:49', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('256', '328', 'get', 'Index', 'index', 'get参数{\"page\":\"1\"}，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 10:24:53', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('257', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-23 10:24:59', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('258', '328', 'get', 'Group', 'edit', 'get参数{\"id\":\"61\"}，post参数[]', '云天', '/index.php/index/group/edit/id/61.html', '2019-10-23 10:25:03', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('259', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-23 10:25:04', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('260', '328', 'get', 'Group', 'add', 'get参数[]，post参数[]', '云天', '/index.php/index/group/add.html', '2019-10-23 10:25:06', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('261', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-23 10:25:07', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('262', '328', 'get', 'Group', 'transfer', 'get参数[]，post参数[]', '云天', '/index.php/index/group/transfer.html', '2019-10-23 10:25:08', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('263', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-23 10:25:10', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('264', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-23 10:25:31', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('265', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-23 10:25:46', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('266', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-23 10:26:17', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('267', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 10:28:47', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('268', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-23 10:28:54', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('269', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"3\"}，post参数[]', '云天', '/index.php/index/index/index/sy/3.html', '2019-10-23 10:28:56', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('270', '328', 'get', 'Index', 'index', 'get参数{\"id\":\"269\"}，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 10:28:58', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('271', '328', 'get', 'Index', 'index', 'get参数{\"id\":\"270\"}，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 10:29:05', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('272', '328', 'get', 'Index', 'index', 'get参数{\"id\":\"270\"}，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 11:11:48', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('273', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-23 14:04:04', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('274', '328', 'get', 'Index', 'index', 'get参数{\"log_http_type\":\"get\"}，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 14:04:08', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('275', '328', 'get', 'Index', 'index', 'get参数{\"log_http_type\":\"get\"}，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 14:06:22', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('276', '328', 'get', 'Index', 'index', 'get参数{\"log_http_type\":\"get\"}，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 14:07:13', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('277', '328', 'get', 'Index', 'index', 'get参数{\"log_content\":\"sy\",\"log_actionion_time\":\"\",\"log_http_type\":\"get\"}，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 14:07:16', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('278', '328', 'get', 'Index', 'index', 'get参数{\"log_http_type\":\"get\"}，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 14:07:59', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('279', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-23 14:08:01', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('280', '328', 'get', 'Index', 'index', 'get参数{\"page\":\"2\",\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-23 14:11:58', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('281', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"3\"}，post参数[]', '云天', '/index.php/index/index/index/sy/3.html', '2019-10-23 14:12:03', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('282', '328', 'get', 'Index', 'edit', 'get参数[]，post参数[]', '云天', '/index.php/index/index/edit.html', '2019-10-23 14:12:06', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('283', '328', 'ajax', 'Index', 'offcheck', 'get参数{\"name\":[\"http_referer\",\"referer_time\"]}，post参数{\"name\":[\"http_referer\",\"referer_time\"]}', '云天', '/index.php/index/index/offCheck', '2019-10-23 14:12:07', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('284', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"3\"}，post参数[]', '云天', '/index.php/index/index/index/sy/3.html', '2019-10-23 14:12:08', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('285', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-23 14:12:13', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('286', '328', 'get', 'System', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/system/index.html', '2019-10-23 14:12:17', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('287', '328', 'get', 'System', 'score', 'get参数[]，post参数[]', '云天', '/index.php/index/system/score.html', '2019-10-23 14:12:19', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('288', '328', 'get', 'System', 'star', 'get参数[]，post参数[]', '云天', '/index.php/index/system/star.html', '2019-10-23 14:12:21', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('289', '328', 'get', 'System', 'memcache', 'get参数[]，post参数[]', '云天', '/index.php/index/system/memcache.html', '2019-10-23 14:12:21', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('290', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 14:12:37', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('291', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-23 14:12:38', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('292', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"3\"}，post参数[]', '云天', '/index.php/index/index/index/sy/3.html', '2019-10-23 14:12:39', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('293', '328', 'get', 'Index', 'index', 'get参数{\"page\":\"2\",\"sy\":\"3\"}，post参数[]', '云天', '/index.php/index/index/index/sy/3.html', '2019-10-23 14:13:29', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('294', '328', 'get', 'System', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/system/index.html', '2019-10-23 14:13:33', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('295', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-23 14:13:36', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('296', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-23 14:55:12', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('297', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 15:03:06', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('298', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 15:03:25', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('299', '328', 'get', 'Index', 'edit', 'get参数[]，post参数[]', '云天', '/index.php/index/index/edit.html', '2019-10-23 15:05:02', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('300', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 15:05:04', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('301', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-23 15:05:10', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('302', '328', 'get', 'System', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/system/index.html', '2019-10-23 15:05:13', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('303', '328', 'get', 'System', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/system/index.html', '2019-10-23 15:20:50', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('304', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-23 15:20:54', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('305', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 15:21:42', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('306', '328', 'get', 'Index', 'edit', 'get参数[]，post参数[]', '云天', '/index.php/index/index/edit.html', '2019-10-23 15:21:43', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('307', '328', 'get', 'Index', 'edit', 'get参数[]，post参数[]', '云天', '/index.php/index/index/edit.html', '2019-10-23 15:22:00', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('308', '328', 'ajax', 'Upload', 'index', 'get参数{\"ext\":\"\"}，post参数[]', '云天', '/index.php/index/Upload/index.html', '2019-10-23 15:22:05', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('309', '328', 'ajax', 'Upload', 'index', 'get参数{\"ext\":\"\"}，post参数[]', '云天', '/index.php/index/Upload/index.html', '2019-10-23 15:22:14', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('310', '328', 'get', 'Index', 'edit', 'get参数[]，post参数[]', '云天', '/index.php/index/index/edit.html', '2019-10-23 15:22:20', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('311', '328', 'ajax', 'Upload', 'index', 'get参数{\"ext\":\"\"}，post参数[]', '云天', '/index.php/index/Upload/index.html', '2019-10-23 15:22:24', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('312', '328', 'ajax', 'Upload', 'index', 'get参数{\"ext\":\"\"}，post参数[]', '云天', '/index.php/index/Upload/index.html', '2019-10-23 15:22:28', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('313', '328', 'ajax', 'Upload', 'index', 'get参数{\"ext\":\"\"}，post参数[]', '云天', '/index.php/index/Upload/index.html', '2019-10-23 15:22:33', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('314', '328', 'get', 'Index', 'edit', 'get参数[]，post参数[]', '云天', '/index.php/index/index/edit.html', '2019-10-23 15:23:05', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('315', '328', 'get', 'Index', 'edit', 'get参数[]，post参数[]', '云天', '/index.php/index/index/edit.html', '2019-10-23 15:24:25', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('316', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 15:24:28', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('317', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-23 15:24:54', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('318', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-23 15:27:11', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('319', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-23 15:28:16', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('320', '328', 'ajax', 'Index', 'switch_on', 'get参数{\"id\":\"319\",\"q_show\":\"2\",\"name\":\"switch\"}，post参数{\"id\":\"319\",\"q_show\":\"2\",\"name\":\"switch\"}', '云天', '/index.php/index/index/switch_on', '2019-10-23 15:28:20', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('321', '328', 'get', 'Index', 'index', 'get参数{\"sy\":\"2\"}，post参数[]', '云天', '/index.php/index/index/index/sy/2.html', '2019-10-23 15:34:03', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('322', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 15:34:13', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('323', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 15:39:07', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('324', '328', 'get', 'Index', 'edit', 'get参数[]，post参数[]', '云天', '/index.php/index/index/edit.html', '2019-10-23 18:08:39', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('325', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 18:08:42', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('326', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 18:08:46', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('327', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 18:08:48', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('328', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-23 18:08:49', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('329', '328', 'get', 'Index', 'css', 'get参数[]，post参数[]', '云天', '/index.php/index/index/css.html', '2019-10-23 18:23:02', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('330', '328', 'get', 'Index', 'css', 'get参数[]，post参数[]', '云天', '/index.php/index/index/css.html', '2019-10-23 18:25:13', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('331', '328', 'get', 'Index', 'css', 'get参数[]，post参数[]', '云天', '/index.php/index/index/css.html', '2019-10-24 13:40:03', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('332', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-24 13:40:05', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('333', '328', 'ajax', 'Index', 'offcheck', 'get参数{\"name\":[\"http_referer\",\"referer_time\"]}，post参数{\"name\":[\"http_referer\",\"referer_time\"]}', '云天', '/index.php/index/index/offCheck', '2019-10-24 13:40:05', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('334', '328', 'get', 'Index', 'index', 'get参数{\"id\":\"332\"}，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-24 13:40:07', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('335', '328', 'ajax', 'Index', 'offcheck', 'get参数{\"name\":[\"http_referer\",\"referer_time\"]}，post参数{\"name\":[\"http_referer\",\"referer_time\"]}', '云天', '/index.php/index/index/offCheck', '2019-10-24 13:40:08', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('336', '328', 'ajax', 'Index', 'offcheck', 'get参数{\"name\":[\"http_referer\",\"referer_time\"]}，post参数{\"name\":[\"http_referer\",\"referer_time\"]}', '云天', '/index.php/index/index/offCheck', '2019-10-24 13:40:12', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('337', '328', 'ajax', 'Index', 'offcheck', 'get参数{\"name\":[\"http_referer\",\"referer_time\"]}，post参数{\"name\":[\"http_referer\",\"referer_time\"]}', '云天', '/index.php/index/index/offCheck', '2019-10-24 13:40:15', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('338', '328', 'get', 'Group', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/group/index.html', '2019-10-24 13:40:16', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('339', '328', 'get', 'System', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/system/index.html', '2019-10-24 13:40:17', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('340', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/admin.php/index/index/index.html', '2019-10-24 14:45:43', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('341', '328', 'ajax', 'Index', 'offcheck', 'get参数{\"name\":[\"http_referer\",\"referer_time\"]}，post参数{\"name\":[\"http_referer\",\"referer_time\"]}', '云天', '/index.php/index/index/offCheck', '2019-10-24 14:45:44', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('342', '328', 'ajax', 'System', 'flush_file_cache', 'get参数[]，post参数[]', '云天', '/admin.php/index/system/flush_file_cache.html', '2019-10-24 14:45:46', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('343', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/admin.php/index/index/index.html', '2019-10-24 14:45:49', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('344', '328', 'ajax', 'Index', 'offcheck', 'get参数{\"name\":[\"http_referer\",\"referer_time\"]}，post参数{\"name\":[\"http_referer\",\"referer_time\"]}', '云天', '/index.php/index/index/offCheck', '2019-10-24 14:45:49', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('345', '328', 'ajax', 'Index', 'offcheck', 'get参数{\"name\":[\"http_referer\",\"referer_time\"]}，post参数{\"name\":[\"http_referer\",\"referer_time\"]}', '云天', '/index.php/index/index/offCheck', '2019-10-24 14:45:55', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('346', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/admin.php/index/index/index.html', '2019-10-24 14:45:57', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('347', '328', 'ajax', 'Index', 'offcheck', 'get参数{\"name\":[\"http_referer\",\"referer_time\"]}，post参数{\"name\":[\"http_referer\",\"referer_time\"]}', '云天', '/index.php/index/index/offCheck', '2019-10-24 14:45:57', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('348', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/admin.php/index/index.html', '2019-10-24 14:49:23', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('349', '328', 'ajax', 'Index', 'offcheck', 'get参数{\"name\":[\"http_referer\",\"referer_time\"]}，post参数{\"name\":[\"http_referer\",\"referer_time\"]}', '云天', '/index.php/index/index/offCheck', '2019-10-24 14:49:24', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('350', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/admin.php/index/index.html', '2019-10-24 14:49:28', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('351', '328', 'ajax', 'Index', 'offcheck', 'get参数{\"name\":[\"http_referer\",\"referer_time\"]}，post参数{\"name\":[\"http_referer\",\"referer_time\"]}', '云天', '/index.php/index/index/offCheck', '2019-10-24 14:49:29', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('352', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/admin.php/index/index.html', '2019-10-24 14:49:31', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('353', '328', 'ajax', 'Index', 'offcheck', 'get参数{\"name\":[\"http_referer\",\"referer_time\"]}，post参数{\"name\":[\"http_referer\",\"referer_time\"]}', '云天', '/index.php/index/index/offCheck', '2019-10-24 14:49:31', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('354', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/admin.php/index/index.html', '2019-10-24 14:52:54', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('355', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-24 14:58:40', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('356', '328', 'ajax', 'Index', 'offcheck', 'get参数{\"name\":[\"http_referer\",\"referer_time\"]}，post参数{\"name\":[\"http_referer\",\"referer_time\"]}', '云天', '/index.php/index/index/offCheck', '2019-10-24 14:58:41', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('357', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/index.php/index/index/index.html', '2019-10-24 14:58:57', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('358', '328', 'ajax', 'Index', 'offcheck', 'get参数{\"name\":[\"http_referer\",\"referer_time\"]}，post参数{\"name\":[\"http_referer\",\"referer_time\"]}', '云天', '/index.php/index/index/offCheck', '2019-10-24 14:58:57', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('359', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/admin.php/index/index.html', '2019-10-24 14:59:25', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('360', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/admin.php/index/index.html', '2019-10-24 15:02:27', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('361', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/admin.php/index/index.html', '2019-10-24 15:06:43', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('362', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/admin.php/index/index.html', '2019-10-24 15:09:58', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('363', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/admin.php/index/index.html', '2019-10-24 15:11:36', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('364', '328', 'get', 'Index', 'index', 'get参数[]，post参数[]', '云天', '/admin.php/index/index.html', '2019-10-24 15:13:05', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('365', '328', 'get', 'Worker', 'index', 'get参数[]，post参数[]', '云天', '/admin.php/worker/index.html', '2019-10-24 15:50:38', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('366', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '2019-10-29 17:02:51', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('367', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '2019-10-29 17:06:36', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('368', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '2019-10-29 17:07:27', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('369', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php', '2019-10-29 17:07:51', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('370', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '2019-10-29 17:07:58', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('371', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php', '2019-10-29 17:08:35', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('372', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php', '2019-10-29 17:08:51', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('373', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php', '2019-10-29 17:09:29', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('374', '1', 'get', 'Group', 'edit', '点击位置 修改角色组，相关参数{\"id\":\"5\"}', 'lwy', '/index.php', '2019-10-29 17:09:32', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('375', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php', '2019-10-29 17:09:35', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('376', '1', 'get', 'Group', 'add', '点击位置 创建角色组，相关参数[]', 'lwy', '/index.php', '2019-10-29 17:09:37', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('377', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php', '2019-10-29 17:09:38', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('378', '1', 'get', 'Group', 'all_add', '点击位置 批量授权，相关参数[]', 'lwy', '/index.php', '2019-10-29 17:09:40', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('379', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php', '2019-10-29 17:09:42', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('380', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php', '2019-10-29 17:09:44', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('381', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php', '2019-10-29 17:10:15', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('382', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php', '2019-10-29 17:14:25', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('383', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php', '2019-10-29 17:14:35', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('384', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '2019-10-29 17:14:36', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('385', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '2019-10-29 17:15:02', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('386', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '2019-10-29 17:17:41', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('387', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '2019-10-29 17:17:42', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('388', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '2019-10-29 17:17:43', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('389', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '2019-10-29 17:17:46', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('390', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '2019-10-29 17:21:30', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('391', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '2019-10-29 17:22:19', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('392', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '2019-10-29 17:22:20', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('393', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '2019-10-30 09:34:43', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('394', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '2019-10-30 14:29:43', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('395', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '2019-10-30 14:30:24', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('396', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '2019-10-30 14:30:52', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('397', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '2019-10-30 14:31:56', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('398', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '2019-10-30 14:32:18', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('399', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php', '2019-10-30 14:32:52', '127.0.0.1');
INSERT INTO `crm_log` VALUES ('400', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php', '2019-10-30 14:32:53', '127.0.0.1');

-- ----------------------------
-- Table structure for crm_system
-- ----------------------------
DROP TABLE IF EXISTS `crm_system`;
CREATE TABLE `crm_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `identy` varchar(50) DEFAULT NULL COMMENT '键名',
  `attvalue` text COMMENT '键值',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统配置表';

-- ----------------------------
-- Records of crm_system
-- ----------------------------
