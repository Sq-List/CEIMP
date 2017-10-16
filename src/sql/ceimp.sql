/*
Navicat MySQL Data Transfer

Source Server         : weige
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : ceimp

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-10-16 17:28:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `award`
-- ----------------------------
DROP TABLE IF EXISTS `award`;
CREATE TABLE `award` (
  `award_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `scholarship_id` int(20) NOT NULL,
  `year_scope` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`award_id`),
  UNIQUE KEY `award_id` (`award_id`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `scholarship_id` (`scholarship_id`),
  CONSTRAINT `award_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `award_ibfk_2` FOREIGN KEY (`scholarship_id`) REFERENCES `scholarship` (`scholarship_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of award
-- ----------------------------
INSERT INTO `award` VALUES ('1', '1150299070', '1', '2017', '1502972891');
INSERT INTO `award` VALUES ('2', '1150299070', '2', '2017', '1502972891');
INSERT INTO `award` VALUES ('3', '1150299071', '3', '2017', '1502972891');
INSERT INTO `award` VALUES ('4', '1150299234', '1', '2017', '1502972891');
INSERT INTO `award` VALUES ('5', '1150299234', '3', '2017', '1502972891');
INSERT INTO `award` VALUES ('6', '1150299256', '2', '2017', '1502972891');

-- ----------------------------
-- Table structure for `award_level`
-- ----------------------------
DROP TABLE IF EXISTS `award_level`;
CREATE TABLE `award_level` (
  `level_id` int(20) NOT NULL AUTO_INCREMENT,
  `level` varchar(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`level_id`),
  UNIQUE KEY `level_id` (`level_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of award_level
-- ----------------------------
INSERT INTO `award_level` VALUES ('1', '特等奖', '1502973081');
INSERT INTO `award_level` VALUES ('2', '一等奖', '1502973081');
INSERT INTO `award_level` VALUES ('3', '二等奖', '1502973081');
INSERT INTO `award_level` VALUES ('4', '三等奖', '1502973081');
INSERT INTO `award_level` VALUES ('5', '参赛奖', '1502973081');

-- ----------------------------
-- Table structure for `basic_input`
-- ----------------------------
DROP TABLE IF EXISTS `basic_input`;
CREATE TABLE `basic_input` (
  `input_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `point_id` int(20) DEFAULT NULL,
  `evidence` varchar(500) DEFAULT NULL,
  `times` int(20) DEFAULT NULL,
  `subjective_score` double DEFAULT NULL,
  `addition` varchar(500) DEFAULT NULL,
  `year_scope` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`input_id`),
  UNIQUE KEY `input_id` (`input_id`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `point_id` (`point_id`),
  CONSTRAINT `basic_input_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `basic_input_ibfk_2` FOREIGN KEY (`point_id`) REFERENCES `evaluation_point` (`point_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basic_input
-- ----------------------------

-- ----------------------------
-- Table structure for `classes`
-- ----------------------------
DROP TABLE IF EXISTS `classes`;
CREATE TABLE `classes` (
  `class_id` int(20) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(100) NOT NULL,
  `class_num` int(20) NOT NULL,
  `school_id` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`class_id`),
  UNIQUE KEY `class_id` (`class_id`) USING BTREE,
  KEY `school_id` (`school_id`),
  CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classes
-- ----------------------------
INSERT INTO `classes` VALUES ('1', '软件工程', '151', '1', '1502971893');
INSERT INTO `classes` VALUES ('2', '软件工程', '152', '1', '1502971893');
INSERT INTO `classes` VALUES ('3', '通信工程', '151', '1', '1502971893');
INSERT INTO `classes` VALUES ('4', '应用物理学', '151', '2', '1502971893');

-- ----------------------------
-- Table structure for `class_manager`
-- ----------------------------
DROP TABLE IF EXISTS `class_manager`;
CREATE TABLE `class_manager` (
  `class_manager_id` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `class_id` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`class_manager_id`),
  UNIQUE KEY `class_manager_id` (`class_manager_id`) USING BTREE,
  KEY `class_id` (`class_id`),
  CONSTRAINT `class_manager_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class_manager
-- ----------------------------
INSERT INTO `class_manager` VALUES ('1150299234', 'UsaeOlczEIGCMzHE5p0/Lg==', '1', '1502972250');
INSERT INTO `class_manager` VALUES ('1150299256', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '1502972250');

-- ----------------------------
-- Table structure for `class_score`
-- ----------------------------
DROP TABLE IF EXISTS `class_score`;
CREATE TABLE `class_score` (
  `class_score_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `class_id` int(20) NOT NULL,
  `score` double NOT NULL,
  `year_scope` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`class_score_id`),
  UNIQUE KEY `class_score_id` (`class_score_id`) USING BTREE,
  KEY `class_id` (`class_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `class_score_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `evaluation_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `class_score_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class_score
-- ----------------------------

-- ----------------------------
-- Table structure for `competition`
-- ----------------------------
DROP TABLE IF EXISTS `competition`;
CREATE TABLE `competition` (
  `competition_id` int(20) NOT NULL AUTO_INCREMENT,
  `type` int(20) NOT NULL,
  `competition_name` varchar(100) NOT NULL,
  `school_id` int(20) NOT NULL,
  `competition_level_id` int(20) NOT NULL,
  `competition_type_id` int(20) NOT NULL,
  `is_group` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`competition_id`),
  UNIQUE KEY `competition_id` (`competition_id`) USING BTREE,
  KEY `school_id` (`school_id`),
  KEY `competition_level_id` (`competition_level_id`),
  KEY `competition_type_id` (`competition_type_id`),
  CONSTRAINT `competition_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `competition_ibfk_2` FOREIGN KEY (`competition_level_id`) REFERENCES `competition_level` (`level_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `competition_ibfk_3` FOREIGN KEY (`competition_type_id`) REFERENCES `competition_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competition
-- ----------------------------

-- ----------------------------
-- Table structure for `competition_group`
-- ----------------------------
DROP TABLE IF EXISTS `competition_group`;
CREATE TABLE `competition_group` (
  `rank_id` int(20) NOT NULL AUTO_INCREMENT,
  `rank` varchar(20) NOT NULL,
  `percent` double NOT NULL,
  `school_id` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`rank_id`),
  UNIQUE KEY `rank_id` (`rank_id`) USING BTREE,
  KEY `school_id` (`school_id`),
  CONSTRAINT `competition_group_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competition_group
-- ----------------------------

-- ----------------------------
-- Table structure for `competition_input`
-- ----------------------------
DROP TABLE IF EXISTS `competition_input`;
CREATE TABLE `competition_input` (
  `input_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `competition_id` int(20) DEFAULT NULL,
  `competition_level_id` int(20) NOT NULL,
  `competition_type_id` int(20) NOT NULL,
  `award_level_id` int(20) NOT NULL,
  `is_relevant` int(20) NOT NULL,
  `is_group` int(20) NOT NULL,
  `rank_id` int(20) DEFAULT NULL,
  `evidence` varchar(500) DEFAULT NULL,
  `addition_competition` varchar(100) DEFAULT NULL,
  `year_scope` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`input_id`),
  UNIQUE KEY `input_id` (`input_id`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `competition_id` (`competition_id`),
  KEY `competition_type_id` (`competition_type_id`),
  KEY `competition_level_id` (`competition_level_id`),
  KEY `award_level_id` (`award_level_id`),
  KEY `rank_id` (`rank_id`),
  CONSTRAINT `competition_input_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `competition_input_ibfk_2` FOREIGN KEY (`competition_id`) REFERENCES `competition` (`competition_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `competition_input_ibfk_3` FOREIGN KEY (`competition_type_id`) REFERENCES `competition_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `competition_input_ibfk_4` FOREIGN KEY (`competition_level_id`) REFERENCES `competition_level` (`level_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `competition_input_ibfk_5` FOREIGN KEY (`award_level_id`) REFERENCES `award_level` (`level_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `competition_input_ibfk_6` FOREIGN KEY (`rank_id`) REFERENCES `competition_group` (`rank_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competition_input
-- ----------------------------

-- ----------------------------
-- Table structure for `competition_level`
-- ----------------------------
DROP TABLE IF EXISTS `competition_level`;
CREATE TABLE `competition_level` (
  `level_id` int(20) NOT NULL AUTO_INCREMENT,
  `level` varchar(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`level_id`),
  UNIQUE KEY `level_id` (`level_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competition_level
-- ----------------------------
INSERT INTO `competition_level` VALUES ('1', '国家级', '1502973318');
INSERT INTO `competition_level` VALUES ('2', '省级', '1502973318');
INSERT INTO `competition_level` VALUES ('3', '市级', '1502973318');
INSERT INTO `competition_level` VALUES ('4', '校级', '1502973318');
INSERT INTO `competition_level` VALUES ('5', '院级', '1502973318');

-- ----------------------------
-- Table structure for `competition_score`
-- ----------------------------
DROP TABLE IF EXISTS `competition_score`;
CREATE TABLE `competition_score` (
  `score_id` int(20) NOT NULL AUTO_INCREMENT,
  `type` int(20) NOT NULL,
  `competition_level_id` int(20) NOT NULL,
  `award_level_id` int(20) NOT NULL,
  `score` double NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`score_id`),
  UNIQUE KEY `score_id` (`score_id`) USING BTREE,
  KEY `competition_level_id` (`competition_level_id`),
  KEY `award_level_id` (`award_level_id`),
  CONSTRAINT `competition_score_ibfk_1` FOREIGN KEY (`competition_level_id`) REFERENCES `competition_level` (`level_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `competition_score_ibfk_2` FOREIGN KEY (`award_level_id`) REFERENCES `award_level` (`level_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competition_score
-- ----------------------------

-- ----------------------------
-- Table structure for `competition_type`
-- ----------------------------
DROP TABLE IF EXISTS `competition_type`;
CREATE TABLE `competition_type` (
  `type_id` int(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `percent` double NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_id` (`type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of competition_type
-- ----------------------------
INSERT INTO `competition_type` VALUES ('1', 'A', '1', '1502973241');
INSERT INTO `competition_type` VALUES ('2', 'B', '0.7', '1502973242');
INSERT INTO `competition_type` VALUES ('3', 'C', '0.5', '1502973242');

-- ----------------------------
-- Table structure for `evaluation_class`
-- ----------------------------
DROP TABLE IF EXISTS `evaluation_class`;
CREATE TABLE `evaluation_class` (
  `class_id` int(20) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(100) NOT NULL,
  `form_id` int(20) NOT NULL,
  `content` varchar(500) DEFAULT NULL,
  `weight` double NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`class_id`),
  UNIQUE KEY `class_id` (`class_id`) USING BTREE,
  KEY `form_id` (`form_id`),
  CONSTRAINT `evaluation_class_ibfk_1` FOREIGN KEY (`form_id`) REFERENCES `evaluation_form` (`form_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation_class
-- ----------------------------

-- ----------------------------
-- Table structure for `evaluation_form`
-- ----------------------------
DROP TABLE IF EXISTS `evaluation_form`;
CREATE TABLE `evaluation_form` (
  `form_id` int(20) NOT NULL AUTO_INCREMENT,
  `form_name` varchar(100) NOT NULL,
  `content` varchar(500) DEFAULT NULL,
  `publishing_unit` varchar(20) DEFAULT NULL,
  `school_id` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`form_id`),
  UNIQUE KEY `form_id` (`form_id`) USING BTREE,
  KEY `school_id` (`school_id`),
  CONSTRAINT `evaluation_form_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation_form
-- ----------------------------

-- ----------------------------
-- Table structure for `evaluation_item`
-- ----------------------------
DROP TABLE IF EXISTS `evaluation_item`;
CREATE TABLE `evaluation_item` (
  `item_id` int(20) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL,
  `class_id` int(20) NOT NULL,
  `max_score` double NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_id` (`item_id`) USING BTREE,
  KEY `class_id` (`class_id`),
  CONSTRAINT `evaluation_item_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `evaluation_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation_item
-- ----------------------------

-- ----------------------------
-- Table structure for `evaluation_point`
-- ----------------------------
DROP TABLE IF EXISTS `evaluation_point`;
CREATE TABLE `evaluation_point` (
  `point_id` int(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `score` double NOT NULL,
  `item_id` int(20) NOT NULL,
  `calculate_type` int(20) NOT NULL,
  `input_type` int(20) NOT NULL,
  `fill_in_type_id` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`point_id`),
  UNIQUE KEY `point_id` (`point_id`) USING BTREE,
  KEY `item_id` (`item_id`),
  KEY `fill_in_type_id` (`fill_in_type_id`),
  CONSTRAINT `evaluation_point_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `evaluation_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `evaluation_point_ibfk_2` FOREIGN KEY (`fill_in_type_id`) REFERENCES `fill_in_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of evaluation_point
-- ----------------------------

-- ----------------------------
-- Table structure for `fill_in_type`
-- ----------------------------
DROP TABLE IF EXISTS `fill_in_type`;
CREATE TABLE `fill_in_type` (
  `type_id` int(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_id` (`type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fill_in_type
-- ----------------------------
INSERT INTO `fill_in_type` VALUES ('1', '单行文本', '1502972632');
INSERT INTO `fill_in_type` VALUES ('2', '多行文本', '1502972633');

-- ----------------------------
-- Table structure for `import_item`
-- ----------------------------
DROP TABLE IF EXISTS `import_item`;
CREATE TABLE `import_item` (
  `import_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `exam_fail` int(20) DEFAULT NULL,
  `make_up` int(20) DEFAULT NULL,
  `cet4` double DEFAULT NULL,
  `pe` double DEFAULT NULL,
  `gpa` double DEFAULT NULL,
  `year_scope` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`import_id`),
  UNIQUE KEY `import_id` (`import_id`) USING BTREE,
  KEY `user_id` (`user_id`),
  CONSTRAINT `import_item_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of import_item
-- ----------------------------
INSERT INTO `import_item` VALUES ('1', '1150299070', '0', '0', '1', '90', '3.4', '2017', '1502979974');
INSERT INTO `import_item` VALUES ('2', '1150299071', '0', '0', '1', '83', '2.8', '2017', '1502979974');
INSERT INTO `import_item` VALUES ('4', '1150299234', '0', '0', '1', '82', '3.3', '2017', '1502979974');
INSERT INTO `import_item` VALUES ('5', '1150299256', '0', '0', '1', '80', '3.1', '2017', '1502979974');

-- ----------------------------
-- Table structure for `innovation`
-- ----------------------------
DROP TABLE IF EXISTS `innovation`;
CREATE TABLE `innovation` (
  `innovation_id` int(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(100) NOT NULL,
  `type` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`innovation_id`),
  UNIQUE KEY `innovation_id` (`innovation_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of innovation
-- ----------------------------

-- ----------------------------
-- Table structure for `innovation_input`
-- ----------------------------
DROP TABLE IF EXISTS `innovation_input`;
CREATE TABLE `innovation_input` (
  `input_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `innovation_id` int(20) NOT NULL,
  `content` varchar(500) NOT NULL,
  `level_id` int(20) NOT NULL,
  `require_id` int(20) NOT NULL,
  `evidence` varchar(500) DEFAULT NULL,
  `year_scope` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`input_id`),
  UNIQUE KEY `input_id` (`input_id`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `innovation_id` (`innovation_id`),
  KEY `level_id` (`level_id`),
  KEY `require_id` (`require_id`),
  CONSTRAINT `innovation_input_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `innovation_input_ibfk_2` FOREIGN KEY (`innovation_id`) REFERENCES `innovation` (`innovation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `innovation_input_ibfk_3` FOREIGN KEY (`level_id`) REFERENCES `innovation_level` (`level_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `innovation_input_ibfk_4` FOREIGN KEY (`require_id`) REFERENCES `innovation_require` (`require_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of innovation_input
-- ----------------------------

-- ----------------------------
-- Table structure for `innovation_level`
-- ----------------------------
DROP TABLE IF EXISTS `innovation_level`;
CREATE TABLE `innovation_level` (
  `level_id` int(20) NOT NULL AUTO_INCREMENT,
  `level` varchar(100) NOT NULL,
  `innovation_id` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`level_id`),
  UNIQUE KEY `level_id` (`level_id`) USING BTREE,
  KEY `innovation_id` (`innovation_id`),
  CONSTRAINT `innovation_level_ibfk_1` FOREIGN KEY (`innovation_id`) REFERENCES `innovation` (`innovation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of innovation_level
-- ----------------------------

-- ----------------------------
-- Table structure for `innovation_require`
-- ----------------------------
DROP TABLE IF EXISTS `innovation_require`;
CREATE TABLE `innovation_require` (
  `require_id` int(20) NOT NULL AUTO_INCREMENT,
  `require` varchar(100) NOT NULL,
  `innovation_id` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`require_id`),
  UNIQUE KEY `require_id` (`require_id`) USING BTREE,
  KEY `innovation_id` (`innovation_id`),
  CONSTRAINT `innovation_require_ibfk_1` FOREIGN KEY (`innovation_id`) REFERENCES `innovation` (`innovation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of innovation_require
-- ----------------------------

-- ----------------------------
-- Table structure for `innovation_score`
-- ----------------------------
DROP TABLE IF EXISTS `innovation_score`;
CREATE TABLE `innovation_score` (
  `score_id` int(20) NOT NULL AUTO_INCREMENT,
  `level_id` int(20) NOT NULL,
  `require_id` int(20) NOT NULL,
  `score` double NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`score_id`),
  UNIQUE KEY `score_id` (`score_id`) USING BTREE,
  KEY `level_id` (`level_id`),
  KEY `require_id` (`require_id`),
  CONSTRAINT `innovation_score_ibfk_1` FOREIGN KEY (`level_id`) REFERENCES `innovation_level` (`level_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `innovation_score_ibfk_2` FOREIGN KEY (`require_id`) REFERENCES `innovation_require` (`require_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of innovation_score
-- ----------------------------

-- ----------------------------
-- Table structure for `input_review`
-- ----------------------------
DROP TABLE IF EXISTS `input_review`;
CREATE TABLE `input_review` (
  `review_id` int(20) NOT NULL AUTO_INCREMENT,
  `input_id` int(20) NOT NULL,
  `input_type` int(20) NOT NULL,
  `review_status` int(20) DEFAULT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`review_id`),
  UNIQUE KEY `review_id` (`review_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of input_review
-- ----------------------------

-- ----------------------------
-- Table structure for `item_score`
-- ----------------------------
DROP TABLE IF EXISTS `item_score`;
CREATE TABLE `item_score` (
  `item_score_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `item_id` int(20) NOT NULL,
  `score` double NOT NULL,
  `year_scope` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`item_score_id`),
  UNIQUE KEY `item_score_id` (`item_score_id`) USING BTREE,
  KEY `item_id` (`item_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `item_score_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `evaluation_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `item_score_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item_score
-- ----------------------------

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `manager_id` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', '1150299070', 'Qpf0SxOVUjUkWySXOZ16kw==');
INSERT INTO `manager` VALUES ('2', '1150299303', 'Qpf0SxOVUjUkWySXOZ16kw==');
INSERT INTO `manager` VALUES ('3', 'zhouxiaoxia', 'Qpf0SxOVUjUkWySXOZ16kw==');
INSERT INTO `manager` VALUES ('4', 'lvbingbing', 'Qpf0SxOVUjUkWySXOZ16kw==');

-- ----------------------------
-- Table structure for `nationalinspirationalscholarship`
-- ----------------------------
DROP TABLE IF EXISTS `nationalinspirationalscholarship`;
CREATE TABLE `nationalinspirationalscholarship` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) NOT NULL,
  `date1` varchar(20) DEFAULT NULL,
  `award1` varchar(40) DEFAULT NULL,
  `unit1` varchar(20) DEFAULT NULL,
  `date2` varchar(20) DEFAULT NULL,
  `award2` varchar(40) DEFAULT NULL,
  `unit2` varchar(20) DEFAULT NULL,
  `date3` varchar(20) DEFAULT NULL,
  `award3` varchar(40) DEFAULT NULL,
  `unit3` varchar(20) DEFAULT NULL,
  `date4` varchar(20) DEFAULT NULL,
  `award4` varchar(40) DEFAULT NULL,
  `unit4` varchar(20) DEFAULT NULL,
  `resident` varchar(20) DEFAULT NULL,
  `incomeSource` varchar(40) DEFAULT NULL,
  `monthIncome` varchar(20) DEFAULT NULL,
  `familySum` varchar(20) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `postalCode` varchar(20) DEFAULT NULL,
  `situation` varchar(20) DEFAULT NULL,
  `applyReason` varchar(600) DEFAULT NULL,
  `opinion` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`id`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nationalinspirationalscholarship
-- ----------------------------

-- ----------------------------
-- Table structure for `provincialgovernmentscholarship`
-- ----------------------------
DROP TABLE IF EXISTS `provincialgovernmentscholarship`;
CREATE TABLE `provincialgovernmentscholarship` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) NOT NULL,
  `date1` varchar(20) DEFAULT NULL,
  `award1` varchar(40) DEFAULT NULL,
  `unit1` varchar(20) DEFAULT NULL,
  `date2` varchar(20) DEFAULT NULL,
  `award2` varchar(40) DEFAULT NULL,
  `unit2` varchar(20) DEFAULT NULL,
  `date3` varchar(20) DEFAULT NULL,
  `award3` varchar(40) DEFAULT NULL,
  `unit3` varchar(20) DEFAULT NULL,
  `date4` varchar(20) DEFAULT NULL,
  `award4` varchar(40) DEFAULT NULL,
  `unit4` varchar(20) DEFAULT NULL,
  `applyReason` varchar(600) DEFAULT NULL,
  `recommendReason` varchar(600) DEFAULT NULL,
  `opinion` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`id`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of provincialgovernmentscholarship
-- ----------------------------

-- ----------------------------
-- Table structure for `review_status`
-- ----------------------------
DROP TABLE IF EXISTS `review_status`;
CREATE TABLE `review_status` (
  `status_id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `review_type_id` int(20) NOT NULL,
  `status` int(20) DEFAULT NULL,
  `year_scope` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `status_id` (`status_id`) USING BTREE,
  KEY `user_id` (`user_id`),
  KEY `review_type_id` (`review_type_id`),
  CONSTRAINT `review_status_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `review_status_ibfk_2` FOREIGN KEY (`review_type_id`) REFERENCES `review_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review_status
-- ----------------------------

-- ----------------------------
-- Table structure for `review_time`
-- ----------------------------
DROP TABLE IF EXISTS `review_time`;
CREATE TABLE `review_time` (
  `review_time_id` int(20) NOT NULL AUTO_INCREMENT,
  `review_start` bigint(20) NOT NULL,
  `review_end` bigint(20) NOT NULL,
  `review_type_id` int(20) NOT NULL,
  `year_scope` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`review_time_id`),
  UNIQUE KEY `review_time_id` (`review_time_id`) USING BTREE,
  KEY `review_type_id` (`review_type_id`),
  CONSTRAINT `review_time_ibfk_1` FOREIGN KEY (`review_type_id`) REFERENCES `review_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review_time
-- ----------------------------
INSERT INTO `review_time` VALUES ('1', '1509465600', '1510243200', '1', '2017', '1502980259');
INSERT INTO `review_time` VALUES ('2', '1510329600', '1511107200', '2', '2017', '1502980328');
INSERT INTO `review_time` VALUES ('3', '1511193600', '1511971200', '3', '2017', '1502980329');

-- ----------------------------
-- Table structure for `review_type`
-- ----------------------------
DROP TABLE IF EXISTS `review_type`;
CREATE TABLE `review_type` (
  `type_id` int(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `type_id` (`type_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of review_type
-- ----------------------------
INSERT INTO `review_type` VALUES ('1', '一审', '1502973010');
INSERT INTO `review_type` VALUES ('2', '二审', '1502973011');
INSERT INTO `review_type` VALUES ('3', '三审', '1502973011');

-- ----------------------------
-- Table structure for `scholarship`
-- ----------------------------
DROP TABLE IF EXISTS `scholarship`;
CREATE TABLE `scholarship` (
  `scholarship_id` int(20) NOT NULL AUTO_INCREMENT,
  `scholarship_name` varchar(100) NOT NULL,
  `model_name` varchar(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`scholarship_id`),
  UNIQUE KEY `scholarship_id` (`scholarship_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scholarship
-- ----------------------------
INSERT INTO `scholarship` VALUES ('1', '省政府奖学金', '省政府模板', '1502972347');
INSERT INTO `scholarship` VALUES ('2', '国家奖学金', '国家模板', '1502972347');
INSERT INTO `scholarship` VALUES ('3', '校奖学金', '校模板', '1502972347');

-- ----------------------------
-- Table structure for `scholarship_block`
-- ----------------------------
DROP TABLE IF EXISTS `scholarship_block`;
CREATE TABLE `scholarship_block` (
  `scholarship_block_id` int(20) NOT NULL AUTO_INCREMENT,
  `scholarship_block_name` varchar(100) NOT NULL,
  `scholarship_id` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`scholarship_block_id`),
  UNIQUE KEY `scholarship_block_id` (`scholarship_block_id`) USING BTREE,
  KEY `scholarship_id` (`scholarship_id`),
  CONSTRAINT `scholarship_block_ibfk_1` FOREIGN KEY (`scholarship_id`) REFERENCES `scholarship` (`scholarship_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scholarship_block
-- ----------------------------
INSERT INTO `scholarship_block` VALUES ('1', '个人基本信息', '1', '1502972550');
INSERT INTO `scholarship_block` VALUES ('2', '学习情况', '1', '1502972550');
INSERT INTO `scholarship_block` VALUES ('3', '大学期间主要获奖情况', '1', '1502972550');
INSERT INTO `scholarship_block` VALUES ('4', '推荐理由', '1', '1502972550');
INSERT INTO `scholarship_block` VALUES ('5', '院系意见', '1', '1502972550');
INSERT INTO `scholarship_block` VALUES ('6', '学生信息', '2', '1502972550');

-- ----------------------------
-- Table structure for `scholarship_item`
-- ----------------------------
DROP TABLE IF EXISTS `scholarship_item`;
CREATE TABLE `scholarship_item` (
  `scholarship_item_id` int(20) NOT NULL AUTO_INCREMENT,
  `scholarship_item_name` varchar(100) NOT NULL,
  `scholarship_block_id` int(20) NOT NULL,
  `fill_in_type_id` int(20) NOT NULL,
  `fill_in_hint` varchar(100) DEFAULT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`scholarship_item_id`),
  UNIQUE KEY `scholarship_item_id` (`scholarship_item_id`) USING BTREE,
  KEY `scholarship_block_id` (`scholarship_block_id`),
  KEY `fill_in_type_id` (`fill_in_type_id`),
  CONSTRAINT `scholarship_item_ibfk_1` FOREIGN KEY (`scholarship_block_id`) REFERENCES `scholarship_block` (`scholarship_block_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `scholarship_item_ibfk_2` FOREIGN KEY (`fill_in_type_id`) REFERENCES `fill_in_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scholarship_item
-- ----------------------------
INSERT INTO `scholarship_item` VALUES ('1', '学校', '1', '1', '', '1502972799');
INSERT INTO `scholarship_item` VALUES ('2', '院系', '1', '1', '就读学院', '1502972799');
INSERT INTO `scholarship_item` VALUES ('3', '成绩排名', '2', '1', '名次/总人数', '1502972799');
INSERT INTO `scholarship_item` VALUES ('4', '日期', '3', '1', '', '1502972799');
INSERT INTO `scholarship_item` VALUES ('5', '推荐理由', '4', '2', '', '1502972799');
INSERT INTO `scholarship_item` VALUES ('6', '院系意见', '5', '2', '', '1502972799');
INSERT INTO `scholarship_item` VALUES ('7', '学号', '6', '1', '', '1502972799');

-- ----------------------------
-- Table structure for `scholarship_percent`
-- ----------------------------
DROP TABLE IF EXISTS `scholarship_percent`;
CREATE TABLE `scholarship_percent` (
  `percent_id` int(20) NOT NULL AUTO_INCREMENT,
  `scholarship_id` int(20) NOT NULL,
  `level` varchar(20) DEFAULT NULL,
  `percent` double NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`percent_id`),
  UNIQUE KEY `percent_id` (`percent_id`) USING BTREE,
  KEY `scholarship_id` (`scholarship_id`),
  CONSTRAINT `scholarship_percent_ibfk_1` FOREIGN KEY (`scholarship_id`) REFERENCES `scholarship` (`scholarship_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scholarship_percent
-- ----------------------------
INSERT INTO `scholarship_percent` VALUES ('1', '1', null, '0.04', '1502972347');
INSERT INTO `scholarship_percent` VALUES ('2', '2', null, '0.03', '1502972347');
INSERT INTO `scholarship_percent` VALUES ('3', '3', '一等奖', '0.02', '1502972347');
INSERT INTO `scholarship_percent` VALUES ('4', '3', '二等奖', '0.03', '1502972347');
INSERT INTO `scholarship_percent` VALUES ('5', '3', '三等奖', '0.05', '1502972347');

-- ----------------------------
-- Table structure for `school`
-- ----------------------------
DROP TABLE IF EXISTS `school`;
CREATE TABLE `school` (
  `school_id` int(20) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(100) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`school_id`),
  UNIQUE KEY `school_id` (`school_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of school
-- ----------------------------
INSERT INTO `school` VALUES ('1', '信息与电子工程学院', '1502971810');
INSERT INTO `school` VALUES ('2', '理学院', '1502971810');

-- ----------------------------
-- Table structure for `schoolscholarship`
-- ----------------------------
DROP TABLE IF EXISTS `schoolscholarship`;
CREATE TABLE `schoolscholarship` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) DEFAULT NULL,
  `level` varchar(20) DEFAULT NULL,
  `reason` varchar(600) DEFAULT NULL,
  `opinion` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schoolscholarship
-- ----------------------------

-- ----------------------------
-- Table structure for `school_manager`
-- ----------------------------
DROP TABLE IF EXISTS `school_manager`;
CREATE TABLE `school_manager` (
  `school_manager_id` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `school_id` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`school_manager_id`),
  UNIQUE KEY `school_manager_id` (`school_manager_id`) USING BTREE,
  KEY `school_id` (`school_id`),
  CONSTRAINT `school_manager_ibfk_1` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of school_manager
-- ----------------------------
INSERT INTO `school_manager` VALUES ('1150299070', 'ZTLcLq+BaR2y9kFF0eCBzw==', '1', '1502972169');
INSERT INTO `school_manager` VALUES ('1150299072', 'ISGMyneATSuhkiwz4BURBQ==', '2', '1502972169');

-- ----------------------------
-- Table structure for `tripleastudent`
-- ----------------------------
DROP TABLE IF EXISTS `tripleastudent`;
CREATE TABLE `tripleastudent` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `userId` varchar(20) NOT NULL DEFAULT '',
  `reason` varchar(600) DEFAULT NULL,
  `opinion` varchar(600) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tripleastudent
-- ----------------------------

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `class_id` int(20) NOT NULL,
  `create_time` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`) USING BTREE,
  KEY `class_id` (`class_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1150299070', '陈伟', 'ZTLcLq+BaR2y9kFF0eCBzw==', '1', '1502972050');
INSERT INTO `users` VALUES ('1150299071', '张三', '83nq88gxsE3hU0adG+w0Xg==', '3', '1502972051');
INSERT INTO `users` VALUES ('1150299072', '李四', 'ISGMyneATSuhkiwz4BURBQ==', '4', '1502972051');
INSERT INTO `users` VALUES ('1150299234', '林创伟', 'UsaeOlczEIGCMzHE5p0/Lg==', '1', '1502972050');
INSERT INTO `users` VALUES ('1150299256', '蔡靖楠', '4QrcOUm6Wau+VuBX8g+IPg==', '2', '1502972050');

-- ----------------------------
-- Table structure for `userss`
-- ----------------------------
DROP TABLE IF EXISTS `userss`;
CREATE TABLE `userss` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL DEFAULT '888888',
  `is_changed_password` int(20) DEFAULT '0',
  `username` varchar(20) DEFAULT NULL,
  `major` varchar(20) DEFAULT NULL,
  `class_id` varchar(20) DEFAULT NULL,
  `major_sum` varchar(20) DEFAULT NULL,
  `character` varchar(20) DEFAULT NULL,
  `study` varchar(20) DEFAULT NULL,
  `ability` varchar(20) DEFAULT NULL,
  `all` varchar(20) DEFAULT NULL,
  `gp` varchar(20) DEFAULT NULL,
  `ce` varchar(20) DEFAULT NULL,
  `sex` varchar(20) DEFAULT NULL,
  `birth` varchar(20) DEFAULT NULL,
  `nation` varchar(20) DEFAULT NULL,
  `entrance` varchar(20) DEFAULT NULL,
  `political` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `identity` varchar(20) DEFAULT NULL,
  `pass_sum` varchar(20) DEFAULT NULL,
  `sub_sum` varchar(20) DEFAULT NULL,
  `job` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`user_id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  UNIQUE KEY `userId` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userss
-- ----------------------------
INSERT INTO `userss` VALUES ('1', '1150299174', 'ISGMyneATSuhkiwz4BURBQ==', '0', '马庆', '电子信息工程', '151', '59', '12.15', '57.19', '0.3', '69.64', '2', '5', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('2', '1150299388', 'ISGMyneATSuhkiwz4BURBQ==', '0', '龙杰', '电子信息工程', '152', '59', '14.1', '55.23', '2.1', '71.43', '6', '3', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('3', '1150299254', 'ISGMyneATSuhkiwz4BURBQ==', '0', '徐欣怡', '电子信息工程', '152', '59', '14.1', '53.97', '6.825', '74.895', '8', '1', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('4', '1150299336', 'ISGMyneATSuhkiwz4BURBQ==', '0', '谢俊杰', '电子信息工程', '152', '59', '13.5', '50.4', '3', '66.9', '20', '11', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('5', '1150299068', 'ISGMyneATSuhkiwz4BURBQ==', '0', '向莹', '计算机科学与技术', '151', '101', '14.7', '59.22', '6.225', '80.145', '7', '3', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('6', '1150299049', 'ISGMyneATSuhkiwz4BURBQ==', '0', '王俊波', '计算机科学与技术', '151', '101', '13.65', '60.48', '5.34', '79.47', '3', '4', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('7', '1150299031', 'ISGMyneATSuhkiwz4BURBQ==', '0', '朱佳超', '计算机科学与技术', '151', '101', '13.65', '59.57', '3.3', '76.52', '5', '11', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('8', '1150299102', 'ISGMyneATSuhkiwz4BURBQ==', '0', '程思远', '计算机科学与技术', '151', '101', '13.8', '58.87', '3.525', '76.195', '9', '12', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('9', '1150299112', 'ISGMyneATSuhkiwz4BURBQ==', '0', '林炜哲', '计算机科学与技术', '151', '101', '12.9', '59.01', '3.6', '75.51', '8', '13', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('10', '1150299005', 'ISGMyneATSuhkiwz4BURBQ==', '0', '张梦颖', '计算机科学与技术', '151', '101', '13.95', '57.96', '2.325', '74.235', '15', '18', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('11', '1150299108', 'ISGMyneATSuhkiwz4BURBQ==', '0', '金柏哲', '计算机科学与技术', '151', '101', '12.9', '58.52', '1.65', '73.07', '10', '21', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('12', '1150299110', 'ISGMyneATSuhkiwz4BURBQ==', '0', '廖鹏', '计算机科学与技术', '151', '101', '13.8', '56.35', '9.15', '79.3', '26', '5', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('13', '1150299106', 'ISGMyneATSuhkiwz4BURBQ==', '0', '江俊', '计算机科学与技术', '151', '101', '12.75', '57.54', '2.25', '72.54', '18', '25', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('14', '1150299067', 'ISGMyneATSuhkiwz4BURBQ==', '0', '吴影', '计算机科学与技术', '151', '101', '11.85', '58.17', '0', '70.02', '13', '35', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('15', '1150299119', 'ISGMyneATSuhkiwz4BURBQ==', '0', '俞  怡', '计算机科学与技术', '152', '101', '13.8', '64.4', '8.775', '86.975', '1', '2', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('16', '1150299253', 'ISGMyneATSuhkiwz4BURBQ==', '0', '吴心怡', '计算机科学与技术', '152', '101', '13.35', '55.79', '5.325', '74.465', '31', '17', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('17', '1150299204', 'ISGMyneATSuhkiwz4BURBQ==', '0', '倪文硕', '计算机科学与技术', '152', '101', '12.6', '56.56', '3.27', '72.43', '23', '26', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('18', '1150299158', 'ISGMyneATSuhkiwz4BURBQ==', '0', '彭子恬', '计算机科学与技术', '152', '101', '12.6', '55.37', '4.785', '72.755', '36', '24', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('19', '1150299127', 'ISGMyneATSuhkiwz4BURBQ==', '0', '盛雯姝', '计算机科学与技术', '152', '101', '12.45', '54.74', '2.55', '69.74', '39', '38', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('20', '1150299241', 'ISGMyneATSuhkiwz4BURBQ==', '0', '吴文彬', '计算机科学与技术', '152', '101', '13.35', '55.44', '1.95', '70.74', '33', '32', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('21', '1150299266', 'ISGMyneATSuhkiwz4BURBQ==', '0', '罗俞建', '计算机科学与技术', '153', '101', '12.15', '54.39', '0.825', '67.365', '42', '44', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('22', '1150399100', 'ISGMyneATSuhkiwz4BURBQ==', '0', '尹子彤', '计算机科学与技术', '153', '101', '13.2', '60.27', '4.275', '77.745', '4', '7', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('23', '1150199147', 'ISGMyneATSuhkiwz4BURBQ==', '0', '张杰', '计算机科学与技术', '153', '101', '13.8', '56.91', '6.15', '76.86', '21', '10', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('24', '1150299344', 'ISGMyneATSuhkiwz4BURBQ==', '0', '高雨帆', '计算机科学与技术', '153', '101', '13.65', '56.98', '2.25', '72.88', '19', '22', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('25', '1150299282', 'ISGMyneATSuhkiwz4BURBQ==', '0', '戴文飞', '计算机科学与技术', '153', '101', '12.9', '56.14', '9.711', '78.751', '27', '6', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('26', '5151591008', 'ISGMyneATSuhkiwz4BURBQ==', '0', '楼俊超', '计算机科学与技术', '153', '101', '12.9', '55.86', '3.15', '71.91', '30', '27', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('27', '1150299261', 'ISGMyneATSuhkiwz4BURBQ==', '0', '韩康', '计算机科学与技术', '153', '101', '13.35', '54.6', '7.275', '75.225', '41', '14', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('28', '5151591001', 'ISGMyneATSuhkiwz4BURBQ==', '0', '陈瑶', '计算机科学与技术', '153', '101', '12.15', '56.77', '2.1', '71.02', '22', '31', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('29', '1150299309', 'ISGMyneATSuhkiwz4BURBQ==', '0', '章奔', '计算机科学与技术', '153', '101', '12.15', '53.27', '1.5', '66.92', '49', '46', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('30', '1150299098', 'ISGMyneATSuhkiwz4BURBQ==', '0', '严春利', '计算机科学与技术', '153', '101', '12.15', '53.06', '1.5', '66.71', '53', '47', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('31', '1150299384', 'ISGMyneATSuhkiwz4BURBQ==', '0', '黄洪杰', '计算机科学与技术', '153', '101', '12.6', '53.97', '0', '66.57', '45', '49', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('32', '1150299145', 'ISGMyneATSuhkiwz4BURBQ==', '0', '潘建锋', '计算机科学与技术', '153', '101', '13.8', '57.75', '6.15', '77.7', '16', '8', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('33', '1150299165', 'ISGMyneATSuhkiwz4BURBQ==', '0', '何华峰', '软件工程', '151', '72', '13.8', '59.71', '9.405', '82.915', '11', '4', '男', null, null, '2015年09月', null, '15068829980', null, null, null, null);
INSERT INTO `userss` VALUES ('34', '1150299072', 'ISGMyneATSuhkiwz4BURBQ==', '0', '黄栋栋', '软件工程', '151', '72', '13.95', '59.92', '7.275', '81.145', '10', '9', '男', null, null, '2015年09月', null, '15868190679', null, null, null, null);
INSERT INTO `userss` VALUES ('35', '1150299070', 'ISGMyneATSuhkiwz4BURBQ==', '0', '陈伟', '软件工程', '151', '72', '12.9', '60.55', '5.55', '79', '7', '10', '男', '', '', '2015年09月', '', '15869104199', '', '', '', '');
INSERT INTO `userss` VALUES ('36', '1150299216', 'ISGMyneATSuhkiwz4BURBQ==', '0', '征杭勇', '软件工程', '151', '72', '13.8', '61.6', '2.7', '78.1', '6', '11', '男', null, null, '2015年09月', null, '15869104051', null, null, null, null);
INSERT INTO `userss` VALUES ('37', '1150299004', 'ISGMyneATSuhkiwz4BURBQ==', '0', '史敏悦', '软件工程', '151', '72', '13.5', '61.74', '2.7', '77.94', '5', '12', '女', null, null, '2015年09月', null, '15869116017', null, null, null, null);
INSERT INTO `userss` VALUES ('38', '1150299190', 'ISGMyneATSuhkiwz4BURBQ==', '0', '顾梦佳', '软件工程', '151', '72', '13.65', '59.22', '4.05', '76.92', '15', '15', '女', null, null, '2015年09月', null, '13957541768', null, null, null, null);
INSERT INTO `userss` VALUES ('39', '1150299035', 'ISGMyneATSuhkiwz4BURBQ==', '0', '骆润贻', '软件工程', '151', '72', '13.5', '59.29', '3.9', '76.69', '13', '16', '女', null, null, '2015年09月', null, '15868174785', null, null, null, null);
INSERT INTO `userss` VALUES ('40', '1150299230', 'ISGMyneATSuhkiwz4BURBQ==', '0', '胡昊', '软件工程', '151', '72', '12.15', '57.26', '11.97', '81.38', '28', '8', '男', null, null, '2015年09月', null, '15869118561', null, null, null, null);
INSERT INTO `userss` VALUES ('41', '1150299034', 'ISGMyneATSuhkiwz4BURBQ==', '0', '何敏杰', '软件工程', '151', '72', '13.5', '56.56', '5.1', '75.16', '35', '21', '女', null, null, '2015年09月', null, '15715795931', null, null, null, null);
INSERT INTO `userss` VALUES ('42', '1150299131', 'ISGMyneATSuhkiwz4BURBQ==', '0', '陈郑强', '软件工程', '151', '72', '13.95', '57.47', '2.76', '74.18', '26', '25', '男', null, null, '2015年09月', null, '15868153583', null, null, null, null);
INSERT INTO `userss` VALUES ('43', '1150299033', 'ISGMyneATSuhkiwz4BURBQ==', '0', '陈雨佳', '软件工程', '151', '72', '12.9', '56.49', '4.26', '73.65', '36', '26', '女', null, null, '2015年09月', null, '15868166443', null, null, null, null);
INSERT INTO `userss` VALUES ('44', '1150299175', 'ISGMyneATSuhkiwz4BURBQ==', '0', '施伟泽', '软件工程', '151', '72', '13.5', '58.1', '1.8', '73.4', '22', '28', '男', null, null, '2015年09月', null, '15868143343', null, null, null, null);
INSERT INTO `userss` VALUES ('45', '1150299100', 'ISGMyneATSuhkiwz4BURBQ==', '0', '周倩倩', '软件工程', '151', '72', '12.15', '56.91', '3.27', '72.33', '33', '31', '女', null, null, '2015年09月', null, '15868116951', null, null, null, null);
INSERT INTO `userss` VALUES ('46', '1150299140', 'ISGMyneATSuhkiwz4BURBQ==', '0', '李文东', '软件工程', '151', '72', '13.5', '55.44', '2.85', '71.79', '44', '34', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('47', '1150299001', 'ISGMyneATSuhkiwz4BURBQ==', '0', '黄思怡', '软件工程', '151', '72', '13.35', '54.81', '3.3', '71.46', '49', '35', '女', null, null, '2015年09月', null, '15869105280', null, null, null, null);
INSERT INTO `userss` VALUES ('48', '1150299363', 'ISGMyneATSuhkiwz4BURBQ==', '0', '李埼耀', '软件工程', '152', '72', '14.4', '63.84', '13.11', '91.35', '1', '1', '男', null, null, '2015年09月', null, '15868171346', null, null, null, null);
INSERT INTO `userss` VALUES ('49', '1150299346', 'ISGMyneATSuhkiwz4BURBQ==', '0', '梁晓莹', '软件工程', '152', '72', '13.5', '60.13', '9.042', '82.672', '9', '6', '女', null, null, '2015年09月', null, '15868157426', null, null, null, null);
INSERT INTO `userss` VALUES ('50', '5151594017', 'ISGMyneATSuhkiwz4BURBQ==', '0', '姚一城', '软件工程', '152', '72', '13.95', '60.2', '7.41', '81.56', '8', '7', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('51', '1150299332', 'ISGMyneATSuhkiwz4BURBQ==', '0', '田泽', '软件工程', '152', '72', '14.25', '58.17', '4.542', '76.962', '21', '14', '男', null, null, '2015年09月', null, '15868176405', null, null, null, null);
INSERT INTO `userss` VALUES ('52', '1150299281', 'ISGMyneATSuhkiwz4BURBQ==', '0', '陈夏涵', '软件工程', '152', '72', '14.55', '58.94', '3', '76.49', '17', '17', '女', null, null, '2015年09月', null, '15868171694', null, null, null, null);
INSERT INTO `userss` VALUES ('53', '1150299290', 'ISGMyneATSuhkiwz4BURBQ==', '0', '陈泽炫', '软件工程', '152', '72', '13.35', '59.57', '2.4', '75.32', '12', '20', '男', null, null, '2015年09月', null, '15868133375', null, null, null, null);
INSERT INTO `userss` VALUES ('54', '1150299250', 'ISGMyneATSuhkiwz4BURBQ==', '0', '黄园园', '软件工程', '152', '72', '13.05', '57.54', '4.992', '75.582', '25', '19', '女', null, null, '2015年09月', null, '15868152791', null, null, null, null);
INSERT INTO `userss` VALUES ('55', '1150299300', 'ISGMyneATSuhkiwz4BURBQ==', '0', '盛永铭', '软件工程', '152', '72', '13.35', '58.94', '2.4', '74.69', '17', '23', '男', null, null, '2015年09月', null, '15868153654', null, null, null, null);
INSERT INTO `userss` VALUES ('56', '1150299291', 'ISGMyneATSuhkiwz4BURBQ==', '0', '范智强', '软件工程', '152', '72', '13.35', '58.03', '2.1', '73.48', '23', '27', '男', null, null, '2015年09月', null, '15869120071', null, null, null, null);
INSERT INTO `userss` VALUES ('57', '1150299260', 'ISGMyneATSuhkiwz4BURBQ==', '0', '方仲俊', '软件工程', '152', '72', '12', '57.4', '3.705', '73.105', '27', '29', '男', null, null, '2015年09月', null, '13587764999', null, null, null, null);
INSERT INTO `userss` VALUES ('58', '1150299303', 'ISGMyneATSuhkiwz4BURBQ==', '0', '孙奇', '软件工程', '152', '72', '14.4', '62.72', '11.7705', '88.8905', '2', '2', '男', '', '', '2015年09月', '', '15868162919', '', '', '', null);
INSERT INTO `userss` VALUES ('59', '1150299134', 'ISGMyneATSuhkiwz4BURBQ==', '0', '关圣凡', '数字媒体技术', '151', '83', '14.7', '61.46', '3.975', '80.135', '2', '1', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('60', '1150299063', 'ISGMyneATSuhkiwz4BURBQ==', '0', '戴淑琳', '数字媒体技术', '151', '83', '14.7', '61.39', '3.45', '79.54', '3', '2', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('61', '1150299126', 'ISGMyneATSuhkiwz4BURBQ==', '0', '林姬佤', '数字媒体技术', '151', '83', '13.95', '59.22', '4.935', '78.105', '8', '6', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('62', '1150299066', 'ISGMyneATSuhkiwz4BURBQ==', '0', '文倩', '数字媒体技术', '151', '83', '13.95', '59.43', '3.3', '76.68', '6', '7', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('63', '1150299125', 'ISGMyneATSuhkiwz4BURBQ==', '0', '陈琪', '数字媒体技术', '151', '83', '14.1', '58.52', '3.6', '76.22', '10', '8', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('64', '1150299155', 'ISGMyneATSuhkiwz4BURBQ==', '0', '周志鹏', '数字媒体技术', '151', '83', '13.95', '58.59', '2.625', '75.165', '9', '9', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('65', '1150299251', 'ISGMyneATSuhkiwz4BURBQ==', '0', '楼雪雯', '数字媒体技术', '151', '83', '13.8', '59.71', '1.5', '75.01', '5', '10', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('66', '1150299161', 'ISGMyneATSuhkiwz4BURBQ==', '0', '朱好', '数字媒体技术', '151', '83', '12.9', '57.26', '3.15', '73.31', '15', '12', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('67', '1150299221', 'ISGMyneATSuhkiwz4BURBQ==', '0', '毛亚丽', '数字媒体技术', '151', '83', '13.5', '56.42', '3.15', '73.07', '22', '14', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('68', '1150299162', 'ISGMyneATSuhkiwz4BURBQ==', '0', '陈金航', '数字媒体技术', '151', '83', '13.65', '57.26', '1.05', '71.96', '15', '17', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('69', '1150299088', 'ISGMyneATSuhkiwz4BURBQ==', '0', '严楼旭', '数字媒体技术', '151', '83', '13.35', '55.09', '3.3', '71.74', '28', '18', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('70', '1150299097', 'ISGMyneATSuhkiwz4BURBQ==', '0', '吴颖琪', '数字媒体技术', '151', '83', '13.35', '57.47', '0.75', '71.57', '14', '19', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('71', '1150299347', 'ISGMyneATSuhkiwz4BURBQ==', '0', '楼可欣', '数字媒体技术', '152', '83', '14.4', '59.29', '5.4', '79.09', '7', '3', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('72', '1150299380', 'ISGMyneATSuhkiwz4BURBQ==', '0', '张舒怡', '数字媒体技术', '152', '83', '13.5', '60.9', '4.2', '78.6', '4', '4', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('73', '1150299320', 'ISGMyneATSuhkiwz4BURBQ==', '0', '陈立', '数字媒体技术', '152', '83', '13.05', '61.88', '3.3', '78.23', '1', '5', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('74', '1150299375', 'ISGMyneATSuhkiwz4BURBQ==', '0', '杜晨晨', '数字媒体技术', '152', '83', '12.75', '56.91', '2.7', '72.36', '19', '15', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('75', '1150299283', 'ISGMyneATSuhkiwz4BURBQ==', '0', '高佳蓉', '数字媒体技术', '152', '83', '12.6', '57.61', '2.1', '72.31', '13', '16', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('76', '1150299285', 'ISGMyneATSuhkiwz4BURBQ==', '0', '王依晴', '数字媒体技术', '152', '83', '12.75', '53.27', '1.2', '67.22', '45', '42', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('77', '1150299082', 'ISGMyneATSuhkiwz4BURBQ==', '0', '施学成', '通信工程', '151', '45', '14.25', '57.47', '2.7', '74.42', '5', '2', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('78', '1150299040', 'ISGMyneATSuhkiwz4BURBQ==', '0', '陈泽华', '通信工程', '151', '45', '14.4', '57.96', '1.95', '74.31', '4', '3', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('79', '1151020047', 'ISGMyneATSuhkiwz4BURBQ==', '0', '柳一洋', '通信工程', '151', '45', '13.5', '58.66', '1.5', '73.66', '2', '4', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('80', '1150299054', 'ISGMyneATSuhkiwz4BURBQ==', '0', '吴越', '通信工程', '151', '45', '13.35', '54.95', '3.15', '71.45', '10', '7', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('81', '1150299096', 'ISGMyneATSuhkiwz4BURBQ==', '0', '钱碧云', '通信工程', '151', '45', '12.9', '54.25', '0.3', '67.45', '11', '11', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('82', '1150299099', 'ISGMyneATSuhkiwz4BURBQ==', '0', '杨紫君', '通信工程', '151', '45', '12.6', '53.9', '0.75', '67.25', '13', '12', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('83', '1150299124', 'ISGMyneATSuhkiwz4BURBQ==', '0', '诸承广', '通信工程', '151', '45', '13.5', '59.15', '2.25', '74.9', '1', '1', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('84', '1150299286', 'ISGMyneATSuhkiwz4BURBQ==', '0', '袁佳丽', '通信工程', '152', '45', '13.35', '55.02', '0.75', '69.12', '9', '8', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('85', '1150299193', 'ISGMyneATSuhkiwz4BURBQ==', '0', '邵燕喃', '通信工程', '152', '45', '12.75', '53.69', '0.75', '67.19', '14', '13', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('86', '1150299389', 'ISGMyneATSuhkiwz4BURBQ==', '0', '卢侠', '通信工程', '152', '45', '12.15', '53.97', '0.3', '66.42', '12', '15', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('87', '1150299182', 'ISGMyneATSuhkiwz4BURBQ==', '0', '叶灵杰', '物联网工程', '151', '63', '13.65', '58.59', '3', '75.24', '4', '6', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('88', '1150299051', 'ISGMyneATSuhkiwz4BURBQ==', '0', '王毅', '物联网工程', '151', '63', '14.1', '56.63', '15', '85.73', '10', '1', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('89', '1150299159', 'ISGMyneATSuhkiwz4BURBQ==', '0', '汪甫榕', '物联网工程', '151', '63', '13.2', '56.49', '6.75', '76.44', '13', '3', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('90', '1150299065', 'ISGMyneATSuhkiwz4BURBQ==', '0', '蒋嫒', '物联网工程', '151', '63', '12.6', '59.08', '3', '74.68', '2', '7', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('91', '1150299167', 'ISGMyneATSuhkiwz4BURBQ==', '0', '蒋道航', '物联网工程', '151', '63', '12.75', '54.32', '0', '67.07', '19', '22', '男', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('92', '1150580033', 'ISGMyneATSuhkiwz4BURBQ==', '0', '姜竹', '物联网工程', '152', '63', '12.9', '59.99', '3.9', '76.79', '1', '2', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('93', '1150299255', 'ISGMyneATSuhkiwz4BURBQ==', '0', '张燕婷', '物联网工程', '152', '63', '12.15', '55.09', '0.75', '67.99', '15', '20', '女', null, null, '2015年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('94', '1160299270', 'ISGMyneATSuhkiwz4BURBQ==', '0', '沈费欣', '信息大类', '1610', '396', '96', '85.2', '83.8', '86.61', '33', '2', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('95', '1160299023', 'ISGMyneATSuhkiwz4BURBQ==', '0', '戴梁辉', '信息大类', '1601', '396', '86', '87.8', '80.6', '86.45', '9', '3', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('96', '1160299042', 'ISGMyneATSuhkiwz4BURBQ==', '0', '余剑', '信息大类', '1602', '396', '92', '85.3', '70.8', '84.13', '31', '4', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('97', '1160299178', 'ISGMyneATSuhkiwz4BURBQ==', '0', '陈永雷', '信息大类', '1606', '396', '85', '90.4', '51.4', '83.74', '1', '5', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('98', '1160694036', 'ISGMyneATSuhkiwz4BURBQ==', '0', '俞雯霞', '信息大类', '1609', '396', '89', '89.3', '47.6', '83', '5', '6', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('99', '1160580006', 'ISGMyneATSuhkiwz4BURBQ==', '0', '涂雅婷', '信息大类', '1602', '396', '90', '86.3', '57.6', '82.55', '21', '7', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('100', '1160299065', 'ISGMyneATSuhkiwz4BURBQ==', '0', '陈莎莎', '信息大类', '1603', '396', '90', '88.7', '42.4', '81.95', '6', '8', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('101', '1160299316', 'ISGMyneATSuhkiwz4BURBQ==', '0', '陆凯杭', '信息大类', '1611', '396', '97', '89.5', '30.5', '81.775', '4', '9', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('102', '1160299001', 'ISGMyneATSuhkiwz4BURBQ==', '0', '殷龙女', '信息大类', '1601', '396', '96', '85.1', '50.4', '81.53', '37', '10', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('103', '1160299261', 'ISGMyneATSuhkiwz4BURBQ==', '0', '蒋才喜', '信息大类', '1609', '396', '87', '84.7', '57.6', '80.98', '41', '11', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('104', '1160299311', 'ISGMyneATSuhkiwz4BURBQ==', '0', '王宇超', '信息大类', '1611', '396', '86', '89.7', '30.5', '80.265', '2', '14', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('105', '1160299045', 'ISGMyneATSuhkiwz4BURBQ==', '0', '吴植成', '信息大类', '1602', '396', '85', '86.7', '45.4', '80.25', '18', '15', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('106', '1160299136', 'ISGMyneATSuhkiwz4BURBQ==', '0', '王鹏程', '信息大类', '1605', '396', '87', '87.8', '29', '78.86', '10', '17', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('107', '1160299188', 'ISGMyneATSuhkiwz4BURBQ==', '0', '张钰恺', '信息大类', '1607', '396', '86', '85.8', '39', '78.81', '27', '18', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('108', '1160299032', 'ISGMyneATSuhkiwz4BURBQ==', '0', '孙梦瑶', '信息大类', '1602', '396', '92', '88.2', '19', '78.39', '7', '19', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('109', '1160299006', 'ISGMyneATSuhkiwz4BURBQ==', '0', '岑怡婷', '信息大类', '1601', '396', '91', '86.5', '27.5', '78.325', '19', '20', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('110', '1160299021', 'ISGMyneATSuhkiwz4BURBQ==', '0', '罗锋', '信息大类', '1601', '396', '98', '83.1', '33.5', '77.895', '62', '21', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('111', '1160299013', 'ISGMyneATSuhkiwz4BURBQ==', '0', '杨德建', '信息大类', '1601', '396', '92', '87.4', '19', '77.83', '13', '22', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('112', '1160299221', 'ISGMyneATSuhkiwz4BURBQ==', '0', '许楠钒', '信息大类', '1608', '396', '86', '87.4', '22.6', '77.47', '14', '23', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('113', '1160299279', 'ISGMyneATSuhkiwz4BURBQ==', '0', '颜晨曦', '信息大类', '1610', '396', '84', '78.7', '64.4', '77.35', '165', '24', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('114', '1160299093', 'ISGMyneATSuhkiwz4BURBQ==', '0', '刘宇鑫', '信息大类', '1604', '396', '91', '87.8', '14', '77.21', '11', '25', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('115', '1160299008', 'ISGMyneATSuhkiwz4BURBQ==', '0', '支石伟', '信息大类', '1601', '396', '86', '82.2', '47', '77.49', '83', '26', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('116', '1160299299', 'ISGMyneATSuhkiwz4BURBQ==', '0', '盛晶丹', '信息大类', '1611', '396', '90', '85.7', '22.5', '76.865', '28', '29', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('117', '1160299185', 'ISGMyneATSuhkiwz4BURBQ==', '0', '戴思瑶', '信息大类', '1607', '396', '87.5', '84.6', '29', '76.695', '43', '31', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('118', '1160299063', 'ISGMyneATSuhkiwz4BURBQ==', '0', '刘宇琪', '信息大类', '1603', '396', '88', '87.3', '14', '76.41', '15', '34', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('119', '1160610007', 'ISGMyneATSuhkiwz4BURBQ==', '0', '单家颖', '信息大类', '1606', '396', '78', '86', '28', '76.1', '25', '35', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('120', '1160299095', 'ISGMyneATSuhkiwz4BURBQ==', '0', '陈诗梦', '信息大类', '1604', '396', '89', '85.5', '17', '75.75', '29', '36', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('121', '1160299059', 'ISGMyneATSuhkiwz4BURBQ==', '0', '陈田沐', '信息大类', '1602', '396', '86', '86.3', '16', '75.71', '22', '37', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('122', '1160299276', 'ISGMyneATSuhkiwz4BURBQ==', '0', '张鎏', '信息大类', '1610', '396', '89', '87.5', '7', '75.65', '12', '38', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('123', '1160299030', 'ISGMyneATSuhkiwz4BURBQ==', '0', '陈冲', '信息大类', '1601', '396', '87', '85.4', '18', '75.53', '30', '39', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('124', '1160299034', 'ISGMyneATSuhkiwz4BURBQ==', '0', '刘淑一', '信息大类', '1602', '396', '94', '84.4', '14', '75.28', '48', '41', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('125', '1160299002', 'ISGMyneATSuhkiwz4BURBQ==', '0', '苏晓杭', '信息大类', '1601', '396', '91', '81.3', '30.8', '75.18', '108', '43', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('126', '1160299328', 'ISGMyneATSuhkiwz4BURBQ==', '0', '施慧琳', '信息大类', '1612', '396', '90', '82.7', '24', '74.99', '70', '46', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('127', '5161510006', 'ISGMyneATSuhkiwz4BURBQ==', '0', '郑玉弘', '信息大类', '1601', '396', '82', '84.7', '20', '74.59', '42', '49', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('128', '1160692012', 'ISGMyneATSuhkiwz4BURBQ==', '0', '刘梦婷', '信息大类', '1604', '396', '85', '83.6', '22', '74.57', '53', '50', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('129', '1160299338', 'ISGMyneATSuhkiwz4BURBQ==', '0', '徐贤喆', '信息大类', '1612', '396', '82', '82.3', '31', '74.56', '82', '51', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('130', '1160299219', 'ISGMyneATSuhkiwz4BURBQ==', '0', '袁建彪', '信息大类', '1608', '396', '90', '85.2', '9', '74.49', '35', '53', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('131', '1160492076', 'ISGMyneATSuhkiwz4BURBQ==', '0', '严佳敏', '信息大类', '1605', '396', '86', '85.3', '9', '73.96', '32', '60', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('132', '1160299184', 'ISGMyneATSuhkiwz4BURBQ==', '0', '金爱君', '信息大类', '1607', '396', '89', '82.9', '16', '73.78', '66', '61', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('133', '1160299230', 'ISGMyneATSuhkiwz4BURBQ==', '0', '林高凡', '信息大类', '1608', '396', '86', '83.1', '18', '73.77', '63', '62', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('134', '1160299243', 'ISGMyneATSuhkiwz4BURBQ==', '0', '陈琦', '信息大类', '1609', '396', '90', '82.1', '17', '73.52', '90', '63', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('135', '1160299211', 'ISGMyneATSuhkiwz4BURBQ==', '0', '吴鸯鸯', '信息大类', '1608', '396', '86', '82.9', '17', '73.48', '67', '65', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('136', '1160299298', 'ISGMyneATSuhkiwz4BURBQ==', '0', '徐琼波', '信息大类', '1611', '396', '89', '80.7', '22.5', '73.215', '118', '67', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('137', '1160299121', 'ISGMyneATSuhkiwz4BURBQ==', '0', '张娟', '信息大类', '1605', '396', '89', '83.3', '10', '73.16', '60', '68', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('138', '1160299213', 'ISGMyneATSuhkiwz4BURBQ==', '0', '季名节', '信息大类', '1608', '396', '84', '83.6', '13', '73.07', '54', '69', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('139', '1160299041', 'ISGMyneATSuhkiwz4BURBQ==', '0', '张海森', '信息大类', '1602', '396', '92', '80.5', '19', '73', '125', '71', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('140', '1160299035', 'ISGMyneATSuhkiwz4BURBQ==', '0', '韩佳齐', '信息大类', '1602', '396', '92', '80', '21', '72.95', '137', '72', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('141', '1160299152', 'ISGMyneATSuhkiwz4BURBQ==', '0', '魏姚瑶', '信息大类', '1606', '396', '85', '84.8', '5', '72.86', '40', '73', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('142', '1160299268', 'ISGMyneATSuhkiwz4BURBQ==', '0', '赵珊珊', '信息大类', '1610', '396', '89', '79.7', '23', '72.59', '143', '76', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('143', '1160399109', 'ISGMyneATSuhkiwz4BURBQ==', '0', '姜晨', '信息大类', '1603', '396', '81', '83.5', '13', '72.55', '56', '77', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('144', '1160610060', 'ISGMyneATSuhkiwz4BURBQ==', '0', '包嘉敏', '信息大类', '1603', '396', '87', '78.6', '29.2', '72.45', '170', '79', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('145', '1160299189', 'ISGMyneATSuhkiwz4BURBQ==', '0', '张斯奥', '信息大类', '1607', '396', '87', '80.3', '21', '72.41', '130', '80', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('146', '1160299246', 'ISGMyneATSuhkiwz4BURBQ==', '0', '张正', '信息大类', '1609', '396', '85', '82.4', '13', '72.38', '74', '81', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('147', '1160299010', 'ISGMyneATSuhkiwz4BURBQ==', '0', '张艺飞', '信息大类', '1601', '396', '83', '84.4', '5', '72.28', '49', '83', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('148', '1160299064', 'ISGMyneATSuhkiwz4BURBQ==', '0', '韩梦梅', '信息大类', '1603', '396', '86', '81', '17', '72.15', '113', '87', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('149', '1160299326', 'ISGMyneATSuhkiwz4BURBQ==', '0', '周天祎', '信息大类', '1612', '396', '81', '81.8', '18', '72.11', '96', '88', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('150', '1160299031', 'ISGMyneATSuhkiwz4BURBQ==', '0', '袁丽丽', '信息大类', '1602', '396', '88', '81.9', '10', '72.03', '95', '90', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('151', '1160299025', 'ISGMyneATSuhkiwz4BURBQ==', '0', '黄帅民', '信息大类', '1601', '396', '83', '82.7', '10', '71.84', '71', '94', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('152', '1160299329', 'ISGMyneATSuhkiwz4BURBQ==', '0', '李婷婷', '信息大类', '1612', '396', '81', '80.5', '21', '71.65', '126', '96', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('153', '1160299012', 'ISGMyneATSuhkiwz4BURBQ==', '0', '应佳峰', '信息大类', '1601', '396', '86', '82.4', '7', '71.63', '75', '98', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('154', '1160299174', 'ISGMyneATSuhkiwz4BURBQ==', '0', '江铮', '信息大类', '1606', '396', '86', '82.4', '7', '71.63', '76', '99', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('155', '1160299146', 'ISGMyneATSuhkiwz4BURBQ==', '0', '高家辉', '信息大类', '1605', '396', '82', '84.6', '0', '71.52', '45', '100', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('156', '1160299259', 'ISGMyneATSuhkiwz4BURBQ==', '0', '林东旭', '信息大类', '1609', '396', '88', '80.1', '14', '71.37', '136', '103', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('157', '1160299122', 'ISGMyneATSuhkiwz4BURBQ==', '0', '王菁', '信息大类', '1605', '396', '82', '82.4', '7', '71.03', '77', '107', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('158', '1160299155', 'ISGMyneATSuhkiwz4BURBQ==', '0', '陈雨', '信息大类', '1606', '396', '87', '82.76', '0', '70.982', '69', '109', '', '', '', '2016年09月', '', '', '', '', '', null);
INSERT INTO `userss` VALUES ('159', '1160299180', 'ISGMyneATSuhkiwz4BURBQ==', '0', '蔡睿晟', '信息大类', '1606', '396', '80', '79.1', '23.2', '70.85', '154', '111', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('160', '1160299005', 'ISGMyneATSuhkiwz4BURBQ==', '0', '陈涵斐', '信息大类', '1601', '396', '89', '78.0', '19', '70.8', '189', '112', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('161', '1160299070', 'ISGMyneATSuhkiwz4BURBQ==', '0', '张航', '信息大类', '1603', '396', '81', '80.5', '15', '70.75', '127', '113', '', '', '', '2016年09月', '', '', '', '', '', null);
INSERT INTO `userss` VALUES ('162', '1160299075', 'ISGMyneATSuhkiwz4BURBQ==', '0', '王泽天', '信息大类', '1603', '396', '86', '82.2', '2', '70.74', '84', '114', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('163', '1160299351', 'ISGMyneATSuhkiwz4BURBQ==', '0', '冯瀚', '信息大类', '1612', '396', '89', '76.1', '27.4', '70.73', '238', '115', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('164', '1160299284', 'ISGMyneATSuhkiwz4BURBQ==', '0', '孙俊磊', '信息大类', '1610', '396', '87', '80.3', '9', '70.61', '131', '118', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('165', '1160299036', 'ISGMyneATSuhkiwz4BURBQ==', '0', '陈金晶', '信息大类', '1602', '396', '87', '79.7', '11', '70.49', '144', '121', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('166', '1160299154', 'ISGMyneATSuhkiwz4BURBQ==', '0', '黄依泓', '信息大类', '1606', '396', '81', '82.2', '5', '70.44', '85', '123', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('167', '1160299047', 'ISGMyneATSuhkiwz4BURBQ==', '0', '王静', '信息大类', '1602', '396', '91', '75.2', '26', '70.19', '254', '128', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('168', '1160299058', 'ISGMyneATSuhkiwz4BURBQ==', '0', '丁楚浩', '信息大类', '1602', '396', '80', '81.3', '8', '70.11', '110', '136', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('169', '1160299130', 'ISGMyneATSuhkiwz4BURBQ==', '0', '俞科荣', '信息大类', '1605', '396', '81', '79.3', '15', '69.91', '149', '141', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('170', '1160299092', 'ISGMyneATSuhkiwz4BURBQ==', '0', '王晴熙', '信息大类', '1604', '396', '86', '79', '11', '69.85', '158', '144', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('171', '1160492025', 'ISGMyneATSuhkiwz4BURBQ==', '0', '周芝吕', '信息大类', '1610', '396', '84', '78', '15', '69.45', '190', '149', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('172', '1160299062', 'ISGMyneATSuhkiwz4BURBQ==', '0', '孙梦婷', '信息大类', '1603', '396', '87', '78.8', '8', '69.41', '164', '151', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('173', '1160299260', 'ISGMyneATSuhkiwz4BURBQ==', '0', '李航', '信息大类', '1609', '396', '81', '80.7', '5', '69.39', '120', '152', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('174', '1160299044', 'ISGMyneATSuhkiwz4BURBQ==', '0', '徐余丰', '信息大类', '1602', '396', '84', '77.4', '17', '69.33', '210', '153', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('175', '5160491047', 'ISGMyneATSuhkiwz4BURBQ==', '0', '苏小明', '信息大类', '1612', '396', '86', '78', '8', '68.7', '191', '169', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('176', '1160299255', 'ISGMyneATSuhkiwz4BURBQ==', '0', '施明朗', '信息大类', '1609', '396', '85', '77', '13', '68.6', '216', '170', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('177', '1160299308', 'ISGMyneATSuhkiwz4BURBQ==', '0', '杨晨浩', '信息大类', '1611', '396', '81', '76.9', '14.5', '68.155', '219', '180', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('178', '1160299011', 'ISGMyneATSuhkiwz4BURBQ==', '0', '张国栋', '信息大类', '1601', '396', '84', '76.9', '11', '68.08', '220', '183', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('179', '1160299205', 'ISGMyneATSuhkiwz4BURBQ==', '0', '龚嘉豪', '信息大类', '1607', '396', '81', '78.5', '5', '67.85', '174', '191', null, null, null, '2016年09月', null, null, null, null, null, null);
INSERT INTO `userss` VALUES ('180', '1160299245', 'ISGMyneATSuhkiwz4BURBQ==', '0', '郑彪', '信息大类', '1609', '396', '81', '78.2', '5.5', '67.715', '183', '197', null, null, null, '2016年09月', null, null, null, null, null, null);
