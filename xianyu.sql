/*
Navicat MySQL Data Transfer

Source Server         : lwy
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : xianyu

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-03-20 10:02:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xy_ad
-- ----------------------------
DROP TABLE IF EXISTS `xy_ad`;
CREATE TABLE `xy_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_img` int(11) DEFAULT NULL,
  `ad_url` varchar(255) DEFAULT NULL,
  `ad_target` enum('2','1') DEFAULT '1' COMMENT '是否当前页打开 1当前页 2另起一页',
  `ad_desc` varchar(255) DEFAULT NULL COMMENT '广告描述',
  `ad_stime` int(11) DEFAULT '0' COMMENT '广告开始时间',
  `ad_etime` int(11) DEFAULT '0' COMMENT '广告结束时间',
  `ad_addtime` int(11) DEFAULT NULL COMMENT '广告添加时间',
  `is_delete` enum('2','1') DEFAULT '1' COMMENT '1正常 2 删除',
  `is_show` enum('1','2') DEFAULT '1' COMMENT '1显示 2不显示',
  `ad_order` int(11) DEFAULT '99' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='广告列表';

-- ----------------------------
-- Records of xy_ad
-- ----------------------------
INSERT INTO `xy_ad` VALUES ('1', '9', 'www.baidu.com', '1', '测试百度', '1584460800', '1584547199', '1584547199', '1', '1', '99');
INSERT INTO `xy_ad` VALUES ('2', '9', 'www.baidu.sscom', '2', '测试百度', '1584460800', '1584547199', '1584509548', '1', '1', '99');

-- ----------------------------
-- Table structure for xy_admin
-- ----------------------------
DROP TABLE IF EXISTS `xy_admin`;
CREATE TABLE `xy_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `admin_username` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户名',
  `admin_password` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `admin_surename` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '真实姓名',
  `admin_addtime` int(10) DEFAULT '0' COMMENT '添加时间',
  `admin_status` tinyint(1) DEFAULT '1' COMMENT '1启用2禁用',
  `admin_style` tinyint(1) DEFAULT '1' COMMENT '默认样式',
  `admin_last_login_time` int(11) DEFAULT '0' COMMENT '管理员最后登录时间',
  `is_delete` enum('2','1') COLLATE utf8_bin DEFAULT '1' COMMENT '1正常 2删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of xy_admin
-- ----------------------------
INSERT INTO `xy_admin` VALUES ('1', '1', 'lwy', '3c0042ce996b15743753b503f8276bdd', '云天', '1534743442', '1', '1', '1584611687', '1');
INSERT INTO `xy_admin` VALUES ('2', '3', 'lwyenn', '3c0042ce996b15743753b503f8276bdd', '测试2', '1584511645', '1', '1', '1584611305', '1');

-- ----------------------------
-- Table structure for xy_api_log
-- ----------------------------
DROP TABLE IF EXISTS `xy_api_log`;
CREATE TABLE `xy_api_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_ajax` varchar(10) DEFAULT NULL COMMENT '请求方式',
  `api_url` varchar(100) DEFAULT NULL COMMENT '接口链接',
  `api_param` longtext COMMENT '参数',
  `api_res` longtext COMMENT '结果',
  `api_userip` varchar(20) DEFAULT NULL COMMENT '用户ip',
  `api_addtime` int(11) DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xy_api_log
-- ----------------------------
INSERT INTO `xy_api_log` VALUES ('1', 'get', 'Login/index', '[]', '账号或密码错误！', '127.0.0.1', '1584520729');
INSERT INTO `xy_api_log` VALUES ('2', 'get', 'Login/index', '[]', '账号或密码错误！', '127.0.0.1', '1584520755');
INSERT INTO `xy_api_log` VALUES ('3', 'post', 'Login/index', '{\"username\":\"12321321321\",\"userpass\":\"112323\"}', '账号或密码错误！', '127.0.0.1', '1584520769');
INSERT INTO `xy_api_log` VALUES ('4', 'post', 'Login/index', '{\"username\":\"zhangsan\",\"userpass\":\"123456\"}', '', '127.0.0.1', '1584520952');
INSERT INTO `xy_api_log` VALUES ('5', 'post', 'Login/index', '{\"username\":\"zhangsan\",\"userpass\":\"123456\"}', '账号已被禁用！', '127.0.0.1', '1584520972');
INSERT INTO `xy_api_log` VALUES ('6', 'post', 'Login/index', '{\"username\":\"zhangsan\",\"userpass\":\"123456\"}', '', '127.0.0.1', '1584521071');
INSERT INTO `xy_api_log` VALUES ('7', 'post', 'Login/index', '{\"username\":\"zhangsan\",\"userpass\":\"123456\"}', '登录成功', '127.0.0.1', '1584521084');
INSERT INTO `xy_api_log` VALUES ('8', 'post', 'Login/index', '{\"username\":\"zhangsan\",\"userpass\":\"123456\"}', '登录成功，返回数据：{\"user_username\":\"zhangsan\",\"user_surename\":\"\\u5f20\\u4e0933\"}', '127.0.0.1', '1584521148');
INSERT INTO `xy_api_log` VALUES ('9', 'post', 'Ad/list', '{\"username\":\"zhangsan\",\"userpass\":\"123456\"}', '', '127.0.0.1', '1584523502');
INSERT INTO `xy_api_log` VALUES ('10', 'post', 'Ad/list', '{\"username\":\"zhangsan\",\"userpass\":\"123456\"}', '', '127.0.0.1', '1584523530');
INSERT INTO `xy_api_log` VALUES ('11', 'post', 'Ad/list', '{\"username\":\"zhangsan\",\"userpass\":\"123456\"}', '', '127.0.0.1', '1584523542');
INSERT INTO `xy_api_log` VALUES ('12', 'post', 'Ad/list', '{\"username\":\"zhangsan\",\"userpass\":\"123456\"}', '', '127.0.0.1', '1584523571');
INSERT INTO `xy_api_log` VALUES ('13', 'post', 'Ad/list', '{\"username\":\"zhangsan\",\"userpass\":\"123456\"}', '获取成功，返回数据：[{\"ad_img\":\"\\/upload\\/index\\/image\\/202003\\/5e707fac2f7a6.jpg\",\"ad_url\":\"www.baidu.com\",\"ad_target\":\"1\",\"ad_desc\":\"\\u6d4b\\u8bd5\\u767e\\u5ea6\"}]', '127.0.0.1', '1584523681');
INSERT INTO `xy_api_log` VALUES ('14', 'post', 'Ad/list', '{\"username\":\"zhangsan\",\"userpass\":\"123456\"}', '获取成功，返回数据：[{\"ad_img\":\"\\/upload\\/index\\/image\\/202003\\/5e707fac2f7a6.jpg\",\"ad_url\":\"www.baidu.sscom\",\"ad_target\":\"2\",\"ad_desc\":\"\\u6d4b\\u8bd5\\u767e\\u5ea6\"},{\"ad_img\":\"\\/upload\\/index\\/image\\/202003\\/5e707fac2f7a6.jpg\",\"ad_url\":\"www.baidu.com\",\"ad_target\":\"1\",\"ad_desc\":\"\\u6d4b\\u8bd5\\u767e\\u5ea6\"}]', '127.0.0.1', '1584523710');
INSERT INTO `xy_api_log` VALUES ('15', 'post', 'Ad/alist', '{\"username\":\"zhangsan\",\"userpass\":\"123456\"}', '获取成功，返回数据：[{\"ad_img\":\"\\/upload\\/index\\/image\\/202003\\/5e707fac2f7a6.jpg\",\"ad_url\":\"www.baidu.sscom\",\"ad_target\":\"2\",\"ad_desc\":\"\\u6d4b\\u8bd5\\u767e\\u5ea6\"},{\"ad_img\":\"\\/upload\\/index\\/image\\/202003\\/5e707fac2f7a6.jpg\",\"ad_url\":\"www.baidu.com\",\"ad_target\":\"1\",\"ad_desc\":\"\\u6d4b\\u8bd5\\u767e\\u5ea6\"}]', '127.0.0.1', '1584523742');
INSERT INTO `xy_api_log` VALUES ('16', 'post', 'Order/pay', '{\"username\":\"zhangsan\",\"userpass\":\"123456\"}', '参数不为空！', '127.0.0.1', '1584586039');
INSERT INTO `xy_api_log` VALUES ('17', 'post', 'Order/pay', '{\"username\":\"zhangsan\",\"userpass\":\"123456\"}', '参数不为空！', '127.0.0.1', '1584586050');
INSERT INTO `xy_api_log` VALUES ('18', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"gooods_count\":\"2\",\"price\":\"6.5\"}', '商品已下架或商品不存在', '127.0.0.1', '1584586608');
INSERT INTO `xy_api_log` VALUES ('19', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '参数不为空！', '127.0.0.1', '1584586632');
INSERT INTO `xy_api_log` VALUES ('20', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '商品已下架或商品不存在', '127.0.0.1', '1584586656');
INSERT INTO `xy_api_log` VALUES ('21', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '商品已下架或商品不存在', '127.0.0.1', '1584586791');
INSERT INTO `xy_api_log` VALUES ('22', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '商品已下架或商品不存在', '127.0.0.1', '1584586803');
INSERT INTO `xy_api_log` VALUES ('23', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '商品已下架或商品不存在', '127.0.0.1', '1584586811');
INSERT INTO `xy_api_log` VALUES ('24', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '商品已下架或商品不存在', '127.0.0.1', '1584587083');
INSERT INTO `xy_api_log` VALUES ('25', 'post', 'Ad/alist', '{\"username\":\"zhangsan\",\"userpass\":\"123456\"}', '获取成功，返回数据：[{\"ad_img\":\"\\/upload\\/index\\/image\\/202003\\/5e707fac2f7a6.jpg\",\"ad_url\":\"www.baidu.sscom\",\"ad_target\":\"2\",\"ad_desc\":\"\\u6d4b\\u8bd5\\u767e\\u5ea6\"},{\"ad_img\":\"\\/upload\\/index\\/image\\/202003\\/5e707fac2f7a6.jpg\",\"ad_url\":\"www.baidu.com\",\"ad_target\":\"1\",\"ad_desc\":\"\\u6d4b\\u8bd5\\u767e\\u5ea6\"}]', '127.0.0.1', '1584587170');
INSERT INTO `xy_api_log` VALUES ('26', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '商品已下架或商品不存在', '127.0.0.1', '1584587242');
INSERT INTO `xy_api_log` VALUES ('27', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '', '127.0.0.1', '1584587297');
INSERT INTO `xy_api_log` VALUES ('28', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '商品已下架或商品不存在', '127.0.0.1', '1584587357');
INSERT INTO `xy_api_log` VALUES ('29', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '商品已下架或商品不存在', '127.0.0.1', '1584587409');
INSERT INTO `xy_api_log` VALUES ('30', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '商品已下架或商品不存在', '127.0.0.1', '1584587439');
INSERT INTO `xy_api_log` VALUES ('31', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '商品已下架或商品不存在', '127.0.0.1', '1584587458');
INSERT INTO `xy_api_log` VALUES ('32', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '', '127.0.0.1', '1584587485');
INSERT INTO `xy_api_log` VALUES ('33', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '下单成功！，返回数据：{\"uid\":1,\"orderno\":\"120031987556079913\",\"goods_id\":3,\"goods_count\":2,\"order_price\":6.5,\"order_addtime\":1584587556,\"order_status\":1}', '127.0.0.1', '1584587556');
INSERT INTO `xy_api_log` VALUES ('34', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '下单成功！，返回数据：{\"uid\":1,\"orderno\":\"120031987763580168\",\"goods_id\":3,\"goods_count\":2,\"order_price\":6.5,\"order_addtime\":\"2020-03-19 11:16:03\",\"order_status\":1}', '127.0.0.1', '1584587763');
INSERT INTO `xy_api_log` VALUES ('35', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '下单成功！，返回数据：{\"uid\":1,\"orderno\":\"120031987926710927\",\"goods_id\":3,\"goods_count\":2,\"order_price\":6.5,\"order_addtime\":\"2020-03-19 11:18:46\",\"order_status\":1}', '127.0.0.1', '1584587926');
INSERT INTO `xy_api_log` VALUES ('36', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '商品已下架或商品不存在', '127.0.0.1', '1584588036');
INSERT INTO `xy_api_log` VALUES ('37', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '商品已下架或商品不存在', '127.0.0.1', '1584588378');
INSERT INTO `xy_api_log` VALUES ('38', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '商品已下架或商品不存在', '127.0.0.1', '1584588461');
INSERT INTO `xy_api_log` VALUES ('39', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '商品已下架或商品不存在', '127.0.0.1', '1584588489');
INSERT INTO `xy_api_log` VALUES ('40', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '下单成功！，返回数据：{\"uid\":1,\"orderno\":\"120031988548454516\",\"goods_id\":3,\"goods_count\":2,\"order_price\":6.5,\"order_addtime\":\"2020-03-19 11:29:08\",\"order_status\":1}', '127.0.0.1', '1584588548');
INSERT INTO `xy_api_log` VALUES ('41', 'post', 'Order/olist', '{\"goodsname\":\"\",\"orderno\":\"\",\"uid\":\"1\",\"order_start_time\":\"\",\"order_end_time\":\"\",\"page_num\":\"\"}', '', '127.0.0.1', '1584601986');
INSERT INTO `xy_api_log` VALUES ('42', 'post', 'Order/olist', '{\"goodsname\":\"\",\"orderno\":\"\",\"uid\":\"1\",\"order_start_time\":\"\",\"order_end_time\":\"\",\"page_num\":\"\"}', '获取成功！，返回数据：{\"datas\":[{\"orderno\":\"120031988548454516\",\"goods_name\":\"\\u8e29\\u8e29\\u8e29\\u8e29\\u8e29\",\"goods_count\":2,\"order_price\":\"6.50\",\"order_status\":4,\"order_addtime\":1584588548,\"order_address\":\"222222\",\"order_phone\":\"123213213213\",\"order_logistics\":\"360sksk\",\"order_logno\":\"12321121233\",\"order_remark\":null,\"id\":4}],\"pageHtml\":null,\"total\":1}', '127.0.0.1', '1584602014');
INSERT INTO `xy_api_log` VALUES ('43', 'post', 'Order/olist', '{\"goodsname\":\"\",\"orderno\":\"\",\"uid\":\"1\",\"order_start_time\":\"\",\"order_end_time\":\"\",\"page_num\":\"\"}', '获取成功！，返回数据：{\"datas\":[{\"orderno\":\"120031988548454516\",\"goods_name\":\"\\u8e29\\u8e29\\u8e29\\u8e29\\u8e29\",\"goods_count\":2,\"order_price\":\"6.50\",\"order_status\":4,\"order_addtime\":1584588548,\"order_address\":\"222222\",\"order_phone\":\"123213213213\",\"order_logistics\":\"360sksk\",\"order_logno\":\"12321121233\",\"order_remark\":null,\"id\":4,\"status_text\":null}],\"pageHtml\":null,\"total\":1}', '127.0.0.1', '1584602110');
INSERT INTO `xy_api_log` VALUES ('44', 'post', 'Order/olist', '{\"goodsname\":\"\",\"orderno\":\"\",\"uid\":\"1\",\"order_start_time\":\"\",\"order_end_time\":\"\",\"page_num\":\"\"}', '获取成功！，返回数据：{\"datas\":[{\"orderno\":\"120031988548454516\",\"goods_name\":\"\\u8e29\\u8e29\\u8e29\\u8e29\\u8e29\",\"goods_count\":2,\"order_price\":\"6.50\",\"order_status\":4,\"order_addtime\":1584588548,\"order_address\":\"222222\",\"order_phone\":\"123213213213\",\"order_logistics\":\"360sksk\",\"order_logno\":\"12321121233\",\"order_remark\":null,\"id\":4,\"status_text\":null}],\"pageHtml\":null,\"total\":1}', '127.0.0.1', '1584602168');
INSERT INTO `xy_api_log` VALUES ('45', 'post', 'Order/olist', '{\"goodsname\":\"\",\"orderno\":\"\",\"uid\":\"1\",\"order_start_time\":\"\",\"order_end_time\":\"\",\"page_num\":\"\"}', '获取成功！，返回数据：{\"datas\":[{\"orderno\":\"120031988548454516\",\"goods_name\":\"\\u8e29\\u8e29\\u8e29\\u8e29\\u8e29\",\"goods_count\":2,\"order_price\":\"6.50\",\"order_status\":4,\"order_addtime\":1584588548,\"order_address\":\"222222\",\"order_phone\":\"123213213213\",\"order_logistics\":\"360sksk\",\"order_logno\":\"12321121233\",\"order_remark\":null,\"id\":4,\"status_text\":null}],\"pageHtml\":null,\"total\":1}', '127.0.0.1', '1584602187');
INSERT INTO `xy_api_log` VALUES ('46', 'post', 'Order/olist', '{\"goodsname\":\"\",\"orderno\":\"\",\"uid\":\"1\",\"order_start_time\":\"\",\"order_end_time\":\"\",\"page_num\":\"\"}', '获取成功！，返回数据：{\"datas\":[{\"orderno\":\"120031988548454516\",\"goods_name\":\"\\u8e29\\u8e29\\u8e29\\u8e29\\u8e29\",\"goods_count\":2,\"order_price\":\"6.50\",\"order_status\":4,\"order_addtime\":1584588548,\"order_address\":\"222222\",\"order_phone\":\"123213213213\",\"order_logistics\":\"360sksk\",\"order_logno\":\"12321121233\",\"order_remark\":null,\"id\":4,\"status_text\":null}],\"pageHtml\":null,\"total\":1}', '127.0.0.1', '1584602238');
INSERT INTO `xy_api_log` VALUES ('47', 'post', 'Order/olist', '{\"goodsname\":\"\",\"orderno\":\"\",\"uid\":\"1\",\"order_start_time\":\"\",\"order_end_time\":\"\",\"page_num\":\"\"}', '获取成功！，返回数据：{\"datas\":[{\"orderno\":\"120031988548454516\",\"goods_name\":\"\\u8e29\\u8e29\\u8e29\\u8e29\\u8e29\",\"goods_count\":2,\"order_price\":\"6.50\",\"order_status\":4,\"order_addtime\":1584588548,\"order_address\":\"222222\",\"order_phone\":\"123213213213\",\"order_logistics\":\"360sksk\",\"order_logno\":\"12321121233\",\"order_remark\":null,\"id\":4,\"status_text\":\"<font color=\'#a52a2a\'><\\/font>\"}],\"pageHtml\":null,\"total\":1}', '127.0.0.1', '1584602291');
INSERT INTO `xy_api_log` VALUES ('48', 'post', 'Order/olist', '{\"goodsname\":\"\",\"orderno\":\"\",\"uid\":\"1\",\"order_start_time\":\"\",\"order_end_time\":\"\",\"page_num\":\"\"}', '获取成功！，返回数据：{\"datas\":[{\"orderno\":\"120031988548454516\",\"goods_name\":\"\\u8e29\\u8e29\\u8e29\\u8e29\\u8e29\",\"goods_count\":2,\"order_price\":\"6.50\",\"order_status\":4,\"order_addtime\":1584588548,\"order_address\":\"222222\",\"order_phone\":\"123213213213\",\"order_logistics\":\"360sksk\",\"order_logno\":\"12321121233\",\"order_remark\":null,\"id\":4,\"status_text\":\"<font color=\'#a52a2a\'>x<\\/font>\"}],\"pageHtml\":null,\"total\":1}', '127.0.0.1', '1584602377');
INSERT INTO `xy_api_log` VALUES ('49', 'post', 'Order/olist', '{\"goodsname\":\"\",\"orderno\":\"\",\"uid\":\"1\",\"order_start_time\":\"\",\"order_end_time\":\"\",\"page_num\":\"\"}', '获取成功！，返回数据：{\"datas\":[{\"orderno\":\"120031988548454516\",\"goods_name\":\"\\u8e29\\u8e29\\u8e29\\u8e29\\u8e29\",\"goods_count\":2,\"order_price\":\"6.50\",\"order_status\":4,\"order_addtime\":1584588548,\"order_address\":\"222222\",\"order_phone\":\"123213213213\",\"order_logistics\":\"360sksk\",\"order_logno\":\"12321121233\",\"order_remark\":null,\"id\":4,\"status_text\":\"<font color=\'#a52a2a\'>\\u9000\\u8d27\\u4e2d<\\/font>\"}],\"pageHtml\":null,\"total\":1}', '127.0.0.1', '1584602477');
INSERT INTO `xy_api_log` VALUES ('50', 'post', 'Order/olist', '{\"goodsname\":\"\",\"orderno\":\"\",\"uid\":\"1\",\"order_start_time\":\"\",\"order_end_time\":\"\",\"page_num\":\"\"}', '获取成功！，返回数据：{\"datas\":[{\"orderno\":\"120031988548454516\",\"goods_name\":\"\\u8e29\\u8e29\\u8e29\\u8e29\\u8e29\",\"goods_count\":2,\"order_price\":\"6.50\",\"order_status\":4,\"order_addtime\":1584588548,\"order_address\":\"222222\",\"order_phone\":\"123213213213\",\"order_logistics\":\"360sksk\",\"order_logno\":\"12321121233\",\"order_remark\":null,\"id\":4,\"status_text\":\"\\u9000\\u8d27\\u4e2d\"}],\"pageHtml\":null,\"total\":1}', '127.0.0.1', '1584602493');
INSERT INTO `xy_api_log` VALUES ('51', 'post', 'Order/olist', '{\"goodsname\":\"\",\"orderno\":\"\",\"uid\":\"1\",\"order_start_time\":\"\",\"order_end_time\":\"\",\"page_num\":\"\"}', '获取成功！，返回数据：{\"datas\":[{\"orderno\":\"120031988548454516\",\"goods_name\":\"\\u8e29\\u8e29\\u8e29\\u8e29\\u8e29\",\"goods_count\":2,\"order_price\":\"6.50\",\"order_status\":4,\"order_addtime\":\"2020-03-19 11:29:08\",\"order_address\":\"222222\",\"order_phone\":\"123213213213\",\"order_logistics\":\"360sksk\",\"order_logno\":\"12321121233\",\"order_remark\":null,\"id\":4,\"status_text\":\"\\u9000\\u8d27\\u4e2d\"}],\"total\":1}', '127.0.0.1', '1584602801');
INSERT INTO `xy_api_log` VALUES ('52', 'post', 'Ad/list', '{\"username\":\"zhangsan\",\"userpass\":\"123456\"}', '', '127.0.0.1', '1584603724');
INSERT INTO `xy_api_log` VALUES ('53', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '参数不为空！', '127.0.0.1', '1584604044');
INSERT INTO `xy_api_log` VALUES ('54', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '参数不为空！', '127.0.0.1', '1584604050');
INSERT INTO `xy_api_log` VALUES ('55', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '参数不为空！', '127.0.0.1', '1584604056');
INSERT INTO `xy_api_log` VALUES ('56', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\"}', '参数不为空！', '127.0.0.1', '1584604060');
INSERT INTO `xy_api_log` VALUES ('57', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6.5\",\"address\":\"sdskdfjkasfhlkd\",\"phone\":\"1152622362626\"}', '下单成功！，返回数据：{\"uid\":1,\"orderno\":\"120031904082238934\",\"goods_id\":3,\"goods_count\":2,\"order_price\":6.5,\"order_addtime\":\"2020-03-19 15:48:02\",\"order_status\":1,\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\"}', '127.0.0.1', '1584604082');
INSERT INTO `xy_api_log` VALUES ('58', 'post', 'Order/pay', '{\"goods_id\":\"2\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6\",\"address\":\"sdskdfjkasfhlkd\",\"phone\":\"1152622362626\"}', '下单成功！，返回数据：{\"uid\":1,\"orderno\":\"120031904096021239\",\"goods_id\":2,\"goods_count\":2,\"order_price\":6,\"order_addtime\":\"2020-03-19 15:48:16\",\"order_status\":1,\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\"}', '127.0.0.1', '1584604096');
INSERT INTO `xy_api_log` VALUES ('59', 'post', 'Order/pay', '{\"goods_id\":\"2\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6\",\"address\":\"sdskdfjkasfhlkd\",\"phone\":\"1152622362626\"}', '下单成功！，返回数据：{\"uid\":1,\"orderno\":\"120031904098995630\",\"goods_id\":2,\"goods_count\":2,\"order_price\":6,\"order_addtime\":\"2020-03-19 15:48:18\",\"order_status\":1,\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\"}', '127.0.0.1', '1584604099');
INSERT INTO `xy_api_log` VALUES ('60', 'post', 'Order/pay', '{\"goods_id\":\"1\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6\",\"address\":\"sdskdfjkasfhlkd\",\"phone\":\"1152622362626\"}', '下单成功！，返回数据：{\"uid\":1,\"orderno\":\"120031904102073764\",\"goods_id\":1,\"goods_count\":2,\"order_price\":6,\"order_addtime\":\"2020-03-19 15:48:22\",\"order_status\":1,\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\"}', '127.0.0.1', '1584604102');
INSERT INTO `xy_api_log` VALUES ('61', 'post', 'Order/pay', '{\"goods_id\":\"1\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6\",\"address\":\"sdskdfjkasfhlkd\",\"phone\":\"1152622362626\"}', '下单成功！，返回数据：{\"uid\":1,\"orderno\":\"120031904103761973\",\"goods_id\":1,\"goods_count\":2,\"order_price\":6,\"order_addtime\":\"2020-03-19 15:48:23\",\"order_status\":1,\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\"}', '127.0.0.1', '1584604103');
INSERT INTO `xy_api_log` VALUES ('62', 'post', 'Order/pay', '{\"goods_id\":\"1\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6\",\"address\":\"sdskdfjkasfhlkd\",\"phone\":\"1152622362626\"}', '下单成功！，返回数据：{\"uid\":1,\"orderno\":\"120031904104980592\",\"goods_id\":1,\"goods_count\":2,\"order_price\":6,\"order_addtime\":\"2020-03-19 15:48:24\",\"order_status\":1,\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\"}', '127.0.0.1', '1584604104');
INSERT INTO `xy_api_log` VALUES ('63', 'post', 'Order/pay', '{\"goods_id\":\"4\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6\",\"address\":\"sdskdfjkasfhlkd\",\"phone\":\"1152622362626\"}', '商品已下架或商品不存在', '127.0.0.1', '1584604110');
INSERT INTO `xy_api_log` VALUES ('64', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6\",\"address\":\"sdskdfjkasfhlkd\",\"phone\":\"1152622362626\"}', '下单成功！，返回数据：{\"uid\":1,\"orderno\":\"120031904114603904\",\"goods_id\":3,\"goods_count\":2,\"order_price\":6,\"order_addtime\":\"2020-03-19 15:48:34\",\"order_status\":1,\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\"}', '127.0.0.1', '1584604114');
INSERT INTO `xy_api_log` VALUES ('65', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6\",\"address\":\"sdskdfjkasfhlkd\",\"phone\":\"1152622362626\"}', '下单成功！，返回数据：{\"uid\":1,\"orderno\":\"120031904115532119\",\"goods_id\":3,\"goods_count\":2,\"order_price\":6,\"order_addtime\":\"2020-03-19 15:48:35\",\"order_status\":1,\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\"}', '127.0.0.1', '1584604115');
INSERT INTO `xy_api_log` VALUES ('66', 'post', 'Order/pay', '{\"goods_id\":\"2\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6\",\"address\":\"sdskdfjkasfhlkd\",\"phone\":\"1152622362626\"}', '下单成功！，返回数据：{\"uid\":1,\"orderno\":\"120031904118243758\",\"goods_id\":2,\"goods_count\":2,\"order_price\":6,\"order_addtime\":\"2020-03-19 15:48:38\",\"order_status\":1,\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\"}', '127.0.0.1', '1584604118');
INSERT INTO `xy_api_log` VALUES ('67', 'post', 'Order/pay', '{\"goods_id\":\"2\",\"uid\":\"1\",\"goods_count\":\"2\",\"price\":\"6\",\"address\":\"sdskdfjkasfhlkd\",\"phone\":\"1152622362626\"}', '下单成功！，返回数据：{\"uid\":1,\"orderno\":\"120031904119357486\",\"goods_id\":2,\"goods_count\":2,\"order_price\":6,\"order_addtime\":\"2020-03-19 15:48:39\",\"order_status\":1,\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\"}', '127.0.0.1', '1584604119');
INSERT INTO `xy_api_log` VALUES ('68', 'post', 'Ad/alist', '{\"username\":\"zhangsan\",\"userpass\":\"123456\"}', '获取成功，返回数据：{\"list\":[{\"ad_img\":\"\\/upload\\/index\\/image\\/202003\\/5e707fac2f7a6.jpg\",\"ad_url\":\"www.baidu.sscom\",\"ad_target\":\"2\",\"ad_desc\":\"\\u6d4b\\u8bd5\\u767e\\u5ea6\"},{\"ad_img\":\"\\/upload\\/index\\/image\\/202003\\/5e707fac2f7a6.jpg\",\"ad_url\":\"www.baidu.com\",\"ad_target\":\"1\",\"ad_desc\":\"\\u6d4b\\u8bd5\\u767e\\u5ea6\"}]}', '127.0.0.1', '1584604291');
INSERT INTO `xy_api_log` VALUES ('69', 'post', 'Order/olist', '{\"goodsname\":\"\",\"orderno\":\"\",\"uid\":\"1\",\"order_start_time\":\"\",\"order_end_time\":\"\",\"page_num\":\"\"}', '获取成功！，返回数据：{\"datas\":[{\"orderno\":\"120031904119357486\",\"goods_name\":\"Nnnn\",\"goods_count\":2,\"order_price\":\"6.00\",\"order_status\":1,\"order_addtime\":\"2020-03-19 15:48:39\",\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\",\"order_logistics\":null,\"order_logno\":null,\"order_remark\":null,\"id\":14,\"status_text\":\"\\u5df2\\u652f\\u4ed8\"},{\"orderno\":\"120031904118243758\",\"goods_name\":\"Nnnn\",\"goods_count\":2,\"order_price\":\"6.00\",\"order_status\":1,\"order_addtime\":\"2020-03-19 15:48:38\",\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\",\"order_logistics\":null,\"order_logno\":null,\"order_remark\":null,\"id\":13,\"status_text\":\"\\u5df2\\u652f\\u4ed8\"},{\"orderno\":\"120031904115532119\",\"goods_name\":\"\\u8e29\\u8e29\\u8e29\\u8e29\\u8e29\",\"goods_count\":2,\"order_price\":\"6.00\",\"order_status\":1,\"order_addtime\":\"2020-03-19 15:48:35\",\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\",\"order_logistics\":null,\"order_logno\":null,\"order_remark\":null,\"id\":12,\"status_text\":\"\\u5df2\\u652f\\u4ed8\"},{\"orderno\":\"120031904114603904\",\"goods_name\":\"\\u8e29\\u8e29\\u8e29\\u8e29\\u8e29\",\"goods_count\":2,\"order_price\":\"6.00\",\"order_status\":1,\"order_addtime\":\"2020-03-19 15:48:34\",\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\",\"order_logistics\":null,\"order_logno\":null,\"order_remark\":null,\"id\":11,\"status_text\":\"\\u5df2\\u652f\\u4ed8\"},{\"orderno\":\"120031904104980592\",\"goods_name\":\"\\u6797\\u674e\\u5927\\u6218\",\"goods_count\":2,\"order_price\":\"6.00\",\"order_status\":1,\"order_addtime\":\"2020-03-19 15:48:24\",\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\",\"order_logistics\":null,\"order_logno\":null,\"order_remark\":null,\"id\":10,\"status_text\":\"\\u5df2\\u652f\\u4ed8\"},{\"orderno\":\"120031904103761973\",\"goods_name\":\"\\u6797\\u674e\\u5927\\u6218\",\"goods_count\":2,\"order_price\":\"6.00\",\"order_status\":1,\"order_addtime\":\"2020-03-19 15:48:23\",\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\",\"order_logistics\":null,\"order_logno\":null,\"order_remark\":null,\"id\":9,\"status_text\":\"\\u5df2\\u652f\\u4ed8\"},{\"orderno\":\"120031904102073764\",\"goods_name\":\"\\u6797\\u674e\\u5927\\u6218\",\"goods_count\":2,\"order_price\":\"6.00\",\"order_status\":1,\"order_addtime\":\"2020-03-19 15:48:22\",\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\",\"order_logistics\":null,\"order_logno\":null,\"order_remark\":null,\"id\":8,\"status_text\":\"\\u5df2\\u652f\\u4ed8\"},{\"orderno\":\"120031904098995630\",\"goods_name\":\"Nnnn\",\"goods_count\":2,\"order_price\":\"6.00\",\"order_status\":1,\"order_addtime\":\"2020-03-19 15:48:18\",\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\",\"order_logistics\":null,\"order_logno\":null,\"order_remark\":null,\"id\":7,\"status_text\":\"\\u5df2\\u652f\\u4ed8\"},{\"orderno\":\"120031904096021239\",\"goods_name\":\"Nnnn\",\"goods_count\":2,\"order_price\":\"6.00\",\"order_status\":1,\"order_addtime\":\"2020-03-19 15:48:16\",\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\",\"order_logistics\":null,\"order_logno\":null,\"order_remark\":null,\"id\":6,\"status_text\":\"\\u5df2\\u652f\\u4ed8\"},{\"orderno\":\"120031904082238934\",\"goods_name\":\"\\u8e29\\u8e29\\u8e29\\u8e29\\u8e29\",\"goods_count\":2,\"order_price\":\"6.50\",\"order_status\":1,\"order_addtime\":\"2020-03-19 15:48:02\",\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\",\"order_logistics\":null,\"order_logno\":null,\"order_remark\":null,\"id\":5,\"status_text\":\"\\u5df2\\u652f\\u4ed8\"}],\"total\":11}', '127.0.0.1', '1584604411');
INSERT INTO `xy_api_log` VALUES ('70', 'post', 'Order/olist', '{\"goodsname\":\"\",\"orderno\":\"\",\"uid\":\"1\",\"order_start_time\":\"\",\"order_end_time\":\"\",\"page_num\":\"\",\"page\":\"\"}', '获取成功！，返回数据：{\"datas\":[{\"orderno\":\"120031904119357486\",\"goods_name\":\"Nnnn\",\"goods_count\":2,\"order_price\":\"6.00\",\"order_status\":1,\"order_addtime\":\"2020-03-19 15:48:39\",\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\",\"order_logistics\":null,\"order_logno\":null,\"order_remark\":null,\"id\":14,\"status_text\":\"\\u5df2\\u652f\\u4ed8\"},{\"orderno\":\"120031904118243758\",\"goods_name\":\"Nnnn\",\"goods_count\":2,\"order_price\":\"6.00\",\"order_status\":1,\"order_addtime\":\"2020-03-19 15:48:38\",\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\",\"order_logistics\":null,\"order_logno\":null,\"order_remark\":null,\"id\":13,\"status_text\":\"\\u5df2\\u652f\\u4ed8\"},{\"orderno\":\"120031904115532119\",\"goods_name\":\"\\u8e29\\u8e29\\u8e29\\u8e29\\u8e29\",\"goods_count\":2,\"order_price\":\"6.00\",\"order_status\":1,\"order_addtime\":\"2020-03-19 15:48:35\",\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\",\"order_logistics\":null,\"order_logno\":null,\"order_remark\":null,\"id\":12,\"status_text\":\"\\u5df2\\u652f\\u4ed8\"},{\"orderno\":\"120031904114603904\",\"goods_name\":\"\\u8e29\\u8e29\\u8e29\\u8e29\\u8e29\",\"goods_count\":2,\"order_price\":\"6.00\",\"order_status\":1,\"order_addtime\":\"2020-03-19 15:48:34\",\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\",\"order_logistics\":null,\"order_logno\":null,\"order_remark\":null,\"id\":11,\"status_text\":\"\\u5df2\\u652f\\u4ed8\"},{\"orderno\":\"120031904104980592\",\"goods_name\":\"\\u6797\\u674e\\u5927\\u6218\",\"goods_count\":2,\"order_price\":\"6.00\",\"order_status\":1,\"order_addtime\":\"2020-03-19 15:48:24\",\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\",\"order_logistics\":null,\"order_logno\":null,\"order_remark\":null,\"id\":10,\"status_text\":\"\\u5df2\\u652f\\u4ed8\"}],\"total\":11}', '127.0.0.1', '1584604485');
INSERT INTO `xy_api_log` VALUES ('71', 'post', 'Order/olist', '{\"goodsname\":\"\",\"orderno\":\"\",\"uid\":\"1\",\"order_start_time\":\"\",\"order_end_time\":\"\",\"page_num\":\"\",\"page\":\"2\"}', '获取成功！，返回数据：{\"datas\":[{\"orderno\":\"120031904103761973\",\"goods_name\":\"\\u6797\\u674e\\u5927\\u6218\",\"goods_count\":2,\"order_price\":\"6.00\",\"order_status\":1,\"order_addtime\":\"2020-03-19 15:48:23\",\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\",\"order_logistics\":null,\"order_logno\":null,\"order_remark\":null,\"id\":9,\"status_text\":\"\\u5df2\\u652f\\u4ed8\"},{\"orderno\":\"120031904102073764\",\"goods_name\":\"\\u6797\\u674e\\u5927\\u6218\",\"goods_count\":2,\"order_price\":\"6.00\",\"order_status\":1,\"order_addtime\":\"2020-03-19 15:48:22\",\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\",\"order_logistics\":null,\"order_logno\":null,\"order_remark\":null,\"id\":8,\"status_text\":\"\\u5df2\\u652f\\u4ed8\"},{\"orderno\":\"120031904098995630\",\"goods_name\":\"Nnnn\",\"goods_count\":2,\"order_price\":\"6.00\",\"order_status\":1,\"order_addtime\":\"2020-03-19 15:48:18\",\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\",\"order_logistics\":null,\"order_logno\":null,\"order_remark\":null,\"id\":7,\"status_text\":\"\\u5df2\\u652f\\u4ed8\"},{\"orderno\":\"120031904096021239\",\"goods_name\":\"Nnnn\",\"goods_count\":2,\"order_price\":\"6.00\",\"order_status\":1,\"order_addtime\":\"2020-03-19 15:48:16\",\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\",\"order_logistics\":null,\"order_logno\":null,\"order_remark\":null,\"id\":6,\"status_text\":\"\\u5df2\\u652f\\u4ed8\"},{\"orderno\":\"120031904082238934\",\"goods_name\":\"\\u8e29\\u8e29\\u8e29\\u8e29\\u8e29\",\"goods_count\":2,\"order_price\":\"6.50\",\"order_status\":1,\"order_addtime\":\"2020-03-19 15:48:02\",\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\",\"order_logistics\":null,\"order_logno\":null,\"order_remark\":null,\"id\":5,\"status_text\":\"\\u5df2\\u652f\\u4ed8\"}],\"total\":11}', '127.0.0.1', '1584604505');
INSERT INTO `xy_api_log` VALUES ('72', 'post', 'Order/olist', '{\"goodsname\":\"\",\"orderno\":\"\",\"uid\":\"1\",\"order_start_time\":\"\",\"order_end_time\":\"\",\"page_num\":\"10\",\"page\":\"2\"}', '获取成功！，返回数据：{\"datas\":[{\"orderno\":\"120031988548454516\",\"goods_name\":\"\\u8e29\\u8e29\\u8e29\\u8e29\\u8e29\",\"goods_count\":2,\"order_price\":\"6.50\",\"order_status\":4,\"order_addtime\":\"2020-03-19 11:29:08\",\"order_address\":\"222222\",\"order_phone\":\"123213213213\",\"order_logistics\":\"360sksk\",\"order_logno\":\"12321121233\",\"order_remark\":null,\"id\":4,\"status_text\":\"\\u9000\\u8d27\\u4e2d\"}],\"total\":11}', '127.0.0.1', '1584604532');
INSERT INTO `xy_api_log` VALUES ('73', 'post', 'Order/refund', '{\"order_id\":\"4\",\"uid\":\"1\",\"user_remark\":\"\\u4e0d\\u60f3\\u8981\\u4e86\"}', '订单已完成，不可退货！', '127.0.0.1', '1584605260');
INSERT INTO `xy_api_log` VALUES ('74', 'post', 'Order/refund', '{\"order_id\":\"4\",\"uid\":\"1\",\"user_remark\":\"\\u4e0d\\u60f3\\u8981\\u4e86\"}', '订单在退货中或已完成！', '127.0.0.1', '1584605282');
INSERT INTO `xy_api_log` VALUES ('75', 'post', 'Order/refund', '{\"order_id\":\"5\",\"uid\":\"1\",\"user_remark\":\"\\u4e0d\\u60f3\\u8981\\u4e86\"}', '退货申请成功！，返回数据：[]', '127.0.0.1', '1584605295');
INSERT INTO `xy_api_log` VALUES ('76', 'post', 'Order/pay', '{\"goods_id\":\"2\",\"uid\":\"3\",\"goods_count\":\"2\",\"price\":\"2.5\",\"address\":\"sdskdfjkasfhlkd\",\"phone\":\"1152622362626\"}', '下单成功！，返回数据：{\"uid\":3,\"orderno\":\"320031906127245826\",\"goods_id\":2,\"goods_count\":2,\"order_price\":2.5,\"order_addtime\":\"2020-03-19 16:22:07\",\"order_status\":1,\"order_address\":\"sdskdfjkasfhlkd\",\"order_phone\":\"1152622362626\"}', '127.0.0.1', '1584606127');
INSERT INTO `xy_api_log` VALUES ('77', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"3\",\"goods_count\":\"2\",\"price\":\"1.5\",\"address\":\"\\u53a6\\u95e8\\u6e56\\u91cc\",\"phone\":\"1152622362626\"}', '购买数量大于库存！', '127.0.0.1', '1584606192');
INSERT INTO `xy_api_log` VALUES ('78', 'post', 'Order/pay', '{\"goods_id\":\"3\",\"uid\":\"3\",\"goods_count\":\"1\",\"price\":\"1.5\",\"address\":\"\\u53a6\\u95e8\\u6e56\\u91cc\",\"phone\":\"1152622362626\"}', '下单成功！，返回数据：{\"uid\":3,\"orderno\":\"320031906198659393\",\"goods_id\":3,\"goods_count\":1,\"order_price\":1.5,\"order_addtime\":\"2020-03-19 16:23:18\",\"order_status\":1,\"order_address\":\"\\u53a6\\u95e8\\u6e56\\u91cc\",\"order_phone\":\"1152622362626\"}', '127.0.0.1', '1584606198');
INSERT INTO `xy_api_log` VALUES ('79', 'post', 'Order/pay', '{\"goods_id\":\"1\",\"uid\":\"3\",\"goods_count\":\"1\",\"price\":\"5\",\"address\":\"\\u53a6\\u95e8\\u6e56\\u91cc\",\"phone\":\"1152622362626\"}', '下单成功！，返回数据：{\"uid\":3,\"orderno\":\"320031906220431122\",\"goods_id\":1,\"goods_count\":1,\"order_price\":5,\"order_addtime\":\"2020-03-19 16:23:40\",\"order_status\":1,\"order_address\":\"\\u53a6\\u95e8\\u6e56\\u91cc\",\"order_phone\":\"1152622362626\"}', '127.0.0.1', '1584606220');
INSERT INTO `xy_api_log` VALUES ('80', 'post', 'Order/pay', '{\"goods_id\":\"1\",\"uid\":\"3\",\"goods_count\":\"1\",\"price\":\"5\",\"address\":\"\\u53a6\\u95e8\\u6e56\\u91cc\",\"phone\":\"1152622362626\"}', '下单成功！，返回数据：{\"uid\":3,\"orderno\":\"320031910464459730\",\"goods_id\":1,\"goods_count\":1,\"order_price\":5,\"order_addtime\":\"2020-03-19 17:34:24\",\"order_status\":1,\"order_address\":\"\\u53a6\\u95e8\\u6e56\\u91cc\",\"order_phone\":\"1152622362626\"}', '127.0.0.1', '1584610464');
INSERT INTO `xy_api_log` VALUES ('81', 'post', 'Order/pay', '{\"goods_id\":\"1\",\"uid\":\"3\",\"goods_count\":\"1\",\"price\":\"5\",\"address\":\"\\u53a6\\u95e8\\u6e56\\u91cc\",\"phone\":\"1152622362626\"}', '', '127.0.0.1', '1584667106');
INSERT INTO `xy_api_log` VALUES ('82', 'post', 'Order/pay', '{\"goods_id\":\"1\",\"uid\":\"3\",\"goods_count\":\"1\",\"price\":\"5\",\"address\":\"\\u53a6\\u95e8\\u6e56\\u91cc\",\"phone\":\"1152622362626\"}', '下单成功！，返回数据：{\"uid\":3,\"orderno\":\"320032067130279949\",\"goods_id\":1,\"goods_count\":1,\"order_price\":5,\"order_addtime\":\"2020-03-20 09:18:50\",\"order_status\":1,\"order_address\":\"\\u53a6\\u95e8\\u6e56\\u91cc\",\"order_phone\":\"1152622362626\"}', '127.0.0.1', '1584667130');
INSERT INTO `xy_api_log` VALUES ('83', 'post', 'Order/pay', '{\"goods_id\":\"1\",\"uid\":\"3\",\"goods_count\":\"1\",\"price\":\"2\",\"address\":\"\\u53a6\\u95e8\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6e56\\u91cc\",\"phone\":\"1152622362626\"}', '下单成功！，返回数据：{\"uid\":3,\"orderno\":\"320032067260059593\",\"goods_id\":1,\"goods_count\":1,\"order_price\":2,\"order_addtime\":\"2020-03-20 09:21:00\",\"order_status\":1,\"order_address\":\"\\u53a6\\u95e8\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6e56\\u91cc\",\"order_phone\":\"1152622362626\"}', '127.0.0.1', '1584667260');

-- ----------------------------
-- Table structure for xy_exp_log
-- ----------------------------
DROP TABLE IF EXISTS `xy_exp_log`;
CREATE TABLE `xy_exp_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL COMMENT '操作者',
  `admin_surename` varchar(255) DEFAULT NULL COMMENT '操作者名称',
  `exp_desc` longtext COMMENT '异常记录',
  `exp_url` longtext COMMENT '异常链接',
  `userip` varchar(20) DEFAULT NULL COMMENT '用户ip',
  `addtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='程序异常日记';

-- ----------------------------
-- Records of xy_exp_log
-- ----------------------------
INSERT INTO `xy_exp_log` VALUES ('1', '1', 'lwy', '会员添加，原数据：[]，新数据：{\"user_username\":\"zhangsan\",\"user_surename\":\"\\u5f20\\u4e09\",\"user_password\":\"369713322b787642b695fae54c716809\",\"user_phone\":\"1452222263\",\"user_address\":\"\\u53a6\\u95e8\\u5e02\\u6e56\\u91cc\\u533a\\u83dc\\u6c64\",\"user_level\":\"1\",\"user_status\":1,\"user_regtime\":1584515377}<br />fields not exists:[user_username]，文件：D:\\phpStudy\\PHPTutorial\\WWW\\lwy\\thinkphp\\library\\think\\db\\Builder.php，错误位置：138', 'User/edit', '127.0.0.1', '1584515377');
INSERT INTO `xy_exp_log` VALUES ('2', '0', null, '用户账号zhangsan，购买商品踩踩踩踩踩，总价：6.5<br />fields not exists:[gooods_count]，文件：D:\\phpStudy\\PHPTutorial\\WWW\\lwy\\thinkphp\\library\\think\\db\\Builder.php，错误位置：138', 'Order/pay', '127.0.0.1', '1584586608');
INSERT INTO `xy_exp_log` VALUES ('3', '0', null, '用户账号zhangsan，购买商品踩踩踩踩踩，总价：6.5<br />fields not exists:[gooods_count]，文件：D:\\phpStudy\\PHPTutorial\\WWW\\lwy\\thinkphp\\library\\think\\db\\Builder.php，错误位置：138', 'Order/pay', '127.0.0.1', '1584586656');
INSERT INTO `xy_exp_log` VALUES ('4', '0', null, '用户账号zhangsan，购买商品踩踩踩踩踩，总价：6.5<br />fields not exists:[gooods_count]，文件：D:\\phpStudy\\PHPTutorial\\WWW\\lwy\\thinkphp\\library\\think\\db\\Builder.php，错误位置：138', 'Order/pay', '127.0.0.1', '1584586791');
INSERT INTO `xy_exp_log` VALUES ('5', '0', null, '用户账号zhangsan，购买商品踩踩踩踩踩，总价：6.5<br />fields not exists:[gooods_count]，文件：D:\\phpStudy\\PHPTutorial\\WWW\\lwy\\thinkphp\\library\\think\\db\\Builder.php，错误位置：138', 'Order/pay', '127.0.0.1', '1584586803');
INSERT INTO `xy_exp_log` VALUES ('6', '0', null, '用户账号zhangsan，购买商品踩踩踩踩踩，总价：6.5<br />fields not exists:[gooods_count]，文件：D:\\phpStudy\\PHPTutorial\\WWW\\lwy\\thinkphp\\library\\think\\db\\Builder.php，错误位置：138', 'Order/pay', '127.0.0.1', '1584586811');
INSERT INTO `xy_exp_log` VALUES ('7', '0', null, '用户账号zhangsan，购买商品踩踩踩踩踩，总价：6.5<br />fields not exists:[gooods_count]，文件：D:\\phpStudy\\PHPTutorial\\WWW\\lwy\\thinkphp\\library\\think\\db\\Builder.php，错误位置：138', 'Order/pay', '127.0.0.1', '1584587083');
INSERT INTO `xy_exp_log` VALUES ('8', '0', null, '用户账号zhangsan，购买商品踩踩踩踩踩，总价：6.5<br />fields not exists:[gooods_count]，文件：D:\\phpStudy\\PHPTutorial\\WWW\\lwy\\thinkphp\\library\\think\\db\\Builder.php，错误位置：138', 'Order/pay', '127.0.0.1', '1584587242');
INSERT INTO `xy_exp_log` VALUES ('9', '0', null, '用户账号zhangsan，购买商品踩踩踩踩踩，总价：6.5<br />fields not exists:[gooods_count]，文件：D:\\phpStudy\\PHPTutorial\\WWW\\lwy\\thinkphp\\library\\think\\db\\Builder.php，错误位置：138', 'Order/pay', '127.0.0.1', '1584587357');
INSERT INTO `xy_exp_log` VALUES ('10', '0', null, '用户账号zhangsan，购买商品踩踩踩踩踩，总价：6.5<br />fields not exists:[gooods_count]，文件：D:\\phpStudy\\PHPTutorial\\WWW\\lwy\\thinkphp\\library\\think\\db\\Builder.php，错误位置：138', 'Order/pay', '127.0.0.1', '1584587409');
INSERT INTO `xy_exp_log` VALUES ('11', '0', null, '用户账号zhangsan，购买商品踩踩踩踩踩，总价：6.5<br />fields not exists:[gooods_count]，文件：D:\\phpStudy\\PHPTutorial\\WWW\\lwy\\thinkphp\\library\\think\\db\\Builder.php，错误位置：138', 'Order/pay', '127.0.0.1', '1584587439');
INSERT INTO `xy_exp_log` VALUES ('12', '0', null, '用户账号zhangsan，购买商品踩踩踩踩踩，总价：6.5<br />fields not exists:[gooods_count]，文件：D:\\phpStudy\\PHPTutorial\\WWW\\lwy\\thinkphp\\library\\think\\db\\Builder.php，错误位置：138', 'Order/pay', '127.0.0.1', '1584587458');
INSERT INTO `xy_exp_log` VALUES ('13', '0', null, '用户账号zhangsan，购买商品踩踩踩踩踩，总价：6.5<br />fields not exists:[gooods_count]，文件：D:\\phpStudy\\PHPTutorial\\WWW\\lwy\\thinkphp\\library\\think\\db\\Builder.php，错误位置：138', 'Order/pay', '127.0.0.1', '1584588036');
INSERT INTO `xy_exp_log` VALUES ('14', '0', null, '用户账号zhangsan，购买商品踩踩踩踩踩，总价：6.5<br />fields not exists:[gooods_count]，文件：D:\\phpStudy\\PHPTutorial\\WWW\\lwy\\thinkphp\\library\\think\\db\\Builder.php，错误位置：138', 'Order/pay', '127.0.0.1', '1584588378');
INSERT INTO `xy_exp_log` VALUES ('15', '0', null, '用户账号zhangsan，购买商品踩踩踩踩踩，总价：6.5<br />SQLSTATE[42S02]: Base table or view not found: 1146 Table \'xianyu.user\' doesn\'t exist，文件：D:\\phpStudy\\PHPTutorial\\WWW\\lwy\\thinkphp\\library\\think\\db\\Connection.php，错误位置：687', 'Order/pay', '127.0.0.1', '1584588461');
INSERT INTO `xy_exp_log` VALUES ('16', '0', null, '用户账号zhangsan，购买商品踩踩踩踩踩，总价：6.5<br />SQLSTATE[42S02]: Base table or view not found: 1146 Table \'xianyu.user\' doesn\'t exist，文件：D:\\phpStudy\\PHPTutorial\\WWW\\lwy\\thinkphp\\library\\think\\db\\Connection.php，错误位置：687', 'Order/pay', '127.0.0.1', '1584588489');
INSERT INTO `xy_exp_log` VALUES ('17', '1', 'lwy', '订单退货审核，原数据：{\"id\":17,\"uid\":3,\"orderno\":\"320031906220431122\",\"order_user_remark\":null,\"goods_count\":1,\"order_address\":\"\\u53a6\\u95e8\\u6e56\\u91cc\",\"order_phone\":\"1152622362626\",\"order_price\":\"5.00\",\"order_addtime\":1584606220,\"order_status\":4,\"goods_name\":\"\\u6797\\u674e\\u5927\\u6218\",\"user_username\":\"zhangliu\",\"user_surename\":\"\\u957f\\u8001\",\"score\":\"191.00\"}，新数据：{\"order_stastus\":\"5\",\"order_remark\":\"\\u800c\\u975e\\u8303\\u5fb7\\u8428\\u8303\\u5fb7\\u8428\\u53d1\\u5927\\u6c34\\u53d1\\u5c04\\u70b9\"}<br />fields not exists:[order_stastus]，文件：D:\\phpStudy\\PHPTutorial\\WWW\\lwy\\thinkphp\\library\\think\\db\\Builder.php，错误位置：138', 'Order/refund', '127.0.0.1', '1584606779');

-- ----------------------------
-- Table structure for xy_file
-- ----------------------------
DROP TABLE IF EXISTS `xy_file`;
CREATE TABLE `xy_file` (
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
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='上传文件表';

-- ----------------------------
-- Records of xy_file
-- ----------------------------
INSERT INTO `xy_file` VALUES ('1', 'timg.jfif', '5e7072663d869.jfif', '41149', 'jfif', 'upload/index/image/202003/', 'upload/index/image/202003/5e7072663d869.jfif', '/upload/index/image/202003/5e7072663d869.jfif', '1584427622', null, '2');
INSERT INTO `xy_file` VALUES ('2', 'test.jpg', '5e70727e9636a.jpg', '22244', 'jpg', 'upload/index/image/202003/', 'upload/index/image/202003/5e70727e9636a.jpg', '/upload/index/image/202003/5e70727e9636a.jpg', '1584427646', null, '2');
INSERT INTO `xy_file` VALUES ('3', 'logo.jpg', '5e707cd23ccbc.jpg', '10326', 'jpg', 'upload/index/image/202003/', 'upload/index/image/202003/5e707cd23ccbc.jpg', '/upload/index/image/202003/5e707cd23ccbc.jpg', '1584430290', null, '2');
INSERT INTO `xy_file` VALUES ('4', 'logo.jpg', '5e707d4761339.jpg', '10326', 'jpg', 'upload/index/image/202003/', 'upload/index/image/202003/5e707d4761339.jpg', '/upload/index/image/202003/5e707d4761339.jpg', '1584430407', null, '2');
INSERT INTO `xy_file` VALUES ('5', 'logo.jpg', '5e707d9e59065.jpg', '10326', 'jpg', 'upload/index/image/202003/', 'upload/index/image/202003/5e707d9e59065.jpg', '/upload/index/image/202003/5e707d9e59065.jpg', '1584430494', null, '2');
INSERT INTO `xy_file` VALUES ('6', 'logo.jpg', '5e707f8a5617b.jpg', '10326', 'jpg', 'upload/index/image/202003/', 'upload/index/image/202003/5e707f8a5617b.jpg', '/upload/index/image/202003/5e707f8a5617b.jpg', '1584430986', null, '2');
INSERT INTO `xy_file` VALUES ('7', 'test.jpg', '5e707f943d610.jpg', '22244', 'jpg', 'upload/index/image/202003/', 'upload/index/image/202003/5e707f943d610.jpg', '/upload/index/image/202003/5e707f943d610.jpg', '1584430996', null, '2');
INSERT INTO `xy_file` VALUES ('8', 'timg.jfif', '5e707f96e7b1b.jfif', '41149', 'jfif', 'upload/index/image/202003/', 'upload/index/image/202003/5e707f96e7b1b.jfif', '/upload/index/image/202003/5e707f96e7b1b.jfif', '1584430998', null, '2');
INSERT INTO `xy_file` VALUES ('9', 'test.jpg', '5e707fac2f7a6.jpg', '22244', 'jpg', 'upload/index/image/202003/', 'upload/index/image/202003/5e707fac2f7a6.jpg', '/upload/index/image/202003/5e707fac2f7a6.jpg', '1584431020', null, '2');
INSERT INTO `xy_file` VALUES ('10', 'test.jpg', '5e707fbb3d4fb.jpg', '22244', 'jpg', 'upload/index/image/202003/', 'upload/index/image/202003/5e707fbb3d4fb.jpg', '/upload/index/image/202003/5e707fbb3d4fb.jpg', '1584431035', null, '2');
INSERT INTO `xy_file` VALUES ('11', 'timg.jfif', '5e7080e87d4b4.jfif', '41149', 'jfif', 'upload/index/image/202003/', 'upload/index/image/202003/5e7080e87d4b4.jfif', '/upload/index/image/202003/5e7080e87d4b4.jfif', '1584431336', null, '2');
INSERT INTO `xy_file` VALUES ('12', 'timg.jfif', '5e7080eff415e.jfif', '41149', 'jfif', 'upload/index/image/202003/', 'upload/index/image/202003/5e7080eff415e.jfif', '/upload/index/image/202003/5e7080eff415e.jfif', '1584431344', null, '2');
INSERT INTO `xy_file` VALUES ('13', 'test.jpg', '5e718f61baed5.jpg', '22244', 'jpg', 'upload/index/image/202003/', 'upload/index/image/202003/5e718f61baed5.jpg', '/upload/index/image/202003/5e718f61baed5.jpg', '1584500577', null, '2');
INSERT INTO `xy_file` VALUES ('14', 'test.jpg', '5e718f6f0e035.jpg', '22244', 'jpg', 'upload/index/image/202003/', 'upload/index/image/202003/5e718f6f0e035.jpg', '/upload/index/image/202003/5e718f6f0e035.jpg', '1584500591', null, '2');
INSERT INTO `xy_file` VALUES ('15', 'test.jpg', '5e71967af12f0.jpg', '22244', 'jpg', 'upload/index/image/202003/', 'upload/index/image/202003/5e71967af12f0.jpg', '/upload/index/image/202003/5e71967af12f0.jpg', '1584502394', null, '2');
INSERT INTO `xy_file` VALUES ('16', 'timg.jfif', '5e7196f17322d.jfif', '41149', 'jfif', 'upload/index/image/202003/', 'upload/index/image/202003/5e7196f17322d.jfif', '/upload/index/image/202003/5e7196f17322d.jfif', '1584502513', null, '2');
INSERT INTO `xy_file` VALUES ('17', 'test.jpg', '5e7196f49bbf7.jpg', '22244', 'jpg', 'upload/index/image/202003/', 'upload/index/image/202003/5e7196f49bbf7.jpg', '/upload/index/image/202003/5e7196f49bbf7.jpg', '1584502516', null, '2');
INSERT INTO `xy_file` VALUES ('18', 'test.jpg', '5e74175b66e9c.jpg', '22244', 'jpg', 'upload/index/image/202003/', 'upload/index/image/202003/5e74175b66e9c.jpg', '/upload/index/image/202003/5e74175b66e9c.jpg', '1584666459', null, '2');
INSERT INTO `xy_file` VALUES ('19', 'test.jpg', '5e741c03ec611.jpg', '22244', 'jpg', 'upload/index/image/202003/', 'upload/index/image/202003/5e741c03ec611.jpg', '/upload/index/image/202003/5e741c03ec611.jpg', '1584667651', null, '2');
INSERT INTO `xy_file` VALUES ('20', 'test.jpg', '5e741d3a6c96c.jpg', '22244', 'jpg', 'upload/index/image/202003/', 'upload/index/image/202003/5e741d3a6c96c.jpg', '/upload/index/image/202003/5e741d3a6c96c.jpg', '1584667962', null, '2');
INSERT INTO `xy_file` VALUES ('21', 'test.jpg', '5e741d661506f.jpg', '22244', 'jpg', 'upload/index/image/202003/', 'upload/index/image/202003/5e741d661506f.jpg', '/upload/index/image/202003/5e741d661506f.jpg', '1584668006', null, '2');
INSERT INTO `xy_file` VALUES ('22', 'test.jpg', '5e741e50a0c8e.jpg', '22244', 'jpg', 'upload/index/image/202003/', 'upload/index/image/202003/5e741e50a0c8e.jpg', '/upload/index/image/202003/5e741e50a0c8e.jpg', '1584668240', null, '2');
INSERT INTO `xy_file` VALUES ('23', 'test.jpg', '5e74200542019.jpg', '22244', 'jpg', 'upload/index/image/202003/', 'upload/index/image/202003/5e74200542019.jpg', '/upload/index/image/202003/5e74200542019.jpg', '1584668677', null, '2');
INSERT INTO `xy_file` VALUES ('24', 'test.jpg', '5e74201a1b44e.jpg', '22244', 'jpg', 'upload/index/image/202003/', 'upload/index/image/202003/5e74201a1b44e.jpg', '/upload/index/image/202003/5e74201a1b44e.jpg', '1584668698', null, '2');
INSERT INTO `xy_file` VALUES ('25', 'test.jpg', '5e74217c43cc4.jpg', '22244', 'jpg', 'upload/index/image/202003/', 'upload/index/image/202003/5e74217c43cc4.jpg', '/upload/index/image/202003/5e74217c43cc4.jpg', '1584669052', null, '2');

-- ----------------------------
-- Table structure for xy_goods
-- ----------------------------
DROP TABLE IF EXISTS `xy_goods`;
CREATE TABLE `xy_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `gt_id` int(11) DEFAULT NULL COMMENT '商品分类id',
  `goods_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品价格',
  `goods_count` int(11) DEFAULT '0' COMMENT '商品数量',
  `goods_img` text COMMENT '商品图片',
  `is_grounding` enum('1','2') DEFAULT '1' COMMENT '是否上架 1上架 2下架',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  `is_delete` enum('2','1') DEFAULT '1' COMMENT '1正常  2删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='商品列表';

-- ----------------------------
-- Records of xy_goods
-- ----------------------------
INSERT INTO `xy_goods` VALUES ('1', '2', '林李大战', '5.50', '89', '2,5', '1', '1584430496', '1');
INSERT INTO `xy_goods` VALUES ('2', '1', 'Nnnn', '5.50', '80', '6,7', '1', '1584431004', '1');
INSERT INTO `xy_goods` VALUES ('3', '3', '踩踩踩踩踩', '3.25', '0', '9', '1', '1584436495', '1');
INSERT INTO `xy_goods` VALUES ('4', '5', '杀杀杀', '100.99', '11', '10', '2', '1584436486', '1');

-- ----------------------------
-- Table structure for xy_goods_type
-- ----------------------------
DROP TABLE IF EXISTS `xy_goods_type`;
CREATE TABLE `xy_goods_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gt_name` varchar(100) DEFAULT NULL COMMENT '商品分类名称',
  `is_delete` enum('2','1') DEFAULT '1' COMMENT '是否已删除 1正常 2删除',
  `addtime` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='商品分类';

-- ----------------------------
-- Records of xy_goods_type
-- ----------------------------
INSERT INTO `xy_goods_type` VALUES ('1', '足球', '1', '1584424368');
INSERT INTO `xy_goods_type` VALUES ('2', '羽毛球', '1', '1584424368');
INSERT INTO `xy_goods_type` VALUES ('3', '篮球', '1', '1584424368');
INSERT INTO `xy_goods_type` VALUES ('4', '王者荣耀', '2', '1584424368');
INSERT INTO `xy_goods_type` VALUES ('5', '地下城', '1', '1584424368');
INSERT INTO `xy_goods_type` VALUES ('6', 'qq飞车', '2', '1584432311');
INSERT INTO `xy_goods_type` VALUES ('7', '泡泡试试啊啊', '2', '1584432526');

-- ----------------------------
-- Table structure for xy_group
-- ----------------------------
DROP TABLE IF EXISTS `xy_group`;
CREATE TABLE `xy_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(50) DEFAULT NULL COMMENT '用户组名称',
  `group_type` tinyint(1) DEFAULT '1' COMMENT '类型 1管理员 2超级管理员',
  `group_resources` text COMMENT '可操作权限列表',
  `group_status` enum('2','1') DEFAULT '1' COMMENT '1正常 2禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权限组表';

-- ----------------------------
-- Records of xy_group
-- ----------------------------
INSERT INTO `xy_group` VALUES ('1', '超级管理员', '2', null, '1');
INSERT INTO `xy_group` VALUES ('2', '角色1', '1', '[\"goods_glist\",\"goods_g_edit\",\"group_index\",\"log_my\"]', '1');
INSERT INTO `xy_group` VALUES ('3', '角色2', '1', '[\"goods_glist\",\"goods_set_switch\",\"goods_gtype\",\"goods_gt_delete\"]', '1');
INSERT INTO `xy_group` VALUES ('4', '角色3', '1', '[\"index_index\",\"newstatistics_index\",\"newstatistics_export\",\"newstatistics_export_csv\",\"index_index\",\"client_index\"]', '1');

-- ----------------------------
-- Table structure for xy_log
-- ----------------------------
DROP TABLE IF EXISTS `xy_log`;
CREATE TABLE `xy_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '登陆id',
  `log_http_type` enum('post','get','api','ajax') DEFAULT 'get' COMMENT '请求方式',
  `log_module_name` varchar(30) DEFAULT NULL COMMENT '操作所在的控制器名',
  `log_action_name` varchar(30) DEFAULT NULL COMMENT 'Action名称',
  `log_content` text COMMENT '操作内容',
  `log_action_user` varchar(20) DEFAULT NULL COMMENT '操作者',
  `log_action_url` varchar(255) DEFAULT NULL COMMENT '对应操作的资源链接地址',
  `log_action_time` int(11) DEFAULT NULL COMMENT '操作时间',
  `log_action_ip` varchar(25) DEFAULT NULL COMMENT '操作所在IP地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=940 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日志表';

-- ----------------------------
-- Records of xy_log
-- ----------------------------
INSERT INTO `xy_log` VALUES ('1', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('2', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('3', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('4', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('5', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('6', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('7', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('8', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('9', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('10', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('11', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('12', '1', 'get', 'Index', 'index', '点击位置 进入首页', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('13', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('14', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('15', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('16', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('17', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('18', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('19', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('20', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('21', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('22', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('23', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('24', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('25', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('26', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('27', '1', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数[]', 'lwy', '/index.php', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('28', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('29', '1', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数[]', 'lwy', '/index.php/index/goods/g_edit.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('30', '1', 'ajax', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"gt_id\":\"2\",\"goods_name\":\"\\u6797\\u674e\\u5927\\u6218\",\"goods_count\":\"100\",\"goods_img\":\"2\",\"is_delete\":\"1\"}', 'lwy', '/index.php/index/goods/g_edit.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('31', '1', 'ajax', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"gt_id\":\"2\",\"goods_name\":\"\\u6797\\u674e\\u5927\\u6218\",\"goods_count\":\"100\",\"goods_img\":\"2\",\"is_delete\":\"1\"}', 'lwy', '/index.php/index/goods/g_edit.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('32', '1', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数[]', 'lwy', '/index.php/index/goods/g_edit.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('33', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('34', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('35', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('36', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('37', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('38', '1', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"id\":\"1\"}', 'lwy', '/index.php/index/goods/g_edit/id/1.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('39', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('40', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('41', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('42', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('43', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('44', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('45', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('46', '1', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"id\":\"1\"}', 'lwy', '/index.php/index/goods/g_edit/id/1.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('47', '1', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"id\":\"1\"}', 'lwy', '/index.php/index/goods/g_edit/id/1.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('48', '1', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"id\":\"1\"}', 'lwy', '/index.php/index/goods/g_edit/id/1.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('49', '1', 'ajax', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"gt_id\":\"2\",\"goods_name\":\"\\u6797\\u674e\\u5927\\u6218\",\"goods_count\":\"100\",\"goods_img\":\"2,4\",\"is_grounding\":\"1\",\"id\":\"1\"}', 'lwy', '/index.php/index/goods/g_edit/id/1.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('50', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('51', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('52', '1', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"id\":\"1\"}', 'lwy', '/index.php/index/goods/g_edit/id/1.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('53', '1', 'ajax', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"gt_id\":\"2\",\"goods_name\":\"\\u6797\\u674e\\u5927\\u6218\",\"goods_count\":\"100\",\"goods_img\":\"2,5\",\"is_grounding\":\"1\",\"id\":\"1\"}', 'lwy', '/index.php/index/goods/g_edit/id/1.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('54', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('55', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('56', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('57', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('58', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('59', '1', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数[]', 'lwy', '/index.php/index/goods/g_edit.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('60', '1', 'ajax', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"gt_id\":\"1\",\"goods_name\":\"Nnnn\",\"goods_count\":\"90\",\"goods_img\":\"6,7\",\"is_grounding\":\"0\"}', 'lwy', '/index.php/index/goods/g_edit.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('61', '1', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数[]', 'lwy', '/index.php/index/goods/g_edit.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('62', '1', 'ajax', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"gt_id\":\"3\",\"goods_name\":\"\\u8e29\\u8e29\\u8e29\\u8e29\\u8e29\",\"goods_count\":\"11\",\"goods_img\":\"9\",\"is_grounding\":\"0\"}', 'lwy', '/index.php/index/goods/g_edit.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('63', '1', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数[]', 'lwy', '/index.php/index/goods/g_edit.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('64', '1', 'ajax', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"gt_id\":\"5\",\"goods_name\":\"\\u6740\\u6740\\u6740\",\"goods_count\":\"11\",\"goods_img\":\"10\",\"is_grounding\":\"1\"}', 'lwy', '/index.php/index/goods/g_edit.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('65', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('66', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('67', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('68', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('69', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('70', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('71', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('72', '1', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/goods/g_edit/id/4.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('73', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('74', '1', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/goods/g_edit/id/4.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('75', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php/index/goods/gtype.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('76', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php/index/goods/gtype.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('77', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('78', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php/index/goods/gtype.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('79', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数{\"gt_name\":\"\\u4e0b\"}', 'lwy', '/index.php/index/goods/gtype.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('80', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数{\"gt_name\":\"\\u4e0b\"}', 'lwy', '/index.php/index/goods/gtype.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('81', '1', 'get', 'Goods', 'gt_edit', '点击位置 商品分类编辑，相关参数[]', 'lwy', '/index.php/index/goods/gt_edit.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('82', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数{\"gt_name\":\"\\u4e0b\"}', 'lwy', '/index.php/index/goods/gtype.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('83', '1', 'get', 'Goods', 'gt_edit', '点击位置 商品分类编辑，相关参数{\"id\":\"5\"}', 'lwy', '/index.php/index/goods/gt_edit/id/5.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('84', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数{\"gt_name\":\"\\u4e0b\"}', 'lwy', '/index.php/index/goods/gtype.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('85', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数{\"gt_name\":\"\\u4e0b\"}', 'lwy', '/index.php/index/goods/gtype.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('86', '1', 'get', 'Goods', 'gt_edit', '点击位置 商品分类编辑，相关参数[]', 'lwy', '/index.php/index/goods/gt_edit.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('87', '1', 'ajax', 'Goods', 'gt_edit', '点击位置 商品分类编辑，相关参数{\"gt_name\":\"qq\\u98de\\u8f66\"}', 'lwy', '/index.php/index/goods/gt_edit.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('88', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('89', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('90', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php/index/goods/gtype.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('91', '1', 'get', 'Goods', 'gt_edit', '点击位置 商品分类编辑，相关参数[]', 'lwy', '/index.php/index/goods/gt_edit.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('92', '1', 'ajax', 'Goods', 'gt_edit', '点击位置 商品分类编辑，相关参数{\"gt_name\":\"\\u6ce1\\u6ce1\"}', 'lwy', '/index.php/index/goods/gt_edit.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('93', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php/index/goods/gtype.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('94', '1', 'get', 'Goods', 'gt_edit', '点击位置 商品分类编辑，相关参数{\"id\":\"7\"}', 'lwy', '/index.php/index/goods/gt_edit/id/7.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('95', '1', 'ajax', 'Goods', 'gt_edit', '点击位置 商品分类编辑，相关参数{\"gt_name\":\"\\u6ce1\\u6ce1\\u8bd5\\u8bd5\",\"id\":\"7\"}', 'lwy', '/index.php/index/goods/gt_edit/id/7.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('96', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php/index/goods/gtype.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('97', '1', 'get', 'Goods', 'gt_edit', '点击位置 商品分类编辑，相关参数{\"id\":\"7\"}', 'lwy', '/index.php/index/goods/gt_edit/id/7.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('98', '1', 'ajax', 'Goods', 'gt_edit', '点击位置 商品分类编辑，相关参数{\"gt_name\":\"\\u6ce1\\u6ce1\\u8bd5\\u8bd5\\u554a\\u554a\",\"id\":\"7\"}', 'lwy', '/index.php/index/goods/gt_edit/id/7.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('99', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php/index/goods/gtype.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('100', '1', 'get', 'Goods', 'gt_delete', '点击位置 商品分类删除，相关参数{\"id\":\"7\"}', 'lwy', '/index.php/index/goods/gt_delete/id/7.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('101', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php/index/goods/gtype.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('102', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('103', '1', 'get', 'Goods', 'g_delete', '点击位置 商品删除，相关参数{\"id\":\"3\"}', 'lwy', '/index.php/index/goods/g_delete/id/3.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('104', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('105', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('106', '1', 'get', 'Goods', 'g_delete', '点击位置 商品删除，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/goods/g_delete/id/4.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('107', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('108', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('109', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('110', '1', 'get', 'Goods', 'g_delete', '点击位置 商品删除，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/goods/g_delete/id/2.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('111', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('112', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('113', '1', 'ajax', 'Goods', 'g_delete', '点击位置 商品删除，相关参数{\"id\":\"1\"}', 'lwy', '/index.php/index/goods/g_delete/id/1.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('114', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('115', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('116', '1', 'ajax', 'Goods', 'g_delete', '点击位置 商品删除，相关参数{\"id\":\"1\"}', 'lwy', '/index.php/index/goods/g_delete/id/1.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('117', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('118', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('119', '1', 'ajax', 'Goods', 'g_delete', '点击位置 商品删除，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/goods/g_delete/id/2.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('120', '1', 'ajax', 'Goods', 'g_delete', '点击位置 商品删除，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/goods/g_delete/id/2.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('121', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('122', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('123', '1', 'ajax', 'Goods', 'g_delete', '点击位置 商品删除，相关参数{\"id\":\"3\"}', 'lwy', '/index.php/index/goods/g_delete/id/3.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('124', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('125', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('126', '1', 'get', 'Goods', 'g_delete', '点击位置 商品删除，相关参数{\"id\":\"1\"}', 'lwy', '/index.php/index/goods/g_delete/id/1.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('127', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('128', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('129', '1', 'ajax', 'Goods', 'g_delete', '点击位置 商品删除，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/goods/g_delete/id/2.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('130', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('131', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('132', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php/index/goods/gtype.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('133', '1', 'ajax', 'Goods', 'gt_delete', '点击位置 商品分类删除，相关参数{\"id\":\"6\"}', 'lwy', '/index.php/index/goods/gt_delete/id/6.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('134', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php/index/goods/gtype.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('135', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php/index/goods/gtype.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('136', '1', 'ajax', 'Goods', 'gt_delete', '点击位置 商品分类删除，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/goods/gt_delete/id/4.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('137', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php/index/goods/gtype.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('138', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('139', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('140', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('141', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('142', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('143', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('144', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('145', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('146', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('147', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('148', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('149', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('150', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('151', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('152', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('153', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('154', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('155', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('156', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('157', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('158', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('159', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('160', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('161', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('162', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('163', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584436290', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('164', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584436363', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('165', '1', 'get', 'Group', 'add', '点击位置 创建角色组，相关参数[]', 'lwy', '/index.php/index/group/add.html', '1584436369', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('166', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584436373', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('167', '1', 'get', 'Group', 'edit', '点击位置 修改角色组，相关参数{\"id\":\"6\"}', 'lwy', '/index.php/index/group/edit/id/6.html', '1584436375', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('168', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584436376', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('169', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584436383', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('170', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436385', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('171', '1', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/goods/g_edit/id/4.html', '1584436449', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('172', '1', 'ajax', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"gt_id\":\"5\",\"goods_name\":\"\\u6740\\u6740\\u6740\",\"goods_count\":\"11\",\"goods_price\":\"100.992\",\"goods_img\":\"10\",\"is_grounding\":\"0\",\"id\":\"4\"}', 'lwy', '/index.php/index/goods/g_edit/id/4.html', '1584436454', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('173', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584436457', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('174', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436459', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('175', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436471', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('176', '1', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/goods/g_edit/id/4.html', '1584436475', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('177', '1', 'ajax', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"gt_id\":\"5\",\"goods_name\":\"\\u6740\\u6740\\u6740\",\"goods_count\":\"11\",\"goods_price\":\"100.99\",\"goods_img\":\"10\",\"is_grounding\":\"0\",\"id\":\"4\"}', 'lwy', '/index.php/index/goods/g_edit/id/4.html', '1584436478', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('178', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436480', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('179', '1', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/goods/g_edit/id/4.html', '1584436483', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('180', '1', 'ajax', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"gt_id\":\"5\",\"goods_name\":\"\\u6740\\u6740\\u6740\",\"goods_count\":\"11\",\"goods_price\":\"100.991\",\"goods_img\":\"10\",\"is_grounding\":\"0\",\"id\":\"4\"}', 'lwy', '/index.php/index/goods/g_edit/id/4.html', '1584436486', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('181', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436488', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('182', '1', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"id\":\"3\"}', 'lwy', '/index.php/index/goods/g_edit/id/3.html', '1584436491', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('183', '1', 'ajax', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"gt_id\":\"3\",\"goods_name\":\"\\u8e29\\u8e29\\u8e29\\u8e29\\u8e29\",\"goods_count\":\"11\",\"goods_price\":\"3.25\",\"goods_img\":\"9\",\"is_grounding\":\"1\",\"id\":\"3\"}', 'lwy', '/index.php/index/goods/g_edit/id/3.html', '1584436495', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('184', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584436498', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('185', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584436573', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('186', '1', 'get', 'Group', 'add', '点击位置 创建角色组，相关参数[]', 'lwy', '/index.php/index/group/add.html', '1584436574', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('187', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584436576', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('188', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584436588', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('189', '1', 'get', 'Group', 'delete', '点击位置 删除角色组，相关参数{\"id\":\"6\"}', 'lwy', '/index.php/index/group/delete/id/6.html', '1584436590', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('190', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584436591', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('191', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584436909', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('192', '1', 'get', 'Group', 'delete', '点击位置 删除角色组，相关参数{\"id\":\"6\"}', 'lwy', '/index.php/index/group/delete/id/6.html', '1584436910', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('193', '1', 'get', 'Group', 'delete', '点击位置 删除角色组，相关参数{\"id\":\"6\"}', 'lwy', '/index.php/index/group/delete/id/6.html', '1584436914', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('194', '1', 'get', 'Group', 'delete', '点击位置 删除角色组，相关参数{\"id\":\"6\"}', 'lwy', '/index.php/index/group/delete/id/6.html', '1584436916', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('195', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584436917', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('196', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584436919', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('197', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584436944', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('198', '1', 'ajax', 'Group', 'delete', '点击位置 删除角色组，相关参数{\"id\":\"5\"}', 'lwy', '/index.php/index/group/delete/id/5.html', '1584436948', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('199', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584436950', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('200', '1', 'get', 'Group', 'edit', '点击位置 修改角色组，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/group/edit/id/2.html', '1584437038', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('201', '1', 'ajax', 'Group', 'add', '点击位置 创建角色组，相关参数{\"id\":\"2\",\"group_name\":\"\\u89d2\\u82721\",\"group_resources\":[\"goods_glist\",\"goods_g_edit\",\"group_index\",\"log_my\"]}', 'lwy', '/index.php/index/group/add/id/2.html', '1584437042', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('202', '1', 'ajax', 'Group', 'add', '更新角色组资料 : <br>【角色组名称】: 角色1<br>【角色组权限】: [\"goods_glist\",\"goods_g_edit\",\"group_index\",\"log_my\"]<br>【角色组旧权限】: {\"id\":2,\"group_name\":\"\\u89d2\\u82721\",\"group_type\":1,\"group_resources\":\"[\\\"index_index\\\",\\\"group_index\\\",\\\"system_memcache\\\",\\\"system_flush_file_cache\\\"]\"}<br>', 'lwy', '/index.php/index/group/add/id/2.html', '1584437043', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('203', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584437045', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('204', '2', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwyenn', '/index.php/index/group/index.html', '1584437058', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('205', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584437060', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('206', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584437198', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('207', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php/index/goods/gtype.html', '1584437201', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('208', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584437202', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('209', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584437211', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('210', '1', 'get', 'Group', 'edit', '点击位置 修改角色组，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/group/edit/id/2.html', '1584437213', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('211', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584437227', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('212', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584437510', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('213', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584437536', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('214', '2', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数[]', 'lwyenn', '/index.php/index/goods/g_edit.html', '1584437748', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('215', '2', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数[]', 'lwyenn', '/index.php/index/goods/g_edit.html', '1584437754', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('216', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584437756', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('217', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584437821', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('218', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584437823', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('219', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584437834', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('220', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584437922', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('221', '2', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwyenn', '/index.php/index/group/index.html', '1584438000', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('222', '2', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwyenn', '/index.php/index/group/index.html', '1584438068', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('223', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584438073', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('224', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584438125', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('225', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584439938', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('226', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584439951', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('227', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php/index/goods/gtype.html', '1584439952', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('228', '1', 'get', 'Goods', 'gt_edit', '点击位置 商品分类编辑，相关参数{\"id\":\"5\"}', 'lwy', '/index.php/index/goods/gt_edit/id/5.html', '1584439954', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('229', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php/index/goods/gtype.html', '1584439954', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('230', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584439956', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('231', '1', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/goods/g_edit/id/4.html', '1584439957', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('232', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584439958', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('233', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584440666', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('234', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584440667', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('235', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584440697', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('236', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584440710', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('237', '1', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/goods/g_edit/id/4.html', '1584440714', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('238', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584440715', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('239', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584440877', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('240', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584493471', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('241', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584495946', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('242', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584496891', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('243', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584497203', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('244', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584497244', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('245', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584498574', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('246', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584498667', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('247', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584498680', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('248', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584498829', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('249', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584498861', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('250', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584498872', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('251', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584498899', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('252', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584500040', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('253', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584500078', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('254', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584500105', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('255', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584500107', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('256', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584500123', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('257', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584500489', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('258', '1', 'get', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数{\"id\":\"1\"}', 'lwy', '/index.php/index/ad/edit/id/1.html', '1584500495', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('259', '1', 'get', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数{\"id\":\"1\"}', 'lwy', '/index.php/index/ad/edit/id/1.html', '1584500508', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('260', '1', 'get', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数{\"id\":\"1\"}', 'lwy', '/index.php/index/ad/edit/id/1.html', '1584500540', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('261', '1', 'get', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数{\"id\":\"1\"}', 'lwy', '/index.php/index/ad/edit/id/1.html', '1584500572', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('262', '1', 'get', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数{\"id\":\"1\"}', 'lwy', '/index.php/index/ad/edit/id/1.html', '1584500631', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('263', '1', 'get', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数{\"id\":\"1\"}', 'lwy', '/index.php/index/ad/edit/id/1.html', '1584502294', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('264', '1', 'get', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数{\"id\":\"1\"}', 'lwy', '/index.php/index/ad/edit/id/1.html', '1584502509', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('265', '1', 'ajax', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数{\"ad_desc\":\"\\u6d4b\\u8bd5\\u767e\\u5ea6\",\"ad_url\":\"www.baidu.com\",\"ad_img\":\"9\",\"ad_target\":\"1\",\"is_show\":\"on\",\"ad_stime\":\"2020-03-10\",\"ad_etime\":\"2020-03-18\",\"id\":\"1\"}', 'lwy', '/index.php/index/ad/edit/id/1.html', '1584502545', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('266', '1', 'ajax', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数{\"ad_desc\":\"\\u6d4b\\u8bd5\\u767e\\u5ea6\",\"ad_url\":\"www.baidu.com\",\"ad_img\":\"9\",\"ad_target\":\"1\",\"is_show\":\"on\",\"ad_stime\":\"2020-03-10\",\"ad_etime\":\"2020-03-18\",\"id\":\"1\"}', 'lwy', '/index.php/index/ad/edit/id/1.html', '1584503443', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('267', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584503445', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('268', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584503565', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('269', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584506409', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('270', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584509301', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('271', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584509307', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('272', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509311', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('273', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584509312', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('274', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584509330', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('275', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584509331', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('276', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509344', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('277', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509347', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('278', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509349', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('279', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509351', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('280', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509352', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('281', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509352', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('282', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509353', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('283', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509353', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('284', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509353', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('285', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509353', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('286', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509354', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('287', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509354', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('288', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509355', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('289', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509355', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('290', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509355', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('291', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509355', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('292', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509355', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('293', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509356', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('294', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509356', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('295', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509424', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('296', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509451', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('297', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509511', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('298', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509524', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('299', '1', 'get', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/ad/edit/id/2.html', '1584509529', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('300', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509531', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('301', '1', 'get', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/ad/edit/id/2.html', '1584509532', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('302', '1', 'ajax', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数{\"ad_desc\":\"\\u6d4b\\u8bd5\\u767e\\u5ea6\",\"ad_url\":\"www.baidu.com\",\"ad_img\":\"9\",\"ad_target\":\"2\",\"is_show\":\"on\",\"ad_stime\":\"2020-03-18\",\"ad_etime\":\"2020-03-18\",\"id\":\"2\"}', 'lwy', '/index.php/index/ad/edit/id/2.html', '1584509534', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('303', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509537', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('304', '1', 'get', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/ad/edit/id/2.html', '1584509538', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('305', '1', 'ajax', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数{\"ad_desc\":\"\\u6d4b\\u8bd5\\u767e\\u5ea6\",\"ad_url\":\"www.baidu.com\",\"ad_img\":\"9\",\"ad_target\":\"2\",\"ad_stime\":\"2020-03-18\",\"ad_etime\":\"2020-03-18\",\"id\":\"2\"}', 'lwy', '/index.php/index/ad/edit/id/2.html', '1584509541', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('306', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509543', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('307', '1', 'get', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/ad/edit/id/2.html', '1584509545', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('308', '1', 'ajax', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数{\"ad_desc\":\"\\u6d4b\\u8bd5\\u767e\\u5ea6\",\"ad_url\":\"www.baidu.sscom\",\"ad_img\":\"9\",\"ad_target\":\"2\",\"ad_stime\":\"2020-03-18\",\"ad_etime\":\"2020-03-18\",\"id\":\"2\"}', 'lwy', '/index.php/index/ad/edit/id/2.html', '1584509548', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('309', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509550', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('310', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509617', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('311', '1', 'get', 'Ad', 'delete', '点击位置 删除广告，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/ad/delete/id/2.html', '1584509619', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('312', '1', 'get', 'Ad', 'delete', '点击位置 删除广告，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/ad/delete/id/2.html', '1584509621', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('313', '1', 'get', 'Ad', 'delete', '点击位置 删除广告，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/ad/delete/id/2.html', '1584509622', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('314', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509623', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('315', '1', 'get', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/ad/edit/id/2.html', '1584509624', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('316', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509625', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('317', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509626', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('318', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509626', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('319', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509627', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('320', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509627', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('321', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509648', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('322', '1', 'ajax', 'Ad', 'delete', '点击位置 删除广告，相关参数{\"id\":\"1\"}', 'lwy', '/index.php/index/ad/delete/id/1.html', '1584509653', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('323', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509655', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('324', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584509663', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('325', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584509722', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('326', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584510584', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('327', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584510585', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('328', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584510602', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('329', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584510613', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('330', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584510614', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('331', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584510616', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('332', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584510616', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('333', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584510618', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('334', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584510633', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('335', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584510912', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('336', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584510914', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('337', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584510921', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('338', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511001', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('339', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511015', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('340', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511016', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('341', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511016', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('342', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511016', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('343', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511017', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('344', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511017', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('345', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511017', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('346', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511017', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('347', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511017', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('348', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511017', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('349', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511017', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('350', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511018', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('351', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511039', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('352', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511168', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('353', '1', 'ajax', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"admin_username\":\"lwyenn\",\"admin_surename\":\"yunt\",\"admin_password\":\"\",\"group_id\":\"2\",\"admin_status\":\"on\",\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511196', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('354', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511309', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('355', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511579', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('356', '1', 'ajax', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"admin_username\":\"lwyenn\",\"admin_surename\":\"yunt\",\"admin_password\":\"\",\"group_id\":\"3\",\"admin_status\":\"on\",\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511593', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('357', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584511595', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('358', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584511633', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('359', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511638', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('360', '1', 'ajax', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"admin_username\":\"lwyenn\",\"admin_surename\":\"\\u6d4b\\u8bd52\",\"admin_password\":\"\",\"group_id\":\"3\",\"admin_status\":\"on\",\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511645', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('361', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584511648', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('362', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584511653', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('363', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584511654', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('364', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584511654', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('365', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584511654', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('366', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584511654', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('367', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/edit/id/2.html', '1584511655', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('368', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584511656', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('369', '1', 'ajax', 'Admin', 'delete', '点击位置 管理员删除，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/admin/delete/id/2.html', '1584511659', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('370', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584511662', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('371', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584511736', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('372', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584512692', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('373', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584513157', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('374', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584513447', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('375', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584513450', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('376', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584513479', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('377', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584514437', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('378', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584514509', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('379', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584514531', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('380', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584514551', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('381', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584514645', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('382', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584514667', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('383', '1', 'get', 'User', 'edit', '点击位置 添加会员，相关参数[]', 'lwy', '/index.php/index/user/edit.html', '1584514889', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('384', '1', 'get', 'User', 'edit', '点击位置 添加会员，相关参数[]', 'lwy', '/index.php/index/user/edit.html', '1584514904', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('385', '1', 'get', 'User', 'edit', '点击位置 添加会员，相关参数[]', 'lwy', '/index.php/index/user/edit.html', '1584514919', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('386', '1', 'ajax', 'User', 'edit', '点击位置 添加会员，相关参数{\"user_surename\":\"\",\"user_sex\":\"1\",\"user_phone\":\"\",\"user_address\":\"\",\"user_level\":\"1\",\"user_status\":\"on\"}', 'lwy', '/index.php/index/user/edit.html', '1584514976', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('387', '1', 'get', 'User', 'edit', '点击位置 添加会员，相关参数[]', 'lwy', '/index.php/index/user/edit.html', '1584515336', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('388', '1', 'get', 'User', 'edit', '点击位置 添加会员，相关参数[]', 'lwy', '/index.php/index/user/edit.html', '1584515339', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('389', '1', 'get', 'User', 'edit', '点击位置 添加会员，相关参数[]', 'lwy', '/index.php/index/user/edit.html', '1584515339', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('390', '1', 'get', 'User', 'edit', '点击位置 添加会员，相关参数[]', 'lwy', '/index.php/index/user/edit.html', '1584515339', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('391', '1', 'ajax', 'User', 'edit', '点击位置 添加会员，相关参数{\"user_username\":\"zhangsan\",\"user_surename\":\"\\u5f20\\u4e09\",\"user_password\":\"\",\"user_sex\":\"1\",\"user_phone\":\"1452222263\",\"user_address\":\"\\u53a6\\u95e8\\u5e02\\u6e56\\u91cc\\u533a\\u83dc\\u6c64\",\"user_level\":\"1\",\"user_status\":\"on\"}', 'lwy', '/index.php/index/user/edit.html', '1584515377', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('392', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584515878', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('393', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数{\"keyword\":\"\",\"url\":\"\",\"ip\":\"127\"}', 'lwy', '/index.php/index/exp_log/index.html', '1584515895', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('394', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数{\"keyword\":\"\",\"url\":\"\",\"ip\":\"125\"}', 'lwy', '/index.php/index/exp_log/index.html', '1584515899', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('395', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584515902', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('396', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584515914', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('397', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584515917', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('398', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584515918', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('399', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584515919', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('400', '1', 'get', 'User', 'edit', '点击位置 添加会员，相关参数[]', 'lwy', '/index.php/index/user/edit.html', '1584515920', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('401', '1', 'ajax', 'User', 'edit', '点击位置 添加会员，相关参数{\"user_username\":\"zhangsan\",\"user_surename\":\"\\u5f20\\u4e09\",\"user_password\":\"\",\"user_sex\":\"1\",\"user_phone\":\"1233636333\",\"user_address\":\"\\u563b\\u563b\\u563b\\u563b\\u563b\\u563b\\u563b\\u563b\\u563b\\u563b\\u563b\\u563b\\u563b\\u563b\",\"user_level\":\"2\",\"user_status\":\"on\"}', 'lwy', '/index.php/index/user/edit.html', '1584515940', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('402', '1', 'get', 'User', 'edit', '点击位置 添加会员，相关参数[]', 'lwy', '/index.php/index/user/edit.html', '1584515941', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('403', '1', 'ajax', 'User', 'edit', '点击位置 添加会员，相关参数{\"user_username\":\"lisi\",\"user_surename\":\"\\u91cc\\u65af\",\"user_password\":\"\",\"user_sex\":\"2\",\"user_phone\":\"123213213213\",\"user_address\":\"\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\",\"user_level\":\"2\",\"user_status\":\"on\"}', 'lwy', '/index.php/index/user/edit.html', '1584515959', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('404', '1', 'get', 'User', 'edit', '点击位置 添加会员，相关参数[]', 'lwy', '/index.php/index/user/edit.html', '1584515960', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('405', '1', 'ajax', 'User', 'edit', '点击位置 添加会员，相关参数{\"user_username\":\"zhangliu\",\"user_surename\":\"\\u957f\\u8001\",\"user_password\":\"ssss123\",\"user_sex\":\"2\",\"user_phone\":\"150323366\",\"user_address\":\"\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\\u6c34\",\"user_level\":\"3\",\"user_status\":\"on\"}', 'lwy', '/index.php/index/user/edit.html', '1584515982', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('406', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584515984', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('407', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584515987', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('408', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516005', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('409', '1', 'ajax', 'User', 'set_switch', '点击位置 会员禁用，相关参数{\"switch_status\":\"2\",\"id\":\"1\",\"field\":\"user_status\"}', 'lwy', '/index.php/index/User/set_switch', '1584516009', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('410', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516011', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('411', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516013', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('412', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516013', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('413', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516013', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('414', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516013', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('415', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516013', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('416', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516014', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('417', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516014', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('418', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516014', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('419', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516014', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('420', '1', 'ajax', 'User', 'set_switch', '点击位置 会员禁用，相关参数{\"switch_status\":\"1\",\"id\":\"1\",\"field\":\"user_status\"}', 'lwy', '/index.php/index/User/set_switch', '1584516015', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('421', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516015', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('422', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516016', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('423', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516016', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('424', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516016', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('425', '1', 'ajax', 'User', 'set_switch', '点击位置 会员禁用，相关参数{\"switch_status\":\"2\",\"id\":\"1\",\"field\":\"user_status\"}', 'lwy', '/index.php/index/User/set_switch', '1584516017', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('426', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516017', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('427', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516017', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('428', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516018', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('429', '1', 'get', 'User', 'edit', '点击位置 添加会员，相关参数{\"id\":\"1\"}', 'lwy', '/index.php/index/user/edit/id/1.html', '1584516019', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('430', '1', 'ajax', 'User', 'edit', '点击位置 添加会员，相关参数{\"user_username\":\"zhangsan\",\"user_surename\":\"\\u5f20\\u4e0933\",\"user_password\":\"\",\"user_sex\":\"1\",\"user_phone\":\"1233636333\",\"user_address\":\"\\u563b\\u563b\\u563b\\u563b\\u563b\\u563b\\u563b\\u563b\\u563b\\u563b\\u563b\\u563b\\u563b\\u563b\",\"user_level\":\"2\",\"id\":\"1\"}', 'lwy', '/index.php/index/user/edit/id/1.html', '1584516024', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('431', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516026', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('432', '1', 'ajax', 'User', 'delete', '点击位置 删除会员，相关参数{\"id\":\"1\"}', 'lwy', '/index.php/index/user/delete/id/1.html', '1584516048', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('433', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516050', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('434', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516053', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('435', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数{\"keywords\":\"150323366\",\"user_regtime\":\"\"}', 'lwy', '/index.php/index/user/index.html', '1584516058', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('436', '1', 'get', 'User', 'edit', '点击位置 添加会员，相关参数[]', 'lwy', '/index.php/index/user/edit.html', '1584516061', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('437', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数{\"keywords\":\"150323366\",\"user_regtime\":\"\"}', 'lwy', '/index.php/index/user/index.html', '1584516062', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('438', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516073', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('439', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516086', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('440', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584516095', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('441', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584516346', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('442', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584516400', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('443', '1', 'get', 'Group', 'edit', '点击位置 修改角色组，相关参数{\"id\":\"3\"}', 'lwy', '/index.php/index/group/edit/id/3.html', '1584516403', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('444', '1', 'ajax', 'Group', 'add', '点击位置 创建角色组，相关参数{\"id\":\"3\",\"group_name\":\"\\u89d2\\u82722\",\"group_resources\":[\"goods_glist\"]}', 'lwy', '/index.php/index/group/add/id/3.html', '1584516408', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('445', '1', 'ajax', 'Group', 'add', '更新角色组资料 : <br>【角色组名称】: 角色2<br>【角色组权限】: [\"goods_glist\"]<br>【角色组旧权限】: {\"id\":3,\"group_name\":\"\\u89d2\\u82722\",\"group_type\":1,\"group_resources\":\"[\\\"index_index\\\",\\\"client_index\\\",\\\"client_affairs\\\",\\\"client_survey\\\",\\\"client_edit\\\",\\\"client_company_intention_edit\\\",\\\"client_company_edit\\\",\\\"client_add\\\",\\\"client_delete\\\",\\\"client_deal_edit\\\",\\\"client_company_deal_edit\\\",\\\"client_general_to_intention\\\",\\\"client_client_record\\\",\\\"client_deal_client_record\\\",\\\"client_company_client_record\\\",\\\"client_company_deal_client_record\\\",\\\"client_add_record_list\\\",\\\"client_client_record_list\\\",\\\"client_delete_client_record\\\",\\\"client_client_record_edit\\\",\\\"client_company_record_edit\\\",\\\"client_audit\\\",\\\"client_company_audit\\\",\\\"client_follow\\\",\\\"client_protect\\\",\\\"client_protect_edit\\\",\\\"client_release_client\\\",\\\"client_protect_client\\\",\\\"client_custom\\\",\\\"client_get_record\\\",\\\"client_history\\\",\\\"client_acquisition_audit\\\",\\\"client_custom_edit\\\",\\\"client_custom_audit\\\",\\\"client_inner\\\",\\\"accompanyvisit_record\\\",\\\"accompanyvisit_edit\\\",\\\"accompanyvisit_record_edit\\\",\\\"statistics_new_add\\\",\\\"statistics_attr_analysis\\\",\\\"statistics_top_score\\\",\\\"statistics_top_deal\\\",\\\"statistics_deal_analysis\\\",\\\"statistics_consumption\\\",\\\"statistics_bussiness\\\",\\\"marketurl_over_view\\\",\\\"marketurl_qq_contact\\\",\\\"marketurl_market_action\\\",\\\"marketurl_market_channel\\\",\\\"marketurl_market_zwei\\\",\\\"marketurl_action_detail\\\",\\\"marketurl_market_medium\\\",\\\"marketurl_market_log\\\",\\\"msg_index\\\",\\\"msg_view\\\",\\\"question_index\\\",\\\"question_category\\\",\\\"question_cate_edit\\\",\\\"question_cate_delete\\\",\\\"consult_index\\\",\\\"consult_service_list\\\",\\\"system_memcache\\\",\\\"system_flush_file_cache\\\"]\",\"group_status\":\"1\"}<br>', 'lwy', '/index.php/index/group/add/id/3.html', '1584516408', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('446', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516410', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('447', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数{\"keywords\":\"150323366\",\"user_regtime\":\"\"}', 'lwy', '/index.php/index/user/index.html', '1584516411', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('448', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584516417', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('449', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516421', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('450', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516495', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('451', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516531', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('452', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516531', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('453', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516532', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('454', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516532', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('455', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516532', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('456', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516532', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('457', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516532', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('458', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516533', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('459', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516533', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('460', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516567', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('461', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516568', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('462', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516568', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('463', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516568', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('464', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516569', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('465', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516569', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('466', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516569', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('467', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516569', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('468', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516569', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('469', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516569', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('470', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516653', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('471', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516672', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('472', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516672', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('473', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516673', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('474', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516673', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('475', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516673', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('476', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516673', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('477', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516673', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('478', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516673', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('479', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516674', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('480', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516764', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('481', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516766', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('482', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516766', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('483', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516780', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('484', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516842', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('485', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584516898', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('486', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584517041', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('487', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584517054', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('488', '1', 'get', 'Group', 'edit', '点击位置 修改角色组，相关参数{\"id\":\"3\"}', 'lwy', '/index.php/index/group/edit/id/3.html', '1584517055', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('489', '1', 'ajax', 'Group', 'add', '点击位置 创建角色组，相关参数{\"id\":\"3\",\"group_name\":\"\\u89d2\\u82722\",\"group_resources\":[\"goods_glist\",\"goods_set_switch\"]}', 'lwy', '/index.php/index/group/add/id/3.html', '1584517059', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('490', '1', 'ajax', 'Group', 'add', '更新角色组资料 : <br>【角色组名称】: 角色2<br>【角色组权限】: [\"goods_glist\",\"goods_set_switch\"]<br>【角色组旧权限】: {\"id\":3,\"group_name\":\"\\u89d2\\u82722\",\"group_type\":1,\"group_resources\":\"[\\\"goods_glist\\\"]\",\"group_status\":\"1\"}<br>', 'lwy', '/index.php/index/group/add/id/3.html', '1584517059', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('491', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584517061', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('492', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584517061', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('493', '1', 'get', 'Group', 'edit', '点击位置 修改角色组，相关参数{\"id\":\"3\"}', 'lwy', '/index.php/index/group/edit/id/3.html', '1584517064', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('494', '1', 'ajax', 'Group', 'add', '点击位置 创建角色组，相关参数{\"id\":\"3\",\"group_name\":\"\\u89d2\\u82722\",\"group_resources\":[\"goods_glist\",\"goods_set_switch\",\"goods_gt_delete\"]}', 'lwy', '/index.php/index/group/add/id/3.html', '1584517066', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('495', '1', 'ajax', 'Group', 'add', '更新角色组资料 : <br>【角色组名称】: 角色2<br>【角色组权限】: [\"goods_glist\",\"goods_set_switch\",\"goods_gt_delete\"]<br>【角色组旧权限】: {\"id\":3,\"group_name\":\"\\u89d2\\u82722\",\"group_type\":1,\"group_resources\":\"[\\\"goods_glist\\\",\\\"goods_set_switch\\\"]\",\"group_status\":\"1\"}<br>', 'lwy', '/index.php/index/group/add/id/3.html', '1584517066', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('496', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584517068', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('497', '1', 'get', 'Group', 'edit', '点击位置 修改角色组，相关参数{\"id\":\"3\"}', 'lwy', '/index.php/index/group/edit/id/3.html', '1584517071', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('498', '1', 'ajax', 'Group', 'add', '点击位置 创建角色组，相关参数{\"id\":\"3\",\"group_name\":\"\\u89d2\\u82722\",\"group_resources\":[\"goods_glist\",\"goods_set_switch\",\"goods_gtype\",\"goods_gt_delete\"]}', 'lwy', '/index.php/index/group/add/id/3.html', '1584517074', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('499', '1', 'ajax', 'Group', 'add', '更新角色组资料 : <br>【角色组名称】: 角色2<br>【角色组权限】: [\"goods_glist\",\"goods_set_switch\",\"goods_gtype\",\"goods_gt_delete\"]<br>【角色组旧权限】: {\"id\":3,\"group_name\":\"\\u89d2\\u82722\",\"group_type\":1,\"group_resources\":\"[\\\"goods_glist\\\",\\\"goods_set_switch\\\",\\\"goods_gt_delete\\\"]\",\"group_status\":\"1\"}<br>', 'lwy', '/index.php/index/group/add/id/3.html', '1584517074', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('500', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584517076', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('501', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584517076', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('502', '2', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwyenn', '/index.php/index/goods/gtype.html', '1584517077', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('503', '1', 'get', 'Group', 'edit', '点击位置 修改角色组，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/group/edit/id/2.html', '1584517084', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('504', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584517085', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('505', '1', 'get', 'Group', 'edit', '点击位置 修改角色组，相关参数{\"id\":\"3\"}', 'lwy', '/index.php/index/group/edit/id/3.html', '1584517086', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('506', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584517109', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('507', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584517127', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('508', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584517298', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('509', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584518990', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('510', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584519018', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('511', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584520783', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('512', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584520787', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('513', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584520810', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('514', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584520980', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('515', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584521090', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('516', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584521153', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('517', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584523717', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('518', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584523718', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('519', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584523840', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('520', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584523843', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('521', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584523844', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('522', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584523892', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('523', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584523894', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('524', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584523894', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('525', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584523895', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('526', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584523991', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('527', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584523997', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('528', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584523999', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('529', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584524001', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('530', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584524001', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('531', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584524001', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('532', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584524019', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('533', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数{\"g_name\":\"\\u4e0b\",\"gt_id\":\"\"}', 'lwyenn', '/index.php/index/goods/glist.html', '1584524024', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('534', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数{\"g_name\":\"\\u4e0b\",\"gt_id\":\"\"}', 'lwyenn', '/index.php/index/goods/glist.html', '1584524026', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('535', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584524030', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('536', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数{\"g_name\":\"\\u674e\",\"gt_id\":\"\"}', 'lwyenn', '/index.php/index/goods/glist.html', '1584524041', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('537', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584524072', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('538', '1', 'get', 'Goods', 'g_edit', '点击位置 商品编辑，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/goods/g_edit/id/4.html', '1584524075', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('539', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584524076', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('540', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php/index/goods/gtype.html', '1584524078', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('541', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584524079', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('542', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584524081', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('543', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584524084', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('544', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584524085', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('545', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584524086', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('546', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584524091', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('547', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584524091', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('548', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584524094', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('549', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584524258', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('550', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584524259', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('551', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584524261', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('552', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584524395', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('553', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584524446', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('554', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584524479', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('555', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584524536', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('556', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584524555', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('557', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584524599', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('558', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584524762', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('559', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584524769', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('560', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584524784', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('561', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584524788', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('562', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584524895', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('563', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584524897', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('564', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数[]', 'lwy', '/index.php/index/user/record.html', '1584524899', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('565', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584525408', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('566', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584525411', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('567', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584525412', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('568', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584525416', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('569', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584525537', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('570', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584525540', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('571', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584525541', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('572', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584525541', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('573', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584525543', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('574', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584525692', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('575', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584582626', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('576', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php/index/goods/gtype.html', '1584586426', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('577', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584586433', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('578', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584587510', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('579', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数{\"keyword\":\"\",\"url\":\"\",\"ip\":\"\"}', 'lwy', '/index.php/index/exp_log/index.html', '1584588510', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('580', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584588605', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('581', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数[]', 'lwy', '/index.php/index/user/record.html', '1584590009', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('582', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数[]', 'lwy', '/index.php/index/user/record.html', '1584590025', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('583', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数[]', 'lwy', '/index.php/index/user/record.html', '1584590036', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('584', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数[]', 'lwy', '/index.php/index/user/record.html', '1584590064', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('585', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数[]', 'lwy', '/index.php/index/user/record.html', '1584590081', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('586', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数[]', 'lwy', '/index.php/index/user/record.html', '1584590152', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('587', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数[]', 'lwy', '/index.php/index/user/record.html', '1584590162', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('588', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数{\"keywords\":\"\\u8e29\\u8e29\",\"addtime\":\"\"}', 'lwy', '/index.php/index/user/record.html', '1584590169', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('589', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数{\"keywords\":\"11\",\"addtime\":\"\"}', 'lwy', '/index.php/index/user/record.html', '1584590173', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('590', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数{\"keywords\":\"\",\"addtime\":\"\"}', 'lwy', '/index.php/index/user/record.html', '1584590176', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('591', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数{\"keywords\":\"\",\"addtime\":\"\"}', 'lwy', '/index.php/index/user/record.html', '1584590219', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('592', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584590239', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('593', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584598127', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('594', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584598130', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('595', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584598138', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('596', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584598141', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('597', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584598146', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('598', '1', 'get', 'Order', 'edit', '点击位置 订单编辑，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/edit/id/4.html', '1584598294', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('599', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584598296', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('600', '1', 'get', 'Order', 'edit', '点击位置 订单编辑，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/edit/id/4.html', '1584598494', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('601', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584598981', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('602', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584598982', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('603', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584598986', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('604', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584598991', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('605', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584598997', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('606', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584598998', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('607', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599001', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('608', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599067', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('609', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584599069', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('610', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599070', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('611', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599076', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('612', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584599079', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('613', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599081', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('614', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599083', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('615', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584599117', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('616', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599119', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('617', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599129', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('618', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599130', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('619', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599130', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('620', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599130', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('621', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599130', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('622', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584599131', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('623', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584599134', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('624', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599145', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('625', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599543', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('626', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584599544', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('627', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599546', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('628', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599549', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('629', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599550', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('630', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584599551', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('631', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599553', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('632', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599605', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('633', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584599606', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('634', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599612', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('635', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584599613', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('636', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599634', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('637', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584599634', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('638', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599641', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('639', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599642', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('640', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584599643', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('641', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599674', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('642', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599674', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('643', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584599676', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('644', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599678', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('645', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599680', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('646', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584599686', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('647', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599690', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('648', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599720', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('649', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599721', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('650', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584599723', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('651', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584599726', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('652', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600008', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('653', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584600010', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('654', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600085', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('655', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600085', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('656', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584600087', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('657', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600138', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('658', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584600139', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('659', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600152', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('660', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600154', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('661', '1', 'get', 'Order', 'edit', '点击位置 订单编辑，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/edit/id/4.html', '1584600155', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('662', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600157', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('663', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584600158', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('664', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600190', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('665', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584600191', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('666', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600266', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('667', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600345', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('668', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584600347', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('669', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600349', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('670', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584600354', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('671', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600357', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('672', '1', 'get', 'Order', 'edit', '点击位置 订单编辑，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/edit/id/4.html', '1584600370', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('673', '1', 'ajax', 'Order', 'edit', '点击位置 订单编辑，相关参数{\"order_address\":\"222222\",\"order_phone\":\"123213213213\",\"id\":\"4\"}', 'lwy', '/index.php/index/order/edit/id/4.html', '1584600375', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('674', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600377', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('675', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584600380', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('676', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600401', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('677', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584600401', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('678', '1', 'ajax', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"order_logistics\":\"360sksk\",\"order_logno\":\"12321121233\",\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584600423', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('679', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600425', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('680', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584600443', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('681', '1', 'ajax', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"order_logistics\":\"360sksk\",\"order_logno\":\"12321121233\",\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584600460', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('682', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600462', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('683', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/delivery/id/4.html', '1584600464', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('684', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600465', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('685', '1', 'get', 'Order', 'edit', '点击位置 订单编辑，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/edit/id/4.html', '1584600507', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('686', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600510', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('687', '1', 'get', 'Order', 'edit', '点击位置 订单编辑，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/edit/id/4.html', '1584600570', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('688', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600572', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('689', '1', 'get', 'Order', 'edit', '点击位置 订单编辑，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/edit/id/4.html', '1584600584', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('690', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600585', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('691', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600961', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('692', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600961', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('693', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600962', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('694', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600962', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('695', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600962', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('696', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600962', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('697', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600962', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('698', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600962', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('699', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600963', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('700', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600963', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('701', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600963', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('702', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600963', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('703', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600963', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('704', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600964', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('705', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600964', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('706', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600964', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('707', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600964', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('708', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600989', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('709', '1', 'ajax', 'Order', 'refund', '点击位置 退货审核，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/refund/id/4.html', '1584600993', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('710', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584600995', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('711', '1', 'ajax', 'Order', 'refund', '点击位置 退货审核，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/refund/id/4.html', '1584601018', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('712', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584601021', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('713', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584601050', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('714', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584601051', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('715', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584601051', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('716', '1', 'get', 'Order', 'refund', '点击位置 退货审核，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/refund/id/4.html', '1584601052', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('717', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584601059', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('718', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584604446', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('719', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584604510', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('720', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584605316', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('721', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"5\"}', 'lwy', '/index.php/index/order/delivery/id/5.html', '1584605325', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('722', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584605327', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('723', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"5\"}', 'lwy', '/index.php/index/order/delivery/id/5.html', '1584605354', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('724', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584605357', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('725', '1', 'get', 'Order', 'refund', '点击位置 退货审核，相关参数{\"id\":\"5\"}', 'lwy', '/index.php/index/order/refund/id/5.html', '1584605426', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('726', '1', 'ajax', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"order_status\":\"5\",\"order_remark\":\"\\u6025\\u6025\\u6025\\u6025\\u6025\\u6025\",\"id\":\"5\"}', 'lwy', '/index.php/index/order/delivery/id/5.html', '1584605434', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('727', '1', 'ajax', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"order_status\":\"5\",\"order_remark\":\"\\u6025\\u6025\\u6025\\u6025\\u6025\\u6025\",\"id\":\"5\"}', 'lwy', '/index.php/index/order/delivery/id/5.html', '1584605477', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('728', '1', 'ajax', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"order_status\":\"5\",\"order_remark\":\"\\u6025\\u6025\\u6025\\u6025\\u6025\\u6025\",\"id\":\"5\"}', 'lwy', '/index.php/index/order/delivery/id/5.html', '1584605487', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('729', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584605535', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('730', '1', 'get', 'Order', 'refund', '点击位置 退货审核，相关参数{\"id\":\"4\"}', 'lwy', '/index.php/index/order/refund/id/4.html', '1584605538', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('731', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584605542', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('732', '1', 'get', 'Order', 'refund', '点击位置 退货审核，相关参数{\"id\":\"5\"}', 'lwy', '/index.php/index/order/refund/id/5.html', '1584605543', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('733', '1', 'ajax', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"order_status\":\"5\",\"order_remark\":\"\\u662fFSDAFADSFD\",\"id\":\"5\"}', 'lwy', '/index.php/index/order/delivery/id/5.html', '1584605546', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('734', '1', 'ajax', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"order_status\":\"5\",\"order_remark\":\"\\u662fFSDAFADSFD\",\"id\":\"5\"}', 'lwy', '/index.php/index/order/delivery/id/5.html', '1584605567', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('735', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584605570', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('736', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584605651', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('737', '1', 'get', 'Order', 'refund', '点击位置 退货审核，相关参数{\"id\":\"5\"}', 'lwy', '/index.php/index/order/refund/id/5.html', '1584605655', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('738', '1', 'ajax', 'Order', 'refund', '点击位置 退货审核，相关参数{\"order_status\":\"5\",\"order_remark\":\"2\\u98d2\\u98d2\\u5927\\u82cf\\u6253\\u662f\\u7684\\u662f\\u7684\",\"id\":\"5\"}', 'lwy', '/index.php/index/order/refund/id/5.html', '1584605664', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('739', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584605666', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('740', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584605996', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('741', '1', 'get', 'Order', 'refund', '点击位置 退货审核，相关参数{\"id\":\"5\"}', 'lwy', '/index.php/index/order/refund/id/5.html', '1584605997', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('742', '1', 'ajax', 'Order', 'refund', '点击位置 退货审核，相关参数{\"order_status\":\"5\",\"order_remark\":\"ZFFGSDGSFDGSDF\",\"id\":\"5\"}', 'lwy', '/index.php/index/order/refund/id/5.html', '1584606000', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('743', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584606002', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('744', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584606005', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('745', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数[]', 'lwy', '/index.php/index/user/record.html', '1584606006', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('746', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数[]', 'lwy', '/index.php/index/user/record.html', '1584606097', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('747', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数[]', 'lwy', '/index.php/index/user/record.html', '1584606129', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('748', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584606136', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('749', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584606138', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('750', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"6\"}', 'lwy', '/index.php/index/order/delivery/id/6.html', '1584606142', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('751', '1', 'ajax', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"order_logistics\":\"\\u4e5f\\u4e00\\u6837\",\"order_logno\":\"\",\"id\":\"6\"}', 'lwy', '/index.php/index/order/delivery/id/6.html', '1584606147', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('752', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584606150', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('753', '1', 'get', 'Order', 'edit', '点击位置 订单编辑，相关参数{\"id\":\"6\"}', 'lwy', '/index.php/index/order/edit/id/6.html', '1584606152', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('754', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584606154', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('755', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"6\"}', 'lwy', '/index.php/index/order/delivery/id/6.html', '1584606157', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('756', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584606159', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('757', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584606201', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('758', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584606207', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('759', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584606211', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('760', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584606222', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('761', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数{\"orderno\":\"\",\"goods_name\":\"\",\"user_username\":\"\",\"ad_time\":\"\",\"order_status\":\"2\"}', 'lwy', '/index.php/index/order/index.html', '1584606228', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('762', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数{\"orderno\":\"\",\"goods_name\":\"\",\"user_username\":\"\",\"ad_time\":\"\",\"order_status\":\"5\"}', 'lwy', '/index.php/index/order/index.html', '1584606231', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('763', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数{\"orderno\":\"\",\"goods_name\":\"\",\"user_username\":\"\",\"ad_time\":\"\",\"order_status\":\"2\"}', 'lwy', '/index.php/index/order/index.html', '1584606233', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('764', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数{\"orderno\":\"\",\"goods_name\":\"\",\"user_username\":\"\",\"ad_time\":\"\",\"order_status\":\"1\"}', 'lwy', '/index.php/index/order/index.html', '1584606236', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('765', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"17\"}', 'lwy', '/index.php/index/order/delivery/id/17.html', '1584606239', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('766', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数{\"orderno\":\"\",\"goods_name\":\"\",\"user_username\":\"\",\"ad_time\":\"\",\"order_status\":\"1\"}', 'lwy', '/index.php/index/order/index.html', '1584606242', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('767', '1', 'get', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"id\":\"17\"}', 'lwy', '/index.php/index/order/delivery/id/17.html', '1584606278', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('768', '1', 'ajax', 'Order', 'delivery', '点击位置 订单发货，相关参数{\"order_logistics\":\"\",\"order_logno\":\"\",\"id\":\"17\"}', 'lwy', '/index.php/index/order/delivery/id/17.html', '1584606283', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('769', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数{\"orderno\":\"\",\"goods_name\":\"\",\"user_username\":\"\",\"ad_time\":\"\",\"order_status\":\"1\"}', 'lwy', '/index.php/index/order/index.html', '1584606285', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('770', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数{\"orderno\":\"\",\"goods_name\":\"\",\"user_username\":\"\",\"ad_time\":\"\",\"order_status\":\"1\"}', 'lwy', '/index.php/index/order/index.html', '1584606354', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('771', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584606358', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('772', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584606383', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('773', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584606411', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('774', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584606415', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('775', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584606427', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('776', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584606427', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('777', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584606454', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('778', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584606457', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('779', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数{\"page\":\"2\"}', 'lwy', '/index.php/index/order/index.html', '1584606459', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('780', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584606465', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('781', '1', 'get', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/ad/edit/id/2.html', '1584606469', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('782', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584606471', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('783', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584606682', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('784', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584606683', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('785', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584606702', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('786', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584606752', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('787', '1', 'get', 'Order', 'refund', '点击位置 退货审核，相关参数{\"id\":\"17\"}', 'lwy', '/index.php/index/order/refund/id/17.html', '1584606758', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('788', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584606760', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('789', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584606773', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('790', '1', 'get', 'Order', 'refund', '点击位置 退货审核，相关参数{\"id\":\"17\"}', 'lwy', '/index.php/index/order/refund/id/17.html', '1584606775', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('791', '1', 'ajax', 'Order', 'refund', '点击位置 退货审核，相关参数{\"order_status\":\"5\",\"order_remark\":\"\\u800c\\u975e\\u8303\\u5fb7\\u8428\\u8303\\u5fb7\\u8428\\u53d1\\u5927\\u6c34\\u53d1\\u5c04\\u70b9\",\"id\":\"17\"}', 'lwy', '/index.php/index/order/refund/id/17.html', '1584606779', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('792', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584606783', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('793', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584606784', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('794', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584606784', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('795', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584606784', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('796', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584606784', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('797', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584606784', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('798', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584606785', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('799', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584606785', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('800', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584606822', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('801', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数{\"page\":\"2\"}', 'lwy', '/index.php/index/exp_log/index.html', '1584606837', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('802', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数{\"page\":\"1\"}', 'lwy', '/index.php/index/exp_log/index.html', '1584606842', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('803', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数[]', 'lwy', '/index.php/index/user/record.html', '1584606932', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('804', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数{\"page\":\"2\"}', 'lwy', '/index.php/index/user/record.html', '1584606934', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('805', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数{\"page\":\"2\"}', 'lwy', '/index.php/index/user/record.html', '1584606945', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('806', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数[]', 'lwy', '/index.php/index/user/record.html', '1584606947', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('807', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数[]', 'lwy', '/index.php/index/user/record.html', '1584606974', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('808', '1', 'ajax', 'System', 'flush_file_cache', '点击位置 删除文件缓存，相关参数[]', 'lwy', '/index.php/index/system/flush_file_cache.html', '1584607007', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('809', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数[]', 'lwy', '/index.php/index/user/record.html', '1584607009', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('810', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584607013', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('811', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584607014', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('812', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584607015', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('813', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584607077', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('814', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584607081', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('815', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584607104', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('816', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584607242', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('817', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584607270', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('818', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584607272', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('819', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584607272', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('820', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584607272', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('821', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584607273', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('822', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584607273', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('823', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584607274', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('824', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584607293', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('825', '1', 'get', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数[]', 'lwy', '/index.php/index/ad/edit.html', '1584607296', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('826', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584607298', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('827', '1', 'get', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/ad/edit/id/2.html', '1584607299', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('828', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584607300', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('829', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584607302', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('830', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584607344', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('831', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584607421', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('832', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584607542', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('833', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584607553', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('834', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584607554', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('835', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584607554', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('836', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584607554', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('837', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584607614', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('838', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584607623', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('839', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584607659', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('840', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584607698', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('841', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584607712', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('842', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584607808', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('843', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584607849', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('844', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584608106', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('845', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584608137', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('846', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584609547', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('847', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584609549', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('848', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584609550', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('849', '1', 'get', 'Admin', 'edit', '点击位置 管理员修改/新增，相关参数[]', 'lwy', '/index.php/index/admin/edit.html', '1584609551', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('850', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584609553', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('851', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584609657', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('852', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php/index/goods/gtype.html', '1584609711', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('853', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584609714', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('854', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584609716', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('855', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php/index/goods/gtype.html', '1584609717', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('856', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584609718', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('857', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584609745', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('858', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584609853', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('859', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584609870', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('860', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584610080', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('861', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584610081', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('862', '1', 'get', 'Ad', 'edit', '点击位置 修改/新增广告，相关参数{\"id\":\"2\"}', 'lwy', '/index.php/index/ad/edit/id/2.html', '1584610083', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('863', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584610171', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('864', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584610174', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('865', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584610330', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('866', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584610369', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('867', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584610377', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('868', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584610466', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('869', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584610468', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('870', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584610475', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('871', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584610492', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('872', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584610504', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('873', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584610516', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('874', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwyenn', '/index.php/index/goods/glist.html', '1584611305', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('875', '2', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数{\"g_name\":\"\\u6740\",\"gt_id\":\"\"}', 'lwyenn', '/index.php/index/goods/glist.html', '1584611311', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('876', '2', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwyenn', '/index.php/index/goods/gtype.html', '1584611314', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('877', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584611687', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('878', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584611690', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('879', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584665734', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('880', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584665812', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('881', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584665814', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('882', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584665814', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('883', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584666434', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('884', '1', 'ajax', 'System', 'index', '点击位置 系统参数设置，相关参数{\"config\":{\"WEB_TITLE\":\"\\u53a6\\u95e8\\u8d24\\u9c7c\",\"WEB_DESC\":\"\\u4fe1\\u606f\\u8fdb\\u884c\\u5c06\\u7ee7\\u7eed\\u4e0b\\u964d\",\"WEB_ICON\":\"\",\"WEB_VERSION\":\"1.0.0\",\"WEB_PHONE\":\"152633333333\",\"API_KEY\":\"asdfg@qqwee1122\"}}', 'lwy', '/index.php/index/system/index.html', '1584666477', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('885', '1', 'ajax', 'System', 'index', '系统变量设置 {\"config\":{\"WEB_TITLE\":\"\\u53a6\\u95e8\\u8d24\\u9c7c\",\"WEB_DESC\":\"\\u4fe1\\u606f\\u8fdb\\u884c\\u5c06\\u7ee7\\u7eed\\u4e0b\\u964d\",\"WEB_ICON\":\"\",\"WEB_VERSION\":\"1.0.0\",\"WEB_PHONE\":\"152633333333\",\"API_KEY\":\"asdfg@qqwee1122\"}}', 'lwy', '/index.php/index/system/index.html', '1584666477', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('886', '1', 'ajax', 'System', 'index', '系统变量设置设置资料 : <br>', 'lwy', '/index.php/index/system/index.html', '1584666477', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('887', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584666479', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('888', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584667210', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('889', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584667415', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('890', '1', 'ajax', 'System', 'index', '点击位置 系统参数设置，相关参数{\"config\":{\"WEB_TITLE\":\"\\u53a6\\u95e8\\u8d24\\u9c7c\",\"WEB_DESC\":\"\\u4fe1\\u606f\\u8fdb\\u884c\\u5c06\\u7ee7\\u7eed\\u4e0b\\u964d\",\"WEB_VERSION\":\"1.0.0\",\"WEB_PHONE\":\"152633333333\",\"API_KEY\":\"asdfg@qqwee1122\",\"API_NOTE\":\"0\"}}', 'lwy', '/index.php/index/system/index.html', '1584667485', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('891', '1', 'ajax', 'System', 'index', '系统变量设置 {\"config\":{\"WEB_TITLE\":\"\\u53a6\\u95e8\\u8d24\\u9c7c\",\"WEB_DESC\":\"\\u4fe1\\u606f\\u8fdb\\u884c\\u5c06\\u7ee7\\u7eed\\u4e0b\\u964d\",\"WEB_VERSION\":\"1.0.0\",\"WEB_PHONE\":\"152633333333\",\"API_KEY\":\"asdfg@qqwee1122\",\"API_NOTE\":\"0\"}}', 'lwy', '/index.php/index/system/index.html', '1584667485', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('892', '1', 'ajax', 'System', 'index', '点击位置 系统参数设置，相关参数{\"config\":{\"WEB_TITLE\":\"\\u53a6\\u95e8\\u8d24\\u9c7c\",\"WEB_DESC\":\"\\u4fe1\\u606f\\u8fdb\\u884c\\u5c06\\u7ee7\\u7eed\\u4e0b\\u964d\",\"WEB_VERSION\":\"1.0.0\",\"WEB_PHONE\":\"152633333333\",\"API_KEY\":\"asdfg@qqwee1122\",\"API_NOTE\":\"1\"}}', 'lwy', '/index.php/index/system/index.html', '1584667490', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('893', '1', 'ajax', 'System', 'index', '系统变量设置 {\"config\":{\"WEB_TITLE\":\"\\u53a6\\u95e8\\u8d24\\u9c7c\",\"WEB_DESC\":\"\\u4fe1\\u606f\\u8fdb\\u884c\\u5c06\\u7ee7\\u7eed\\u4e0b\\u964d\",\"WEB_VERSION\":\"1.0.0\",\"WEB_PHONE\":\"152633333333\",\"API_KEY\":\"asdfg@qqwee1122\",\"API_NOTE\":\"1\"}}', 'lwy', '/index.php/index/system/index.html', '1584667490', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('894', '1', 'ajax', 'System', 'index', '点击位置 系统参数设置，相关参数{\"config\":{\"WEB_TITLE\":\"\\u53a6\\u95e8\\u8d24\\u9c7c\",\"WEB_DESC\":\"\\u4fe1\\u606f\\u8fdb\\u884c\\u5c06\\u7ee7\\u7eed\\u4e0b\\u964d\",\"WEB_VERSION\":\"1.0.0\",\"WEB_PHONE\":\"152633333333\",\"API_KEY\":\"asdfg@qqwee1122\",\"API_NOTE\":\"1\"}}', 'lwy', '/index.php/index/system/index.html', '1584667576', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('895', '1', 'ajax', 'System', 'index', '系统变量设置 {\"config\":{\"WEB_TITLE\":\"\\u53a6\\u95e8\\u8d24\\u9c7c\",\"WEB_DESC\":\"\\u4fe1\\u606f\\u8fdb\\u884c\\u5c06\\u7ee7\\u7eed\\u4e0b\\u964d\",\"WEB_VERSION\":\"1.0.0\",\"WEB_PHONE\":\"152633333333\",\"API_KEY\":\"asdfg@qqwee1122\",\"API_NOTE\":\"1\"}}', 'lwy', '/index.php/index/system/index.html', '1584667576', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('896', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584667642', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('897', '1', 'ajax', 'System', 'index', '点击位置 系统参数设置，相关参数{\"config\":{\"WEB_TITLE\":\"\\u53a6\\u95e8\\u8d24\\u9c7c\",\"WEB_DESC\":\"\\u4fe1\\u606f\\u8fdb\\u884c\\u5c06\\u7ee7\\u7eed\\u4e0b\\u964d\",\"WEB_ICON\":\"\",\"WEB_VERSION\":\"1.0.0\",\"WEB_PHONE\":\"152633333333\",\"API_KEY\":\"asdfg@qqwee1122\",\"API_NOTE\":\"0\"}}', 'lwy', '/index.php/index/system/index.html', '1584667653', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('898', '1', 'ajax', 'System', 'index', '系统变量设置 {\"config\":{\"WEB_TITLE\":\"\\u53a6\\u95e8\\u8d24\\u9c7c\",\"WEB_DESC\":\"\\u4fe1\\u606f\\u8fdb\\u884c\\u5c06\\u7ee7\\u7eed\\u4e0b\\u964d\",\"WEB_ICON\":\"\",\"WEB_VERSION\":\"1.0.0\",\"WEB_PHONE\":\"152633333333\",\"API_KEY\":\"asdfg@qqwee1122\",\"API_NOTE\":\"0\"}}', 'lwy', '/index.php/index/system/index.html', '1584667653', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('899', '1', 'ajax', 'System', 'index', '系统变量设置设置资料 : <br>', 'lwy', '/index.php/index/system/index.html', '1584667653', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('900', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584667655', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('901', '1', 'ajax', 'System', 'index', '点击位置 系统参数设置，相关参数{\"config\":{\"WEB_TITLE\":\"\\u53a6\\u95e8\\u8d24\\u9c7c\",\"WEB_DESC\":\"\\u4fe1\\u606f\\u8fdb\\u884c\\u5c06\\u7ee7\\u7eed\\u4e0b\\u964d\",\"WEB_ICON\":\"\",\"WEB_VERSION\":\"1.0.0\",\"WEB_PHONE\":\"152633333333\",\"API_KEY\":\"asdfg@qqwee1122\",\"API_NOTE\":\"0\"}}', 'lwy', '/index.php/index/system/index.html', '1584667953', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('902', '1', 'ajax', 'System', 'index', '系统变量设置 {\"config\":{\"WEB_TITLE\":\"\\u53a6\\u95e8\\u8d24\\u9c7c\",\"WEB_DESC\":\"\\u4fe1\\u606f\\u8fdb\\u884c\\u5c06\\u7ee7\\u7eed\\u4e0b\\u964d\",\"WEB_ICON\":\"\",\"WEB_VERSION\":\"1.0.0\",\"WEB_PHONE\":\"152633333333\",\"API_KEY\":\"asdfg@qqwee1122\",\"API_NOTE\":\"0\"}}', 'lwy', '/index.php/index/system/index.html', '1584667953', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('903', '1', 'ajax', 'System', 'index', '点击位置 系统参数设置，相关参数{\"config\":{\"WEB_TITLE\":\"\\u53a6\\u95e8\\u8d24\\u9c7c\",\"WEB_DESC\":\"\\u4fe1\\u606f\\u8fdb\\u884c\\u5c06\\u7ee7\\u7eed\\u4e0b\\u964d\",\"WEB_ICON\":\"\",\"WEB_VERSION\":\"1.0.0\",\"WEB_PHONE\":\"152633333333\",\"API_KEY\":\"asdfg@qqwee1122\",\"API_NOTE\":\"0\"}}', 'lwy', '/index.php/index/system/index.html', '1584667963', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('904', '1', 'ajax', 'System', 'index', '系统变量设置 {\"config\":{\"WEB_TITLE\":\"\\u53a6\\u95e8\\u8d24\\u9c7c\",\"WEB_DESC\":\"\\u4fe1\\u606f\\u8fdb\\u884c\\u5c06\\u7ee7\\u7eed\\u4e0b\\u964d\",\"WEB_ICON\":\"\",\"WEB_VERSION\":\"1.0.0\",\"WEB_PHONE\":\"152633333333\",\"API_KEY\":\"asdfg@qqwee1122\",\"API_NOTE\":\"0\"}}', 'lwy', '/index.php/index/system/index.html', '1584667963', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('905', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584668002', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('906', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584668002', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('907', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584668237', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('908', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584668674', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('909', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584668694', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('910', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584669049', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('911', '1', 'ajax', 'System', 'index', '点击位置 系统参数设置，相关参数{\"config\":{\"WEB_TITLE\":\"\\u53a6\\u95e8\\u8d24\\u9c7c\",\"WEB_DESC\":\"\\u4fe1\\u606f\\u8fdb\\u884c\\u5c06\\u7ee7\\u7eed\\u4e0b\\u964d\",\"WEB_ICON\":\"25\",\"WEB_VERSION\":\"1.0.0\",\"WEB_PHONE\":\"152633333333\",\"API_KEY\":\"asdfg@qqwee1122\",\"API_NOTE\":\"0\"}}', 'lwy', '/index.php/index/system/index.html', '1584669055', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('912', '1', 'ajax', 'System', 'index', '系统变量设置 {\"config\":{\"WEB_TITLE\":\"\\u53a6\\u95e8\\u8d24\\u9c7c\",\"WEB_DESC\":\"\\u4fe1\\u606f\\u8fdb\\u884c\\u5c06\\u7ee7\\u7eed\\u4e0b\\u964d\",\"WEB_ICON\":\"25\",\"WEB_VERSION\":\"1.0.0\",\"WEB_PHONE\":\"152633333333\",\"API_KEY\":\"asdfg@qqwee1122\",\"API_NOTE\":\"0\"}}', 'lwy', '/index.php/index/system/index.html', '1584669055', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('913', '1', 'ajax', 'System', 'index', '点击位置 系统参数设置，相关参数{\"config\":{\"WEB_TITLE\":\"\\u53a6\\u95e8\\u8d24\\u9c7c\",\"WEB_DESC\":\"\\u4fe1\\u606f\\u8fdb\\u884c\\u5c06\\u7ee7\\u7eed\\u4e0b\\u964d\",\"WEB_ICON\":\"25\",\"WEB_VERSION\":\"1.0.0\",\"WEB_PHONE\":\"152633333333\",\"API_KEY\":\"asdfg@qqwee1122\",\"API_NOTE\":\"0\"}}', 'lwy', '/index.php/index/system/index.html', '1584669070', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('914', '1', 'ajax', 'System', 'index', '系统变量设置 {\"config\":{\"WEB_TITLE\":\"\\u53a6\\u95e8\\u8d24\\u9c7c\",\"WEB_DESC\":\"\\u4fe1\\u606f\\u8fdb\\u884c\\u5c06\\u7ee7\\u7eed\\u4e0b\\u964d\",\"WEB_ICON\":\"25\",\"WEB_VERSION\":\"1.0.0\",\"WEB_PHONE\":\"152633333333\",\"API_KEY\":\"asdfg@qqwee1122\",\"API_NOTE\":\"0\"}}', 'lwy', '/index.php/index/system/index.html', '1584669070', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('915', '1', 'ajax', 'System', 'index', '系统变量设置设置资料 : <br>【旧网站图标】:  【新网站图标】: 25<br>', 'lwy', '/index.php/index/system/index.html', '1584669070', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('916', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584669072', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('917', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584669195', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('918', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584669432', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('919', '1', 'get', 'ExpLog', 'index', '点击位置 异常日志，相关参数[]', 'lwy', '/index.php/index/exp_log/index.html', '1584669534', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('920', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584669538', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('921', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584669544', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('922', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584669547', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('923', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数[]', 'lwy', '/index.php/index/user/record.html', '1584669552', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('924', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数[]', 'lwy', '/index.php/index/user/record.html', '1584669556', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('925', '1', 'get', 'User', 'record', '点击位置 记录管理，相关参数{\"page\":\"2\"}', 'lwy', '/index.php/index/user/record.html', '1584669559', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('926', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584669561', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('927', '1', 'get', 'User', 'index', '点击位置 会员列表，相关参数[]', 'lwy', '/index.php/index/user/index.html', '1584669563', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('928', '1', 'get', 'Group', 'index', '点击位置 角色组管理，相关参数[]', 'lwy', '/index.php/index/group/index.html', '1584669563', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('929', '1', 'get', 'Admin', 'index', '点击位置 管理员列表，相关参数[]', 'lwy', '/index.php/index/admin/index.html', '1584669565', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('930', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584669566', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('931', '1', 'get', 'Order', 'index', '点击位置 订单列表，相关参数[]', 'lwy', '/index.php/index/order/index.html', '1584669568', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('932', '1', 'get', 'Goods', 'gtype', '点击位置 商品分类，相关参数[]', 'lwy', '/index.php/index/goods/gtype.html', '1584669571', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('933', '1', 'get', 'Goods', 'glist', '点击位置 商品列表，相关参数[]', 'lwy', '/index.php/index/goods/glist.html', '1584669572', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('934', '1', 'get', 'Ad', 'index', '点击位置 广告列表，相关参数[]', 'lwy', '/index.php/index/ad/index.html', '1584669573', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('935', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584669574', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('936', '1', 'get', 'System', 'memcache', '点击位置 缓存管理，相关参数[]', 'lwy', '/index.php/index/system/memcache.html', '1584669576', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('937', '1', 'ajax', 'System', 'flush_file_cache', '点击位置 删除文件缓存，相关参数[]', 'lwy', '/index.php/index/system/flush_file_cache.html', '1584669578', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('938', '1', 'get', 'System', 'index', '点击位置 系统参数设置，相关参数[]', 'lwy', '/index.php/index/system/index.html', '1584669580', '127.0.0.1');
INSERT INTO `xy_log` VALUES ('939', '1', 'get', 'ApiLog', 'index', '点击位置 API日志，相关参数[]', 'lwy', '/index.php/index/api_log/index.html', '1584669585', '127.0.0.1');

-- ----------------------------
-- Table structure for xy_order
-- ----------------------------
DROP TABLE IF EXISTS `xy_order`;
CREATE TABLE `xy_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `orderno` varchar(50) DEFAULT NULL COMMENT '订单号',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `goods_count` int(11) DEFAULT NULL COMMENT '购买数量',
  `order_price` decimal(10,2) DEFAULT NULL COMMENT '订单价格',
  `order_addtime` int(11) DEFAULT NULL COMMENT '订单时间',
  `order_status` tinyint(1) DEFAULT '0' COMMENT '0待支付 1已支付 2已发货 3确认收货 4退货中 5退货成功 6退货失败',
  `is_delete` enum('1','2') DEFAULT '1' COMMENT '1正常 2删除',
  `order_address` varchar(255) DEFAULT NULL COMMENT '订单地址',
  `order_phone` varchar(20) DEFAULT NULL COMMENT '订单电话',
  `order_logistics` varchar(20) DEFAULT NULL COMMENT '订单物流',
  `order_logno` varchar(50) DEFAULT NULL COMMENT '订单物流号',
  `order_remark` varchar(255) DEFAULT NULL COMMENT '审核备注',
  `order_user_remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xy_order
-- ----------------------------
INSERT INTO `xy_order` VALUES ('4', '1', '120031988548454516', '3', '2', '6.50', '1584588548', '4', '1', '222222', '123213213213', '360sksk', '12321121233', null, null);
INSERT INTO `xy_order` VALUES ('5', '1', '120031904082238934', '3', '2', '6.50', '1584604082', '5', '1', 'sdskdfjkasfhlkd', '1152622362626', null, null, 'ZFFGSDGSFDGSDF', '不想要了');
INSERT INTO `xy_order` VALUES ('6', '1', '120031904096021239', '2', '2', '6.00', '1584604096', '1', '1', 'sdskdfjkasfhlkd', '1152622362626', '也一样', '', null, null);
INSERT INTO `xy_order` VALUES ('7', '1', '120031904098995630', '2', '2', '6.00', '1584604098', '1', '1', 'sdskdfjkasfhlkd', '1152622362626', null, null, null, null);
INSERT INTO `xy_order` VALUES ('8', '1', '120031904102073764', '1', '2', '6.00', '1584604102', '1', '1', 'sdskdfjkasfhlkd', '1152622362626', null, null, null, null);
INSERT INTO `xy_order` VALUES ('9', '1', '120031904103761973', '1', '2', '6.00', '1584604103', '1', '1', 'sdskdfjkasfhlkd', '1152622362626', null, null, null, null);
INSERT INTO `xy_order` VALUES ('10', '1', '120031904104980592', '1', '2', '6.00', '1584604104', '1', '1', 'sdskdfjkasfhlkd', '1152622362626', null, null, null, null);
INSERT INTO `xy_order` VALUES ('11', '1', '120031904114603904', '3', '2', '6.00', '1584604114', '1', '1', 'sdskdfjkasfhlkd', '1152622362626', null, null, null, null);
INSERT INTO `xy_order` VALUES ('12', '1', '120031904115532119', '3', '2', '6.00', '1584604115', '1', '1', 'sdskdfjkasfhlkd', '1152622362626', null, null, null, null);
INSERT INTO `xy_order` VALUES ('13', '1', '120031904118243758', '2', '2', '6.00', '1584604118', '1', '1', 'sdskdfjkasfhlkd', '1152622362626', null, null, null, null);
INSERT INTO `xy_order` VALUES ('14', '1', '120031904119357486', '2', '2', '6.00', '1584604119', '1', '1', 'sdskdfjkasfhlkd', '1152622362626', null, null, null, null);
INSERT INTO `xy_order` VALUES ('15', '3', '320031906127245826', '2', '2', '2.50', '1584606127', '1', '1', 'sdskdfjkasfhlkd', '1152622362626', null, null, null, null);
INSERT INTO `xy_order` VALUES ('16', '3', '320031906198659393', '3', '1', '1.50', '1584606198', '1', '1', '厦门湖里', '1152622362626', null, null, null, null);
INSERT INTO `xy_order` VALUES ('17', '3', '320031906220431122', '1', '1', '5.00', '1584606220', '4', '1', '厦门湖里', '1152622362626', '', '', null, null);
INSERT INTO `xy_order` VALUES ('18', '3', '320031910464459730', '1', '1', '5.00', '1584610464', '1', '1', '厦门湖里', '1152622362626', null, null, null, null);
INSERT INTO `xy_order` VALUES ('19', '3', '320032067130279949', '1', '1', '5.00', '1584667130', '1', '1', '厦门湖里', '1152622362626', null, null, null, null);
INSERT INTO `xy_order` VALUES ('20', '3', '320032067260059593', '1', '1', '2.00', '1584667260', '1', '1', '厦门水水水水水湖里', '1152622362626', null, null, null, null);
INSERT INTO `xy_order` VALUES ('21', '3', '320032069468682166', '1', '1', '2.00', '1584669468', '1', '1', '厦门水水水水水湖里', '1152622362626', null, null, null, null);

-- ----------------------------
-- Table structure for xy_system
-- ----------------------------
DROP TABLE IF EXISTS `xy_system`;
CREATE TABLE `xy_system` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `identy` varchar(50) DEFAULT NULL COMMENT '键名',
  `attvalue` text COMMENT '键值',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统配置表';

-- ----------------------------
-- Records of xy_system
-- ----------------------------
INSERT INTO `xy_system` VALUES ('1', 'base', 'WEB_TITLE', '厦门贤鱼', null);
INSERT INTO `xy_system` VALUES ('2', 'base', 'WEB_DESC', '信息进行将继续下降', null);
INSERT INTO `xy_system` VALUES ('3', 'base', 'WEB_ICON', '25', null);
INSERT INTO `xy_system` VALUES ('4', 'base', 'WEB_VERSION', '1.0.0', null);
INSERT INTO `xy_system` VALUES ('5', 'base', 'WEB_PHONE', '152633333333', null);
INSERT INTO `xy_system` VALUES ('6', 'base', 'API_KEY', 'asdfg@qqwee1122', null);
INSERT INTO `xy_system` VALUES ('7', 'base', 'API_NOTE', '0', null);

-- ----------------------------
-- Table structure for xy_user
-- ----------------------------
DROP TABLE IF EXISTS `xy_user`;
CREATE TABLE `xy_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_surename` varchar(15) DEFAULT NULL COMMENT '用户名称',
  `user_username` varchar(15) DEFAULT NULL COMMENT '用户账号',
  `user_password` varchar(40) DEFAULT NULL COMMENT '会员密码',
  `user_sex` enum('2','1') DEFAULT '1' COMMENT '1 男 2女',
  `user_phone` varchar(15) NOT NULL COMMENT '用户电话',
  `score` decimal(10,2) DEFAULT NULL COMMENT '用户余额',
  `user_regtime` int(11) DEFAULT NULL COMMENT '用户注册时间',
  `user_address` varchar(500) DEFAULT NULL COMMENT '用户地址',
  `user_level` tinyint(1) DEFAULT '1' COMMENT '用户等级',
  `user_status` enum('2','1') DEFAULT '1' COMMENT '1 正常 2禁用',
  `is_delete` enum('2','1') DEFAULT '1' COMMENT '1 正常 2删除',
  `user_last_login_time` int(11) DEFAULT NULL COMMENT '用户最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='会员表';

-- ----------------------------
-- Records of xy_user
-- ----------------------------
INSERT INTO `xy_user` VALUES ('1', '张三33', 'zhangsan', '369713322b787642b695fae54c716809', '1', '1233636333', '35.50', '1584516024', '嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻嘻', '2', '1', '1', '1584521148');
INSERT INTO `xy_user` VALUES ('2', '里斯', 'lisi', '369713322b787642b695fae54c716809', '1', '123213213213', '200.00', '1584515959', '水水水水水水水水水水水水水水水水水', '2', '1', '1', null);
INSERT INTO `xy_user` VALUES ('3', '长老', 'zhangliu', '57276823340a5faa1464621a8382b4fe', '1', '150323366', '177.00', '1584515982', '水水水水水水水水水水水水', '3', '1', '1', null);

-- ----------------------------
-- Table structure for xy_user_score_record
-- ----------------------------
DROP TABLE IF EXISTS `xy_user_score_record`;
CREATE TABLE `xy_user_score_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `content` text,
  `oldscore` decimal(10,2) DEFAULT NULL,
  `score` decimal(10,2) DEFAULT NULL,
  `orderno` varchar(100) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `is_delete` enum('2','1') DEFAULT '1' COMMENT '1正常 2删除',
  `score_type` tinyint(1) DEFAULT '1' COMMENT '1 购买 2 退货',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='用户余额记录';

-- ----------------------------
-- Records of xy_user_score_record
-- ----------------------------
INSERT INTO `xy_user_score_record` VALUES ('17', '1', '购买产品踩踩踩踩踩，总价：6.5，数量：2', '96.00', '6.50', '120031988548454516', '1584588548', '1', '1');
INSERT INTO `xy_user_score_record` VALUES ('18', '1', '购买产品踩踩踩踩踩，总价：6.5，数量：2', '89.50', '6.50', '120031904082238934', '1584604082', '1', '1');
INSERT INTO `xy_user_score_record` VALUES ('19', '1', '购买产品Nnnn，总价：6，数量：2', '83.00', '6.00', '120031904096021239', '1584604096', '1', '1');
INSERT INTO `xy_user_score_record` VALUES ('20', '1', '购买产品Nnnn，总价：6，数量：2', '77.00', '6.00', '120031904098995630', '1584604098', '1', '1');
INSERT INTO `xy_user_score_record` VALUES ('21', '1', '购买产品林李大战，总价：6，数量：2', '71.00', '6.00', '120031904102073764', '1584604102', '1', '1');
INSERT INTO `xy_user_score_record` VALUES ('22', '1', '购买产品林李大战，总价：6，数量：2', '65.00', '6.00', '120031904103761973', '1584604103', '1', '1');
INSERT INTO `xy_user_score_record` VALUES ('23', '1', '购买产品林李大战，总价：6，数量：2', '59.00', '6.00', '120031904104980592', '1584604104', '1', '1');
INSERT INTO `xy_user_score_record` VALUES ('24', '1', '购买产品踩踩踩踩踩，总价：6，数量：2', '53.00', '6.00', '120031904114603904', '1584604114', '1', '1');
INSERT INTO `xy_user_score_record` VALUES ('25', '1', '购买产品踩踩踩踩踩，总价：6，数量：2', '47.00', '6.00', '120031904115532119', '1584604115', '1', '1');
INSERT INTO `xy_user_score_record` VALUES ('26', '1', '购买产品Nnnn，总价：6，数量：2', '41.00', '6.00', '120031904118243758', '1584604118', '1', '1');
INSERT INTO `xy_user_score_record` VALUES ('27', '1', '购买产品Nnnn，总价：6，数量：2', '35.00', '6.00', '120031904119357486', '1584604119', '1', '1');
INSERT INTO `xy_user_score_record` VALUES ('28', '1', '退货，产品踩踩踩踩踩，总价：6.50，数量：2', '29.00', '6.50', '120031904082238934', '1584606000', '1', '2');
INSERT INTO `xy_user_score_record` VALUES ('29', '3', '购买产品Nnnn，总价：2.5，数量：2', '200.00', '2.50', '320031906127245826', '1584606127', '1', '1');
INSERT INTO `xy_user_score_record` VALUES ('30', '3', '购买产品踩踩踩踩踩，总价：1.5，数量：1', '197.50', '1.50', '320031906198659393', '1584606198', '1', '1');
INSERT INTO `xy_user_score_record` VALUES ('31', '3', '购买产品林李大战，总价：5，数量：1', '196.00', '5.00', '320031906220431122', '1584606220', '1', '1');
INSERT INTO `xy_user_score_record` VALUES ('32', '3', '购买产品林李大战，总价：5，数量：1', '191.00', '5.00', '320031910464459730', '1584610464', '1', '1');
INSERT INTO `xy_user_score_record` VALUES ('33', '3', '购买产品林李大战，总价：5，数量：1', '186.00', '5.00', '320032067130279949', '1584667130', '1', '1');
INSERT INTO `xy_user_score_record` VALUES ('34', '3', '购买产品林李大战，总价：2，数量：1', '181.00', '2.00', '320032067260059593', '1584667260', '1', '1');
INSERT INTO `xy_user_score_record` VALUES ('35', '3', '购买产品林李大战，总价：2，数量：1', '179.00', '2.00', '320032069468682166', '1584669468', '1', '1');
