DROP TABLE IF EXISTS {access_caches};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {access_caches} (
  `id` int(9) NOT NULL auto_increment,
  `item_id` int(9) default NULL,
  `view_full_1` binary(1) NOT NULL default '0',
  `edit_1` binary(1) NOT NULL default '0',
  `add_1` binary(1) NOT NULL default '0',
  `view_full_2` binary(1) NOT NULL default '0',
  `edit_2` binary(1) NOT NULL default '0',
  `add_2` binary(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO {access_caches} VALUES (1,1,'1','0','0','1','0','0');
DROP TABLE IF EXISTS {access_intents};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {access_intents} (
  `id` int(9) NOT NULL auto_increment,
  `item_id` int(9) default NULL,
  `view_1` binary(1) default NULL,
  `view_full_1` binary(1) default NULL,
  `edit_1` binary(1) default NULL,
  `add_1` binary(1) default NULL,
  `view_2` binary(1) default NULL,
  `view_full_2` binary(1) default NULL,
  `edit_2` binary(1) default NULL,
  `add_2` binary(1) default NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO {access_intents} VALUES (1,1,'1','1','0','0','1','1','0','0');
DROP TABLE IF EXISTS {caches};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {caches} (
  `id` int(9) NOT NULL auto_increment,
  `key` varchar(255) NOT NULL,
  `tags` varchar(255) default NULL,
  `expiration` int(9) NOT NULL,
  `cache` longblob,
  PRIMARY KEY  (`id`),
  KEY `key` (`key`),
  KEY `tags` (`tags`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS {comments};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {comments} (
  `author_id` int(9) default NULL,
  `created` int(9) NOT NULL,
  `guest_email` varchar(128) default NULL,
  `guest_name` varchar(128) default NULL,
  `guest_url` varchar(255) default NULL,
  `id` int(9) NOT NULL auto_increment,
  `item_id` int(9) NOT NULL,
  `server_http_accept_charset` varchar(64) default NULL,
  `server_http_accept_encoding` varchar(64) default NULL,
  `server_http_accept_language` varchar(64) default NULL,
  `server_http_accept` varchar(128) default NULL,
  `server_http_connection` varchar(64) default NULL,
  `server_http_host` varchar(64) default NULL,
  `server_http_referer` varchar(255) default NULL,
  `server_http_user_agent` varchar(128) default NULL,
  `server_query_string` varchar(64) default NULL,
  `server_remote_addr` varchar(32) default NULL,
  `server_remote_host` varchar(64) default NULL,
  `server_remote_port` varchar(16) default NULL,
  `state` varchar(15) default 'unpublished',
  `text` text,
  `updated` int(9) NOT NULL,
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS {failed_auths};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {failed_auths} (
  `id` int(9) NOT NULL auto_increment,
  `count` int(9) NOT NULL,
  `name` varchar(255) NOT NULL,
  `time` int(9) NOT NULL,
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS {graphics_rules};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {graphics_rules} (
  `id` int(9) NOT NULL auto_increment,
  `active` tinyint(1) default '0',
  `args` varchar(255) default NULL,
  `module_name` varchar(64) NOT NULL,
  `operation` varchar(64) NOT NULL,
  `priority` int(9) NOT NULL,
  `target` varchar(32) NOT NULL,
  PRIMARY KEY  (`id`)
) AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO {graphics_rules} VALUES (1,1,'a:3:{s:5:\"width\";i:200;s:6:\"height\";i:200;s:6:\"master\";i:2;}','gallery','gallery_graphics::resize',100,'thumb');
INSERT INTO {graphics_rules} VALUES (2,1,'a:3:{s:5:\"width\";i:640;s:6:\"height\";i:640;s:6:\"master\";i:2;}','gallery','gallery_graphics::resize',100,'resize');
DROP TABLE IF EXISTS {groups};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {groups} (
  `id` int(9) NOT NULL auto_increment,
  `name` char(64) default NULL,
  `special` tinyint(1) default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO {groups} VALUES (1,'Everybody',1);
INSERT INTO {groups} VALUES (2,'Registered Users',1);
DROP TABLE IF EXISTS {groups_users};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {groups_users} (
  `group_id` int(9) NOT NULL,
  `user_id` int(9) NOT NULL,
  PRIMARY KEY  (`group_id`,`user_id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO {groups_users} VALUES (1,1);
INSERT INTO {groups_users} VALUES (1,2);
INSERT INTO {groups_users} VALUES (2,2);
DROP TABLE IF EXISTS {incoming_translations};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {incoming_translations} (
  `id` int(9) NOT NULL auto_increment,
  `key` char(32) NOT NULL,
  `locale` char(10) NOT NULL,
  `message` text NOT NULL,
  `revision` int(9) default NULL,
  `translation` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `key` (`key`,`locale`),
  KEY `locale_key` (`locale`,`key`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS {items};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {items} (
  `id` int(9) NOT NULL auto_increment,
  `album_cover_item_id` int(9) default NULL,
  `captured` int(9) default NULL,
  `created` int(9) default NULL,
  `description` varchar(2048) default NULL,
  `height` int(9) default NULL,
  `left_ptr` int(9) NOT NULL,
  `level` int(9) NOT NULL,
  `mime_type` varchar(64) default NULL,
  `name` varchar(255) default NULL,
  `owner_id` int(9) default NULL,
  `parent_id` int(9) NOT NULL,
  `rand_key` float default NULL,
  `relative_path_cache` varchar(255) default NULL,
  `relative_url_cache` varchar(255) default NULL,
  `resize_dirty` tinyint(1) default '1',
  `resize_height` int(9) default NULL,
  `resize_width` int(9) default NULL,
  `right_ptr` int(9) NOT NULL,
  `slug` varchar(255) default NULL,
  `sort_column` varchar(64) default NULL,
  `sort_order` char(4) default 'ASC',
  `thumb_dirty` tinyint(1) default '1',
  `thumb_height` int(9) default NULL,
  `thumb_width` int(9) default NULL,
  `title` varchar(255) default NULL,
  `type` varchar(32) NOT NULL,
  `updated` int(9) default NULL,
  `view_count` int(9) default '0',
  `weight` int(9) NOT NULL default '0',
  `width` int(9) default NULL,
  `view_1` binary(1) default '0',
  `view_2` binary(1) default '0',
  PRIMARY KEY  (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `type` (`type`),
  KEY `random` (`rand_key`),
  KEY `weight` (`weight`)
) AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO {items} VALUES (1,NULL,NULL,UNIX_TIMESTAMP(),'',NULL,1,1,NULL,NULL,2,0,NULL,'','',1,NULL,NULL,2,NULL,'weight','ASC',1,NULL,NULL,'Gallery','album',UNIX_TIMESTAMP(),0,1,NULL,'1','1');
DROP TABLE IF EXISTS {items_tags};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {items_tags} (
  `id` int(9) NOT NULL auto_increment,
  `item_id` int(9) NOT NULL,
  `tag_id` int(9) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `tag_id` (`tag_id`,`id`),
  KEY `item_id` (`item_id`,`id`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS {logs};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {logs} (
  `id` int(9) NOT NULL auto_increment,
  `category` varchar(64) default NULL,
  `html` varchar(255) default NULL,
  `message` text,
  `referer` varchar(255) default NULL,
  `severity` int(9) default '0',
  `timestamp` int(9) default '0',
  `url` varchar(255) default NULL,
  `user_id` int(9) default '0',
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS {messages};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {messages} (
  `id` int(9) NOT NULL auto_increment,
  `key` varchar(255) default NULL,
  `severity` varchar(32) default NULL,
  `value` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `key` (`key`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS {modules};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {modules} (
  `id` int(9) NOT NULL auto_increment,
  `active` tinyint(1) default '0',
  `name` varchar(64) default NULL,
  `version` int(9) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO {modules} VALUES (1,1,'gallery',30);
INSERT INTO {modules} VALUES (2,1,'user',3);
INSERT INTO {modules} VALUES (3,1,'comment',3);
INSERT INTO {modules} VALUES (4,1,'organize',1);
INSERT INTO {modules} VALUES (5,1,'info',1);
INSERT INTO {modules} VALUES (6,1,'rest',3);
INSERT INTO {modules} VALUES (7,1,'rss',1);
INSERT INTO {modules} VALUES (8,1,'search',1);
INSERT INTO {modules} VALUES (9,1,'slideshow',2);
INSERT INTO {modules} VALUES (10,1,'tag',2);
DROP TABLE IF EXISTS {outgoing_translations};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {outgoing_translations} (
  `id` int(9) NOT NULL auto_increment,
  `base_revision` int(9) default NULL,
  `key` char(32) NOT NULL,
  `locale` char(10) NOT NULL,
  `message` text NOT NULL,
  `translation` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `key` (`key`,`locale`),
  KEY `locale_key` (`locale`,`key`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS {permissions};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {permissions} (
  `id` int(9) NOT NULL auto_increment,
  `display_name` varchar(64) default NULL,
  `name` varchar(64) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO {permissions} VALUES (1,'View','view');
INSERT INTO {permissions} VALUES (2,'View full size','view_full');
INSERT INTO {permissions} VALUES (3,'Edit','edit');
INSERT INTO {permissions} VALUES (4,'Add','add');
DROP TABLE IF EXISTS {search_records};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {search_records} (
  `id` int(9) NOT NULL auto_increment,
  `item_id` int(9) default NULL,
  `dirty` tinyint(1) default '1',
  `data` longtext,
  PRIMARY KEY  (`id`),
  KEY `item_id` (`item_id`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO {search_records} VALUES (1,1,0,'  Gallery');
DROP TABLE IF EXISTS {sessions};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {sessions} (
  `session_id` varchar(127) NOT NULL,
  `data` text NOT NULL,
  `last_activity` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`session_id`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS {tags};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {tags} (
  `id` int(9) NOT NULL auto_increment,
  `name` varchar(128) NOT NULL,
  `count` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS {tasks};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {tasks} (
  `id` int(9) NOT NULL auto_increment,
  `callback` varchar(128) default NULL,
  `context` text NOT NULL,
  `done` tinyint(1) default '0',
  `name` varchar(128) default NULL,
  `owner_id` int(9) default NULL,
  `percent_complete` int(9) default '0',
  `state` varchar(32) default NULL,
  `status` varchar(255) default NULL,
  `updated` int(9) default NULL,
  PRIMARY KEY  (`id`),
  KEY `owner_id` (`owner_id`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS {themes};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {themes} (
  `id` int(9) NOT NULL auto_increment,
  `name` varchar(64) default NULL,
  `version` int(9) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO {themes} VALUES (1,'wind',1);
INSERT INTO {themes} VALUES (2,'admin_wind',1);
DROP TABLE IF EXISTS {user_access_keys};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {user_access_keys} (
  `id` int(9) NOT NULL auto_increment,
  `user_id` int(9) NOT NULL,
  `access_key` char(32) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `access_key` (`access_key`),
  UNIQUE KEY `user_id` (`user_id`)
) DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
DROP TABLE IF EXISTS {users};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {users} (
  `id` int(9) NOT NULL auto_increment,
  `name` varchar(32) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `password` varchar(64) NOT NULL,
  `login_count` int(10) unsigned NOT NULL default '0',
  `last_login` int(10) unsigned NOT NULL default '0',
  `email` varchar(64) default NULL,
  `admin` tinyint(1) default '0',
  `guest` tinyint(1) default '0',
  `hash` char(32) default NULL,
  `url` varchar(255) default NULL,
  `locale` char(10) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `hash` (`hash`)
) AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO {users} VALUES (1,'guest','Guest User','',0,0,NULL,0,1,NULL,NULL,NULL);
INSERT INTO {users} VALUES (2,'admin','Gallery Administrator','',0,0,'unknown@unknown.com',1,0,NULL,NULL,NULL);
DROP TABLE IF EXISTS {vars};
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE {vars} (
  `id` int(9) NOT NULL auto_increment,
  `module_name` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `value` text,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `module_name` (`module_name`,`name`)
) AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;
INSERT INTO {vars} VALUES (NULL,'gallery','active_site_theme','wind');
INSERT INTO {vars} VALUES (NULL,'gallery','active_admin_theme','admin_wind');
INSERT INTO {vars} VALUES (NULL,'gallery','page_size','9');
INSERT INTO {vars} VALUES (NULL,'gallery','thumb_size','200');
INSERT INTO {vars} VALUES (NULL,'gallery','resize_size','640');
INSERT INTO {vars} VALUES (NULL,'gallery','default_locale','en_US');
INSERT INTO {vars} VALUES (NULL,'gallery','image_quality','75');
INSERT INTO {vars} VALUES (NULL,'gallery','image_sharpen','15');
INSERT INTO {vars} VALUES (NULL,'gallery','time_format','H:i:s');
INSERT INTO {vars} VALUES (NULL,'gallery','show_credits','1');
INSERT INTO {vars} VALUES (NULL,'gallery','credits','Powered by <a href=\"%url\">%gallery_version</a>');
INSERT INTO {vars} VALUES (NULL,'gallery','simultaneous_upload_limit','5');
INSERT INTO {vars} VALUES (NULL,'gallery','admin_area_timeout','5400');
INSERT INTO {vars} VALUES (NULL,'gallery','blocks_dashboard_sidebar','a:4:{i:2;a:2:{i:0;s:7:\"gallery\";i:1;s:11:\"block_adder\";}i:3;a:2:{i:0;s:7:\"gallery\";i:1;s:5:\"stats\";}i:4;a:2:{i:0;s:7:\"gallery\";i:1;s:13:\"platform_info\";}i:5;a:2:{i:0;s:7:\"gallery\";i:1;s:12:\"project_news\";}}');
INSERT INTO {vars} VALUES (NULL,'gallery','date_time_format','Y-M-d H:i:s');
INSERT INTO {vars} VALUES (NULL,'gallery','date_format','Y-M-d');
INSERT INTO {vars} VALUES (NULL,'gallery','blocks_dashboard_center','a:3:{i:6;a:2:{i:0;s:7:\"gallery\";i:1;s:7:\"welcome\";}i:7;a:2:{i:0;s:7:\"gallery\";i:1;s:12:\"photo_stream\";}i:8;a:2:{i:0;s:7:\"gallery\";i:1;s:11:\"log_entries\";}}');
INSERT INTO {vars} VALUES (NULL,'gallery','choose_default_tookit','1');
INSERT INTO {vars} VALUES (NULL,'gallery','identity_provider','user');
INSERT INTO {vars} VALUES (NULL,'user','mininum_password_length','5');
INSERT INTO {vars} VALUES (NULL,'comment','access_permissions','everybody');
INSERT INTO {vars} VALUES (NULL,'comment','spam_caught','0');
INSERT INTO {vars} VALUES (NULL,'rest','allow_guest_access','0');
INSERT INTO {vars} VALUES (NULL,'gallery','blocks_site_sidebar','a:3:{i:9;a:2:{i:0;s:4:\"info\";i:1;s:8:\"metadata\";}i:10;a:2:{i:0;s:3:\"rss\";i:1;s:9:\"rss_feeds\";}i:11;a:2:{i:0;s:3:\"tag\";i:1;s:3:\"tag\";}}');
INSERT INTO {vars} VALUES (NULL,'slideshow','max_scale','0');
