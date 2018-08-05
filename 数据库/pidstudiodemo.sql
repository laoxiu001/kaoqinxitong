/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : pidstudiodemo

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-05-17 19:39:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balance` double NOT NULL DEFAULT '0' COMMENT '余额',
  `discount` double NOT NULL DEFAULT '1' COMMENT '客户折扣系数',
  `name` varchar(128) DEFAULT NULL COMMENT '客户姓名',
  `phone` varchar(128) DEFAULT NULL COMMENT '客户手机号',
  `status` varchar(128) NOT NULL DEFAULT '激活' COMMENT '客户状态',
  `user_name` varchar(128) NOT NULL COMMENT '客户账号',
  PRIMARY KEY (`id`,`user_name`),
  UNIQUE KEY `UK_qfrm64q1g4do60ini1wv5crno` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('3', '48.91', '0.85', '老胡', null, '激活', '1');

-- ----------------------------
-- Table structure for `employee_manage`
-- ----------------------------
DROP TABLE IF EXISTS `employee_manage`;
CREATE TABLE `employee_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '员工姓名',
  `number` varchar(128) DEFAULT NULL COMMENT '员工工号',
  `password` varchar(128) DEFAULT NULL COMMENT '密码',
  `phone` varchar(128) DEFAULT NULL COMMENT '员工电话',
  `photo` varchar(128) DEFAULT NULL COMMENT '照片',
  `sex` varchar(128) DEFAULT NULL COMMENT '性别',
  `status` varchar(128) NOT NULL DEFAULT '在职' COMMENT '状态',
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ovbe46yqi0l1akxq3x5yy3irq` (`number`),
  KEY `FKci6393g5i8k2lvib4yj16lsjc` (`type_id`),
  CONSTRAINT `FKci6393g5i8k2lvib4yj16lsjc` FOREIGN KEY (`type_id`) REFERENCES `employee_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_manage
-- ----------------------------
INSERT INTO `employee_manage` VALUES ('1', '谭永超', '0001', '1', '18315170177', null, '男', '在职', '5');
INSERT INTO `employee_manage` VALUES ('2', '叶春林', '0002', null, null, null, '男', '在职', '1');

-- ----------------------------
-- Table structure for `employee_type`
-- ----------------------------
DROP TABLE IF EXISTS `employee_type`;
CREATE TABLE `employee_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '类型名称',
  `weighting_factor` double NOT NULL DEFAULT '0' COMMENT '加权系数',
  `basic_salary` double NOT NULL DEFAULT '0' COMMENT '基本工资',
  `commission_rate` double NOT NULL DEFAULT '0' COMMENT '提成比例',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_type
-- ----------------------------
INSERT INTO `employee_type` VALUES ('1', '洗头师', '1', '0.1', '1500');
INSERT INTO `employee_type` VALUES ('2', '初级造型师', '1.1', '0.15', '2000');
INSERT INTO `employee_type` VALUES ('3', '高级造型师', '1.2', '0.2', '2500');
INSERT INTO `employee_type` VALUES ('4', '专家造型师', '1.3', '0.25', '3000');
INSERT INTO `employee_type` VALUES ('5', '店长', '1.4', '0.3', '3500');

-- ----------------------------
-- Table structure for `expense`
-- ----------------------------
DROP TABLE IF EXISTS `expense`;
CREATE TABLE `expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL COMMENT '支出项目名',
  `remark` varchar(128) DEFAULT NULL COMMENT '备注',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '支出时间',
  `money` double NOT NULL DEFAULT '0' COMMENT '支出金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expense
-- ----------------------------
INSERT INTO `expense` VALUES ('1', '嫖娼', '老胡和老春去嫖娼', '2018-05-16 20:22:59', '0');

-- ----------------------------
-- Table structure for `pay_list`
-- ----------------------------
DROP TABLE IF EXISTS `pay_list`;
CREATE TABLE `pay_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '充值时间',
  `goid` double NOT NULL DEFAULT '0' COMMENT '充值金额',
  `type` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6bhwpy0g63bo3l2hn9tfw5ke5` (`user_name`),
  CONSTRAINT `FK6bhwpy0g63bo3l2hn9tfw5ke5` FOREIGN KEY (`user_name`) REFERENCES `customer` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pay_list
