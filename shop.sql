/*
Navicat MySQL Data Transfer

Source Server         : MYSQL
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-05-22 09:39:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'gcl', 'gcl');

-- ----------------------------
-- Table structure for cartitem
-- ----------------------------
DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE `cartitem` (
  `count` int(255) DEFAULT NULL,
  `subTotal` double(255,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cartitem
-- ----------------------------

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('5', '广东药科大学');
INSERT INTO `category` VALUES ('6', '广州中医药大学');
INSERT INTO `category` VALUES ('7', '清华大学');
INSERT INTO `category` VALUES ('8', '北京大学');
INSERT INTO `category` VALUES ('9', '中山大学');
INSERT INTO `category` VALUES ('10', 'GDPU');

-- ----------------------------
-- Table structure for categorysecond
-- ----------------------------
DROP TABLE IF EXISTS `categorysecond`;
CREATE TABLE `categorysecond` (
  `csid` int(11) NOT NULL AUTO_INCREMENT,
  `csname` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`csid`),
  KEY `FK936FCAF2169FA4BD` (`cid`),
  CONSTRAINT `FK936FCAF2169FA4BD` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorysecond
-- ----------------------------
INSERT INTO `categorysecond` VALUES ('1', '手环', '5');
INSERT INTO `categorysecond` VALUES ('2', 'logo', '5');
INSERT INTO `categorysecond` VALUES ('5', '电脑配件', '5');
INSERT INTO `categorysecond` VALUES ('6', '衣服', '6');
INSERT INTO `categorysecond` VALUES ('7', '中药', '6');
INSERT INTO `categorysecond` VALUES ('8', '未名湖', '7');
INSERT INTO `categorysecond` VALUES ('10', '挂饰', '5');
INSERT INTO `categorysecond` VALUES ('11', '明信片', '6');
INSERT INTO `categorysecond` VALUES ('12', '广药明信片', '5');
INSERT INTO `categorysecond` VALUES ('13', 'ABC', '10');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `subtotal` double(255,0) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `FKE8B2AB618B9739C0` (`pid`),
  KEY `FKE8B2AB61B2E09417` (`oid`),
  CONSTRAINT `FKE8B2AB618B9739C0` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `FKE8B2AB61B2E09417` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `totalMoney` double(255,0) DEFAULT NULL,
  `ordertime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userphone` varchar(255) DEFAULT NULL,
  `useraddr` varchar(255) DEFAULT NULL,
  `total` double DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FKC3DF62E521794F69` (`uid`),
  CONSTRAINT `FKC3DF62E521794F69` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `market_price` double(10,2) DEFAULT NULL,
  `shop_price` double(10,2) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `pdesc` varchar(255) DEFAULT NULL,
  `is_hot` int(255) DEFAULT NULL,
  `pdate` datetime DEFAULT NULL,
  `csid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `FKED8DCCEF74BA72D2` (`csid`),
  CONSTRAINT `FKED8DCCEF74BA72D2` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('11', '手环', '10.00', '100.00', 'products/4.jpg', ' 123456', '1', '2017-05-14 00:36:58', '1');
INSERT INTO `product` VALUES ('12', '徽章', '130.00', '123.00', 'products/1.jpg', '12234345345', '1', '2017-05-14 00:36:04', '2');
INSERT INTO `product` VALUES ('13', '徽章1', '1221.00', '1111.00', 'products/8.jpg', '1213', '1', '2017-05-14 00:38:10', '2');
INSERT INTO `product` VALUES ('14', 'U盘', '124.00', '110.00', 'products/10.jpg', '', '1', '2017-05-14 00:39:10', null);
INSERT INTO `product` VALUES ('15', 'U盘', '11221.00', '1212.00', 'products/11.jpg', '小东东用过的u盘，传说里面有16g珍贵内容', '0', '2017-05-14 16:15:36', '1');
INSERT INTO `product` VALUES ('16', '钥匙扣', '111.00', '11.00', 'products/12.jpg', '一个有故事的钥匙扣', '0', '2017-05-14 16:14:39', '1');
INSERT INTO `product` VALUES ('17', '小挂饰', '100.00', '99.00', 'products/5.jpg', '传说中的挂饰！！！力量+10，精神力+100，防御力+1000,10%免疫物理攻击', '0', '2017-05-14 16:20:13', '10');
INSERT INTO `product` VALUES ('18', '大白菜U盘', '1000.00', '999.00', 'products/14.jpg', '超大容量的U盘', '1', '2017-05-14 16:22:17', '5');
INSERT INTO `product` VALUES ('19', '明信片', '100.00', '88.00', 'products/6.jpg', '燃烧后10分钟内力量+99!', '1', '2017-05-14 16:25:10', '12');
INSERT INTO `product` VALUES ('20', '卡片', '10.00', '9.00', 'products/2.jpg', '灰常好看！！！', '0', '2017-05-14 16:25:56', '12');
INSERT INTO `product` VALUES ('21', '1234', '123.00', '123.00', 'products/微信图片_20170513234856.jpg', ' 1234', '0', '2017-05-14 18:22:05', '1');
INSERT INTO `product` VALUES ('26', '1', '1.00', '1.00', 'products/qr.png', '', '1', '2017-05-20 12:57:56', null);
INSERT INTO `product` VALUES ('27', '2', '2.00', '234.00', 'products/register.png', '', '1', '2017-05-20 12:58:09', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `state` int(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'sdc', 'sdc', '沈东诚', 'male', '739638270@qq.com', '13192344270', '四渡赤水独处', '1', 'adf1279a70a243a59a179eefaa7c44021c148fff7510456a8b09447170559971');
INSERT INTO `user` VALUES ('3', '1234', '1234', '1234', 'female', '1234567899@qq.com', '18826109999', '1234', '1', '94978c907c8f40668cc3126ef0e8cd1b1976ae6dca064d22bc706d05a75055d2');
INSERT INTO `user` VALUES ('8', '123456', '123', 'gcl', 'female', '739638270@qq.com', '13192344270', '四渡赤水独处', '0', 'e860c2e7d56847be98171e1c2f13b679f871538adef3480fae6e93bcf6647bd9');
INSERT INTO `user` VALUES ('9', '111111', '111', '111', 'female', '739638270@qq.com', '13192344270', '四渡赤水独处', '0', '7e5e2f38a2894bd3b94d6f2527af215484f199204f0a4168a364b05d29505d01');
INSERT INTO `user` VALUES ('11', 'ZYX', 'ZYX', '沈东诚', 'female', '739638270@qq.com', '13192344270', '四渡赤水独处', '0', 'b024e223af6b46f5a42e4b488d6b33b296ee845c20ca41288d3f1eb80e46c0bf');
INSERT INTO `user` VALUES ('12', 'ddd', 'ddd', 'dada', 'female', 'dada_coding@qq.com', '18826108877', 'ddadad', '0', '10261dc6d8334fd0a6bbad5a5d973c575e4cb05019264a68abd9c1b0faab1902');
INSERT INTO `user` VALUES ('13', 'dadada', 'dadada', '大大大', 'male', 'dada_coding@qq.com', '13131311313', '354', '0', 'f0b8b1aaa0b842039726c83e23936e5e056b0ebceda04100908120018c7cda46');
INSERT INTO `user` VALUES ('14', 'dda', 'dda', 'dda', 'female', 'dada_coding@qq.com', '13131311313', '131', '0', 'd54fa361ff994b9898027f5392dc428c9ac559afe838428589a9a6d78d4efedf');
INSERT INTO `user` VALUES ('15', 'DDDD', 'DDDD', 'gcl', 'female', '739638270@qq.com', '13192344270', '四渡赤水独处', '0', '14d2974d24d54abba2372a60751c7f4e701b61a33efe49b8a7a042a7a61ad37c');
