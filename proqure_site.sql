/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : localhost:3306
 Source Schema         : proqure_site

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 12/11/2023 19:23:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_cart
-- ----------------------------
DROP TABLE IF EXISTS `tbl_cart`;
CREATE TABLE `tbl_cart`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 386 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_cart
-- ----------------------------
INSERT INTO `tbl_cart` VALUES (96, 13, 7, 1, '4Kg');
INSERT INTO `tbl_cart` VALUES (97, 13, 9, 1, '4Kg');
INSERT INTO `tbl_cart` VALUES (105, 3, 7, 14, '100Grams');
INSERT INTO `tbl_cart` VALUES (106, 3, 1, 23, '300Grams');
INSERT INTO `tbl_cart` VALUES (107, 3, 12, 1, '4Kg');
INSERT INTO `tbl_cart` VALUES (108, 3, 15, 1, '4Kg');
INSERT INTO `tbl_cart` VALUES (109, 5, 8, 4, '100Grams');
INSERT INTO `tbl_cart` VALUES (110, 5, 9, 2, '300Grams');
INSERT INTO `tbl_cart` VALUES (111, 5, 7, 1, '4Kg');
INSERT INTO `tbl_cart` VALUES (112, 35, 2, 3, '4Kg');
INSERT INTO `tbl_cart` VALUES (113, 35, 3, 2, '100Grams');
INSERT INTO `tbl_cart` VALUES (293, 107, 2, 6, '100Grams');
INSERT INTO `tbl_cart` VALUES (297, 4, 13, 1, '4Kg');
INSERT INTO `tbl_cart` VALUES (299, 4, 2, 1, '4Kg');
INSERT INTO `tbl_cart` VALUES (300, 4, 3, 6, '100Grams');
INSERT INTO `tbl_cart` VALUES (304, 31, 2, 1, '300Grams');
INSERT INTO `tbl_cart` VALUES (305, 31, 3, 1, '4Kg');
INSERT INTO `tbl_cart` VALUES (306, 4, 1, 1, '4Kg');
INSERT INTO `tbl_cart` VALUES (384, 7, 1, 1, '500Grams');
INSERT INTO `tbl_cart` VALUES (385, 7, 4, 1, '500Grams');

-- ----------------------------
-- Table structure for tbl_categories
-- ----------------------------
DROP TABLE IF EXISTS `tbl_categories`;
CREATE TABLE `tbl_categories`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_categories
-- ----------------------------
INSERT INTO `tbl_categories` VALUES (1, 'Flour', 'Experience the vibrant flavors and nutritional benefits of our organic superfood powders. Bursting with antioxidants, vitamins, and minerals, these powders are the perfect addition to your daily routine. Whether you\'re blending them into smoothies,', '\\upload\\category\\1693719861618\\img1.png', '2023-08-09 04:15:03', '2023-08-17 04:15:07', NULL);
INSERT INTO `tbl_categories` VALUES (2, 'Sugar', 'Indulge in the rich and velvety flavor of our organic cane sugar. Sourced from sustainable farms, this golden delight is unrefined, preserving its natural molasses content for a deeper, more complex taste. Whether you\'re baking cookies, brewing coffee, or', '\\upload\\category\\1693730774237\\img3.png', '2023-08-09 04:15:03', '2023-08-17 04:15:07', NULL);
INSERT INTO `tbl_categories` VALUES (3, 'Salt', 'For a unique and bold flavor profile, try our Smoked Salt. Infused with aromatic wood smoke, this salt adds a rich and smoky dimension to your dishes. Perfect for seasoning grilled meats, enhancing barbecue sauces, or adding a hint of complexity to roaste', '\\upload\\category\\1693730766257\\img3.png', '2023-08-09 04:15:03', '2023-08-17 04:15:07', NULL);
INSERT INTO `tbl_categories` VALUES (4, 'Margarine', 'For those seeking a heart-healthy option, our cholesterol-free margarine is a perfect choice. Made with a special blend of oils, it provides a delicious alternative without compromising on taste or quality. Spread it on your morning bagel or use it as a v', '\\upload\\category\\1693719861618\\img1.png', '2023-08-09 04:15:03', '2023-08-17 04:15:07', NULL);
INSERT INTO `tbl_categories` VALUES (5, 'Vegetable Oil', 'Our vegetable oils come in convenient and eco-friendly packaging, ensuring freshness and ease of use. Join the community of satisfied customers who have embraced our vegetable oils and experience the difference in your cooking. Shop now and elevate your c', '\\upload\\category\\1693719861618\\img1.png', '2023-08-09 04:15:03', '2023-08-17 04:15:07', NULL);
INSERT INTO `tbl_categories` VALUES (6, 'Yeast & Improve', 'Our yeast and improvers come in convenient packaging, ensuring freshness and ease of use. With our premium products, you can unleash your creativity in the kitchen and delight your family and friends with irresistible baked treats. ', '\\upload\\category\\1693730774237\\img3.png', '2023-08-09 04:15:03', '2023-08-17 04:15:07', NULL);
INSERT INTO `tbl_categories` VALUES (7, 'Baking Powder', 'Our baking powders are packaged in airtight containers to maintain freshness and potency. With our premium quality baking powders, you can confidently explore new recipes, impress your loved ones, and create delectable treats that will leave everyone want', '\\upload\\category\\1693730766257\\img3.png', '2023-08-09 04:15:03', '2023-08-17 04:15:07', NULL);

-- ----------------------------
-- Table structure for tbl_coupon
-- ----------------------------
DROP TABLE IF EXISTS `tbl_coupon`;
CREATE TABLE `tbl_coupon`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `applied_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `applied_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `validity_date` date NULL DEFAULT NULL,
  `used_count` int NULL DEFAULT 0,
  `active` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_coupon
-- ----------------------------
INSERT INTO `tbl_coupon` VALUES (83, 'HAARC6H', 'Discount(%)', 'all', 'all', '10', NULL, '2023-10-08 00:53:13', NULL, NULL, '2023-11-29', 0, 0);
INSERT INTO `tbl_coupon` VALUES (84, 'IWYFYKV', 'Cash Off Order', 'all', 'all', '10', 10, '2023-10-08 00:54:11', NULL, NULL, '2023-11-29', 0, 0);
INSERT INTO `tbl_coupon` VALUES (85, 'DTGEJIP', 'Category Specific', '1', 'Flour', '10', 10, '2023-10-08 01:03:56', NULL, NULL, '2023-11-29', 0, 0);
INSERT INTO `tbl_coupon` VALUES (86, '8M2KUPR', 'Free Delivery', 'all', 'all', '10', 8, '2023-10-08 01:04:08', NULL, NULL, '2023-11-29', 0, 0);
INSERT INTO `tbl_coupon` VALUES (87, 'B93ECQT', 'BOGOF', '1', 'Honeywell', '10', 7, '2023-10-08 01:04:19', NULL, NULL, '2023-11-29', 0, 0);

-- ----------------------------
-- Table structure for tbl_coupon_history
-- ----------------------------
DROP TABLE IF EXISTS `tbl_coupon_history`;
CREATE TABLE `tbl_coupon_history`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 153 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_coupon_history
-- ----------------------------
INSERT INTO `tbl_coupon_history` VALUES (152, 7, 'HAARC6H', '2023-11-07 23:12:37', NULL);

-- ----------------------------
-- Table structure for tbl_inbox
-- ----------------------------
DROP TABLE IF EXISTS `tbl_inbox`;
CREATE TABLE `tbl_inbox`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_id` int NULL DEFAULT NULL,
  `from_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `is_read` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_inbox
-- ----------------------------
INSERT INTO `tbl_inbox` VALUES (8, 'Flours Discount', 'Flours Discount Content', 1, 'Ayane Jun', 'ayame@gmail.com', '2023-09-04 03:31:38', NULL, 0);
INSERT INTO `tbl_inbox` VALUES (9, 'Flours Discount1', 'Flours Discount Content1', NULL, 'Ayane Jun', 'ayame@gmail.com', '2023-09-04 03:32:09', NULL, 0);
INSERT INTO `tbl_inbox` VALUES (12, 'Flours Discount1', 'Flours Discount Content1', NULL, 'Ayane Jun', 'ayame@gmail.com', '2023-09-04 05:17:04', NULL, 1);
INSERT INTO `tbl_inbox` VALUES (13, 'Flours Discount1', 'Flours Discount Content1', NULL, 'Ayane Jun', 'ayame@gmail.com', '2023-09-04 06:09:15', NULL, 1);

