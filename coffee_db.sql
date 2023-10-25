DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
	`me_user_id`	varchar(20)	NOT NULL,
	`me_pw`	varchar(255)	NULL,
	`me_name`	varchar(50)	NULL,
	`me_email`	varchar(30)	NULL,
	`me_deposit`	int	NULL,
	`me_point`	int	NULL,
	`me_authority`	varchar(5)	NULL,
	`me_session_id`	varchar(255)	NULL,
	`me_session_limit`	datetime	NULL,
	`me_ip`	varchar(255)	NULL
);

DROP TABLE IF EXISTS `business_member`;

CREATE TABLE `business_member` (
	`bm_id`	varchar(50)	NOT NULL,
	`bm_pw`	varchar(255)	NULL,
	`bm_num`	varchar(20)	NULL,
	`bm_phone`	varchar(13)	NULL,
	`bm_contents`	longtext	NULL,
	`bm_address`	varchar(255)	NULL,
	`bm_geocoding`	varchar(100)	NULL,
	`bm_manager`	varchar(10)	NULL,
	`bm_seat`	int	NULL,
	`bm_parking`	varchar(5)	NULL,
	`bm_drive`	varchar(5)	NULL,
	`bm_store_name`	varchar(30)	NULL
);

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
	`mn_num`	int	NOT NULL,
	`mn_name`	varchar(50)	NULL,
	`mn_contents`	longtext	NULL,
	`mn_price`	int	NULL,
	`mn_st_num`	int	NOT NULL,
	`mn_mc_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `image`;

CREATE TABLE `image` (
	`im_num`	int	NOT NULL,
	`im_ori_name`	varchar(255)	NULL,
	`im_name`	varchar(50)	NULL,
	`im_contents`	longtext	NULL,
	`im_tableName`	varchar(20)	NULL,
	`im_tableNum`	int	NULL
);

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
	`or_num`	int	NOT NULL,
	`or_time`	datetime	NULL,
	`or_drinks`	varchar(20)	NULL
);

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
	`user_id`	varchar(20)	NOT NULL,
	`user_aorb`	varchar(10)	NULL,
	`user_phone`	varchar(15)	NULL
);

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
	`re_num`	int	NOT NULL,
	`re_contens`	longtext	NULL,
	`re_star`	int	NULL,
	`re_oi_num`	int	NOT NULL,
	`re_ol_num`	int	NOT NULL,
	`re_or_num2`	int	NOT NULL
);

DROP TABLE IF EXISTS `menu_option`;

CREATE TABLE `menu_option` (
	`mo_num`	int	NOT NULL,
	`mo_option1`	varchar(20)	NULL,
	`mo_option2`	varchar(20)	NULL,
	`mo_option3`	varchar(20)	NULL,
	`mo_op_price1`	int	NULL,
	`mo_op_price2`	int	NULL,
	`mo_op_price3`	int	NULL,
	`mo_op_name`	varchar(20)	NULL,
	`mo_mn_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `store`;

CREATE TABLE `store` (
	`st_num`	int	NOT NULL,
	`st_br_name`	varchar(20)	NOT NULL,
	`st_bm_id`	varchar(50)	NOT NULL,
	`st_open`	varchar(5)	NULL,
	`st_opentime`	datetime	NULL,
	`st_closetime`	datetime	NULL,
	`st_image`	varchar(50)	NULL
);

DROP TABLE IF EXISTS `shop_basket`;

CREATE TABLE `shop_basket` (
	`sb_num`	int	NOT NULL,
	`sb_mn_num`	int	NOT NULL,
	`sb_quantity`	int	NULL,
	`sb_user_id`	varchar(20)	NOT NULL
);

DROP TABLE IF EXISTS `promotion`;

CREATE TABLE `promotion` (
	`pr_num`	int	NOT NULL,
	`pr_contents`	longtext	NULL,
	`Field`	VARCHAR(255)	NULL,
	`pr_discount`	int	NULL,
	`pr_save`	int	NULL
);

DROP TABLE IF EXISTS `advertisement`;