-- ----------------------------
INSERT INTO `pay_list` VALUES ('5', '2018-05-15 18:24:41', '300', '支付宝', '1');

-- ----------------------------
-- Table structure for `record`
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actually_paid` double NOT NULL DEFAULT '0' COMMENT '实付金额',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '消费时间',
  `name` varchar(128) DEFAULT NULL COMMENT '消费的姓名',
  `number` varchar(255) DEFAULT NULL,
  `payavle` double NOT NULL DEFAULT '0' COMMENT '应付金额',
  `service` int(11) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd0q9r429dd1xf5psbw6srn2jj` (`number`),
  KEY `FKdud08qlcdbtpb3xpi8n9pn6tx` (`service`),
  KEY `FKla6jsx3599rrps9fe775hdes4` (`user_name`),
  CONSTRAINT `FKd0q9r429dd1xf5psbw6srn2jj` FOREIGN KEY (`number`) REFERENCES `employee_manage` (`number`),
  CONSTRAINT `FKdud08qlcdbtpb3xpi8n9pn6tx` FOREIGN KEY (`service`) REFERENCES `service_item` (`id`),
  CONSTRAINT `FKla6jsx3599rrps9fe775hdes4` FOREIGN KEY (`user_name`) REFERENCES `customer` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('1', '100', '2018-05-15 18:23:56', '老胡', '0001', '0', '1', '1');
INSERT INTO `record` VALUES ('27', '35', '2018-05-15 18:27:37', '老胡', '0002', '29.75', '1', '1');
INSERT INTO `record` VALUES ('28', '24', '2018-05-15 18:27:37', '老胡', '0001', '28.55', '2', '1');
INSERT INTO `record` VALUES ('29', '35', '2018-05-15 18:38:50', '老胡', '0002', '29.75', '1', '1');
INSERT INTO `record` VALUES ('30', '33.6', '2018-05-15 18:38:50', '老胡', '0001', '39.98', '2', '1');
INSERT INTO `record` VALUES ('31', '35', '2018-05-16 08:39:33', '老胡', '0002', '29.75', '1', '1');
INSERT INTO `record` VALUES ('32', '33.6', '2018-05-16 08:39:33', '老胡', '0001', '39.98', '2', '1');
INSERT INTO `record` VALUES ('33', '44.8', '2018-05-16 08:39:33', '老胡', '0001', '53.31', '4', '1');

-- ----------------------------
-- Table structure for `service_item`
-- ----------------------------
DROP TABLE IF EXISTS `service_item`;
CREATE TABLE `service_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `introduction` varchar(128) DEFAULT NULL COMMENT '服务项目简介',
  `name` varchar(128) DEFAULT NULL COMMENT '服务项目名称',
  `price` double NOT NULL DEFAULT '0' COMMENT '服务项目价格',
  `type` int(11) DEFAULT NULL COMMENT '可提供该服务的员工类型',
  `status` tinyint(1) DEFAULT '1' COMMENT '判断服务是否在使用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service_item
-- ----------------------------
INSERT INTO `service_item` VALUES ('1', '洗头', '洗头', '35', '3', '1');
INSERT INTO `service_item` VALUES ('2', '剪头', '剪头', '24', '4', '1');
INSERT INTO `service_item` VALUES ('4', null, '何', '0', '0', '1');
INSERT INTO `service_item` VALUES ('5', null, '何', '0', '0', '1');
INSERT INTO `service_item` VALUES ('6', null, '何', '0', '0', '1');
INSERT INTO `service_item` VALUES ('7', null, '何', '0', '0', '1');
INSERT INTO `service_item` VALUES ('8', null, '何', '0', '0', '1');
INSERT INTO `service_item` VALUES ('9', null, '何', '0', '0', '1');
INSERT INTO `service_item` VALUES ('10', null, '何', '0', '0', '1');
INSERT INTO `service_item` VALUES ('11', null, '何', '0', '0', '1');
INSERT INTO `service_item` VALUES ('12', null, '何', '0', '0', '1');
INSERT INTO `service_item` VALUES ('13', null, '何', '0', '0', '0');
INSERT INTO `service_item` VALUES ('14', null, '何', '0', '0', '0');
INSERT INTO `service_item` VALUES ('15', null, '何', '0', '0', '1');