-- ----------------------------
-- Table structure for tbl_message
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message`;
CREATE TABLE `tbl_message`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `user_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `segment_id` int NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_read` int NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 524 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_message
-- ----------------------------
INSERT INTO `tbl_message` VALUES (440, 6, 'won@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Cash Off Order has arrived. Limited time offer: TY9VPNY', 0, '2023-10-06 02:29:21');
INSERT INTO `tbl_message` VALUES (441, 7, 'keller@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Cash Off Order has arrived. Limited time offer: TY9VPNY', 1, '2023-10-06 02:29:21');
INSERT INTO `tbl_message` VALUES (442, 31, 'smile@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Cash Off Order has arrived. Limited time offer: TY9VPNY', 1, '2023-10-06 02:29:21');
INSERT INTO `tbl_message` VALUES (443, 32, 'ins@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Cash Off Order has arrived. Limited time offer: TY9VPNY', 0, '2023-10-06 02:29:21');
INSERT INTO `tbl_message` VALUES (444, 33, 'smile@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Cash Off Order has arrived. Limited time offer: TY9VPNY', 0, '2023-10-06 02:29:21');
INSERT INTO `tbl_message` VALUES (445, 38, 'Agenda@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Cash Off Order has arrived. Limited time offer: TY9VPNY', 0, '2023-10-06 02:29:21');
INSERT INTO `tbl_message` VALUES (446, 40, 'mui@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Cash Off Order has arrived. Limited time offer: TY9VPNY', 0, '2023-10-06 02:29:21');
INSERT INTO `tbl_message` VALUES (447, 6, 'won@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Category Specific has arrived. Limited time offer: P9DKZU9', 0, '2023-10-06 02:29:37');
INSERT INTO `tbl_message` VALUES (448, 7, 'keller@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Category Specific has arrived. Limited time offer: P9DKZU9', 1, '2023-10-06 02:29:37');
INSERT INTO `tbl_message` VALUES (449, 31, 'smile@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Category Specific has arrived. Limited time offer: P9DKZU9', 1, '2023-10-06 02:29:37');
INSERT INTO `tbl_message` VALUES (450, 32, 'ins@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Category Specific has arrived. Limited time offer: P9DKZU9', 0, '2023-10-06 02:29:37');
INSERT INTO `tbl_message` VALUES (451, 33, 'smile@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Category Specific has arrived. Limited time offer: P9DKZU9', 0, '2023-10-06 02:29:37');
INSERT INTO `tbl_message` VALUES (452, 38, 'Agenda@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Category Specific has arrived. Limited time offer: P9DKZU9', 0, '2023-10-06 02:29:37');
INSERT INTO `tbl_message` VALUES (453, 40, 'mui@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Category Specific has arrived. Limited time offer: P9DKZU9', 0, '2023-10-06 02:29:37');
INSERT INTO `tbl_message` VALUES (454, 6, 'won@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Free Delivery has arrived. Limited time offer: EOP52A8', 0, '2023-10-06 02:29:52');
INSERT INTO `tbl_message` VALUES (455, 7, 'keller@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Free Delivery has arrived. Limited time offer: EOP52A8', 1, '2023-10-06 02:29:52');
INSERT INTO `tbl_message` VALUES (456, 31, 'smile@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Free Delivery has arrived. Limited time offer: EOP52A8', 1, '2023-10-06 02:29:52');
INSERT INTO `tbl_message` VALUES (457, 32, 'ins@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Free Delivery has arrived. Limited time offer: EOP52A8', 0, '2023-10-06 02:29:52');
INSERT INTO `tbl_message` VALUES (458, 33, 'smile@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Free Delivery has arrived. Limited time offer: EOP52A8', 0, '2023-10-06 02:29:52');
INSERT INTO `tbl_message` VALUES (459, 38, 'Agenda@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Free Delivery has arrived. Limited time offer: EOP52A8', 0, '2023-10-06 02:29:52');
INSERT INTO `tbl_message` VALUES (460, 40, 'mui@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for Free Delivery has arrived. Limited time offer: EOP52A8', 0, '2023-10-06 02:29:52');
INSERT INTO `tbl_message` VALUES (461, 6, 'won@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for BOGOF has arrived. Limited time offer: I4AM5SE', 0, '2023-10-06 02:34:52');
INSERT INTO `tbl_message` VALUES (462, 7, 'keller@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for BOGOF has arrived. Limited time offer: I4AM5SE', 1, '2023-10-06 02:34:52');
INSERT INTO `tbl_message` VALUES (463, 31, 'smile@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for BOGOF has arrived. Limited time offer: I4AM5SE', 1, '2023-10-06 02:34:52');
INSERT INTO `tbl_message` VALUES (464, 32, 'ins@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for BOGOF has arrived. Limited time offer: I4AM5SE', 0, '2023-10-06 02:34:52');
INSERT INTO `tbl_message` VALUES (465, 33, 'smile@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for BOGOF has arrived. Limited time offer: I4AM5SE', 0, '2023-10-06 02:34:52');
INSERT INTO `tbl_message` VALUES (466, 38, 'Agenda@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for BOGOF has arrived. Limited time offer: I4AM5SE', 0, '2023-10-06 02:34:52');
INSERT INTO `tbl_message` VALUES (467, 40, 'mui@gmail.com', NULL, 'New Coupon Message!', 'A coupon notification for BOGOF has arrived. Limited time offer: I4AM5SE', 0, '2023-10-06 02:34:52');
INSERT INTO `tbl_message` VALUES (468, 6, 'won@gmail.com', NULL, 'New Coupon Message!', 'You have received a Cash Off Order for all. Limited time offer: LCGMBUN', 0, '2023-10-06 06:42:38');
INSERT INTO `tbl_message` VALUES (469, 7, 'keller@gmail.com', NULL, 'New Coupon Message!', 'You have received a Cash Off Order for all. Limited time offer: LCGMBUN', 1, '2023-10-06 06:42:38');
INSERT INTO `tbl_message` VALUES (470, 31, 'smile@gmail.com', NULL, 'New Coupon Message!', 'You have received a Cash Off Order for all. Limited time offer: LCGMBUN', 1, '2023-10-06 06:42:38');
INSERT INTO `tbl_message` VALUES (471, 32, 'ins@gmail.com', NULL, 'New Coupon Message!', 'You have received a Cash Off Order for all. Limited time offer: LCGMBUN', 0, '2023-10-06 06:42:38');
INSERT INTO `tbl_message` VALUES (472, 33, 'smile@gmail.com', NULL, 'New Coupon Message!', 'You have received a Cash Off Order for all. Limited time offer: LCGMBUN', 0, '2023-10-06 06:42:38');
INSERT INTO `tbl_message` VALUES (473, 38, 'Agenda@gmail.com', NULL, 'New Coupon Message!', 'You have received a Cash Off Order for all. Limited time offer: LCGMBUN', 0, '2023-10-06 06:42:38');
INSERT INTO `tbl_message` VALUES (474, 40, 'mui@gmail.com', NULL, 'New Coupon Message!', 'You have received a Cash Off Order for all. Limited time offer: LCGMBUN', 0, '2023-10-06 06:42:38');
INSERT INTO `tbl_message` VALUES (475, 6, 'won@gmail.com', NULL, 'New Coupon Message!', 'You have received a Discount(%) coupon for all. Limited time offer: 3OXYKSO', 0, '2023-10-06 06:43:32');
INSERT INTO `tbl_message` VALUES (476, 7, 'keller@gmail.com', NULL, 'New Coupon Message!', 'You have received a Discount(%) coupon for all. Limited time offer: 3OXYKSO', 1, '2023-10-06 06:43:32');
INSERT INTO `tbl_message` VALUES (477, 31, 'smile@gmail.com', NULL, 'New Coupon Message!', 'You have received a Discount(%) coupon for all. Limited time offer: 3OXYKSO', 1, '2023-10-06 06:43:32');
INSERT INTO `tbl_message` VALUES (478, 32, 'ins@gmail.com', NULL, 'New Coupon Message!', 'You have received a Discount(%) coupon for all. Limited time offer: 3OXYKSO', 0, '2023-10-06 06:43:32');
INSERT INTO `tbl_message` VALUES (479, 33, 'smile@gmail.com', NULL, 'New Coupon Message!', 'You have received a Discount(%) coupon for all. Limited time offer: 3OXYKSO', 0, '2023-10-06 06:43:32');
INSERT INTO `tbl_message` VALUES (480, 38, 'Agenda@gmail.com', NULL, 'New Coupon Message!', 'You have received a Discount(%) coupon for all. Limited time offer: 3OXYKSO', 0, '2023-10-06 06:43:32');
INSERT INTO `tbl_message` VALUES (481, 40, 'mui@gmail.com', NULL, 'New Coupon Message!', 'You have received a Discount(%) coupon for all. Limited time offer: 3OXYKSO', 0, '2023-10-06 06:43:32');
INSERT INTO `tbl_message` VALUES (482, 6, 'won@gmail.com', NULL, 'New Coupon Message!', 'You have received a Category Specific coupon for Margarine. Limited time offer: YN8U8EI', 0, '2023-10-06 06:56:34');
INSERT INTO `tbl_message` VALUES (483, 7, 'keller@gmail.com', NULL, 'New Coupon Message!', 'You have received a Category Specific coupon for Margarine. Limited time offer: YN8U8EI', 1, '2023-10-06 06:56:34');
INSERT INTO `tbl_message` VALUES (484, 31, 'smile@gmail.com', NULL, 'New Coupon Message!', 'You have received a Category Specific coupon for Margarine. Limited time offer: YN8U8EI', 1, '2023-10-06 06:56:34');
INSERT INTO `tbl_message` VALUES (485, 32, 'ins@gmail.com', NULL, 'New Coupon Message!', 'You have received a Category Specific coupon for Margarine. Limited time offer: YN8U8EI', 0, '2023-10-06 06:56:34');
INSERT INTO `tbl_message` VALUES (486, 33, 'smile@gmail.com', NULL, 'New Coupon Message!', 'You have received a Category Specific coupon for Margarine. Limited time offer: YN8U8EI', 0, '2023-10-06 06:56:34');
INSERT INTO `tbl_message` VALUES (487, 38, 'Agenda@gmail.com', NULL, 'New Coupon Message!', 'You have received a Category Specific coupon for Margarine. Limited time offer: YN8U8EI', 0, '2023-10-06 06:56:34');
INSERT INTO `tbl_message` VALUES (488, 40, 'mui@gmail.com', NULL, 'New Coupon Message!', 'You have received a Category Specific coupon for Margarine. Limited time offer: YN8U8EI', 0, '2023-10-06 06:56:34');
INSERT INTO `tbl_message` VALUES (489, 6, 'won@gmail.com', NULL, 'New Coupon Message!', 'You have received a Discount(%) coupon for all. Limited time offer: HAARC6H', 0, '2023-10-08 00:53:13');
INSERT INTO `tbl_message` VALUES (490, 7, 'keller@gmail.com', NULL, 'New Coupon Message!', 'You have received a Discount(%) coupon for all. Limited time offer: HAARC6H', 1, '2023-10-08 00:53:13');
INSERT INTO `tbl_message` VALUES (491, 31, 'smile@gmail.com', NULL, 'New Coupon Message!', 'You have received a Discount(%) coupon for all. Limited time offer: HAARC6H', 1, '2023-10-08 00:53:13');
INSERT INTO `tbl_message` VALUES (492, 32, 'ins@gmail.com', NULL, 'New Coupon Message!', 'You have received a Discount(%) coupon for all. Limited time offer: HAARC6H', 0, '2023-10-08 00:53:13');
INSERT INTO `tbl_message` VALUES (493, 33, 'smile@gmail.com', NULL, 'New Coupon Message!', 'You have received a Discount(%) coupon for all. Limited time offer: HAARC6H', 0, '2023-10-08 00:53:13');
INSERT INTO `tbl_message` VALUES (494, 38, 'Agenda@gmail.com', NULL, 'New Coupon Message!', 'You have received a Discount(%) coupon for all. Limited time offer: HAARC6H', 0, '2023-10-08 00:53:13');
INSERT INTO `tbl_message` VALUES (495, 40, 'mui@gmail.com', NULL, 'New Coupon Message!', 'You have received a Discount(%) coupon for all. Limited time offer: HAARC6H', 0, '2023-10-08 00:53:13');
INSERT INTO `tbl_message` VALUES (496, 6, 'won@gmail.com', NULL, 'New Coupon Message!', 'You have received a Cash Off Order coupon for all. Limited time offer: IWYFYKV', 0, '2023-10-08 00:54:11');
INSERT INTO `tbl_message` VALUES (497, 7, 'keller@gmail.com', NULL, 'New Coupon Message!', 'You have received a Cash Off Order coupon for all. Limited time offer: IWYFYKV', 0, '2023-10-08 00:54:11');
INSERT INTO `tbl_message` VALUES (498, 31, 'smile@gmail.com', NULL, 'New Coupon Message!', 'You have received a Cash Off Order coupon for all. Limited time offer: IWYFYKV', 1, '2023-10-08 00:54:11');
INSERT INTO `tbl_message` VALUES (499, 32, 'ins@gmail.com', NULL, 'New Coupon Message!', 'You have received a Cash Off Order coupon for all. Limited time offer: IWYFYKV', 0, '2023-10-08 00:54:11');
INSERT INTO `tbl_message` VALUES (500, 33, 'smile@gmail.com', NULL, 'New Coupon Message!', 'You have received a Cash Off Order coupon for all. Limited time offer: IWYFYKV', 0, '2023-10-08 00:54:11');
INSERT INTO `tbl_message` VALUES (501, 38, 'Agenda@gmail.com', NULL, 'New Coupon Message!', 'You have received a Cash Off Order coupon for all. Limited time offer: IWYFYKV', 0, '2023-10-08 00:54:11');
INSERT INTO `tbl_message` VALUES (502, 40, 'mui@gmail.com', NULL, 'New Coupon Message!', 'You have received a Cash Off Order coupon for all. Limited time offer: IWYFYKV', 0, '2023-10-08 00:54:11');
INSERT INTO `tbl_message` VALUES (503, 6, 'won@gmail.com', NULL, 'New Coupon Message!', 'You have received a Category Specific coupon for Flour. Limited time offer: DTGEJIP', 0, '2023-10-08 01:03:56');
INSERT INTO `tbl_message` VALUES (504, 7, 'keller@gmail.com', NULL, 'New Coupon Message!', 'You have received a Category Specific coupon for Flour. Limited time offer: DTGEJIP', 1, '2023-10-08 01:03:56');
INSERT INTO `tbl_message` VALUES (505, 31, 'smile@gmail.com', NULL, 'New Coupon Message!', 'You have received a Category Specific coupon for Flour. Limited time offer: DTGEJIP', 1, '2023-10-08 01:03:56');
INSERT INTO `tbl_message` VALUES (506, 32, 'ins@gmail.com', NULL, 'New Coupon Message!', 'You have received a Category Specific coupon for Flour. Limited time offer: DTGEJIP', 0, '2023-10-08 01:03:56');
INSERT INTO `tbl_message` VALUES (507, 33, 'smile@gmail.com', NULL, 'New Coupon Message!', 'You have received a Category Specific coupon for Flour. Limited time offer: DTGEJIP', 0, '2023-10-08 01:03:56');
INSERT INTO `tbl_message` VALUES (508, 38, 'Agenda@gmail.com', NULL, 'New Coupon Message!', 'You have received a Category Specific coupon for Flour. Limited time offer: DTGEJIP', 0, '2023-10-08 01:03:56');
INSERT INTO `tbl_message` VALUES (509, 40, 'mui@gmail.com', NULL, 'New Coupon Message!', 'You have received a Category Specific coupon for Flour. Limited time offer: DTGEJIP', 0, '2023-10-08 01:03:56');
INSERT INTO `tbl_message` VALUES (510, 6, 'won@gmail.com', NULL, 'New Coupon Message!', 'You have received a Free Delivery coupon for all. Limited time offer: 8M2KUPR', 0, '2023-10-08 01:04:08');
INSERT INTO `tbl_message` VALUES (511, 7, 'keller@gmail.com', NULL, 'New Coupon Message!', 'You have received a Free Delivery coupon for all. Limited time offer: 8M2KUPR', 1, '2023-10-08 01:04:08');
INSERT INTO `tbl_message` VALUES (512, 31, 'smile@gmail.com', NULL, 'New Coupon Message!', 'You have received a Free Delivery coupon for all. Limited time offer: 8M2KUPR', 0, '2023-10-08 01:04:08');
INSERT INTO `tbl_message` VALUES (513, 32, 'ins@gmail.com', NULL, 'New Coupon Message!', 'You have received a Free Delivery coupon for all. Limited time offer: 8M2KUPR', 0, '2023-10-08 01:04:08');
INSERT INTO `tbl_message` VALUES (514, 33, 'smile@gmail.com', NULL, 'New Coupon Message!', 'You have received a Free Delivery coupon for all. Limited time offer: 8M2KUPR', 0, '2023-10-08 01:04:08');
INSERT INTO `tbl_message` VALUES (515, 38, 'Agenda@gmail.com', NULL, 'New Coupon Message!', 'You have received a Free Delivery coupon for all. Limited time offer: 8M2KUPR', 0, '2023-10-08 01:04:08');
INSERT INTO `tbl_message` VALUES (516, 40, 'mui@gmail.com', NULL, 'New Coupon Message!', 'You have received a Free Delivery coupon for all. Limited time offer: 8M2KUPR', 0, '2023-10-08 01:04:08');
INSERT INTO `tbl_message` VALUES (517, 6, 'won@gmail.com', NULL, 'New Coupon Message!', 'You have received a BOGOF coupon for Honeywell. Limited time offer: B93ECQT', 0, '2023-10-08 01:04:19');
INSERT INTO `tbl_message` VALUES (518, 7, 'keller@gmail.com', NULL, 'New Coupon Message!', 'You have received a BOGOF coupon for Honeywell. Limited time offer: B93ECQT', 1, '2023-10-08 01:04:19');
INSERT INTO `tbl_message` VALUES (519, 31, 'smile@gmail.com', NULL, 'New Coupon Message!', 'You have received a BOGOF coupon for Honeywell. Limited time offer: B93ECQT', 1, '2023-10-08 01:04:19');
INSERT INTO `tbl_message` VALUES (520, 32, 'ins@gmail.com', NULL, 'New Coupon Message!', 'You have received a BOGOF coupon for Honeywell. Limited time offer: B93ECQT', 0, '2023-10-08 01:04:19');
INSERT INTO `tbl_message` VALUES (521, 33, 'smile@gmail.com', NULL, 'New Coupon Message!', 'You have received a BOGOF coupon for Honeywell. Limited time offer: B93ECQT', 0, '2023-10-08 01:04:19');
INSERT INTO `tbl_message` VALUES (522, 38, 'Agenda@gmail.com', NULL, 'New Coupon Message!', 'You have received a BOGOF coupon for Honeywell. Limited time offer: B93ECQT', 0, '2023-10-08 01:04:19');
INSERT INTO `tbl_message` VALUES (523, 40, 'mui@gmail.com', NULL, 'New Coupon Message!', 'You have received a BOGOF coupon for Honeywell. Limited time offer: B93ECQT', 0, '2023-10-08 01:04:19');

-- ----------------------------
-- Table structure for tbl_orderdetails
-- ----------------------------
DROP TABLE IF EXISTS `tbl_orderdetails`;
CREATE TABLE `tbl_orderdetails`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `cat_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 164 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_orderdetails
-- ----------------------------
INSERT INTO `tbl_orderdetails` VALUES (132, 57, 7, 1, 3, 1, '300Grams');
INSERT INTO `tbl_orderdetails` VALUES (133, 57, 7, 1, 1, 1, '300Grams');
INSERT INTO `tbl_orderdetails` VALUES (134, 58, 7, 1, 2, 1, '500Grams');
INSERT INTO `tbl_orderdetails` VALUES (135, 58, 7, 1, 5, 3, '500Grams');
INSERT INTO `tbl_orderdetails` VALUES (136, 59, 7, 7, 23, 3, '300Grams');
INSERT INTO `tbl_orderdetails` VALUES (137, 59, 7, 7, 22, 2, '100Grams');
INSERT INTO `tbl_orderdetails` VALUES (138, 60, 7, 1, 5, 1, '100Grams');
INSERT INTO `tbl_orderdetails` VALUES (139, 60, 7, 1, 4, 1, '100Grams');
INSERT INTO `tbl_orderdetails` VALUES (140, 60, 7, 1, 1, 1, '100Grams');
INSERT INTO `tbl_orderdetails` VALUES (141, 61, 7, 1, 5, 1, '100Grams');
INSERT INTO `tbl_orderdetails` VALUES (142, 62, 7, 1, 5, 1, '300Grams');
INSERT INTO `tbl_orderdetails` VALUES (143, 63, 7, 1, 0, 1, '100Grams');
INSERT INTO `tbl_orderdetails` VALUES (144, 64, 7, 1, 5, 1, '100Grams');
INSERT INTO `tbl_orderdetails` VALUES (145, 65, 7, 1, 5, 1, '100Grams');
INSERT INTO `tbl_orderdetails` VALUES (146, 66, 7, 1, 5, 1, '100Grams');
INSERT INTO `tbl_orderdetails` VALUES (147, 67, 7, 1, 5, 1, '100Grams');
INSERT INTO `tbl_orderdetails` VALUES (148, 68, 7, 1, 5, 1, '100Grams');
INSERT INTO `tbl_orderdetails` VALUES (149, 69, 7, 1, 4, 1, '300Grams');
INSERT INTO `tbl_orderdetails` VALUES (150, 70, 7, 1, 4, 1, '300Grams');
INSERT INTO `tbl_orderdetails` VALUES (151, 71, 7, 1, 5, 1, '100Grams');
INSERT INTO `tbl_orderdetails` VALUES (152, 71, 7, 1, 4, 1, '100Grams');
INSERT INTO `tbl_orderdetails` VALUES (153, 72, 7, 1, 4, 1, '500Grams');
INSERT INTO `tbl_orderdetails` VALUES (154, 72, 7, 1, 5, 1, '500Grams');
INSERT INTO `tbl_orderdetails` VALUES (155, 73, 7, 1, 5, 1, '100Grams');
INSERT INTO `tbl_orderdetails` VALUES (156, 73, 7, 1, 4, 1, '100Grams');
INSERT INTO `tbl_orderdetails` VALUES (157, 74, 7, 1, 5, 1, '100Grams');
INSERT INTO `tbl_orderdetails` VALUES (158, 74, 7, 1, 4, 1, '100Grams');
INSERT INTO `tbl_orderdetails` VALUES (159, 75, 7, 1, 4, 1, '100Grams');
INSERT INTO `tbl_orderdetails` VALUES (160, 75, 7, 1, 1, 1, '100Grams');