CREATE TABLE `advertisement` (
	`ad_num`	int	NOT NULL,
	`ad_contents`	longtext	NULL,
	`ad_image`	varchar(255)	NULL,
	`ad_date`	datetime	NULL,
	`ad_st_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `meetingroom`;

CREATE TABLE `meetingroom` (
	`room_num`	int	NOT NULL,
	`room_st_num`	int	NOT NULL,
	`room_price`	int	NULL,
	`room_seat`	int	NULL,
	`room_etc`	varchar(100)	NULL,
	`room_starttime`	datetime	NULL,
	`room_endtime`	datetime	NULL
);

DROP TABLE IF EXISTS `reservation`;

CREATE TABLE `reservation` (
	`rs_num`	int	NOT NULL,
	`rs_start`	datetime	NULL,
	`rs_end`	datetime	NULL,
	`re_date`	datetime	NULL,
	`rs_room_num`	int	NOT NULL,
	`rs_able`	varchar(20)	NULL
);

DROP TABLE IF EXISTS `order_list`;

CREATE TABLE `order_list` (
	`ol_num`	int	NOT NULL,
	`ol_or_num`	int	NOT NULL,
	`ol_oi_id`	varchar(20)	NOT NULL,
	`ol_or_num2`	int	NOT NULL
);

DROP TABLE IF EXISTS `promotion_on`;

CREATE TABLE `promotion_on` (
	`po_or_num`	int	NOT NULL,
	`po_pr_num`	int	NOT NULL
);

DROP TABLE IF EXISTS `brand`;

CREATE TABLE `brand` (
	`br_name`	varchar(20)	NOT NULL,
	`br_logo`	varchar(30)	NULL
);

DROP TABLE IF EXISTS `large_category`;

CREATE TABLE `large_category` (
	`lc_num`	int	NOT NULL,
	`lc_name`	varchar(20)	NULL
);

DROP TABLE IF EXISTS `medium_category`;

CREATE TABLE `medium_category` (
	`mc_num`	int	NOT NULL,
	`mc_lc_num`	int	NOT NULL,
	`mc_name`	varchar(20)	NULL
);

ALTER TABLE `member` ADD CONSTRAINT `PK_MEMBER` PRIMARY KEY (
	`me_user_id`
);

ALTER TABLE `business_member` ADD CONSTRAINT `PK_BUSINESS_MEMBER` PRIMARY KEY (
	`bm_id`
);

ALTER TABLE `menu` ADD CONSTRAINT `PK_MENU` PRIMARY KEY (
	`mn_num`
);

ALTER TABLE `image` ADD CONSTRAINT `PK_IMAGE` PRIMARY KEY (
	`im_num`
);

ALTER TABLE `order` ADD CONSTRAINT `PK_ORDER` PRIMARY KEY (
	`or_num`
);

ALTER TABLE `user` ADD CONSTRAINT `PK_USER` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `review` ADD CONSTRAINT `PK_REVIEW` PRIMARY KEY (
	`re_num`
);

ALTER TABLE `menu_option` ADD CONSTRAINT `PK_MENU_OPTION` PRIMARY KEY (
	`mo_num`
);

ALTER TABLE `store` ADD CONSTRAINT `PK_STORE` PRIMARY KEY (
	`st_num`
);

ALTER TABLE `shop_basket` ADD CONSTRAINT `PK_SHOP_BASKET` PRIMARY KEY (
	`sb_num`
);

ALTER TABLE `promotion` ADD CONSTRAINT `PK_PROMOTION` PRIMARY KEY (
	`pr_num`
);

ALTER TABLE `advertisement` ADD CONSTRAINT `PK_ADVERTISEMENT` PRIMARY KEY (
	`ad_num`
);

ALTER TABLE `meetingroom` ADD CONSTRAINT `PK_MEETINGROOM` PRIMARY KEY (
	`room_num`
);

ALTER TABLE `reservation` ADD CONSTRAINT `PK_RESERVATION` PRIMARY KEY (
	`rs_num`
);

ALTER TABLE `order_list` ADD CONSTRAINT `PK_ORDER_LIST` PRIMARY KEY (
	`ol_num`
);

ALTER TABLE `promotion_on` ADD CONSTRAINT `PK_PROMOTION_ON` PRIMARY KEY (
	`po_or_num`
);

ALTER TABLE `brand` ADD CONSTRAINT `PK_BRAND` PRIMARY KEY (
	`br_name`
);

ALTER TABLE `large_category` ADD CONSTRAINT `PK_LARGE_CATEGORY` PRIMARY KEY (
	`lc_num`
);

ALTER TABLE `medium_category` ADD CONSTRAINT `PK_MEDIUM_CATEGORY` PRIMARY KEY (
	`mc_num`
);

ALTER TABLE `member` ADD CONSTRAINT `FK_user_TO_member_1` FOREIGN KEY (
	`me_user_id`
)
REFERENCES `user` (
	`user_id`
);

ALTER TABLE `promotion_on` ADD CONSTRAINT `FK_order_TO_promotion_on_1` FOREIGN KEY (
	`po_or_num`
)
REFERENCES `order` (
	`or_num`
);

