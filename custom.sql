/*
 Navicat Premium Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : custom

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 12/02/2019 15:36:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `login_time` datetime(0) NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login_log
-- ----------------------------
INSERT INTO `login_log` VALUES (1, 1, '2019-02-12 15:15:59');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NULL DEFAULT NULL,
  `content` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `content_UNIQUE`(`content`) USING BTREE,
  INDEX `fk_parent_idx`(`parentid`) USING BTREE,
  CONSTRAINT `fk_parent` FOREIGN KEY (`parentid`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, NULL, '管理员管理', '1', '管理员管理');
INSERT INTO `permission` VALUES (2, 1, '用户管理', '/admin/user.do', NULL);
INSERT INTO `permission` VALUES (3, 1, '角色管理', '/admin/role.do', NULL);
INSERT INTO `permission` VALUES (4, 1, '权限管理', '/admin/rule.do', NULL);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_UNIQUE`(`role`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '超级管理员权限', 0);
INSERT INTO `role` VALUES (2, '管理员', '管理员', 0);
INSERT INTO `role` VALUES (7, '用户管理', '只能管理用户', 0);

-- ----------------------------
-- Table structure for role_premission
-- ----------------------------
DROP TABLE IF EXISTS `role_premission`;
CREATE TABLE `role_premission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NOT NULL,
  `premissionid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_role_idx`(`roleid`) USING BTREE,
  INDEX `fk_premission_idx`(`premissionid`) USING BTREE,
  CONSTRAINT `fk_premission` FOREIGN KEY (`premissionid`) REFERENCES `permission` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_role` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_premission
-- ----------------------------
INSERT INTO `role_premission` VALUES (1, 1, 1);
INSERT INTO `role_premission` VALUES (2, 1, 2);
INSERT INTO `role_premission` VALUES (3, 1, 3);
INSERT INTO `role_premission` VALUES (4, 1, 4);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `salt` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id_UNIQUE`(`id`) USING BTREE,
  UNIQUE INDEX `username_UNIQUE`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', 'b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com');
INSERT INTO `user` VALUES (5, '婷宝宝', 'hsdfun', 'admin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com');
INSERT INTO `user` VALUES (6, 'admiefen', 'huen', 'admin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com');
INSERT INTO `user` VALUES (7, 'admifefn', 'hjjufen', 'admin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com');
INSERT INTO `user` VALUES (9, 'as', 'hun', 'admsin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com');
INSERT INTO `user` VALUES (11, 'adfefmin', 'huwdn', 'admsin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com');
INSERT INTO `user` VALUES (12, 'adfefmin', 'hsdun', 'admsin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com');
INSERT INTO `user` VALUES (14, 'adfefmin', 'huawsddsn', 'admsin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com');
INSERT INTO `user` VALUES (15, 'adfefmin', 'husdn', 'admsin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com');
INSERT INTO `user` VALUES (16, 'adfefmin', 'hasddun', 'admsin	b5a005539e27a88e692cb88e9c6c9187', 'WB9KdQmj10WeKyZf', '18860902920', '417168602@qq.com');
INSERT INTO `user` VALUES (41, 'yuanyang', 'yuanyang', '7cf1f620fb55653545595b4768e03810', 'OectJr9cHyZJCGnL', '18860902920', '417168602@qq.com');
INSERT INTO `user` VALUES (42, 'hhh', 'yuan', 'd35f19eb1b13e2a4de2a55762ae289cf', 'PR96qAN73h2YrmO3', '18860902920', '417168602@qq.com');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user_idx`(`userid`) USING BTREE,
  INDEX `fl_role`(`roleid`) USING BTREE,
  CONSTRAINT `fk_user` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fl_role` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 1, 1);
INSERT INTO `user_role` VALUES (2, 1, 2);
INSERT INTO `user_role` VALUES (17, 15, 1);
INSERT INTO `user_role` VALUES (18, 15, 2);
INSERT INTO `user_role` VALUES (30, 41, 1);
INSERT INTO `user_role` VALUES (31, 41, 2);
INSERT INTO `user_role` VALUES (33, 9, 1);
INSERT INTO `user_role` VALUES (34, 9, 2);
INSERT INTO `user_role` VALUES (37, 12, 1);
INSERT INTO `user_role` VALUES (38, 12, 2);
INSERT INTO `user_role` VALUES (40, 14, 2);
INSERT INTO `user_role` VALUES (41, 16, 2);
INSERT INTO `user_role` VALUES (43, 6, 1);
INSERT INTO `user_role` VALUES (45, 7, 1);
INSERT INTO `user_role` VALUES (61, 11, 1);
INSERT INTO `user_role` VALUES (62, 11, 2);
INSERT INTO `user_role` VALUES (65, 42, 7);
INSERT INTO `user_role` VALUES (66, 5, 1);
INSERT INTO `user_role` VALUES (67, 5, 2);
INSERT INTO `user_role` VALUES (68, 5, 7);

SET FOREIGN_KEY_CHECKS = 1;