-- ----------------------------
-- Table structure for tbl_orders
-- ----------------------------
DROP TABLE IF EXISTS `tbl_orders`;
CREATE TABLE `tbl_orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `shipping` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `option` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `schedule_date` timestamp NULL DEFAULT NULL,
  `totalAmount` bigint NULL DEFAULT NULL,
  `status` int NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_orders
-- ----------------------------
INSERT INTO `tbl_orders` VALUES (67, 7, 'Flat rate', 'Schedule Delivery', '2023-10-23 03:23:44', 39500, 1, '2023-10-23 03:34:57', NULL);
INSERT INTO `tbl_orders` VALUES (68, 7, 'Flat rate', 'Pay on delivery', NULL, 39500, 1, '2023-10-23 03:37:10', NULL);
INSERT INTO `tbl_orders` VALUES (69, 7, 'Flat rate', 'Schedule Delivery', '2023-10-23 07:41:47', 39700, 1, '2023-10-23 07:41:47', NULL);
INSERT INTO `tbl_orders` VALUES (70, 7, 'Flat rate', 'Schedule Delivery', '2023-10-23 07:57:42', 39700, 1, '2023-10-23 07:57:42', NULL);
INSERT INTO `tbl_orders` VALUES (71, 7, 'Flat rate', 'Schedule Delivery', '2023-10-24 00:04:37', 79200, 1, '2023-10-24 00:04:37', NULL);
INSERT INTO `tbl_orders` VALUES (72, 7, 'Flat rate', 'Schedule Delivery', '2023-10-24 02:28:49', 79200, 1, '2023-10-24 02:28:54', NULL);
INSERT INTO `tbl_orders` VALUES (73, 7, 'Flat rate', 'Schedule Delivery', '2023-10-24 02:28:49', 79200, 1, '2023-10-24 02:29:32', NULL);
INSERT INTO `tbl_orders` VALUES (74, 7, 'Flat rate', 'Pay on delivery', NULL, 79200, 1, '2023-10-24 02:41:32', NULL);
INSERT INTO `tbl_orders` VALUES (75, 7, 'Flat rate', 'Schedule Delivery', '2023-10-13 04:20:43', 71400, 1, '2023-10-24 07:24:10', NULL);
INSERT INTO `tbl_orders` VALUES (76, 6, 'Flat rate', 'Pay on delivery', NULL, 99700, 1, '2023-11-12 19:18:47', NULL);

-- ----------------------------
-- Table structure for tbl_products
-- ----------------------------
DROP TABLE IF EXISTS `tbl_products`;
CREATE TABLE `tbl_products`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `cat_id` int NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` bigint NULL DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quality` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT 0,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `details` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `receive_date` date NULL DEFAULT NULL,
  `expiry_date` date NULL DEFAULT NULL,
  `coupon_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ratings` float NULL DEFAULT 0,
  `bnpl` int NULL DEFAULT 0,
  `vendor_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_products
