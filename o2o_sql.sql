
/*
--生活服务分类表
*/
CREATE TABLE `o2o_category` (
`id` INT(255) unsigned NOT NULL auto_increment,
`name` VARCHAR (50) NOT NULL DEFAULT  '',
`parent_id` INT(10) unsigned NOT NULL DEFAULT 0,
`listorder` INT(8) unsigned NOT NULL DEFAULT 0,
`status` tinyint(1) unsigned NOT NULL DEFAULT 0,
`create_time` int(11) unsigned NOT NULL DEFAULT 0,
`update_time` int(11) unsigned NOT NULL DEFAULT 0,
PRIMARY KEY (`id`),
KEY parent_id(`parent_id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT  CHARSET=utf8;


/*
 *城市列表类
 *#uname 表示城市英文名   UNIQUE KEY表示唯一索引
 */

CREATE TABLE `o2o_city` (
`id` INT(255) unsigned NOT NULL auto_increment,
`name` VARCHAR (50) NOT NULL DEFAULT  '',
`uname` VARCHAR (50) NOT NULL DEFAULT  '',
`parent_id` INT(10) unsigned NOT NULL DEFAULT 0,
`listorder` INT(8) unsigned NOT NULL DEFAULT 0,
`status` tinyint(1) unsigned NOT NULL DEFAULT 0,
`create_time` int(11) unsigned NOT NULL DEFAULT 0,
`update_time` int(11) unsigned NOT NULL DEFAULT 0,
PRIMARY KEY (`id`),
KEY parent_id(`parent_id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


/*
 *商圈表
 */

CREATE TABLE `o2o_area` (
`id` INT(255) unsigned NOT NULL auto_increment,
`name` VARCHAR (50) NOT NULL DEFAULT  '',
`city_id` INT(10) unsigned NOT NULL DEFAULT  0,
`parent_id` INT(10) unsigned NOT NULL default 0,
`listorder` INT(8) unsigned NOT NULL DEFAULT 0,
`status` tinyint(1) unsigned NOT NULL DEFAULT 0,
`create_time` int(11) unsigned NOT NULL DEFAULT 0,
`update_time` int(11) unsigned NOT NULL DEFAULT 0,
PRIMARY KEY (`id`),
KEY parent_id(`parent_id`),
KEY city_id(`city_id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


/*
商户表

licence_logo    description 描述  city_id 所在城市
*/
CREATE TABLE `o2o_bis`(
`id` INT(11) unsigned NOT NULL auto_increment,
`name` VARCHAR(50) NOT NULL DEFAULT '',
`email` VARCHAR(50) NOT NULL DEFAULT '',
`logo` varchar(255) NOT NULL DEFAULT '',
`licence_logo` VARCHAR(255) NOT NULL DEFAULT '',
`description` text NOT NULL,
`city_id` INT(22) unsigned NOT NULL DEFAULT 0,
`city_path` VARCHAR(50) NOT NULL DEFAULT  '',
`bank_info` VARCHAR(50) NOT NULL DEFAULT '',
`money` DECIMAL(20,2) NOT NULL DEFAULT '0.00',
`bank_name` VARCHAR(50) NOT NULL DEFAULT '',
`bank_user` VARCHAR(50) NOT NULL DEFAULT '',
`faren` VARCHAR(20) NOT NULL DEFAULT '',
`faren_tel` VARCHAR(20) NOT NULL DEFAULT '',
`listorder` INT(8) unsigned NOT NULL default 0,
`status` tinyint(1) NOT NULL DEFAULT 0,
`create_time` INT(11) unsigned NOT NULL default 0,
`update_time` INT(11) unsigned NOT NULL default 0,
PRIMARY KEY (`id`),
KEY city_id(`city_id`),
KEY name(`name`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--商户的账户表
/*
*username用户名,
password 密码 默认md5加密 char(32), code不同的随机数
bis_id 属于哪个商户
last_login_ip 商户最后登录的ip
last_login_time 最后的登录时间
is_main 默认是否是总管理员
  */
CREATE TABLE `o2o_bis_account`(
`id` INT(11) unsigned NOT NULL auto_increment,
`username` VARCHAR(50) NOT NULL DEFAULT '',
`password` CHAR(32) NOT NULL DEFAULT '',
`code` VARCHAR(10) NOT NULL DEFAULT '',
`bis_id` INT(11) unsigned NOT NULL DEFAULT 0,
`last_login_ip` VARCHAR(20) NOT NULL DEFAULT 0,
`last_login_time` INT(11) unsigned NOT NULL DEFAULT 0,
`is_main` tinyint(1) unsigned NOT NULL DEFAULT 0,
`listorder` INT(8) unsigned NOT NULL default 0,
`status` tinyint(1) NOT NULL DEFAULT 0,
`create_time` INT(11) unsigned NOT NULL default 0,
`update_time` INT(11) unsigned NOT NULL default 0,
PRIMARY KEY (`id`),
KEY bis_id(`bis_id`),
KEY username(`username`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--商户门店表
/*
address 总店地址
tel电话号码
contact 联系人
xpoint 精度
ypoint 维度
bis_id 门店属于哪个商户
open_time门店营业时间
content 门店介绍
is_main是否是总店
api_address 根据api查询地址
category_id 分类
category_path 栏目相关的path
*/
CREATE TABLE `o2o_bis_location`(
`id` INT(11) unsigned NOT NULL auto_increment,
`name` VARCHAR(50) NOT NULL DEFAULT '',
`logo` varchar(255) NOT NULL DEFAULT '',
`address` VARCHAR(255) NOT NULL DEFAULT '',
`tel` varchar(20) NOT NULL DEFAULT  '',
`contact` VARCHAR(20) NOT NULL DEFAULT '',
`xpoint` varchar(20) not null default '',
`ypoint` varchar(20) not null default '',
`bis_id` int(11) unsigned not null default 0,
`open_time` int(11) unsigned not null default 0,
`content` text not null,
`is_main` tinyint(1) unsigned not null default 0,
`api_address` varchar(255) not null default '',
`city_id` INT(22) unsigned NOT NULL DEFAULT 0,
`city_path` VARCHAR(50) NOT NULL DEFAULT  '',
`category_id` int(11) unsigned not null default 0,
`category_path` varchar(50) not null default '',
`bank_info` VARCHAR(50) NOT NULL DEFAULT '',
`listorder` INT(8) unsigned NOT NULL default 0,
`status` tinyint(1) NOT NULL DEFAULT 0,
`create_time` INT(11) unsigned NOT NULL default 0,
`update_time` INT(11) unsigned NOT NULL default 0,
PRIMARY KEY (`id`),
KEY name(`name`),
KEY city_id(`city_id`),
KEY bis_id(`bis_id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- 团购商品表
/**
 *name 商品名称, category_id商品分类, se_category_id二级栏目, bis_id属于哪个商家, location_ids所属店面
 *image商品图标 description描述 start_time开始时间 end_time 结束时间, origin_price 商品原价, current_price现价, city_id商品属于哪个城市
 *buy_count购买商品份数 total_count商品总数 coupons_end_time 团购券结束时间, coupons_begin_time 团购券开始时间, xpoint和ypoint 经纬度,
 bis_account_id 哪个商家提交的数据, balance_price 商家与平台结算价格, notes商品提示
 */
CREATE TABLE `o2_deal`(
  `id` INT(11) unsigned NOT NULL auto_increment,
  `name` VARCHAR(100) NOT NULL DEFAULT '',
  `category_id` INT(11) NOT NULL DEFAULT 0,
  `se_category_id` INT(11) NOT NULL DEFAULT 0,
  `bis_id` INT(11) NOT NULL DEFAULT 0,
  `location_ids` VARCHAR(100) NOT NULL DEFAULT '',
  `image` VARCHAR(100) NOT NULL DEFAULT '',
  `description` text NOT NULL ,
  `start_time` INT(11) NOT NULL DEFAULT 0,
  `end_time` INT(11) NOT NULL DEFAULT 0,
  `origin_price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `current_price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `city_id` INT(11) NOT NULL DEFAULT 0,
  `buy_count` INT(11) NOT NULL DEFAULT 0,
  `total_count` INT(11) NOT NULL DEFAULT 0,
  `coupons_end_time` INT(11) NOT NULL DEFAULT 0,
  `coupons_begin_time` INT(11) NOT NULL DEFAULT 0,
  `xpoint` VARCHAR(20) NOT NULL DEFAULT '',
  `ypoint` VARCHAR(20) NOT NULL DEFAULT '',
  `bis_account_id` INT(10) NOT NULL DEFAULT 0,
  `balance_price` DECIMAL(20,2) NOT NULL DEFAULT 0,
  `notes` text NOT NULL,
  `listorder` INT(8) unsigned NOT NULL default 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` INT(11) unsigned NOT NULL default 0,
  `update_time` INT(11) unsigned NOT NULL default 0,
  PRIMARY KEY (`id`),
  KEY category_id(`category_id`),
  KEY se_category_id(`se_category_id`),
  KEY city_id(`city_id`),
  KEY start_time(`start_time`),
  KEY end_time(`end_time`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8; 

-- 用户表
CREATE TABLE `o2o_user`(
  `id` INT(11) unsigned NOT NULL auto_increment,
  `username` VARCHAR(100) NOT NULL DEFAULT '',
  `password` CHAR(32) NOT NULL DEFAULT '',
  `code` VARCHAR(10) NOT NULL DEFAULT '',
  `last_login_ip` VARCHAR(20) NOT NULL DEFAULT 0,
  `last_login_time` INT(11) unsigned NOT NULL DEFAULT 0,
  `email` VARCHAR(30) NOT NULL DEFAULT '',
  `mobile` VARCHAR(20) NOT NULL DEFAULT '',
  `listorder` INT(8) unsigned NOT NULL default 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` INT(11) unsigned NOT NULL default 0,
  `update_time` INT(11) unsigned NOT NULL default 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY username(`username`),
  UNIQUE KEY email(`email`)

)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

--推荐位表单
/*
*团购
image图片
*/
CREATE TABLE `o2o_featured`(
  `id` INT(10) unsigned NOT NULL auto_increment,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `title` VARCHAR(30) NOT NULL DEFAULT '',
  `image` VARCHAR(255) NOT NULL DEFAULT '',
  `url` VARCHAR(255) NOT NULL DEFAULT '',
  `description` VARCHAR(255) NOT NULL DEFAULT '',
  `listorder` INT(8) unsigned NOT NULL default 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `create_time` INT(11) unsigned NOT NULL default 0,
  `update_time` INT(11) unsigned NOT NULL default 0,
  PRIMARY KEY (`id`)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;