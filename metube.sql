/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : metube

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2019-02-21 19:26:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `class`
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `parentid` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '影视', '0');
INSERT INTO `class` VALUES ('2', '影视剪辑', '1');
INSERT INTO `class` VALUES ('3', '短片', '1');
INSERT INTO `class` VALUES ('4', '特技', '1');
INSERT INTO `class` VALUES ('5', '科技', '0');
INSERT INTO `class` VALUES ('6', '科普人文', '5');
INSERT INTO `class` VALUES ('7', '数码', '5');
INSERT INTO `class` VALUES ('8', '机械', '5');
INSERT INTO `class` VALUES ('9', '汽车', '5');
INSERT INTO `class` VALUES ('10', '音乐', '0');
INSERT INTO `class` VALUES ('11', '原创', '10');
INSERT INTO `class` VALUES ('12', '翻唱', '10');
INSERT INTO `class` VALUES ('13', '轻音乐', '10');
INSERT INTO `class` VALUES ('14', '演奏', '10');
INSERT INTO `class` VALUES ('15', '番剧', '0');
INSERT INTO `class` VALUES ('16', '连载', '15');
INSERT INTO `class` VALUES ('17', '完结', '15');
INSERT INTO `class` VALUES ('18', 'PV', '15');
INSERT INTO `class` VALUES ('19', '舞蹈', '0');
INSERT INTO `class` VALUES ('20', '古风', '19');
INSERT INTO `class` VALUES ('21', '三次元舞蹈', '19');
INSERT INTO `class` VALUES ('22', '宅舞', '19');
INSERT INTO `class` VALUES ('23', '游戏', '0');
INSERT INTO `class` VALUES ('24', '单机', '23');
INSERT INTO `class` VALUES ('25', '电竞', '23');
INSERT INTO `class` VALUES ('26', '手游', '23');
INSERT INTO `class` VALUES ('27', '网游', '23');
INSERT INTO `class` VALUES ('28', '鬼畜', '0');
INSERT INTO `class` VALUES ('29', '鬼畜调教', '28');
INSERT INTO `class` VALUES ('30', '人声voc', '28');
INSERT INTO `class` VALUES ('31', '音MAD', '28');
INSERT INTO `class` VALUES ('32', '好玩', '1');
INSERT INTO `class` VALUES ('36', '好吃', '5');
INSERT INTO `class` VALUES ('37', '宠物', '1');
INSERT INTO `class` VALUES ('39', '生活', '0');
INSERT INTO `class` VALUES ('57', 'test', '0');
INSERT INTO `class` VALUES ('58', '拉拉111', '57');
INSERT INTO `class` VALUES ('59', '家具', '39');
INSERT INTO `class` VALUES ('61', '111', '57');

-- ----------------------------
-- Table structure for `collections`
-- ----------------------------
DROP TABLE IF EXISTS `collections`;
CREATE TABLE `collections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of collections
-- ----------------------------
INSERT INTO `collections` VALUES ('1', '1', '2018-12-12', '5');
INSERT INTO `collections` VALUES ('2', '2', '2018-12-12', '5');
INSERT INTO `collections` VALUES ('3', '3', '2018-12-12', '5');
INSERT INTO `collections` VALUES ('4', '4', '2018-12-13', '5');
INSERT INTO `collections` VALUES ('5', '5', '2018-12-15', '5');
INSERT INTO `collections` VALUES ('6', '6', '2018-12-16', '5');
INSERT INTO `collections` VALUES ('7', '7', '2018-12-11', '1');
INSERT INTO `collections` VALUES ('8', '8', '2018-12-14', '1');
INSERT INTO `collections` VALUES ('9', '9', '2018-12-09', '1');
INSERT INTO `collections` VALUES ('10', '10', '2018-12-01', '2');
INSERT INTO `collections` VALUES ('11', '11', '2018-12-04', '2');
INSERT INTO `collections` VALUES ('12', '12', '2018-12-02', '3');
INSERT INTO `collections` VALUES ('13', '13', '2018-12-05', '4');

-- ----------------------------
-- Table structure for `collects`
-- ----------------------------
DROP TABLE IF EXISTS `collects`;
CREATE TABLE `collects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `userid` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of collects
-- ----------------------------
INSERT INTO `collects` VALUES ('1', '未命名收藏夹', '38');
INSERT INTO `collects` VALUES ('2', '教程', '38');
INSERT INTO `collects` VALUES ('3', '音乐', '38');
INSERT INTO `collects` VALUES ('4', '地理', '38');
INSERT INTO `collects` VALUES ('5', '动漫', '38');
INSERT INTO `collects` VALUES ('6', '漫威', '38');
INSERT INTO `collects` VALUES ('13', '好玩', '38');
INSERT INTO `collects` VALUES ('14', '好吃', '38');
INSERT INTO `collects` VALUES ('15', '好用', '38');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `userpic` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sex` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `penpal` varchar(1024) DEFAULT NULL,
  `power` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'emibia124', '18041161701@163.com', '654321', null, '女', '拉拉', null);
INSERT INTO `user` VALUES ('2', 'awfaf', '2345678', '98765', null, null, null, null);
INSERT INTO `user` VALUES ('3', 'bnjng', '276492', '3673994', null, null, null, null);
INSERT INTO `user` VALUES ('4', 'oiundb', '2437994', '24356784', null, null, null, null);
INSERT INTO `user` VALUES ('7', 'hukjhuk', '82673', '5646774', null, null, null, null);
INSERT INTO `user` VALUES ('9', 'hukjb dj', '2342342', '76887788', null, null, null, null);
INSERT INTO `user` VALUES ('11', 'admin', 'admin', '123', null, null, null, '1');
INSERT INTO `user` VALUES ('13', 'emibia03', '18066667777', '123456', null, null, null, null);
INSERT INTO `user` VALUES ('14', '6666e', '18766625242', '879234', null, null, null, null);
INSERT INTO `user` VALUES ('15', 'dhwud', '18012345567', '1234566', null, null, null, null);
INSERT INTO `user` VALUES ('16', null, '7767874', 'qwert123456', null, null, null, null);
INSERT INTO `user` VALUES ('20', null, 'emibia', '31', null, null, null, null);
INSERT INTO `user` VALUES ('22', null, 'emibia12411', '123', null, null, null, null);
INSERT INTO `user` VALUES ('38', 'emibia', 'emibia@163.com', '321', '/assets/User_pic/1550747796205.png', null, '明天都开开心心', null);

-- ----------------------------
-- Table structure for `usergroup`
-- ----------------------------
DROP TABLE IF EXISTS `usergroup`;
CREATE TABLE `usergroup` (
  `atid` int(11) NOT NULL AUTO_INCREMENT,
  `id` int(11) DEFAULT NULL,
  `atuser` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`atid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of usergroup