-- ----------------------------
INSERT INTO `tbl_products` VALUES (1, 1, 'Mama Gold', 31700, '100Grams,300Grams,500Grams,4Kg', 'Normal', 10, '/upload/flours/img1.png', ' VITAMIN A FORTIFIED', 'Flavor profiles: Describe the taste and flavor profiles of the powders. Mention if they have any distinct flavors or if they are neutral in taste, making them versatile for different recipes.', '2023-08-07 04:37:12', '2023-08-07 04:37:12', NULL, '2023-09-02', '2023-09-28', NULL, 4.3, 0, 4);
INSERT INTO `tbl_products` VALUES (2, 1, 'Eagle', 31700, '100Grams,300Grams,500Grams,4Kg', 'Medium', 20, '/upload/flours/img2.png', 'WHEAT FLOUR', ' Nutritional value: Include details about the nutritional content, such as vitamins, minerals, and protein levels. Highlight any specific health benefits or dietary considerations. ', '2023-08-07 04:37:12', '2023-08-07 04:37:12', NULL, '2023-09-02', '2023-09-22', NULL, 3, 1, 4);
INSERT INTO `tbl_products` VALUES (3, 1, 'Honeywell', 31800, '100Grams,300Grams,500Grams,4Kg', 'Low', 25, '/upload/flours/img3.png', 'MAMA GOLD FLOUR', 'Customer reviews and testimonials: If available, include positive customer reviews and testimonials to showcase the satisfaction and experiences of previous buyers. ', '2023-08-07 04:37:12', '2023-08-07 04:37:12', NULL, '2023-09-02', '2023-09-02', NULL, 3, 0, 4);
INSERT INTO `tbl_products` VALUES (4, 1, 'Diamond', 39700, '100Grams,300Grams,500Grams,4Kg', 'Normal', 20, '/upload/flours/img4.png', 'SUPERIOR QUALITY', 'Clear calls-to-action: Encourage customers to take action by providing clear calls-to-action, such as \"Shop Now,\" \"Add to Cart,\" or \"Discover More.\" Make it easy for customers to proceed with their purchase. ', '2023-08-07 04:37:12', '2023-08-07 04:37:12', NULL, '2023-09-02', '2023-09-02', NULL, 4, 2, 4);
INSERT INTO `tbl_products` VALUES (5, 1, 'Bua', 39500, '100Grams,300Grams,500Grams,4Kg', 'Medium', 28, '/upload/sugars/img1.png', 'REFINED GRANULATED', 'For a healthier alternative, try our coconut sugar. Made from the nectar of coconut palm blossoms, this natural sweetener boasts a delightful caramel-like flavor. With its lower glycemic index, it provides a more sustained energy release. Use it in your f', '2023-08-08 04:58:25', '2023-08-08 04:58:25', NULL, '2023-09-02', '2023-09-02', NULL, 3, 0, 4);
INSERT INTO `tbl_products` VALUES (6, 2, 'Dangote Sugar', 9800, '100Grams,300Grams,500Grams,4Kg', 'High', 45, '/upload/sugars/img2.png', 'SUGAR REFINERY', 'Experience the delicate sweetness and fine texture of our powdered sugar. Perfect for dusting over pastries, creating smooth frostings, or adding a touch of sweetness to your hot beverages, our powdered sugar will effortlessly elevate your culinary creati', '2023-08-08 04:59:18', '2023-08-08 04:59:18', NULL, '2023-09-02', '2023-09-02', NULL, 0, 1, 5);
INSERT INTO `tbl_products` VALUES (7, 2, 'Bua Sugar', 5200, '100Grams,300Grams,500Grams,4Kg', 'Low', 25, '/upload/salts/img1.png', 'DANGOTE FILE ENIBLE', 'Experience the purity and versatility of our Himalayan Pink Salt. Mined from ancient salt deposits in the Himalayan mountains, this mineral-rich salt adds a delicate balance of flavor to your recipes. Sprinkle it over roasted vegetables, season grilled me', '2023-08-09 05:00:08', '2023-08-09 05:00:08', NULL, '2023-09-02', '2023-09-02', NULL, 0, 0, 5);
INSERT INTO `tbl_products` VALUES (8, 3, 'Dangote salt', 5250, '100Grams,300Grams,500Grams,4Kg', 'Normal', 40, '/upload/salts/img2.png', 'DANGOTE FILE ENIBLE', 'Discover the beauty of our flavored salts, meticulously crafted to tantalize your senses. From zesty citrus-infused salts to aromatic truffle salts, each variety offers a unique twist to your culinary creations. Elevate your dishes with a pinch of these e', '2023-08-09 05:01:50', '2023-08-09 05:01:50', NULL, '2023-09-02', '2023-09-02', NULL, 0, 2, 5);
INSERT INTO `tbl_products` VALUES (9, 3, 'Mr Chef', 5100, '100Grams,300Grams,500Grams,4Kg', 'Medium', 20, '/upload/salts/img3.png', 'DANGOTE FILE ENIBLE', 'Transport your taste buds to the Mediterranean with our hand-harvested Sea Salt. Sourced from pristine coastal regions, this salt captures the essence of the sea, delivering a burst of natural brininess and enhancing the flavors of seafood, salads, and ma', '2023-08-09 05:02:17', '2023-08-09 05:02:17', NULL, '2023-09-02', '2023-09-02', NULL, 0, 0, 5);
INSERT INTO `tbl_products` VALUES (10, 4, 'Rhoda', 29200, '100Grams,300Grams,500Grams,4Kg', 'High', 10, '/upload/margarines/img1.png', 'Vitali Margarine', 'For a unique and bold flavor profile, try our Smoked Salt. Infused with aromatic wood smoke, this salt adds a rich and smoky dimension to your dishes. Perfect for seasoning grilled meats, enhancing barbecue sauces, or adding a hint of complexity to roaste', '2023-08-10 05:04:40', '2023-08-10 05:04:40', NULL, '2023-09-02', '2023-09-02', NULL, 0, 0, 5);
INSERT INTO `tbl_products` VALUES (11, 4, 'Napa', 14203, '100Grams,300Grams,500Grams,4Kg', 'Medium', 20, '/upload/margarines/img2.png', 'Simas Margarine', 'Indulge in the richness of our vegan margarine, specially crafted for those following a plant-based lifestyle. With its creamy texture and buttery taste, it is the ideal choice for baking, cooking, or simply enjoying on a warm slice of bread. ', '2023-08-10 05:04:40', '2023-08-10 05:04:40', NULL, '2023-09-02', '2023-09-02', NULL, 0, 0, 5);
INSERT INTO `tbl_products` VALUES (12, 4, 'Topper M', 24150, '100Grams,300Grams,500Grams,4Kg', 'Low', 25, '/upload/margarines/img3.png', 'Topper Margarine', 'Experience the smooth and creamy goodness of our plant-based margarine, perfect for spreading on toast, melting over freshly baked goods, or incorporating into your favorite recipes. Made from a blend of natural oils, it offers a rich and indulgent flavor', '2023-08-10 05:04:40', '2023-08-10 05:04:40', NULL, '2023-09-02', '2023-09-02', NULL, 0, 1, 5);
INSERT INTO `tbl_products` VALUES (13, 4, 'Hango', 25100, '100Grams,300Grams,500Grams,4Kg', 'Normal', 20, '/upload/margarines/img4.png', 'Hango Margarine', 'Our margarines are available in convenient packaging, ensuring freshness and ease of use. With their smooth consistency and exceptional flavor, they are a versatile addition to any kitchen.', '2023-08-10 05:04:40', '2023-08-10 05:04:40', NULL, '2023-09-02', '2023-09-02', NULL, 0, 0, 5);
INSERT INTO `tbl_products` VALUES (14, 4, 'Rhoda M', 30700, '100Grams,300Grams,500Grams,4Kg', 'Medium', 30, '/upload/margarines/img5.png', 'Rhoda Margarine', 'For those seeking a heart-healthy option, our cholesterol-free margarine is a perfect choice. Made with a special blend of oils, it provides a delicious alternative without compromising on taste or quality. Spread it on your morning bagel or use it as a v', '2023-08-10 05:04:40', '2023-08-10 05:04:40', NULL, '2023-09-02', '2023-09-02', NULL, 0, 2, 5);
INSERT INTO `tbl_products` VALUES (15, 4, 'Topper', 22150, '100Grams,300Grams,500Grams,4Kg', 'High', 45, '/upload/margarines/img6.png', 'Endy Margarine', 'Indulge in the richness of our vegan margarine, specially crafted for those following a plant-based lifestyle. With its creamy texture and buttery taste, it is the ideal choice for baking, cooking, or simply enjoying on a warm slice of bread. ', '2023-08-10 05:04:40', '2023-08-10 05:04:40', NULL, '2023-09-02', '2023-09-02', NULL, 0, 1, 5);
INSERT INTO `tbl_products` VALUES (16, 5, 'Kings oil', 30155, '100Grams,300Grams,500Grams,4Kg', 'Medium', 25, '/upload/vegetableoils/img1.png', 'VEGETABLE OIL', '\r\nDiscover the delicate and nutty flavor of our cold-pressed avocado oil. Sourced from premium avocados, this oil is rich in monounsaturated fats and vitamin E, making it a nutritious choice for dressings, marinades, and drizzling over roasted vegetables.', '2023-08-11 05:09:48', '2023-08-11 05:09:48', NULL, '2023-09-02', '0000-00-00', NULL, 0, 0, 5);
INSERT INTO `tbl_products` VALUES (17, 5, 'Emperor oil', 26000, '100Grams,300Grams,500Grams,4Kg', 'Low', 40, '/upload/vegetableoils/img2.png', 'EMPEROR OIL', 'For a lighter option, our sunflower oil is a versatile cooking companion. Extracted from carefully selected sunflower seeds, this oil has a mild flavor and a high smoke point, making it ideal for frying, sautéing, and baking. Its neutral taste allows the ', '2023-08-11 05:09:48', '2023-08-11 05:09:48', NULL, '2023-09-02', '2023-09-02', NULL, 0, 1, 34);
INSERT INTO `tbl_products` VALUES (18, 6, 'Royal yeast', 25000, '100Grams,300Grams,500Grams,4Kg', 'High', 10, '/upload/yeastimproves/img1.png', 'saf-instant Imporves', '\r\nJoin the community of passionate bakers who have embraced our yeast and improvers, and experience the difference in your baking. Shop now and elevate your baking game with our premium range of yeast and improvers.\"', '2023-08-12 05:13:25', '2023-08-12 05:13:25', NULL, '2023-09-02', '2023-09-02', NULL, 0, 0, 34);
INSERT INTO `tbl_products` VALUES (19, 6, 'Instant yeast', 27000, '100Grams,300Grams,500Grams,4Kg', 'Normal', 20, '/upload/yeastimproves/img2.png', 'Banking powder Imporves', 'Our yeast and improvers come in convenient packaging, ensuring freshness and ease of use. With our premium products, you can unleash your creativity in the kitchen and delight your family and friends with irresistible baked treats. ', '2023-08-12 05:13:25', '2023-08-12 05:13:25', NULL, '2023-09-02', '2023-09-02', NULL, 0, 2, 34);
INSERT INTO `tbl_products` VALUES (20, 6, 'Eagle yeast', 28500, '100Grams,300Grams,500Grams,4Kg', 'High', 25, '/upload/yeastimproves/img3.png', 'INSTANT DRY YEAST', 'For those seeking gluten-free options, our gluten-free yeast and improvers are the perfect choice. Crafted with care and precision, these products ensure that even gluten-free baked goods achieve the desired texture and rise. Enjoy the taste and texture y', '2023-08-12 05:13:25', '2023-08-12 05:13:25', NULL, '2023-09-02', '2023-09-02', NULL, 0, 0, 34);
INSERT INTO `tbl_products` VALUES (21, 6, 'Crest Baking Powder', 26500, '100Grams,300Grams,500Grams,4Kg', 'Low', 20, '/upload/yeastimproves/img4.png', 'INSTANT DRY YEAST', 'Take your bread-making to the next level with our range of bread improvers. Specially formulated to enhance dough texture, increase volume, and improve shelf life, our bread improvers are the secret weapon for artisanal loaves and soft, moist sandwich bre', '2023-08-12 05:13:25', '2023-08-12 05:13:25', NULL, '2023-09-02', '2023-09-02', NULL, 0, 2, 34);
INSERT INTO `tbl_products` VALUES (22, 7, 'Amor baking powder ', 9800, '100Grams,300Grams,500Grams,4Kg', 'High', 30, '/upload/bakingpowders/img1.png', 'Banking Powder', 'For those seeking a gluten-free option, our gluten-free baking powder is a game-changer. Made with carefully selected ingredients, it ensures that even gluten-free recipes achieve the desired rise and texture. Enjoy the same great results without compromi', '2023-08-13 05:24:36', '2023-08-13 05:24:36', NULL, '2023-09-02', '2023-09-02', NULL, 0, 0, 34);
INSERT INTO `tbl_products` VALUES (23, 7, 'Longman', 5200, '100Grams,300Grams,500Grams,4Kg', 'Medium', 45, '/upload/bakingpowders/img2.png', 'Banking Powder', 'Discover the convenience of our pre-measured baking powder packets. Each packet contains the exact amount needed for your recipes, taking the guesswork out of measuring. It\'s the perfect solution for hassle-free baking and ensures consistent results every', '2023-08-13 05:24:36', '2023-08-13 05:24:36', NULL, '2023-09-02', '2023-09-02', NULL, 0, 0, 34);
INSERT INTO `tbl_products` VALUES (24, 7, 'Domo Baking Powder', 5250, '100Grams,300Grams,500Grams,4Kg', 'High', 25, '/upload/bakingpowders/img3.png', 'Banking Powder', 'Our baking powders are packaged in airtight containers to maintain freshness and potency. With our premium quality baking powders, you can confidently explore new recipes, impress your loved ones, and create delectable treats that will leave everyone want', '2023-08-13 05:24:36', '2023-08-13 05:24:36', NULL, '2023-09-02', '2023-09-02', NULL, 0, 2, 34);
INSERT INTO `tbl_products` VALUES (25, 7, 'Pekad Baking Powder', 4400, '100Grams,300Grams,500Grams,4Kg', 'Normal', 40, '/upload/bakingpowders/img4.png', 'Banking Powder', 'Join the community of passionate bakers who have embraced our baking powders and experience the difference in your baked goods. Shop now and elevate your baking game with our exceptional range of baking powders.\"', '2023-08-13 05:24:36', '2023-08-13 05:24:36', NULL, '2023-09-02', '2023-09-02', NULL, 0, 0, 34);
INSERT INTO `tbl_products` VALUES (26, 7, 'Foster Clark’s Baking Powder', 39500, '100Grams,300Grams,500Grams,4Kg', 'Low', 20, '/upload/bakingpowders/img5.png', 'Banking Powder', 'Experience the magic of our double-acting baking powder, a must-have for every baker\'s pantry. With its unique two-stage leavening process, it provides consistent and reliable results, ensuring your cakes, muffins, and cookies rise to perfection. Say good', '2023-08-13 05:24:36', '2023-08-13 05:24:36', NULL, '2023-09-02', '2023-09-02', NULL, 0, 0, 34);
INSERT INTO `tbl_products` VALUES (27, 7, 'Crest Baking Powder M', 4781, '100Grams,300Grams,500Grams,4Kg', 'High', 20, '/upload/bakingpowders/img6.png', 'Banking Powder', 'For those seeking a gluten-free option, our gluten-free baking powder is a game-changer. Made with carefully selected ingredients, it ensures that even gluten-free recipes achieve the desired rise and texture. Enjoy the same great results without compromi', '2023-08-13 05:24:36', '2023-08-13 05:24:36', NULL, '2023-09-02', '2023-09-02', NULL, 0, 2, 34);

