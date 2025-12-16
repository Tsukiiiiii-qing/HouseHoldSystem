/*
 Navicat Premium Dump SQL

 Source Server         : yyy
 Source Server Type    : MySQL
 Source Server Version : 80042 (8.0.42)
 Source Host           : localhost:3306
 Source Schema         : householdsystem

 Target Server Type    : MySQL
 Target Server Version : 80042 (8.0.42)
 File Encoding         : 65001

 Date: 16/12/2025 22:00:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for family_notebook
-- ----------------------------
DROP TABLE IF EXISTS `family_notebook`;
CREATE TABLE `family_notebook`  (
  `notebook_id` bigint NOT NULL AUTO_INCREMENT COMMENT '记事本ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '内容',
  `tag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '标签',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notebook_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '家庭记事本' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of family_notebook
-- ----------------------------
INSERT INTO `family_notebook` VALUES (1, 1, '1', '111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111', '2', '2025-12-10 17:05:37', '2025-12-14 13:02:32', NULL);

-- ----------------------------
-- Table structure for finance_budget
-- ----------------------------
DROP TABLE IF EXISTS `finance_budget`;
CREATE TABLE `finance_budget`  (
  `budget_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `year_month` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '月份(yyyy-MM)',
  `amount` decimal(12, 2) NOT NULL DEFAULT 0.00 COMMENT '预算金额',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`budget_id`) USING BTREE,
  UNIQUE INDEX `uk_user_month`(`user_id` ASC, `year_month` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '月度预算' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of finance_budget
-- ----------------------------
INSERT INTO `finance_budget` VALUES (4, 1, '2025-12', 12000.00, '11', '2025-12-14 18:37:36', '2025-12-14 18:39:02');
INSERT INTO `finance_budget` VALUES (5, 1, '2025-02', 112.00, NULL, '2025-12-14 20:39:02', '2025-12-16 00:02:29');
INSERT INTO `finance_budget` VALUES (6, 1, '2025-07', 3000.00, NULL, '2025-12-15 16:48:31', NULL);
INSERT INTO `finance_budget` VALUES (7, 1, '2025-01', 11111.00, '11', '2025-12-15 16:49:12', '2025-12-15 16:53:24');
INSERT INTO `finance_budget` VALUES (8, 1, '2025-06', 11.00, NULL, '2025-12-15 16:49:16', NULL);
INSERT INTO `finance_budget` VALUES (9, 1, '2025-03', 555555.00, NULL, '2025-12-15 16:49:39', NULL);
INSERT INTO `finance_budget` VALUES (10, 1, '2025-10', 300.00, '11', '2025-12-15 16:59:27', NULL);
INSERT INTO `finance_budget` VALUES (11, 2, '2025-08', 11.00, NULL, '2025-12-16 13:50:09', NULL);

-- ----------------------------
-- Table structure for finance_daily_budget
-- ----------------------------
DROP TABLE IF EXISTS `finance_daily_budget`;
CREATE TABLE `finance_daily_budget`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `budget_date` date NOT NULL COMMENT '日期(yyyy-MM-dd)',
  `amount` decimal(12, 2) NOT NULL DEFAULT 0.00 COMMENT '预算金额',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_day`(`user_id` ASC, `budget_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '每日预算' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of finance_daily_budget
-- ----------------------------
INSERT INTO `finance_daily_budget` VALUES (1, 1, '2025-12-19', 150.00, '11', '2025-12-14 20:11:46', NULL);
INSERT INTO `finance_daily_budget` VALUES (2, 1, '2025-12-14', 210.00, NULL, '2025-12-14 20:21:59', '2025-12-14 21:14:47');
INSERT INTO `finance_daily_budget` VALUES (3, 1, '2025-12-15', 300.00, NULL, '2025-12-15 16:07:47', NULL);
INSERT INTO `finance_daily_budget` VALUES (4, 1, '2025-12-02', 11111.00, NULL, '2025-12-15 17:26:19', NULL);
INSERT INTO `finance_daily_budget` VALUES (5, 1, '2025-12-17', 11.00, NULL, '2025-12-15 17:26:26', NULL);
INSERT INTO `finance_daily_budget` VALUES (6, 1, '2025-12-25', 1.00, NULL, '2025-12-15 17:26:30', NULL);
INSERT INTO `finance_daily_budget` VALUES (7, 1, '2025-12-24', 2.00, NULL, '2025-12-15 17:26:35', NULL);
INSERT INTO `finance_daily_budget` VALUES (8, 1, '2025-12-11', 3.00, NULL, '2025-12-15 17:26:38', NULL);
INSERT INTO `finance_daily_budget` VALUES (9, 1, '2025-12-29', 555.00, '55', '2025-12-15 17:26:49', NULL);
INSERT INTO `finance_daily_budget` VALUES (10, 1, '2025-12-10', 1111.00, '1', '2025-12-16 13:52:49', NULL);
INSERT INTO `finance_daily_budget` VALUES (11, 1, '2026-01-07', 111.00, NULL, '2025-12-16 13:56:41', NULL);

-- ----------------------------
-- Table structure for finance_record
-- ----------------------------
DROP TABLE IF EXISTS `finance_record`;
CREATE TABLE `finance_record`  (
  `record_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `type` tinyint NOT NULL COMMENT '0=支出 1=收入',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '消费类别',
  `amount` decimal(10, 2) NOT NULL COMMENT '金额',
  `record_date` date NOT NULL COMMENT '消费日期',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '家庭理财-账目表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of finance_record
-- ----------------------------
INSERT INTO `finance_record` VALUES (7, 1, 1, 'gift_income', 17263.00, '2025-12-18', NULL, '2025-12-10 15:10:17');
INSERT INTO `finance_record` VALUES (9, 1, 1, ' salary', 111.00, '2025-12-10', '1', '2025-12-14 12:50:20');
INSERT INTO `finance_record` VALUES (21, 1, 0, 'entertainment', 149.00, '2025-12-14', '111', '2025-12-14 20:21:33');
INSERT INTO `finance_record` VALUES (22, 1, 0, 'entertainment', 2.00, '2025-12-14', NULL, '2025-12-14 20:21:47');
INSERT INTO `finance_record` VALUES (23, 1, 0, ' shopping', 12.00, '2025-12-14', NULL, '2025-12-14 20:22:16');
INSERT INTO `finance_record` VALUES (24, 1, 0, ' shopping', 1.00, '2025-12-14', NULL, '2025-12-14 20:22:35');
INSERT INTO `finance_record` VALUES (25, 1, 0, 'transport', 20.00, '2025-12-14', NULL, '2025-12-14 20:23:16');
INSERT INTO `finance_record` VALUES (26, 1, 0, 'transport', 20.00, '2025-12-14', NULL, '2025-12-14 21:07:42');
INSERT INTO `finance_record` VALUES (27, 1, 0, ' shopping', 50.00, '2025-12-14', NULL, '2025-12-14 21:15:02');
INSERT INTO `finance_record` VALUES (28, 1, 0, 'transport', 30.00, '2025-12-08', NULL, '2025-12-14 21:27:27');
INSERT INTO `finance_record` VALUES (29, 1, 0, 'entertainment', 30.00, '2025-12-14', NULL, '2025-12-14 21:27:33');
INSERT INTO `finance_record` VALUES (30, 1, 0, 'entertainment', 80.00, '2025-12-14', NULL, '2025-12-14 21:28:06');
INSERT INTO `finance_record` VALUES (31, 1, 0, ' shopping', 30.00, '2025-12-14', NULL, '2025-12-14 21:28:58');
INSERT INTO `finance_record` VALUES (32, 1, 0, 'entertainment', 30.00, '2025-12-14', NULL, '2025-12-14 21:29:21');
INSERT INTO `finance_record` VALUES (33, 1, 0, ' shopping', 111.00, '2025-12-14', NULL, '2025-12-14 21:30:05');
INSERT INTO `finance_record` VALUES (34, 1, 0, 'entertainment', 30.00, '2025-12-14', NULL, '2025-12-14 21:36:10');
INSERT INTO `finance_record` VALUES (35, 1, 0, 'transport', 33.00, '2025-12-14', NULL, '2025-12-14 21:41:29');
INSERT INTO `finance_record` VALUES (36, 1, 0, 'entertainment', 30.00, '2025-12-14', NULL, '2025-12-14 23:40:47');
INSERT INTO `finance_record` VALUES (37, 1, 0, 'entertainment', 30.00, '2025-12-11', NULL, '2025-12-14 23:42:21');
INSERT INTO `finance_record` VALUES (38, 1, 0, 'entertainment', 30.00, '2025-12-14', NULL, '2025-12-14 23:42:35');
INSERT INTO `finance_record` VALUES (39, 1, 0, ' shopping', 299.00, '2025-12-15', NULL, '2025-12-15 16:07:57');
INSERT INTO `finance_record` VALUES (40, 1, 0, 'utilities', 2.00, '2025-12-15', NULL, '2025-12-15 16:08:04');
INSERT INTO `finance_record` VALUES (41, 1, 0, ' shopping', 50.00, '2025-12-15', NULL, '2025-12-15 16:08:47');
INSERT INTO `finance_record` VALUES (42, 1, 0, 'entertainment', 30.00, '2025-12-15', NULL, '2025-12-15 16:10:02');
INSERT INTO `finance_record` VALUES (43, 1, 0, 'entertainment', 30.00, '2025-12-03', NULL, '2025-12-15 16:10:07');
INSERT INTO `finance_record` VALUES (44, 1, 0, 'transport', 50.00, '2025-12-15', NULL, '2025-12-15 16:14:13');
INSERT INTO `finance_record` VALUES (45, 1, 0, ' shopping', 30.00, '2025-12-15', NULL, '2025-12-15 16:22:38');
INSERT INTO `finance_record` VALUES (46, 2, 0, 'transport', 111.00, '2025-12-03', NULL, '2025-12-16 14:07:35');
INSERT INTO `finance_record` VALUES (47, 1, 0, 'transport', 20.00, '2025-12-16', NULL, '2025-12-16 17:02:33');
INSERT INTO `finance_record` VALUES (48, 2, 0, ' shopping', 20.00, '2025-12-16', NULL, '2025-12-16 18:52:44');

-- ----------------------------
-- Table structure for finance_statistic
-- ----------------------------
DROP TABLE IF EXISTS `finance_statistic`;
CREATE TABLE `finance_statistic`  (
  `statistic_id` bigint NOT NULL AUTO_INCREMENT COMMENT '统计ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `statistic_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '统计类型（date日期 category类别 user用户）',
  `statistic_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '统计键（日期/类别/用户名）',
  `income_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '收入总额',
  `expense_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '支出总额',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`statistic_id`) USING BTREE,
  INDEX `idx_user_type_key`(`user_id` ASC, `statistic_type` ASC, `statistic_key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '记账统计表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of finance_statistic
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'finance_record', '家庭理财-账目表', NULL, NULL, 'FinanceRecord', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'record', '家庭理财-账目', 'ruoyi', '0', '/', '{\"parentMenuId\":0}', 'admin', '2025-12-08 16:02:08', '', '2025-12-08 16:09:38', NULL);
INSERT INTO `gen_table` VALUES (2, 'finance_budget', '月度预算', NULL, NULL, 'FinanceBudget', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'budget', '月度预算', 'ruoyi', '0', '/', '{\"parentMenuId\":2006}', 'admin', '2025-12-14 13:53:16', '', '2025-12-14 14:00:12', NULL);
INSERT INTO `gen_table` VALUES (3, 'finance_daily_budget', '每日预算', NULL, NULL, 'FinanceDailyBudget', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'dailyBudget', '每日预算', 'ruoyi', '0', '/', '{\"parentMenuId\":2006}', 'admin', '2025-12-14 19:02:36', '', '2025-12-14 19:03:17', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'record_id', NULL, 'bigint', 'Long', 'recordId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-12-08 16:02:08', '', '2025-12-08 16:09:38');
INSERT INTO `gen_table_column` VALUES (2, 1, 'user_id', '用户ID', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-12-08 16:02:08', '', '2025-12-08 16:09:38');
INSERT INTO `gen_table_column` VALUES (3, 1, 'type', '0=支出 1=收入', 'tinyint', 'Long', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2025-12-08 16:02:08', '', '2025-12-08 16:09:38');
INSERT INTO `gen_table_column` VALUES (4, 1, 'category', '消费类别', 'varchar(50)', 'String', 'category', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2025-12-08 16:02:08', '', '2025-12-08 16:09:38');
INSERT INTO `gen_table_column` VALUES (5, 1, 'amount', '金额', 'decimal(10,2)', 'BigDecimal', 'amount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-12-08 16:02:08', '', '2025-12-08 16:09:38');
INSERT INTO `gen_table_column` VALUES (6, 1, 'record_date', '消费日期', 'date', 'Date', 'recordDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2025-12-08 16:02:08', '', '2025-12-08 16:09:38');
INSERT INTO `gen_table_column` VALUES (7, 1, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2025-12-08 16:02:08', '', '2025-12-08 16:09:38');
INSERT INTO `gen_table_column` VALUES (8, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2025-12-08 16:02:08', '', '2025-12-08 16:09:38');
INSERT INTO `gen_table_column` VALUES (9, 2, 'budget_id', '主键', 'bigint', 'Long', 'budgetId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-12-14 13:53:16', '', '2025-12-14 14:00:12');
INSERT INTO `gen_table_column` VALUES (10, 2, 'user_id', '用户ID', 'bigint', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-12-14 13:53:16', '', '2025-12-14 14:00:12');
INSERT INTO `gen_table_column` VALUES (11, 2, 'year_month', '月份(yyyy-MM)', 'varchar(7)', 'String', 'yearMonth', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-12-14 13:53:16', '', '2025-12-14 14:00:12');
INSERT INTO `gen_table_column` VALUES (12, 2, 'amount', '预算金额', 'decimal(12,2)', 'BigDecimal', 'amount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-12-14 13:53:16', '', '2025-12-14 14:00:12');
INSERT INTO `gen_table_column` VALUES (13, 2, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2025-12-14 13:53:16', '', '2025-12-14 14:00:12');
INSERT INTO `gen_table_column` VALUES (14, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2025-12-14 13:53:16', '', '2025-12-14 14:00:12');
INSERT INTO `gen_table_column` VALUES (15, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2025-12-14 13:53:16', '', '2025-12-14 14:00:12');
INSERT INTO `gen_table_column` VALUES (16, 3, 'id', '主键', 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-12-14 19:02:36', '', '2025-12-14 19:03:17');
INSERT INTO `gen_table_column` VALUES (17, 3, 'user_id', '用户ID', 'bigint', 'Long', 'userId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2025-12-14 19:02:36', '', '2025-12-14 19:03:17');
INSERT INTO `gen_table_column` VALUES (18, 3, 'budget_date', '日期(yyyy-MM-dd)', 'date', 'Date', 'budgetDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2025-12-14 19:02:36', '', '2025-12-14 19:03:17');
INSERT INTO `gen_table_column` VALUES (19, 3, 'amount', '预算金额', 'decimal(12,2)', 'BigDecimal', 'amount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-12-14 19:02:36', '', '2025-12-14 19:03:17');
INSERT INTO `gen_table_column` VALUES (20, 3, 'remark', '备注', 'varchar(255)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2025-12-14 19:02:36', '', '2025-12-14 19:03:17');
INSERT INTO `gen_table_column` VALUES (21, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2025-12-14 19:02:36', '', '2025-12-14 19:03:17');
INSERT INTO `gen_table_column` VALUES (22, 3, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2025-12-14 19:02:36', '', '2025-12-14 19:03:17');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-11-27 21:27:32', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-11-27 21:27:32', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-11-27 21:27:32', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'N', 'admin', '2025-11-27 21:27:32', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2025-11-27 21:27:32', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-11-27 21:27:32', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2025-11-27 21:27:32', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2025-11-27 21:27:32', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'aa科技', 0, 'aa', '15888888888', 'aa@qq.com', '0', '0', 'admin', '2025-11-27 21:27:32', 'admin', '2025-12-16 21:46:47');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-11-27 21:27:32', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-11-27 21:27:32', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-11-27 21:27:32', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-11-27 21:27:32', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-11-27 21:27:32', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-11-27 21:27:32', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-11-27 21:27:32', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-11-27 21:27:32', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-11-27 21:27:32', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 100, '0,100', 'home', 1, NULL, NULL, NULL, '0', '0', 'admin', '2025-12-16 21:46:31', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 132 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '支出', '0', 'finance_type', 'danger', 'default', 'N', '0', 'admin', '2025-12-08 17:44:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '收入', '1', 'finance_type', 'success', 'default', 'N', '0', 'admin', '2025-12-08 17:44:47', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 1, '美食', 'food', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 17:48:22', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 2, '交通', 'transport', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 17:48:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 3, '娱乐', 'entertainment', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 17:48:52', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 4, '购物', ' shopping', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 17:49:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 100, '工资', ' salary', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 17:49:23', 'admin', '2025-12-08 18:52:10', NULL);
INSERT INTO `sys_dict_data` VALUES (107, 101, '奖金', 'bonus', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 17:49:37', 'admin', '2025-12-08 18:52:18', NULL);
INSERT INTO `sys_dict_data` VALUES (108, 5, '水电煤', 'utilities', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 18:50:59', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 6, '通讯', 'communication', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 18:51:14', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 7, '服饰', 'clothing', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 18:51:33', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 8, '日用品', 'daily_goods', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 18:51:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 9, '医疗', 'medical', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 18:52:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 10, '教育', 'education', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 18:52:36', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 11, '住房/房租', 'housing', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 18:53:01', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 12, '旅游', 'travel', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 18:53:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 13, '宠物', 'pet', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 18:53:26', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 14, '汽车/加油', 'car', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 18:53:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 99, '其他支出', 'other_expense', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 18:54:11', 'admin', '2025-12-08 19:12:48', NULL);
INSERT INTO `sys_dict_data` VALUES (119, 102, '兼职', 'part_time', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 18:55:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (120, 103, '投资收益', 'investment', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 18:55:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (121, 104, '利息', 'interest', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 18:55:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (122, 105, '礼金', 'gift_income', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 18:55:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (123, 106, '退款', 'refund', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 18:56:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (124, 120, '其它收入', 'other_income', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 18:56:17', 'admin', '2025-12-08 19:15:27', NULL);
INSERT INTO `sys_dict_data` VALUES (125, 15, '早餐 ', 'breakfast', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 19:13:04', 'admin', '2025-12-08 19:13:08', NULL);
INSERT INTO `sys_dict_data` VALUES (126, 16, '午餐 ', 'lunch', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 19:13:25', 'admin', '2025-12-08 19:13:31', NULL);
INSERT INTO `sys_dict_data` VALUES (127, 17, '晚餐', 'dinner', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 19:13:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (128, 18, '物业费', 'property_fee', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 19:14:00', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (129, 18, '零食', 'snacks', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 19:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (130, 107, '报销', 'reimbursement', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 19:15:22', 'admin', '2025-12-08 19:15:31', NULL);
INSERT INTO `sys_dict_data` VALUES (131, 108, '红包', 'red_packet_income', 'finance_category', NULL, 'default', 'N', '0', 'admin', '2025-12-08 19:16:18', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '收支类型', 'finance_type', '0', 'admin', '2025-12-08 17:38:33', 'admin', '2025-12-08 17:38:48', '0=支出 1=收入');
INSERT INTO `sys_dict_type` VALUES (101, '消费类别', 'finance_category', '0', 'admin', '2025-12-08 17:45:13', '', NULL, '消费类别');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-11-27 21:27:32', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 208 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-27 21:40:40');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-11-28 10:53:39');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-08 16:00:40');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-08 17:34:21');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-12-09 17:15:41');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-12-10 14:10:23');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-12-10 14:10:37');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-12-10 14:10:41');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-12-10 15:25:06');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-12-10 15:25:12');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2025-12-10 15:39:04');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-12-10 15:41:05');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2025-12-10 16:48:55');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-14 12:48:11');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-14 12:48:14');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-14 13:51:46');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-14 14:13:26');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-14 14:13:33');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-14 14:18:47');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-14 14:18:49');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-14 16:49:01');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-14 17:23:08');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-14 17:32:36');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-14 17:34:05');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-14 18:16:04');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-14 19:57:13');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-14 23:35:56');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-15 16:00:17');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-15 21:07:29');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-15 21:11:13');
INSERT INTO `sys_logininfor` VALUES (130, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-12-15 21:11:21');
INSERT INTO `sys_logininfor` VALUES (131, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-12-15 21:11:24');
INSERT INTO `sys_logininfor` VALUES (132, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-12-15 21:11:28');
INSERT INTO `sys_logininfor` VALUES (133, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-12-15 21:11:30');
INSERT INTO `sys_logininfor` VALUES (134, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-12-15 21:11:38');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-15 21:12:01');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-15 21:48:22');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-15 22:09:20');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-15 22:09:33');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-15 22:09:38');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-15 22:10:51');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-15 22:10:58');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-15 23:27:22');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-15 23:51:08');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-15 23:53:35');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-15 23:58:12');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-15 23:58:15');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 00:00:25');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 00:00:36');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 00:04:01');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 00:04:03');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 00:04:28');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 00:05:14');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 00:06:26');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 00:06:28');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 00:09:26');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 00:09:27');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 00:09:48');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 00:09:50');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 13:08:39');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 13:09:38');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 13:09:41');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 13:15:58');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 13:15:59');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 13:47:04');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 13:48:00');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 13:49:48');
INSERT INTO `sys_logininfor` VALUES (167, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 13:49:52');
INSERT INTO `sys_logininfor` VALUES (168, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 13:50:50');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 13:50:52');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 14:07:00');
INSERT INTO `sys_logininfor` VALUES (171, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 14:07:04');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 17:00:04');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 17:00:06');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 17:36:19');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 17:36:36');
INSERT INTO `sys_logininfor` VALUES (176, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 17:36:40');
INSERT INTO `sys_logininfor` VALUES (177, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 17:44:07');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 17:44:09');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 17:55:22');
INSERT INTO `sys_logininfor` VALUES (180, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 17:55:26');
INSERT INTO `sys_logininfor` VALUES (181, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 17:56:21');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 17:56:23');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 18:38:42');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 18:52:24');
INSERT INTO `sys_logininfor` VALUES (185, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 18:52:28');
INSERT INTO `sys_logininfor` VALUES (186, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 18:53:28');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 18:53:29');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 19:09:53');
INSERT INTO `sys_logininfor` VALUES (189, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 19:09:57');
INSERT INTO `sys_logininfor` VALUES (190, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 19:10:11');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 19:10:13');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 21:13:47');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 21:24:18');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 21:24:19');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 21:49:44');
INSERT INTO `sys_logininfor` VALUES (196, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '1', '用户不存在/密码错误', '2025-12-16 21:49:58');
INSERT INTO `sys_logininfor` VALUES (197, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 21:50:04');
INSERT INTO `sys_logininfor` VALUES (198, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 21:52:40');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 21:52:41');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 21:54:14');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 21:54:24');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 21:55:36');
INSERT INTO `sys_logininfor` VALUES (203, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 21:55:39');
INSERT INTO `sys_logininfor` VALUES (204, 'ry', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 21:56:01');
INSERT INTO `sys_logininfor` VALUES (205, 'ooo', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 21:56:05');
INSERT INTO `sys_logininfor` VALUES (206, 'ooo', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '退出成功', '2025-12-16 21:56:43');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 14', 'Windows 10', '0', '登录成功', '2025-12-16 21:56:45');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2041 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-11-27 21:27:32', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-11-27 21:27:32', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-11-27 21:27:32', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-11-27 21:27:32', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-11-27 21:27:32', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-11-27 21:27:32', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-11-27 21:27:32', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-11-27 21:27:32', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-11-27 21:27:32', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-11-27 21:27:32', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-11-27 21:27:32', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-11-27 21:27:32', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-11-27 21:27:32', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-11-27 21:27:32', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-11-27 21:27:32', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-11-27 21:27:32', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-11-27 21:27:32', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-11-27 21:27:32', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-11-27 21:27:32', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-11-27 21:27:32', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-11-27 21:27:32', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-11-27 21:27:32', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-11-27 21:27:32', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '家庭理财-账目', 2006, 1, 'record', 'system/record/index', NULL, '', 1, 1, 'C', '0', '0', 'system:record:list', 'edit', 'admin', '2025-12-08 16:11:31', 'admin', '2025-12-14 21:29:53', '家庭理财-账目菜单');
INSERT INTO `sys_menu` VALUES (2001, '家庭理财-账目查询', 2000, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:record:query', '#', 'admin', '2025-12-08 16:11:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '家庭理财-账目新增', 2000, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:record:add', '#', 'admin', '2025-12-08 16:11:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '家庭理财-账目修改', 2000, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:record:edit', '#', 'admin', '2025-12-08 16:11:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '家庭理财-账目删除', 2000, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:record:remove', '#', 'admin', '2025-12-08 16:11:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '家庭理财-账目导出', 2000, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:record:export', '#', 'admin', '2025-12-08 16:11:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '家庭理财管理', 0, 6, 'finance', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'money', 'admin', '2025-12-08 16:19:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '记账统计', 2006, 3, 'statistic', 'system/statistic/index', '', '', 1, 0, 'C', '0', '0', 'system:statistic:list', 'edit', 'admin', '2025-12-10 15:01:02', 'admin', '2025-12-14 20:27:28', '');
INSERT INTO `sys_menu` VALUES (2008, '查询', 2007, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:statistic:query', '', 'admin', '2025-12-10 15:01:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '新增', 2007, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:statistic:add', '', 'admin', '2025-12-10 15:01:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '修改', 2007, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:statistic:edit', '', 'admin', '2025-12-10 15:01:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '删除', 2007, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:statistic:remove', '', 'admin', '2025-12-10 15:01:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '导出', 2007, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:statistic:export', '', 'admin', '2025-12-10 15:01:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '家庭记事本', 2006, 4, 'notebook', 'system/notebook/index', '', '', 1, 0, 'C', '0', '0', 'system:notebook:list', 'job', 'admin', '2025-12-10 15:01:02', 'admin', '2025-12-14 20:27:45', '');
INSERT INTO `sys_menu` VALUES (2014, '查询', 2013, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:notebook:query', '', 'admin', '2025-12-10 15:01:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '新增', 2013, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:notebook:add', '', 'admin', '2025-12-10 15:01:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '修改', 2013, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:notebook:edit', '', 'admin', '2025-12-10 15:01:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '删除', 2013, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:notebook:remove', '', 'admin', '2025-12-10 15:01:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '导出', 2013, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:notebook:export', '', 'admin', '2025-12-10 15:01:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '事物提醒', 2006, 5, 'reminder', 'system/reminder/index', '', '', 1, 0, 'C', '0', '0', 'system:reminder:list', 'rate', 'admin', '2025-12-10 15:01:02', 'admin', '2025-12-14 20:28:04', '');
INSERT INTO `sys_menu` VALUES (2020, '查询', 2019, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:reminder:query', '', 'admin', '2025-12-10 15:01:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '新增', 2019, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:reminder:add', '', 'admin', '2025-12-10 15:01:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '修改', 2019, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:reminder:edit', '', 'admin', '2025-12-10 15:01:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '删除', 2019, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:reminder:remove', '', 'admin', '2025-12-10 15:01:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '导出', 2019, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:reminder:export', '', 'admin', '2025-12-10 15:01:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '收支结算', 2006, 2, 'summary', 'finance/summary/index', NULL, 'FinanceSummary', 1, 1, 'C', '0', '0', '', 'tool', 'admin', '2025-12-14 13:01:29', 'admin', '2025-12-14 20:09:27', '');
INSERT INTO `sys_menu` VALUES (2027, '月度预算', 2006, 1, 'budget', 'system/budget/index', NULL, '', 1, 0, 'C', '0', '0', 'system:budget:list', 'date', 'admin', '2025-12-14 14:13:19', 'admin', '2025-12-14 20:27:09', '月度预算菜单');
INSERT INTO `sys_menu` VALUES (2028, '月度预算查询', 2027, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:budget:query', '#', 'admin', '2025-12-14 14:13:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '月度预算新增', 2027, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:budget:add', '#', 'admin', '2025-12-14 14:13:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '月度预算修改', 2027, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:budget:edit', '#', 'admin', '2025-12-14 14:13:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '月度预算删除', 2027, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:budget:remove', '#', 'admin', '2025-12-14 14:13:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '月度预算导出', 2027, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:budget:export', '#', 'admin', '2025-12-14 14:13:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '每日预算', 2006, 1, 'dailyBudget', 'system/dailyBudget/index', NULL, 'DailyBudget', 1, 0, 'C', '0', '0', 'system:dailyBudget:list', 'date', 'admin', '2025-12-14 19:07:39', 'admin', '2025-12-14 20:27:15', '月度预算菜单');
INSERT INTO `sys_menu` VALUES (2034, '月度预算查询', 2033, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:budget:query', '#', 'admin', '2025-12-14 19:07:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '月度预算新增', 2033, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:budget:add', '#', 'admin', '2025-12-14 19:07:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '月度预算修改', 2033, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:budget:edit', '#', 'admin', '2025-12-14 19:07:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '月度预算删除', 2033, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:budget:remove', '#', 'admin', '2025-12-14 19:07:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '月度预算导出', 2033, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'system:budget:export', '#', 'admin', '2025-12-14 19:07:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '查看全部数据', 2000, 6, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'system:record:viewAll', 'button', 'admin', '2025-12-16 17:54:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '账目总览', 2006, 2, 'record-all', 'system/recordAll/index', NULL, '', 1, 0, 'C', '0', '0', 'system:record:all:list', 'checkbox', 'admin', '2025-12-16 19:20:14', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-11-27 21:27:32', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-11-27 21:27:32', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 350 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"CREATE TABLE finance_record (\\n  record_id BIGINT PRIMARY KEY AUTO_INCREMENT,\\n  user_id BIGINT NOT NULL COMMENT \'用户ID\',\\n  type TINYINT NOT NULL COMMENT \'0=支出 1=收入\',\\n  category VARCHAR(50) COMMENT \'消费类别\',\\n  amount DECIMAL(10,2) NOT NULL COMMENT \'金额\',\\n  record_date DATE NOT NULL COMMENT \'消费日期\',\\n  remark VARCHAR(255),\\n  create_time DATETIME DEFAULT CURRENT_TIMESTAMP\\n) COMMENT=\'家庭理财-账目表\';\\n\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 16:02:08', 256);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"record\",\"className\":\"FinanceRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnId\":1,\"columnName\":\"record_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-08 16:02:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":2,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-08 16:02:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"0=支出 1=收入\",\"columnId\":3,\"columnName\":\"type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-08 16:02:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"消费类别\",\"columnId\":4,\"columnName\":\"category\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-08 16:02:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"category\",\"javaType\":\"Strin', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 16:06:10', 96);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"record\",\"className\":\"FinanceRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnId\":1,\"columnName\":\"record_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-08 16:02:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-12-08 16:06:10\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":2,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-08 16:02:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-12-08 16:06:10\",\"usableColumn\":false},{\"capJavaField\":\"Type\",\"columnComment\":\"0=支出 1=收入\",\"columnId\":3,\"columnName\":\"type\",\"columnType\":\"tinyint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-08 16:02:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"type\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2025-12-08 16:06:10\",\"usableColumn\":false},{\"capJavaField\":\"Category\",\"columnComment\":\"消费类别\",\"columnId\":4,\"columnName\":\"category\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-08 16:02:08\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isI', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 16:09:38', 80);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"finance_record\"}', NULL, 0, NULL, '2025-12-08 16:09:41', 413);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"money\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"家庭理财管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"finance\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 16:19:04', 47);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/record/index\",\"createTime\":\"2025-12-08 16:11:31\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"家庭理财-账目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"record\",\"perms\":\"system:record:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 16:21:28', 17);
INSERT INTO `sys_oper_log` VALUES (106, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":12,\"createTime\":\"2025-12-08 16:30:41\",\"params\":{},\"recordDate\":\"2025-12-09\",\"remark\":\"111\",\"userId\":11}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\r\n### The error may exist in file [D:\\HouseHoldSystem\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\FinanceRecordMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.FinanceRecordMapper.insertFinanceRecord-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into finance_record          ( user_id,                                       amount,             record_date,             remark,             create_time )           values ( ?,                                       ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'type\' doesn\'t have a default value\n; Field \'type\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'type\' doesn\'t have a default value', '2025-12-08 16:30:41', 391);
INSERT INTO `sys_oper_log` VALUES (107, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"收支类型\",\"dictType\":\"finance_type\",\"params\":{},\"remark\":\"0=支出 1=收入\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 17:38:33', 36);
INSERT INTO `sys_oper_log` VALUES (108, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-08 17:38:33\",\"dictId\":100,\"dictName\":\"收支类型\",\"dictType\":\"finance_type\",\"params\":{},\"remark\":\"0=支出 1=收入\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 17:38:48', 69);
INSERT INTO `sys_oper_log` VALUES (109, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"cssClass\":\"danger\",\"default\":false,\"dictLabel\":\"支出\",\"dictSort\":1,\"dictType\":\"finance_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 17:44:30', 20);
INSERT INTO `sys_oper_log` VALUES (110, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"cssClass\":\"success\",\"default\":false,\"dictLabel\":\"收入\",\"dictSort\":2,\"dictType\":\"finance_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 17:44:47', 14);
INSERT INTO `sys_oper_log` VALUES (111, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"消费类别\",\"dictType\":\"finance_category\",\"params\":{},\"remark\":\"消费类别\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 17:45:13', 13);
INSERT INTO `sys_oper_log` VALUES (112, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"美食\",\"dictSort\":1,\"dictType\":\"finance_category\",\"dictValue\":\"food\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 17:48:22', 17);
INSERT INTO `sys_oper_log` VALUES (113, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"交通\",\"dictSort\":2,\"dictType\":\"finance_category\",\"dictValue\":\"transport\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 17:48:38', 13);
INSERT INTO `sys_oper_log` VALUES (114, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"娱乐\",\"dictSort\":3,\"dictType\":\"finance_category\",\"dictValue\":\"entertainment\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 17:48:52', 11);
INSERT INTO `sys_oper_log` VALUES (115, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"购物\",\"dictSort\":4,\"dictType\":\"finance_category\",\"dictValue\":\" shopping\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 17:49:02', 13);
INSERT INTO `sys_oper_log` VALUES (116, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"工资\",\"dictSort\":10,\"dictType\":\"finance_category\",\"dictValue\":\" salary\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 17:49:24', 17);
INSERT INTO `sys_oper_log` VALUES (117, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"奖金\",\"dictSort\":11,\"dictType\":\"finance_category\",\"dictValue\":\"bonus\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 17:49:37', 10);
INSERT INTO `sys_oper_log` VALUES (118, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":11,\"category\":\"transport\",\"createTime\":\"2025-12-08 17:58:02\",\"params\":{},\"recordDate\":\"2025-12-02\",\"recordId\":1,\"remark\":\"1\",\"type\":0,\"userId\":111}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 17:58:02', 357);
INSERT INTO `sys_oper_log` VALUES (119, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":111111,\"category\":\" salary\",\"createTime\":\"2025-12-08 17:58:56\",\"params\":{},\"recordDate\":\"2025-12-09\",\"recordId\":2,\"remark\":\"1\",\"type\":1,\"userId\":11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 17:58:56', 12);
INSERT INTO `sys_oper_log` VALUES (120, '家庭理财-账目', 2, 'com.ruoyi.system.controller.FinanceRecordController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":111111,\"category\":\"bonus\",\"createTime\":\"2025-12-08 17:58:57\",\"params\":{},\"recordDate\":\"2025-12-09\",\"recordId\":2,\"remark\":\"1\",\"type\":1,\"userId\":11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 17:59:04', 10);
INSERT INTO `sys_oper_log` VALUES (121, '家庭理财-账目', 2, 'com.ruoyi.system.controller.FinanceRecordController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":1112111,\"category\":\"bonus\",\"createTime\":\"2025-12-08 17:58:57\",\"params\":{},\"recordDate\":\"2025-12-09\",\"recordId\":2,\"remark\":\"1\",\"type\":1,\"userId\":11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 17:59:15', 11);
INSERT INTO `sys_oper_log` VALUES (122, '家庭理财-账目', 3, 'com.ruoyi.system.controller.FinanceRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/record/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 17:59:44', 27);
INSERT INTO `sys_oper_log` VALUES (123, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":11,\"category\":\"entertainment\",\"createTime\":\"2025-12-08 18:02:54\",\"params\":{},\"recordDate\":\"2025-12-03\",\"recordId\":3,\"remark\":\"1\",\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:02:54', 25);
INSERT INTO `sys_oper_log` VALUES (124, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":1,\"category\":\"transport\",\"createTime\":\"2025-12-08 18:03:12\",\"params\":{},\"recordDate\":\"2025-12-17\",\"recordId\":4,\"remark\":\"1\",\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:03:12', 18);
INSERT INTO `sys_oper_log` VALUES (125, '家庭理财-账目', 5, 'com.ruoyi.system.controller.FinanceRecordController.export()', 'POST', 1, 'admin', '研发部门', '/system/record/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"30\",\"type\":\"0\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-12-08 18:03:25', 2978);
INSERT INTO `sys_oper_log` VALUES (126, '家庭理财-账目', 3, 'com.ruoyi.system.controller.FinanceRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/record/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:30:29', 45);
INSERT INTO `sys_oper_log` VALUES (127, '家庭理财-账目', 3, 'com.ruoyi.system.controller.FinanceRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/record/3', '127.0.0.1', '内网IP', '[3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:30:31', 8);
INSERT INTO `sys_oper_log` VALUES (128, '家庭理财-账目', 3, 'com.ruoyi.system.controller.FinanceRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/record/4', '127.0.0.1', '内网IP', '[4]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:30:33', 9);
INSERT INTO `sys_oper_log` VALUES (129, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":111,\"category\":\"food\",\"createTime\":\"2025-12-08 18:30:39\",\"params\":{},\"recordDate\":\"2025-12-09\",\"recordId\":5,\"remark\":\"1\",\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:30:39', 38);
INSERT INTO `sys_oper_log` VALUES (130, '家庭理财-账目', 2, 'com.ruoyi.system.controller.FinanceRecordController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":111,\"category\":\"food\",\"createTime\":\"2025-12-08 18:30:39\",\"params\":{},\"recordDate\":\"2025-12-09\",\"recordId\":5,\"remark\":\"1\",\"type\":0,\"userId\":1,\"userName\":\"若依\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:39:10', 62);
INSERT INTO `sys_oper_log` VALUES (131, '家庭理财-账目', 2, 'com.ruoyi.system.controller.FinanceRecordController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":111,\"category\":\"bonus\",\"createTime\":\"2025-12-08 18:30:39\",\"params\":{},\"recordDate\":\"2025-12-09\",\"recordId\":5,\"remark\":\"1\",\"type\":0,\"userId\":1,\"userName\":\"若依\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:40:54', 17);
INSERT INTO `sys_oper_log` VALUES (132, '家庭理财-账目', 2, 'com.ruoyi.system.controller.FinanceRecordController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":111,\"category\":\"bonus\",\"createTime\":\"2025-12-08 18:30:39\",\"params\":{},\"recordDate\":\"2025-12-09\",\"recordId\":5,\"remark\":\"111111111111111111111111111111111111111111\",\"type\":0,\"userId\":1,\"userName\":\"张三\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:49:07', 46);
INSERT INTO `sys_oper_log` VALUES (133, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"水电煤\",\"dictSort\":5,\"dictType\":\"finance_category\",\"dictValue\":\"utilities\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:50:59', 20);
INSERT INTO `sys_oper_log` VALUES (134, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"通讯\",\"dictSort\":6,\"dictType\":\"finance_category\",\"dictValue\":\"communication\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:51:14', 17);
INSERT INTO `sys_oper_log` VALUES (135, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"服饰\",\"dictSort\":7,\"dictType\":\"finance_category\",\"dictValue\":\"clothing\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:51:33', 18);
INSERT INTO `sys_oper_log` VALUES (136, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"日用品\",\"dictSort\":8,\"dictType\":\"finance_category\",\"dictValue\":\"daily_goods\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:51:48', 13);
INSERT INTO `sys_oper_log` VALUES (137, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"医疗\",\"dictSort\":9,\"dictType\":\"finance_category\",\"dictValue\":\"medical\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:52:04', 16);
INSERT INTO `sys_oper_log` VALUES (138, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-08 17:49:23\",\"default\":false,\"dictCode\":106,\"dictLabel\":\"工资\",\"dictSort\":100,\"dictType\":\"finance_category\",\"dictValue\":\" salary\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:52:10', 21);
INSERT INTO `sys_oper_log` VALUES (139, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-08 17:49:37\",\"default\":false,\"dictCode\":107,\"dictLabel\":\"奖金\",\"dictSort\":101,\"dictType\":\"finance_category\",\"dictValue\":\"bonus\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:52:18', 15);
INSERT INTO `sys_oper_log` VALUES (140, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"教育\",\"dictSort\":10,\"dictType\":\"finance_category\",\"dictValue\":\"education\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:52:36', 12);
INSERT INTO `sys_oper_log` VALUES (141, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"住房/房租\",\"dictSort\":11,\"dictType\":\"finance_category\",\"dictValue\":\"housing\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:53:01', 16);
INSERT INTO `sys_oper_log` VALUES (142, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"旅游\",\"dictSort\":12,\"dictType\":\"finance_category\",\"dictValue\":\"travel\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:53:08', 14);
INSERT INTO `sys_oper_log` VALUES (143, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"宠物\",\"dictSort\":13,\"dictType\":\"finance_category\",\"dictValue\":\"pet\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:53:26', 15);
INSERT INTO `sys_oper_log` VALUES (144, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"汽车/加油\",\"dictSort\":14,\"dictType\":\"finance_category\",\"dictValue\":\"car\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:53:48', 13);
INSERT INTO `sys_oper_log` VALUES (145, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"其他支出\",\"dictSort\":16,\"dictType\":\"finance_category\",\"dictValue\":\"other_expense\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:54:11', 11);
INSERT INTO `sys_oper_log` VALUES (146, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-08 18:54:11\",\"default\":false,\"dictCode\":118,\"dictLabel\":\"其他支出\",\"dictSort\":15,\"dictType\":\"finance_category\",\"dictValue\":\"other_expense\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:54:19', 32);
INSERT INTO `sys_oper_log` VALUES (147, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"兼职\",\"dictSort\":102,\"dictType\":\"finance_category\",\"dictValue\":\"part_time\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:55:07', 22);
INSERT INTO `sys_oper_log` VALUES (148, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"投资收益\",\"dictSort\":103,\"dictType\":\"finance_category\",\"dictValue\":\"investment\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:55:24', 16);
INSERT INTO `sys_oper_log` VALUES (149, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"利息\",\"dictSort\":104,\"dictType\":\"finance_category\",\"dictValue\":\"interest\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:55:35', 15);
INSERT INTO `sys_oper_log` VALUES (150, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"礼金\",\"dictSort\":105,\"dictType\":\"finance_category\",\"dictValue\":\"gift_income\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:55:49', 12);
INSERT INTO `sys_oper_log` VALUES (151, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"退款\",\"dictSort\":106,\"dictType\":\"finance_category\",\"dictValue\":\"refund\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:56:04', 15);
INSERT INTO `sys_oper_log` VALUES (152, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"其它收入\",\"dictSort\":106,\"dictType\":\"finance_category\",\"dictValue\":\"other_income\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:56:17', 15);
INSERT INTO `sys_oper_log` VALUES (153, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-08 18:56:17\",\"default\":false,\"dictCode\":124,\"dictLabel\":\"其它收入\",\"dictSort\":107,\"dictType\":\"finance_category\",\"dictValue\":\"other_income\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:56:21', 21);
INSERT INTO `sys_oper_log` VALUES (154, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":11,\"category\":\"utilities\",\"createTime\":\"2025-12-08 18:56:35\",\"params\":{},\"recordDate\":\"2025-12-03\",\"recordId\":6,\"remark\":\"1\",\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:56:35', 15);
INSERT INTO `sys_oper_log` VALUES (155, '家庭理财-账目', 3, 'com.ruoyi.system.controller.FinanceRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/record/6', '127.0.0.1', '内网IP', '[6]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:56:38', 13);
INSERT INTO `sys_oper_log` VALUES (156, '家庭理财-账目', 3, 'com.ruoyi.system.controller.FinanceRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/record/5', '127.0.0.1', '内网IP', '[5]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 18:56:40', 9);
INSERT INTO `sys_oper_log` VALUES (157, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-08 18:54:11\",\"default\":false,\"dictCode\":118,\"dictLabel\":\"其他支出\",\"dictSort\":99,\"dictType\":\"finance_category\",\"dictValue\":\"other_expense\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 19:12:48', 25);
INSERT INTO `sys_oper_log` VALUES (158, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"早餐 \",\"dictSort\":16,\"dictType\":\"finance_category\",\"dictValue\":\"breakfast\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 19:13:04', 11);
INSERT INTO `sys_oper_log` VALUES (159, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-08 19:13:04\",\"default\":false,\"dictCode\":125,\"dictLabel\":\"早餐 \",\"dictSort\":15,\"dictType\":\"finance_category\",\"dictValue\":\"breakfast\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 19:13:08', 17);
INSERT INTO `sys_oper_log` VALUES (160, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"午餐 \",\"dictSort\":17,\"dictType\":\"finance_category\",\"dictValue\":\"lunch\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 19:13:25', 13);
INSERT INTO `sys_oper_log` VALUES (161, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-08 19:13:25\",\"default\":false,\"dictCode\":126,\"dictLabel\":\"午餐 \",\"dictSort\":16,\"dictType\":\"finance_category\",\"dictValue\":\"lunch\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 19:13:31', 69);
INSERT INTO `sys_oper_log` VALUES (162, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"晚餐\",\"dictSort\":17,\"dictType\":\"finance_category\",\"dictValue\":\"dinner\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 19:13:44', 14);
INSERT INTO `sys_oper_log` VALUES (163, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"物业费\",\"dictSort\":18,\"dictType\":\"finance_category\",\"dictValue\":\"property_fee\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 19:14:00', 13);
INSERT INTO `sys_oper_log` VALUES (164, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"零食\",\"dictSort\":18,\"dictType\":\"finance_category\",\"dictValue\":\"snacks\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 19:14:42', 14);
INSERT INTO `sys_oper_log` VALUES (165, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"报销\",\"dictSort\":109,\"dictType\":\"finance_category\",\"dictValue\":\"reimbursement\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 19:15:22', 11);
INSERT INTO `sys_oper_log` VALUES (166, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-08 18:56:17\",\"default\":false,\"dictCode\":124,\"dictLabel\":\"其它收入\",\"dictSort\":120,\"dictType\":\"finance_category\",\"dictValue\":\"other_income\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 19:15:27', 19);
INSERT INTO `sys_oper_log` VALUES (167, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2025-12-08 19:15:22\",\"default\":false,\"dictCode\":130,\"dictLabel\":\"报销\",\"dictSort\":107,\"dictType\":\"finance_category\",\"dictValue\":\"reimbursement\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 19:15:31', 28);
INSERT INTO `sys_oper_log` VALUES (168, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"红包\",\"dictSort\":108,\"dictType\":\"finance_category\",\"dictValue\":\"red_packet_income\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-08 19:16:18', 11);
INSERT INTO `sys_oper_log` VALUES (169, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":17263,\"category\":\"gift_income\",\"createTime\":\"2025-12-10 15:10:17\",\"params\":{},\"recordDate\":\"2025-12-18\",\"recordId\":7,\"type\":1,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-10 15:10:20', 1507);
INSERT INTO `sys_oper_log` VALUES (170, '家庭记事本', 1, 'com.ruoyi.web.controller.system.FamilyNotebookController.add()', 'POST', 1, 'admin', '研发部门', '/system/notebook', '127.0.0.1', '内网IP', '{\"content\":\"这是一条测试内容\",\"params\":{},\"tag\":\"test\",\"title\":\"测试记事本\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in URL [jar:file:/D:/Program%20Files/apache-maven-3.9.3/local_repository/com/ruoyi/ruoyi-system/3.9.0/ruoyi-system-3.9.0.jar!/mapper/system/FamilyNotebookMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.FamilyNotebookMapper.insertFamilyNotebook-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into family_notebook          ( title,             content,             tag,                          create_time )           values ( ?,             ?,             ?,                          now() )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2025-12-10 16:49:27', 155);
INSERT INTO `sys_oper_log` VALUES (171, '家庭记事本', 1, 'com.ruoyi.web.controller.system.FamilyNotebookController.add()', 'POST', 1, 'admin', '研发部门', '/system/notebook', '127.0.0.1', '内网IP', '{\"content\":\"这是一条测试内容\",\"params\":{},\"tag\":\"test\",\"title\":\"测试记事本\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in URL [jar:file:/D:/Program%20Files/apache-maven-3.9.3/local_repository/com/ruoyi/ruoyi-system/3.9.0/ruoyi-system-3.9.0.jar!/mapper/system/FamilyNotebookMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.FamilyNotebookMapper.insertFamilyNotebook-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into family_notebook          ( title,             content,             tag,                          create_time )           values ( ?,             ?,             ?,                          now() )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2025-12-10 16:53:40', 12);
INSERT INTO `sys_oper_log` VALUES (172, '家庭记事本', 1, 'com.ruoyi.web.controller.system.FamilyNotebookController.add()', 'POST', 1, 'admin', '研发部门', '/system/notebook', '127.0.0.1', '内网IP', '{\"content\":\"测试内容\",\"params\":{},\"tag\":\"test\",\"title\":\"测试记事本\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\r\n### The error may exist in URL [jar:file:/D:/Program%20Files/apache-maven-3.9.3/local_repository/com/ruoyi/ruoyi-system/3.9.0/ruoyi-system-3.9.0.jar!/mapper/system/FamilyNotebookMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.FamilyNotebookMapper.insertFamilyNotebook-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into family_notebook          ( title,             content,             tag,                          create_time )           values ( ?,             ?,             ?,                          now() )\r\n### Cause: java.sql.SQLException: Field \'user_id\' doesn\'t have a default value\n; Field \'user_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'user_id\' doesn\'t have a default value', '2025-12-10 16:56:51', 890);
INSERT INTO `sys_oper_log` VALUES (173, '家庭记事本', 1, 'com.ruoyi.web.controller.system.FamilyNotebookController.add()', 'POST', 1, 'admin', '研发部门', '/system/notebook', '127.0.0.1', '内网IP', '{\"content\":\"测试内容\",\"params\":{},\"tag\":\"测试\",\"title\":\"测试记事本\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'user_id\' cannot be null\r\n### The error may exist in URL [jar:file:/D:/Program%20Files/apache-maven-3.9.3/local_repository/com/ruoyi/ruoyi-system/3.9.0/ruoyi-system-3.9.0.jar!/mapper/system/FamilyNotebookMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.FamilyNotebookMapper.insertFamilyNotebook-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into family_notebook (user_id, title, content, tag, create_time                   ) values (?, ?, ?, ?, now()                   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'user_id\' cannot be null\n; Column \'user_id\' cannot be null; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'user_id\' cannot be null', '2025-12-10 17:01:32', 259);
INSERT INTO `sys_oper_log` VALUES (174, '家庭记事本', 1, 'com.ruoyi.web.controller.system.FamilyNotebookController.add()', 'POST', 1, 'admin', '研发部门', '/system/notebook', '127.0.0.1', '内网IP', '{\"content\":\"111\",\"notebookId\":1,\"params\":{},\"tag\":\"1\",\"title\":\"1\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-10 17:05:37', 331);
INSERT INTO `sys_oper_log` VALUES (175, '家庭记事本', 2, 'com.ruoyi.web.controller.system.FamilyNotebookController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/notebook', '127.0.0.1', '内网IP', '{\"content\":\"111\",\"createTime\":\"2025-12-10 17:05:37\",\"notebookId\":1,\"params\":{},\"tag\":\"2\",\"title\":\"1\",\"updateTime\":\"2025-12-10 17:05:37\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-10 17:06:05', 43);
INSERT INTO `sys_oper_log` VALUES (176, '事物提醒', 1, 'com.ruoyi.web.controller.system.TaskReminderController.add()', 'POST', 1, 'admin', '研发部门', '/system/reminder', '127.0.0.1', '内网IP', '{\"isOverspendAlert\":1,\"params\":{},\"reminderId\":1,\"reminderTime\":\"2025-12-11 00:00:00\",\"reminderTitle\":\"测试\",\"status\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-10 17:13:47', 26);
INSERT INTO `sys_oper_log` VALUES (177, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":235,\"category\":\"entertainment\",\"createTime\":\"2025-12-10 17:21:18\",\"params\":{},\"recordDate\":\"2025-12-09\",\"recordId\":8,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-10 17:21:18', 369);
INSERT INTO `sys_oper_log` VALUES (178, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":111,\"category\":\" salary\",\"createTime\":\"2025-12-14 12:50:19\",\"params\":{},\"recordDate\":\"2025-12-10\",\"recordId\":9,\"remark\":\"1\",\"type\":1,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 12:50:19', 31);
INSERT INTO `sys_oper_log` VALUES (179, '事物提醒', 1, 'com.ruoyi.web.controller.system.TaskReminderController.add()', 'POST', 1, 'admin', '研发部门', '/system/reminder', '127.0.0.1', '内网IP', '{\"isOverspendAlert\":0,\"params\":{},\"reminderId\":2,\"reminderTime\":\"2025-12-14 12:55:00\",\"reminderTitle\":\"111\",\"status\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 12:54:04', 11);
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"finance/summary/index\",\"createBy\":\"admin\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"收支结算\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2006,\"path\":\"summary\",\"routeName\":\"FinanceSummary\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 13:01:29', 38);
INSERT INTO `sys_oper_log` VALUES (181, '家庭记事本', 2, 'com.ruoyi.web.controller.system.FamilyNotebookController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/notebook', '127.0.0.1', '内网IP', '{\"content\":\"111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111\",\"createTime\":\"2025-12-10 17:05:37\",\"notebookId\":1,\"params\":{},\"tag\":\"2\",\"title\":\"1\",\"updateTime\":\"2025-12-10 17:06:05\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 13:02:32', 25);
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/statistic/index\",\"createTime\":\"2025-12-10 15:01:02\",\"icon\":\"el-icon-data-analysis\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"记账统计\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2006,\"path\":\"statistic\",\"perms\":\"system:statistic:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 13:03:02', 16);
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/notebook/index\",\"createTime\":\"2025-12-10 15:01:02\",\"icon\":\"el-icon-notebook-2\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"家庭记事本\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2006,\"path\":\"notebook\",\"perms\":\"system:notebook:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 13:03:07', 16);
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/reminder/index\",\"createTime\":\"2025-12-10 15:01:02\",\"icon\":\"el-icon-bell\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"事物提醒\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2006,\"path\":\"reminder\",\"perms\":\"system:reminder:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 13:03:10', 42);
INSERT INTO `sys_oper_log` VALUES (185, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"CREATE TABLE `finance_budget` (\\n  `budget_id`   BIGINT NOT NULL AUTO_INCREMENT COMMENT \'主键\',\\n  `user_id`     BIGINT NOT NULL COMMENT \'用户ID\',\\n  `year_month`  VARCHAR(7) NOT NULL COMMENT \'月份(yyyy-MM)\',\\n  `amount`      DECIMAL(12,2) NOT NULL DEFAULT 0 COMMENT \'预算金额\',\\n  `remark`      VARCHAR(255) DEFAULT NULL COMMENT \'备注\',\\n  `create_time` DATETIME DEFAULT NULL COMMENT \'创建时间\',\\n  `update_time` DATETIME DEFAULT NULL COMMENT \'更新时间\',\\n  PRIMARY KEY (`budget_id`),\\n  UNIQUE KEY `uk_user_month` (`user_id`, `year_month`)\\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT=\'月度预算\';\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2025-12-14 13:52:26', 447);
INSERT INTO `sys_oper_log` VALUES (186, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"CREATE TABLE `finance_budget` (\\n  `budget_id`   BIGINT NOT NULL AUTO_INCREMENT COMMENT \'主键\',\\n  `user_id`     BIGINT NOT NULL COMMENT \'用户ID\',\\n  `year_month`  VARCHAR(7) NOT NULL COMMENT \'月份(yyyy-MM)\',\\n  `amount`      DECIMAL(12,2) NOT NULL DEFAULT 0 COMMENT \'预算金额\',\\n  `remark`      VARCHAR(255) DEFAULT NULL COMMENT \'备注\',\\n  `create_time` DATETIME DEFAULT NULL COMMENT \'创建时间\',\\n  `update_time` DATETIME DEFAULT NULL COMMENT \'更新时间\',\\n  PRIMARY KEY (`budget_id`),\\n  UNIQUE KEY `uk_user_month` (`user_id`, `year_month`)\\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT=\'月度预算\';\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2025-12-14 13:52:31', 12);
INSERT INTO `sys_oper_log` VALUES (187, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"create table finance_budget (\\n  budget_id   bigint        not null auto_increment comment \'主键\',\\n  user_id     bigint        not null                comment \'用户ID\',\\n  year_month  char(7)       not null                comment \'月份(yyyy-MM)\',\\n  amount      decimal(12,2) not null default 0      comment \'预算金额\',\\n  remark      varchar(255)  default null            comment \'备注\',\\n  create_time datetime                                comment \'创建时间\',\\n  update_time datetime                                comment \'更新时间\',\\n  primary key (budget_id),\\n  unique key uk_user_month(user_id, year_month)\\n) engine=innodb comment=\'月度预算\';\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2025-12-14 13:52:56', 12);
INSERT INTO `sys_oper_log` VALUES (188, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"create table finance_budget (\\n  budget_id   bigint        not null auto_increment comment \'主键\',\\n  user_id     bigint        not null                comment \'用户ID\',\\n  year_month  char(7)       not null                comment \'月份(yyyy-MM)\',\\n  amount      decimal(12,2) not null default 0      comment \'预算金额\',\\n  remark      varchar(255)  default null            comment \'备注\',\\n  create_time datetime                                comment \'创建时间\',\\n  update_time datetime                                comment \'更新时间\',\\n  primary key (budget_id),\\n  unique key uk_user_month(user_id, year_month)\\n) engine=innodb comment=\'月度预算\';\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2025-12-14 13:53:01', 10);
INSERT INTO `sys_oper_log` VALUES (189, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"finance_budget\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 13:53:16', 153);
INSERT INTO `sys_oper_log` VALUES (190, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"budget\",\"className\":\"FinanceBudget\",\"columns\":[{\"capJavaField\":\"BudgetId\",\"columnComment\":\"主键\",\"columnId\":9,\"columnName\":\"budget_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-14 13:53:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"budgetId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":10,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-14 13:53:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"YearMonth\",\"columnComment\":\"月份(yyyy-MM)\",\"columnId\":11,\"columnName\":\"year_month\",\"columnType\":\"varchar(7)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-14 13:53:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"yearMonth\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Amount\",\"columnComment\":\"预算金额\",\"columnId\":12,\"columnName\":\"amount\",\"columnType\":\"decimal(12,2)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-14 13:53:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 13:54:10', 64);
INSERT INTO `sys_oper_log` VALUES (191, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"budget\",\"className\":\"FinanceBudget\",\"columns\":[{\"capJavaField\":\"BudgetId\",\"columnComment\":\"主键\",\"columnId\":9,\"columnName\":\"budget_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-14 13:53:16\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"budgetId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-12-14 13:54:10\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":10,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-14 13:53:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-12-14 13:54:10\",\"usableColumn\":false},{\"capJavaField\":\"YearMonth\",\"columnComment\":\"月份(yyyy-MM)\",\"columnId\":11,\"columnName\":\"year_month\",\"columnType\":\"varchar(7)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-14 13:53:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"yearMonth\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2025-12-14 13:54:10\",\"usableColumn\":false},{\"capJavaField\":\"Amount\",\"columnComment\":\"预算金额\",\"columnId\":12,\"columnName\":\"amount\",\"columnType\":\"decimal(12,2)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-14 13:53:16\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"inser', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 14:00:12', 33);
INSERT INTO `sys_oper_log` VALUES (192, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"finance_budget\"}', NULL, 0, NULL, '2025-12-14 14:00:16', 306);
INSERT INTO `sys_oper_log` VALUES (193, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"finance_budget\"}', NULL, 0, NULL, '2025-12-14 14:00:27', 84);
INSERT INTO `sys_oper_log` VALUES (194, '月度预算', 1, 'com.ruoyi.system.controller.FinanceBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":12000,\"createTime\":\"2025-12-14 18:16:19\",\"params\":{},\"userId\":1,\"yearMonth\":\"2025-11\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'year_month,\n            amount,\n            \n            create_time ) \n        \' at line 3\r\n### The error may exist in file [D:\\HouseHoldSystem\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\FinanceBudgetMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.FinanceBudgetMapper.insertFinanceBudget-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into finance_budget          ( user_id,             year_month,             amount,                          create_time )           values ( ?,             ?,             ?,                          ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'year_month,\n            amount,\n            \n            create_time ) \n        \' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'year_month,\n            amount,\n            \n            create_time ) \n        \' at line 3', '2025-12-14 18:16:19', 106);
INSERT INTO `sys_oper_log` VALUES (195, '月度预算', 1, 'com.ruoyi.system.controller.FinanceBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":12000,\"budgetId\":1,\"createTime\":\"2025-12-14 18:25:45\",\"params\":{},\"remark\":\"1\",\"userId\":1,\"yearMonth\":\"2025-06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 18:25:46', 345);
INSERT INTO `sys_oper_log` VALUES (196, '月度预算', 3, 'com.ruoyi.system.controller.FinanceBudgetController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/budget/1', '127.0.0.1', '内网IP', '[1]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 18:30:05', 34);
INSERT INTO `sys_oper_log` VALUES (197, '月度预算', 1, 'com.ruoyi.system.controller.FinanceBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":12000,\"budgetId\":2,\"createTime\":\"2025-12-14 18:36:12\",\"params\":{},\"remark\":\"1\",\"userId\":1,\"yearMonth\":\"2025-12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 18:36:12', 327);
INSERT INTO `sys_oper_log` VALUES (198, '月度预算', 3, 'com.ruoyi.system.controller.FinanceBudgetController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/budget/2', '127.0.0.1', '内网IP', '[2]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 18:36:22', 21);
INSERT INTO `sys_oper_log` VALUES (199, '月度预算', 1, 'com.ruoyi.system.controller.FinanceBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":1,\"budgetId\":3,\"createTime\":\"2025-12-14 18:36:27\",\"params\":{},\"userId\":1,\"yearMonth\":\"2025-07\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 18:36:27', 17);
INSERT INTO `sys_oper_log` VALUES (200, '月度预算', 3, 'com.ruoyi.system.controller.FinanceBudgetController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/budget/3', '127.0.0.1', '内网IP', '[3]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 18:37:26', 20);
INSERT INTO `sys_oper_log` VALUES (201, '月度预算', 1, 'com.ruoyi.system.controller.FinanceBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":11111,\"budgetId\":4,\"createTime\":\"2025-12-14 18:37:36\",\"params\":{},\"userId\":1,\"yearMonth\":\"2025-07\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 18:37:36', 35);
INSERT INTO `sys_oper_log` VALUES (202, '月度预算', 2, 'com.ruoyi.system.controller.FinanceBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":12000,\"budgetId\":4,\"createTime\":\"2025-12-14 18:37:36\",\"params\":{},\"updateTime\":\"2025-12-14 18:37:41\",\"userId\":1,\"yearMonth\":\"2025-07\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 18:37:41', 26);
INSERT INTO `sys_oper_log` VALUES (203, '月度预算', 2, 'com.ruoyi.system.controller.FinanceBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":120009,\"budgetId\":4,\"createTime\":\"2025-12-14 18:37:36\",\"params\":{},\"updateTime\":\"2025-12-14 18:37:49\",\"userId\":1,\"yearMonth\":\"2025-07\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 18:37:49', 14);
INSERT INTO `sys_oper_log` VALUES (204, '月度预算', 2, 'com.ruoyi.system.controller.FinanceBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":120009,\"budgetId\":4,\"createTime\":\"2025-12-14 18:37:36\",\"params\":{},\"remark\":\"11\",\"updateTime\":\"2025-12-14 18:37:56\",\"userId\":1,\"yearMonth\":\"2025-07\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 18:37:56', 40);
INSERT INTO `sys_oper_log` VALUES (205, '月度预算', 2, 'com.ruoyi.system.controller.FinanceBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":12000,\"budgetId\":4,\"createTime\":\"2025-12-14 18:37:36\",\"params\":{},\"remark\":\"11\",\"updateTime\":\"2025-12-14 18:39:01\",\"userId\":1,\"yearMonth\":\"2025-12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 18:39:01', 13);
INSERT INTO `sys_oper_log` VALUES (206, '家庭理财-账目', 3, 'com.ruoyi.system.controller.FinanceRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/record/8', '127.0.0.1', '内网IP', '[8]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 18:39:18', 7);
INSERT INTO `sys_oper_log` VALUES (207, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":11999,\"category\":\"entertainment\",\"createTime\":\"2025-12-14 18:39:25\",\"params\":{},\"recordDate\":\"2025-12-02\",\"recordId\":10,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 18:39:25', 15);
INSERT INTO `sys_oper_log` VALUES (208, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":2,\"category\":\"entertainment\",\"createTime\":\"2025-12-14 18:39:52\",\"params\":{},\"recordDate\":\"2025-12-12\",\"recordId\":11,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 18:39:52', 11);
INSERT INTO `sys_oper_log` VALUES (209, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":12,\"category\":\"entertainment\",\"createTime\":\"2025-12-14 18:49:42\",\"params\":{},\"recordDate\":\"2025-12-11\",\"recordId\":12,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 18:49:42', 308);
INSERT INTO `sys_oper_log` VALUES (210, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":100,\"category\":\"entertainment\",\"createTime\":\"2025-12-14 18:50:00\",\"params\":{},\"recordDate\":\"2025-12-18\",\"recordId\":13,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 18:50:00', 14);
INSERT INTO `sys_oper_log` VALUES (211, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"finance_daily_budget\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 19:02:36', 160);
INSERT INTO `sys_oper_log` VALUES (212, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"dailyBudget\",\"className\":\"FinanceDailyBudget\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":16,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-14 19:02:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":17,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-14 19:02:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BudgetDate\",\"columnComment\":\"日期(yyyy-MM-dd)\",\"columnId\":18,\"columnName\":\"budget_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2025-12-14 19:02:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"budgetDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Amount\",\"columnComment\":\"预算金额\",\"columnId\":19,\"columnName\":\"amount\",\"columnType\":\"decimal(12,2)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-14 19:02:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"j', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 19:03:17', 164);
INSERT INTO `sys_oper_log` VALUES (213, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"finance_daily_budget\"}', NULL, 0, NULL, '2025-12-14 19:03:30', 422);
INSERT INTO `sys_oper_log` VALUES (214, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dailyBudget/index\",\"createTime\":\"2025-12-14 19:07:39\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"每日预算\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"dailyBudget\",\"perms\":\"system:dailyBudget:list\",\"routeName\":\"DailyBudget\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:00:28', 38);
INSERT INTO `sys_oper_log` VALUES (215, '家庭理财-账目', 3, 'com.ruoyi.system.controller.FinanceRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/record/10', '127.0.0.1', '内网IP', '[10]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:02:43', 33);
INSERT INTO `sys_oper_log` VALUES (216, '家庭理财-账目', 3, 'com.ruoyi.system.controller.FinanceRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/record/11', '127.0.0.1', '内网IP', '[11]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:02:44', 18);
INSERT INTO `sys_oper_log` VALUES (217, '家庭理财-账目', 3, 'com.ruoyi.system.controller.FinanceRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/record/12', '127.0.0.1', '内网IP', '[12]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:02:46', 10);
INSERT INTO `sys_oper_log` VALUES (218, '家庭理财-账目', 3, 'com.ruoyi.system.controller.FinanceRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/record/13', '127.0.0.1', '内网IP', '[13]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:02:48', 8);
INSERT INTO `sys_oper_log` VALUES (219, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"finance/summary/index\",\"createTime\":\"2025-12-14 13:01:29\",\"icon\":\"tool\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2026,\"menuName\":\"收支结算\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2006,\"path\":\"summary\",\"perms\":\"\",\"routeName\":\"FinanceSummary\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:09:27', 33);
INSERT INTO `sys_oper_log` VALUES (220, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":1000,\"category\":\"entertainment\",\"createTime\":\"2025-12-14 20:09:53\",\"params\":{},\"recordDate\":\"2025-12-18\",\"recordId\":14,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:09:53', 20);
INSERT INTO `sys_oper_log` VALUES (221, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":120,\"category\":\" shopping\",\"createTime\":\"2025-12-14 20:10:21\",\"params\":{},\"recordDate\":\"2025-12-18\",\"recordId\":15,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:10:21', 11);
INSERT INTO `sys_oper_log` VALUES (222, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":150,\"budgetDate\":\"2025-12-19\",\"createTime\":\"2025-12-14 20:11:46\",\"id\":1,\"params\":{},\"remark\":\"11\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:11:46', 40);
INSERT INTO `sys_oper_log` VALUES (223, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":100,\"category\":\" shopping\",\"createTime\":\"2025-12-14 20:17:35\",\"params\":{},\"recordDate\":\"2025-12-18\",\"recordId\":16,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:17:35', 15);
INSERT INTO `sys_oper_log` VALUES (224, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":149,\"category\":\"entertainment\",\"createTime\":\"2025-12-14 20:18:54\",\"params\":{},\"recordDate\":\"2025-12-19\",\"recordId\":17,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:18:54', 14);
INSERT INTO `sys_oper_log` VALUES (225, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":11,\"category\":\"entertainment\",\"createTime\":\"2025-12-14 20:19:47\",\"params\":{},\"recordDate\":\"2025-12-19\",\"recordId\":18,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:19:47', 8);
INSERT INTO `sys_oper_log` VALUES (226, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":149,\"category\":\" shopping\",\"createTime\":\"2025-12-14 20:20:25\",\"params\":{},\"recordDate\":\"2025-12-14\",\"recordId\":19,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:20:25', 8);
INSERT INTO `sys_oper_log` VALUES (227, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":11,\"category\":\" shopping\",\"createTime\":\"2025-12-14 20:20:39\",\"params\":{},\"recordDate\":\"2025-12-14\",\"recordId\":20,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:20:39', 8);
INSERT INTO `sys_oper_log` VALUES (228, '家庭理财-账目', 3, 'com.ruoyi.system.controller.FinanceRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/record/14', '127.0.0.1', '内网IP', '[14]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:21:10', 10);
INSERT INTO `sys_oper_log` VALUES (229, '家庭理财-账目', 3, 'com.ruoyi.system.controller.FinanceRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/record/15', '127.0.0.1', '内网IP', '[15]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:21:12', 6);
INSERT INTO `sys_oper_log` VALUES (230, '家庭理财-账目', 3, 'com.ruoyi.system.controller.FinanceRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/record/16', '127.0.0.1', '内网IP', '[16]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:21:13', 5);
INSERT INTO `sys_oper_log` VALUES (231, '家庭理财-账目', 3, 'com.ruoyi.system.controller.FinanceRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/record/17', '127.0.0.1', '内网IP', '[17]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:21:15', 5);
INSERT INTO `sys_oper_log` VALUES (232, '家庭理财-账目', 3, 'com.ruoyi.system.controller.FinanceRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/record/18', '127.0.0.1', '内网IP', '[18]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:21:17', 6);
INSERT INTO `sys_oper_log` VALUES (233, '家庭理财-账目', 3, 'com.ruoyi.system.controller.FinanceRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/record/19', '127.0.0.1', '内网IP', '[19]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:21:19', 6);
INSERT INTO `sys_oper_log` VALUES (234, '家庭理财-账目', 3, 'com.ruoyi.system.controller.FinanceRecordController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/record/20', '127.0.0.1', '内网IP', '[20]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:21:21', 7);
INSERT INTO `sys_oper_log` VALUES (235, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":149,\"category\":\"entertainment\",\"createTime\":\"2025-12-14 20:21:33\",\"params\":{},\"recordDate\":\"2025-12-14\",\"recordId\":21,\"remark\":\"111\",\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:21:33', 8);
INSERT INTO `sys_oper_log` VALUES (236, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":2,\"category\":\"entertainment\",\"createTime\":\"2025-12-14 20:21:47\",\"params\":{},\"recordDate\":\"2025-12-14\",\"recordId\":22,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:21:47', 10);
INSERT INTO `sys_oper_log` VALUES (237, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":160,\"budgetDate\":\"2025-12-14\",\"createTime\":\"2025-12-14 20:21:59\",\"id\":2,\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:21:59', 14);
INSERT INTO `sys_oper_log` VALUES (238, '每日预算', 2, 'com.ruoyi.system.controller.FinanceDailyBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":161,\"budgetDate\":\"2025-12-14\",\"createTime\":\"2025-12-14 20:21:59\",\"id\":2,\"params\":{},\"updateTime\":\"2025-12-14 20:22:07\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:22:07', 15);
INSERT INTO `sys_oper_log` VALUES (239, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":12,\"category\":\" shopping\",\"createTime\":\"2025-12-14 20:22:16\",\"params\":{},\"recordDate\":\"2025-12-14\",\"recordId\":23,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:22:16', 6);
INSERT INTO `sys_oper_log` VALUES (240, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":1,\"category\":\" shopping\",\"createTime\":\"2025-12-14 20:22:35\",\"params\":{},\"recordDate\":\"2025-12-14\",\"recordId\":24,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:22:35', 12);
INSERT INTO `sys_oper_log` VALUES (241, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":20,\"category\":\"transport\",\"createTime\":\"2025-12-14 20:23:15\",\"params\":{},\"recordDate\":\"2025-12-14\",\"recordId\":25,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:23:15', 15);
INSERT INTO `sys_oper_log` VALUES (242, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/budget/index\",\"createTime\":\"2025-12-14 14:13:19\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"月度预算\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"budget\",\"perms\":\"system:budget:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:27:09', 21);
INSERT INTO `sys_oper_log` VALUES (243, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dailyBudget/index\",\"createTime\":\"2025-12-14 19:07:39\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"每日预算\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"dailyBudget\",\"perms\":\"system:dailyBudget:list\",\"routeName\":\"DailyBudget\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:27:15', 16);
INSERT INTO `sys_oper_log` VALUES (244, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/statistic/index\",\"createTime\":\"2025-12-10 15:01:02\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"记账统计\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2006,\"path\":\"statistic\",\"perms\":\"system:statistic:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:27:28', 55);
INSERT INTO `sys_oper_log` VALUES (245, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/notebook/index\",\"createTime\":\"2025-12-10 15:01:02\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"家庭记事本\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2006,\"path\":\"notebook\",\"perms\":\"system:notebook:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:27:45', 17);
INSERT INTO `sys_oper_log` VALUES (246, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/reminder/index\",\"createTime\":\"2025-12-10 15:01:02\",\"icon\":\"rate\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"事物提醒\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2006,\"path\":\"reminder\",\"perms\":\"system:reminder:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:28:04', 26);
INSERT INTO `sys_oper_log` VALUES (247, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2025/12/14/b25c8974902f4970a1883c12c31f78e4.jpg\",\"code\":200}', 0, NULL, '2025-12-14 20:31:07', 196);
INSERT INTO `sys_oper_log` VALUES (248, '月度预算', 1, 'com.ruoyi.system.controller.FinanceBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":11,\"budgetId\":5,\"createTime\":\"2025-12-14 20:39:02\",\"params\":{},\"userId\":1,\"yearMonth\":\"2025-02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:39:02', 445);
INSERT INTO `sys_oper_log` VALUES (249, '月度预算', 2, 'com.ruoyi.system.controller.FinanceBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":112,\"budgetId\":5,\"createTime\":\"2025-12-14 20:39:02\",\"params\":{},\"updateTime\":\"2025-12-14 20:39:10\",\"userId\":1,\"userName\":\"张三\",\"yearMonth\":\"2025-02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 20:39:10', 47);
INSERT INTO `sys_oper_log` VALUES (250, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":120,\"budgetDate\":\"2025-12-14\",\"params\":{},\"userId\":1}', NULL, 1, '该日期预算已存在', '2025-12-14 21:07:25', 45);
INSERT INTO `sys_oper_log` VALUES (251, '每日预算', 2, 'com.ruoyi.system.controller.FinanceDailyBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":200,\"budgetDate\":\"2025-12-14\",\"createTime\":\"2025-12-14 20:21:59\",\"id\":2,\"params\":{},\"updateTime\":\"2025-12-14 21:07:29\",\"userId\":1,\"userName\":\"张三\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 21:07:29', 34);
INSERT INTO `sys_oper_log` VALUES (252, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":20,\"category\":\"transport\",\"createTime\":\"2025-12-14 21:07:42\",\"params\":{},\"recordDate\":\"2025-12-14\",\"recordId\":26,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 21:07:42', 27);
INSERT INTO `sys_oper_log` VALUES (253, '每日预算', 3, 'com.ruoyi.system.controller.FinanceDailyBudgetController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dailyBudget/2', '127.0.0.1', '内网IP', '[2]', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.FinanceDailyBudgetMapper.deleteFinanceDailyBudgetByIds', '2025-12-14 21:08:09', 4);
INSERT INTO `sys_oper_log` VALUES (254, '每日预算', 3, 'com.ruoyi.system.controller.FinanceDailyBudgetController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dailyBudget/2', '127.0.0.1', '内网IP', '[2]', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.FinanceDailyBudgetMapper.deleteFinanceDailyBudgetByIds', '2025-12-14 21:08:12', 1);
INSERT INTO `sys_oper_log` VALUES (255, '每日预算', 2, 'com.ruoyi.system.controller.FinanceDailyBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":210,\"budgetDate\":\"2025-12-14\",\"createTime\":\"2025-12-14 20:21:59\",\"id\":2,\"params\":{},\"updateTime\":\"2025-12-14 21:14:46\",\"userId\":1,\"userName\":\"张三\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 21:14:47', 72);
INSERT INTO `sys_oper_log` VALUES (256, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":50,\"category\":\" shopping\",\"createTime\":\"2025-12-14 21:15:02\",\"params\":{},\"recordDate\":\"2025-12-14\",\"recordId\":27,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 21:15:02', 26);
INSERT INTO `sys_oper_log` VALUES (257, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":30,\"category\":\"transport\",\"createTime\":\"2025-12-14 21:27:26\",\"params\":{},\"recordDate\":\"2025-12-08\",\"recordId\":28,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 21:27:27', 381);
INSERT INTO `sys_oper_log` VALUES (258, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":30,\"category\":\"entertainment\",\"createTime\":\"2025-12-14 21:27:33\",\"params\":{},\"recordDate\":\"2025-12-14\",\"recordId\":29,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 21:27:33', 13);
INSERT INTO `sys_oper_log` VALUES (259, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/record/index\",\"createTime\":\"2025-12-08 16:11:31\",\"icon\":\"edit\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"家庭理财-账目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"record\",\"perms\":\"system:record:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 21:27:53', 37);
INSERT INTO `sys_oper_log` VALUES (260, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":80,\"category\":\"entertainment\",\"createTime\":\"2025-12-14 21:28:05\",\"params\":{},\"recordDate\":\"2025-12-14\",\"recordId\":30,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 21:28:06', 7);
INSERT INTO `sys_oper_log` VALUES (261, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":30,\"category\":\" shopping\",\"createTime\":\"2025-12-14 21:28:58\",\"params\":{},\"recordDate\":\"2025-12-14\",\"recordId\":31,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 21:28:58', 7);
INSERT INTO `sys_oper_log` VALUES (262, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":30,\"category\":\"entertainment\",\"createTime\":\"2025-12-14 21:29:21\",\"params\":{},\"recordDate\":\"2025-12-14\",\"recordId\":32,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 21:29:21', 10);
INSERT INTO `sys_oper_log` VALUES (263, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/record/index\",\"createTime\":\"2025-12-08 16:11:31\",\"icon\":\"edit\",\"isCache\":\"1\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"家庭理财-账目\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2006,\"path\":\"record\",\"perms\":\"system:record:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 21:29:53', 14);
INSERT INTO `sys_oper_log` VALUES (264, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":111,\"category\":\" shopping\",\"createTime\":\"2025-12-14 21:30:04\",\"params\":{},\"recordDate\":\"2025-12-14\",\"recordId\":33,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 21:30:04', 14);
INSERT INTO `sys_oper_log` VALUES (265, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":30,\"category\":\"entertainment\",\"createTime\":\"2025-12-14 21:36:10\",\"params\":{},\"recordDate\":\"2025-12-14\",\"recordId\":34,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 21:36:10', 280);
INSERT INTO `sys_oper_log` VALUES (266, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":33,\"category\":\"transport\",\"createTime\":\"2025-12-14 21:41:29\",\"params\":{},\"recordDate\":\"2025-12-14\",\"recordId\":35,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 21:41:29', 351);
INSERT INTO `sys_oper_log` VALUES (267, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":30,\"category\":\"entertainment\",\"createTime\":\"2025-12-14 23:40:47\",\"params\":{},\"recordDate\":\"2025-12-14\",\"recordId\":36,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 23:40:47', 35);
INSERT INTO `sys_oper_log` VALUES (268, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":30,\"category\":\"entertainment\",\"createTime\":\"2025-12-14 23:42:21\",\"params\":{},\"recordDate\":\"2025-12-11\",\"recordId\":37,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 23:42:21', 9);
INSERT INTO `sys_oper_log` VALUES (269, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":30,\"category\":\"entertainment\",\"createTime\":\"2025-12-14 23:42:35\",\"params\":{},\"recordDate\":\"2025-12-14\",\"recordId\":38,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-14 23:42:35', 10);
INSERT INTO `sys_oper_log` VALUES (270, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":300,\"budgetDate\":\"2025-12-15\",\"createTime\":\"2025-12-15 16:07:47\",\"id\":3,\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 16:07:47', 268);
INSERT INTO `sys_oper_log` VALUES (271, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":299,\"category\":\" shopping\",\"createTime\":\"2025-12-15 16:07:56\",\"params\":{},\"recordDate\":\"2025-12-15\",\"recordId\":39,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 16:07:56', 19);
INSERT INTO `sys_oper_log` VALUES (272, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":2,\"category\":\"utilities\",\"createTime\":\"2025-12-15 16:08:03\",\"params\":{},\"recordDate\":\"2025-12-15\",\"recordId\":40,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 16:08:03', 11);
INSERT INTO `sys_oper_log` VALUES (273, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":50,\"category\":\" shopping\",\"createTime\":\"2025-12-15 16:08:46\",\"params\":{},\"recordDate\":\"2025-12-15\",\"recordId\":41,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 16:08:46', 265);
INSERT INTO `sys_oper_log` VALUES (274, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":30,\"category\":\"entertainment\",\"createTime\":\"2025-12-15 16:10:02\",\"params\":{},\"recordDate\":\"2025-12-15\",\"recordId\":42,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 16:10:02', 10);
INSERT INTO `sys_oper_log` VALUES (275, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":30,\"category\":\"entertainment\",\"createTime\":\"2025-12-15 16:10:07\",\"params\":{},\"recordDate\":\"2025-12-03\",\"recordId\":43,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 16:10:07', 6);
INSERT INTO `sys_oper_log` VALUES (276, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":50,\"category\":\"transport\",\"createTime\":\"2025-12-15 16:14:12\",\"params\":{},\"recordDate\":\"2025-12-15\",\"recordId\":44,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 16:14:13', 283);
INSERT INTO `sys_oper_log` VALUES (277, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":30,\"category\":\" shopping\",\"createTime\":\"2025-12-15 16:22:38\",\"params\":{},\"recordDate\":\"2025-12-15\",\"recordId\":45,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 16:22:38', 24);
INSERT INTO `sys_oper_log` VALUES (278, '月度预算', 1, 'com.ruoyi.system.controller.FinanceBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":3000,\"budgetId\":6,\"createTime\":\"2025-12-15 16:48:31\",\"params\":{},\"userId\":1,\"yearMonth\":\"2025-07\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 16:48:31', 247);
INSERT INTO `sys_oper_log` VALUES (279, '月度预算', 1, 'com.ruoyi.system.controller.FinanceBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":11111,\"params\":{},\"userId\":1,\"yearMonth\":\"2025-07\"}', NULL, 1, '该月份预算已存在', '2025-12-15 16:49:09', 11);
INSERT INTO `sys_oper_log` VALUES (280, '月度预算', 1, 'com.ruoyi.system.controller.FinanceBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":11111,\"budgetId\":7,\"createTime\":\"2025-12-15 16:49:11\",\"params\":{},\"userId\":1,\"yearMonth\":\"2025-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 16:49:11', 16);
INSERT INTO `sys_oper_log` VALUES (281, '月度预算', 1, 'com.ruoyi.system.controller.FinanceBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":11,\"budgetId\":8,\"createTime\":\"2025-12-15 16:49:15\",\"params\":{},\"userId\":1,\"yearMonth\":\"2025-06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 16:49:15', 12);
INSERT INTO `sys_oper_log` VALUES (282, '月度预算', 1, 'com.ruoyi.system.controller.FinanceBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":555555,\"budgetId\":9,\"createTime\":\"2025-12-15 16:49:38\",\"params\":{},\"userId\":1,\"yearMonth\":\"2025-03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 16:49:38', 10);
INSERT INTO `sys_oper_log` VALUES (283, '月度预算', 2, 'com.ruoyi.system.controller.FinanceBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":11111,\"budgetId\":7,\"createTime\":\"2025-12-15 16:49:12\",\"params\":{},\"remark\":\"11\",\"updateTime\":\"2025-12-15 16:53:24\",\"userId\":1,\"userName\":\"张三\",\"yearMonth\":\"2025-01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 16:53:24', 12);
INSERT INTO `sys_oper_log` VALUES (284, '月度预算', 1, 'com.ruoyi.system.controller.FinanceBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":300,\"params\":{},\"remark\":\"11\",\"userId\":1,\"yearMonth\":\"2025-06\"}', NULL, 1, '该月份预算已存在', '2025-12-15 16:59:21', 5);
INSERT INTO `sys_oper_log` VALUES (285, '月度预算', 1, 'com.ruoyi.system.controller.FinanceBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":300,\"params\":{},\"remark\":\"11\",\"userId\":1,\"yearMonth\":\"2025-07\"}', NULL, 1, '该月份预算已存在', '2025-12-15 16:59:24', 12);
INSERT INTO `sys_oper_log` VALUES (286, '月度预算', 1, 'com.ruoyi.system.controller.FinanceBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":300,\"budgetId\":10,\"createTime\":\"2025-12-15 16:59:26\",\"params\":{},\"remark\":\"11\",\"userId\":1,\"yearMonth\":\"2025-10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 16:59:26', 15);
INSERT INTO `sys_oper_log` VALUES (287, '月度预算', 1, 'com.ruoyi.system.controller.FinanceBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":0,\"params\":{},\"userId\":1,\"yearMonth\":\"2025-02\"}', NULL, 1, '该月份预算已存在', '2025-12-15 16:59:47', 4);
INSERT INTO `sys_oper_log` VALUES (288, '月度预算', 1, 'com.ruoyi.system.controller.FinanceBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":0,\"params\":{},\"userId\":1,\"yearMonth\":\"2025-02\"}', NULL, 1, '该月份预算已存在', '2025-12-15 16:59:50', 9);
INSERT INTO `sys_oper_log` VALUES (289, '月度预算', 1, 'com.ruoyi.system.controller.FinanceBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":0,\"params\":{},\"userId\":1,\"yearMonth\":\"2025-02\"}', NULL, 1, '该月份预算已存在', '2025-12-15 16:59:51', 4);
INSERT INTO `sys_oper_log` VALUES (290, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":11111,\"budgetDate\":\"2025-12-15\",\"params\":{},\"userId\":1}', NULL, 1, '该日期预算已存在', '2025-12-15 17:26:14', 34);
INSERT INTO `sys_oper_log` VALUES (291, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":11111,\"budgetDate\":\"2025-12-19\",\"params\":{},\"userId\":1}', NULL, 1, '该日期预算已存在', '2025-12-15 17:26:16', 4);
INSERT INTO `sys_oper_log` VALUES (292, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":11111,\"budgetDate\":\"2025-12-02\",\"createTime\":\"2025-12-15 17:26:19\",\"id\":4,\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 17:26:19', 16);
INSERT INTO `sys_oper_log` VALUES (293, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":11,\"budgetDate\":\"2025-12-17\",\"createTime\":\"2025-12-15 17:26:25\",\"id\":5,\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 17:26:25', 11);
INSERT INTO `sys_oper_log` VALUES (294, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":1,\"budgetDate\":\"2025-12-25\",\"createTime\":\"2025-12-15 17:26:29\",\"id\":6,\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 17:26:29', 10);
INSERT INTO `sys_oper_log` VALUES (295, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":2,\"budgetDate\":\"2025-12-24\",\"createTime\":\"2025-12-15 17:26:35\",\"id\":7,\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 17:26:35', 13);
INSERT INTO `sys_oper_log` VALUES (296, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":3,\"budgetDate\":\"2025-12-11\",\"createTime\":\"2025-12-15 17:26:38\",\"id\":8,\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 17:26:38', 11);
INSERT INTO `sys_oper_log` VALUES (297, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":555,\"budgetDate\":\"2025-12-17\",\"params\":{},\"remark\":\"55\",\"userId\":1}', NULL, 1, '该日期预算已存在', '2025-12-15 17:26:44', 4);
INSERT INTO `sys_oper_log` VALUES (298, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":555,\"budgetDate\":\"2025-12-25\",\"params\":{},\"remark\":\"55\",\"userId\":1}', NULL, 1, '该日期预算已存在', '2025-12-15 17:26:47', 6);
INSERT INTO `sys_oper_log` VALUES (299, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":555,\"budgetDate\":\"2025-12-29\",\"createTime\":\"2025-12-15 17:26:48\",\"id\":9,\"params\":{},\"remark\":\"55\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 17:26:48', 9);
INSERT INTO `sys_oper_log` VALUES (300, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-11-27 21:27:32\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2006,2000,2001,2002,2003,2004,2005,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2026,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-15 21:10:41', 347);
INSERT INTO `sys_oper_log` VALUES (301, '月度预算', 2, 'com.ruoyi.system.controller.FinanceBudgetController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":112,\"budgetId\":5,\"createTime\":\"2025-12-14 20:39:02\",\"params\":{},\"updateTime\":\"2025-12-16 00:02:28\",\"userId\":1,\"userName\":\"张三\",\"yearMonth\":\"2025-02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 00:02:29', 34);
INSERT INTO `sys_oper_log` VALUES (302, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 00:10:17', 34);
INSERT INTO `sys_oper_log` VALUES (303, '月度预算', 1, 'com.ruoyi.system.controller.FinanceBudgetController.add()', 'POST', 1, 'ry', '测试部门', '/system/budget', '127.0.0.1', '内网IP', '{\"amount\":11,\"budgetId\":11,\"createTime\":\"2025-12-16 13:50:08\",\"params\":{},\"userId\":2,\"yearMonth\":\"2025-08\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 13:50:08', 40);
INSERT INTO `sys_oper_log` VALUES (304, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":1111,\"budgetDate\":\"2025-12-10\",\"createTime\":\"2025-12-16 13:52:48\",\"id\":10,\"params\":{},\"remark\":\"1\",\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 13:52:49', 293);
INSERT INTO `sys_oper_log` VALUES (305, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":11111,\"budgetDate\":\"2025-12-17\",\"params\":{},\"remark\":\"1\",\"userId\":1}', NULL, 1, '该日期预算已存在', '2025-12-16 13:52:57', 17);
INSERT INTO `sys_oper_log` VALUES (306, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":11111,\"budgetDate\":\"2025-12-17\",\"params\":{},\"remark\":\"1\",\"userId\":1}', NULL, 1, '该日期预算已存在', '2025-12-16 13:53:04', 5);
INSERT INTO `sys_oper_log` VALUES (307, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":11111,\"budgetDate\":\"2025-12-17\",\"params\":{},\"remark\":\"1\",\"userId\":1}', NULL, 1, '该日期预算已存在', '2025-12-16 13:53:05', 6);
INSERT INTO `sys_oper_log` VALUES (308, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":11111,\"budgetDate\":\"2025-12-17\",\"params\":{},\"remark\":\"1\",\"userId\":1}', NULL, 1, '该日期预算已存在', '2025-12-16 13:53:13', 4);
INSERT INTO `sys_oper_log` VALUES (309, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":111,\"budgetDate\":\"2025-12-17\",\"params\":{},\"userId\":1}', NULL, 1, '该日期预算已存在', '2025-12-16 13:56:15', 14);
INSERT INTO `sys_oper_log` VALUES (310, '每日预算', 1, 'com.ruoyi.system.controller.FinanceDailyBudgetController.add()', 'POST', 1, 'admin', '研发部门', '/system/dailyBudget', '127.0.0.1', '内网IP', '{\"amount\":111,\"budgetDate\":\"2026-01-07\",\"createTime\":\"2025-12-16 13:56:41\",\"id\":11,\"params\":{},\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 13:56:41', 14);
INSERT INTO `sys_oper_log` VALUES (311, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'ry', '测试部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":111,\"category\":\"transport\",\"createTime\":\"2025-12-16 14:07:34\",\"params\":{},\"recordDate\":\"2025-12-03\",\"recordId\":46,\"type\":0,\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 14:07:34', 19);
INSERT INTO `sys_oper_log` VALUES (312, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2025/12/16/97f4fc5291c54e0eb53371727307bfe3.jpg\",\"code\":200}', 0, NULL, '2025-12-16 16:59:55', 164);
INSERT INTO `sys_oper_log` VALUES (313, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'admin', '研发部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":20,\"category\":\"transport\",\"createTime\":\"2025-12-16 17:02:32\",\"params\":{},\"recordDate\":\"2025-12-16\",\"recordId\":47,\"type\":0,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 17:02:32', 22);
INSERT INTO `sys_oper_log` VALUES (314, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-11-27 21:27:32\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-12-16 17:36:40\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[4],\"pwdUpdateDate\":\"2025-11-27 21:27:32\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 17:44:54', 109);
INSERT INTO `sys_oper_log` VALUES (315, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查看全部数据\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2000,\"perms\":\"system:record:viewAll\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 17:54:25', 38);
INSERT INTO `sys_oper_log` VALUES (316, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-11-27 21:27:32\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2006,2000,2001,2002,2003,2004,2005,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2026,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 17:54:54', 43);
INSERT INTO `sys_oper_log` VALUES (317, '家庭理财-账目', 1, 'com.ruoyi.system.controller.FinanceRecordController.add()', 'POST', 1, 'ry', '测试部门', '/system/record', '127.0.0.1', '内网IP', '{\"amount\":20,\"category\":\" shopping\",\"createTime\":\"2025-12-16 18:52:43\",\"params\":{},\"recordDate\":\"2025-12-16\",\"recordId\":48,\"type\":0,\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 18:52:43', 34);
INSERT INTO `sys_oper_log` VALUES (318, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/recordAll/index\",\"createBy\":\"admin\",\"icon\":\"checkbox\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"账目总览\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2006,\"path\":\"record-all\",\"perms\":\"system:record:all:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 19:20:14', 52);
INSERT INTO `sys_oper_log` VALUES (319, '家庭理财-账目（全量导出）', 5, 'com.ruoyi.system.controller.FinanceRecordController.exportAll()', 'POST', 1, 'admin', '研发部门', '/system/record/all/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"type\":\"0\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-12-16 19:22:59', 2523);
INSERT INTO `sys_oper_log` VALUES (320, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-11-27 21:27:32\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2006,2000,2001,2002,2003,2004,2005,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2026,2040,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"家长a\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:30:18', 72);
INSERT INTO `sys_oper_log` VALUES (321, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2006,2000,2001,2002,2003,2004,2005,2039,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2026,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024],\"params\":{},\"roleKey\":\"common\",\"roleName\":\"孩子a\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"新增角色\'孩子a\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2025-12-16 21:31:09', 10);
INSERT INTO `sys_oper_log` VALUES (322, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2006,2000,2001,2002,2003,2004,2005,2039,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2026,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024],\"params\":{},\"roleId\":100,\"roleKey\":\"normal\",\"roleName\":\"孩子a\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:31:17', 39);
INSERT INTO `sys_oper_log` VALUES (323, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-11-27 21:27:32\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-12-16 19:09:57\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"家长小A\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[4],\"pwdUpdateDate\":\"2025-11-27 21:27:32\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"家长a\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:31:53', 38);
INSERT INTO `sys_oper_log` VALUES (324, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-11-27 21:27:32\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2025-12-16 19:09:57\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"家长小A\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[4],\"pwdUpdateDate\":\"2025-11-27 21:27:32\",\"remark\":\"这是一个家长\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"家长a\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:36:07', 339);
INSERT INTO `sys_oper_log` VALUES (325, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-11-27 21:27:32\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"aa@qq.com\",\"loginDate\":\"2025-12-16 19:09:57\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"家长小A\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[4],\"pwdUpdateDate\":\"2025-11-27 21:27:32\",\"remark\":\"这是一个家长\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"家长a\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:36:19', 72);
INSERT INTO `sys_oper_log` VALUES (326, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-11-27 21:27:32\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"aa@qq.com\",\"loginDate\":\"2025-12-16 19:09:57\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"家长小A\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[4],\"pwdUpdateDate\":\"2025-11-27 21:27:32\",\"remark\":\"这是一个家长\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"家长a\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:37:58', 45);
INSERT INTO `sys_oper_log` VALUES (327, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"ww@qq.com\",\"nickName\":\"孩子\",\"params\":{},\"phonenumber\":\"15999999999\",\"postIds\":[],\"remark\":\"这是一个小孩\",\"roleIds\":[100],\"sex\":\"2\",\"status\":\"0\",\"userId\":100,\"userName\":\"孩子\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:39:09', 155);
INSERT INTO `sys_oper_log` VALUES (328, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/100', '127.0.0.1', '内网IP', '[100]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:39:29', 21);
INSERT INTO `sys_oper_log` VALUES (329, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-11-27 21:27:32\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2006,2000,2001,2002,2003,2004,2005,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2026,2040,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"家长\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:39:56', 50);
INSERT INTO `sys_oper_log` VALUES (330, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-12-16 21:31:17\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2006,2000,2001,2002,2003,2004,2005,2039,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2026,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024],\"params\":{},\"roleId\":100,\"roleKey\":\"normal\",\"roleName\":\"孩子\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:39:59', 39);
INSERT INTO `sys_oper_log` VALUES (331, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-11-27 21:27:32\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"aa@qq.com\",\"loginDate\":\"2025-12-16 19:09:57\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"家长小A\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[4],\"pwdUpdateDate\":\"2025-11-27 21:27:32\",\"remark\":\"这是一个家长\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"家长\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:40:25', 65);
INSERT INTO `sys_oper_log` VALUES (332, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"email\":\"ww@qq.com\",\"nickName\":\"孩子A\",\"params\":{},\"phonenumber\":\"15999999999\",\"postIds\":[],\"remark\":\"这是一个孩子\",\"roleIds\":[100],\"sex\":\"2\",\"status\":\"0\",\"userId\":101,\"userName\":\"ooo\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:41:38', 205);
INSERT INTO `sys_oper_log` VALUES (333, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-11-27 21:27:32\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"aa@qq.com\",\"loginDate\":\"2025-12-16 19:09:57\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"家长A\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[4],\"pwdUpdateDate\":\"2025-11-27 21:27:32\",\"remark\":\"这是一个家长\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"家长\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:41:45', 32);
INSERT INTO `sys_oper_log` VALUES (334, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-11-27 21:27:32\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"aa@qq.com\",\"loginDate\":\"2025-12-16 19:09:57\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"家长A\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[4],\"pwdUpdateDate\":\"2025-11-27 21:27:32\",\"remark\":\"这是一个家长\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"家长\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:42:23', 52);
INSERT INTO `sys_oper_log` VALUES (335, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-12-16 21:41:38\",\"delFlag\":\"0\",\"email\":\"ww@qq.com\",\"loginIp\":\"\",\"nickName\":\"孩子A\",\"params\":{},\"phonenumber\":\"15999999999\",\"postIds\":[],\"remark\":\"这是一个孩子\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"normal\",\"roleName\":\"孩子\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"ooo\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:42:26', 31);
INSERT INTO `sys_oper_log` VALUES (336, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/101', '127.0.0.1', '内网IP', '101', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2025-12-16 21:45:07', 9);
INSERT INTO `sys_oper_log` VALUES (337, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/101', '127.0.0.1', '内网IP', '101', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2025-12-16 21:46:08', 3);
INSERT INTO `sys_oper_log` VALUES (338, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/103', '127.0.0.1', '内网IP', '103', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2025-12-16 21:46:10', 21);
INSERT INTO `sys_oper_log` VALUES (339, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/103', '127.0.0.1', '内网IP', '103', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2025-12-16 21:46:13', 9);
INSERT INTO `sys_oper_log` VALUES (340, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"home\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:46:31', 31);
INSERT INTO `sys_oper_log` VALUES (341, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"aa科技\",\"email\":\"aa@qq.com\",\"leader\":\"aa\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:46:47', 19);
INSERT INTO `sys_oper_log` VALUES (342, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-11-27 21:27:32\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"aa@qq.com\",\"loginDate\":\"2025-12-16 19:09:57\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"家长A\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[4],\"pwdUpdateDate\":\"2025-11-27 21:27:32\",\"remark\":\"这是一个家长\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"家长\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:47:07', 39);
INSERT INTO `sys_oper_log` VALUES (343, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-12-16 21:41:38\",\"delFlag\":\"0\",\"email\":\"ww@qq.com\",\"loginIp\":\"\",\"nickName\":\"孩子A\",\"params\":{},\"phonenumber\":\"15999999999\",\"postIds\":[],\"remark\":\"这是一个孩子\",\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"normal\",\"roleName\":\"孩子\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":101,\"userName\":\"ooo\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:47:09', 32);
INSERT INTO `sys_oper_log` VALUES (344, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-11-27 21:27:32\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2006,2000,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,2001,2002,2003,2004,2005,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2026,2040,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"家长\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:49:23', 29);
INSERT INTO `sys_oper_log` VALUES (345, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-12-16 21:31:17\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2006,2000,2001,2002,2003,2004,2005,2039,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2026,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024],\"params\":{},\"roleId\":100,\"roleKey\":\"normal\",\"roleName\":\"孩子\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:49:32', 31);
INSERT INTO `sys_oper_log` VALUES (346, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'ry', '测试部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"ry\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2006,2000,2001,2002,2003,2004,2005,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2026,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024],\"params\":{},\"roleId\":101,\"roleKey\":\"empty\",\"roleName\":\"孩子B\",\"roleSort\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:52:04', 27);
INSERT INTO `sys_oper_log` VALUES (347, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/role/101', '127.0.0.1', '内网IP', '[101]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:53:58', 38);
INSERT INTO `sys_oper_log` VALUES (348, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2025-11-27 21:27:32\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"aa@qq.com\",\"loginDate\":\"2025-12-16 21:50:04\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"家长A\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[4],\"pwdUpdateDate\":\"2025-11-27 21:27:32\",\"remark\":\"这是一个家长\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"家长\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:54:47', 19);
INSERT INTO `sys_oper_log` VALUES (349, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2025-11-27 21:27:32\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2006,2000,2001,2002,2003,2004,2005,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037,2038,2026,2040,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020,2021,2022,2023,2024],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"家长\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-16 21:55:28', 45);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-11-27 21:27:32', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-11-27 21:27:32', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-11-27 21:27:32', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '家长', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2025-11-27 21:27:32', 'admin', '2025-12-16 21:55:28', '普通角色');
INSERT INTO `sys_role` VALUES (100, '孩子', 'normal', 3, '1', 1, 1, '0', '0', 'admin', '2025-12-16 21:31:17', 'admin', '2025-12-16 21:49:32', NULL);
INSERT INTO `sys_role` VALUES (101, '孩子B', 'empty', 1, '1', 1, 1, '0', '2', 'ry', '2025-12-16 21:52:04', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (2, 2013);
INSERT INTO `sys_role_menu` VALUES (2, 2014);
INSERT INTO `sys_role_menu` VALUES (2, 2015);
INSERT INTO `sys_role_menu` VALUES (2, 2016);
INSERT INTO `sys_role_menu` VALUES (2, 2017);
INSERT INTO `sys_role_menu` VALUES (2, 2018);
INSERT INTO `sys_role_menu` VALUES (2, 2019);
INSERT INTO `sys_role_menu` VALUES (2, 2020);
INSERT INTO `sys_role_menu` VALUES (2, 2021);
INSERT INTO `sys_role_menu` VALUES (2, 2022);
INSERT INTO `sys_role_menu` VALUES (2, 2023);
INSERT INTO `sys_role_menu` VALUES (2, 2024);
INSERT INTO `sys_role_menu` VALUES (2, 2026);
INSERT INTO `sys_role_menu` VALUES (2, 2027);
INSERT INTO `sys_role_menu` VALUES (2, 2028);
INSERT INTO `sys_role_menu` VALUES (2, 2029);
INSERT INTO `sys_role_menu` VALUES (2, 2030);
INSERT INTO `sys_role_menu` VALUES (2, 2031);
INSERT INTO `sys_role_menu` VALUES (2, 2032);
INSERT INTO `sys_role_menu` VALUES (2, 2033);
INSERT INTO `sys_role_menu` VALUES (2, 2034);
INSERT INTO `sys_role_menu` VALUES (2, 2035);
INSERT INTO `sys_role_menu` VALUES (2, 2036);
INSERT INTO `sys_role_menu` VALUES (2, 2037);
INSERT INTO `sys_role_menu` VALUES (2, 2038);
INSERT INTO `sys_role_menu` VALUES (2, 2040);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2018);
INSERT INTO `sys_role_menu` VALUES (100, 2019);
INSERT INTO `sys_role_menu` VALUES (100, 2020);
INSERT INTO `sys_role_menu` VALUES (100, 2021);
INSERT INTO `sys_role_menu` VALUES (100, 2022);
INSERT INTO `sys_role_menu` VALUES (100, 2023);
INSERT INTO `sys_role_menu` VALUES (100, 2024);
INSERT INTO `sys_role_menu` VALUES (100, 2026);
INSERT INTO `sys_role_menu` VALUES (100, 2027);
INSERT INTO `sys_role_menu` VALUES (100, 2028);
INSERT INTO `sys_role_menu` VALUES (100, 2029);
INSERT INTO `sys_role_menu` VALUES (100, 2030);
INSERT INTO `sys_role_menu` VALUES (100, 2031);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (100, 2034);
INSERT INTO `sys_role_menu` VALUES (100, 2035);
INSERT INTO `sys_role_menu` VALUES (100, 2036);
INSERT INTO `sys_role_menu` VALUES (100, 2037);
INSERT INTO `sys_role_menu` VALUES (100, 2038);
INSERT INTO `sys_role_menu` VALUES (100, 2039);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '张三', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2025/12/16/97f4fc5291c54e0eb53371727307bfe3.jpg', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-12-16 21:56:46', '2025-11-27 21:27:32', 'admin', '2025-11-27 21:27:32', '', '2025-12-16 16:59:55', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '家长A', '00', 'aa@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-12-16 21:55:39', '2025-11-27 21:27:32', 'admin', '2025-11-27 21:27:32', 'admin', '2025-12-16 21:54:47', '这是一个家长');
INSERT INTO `sys_user` VALUES (101, NULL, 'ooo', '孩子A', '00', 'ww@qq.com', '15999999999', '2', '', '$2a$10$Xjgzz51i8S8LNlm2K05A/.5LmBHIHSZyA1nmXynujfGeSXPZxSGs.', '0', '0', '127.0.0.1', '2025-12-16 21:56:06', NULL, 'admin', '2025-12-16 21:41:38', 'admin', '2025-12-16 21:47:09', '这是一个孩子');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (101, 100);

-- ----------------------------
-- Table structure for task_reminder
-- ----------------------------
DROP TABLE IF EXISTS `task_reminder`;
CREATE TABLE `task_reminder`  (
  `reminder_id` bigint NOT NULL AUTO_INCREMENT COMMENT '提醒ID',
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `reminder_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '提醒标题',
  `reminder_time` datetime NOT NULL COMMENT '提醒时间',
  `is_overspend_alert` tinyint(1) NULL DEFAULT 0 COMMENT '是否超支提醒（0否 1是）',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '状态（0未完成 1已完成）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`reminder_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '事物提醒' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of task_reminder
-- ----------------------------
INSERT INTO `task_reminder` VALUES (1, 1, '测试', '2025-12-11 00:00:00', 1, 0, '2025-12-10 17:13:47', '2025-12-10 17:13:47', NULL);
INSERT INTO `task_reminder` VALUES (2, 1, '111', '2025-12-14 12:55:00', 0, 0, '2025-12-14 12:54:04', '2025-12-14 12:54:04', NULL);

SET FOREIGN_KEY_CHECKS = 1;