-- ----------------------------

-- ----------------------------
-- Table structure for `video`
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `detail` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `vpic` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `childclass` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `trial` varchar(10) DEFAULT NULL,
  `dateshow` timestamp NOT NULL,
  `discussgroup` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('1', 'video', '暂无介绍', '/assets/VideoFile/videopic/v1.png', '/assets/VideoFile/videopic/v1.png', '1', '38', '1', '2018-01-01 00:00:00', null);
INSERT INTO `video` VALUES ('2', 'video1', '暂无介绍', '/assets/VideoFile/videopic/v1.png', '/assets/VideoFile/videopic/v2.png', '1', '38', '1', '2018-01-01 00:00:00', null);
INSERT INTO `video` VALUES ('3', 'video', '暂无介绍', '/assets/VideoFile/videopic/v1.png', '/assets/VideoFile/videopic/v3.png', '1', '38', '1', '2018-01-01 00:00:00', null);
INSERT INTO `video` VALUES ('4', 'video', '暂无介绍', '/assets/VideoFile/videopic/v1.png', '/assets/VideoFile/videopic/v4.png', '1', '38', '1', '2018-01-01 00:00:00', null);
INSERT INTO `video` VALUES ('5', 'video', '暂无介绍', '/assets/VideoFile/videopic/v1.png', '/assets/VideoFile/videopic/v5.png', '1', '38', '1', '2018-01-01 00:00:00', null);
INSERT INTO `video` VALUES ('6', 'video', '暂无介绍', '/assets/VideoFile/videopic/v1.png', '/assets/VideoFile/videopic/v6.png', '1', '38', '1', '2018-01-01 00:00:00', null);
INSERT INTO `video` VALUES ('7', 'video', '暂无介绍', '/assets/VideoFile/videopic/v1.png', '/assets/VideoFile/videopic/v7.png', '1', '38', '1', '2018-01-01 00:00:00', null);
INSERT INTO `video` VALUES ('8', 'video', '暂无介绍', '/assets/VideoFile/videopic/v1.png', '/assets/VideoFile/videopic/v8.png', '1', '38', '1', '2018-01-01 00:00:00', null);
INSERT INTO `video` VALUES ('9', 'video', '暂无介绍', '/assets/VideoFile/videopic/v1.png', '/assets/VideoFile/videopic/v9.png', '1', '38', '1', '2018-01-01 00:00:00', null);
INSERT INTO `video` VALUES ('10', 'video', '暂无介绍', '/assets/VideoFile/videopic/v1.png', '/assets/VideoFile/videopic/v10.png', '1', '38', '1', '2018-01-01 00:00:00', null);
INSERT INTO `video` VALUES ('11', 'video', '暂无介绍', '/assets/VideoFile/videopic/v1.png', '/assets/VideoFile/videopic/v11.png', '1', '38', '1', '2018-01-01 00:00:00', null);
INSERT INTO `video` VALUES ('12', 'video', '暂无介绍', '/assets/VideoFile/videopic/v1.png', '/assets/VideoFile/videopic/v12.png', '1', '38', '1', '2018-01-01 00:00:00', null);
INSERT INTO `video` VALUES ('13', 'video', '暂无介绍', '/assets/VideoFile/videopic/v1.png', '/assets/VideoFile/videopic/v3.png', '1', '38', '1', '2018-01-01 00:00:00', null);
INSERT INTO `video` VALUES ('14', 'video', '暂无介绍', '/assets/VideoFile/videopic/v1.png', '/assets/VideoFile/videopic/v14.png', '1', '38', '1', '2018-01-01 00:00:00', null);
INSERT INTO `video` VALUES ('15', 'video', '暂无介绍', '/assets/VideoFile/videopic/v1.png', '/assets/VideoFile/videopic/v15.png', '1', '38', '1', '2018-01-01 00:00:00', null);
INSERT INTO `video` VALUES ('16', 'video', '暂无介绍', '/assets/VideoFile/videopic/v1.png', '/assets/VideoFile/videopic/v16.png', '1', '38', '1', '2018-01-01 00:00:00', null);
INSERT INTO `video` VALUES ('17', 'video', '暂无介绍', '/assets/VideoFile/videopic/v1.png', '/assets/VideoFile/videopic/v17.png', '1', '38', '1', '2018-01-01 00:00:00', null);
INSERT INTO `video` VALUES ('18', 'video', '暂无介绍', '/assets/VideoFile/videopic/v1.png', '/assets/VideoFile/videopic/v18.png', '1', '38', '1', '2018-01-01 00:00:00', null);
INSERT INTO `video` VALUES ('19', 'video', '暂无介绍', '/assets/VideoFile/videopic/v1.png', '/assets/VideoFile/videopic/v19.png', '1', '38', '1', '2018-01-01 00:00:00', null);
INSERT INTO `video` VALUES ('20', 'video', '暂无介绍', '/assets/VideoFile/videopic/v1.png', '/assets/VideoFile/videopic/v20.png', '1', '38', '1', '2018-01-01 00:00:00', null);
INSERT INTO `video` VALUES ('44', '【Alita战斗天使】预告片片段2', '詹姆斯卡梅隆新作《阿丽塔：战斗天使》2.7GB 超高码率第2支预告！\r\n由《阿凡达》团队打造！卡神力作！经典漫画《铳梦》改编！\r\n视频码率15万 音频码率2千3\r\n转自外网', '/assets/A_video/1550325385604.mp4', '/assets/A_picture/1550325385604.png', '2', '38', null, '2019-02-16 21:56:25', null);
INSERT INTO `video` VALUES ('45', '【Alita战斗天使】预告片片段3', '詹姆斯卡梅隆新作《阿丽塔：战斗天使》2.7GB 超高码率第2支预告！\r\n由《阿凡达》团队打造！卡神力作！经典漫画《铳梦》改编！\r\n视频码率15万 音频码率2千3\r\n转自外网', '/assets/A_video/1550325564441.mp4', '/assets/A_picture/1550325564441.png', '2', '38', null, '2019-02-16 21:59:24', null);
INSERT INTO `video` VALUES ('46', '【Alita战斗天使】预告片片段4', '詹姆斯卡梅隆新作《阿丽塔：战斗天使》2.7GB 超高码率第2支预告！\r\n由《阿凡达》团队打造！卡神力作！经典漫画《铳梦》改编！\r\n视频码率15万 音频码率2千3', '/assets/A_video/1550398331904.mp4', '/assets/A_picture/1550398331904.png', '2', '38', null, '2019-02-17 18:12:11', null);
INSERT INTO `video` VALUES ('47', '【Alita战斗天使】预告片片段5', '詹姆斯卡梅隆新作《阿丽塔：战斗天使》2.7GB 超高码率第2支预告！\r\n由《阿凡达》团队打造！卡神力作！经典漫画《铳梦》改编！\r\n视频码率15万 音频码率2千3', '/assets/A_video/1550398402340.mp4', '/assets/A_picture/1550398402340.png', '2', '38', null, '2019-02-17 18:13:22', null);
INSERT INTO `video` VALUES ('48', '【Alita战斗天使】预告片片段6', '詹姆斯卡梅隆新作《阿丽塔：战斗天使》2.7GB 超高码率第2支预告！\r\n由《阿凡达》团队打造！卡神力作！经典漫画《铳梦》改编！\r\n视频码率15万 音频码率2千3', '/assets/A_video/1550398703279.mp4', '/assets/A_picture/1550398703279.png', '2', '38', null, '2019-02-17 18:18:23', null);
INSERT INTO `video` VALUES ('50', '【Alita战斗天使】预告片片段7', '詹姆斯卡梅隆新作《阿丽塔：战斗天使》2.7GB 超高码率第2支预告！\r\n由《阿凡达》团队打造！卡神力作！经典漫画《铳梦》改编！\r\n视频码率15万 音频码率2千3', '/assets/A_video/1550399500645.mp4', '/A_picture/1550399500645.png', '2', '38', null, '2019-02-17 18:31:40', null);

-- ----------------------------
-- Table structure for `viewpager`
-- ----------------------------
DROP TABLE IF EXISTS `viewpager`;
CREATE TABLE `viewpager` (
  `viewId` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `groupid` int(11) DEFAULT NULL,
  `groupname` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`viewId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of viewpager
-- ----------------------------