-- ----------------------------
-- Table structure for tbl_reviews
-- ----------------------------
DROP TABLE IF EXISTS `tbl_reviews`;
CREATE TABLE `tbl_reviews`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ratings` int NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_reviews
-- ----------------------------
INSERT INTO `tbl_reviews` VALUES (1, 1, 6, 'Keller Won', 'won@gmail.com', 'Pellentesque havitant morbi tristique senectus et netus et malesuada fames asturipis egestas. Suspendisse eget facilisiss odio. Duis sodales augue eu tincidunt faucibus. Etiam justo ligula, placeat ac augue id, volut pat porta dui.', 5, '2023-08-23 11:30:58', '2023-08-23 11:30:58', NULL);
INSERT INTO `tbl_reviews` VALUES (2, 5, 5, 'Michael Smith', 'smell@gmail.com', 'Pellentesque havitant morbi tristique senectus et netus et malesuada fames asturipis egestas. Suspendisse eget facilisiss odio. Duis sodales augue eu tincidunt faucibus. Etiam justo ligula, placeat ac augue id, volut pat porta dui.', 5, '2023-08-31 11:30:58', '2023-08-31 11:30:58', NULL);
INSERT INTO `tbl_reviews` VALUES (3, 5, 6, 'Smart Alert', 'won@gmail.com', 'Pellentesque havitant morbi tristique senectus et netus et malesuada fames asturipis egestas. Suspendisse eget facilisiss odio. Duis sodales augue eu tincidunt faucibus. Etiam justo ligula, placeat ac augue id, volut pat porta dui.', 4, '2023-09-14 11:30:58', '2023-09-14 11:30:58', NULL);
INSERT INTO `tbl_reviews` VALUES (37, 3, 6, 'Keller Won', 'won@gmail.com', 'Pellentesque havitant morbi tristique senectus et netus et malesuada fames asturipis egestas. Suspendisse eget facilisiss odio. Duis sodales augue eu tincidunt faucibus. Etiam justo ligula, placeat ac augue id, volut pat porta dui.', 3, '2023-08-23 11:30:58', '2023-08-23 11:30:58', NULL);
INSERT INTO `tbl_reviews` VALUES (38, 1, 5, 'Jhon Smell', 'smell@gmail.com', 'Pellentesque havitant morbi tristique senectus et netus et malesuada fames asturipis egestas. Suspendisse eget facilisiss odio. Duis sodales augue eu tincidunt faucibus. Etiam justo ligula, placeat ac augue id, volut pat porta dui.', 2, '2023-08-31 11:30:58', '2023-08-31 11:30:58', NULL);
INSERT INTO `tbl_reviews` VALUES (39, 3, 6, 'Robert William', 'won@gmail.com', 'Pellentesque havitant morbi tristique senectus et netus et malesuada fames asturipis egestas. Suspendisse eget facilisiss odio. Duis sodales augue eu tincidunt faucibus. Etiam justo ligula, placeat ac augue id, volut pat porta dui.', 1, '2023-09-14 11:30:58', '2023-09-14 11:30:58', NULL);
INSERT INTO `tbl_reviews` VALUES (40, 2, 6, 'David Chen', 'won@gmail.com', 'Pellentesque havitant morbi tristique senectus et netus et malesuada fames asturipis egestas. Suspendisse eget facilisiss odio. Duis sodales augue eu tincidunt faucibus. Etiam justo ligula, placeat ac augue id, volut pat porta dui.', 1, '2023-08-23 11:30:58', '2023-08-23 11:30:58', NULL);
INSERT INTO `tbl_reviews` VALUES (41, 3, 7, 'Keller Hellen', 'Keller@gmail.com', 'Pellentesque havitant morbi tristique senectus et netus et malesuada fames asturipis egestas. Suspendisse eget facilisiss odio. Duis sodales augue eu tincidunt faucibus. Etiam justo ligula, placeat ac augue id, volut pat porta dui.', 5, '2023-10-03 04:24:00', '2023-10-03 04:24:00', NULL);
INSERT INTO `tbl_reviews` VALUES (42, 4, 7, 'Michael Smith', 'Michael@gmail.com', 'Pellentesque havitant morbi tristique senectus et netus et malesuada fames asturipis egestas. Suspendisse eget facilisiss odio. Duis sodales augue eu tincidunt faucibus. Etiam justo ligula, placeat ac augue id, volut pat porta dui.', 4, '2023-10-03 04:34:15', '2023-10-03 04:34:15', NULL);
INSERT INTO `tbl_reviews` VALUES (43, 3, 7, 'Oops', 'oops@gmail.com', 'Pellentesque havitant morbi tristique senectus et netus et malesuada fames asturipis egestas. Suspendisse eget facilisiss odio. Duis sodales augue eu tincidunt faucibus. Etiam justo ligula, placeat ac augue id, volut pat porta dui.', 2, '2023-10-03 05:51:52', '2023-10-03 05:51:52', NULL);
INSERT INTO `tbl_reviews` VALUES (44, 2, 7, 'Dui', 'Dui@gmail.com', 'Pellentesque havitant morbi tristique senectus et netus et malesuada fames asturipis egestas. Suspendisse eget facilisiss odio. Duis sodales augue eu tincidunt faucibus. Etiam justo ligula, placeat ac augue id, volut pat porta dui.', 5, '2023-10-03 05:52:45', '2023-10-03 05:52:45', NULL);
INSERT INTO `tbl_reviews` VALUES (45, 2, 7, 'Heller', '`Heller@gmail.com', 'Pellentesque havitant morbi tristique senectus et netus et malesuada fames asturipis egestas. Suspendisse eget facilisiss odio. Duis sodales augue eu tincidunt faucibus. Etiam justo ligula, placeat ac augue id, volut pat porta dui.', 5, '2023-10-03 05:55:55', '2023-10-03 05:55:55', NULL);
INSERT INTO `tbl_reviews` VALUES (46, 1, 7, 'Michael', 'Smeller@gmail.com', 'Pellentesque havitant morbi tristique senectus et netus et malesuada fames asturipis egestas. Suspendisse eget facilisiss odio. Duis sodales augue eu tincidunt faucibus. Etiam justo ligula, placeat ac augue id, volut pat porta dui.', 5, '2023-10-04 06:30:21', '2023-10-04 06:30:21', NULL);

-- ----------------------------
-- Table structure for tbl_segment
-- ----------------------------
DROP TABLE IF EXISTS `tbl_segment`;
CREATE TABLE `tbl_segment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_segment
-- ----------------------------
INSERT INTO `tbl_segment` VALUES (1, 'Frequent Buyer', 'Frequent Buyer\r\n\r\n', '2023-09-04 20:32:50', '2023-09-03 23:33:43', NULL);
INSERT INTO `tbl_segment` VALUES (2, 'New Customer', 'New Customer', '2023-09-04 20:32:50', '2023-09-03 23:33:43', NULL);
INSERT INTO `tbl_segment` VALUES (3, 'High-Value Customer', 'High-Value Customer', '2023-09-04 20:32:50', '2023-09-03 23:33:43', NULL);
INSERT INTO `tbl_segment` VALUES (4, 'Budget Customer', 'Budget Customer', '2023-09-04 20:32:50', '2023-09-03 23:33:43', NULL);

-- ----------------------------
-- Table structure for tbl_sent
-- ----------------------------
DROP TABLE IF EXISTS `tbl_sent`;
CREATE TABLE `tbl_sent`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `segment_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_sent
-- ----------------------------
INSERT INTO `tbl_sent` VALUES (8, 'Flours Discount', 'Flours Discount Content', '1', '2023-09-04 03:31:38', NULL);
INSERT INTO `tbl_sent` VALUES (9, 'Flours Discount1', 'Flours Discount Content1', 'all', '2023-09-04 03:32:09', NULL);
INSERT INTO `tbl_sent` VALUES (36, 'New notification', 'New notification', 'all', '2023-09-05 08:59:41', NULL);
INSERT INTO `tbl_sent` VALUES (37, 'Hello, New Customers', 'The new things added on our store.', '2', '2023-09-05 11:01:29', NULL);
INSERT INTO `tbl_sent` VALUES (38, 'Hello, customer', 'The new things added on our store.', 'all', '2023-09-05 11:02:13', NULL);
INSERT INTO `tbl_sent` VALUES (39, 'Mama Gold', 'Mama gold is a good product.', 'all', '2023-10-02 07:26:43', NULL);
INSERT INTO `tbl_sent` VALUES (40, '1', '123', '1', '2023-10-04 13:10:54', '2023-10-06 05:23:09');
INSERT INTO `tbl_sent` VALUES (41, 'Mama Gold', 'Mama gold is a good product.\r\nPlease contact with me to buy', 'all', '2023-10-04 23:25:49', NULL);

-- ----------------------------
-- Table structure for tbl_users
-- ----------------------------
DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE `tbl_users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_status` int NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int NULL DEFAULT 1,
  `role` int NULL DEFAULT NULL,
  `segment_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_users
-- ----------------------------
INSERT INTO `tbl_users` VALUES (4, 'Proqure', 'admin', 'admin@gmail.com', '$2b$10$WJMHEheZJma.hTO38IiF6OzD2PYfq7hHzAjH3uPys9f2lyZkXLQ9q', 'Agenda', '6151501227500', '\\upload\\avatar\\1693685046532\\3.png', 0, '2023-08-17 14:27:54', NULL, '2023-08-17 14:27:54', 2, 1, NULL);
INSERT INTO `tbl_users` VALUES (5, 'Jhons', 'Smell', 'vendor1@gmail.com', '$2b$10$WJMHEheZJma.hTO38IiF6OzD2PYfq7hHzAjH3uPys9f2lyZkXLQ9q', 'Proqure', '7152561213500', '\\upload\\avatar\\1693676382636\\3.png', 0, '2023-08-17 14:28:53', NULL, '2023-08-17 14:28:53', 2, 2, NULL);
INSERT INTO `tbl_users` VALUES (6, 'Keller', 'Won', 'keller@gmail.com', '$2b$10$WJMHEheZJma.hTO38IiF6OzD2PYfq7hHzAjH3uPys9f2lyZkXLQ9q', 'Proqure', '3452801850211', '\\upload\\avatar\\1693685010791\\5.png', 0, '2023-08-17 15:10:59', NULL, '2023-08-17 15:10:59', 2, 4, '2');
INSERT INTO `tbl_users` VALUES (7, 'Michael', 'Smith', 'customer2@gmail.com', '$2b$10$WJMHEheZJma.hTO38IiF6OzD2PYfq7hHzAjH3uPys9f2lyZkXLQ9q', 'Agenda', '9152224377532', '\\upload\\avatar\\1693684923263\\4.png', 0, '2023-08-17 19:02:34', NULL, '2023-08-17 19:02:34', 2, 4, '4');
INSERT INTO `tbl_users` VALUES (31, 'Smile', 'Sar', 'customer3@gmail.com', '$2b$10$WJMHEheZJma.hTO38IiF6OzD2PYfq7hHzAjH3uPys9f2lyZkXLQ9q', 'Proqure', '3154501127502', '\\upload\\avatar\\1693685088411\\7.png', 0, '2023-08-17 19:02:34', NULL, '2023-08-17 19:02:34', 2, 4, '2');
INSERT INTO `tbl_users` VALUES (32, 'Que', 'Car', 'customer4@gmail.com', '$2b$10$WJMHEheZJma.hTO38IiF6OzD2PYfq7hHzAjH3uPys9f2lyZkXLQ9q', 'Proqure', '6151501227500', '\\upload\\avatar\\1693676399755\\6.png', 0, '2023-08-17 14:28:53', NULL, '2023-08-17 14:28:53', 2, 4, '1');
INSERT INTO `tbl_users` VALUES (33, 'Smile', 'Nes', 'customer5@gmail.com', '$2b$10$WJMHEheZJma.hTO38IiF6OzD2PYfq7hHzAjH3uPys9f2lyZkXLQ9q', 'Proqure', '7152561213500', '\\upload\\avatar\\1693685024053\\1.png', 0, '2023-08-17 15:10:59', NULL, '2023-08-17 15:10:59', 2, 4, '2');
INSERT INTO `tbl_users` VALUES (34, 'Uing', 'Smi', 'vendor2@gmail.com', '$2b$10$WJMHEheZJma.hTO38IiF6OzD2PYfq7hHzAjH3uPys9f2lyZkXLQ9q', 'Agenda', '3452801850211', '\\upload\\avatar\\1693684952709\\img5.png', 0, '2023-08-17 19:02:34', NULL, '2023-08-17 19:02:34', 2, 2, NULL);
INSERT INTO `tbl_users` VALUES (35, 'Won', 'Rel', 'won@gmail.com', '$2b$10$WJMHEheZJma.hTO38IiF6OzD2PYfq7hHzAjH3uPys9f2lyZkXLQ9q', 'Proqure', '9152224377532', '\\upload\\avatar\\1693685001848\\3.png', 0, '2023-08-17 19:02:34', NULL, '2023-08-17 19:02:34', 2, 3, NULL);
INSERT INTO `tbl_users` VALUES (38, 'Yau', 'Ain', 'customer5@gmail.com', '$2b$10$WJMHEheZJma.hTO38IiF6OzD2PYfq7hHzAjH3uPys9f2lyZkXLQ9q', 'Agenda', '6151501227500', '\\upload\\avatar\\1693676415783\\5.png', 0, '2023-08-17 14:27:54', NULL, '2023-08-17 14:27:54', 2, 4, NULL);
INSERT INTO `tbl_users` VALUES (39, 'Uki', 'Poe', 'vendor3@gmail.com', '$2b$10$WJMHEheZJma.hTO38IiF6OzD2PYfq7hHzAjH3uPys9f2lyZkXLQ9q', 'Proqure', '7152561213500', '\\upload\\avatar\\1693685035820\\6.png', 0, '2023-08-17 14:28:53', NULL, '2023-08-17 14:28:53', 2, 2, NULL);
INSERT INTO `tbl_users` VALUES (40, 'Mui', 'Yune', 'customer6@gmail.com', '$2b$10$WJMHEheZJma.hTO38IiF6OzD2PYfq7hHzAjH3uPys9f2lyZkXLQ9q', 'Proqure', '3452801850211', '\\upload\\avatar\\1693676342648\\img1.png', 0, '2023-08-17 15:10:59', NULL, '2023-08-17 15:10:59', 2, 4, '');
INSERT INTO `tbl_users` VALUES (41, 'Noller', 'Pol', 'noller@gmail.com', '$2b$10$WJMHEheZJma.hTO38IiF6OzD2PYfq7hHzAjH3uPys9f2lyZkXLQ9q', 'Agenda', '9152224377532', '\\upload\\avatar\\1693676296552\\img2.png', 0, '2023-08-17 19:02:34', NULL, '2023-08-17 19:02:34', 1, 3, NULL);

-- ----------------------------
-- Table structure for tbl_wish
-- ----------------------------
DROP TABLE IF EXISTS `tbl_wish`;
CREATE TABLE `tbl_wish`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `product_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 262 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_wish
-- ----------------------------
INSERT INTO `tbl_wish` VALUES (138, 13, 2);
INSERT INTO `tbl_wish` VALUES (139, 13, 16);
INSERT INTO `tbl_wish` VALUES (140, 13, 17);
INSERT INTO `tbl_wish` VALUES (141, 13, 8);
INSERT INTO `tbl_wish` VALUES (143, 3, 7);
INSERT INTO `tbl_wish` VALUES (146, 3, 1);
INSERT INTO `tbl_wish` VALUES (147, 13, 1);
INSERT INTO `tbl_wish` VALUES (148, 3, 6);
INSERT INTO `tbl_wish` VALUES (149, 3, 12);
INSERT INTO `tbl_wish` VALUES (150, 3, 15);
INSERT INTO `tbl_wish` VALUES (151, 5, 8);
INSERT INTO `tbl_wish` VALUES (152, 5, 9);
INSERT INTO `tbl_wish` VALUES (153, 5, 7);
INSERT INTO `tbl_wish` VALUES (154, 35, 2);
INSERT INTO `tbl_wish` VALUES (155, 35, 3);
INSERT INTO `tbl_wish` VALUES (156, 35, 4);
INSERT INTO `tbl_wish` VALUES (160, 6, 6);
INSERT INTO `tbl_wish` VALUES (161, 6, 8);
INSERT INTO `tbl_wish` VALUES (162, 4, 2);
INSERT INTO `tbl_wish` VALUES (163, 4, 12);
INSERT INTO `tbl_wish` VALUES (164, 4, 14);
INSERT INTO `tbl_wish` VALUES (168, 6, 4);
INSERT INTO `tbl_wish` VALUES (169, 6, 5);
INSERT INTO `tbl_wish` VALUES (170, 6, 7);
INSERT INTO `tbl_wish` VALUES (251, 4, 13);
INSERT INTO `tbl_wish` VALUES (252, 4, 3);
INSERT INTO `tbl_wish` VALUES (258, 7, 5);
INSERT INTO `tbl_wish` VALUES (260, 7, 4);
INSERT INTO `tbl_wish` VALUES (261, 7, 1);

SET FOREIGN_KEY_CHECKS = 1;
