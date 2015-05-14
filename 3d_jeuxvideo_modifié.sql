-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 12 Mai 2015 à 22:39
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `3d_jeuxvideo`
--

-- --------------------------------------------------------

--
-- Structure de la table `wp_ahm_download_stats`
--
USE 3d_jeuxvideo;

CREATE TABLE IF NOT EXISTS `wp_ahm_download_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `oid` varchar(100) NOT NULL,
  `year` int(4) NOT NULL,
  `month` int(2) NOT NULL,
  `day` int(2) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `ip` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_commentmeta`
--

CREATE TABLE IF NOT EXISTS `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_comments`
--

CREATE TABLE IF NOT EXISTS `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `wp_comments`
--

INSERT INTO `wp_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Monsieur WordPress', '', 'https://wordpress.org/', '', '2015-03-09 21:28:31', '2015-03-09 21:28:31', 'Bonjour, ceci est un commentaire.\nPour supprimer un commentaire, connectez-vous et affichez les commentaires de cet article. Vous pourrez alors les modifier ou les supprimer.', 0, '1', '', '', 0, 0),
(2, 12, 'admin', 'lmerabli@gmail.com', '', '127.0.0.1', '2015-05-10 18:43:10', '2015-05-10 17:43:10', 'Project créé par [cpm_user_url id="1"]', 0, '1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36', 'cpm_activity', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `wp_links`
--

CREATE TABLE IF NOT EXISTS `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_options`
--

CREATE TABLE IF NOT EXISTS `wp_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=377 ;

--
-- Contenu de la table `wp_options`
--

INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/projet-3DJV', 'yes'),
(2, 'home', 'http://localhost/projet-3DJV', 'yes'),
(3, 'blogname', '3D et jeux vidéo', 'yes'),
(4, 'blogdescription', 'Association 3D et jeux vidéo', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'lmerabli@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '2', 'yes'),
(23, 'date_format', 'j F Y', 'yes'),
(24, 'time_format', 'G \\h i \\m\\i\\n', 'yes'),
(25, 'links_updated_date_format', 'j F Y G \\h i \\m\\i\\n', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '', 'yes'),
(29, 'gzipcompression', '0', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:8:{i:0;s:41:"custom-menu-wizard/custom-menu-wizard.php";i:1;s:37:"download-manager/download-manager.php";i:2;s:29:"insert-pages/insert-pages.php";i:3;s:19:"members/members.php";i:4;s:34:"spider-event-calendar/calendar.php";i:5;s:37:"tinymce-advanced/tinymce-advanced.php";i:6;s:47:"wp-admin-ui-customize/wp-admin-ui-customize.php";i:7;s:24:"wp-promo-emails/wppe.php";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'advanced_edit', '0', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '1', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', '', 'no'),
(41, 'template', '3DJV', 'yes'),
(42, 'stylesheet', '3DJV', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '0', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'subscriber', 'yes'),
(49, 'db_version', '30133', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '0', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'page', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', 'file', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '0', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '0', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(80, 'widget_text', 'a:0:{}', 'yes'),
(81, 'widget_rss', 'a:0:{}', 'yes'),
(82, 'uninstall_plugins', 'a:1:{s:43:"cm-download-manager/cm-download-manager.php";a:2:{i:0;s:4:"CMDM";i:1;s:9:"uninstall";}}', 'no'),
(83, 'timezone_string', '', 'yes'),
(84, 'page_for_posts', '0', 'yes'),
(85, 'page_on_front', '15', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'initial_db_version', '30133', 'yes'),
(89, 'wp_user_roles', 'a:5:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:68:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:9:"add_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:10:"list_roles";b:1;s:12:"create_roles";b:1;s:12:"delete_roles";b:1;s:10:"edit_roles";b:1;s:16:"restrict_content";b:1;s:21:"access_server_browser";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}}', 'yes'),
(90, 'WPLANG', 'fr_FR', 'yes'),
(91, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(92, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(93, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(94, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'sidebars_widgets', 'a:8:{s:19:"wp_inactive_widgets";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:19:"primary-widget-area";a:2:{i:0;s:17:"spider_calendar-2";i:1;s:20:"custom-menu-wizard-2";}s:21:"secondary-widget-area";a:0:{}s:24:"first-footer-widget-area";a:0:{}s:25:"second-footer-widget-area";a:0:{}s:24:"third-footer-widget-area";a:0:{}s:25:"fourth-footer-widget-area";a:0:{}s:13:"array_version";i:3;}', 'yes'),
(97, 'cron', 'a:5:{i:1431466123;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1431466162;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1431497460;a:1:{s:20:"wp_maybe_auto_update";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1431516066;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(99, '_transient_random_seed', '55b4501f3c60e4461541e754a5aab439', 'yes'),
(112, 'can_compress_scripts', '1', 'yes'),
(135, '_transient_twentyfifteen_categories', '1', 'yes'),
(159, '_site_transient_timeout_browser_c917cbcbdbc2b619466b4aeb270ad980', '1429023323', 'yes'),
(160, '_site_transient_browser_c917cbcbdbc2b619466b4aeb270ad980', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:7:"Firefox";s:7:"version";s:4:"36.0";s:10:"update_url";s:23:"http://www.firefox.com/";s:7:"img_src";s:50:"http://s.wordpress.org/images/browsers/firefox.png";s:11:"img_src_ssl";s:49:"https://wordpress.org/images/browsers/firefox.png";s:15:"current_version";s:2:"16";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(164, 'theme_mods_twentyfifteen', 'a:1:{s:16:"sidebars_widgets";a:2:{s:4:"time";i:1428418615;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(165, 'current_theme', 'Twenty Ten/3DJV', 'yes'),
(166, 'theme_mods_Magazine1', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1431255933;s:4:"data";a:4:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";N;s:9:"sidebar-3";N;}}}', 'yes'),
(167, 'theme_switched', '', 'yes'),
(168, 'Mag1', 'a:22:{s:19:"mag1_style_selector";s:4:"dark";s:18:"display_blog_title";i:0;s:16:"blog_title_color";s:7:"#dddddd";s:18:"blog_tagline_color";s:7:"#777777";s:13:"blog_logo_url";s:0:"";s:14:"featured_count";i:5;s:25:"featured_display_category";i:1;s:22:"featured_display_title";i:1;s:24:"featured_display_excerpt";i:1;s:17:"recent_home_count";i:6;s:13:"cat_headlines";a:3:{s:2:"NM";a:0:{}s:2:"ID";a:0:{}s:2:"CB";a:0:{}}s:15:"mag1_home_video";i:1;s:14:"mag1_home_tabs";i:1;s:14:"mag1_home_tags";i:1;s:16:"mag1_post_latest";i:1;s:14:"mag1_post_tabs";i:1;s:14:"mag1_post_tags";i:1;s:21:"mag1_home_bann_center";s:101:"<a href=\\"http://themes1.com\\"><img src=\\"http://themes1.com/images/ad03.jpg\\" alt=\\"Themes1\\" /></a>";s:19:"mag1_home_bann_left";s:202:"<a href=\\"http://themes1.com\\"><img src=\\"http://themes1.com/images/ad01.jpg\\" alt=\\"Themes1\\" /></a><a href=\\"http://themes1.com\\"><img src=\\"http://themes1.com/images/ad02.jpg\\" alt=\\"Themes1\\" /></a>";s:15:"contact_enabled";i:1;s:13:"contact_email";s:0:"";s:18:"mag1_custom_footer";s:155:"&copy;2010 Magazine1. All rights reserved.<br />Powered by <a href="http://wordpress.org">WordPress</a>. Theme by <a href="http://themes1.com">Themes1</a>.";}', 'yes'),
(181, '_site_transient_timeout_browser_0bd950e71ecf1952ae432e9fd9249d73', '1431847855', 'yes'),
(182, '_site_transient_browser_0bd950e71ecf1952ae432e9fd9249d73', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:12:"39.0.2171.99";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(191, '_transient_timeout_plugin_slugs', '1431389364', 'no'),
(192, '_transient_plugin_slugs', 'a:11:{i:0;s:19:"akismet/akismet.php";i:1;s:41:"custom-menu-wizard/custom-menu-wizard.php";i:2;s:37:"download-manager/download-manager.php";i:3;s:9:"hello.php";i:4;s:29:"insert-pages/insert-pages.php";i:5;s:19:"members/members.php";i:6;s:34:"spider-event-calendar/calendar.php";i:7;s:37:"tinymce-advanced/tinymce-advanced.php";i:8;s:47:"wp-admin-ui-customize/wp-admin-ui-customize.php";i:9;s:30:"wedevs-project-manager/cpm.php";i:10;s:24:"wp-promo-emails/wppe.php";}', 'no'),
(206, 'theme_mods_twentyten', 'a:5:{i:0;b:0;s:18:"nav_menu_locations";a:1:{s:7:"primary";i:2;}s:16:"background_color";s:6:"1d1d1d";s:12:"header_image";s:13:"remove-header";s:16:"sidebars_widgets";a:2:{s:4:"time";i:1431447405;s:4:"data";a:7:{s:19:"wp_inactive_widgets";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:19:"primary-widget-area";a:2:{i:0;s:17:"spider_calendar-2";i:1;s:20:"custom-menu-wizard-2";}s:21:"secondary-widget-area";a:0:{}s:24:"first-footer-widget-area";a:0:{}s:25:"second-footer-widget-area";a:0:{}s:24:"third-footer-widget-area";a:0:{}s:25:"fourth-footer-widget-area";a:0:{}}}}', 'yes'),
(208, 'recently_activated', 'a:3:{s:43:"cm-download-manager/cm-download-manager.php";i:1431302537;s:49:"simple-events-calendar/simple-events-calendar.php";i:1431284806;s:30:"wedevs-project-manager/cpm.php";i:1431279961;}', 'yes'),
(213, '_site_transient_update_core', 'O:8:"stdClass":4:{s:7:"updates";a:5:{i:0;O:8:"stdClass":10:{s:8:"response";s:7:"upgrade";s:8:"download";s:65:"https://downloads.wordpress.org/release/fr_FR/wordpress-4.2.2.zip";s:6:"locale";s:5:"fr_FR";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:65:"https://downloads.wordpress.org/release/fr_FR/wordpress-4.2.2.zip";s:10:"no_content";b:0;s:11:"new_bundled";b:0;s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.2.2";s:7:"version";s:5:"4.2.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}i:1;O:8:"stdClass":10:{s:8:"response";s:7:"upgrade";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.2.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.2.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.2-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.2.2-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.2.2";s:7:"version";s:5:"4.2.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}i:2;O:8:"stdClass":11:{s:8:"response";s:10:"autoupdate";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.2.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.2.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.2-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.2.2-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:5:"4.2.2";s:7:"version";s:5:"4.2.2";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";s:9:"new_files";s:1:"1";}i:3;O:8:"stdClass":11:{s:8:"response";s:10:"autoupdate";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.1.5.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.1.5.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.1.5-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.1.5-new-bundled.zip";s:7:"partial";s:69:"https://downloads.wordpress.org/release/wordpress-4.1.5-partial-1.zip";s:8:"rollback";s:70:"https://downloads.wordpress.org/release/wordpress-4.1.5-rollback-1.zip";}s:7:"current";s:5:"4.1.5";s:7:"version";s:5:"4.1.5";s:11:"php_version";s:5:"5.2.4";s:13:"mysql_version";s:3:"5.0";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:5:"4.1.1";s:9:"new_files";s:0:"";}i:4;O:8:"stdClass":10:{s:8:"response";s:7:"upgrade";s:8:"download";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.2.zip";s:6:"locale";s:5:"en_US";s:8:"packages";O:8:"stdClass":5:{s:4:"full";s:59:"https://downloads.wordpress.org/release/wordpress-4.2.2.zip";s:10:"no_content";s:70:"https://downloads.wordpress.org/release/wordpress-4.2.2-no-content.zip";s:11:"new_bundled";s:71:"https://downloads.wordpress.org/release/wordpress-4.2.2-new-bundled.zip";s:7:"partial";b:0;s:8:"rollback";b:0;}s:7:"current";s:0:"";s:7:"version";s:0:"";s:11:"php_version";s:3:"4.3";s:13:"mysql_version";s:5:"4.1.2";s:11:"new_bundled";s:3:"4.1";s:15:"partial_version";s:0:"";}}s:12:"last_checked";i:1431454734;s:15:"version_checked";s:5:"4.1.1";s:12:"translations";a:0:{}}', 'yes'),
(216, 'cpm_version', '0.4.1', 'yes'),
(217, 'cpm_db_version', '0.3.1', 'yes'),
(218, 'cpm_general', '', 'yes'),
(219, 'cpm_mails', '', 'yes'),
(221, 'members_db_version', '2', 'yes'),
(222, 'members_settings', 'a:8:{s:12:"role_manager";i:1;s:19:"content_permissions";i:1;s:12:"private_blog";i:0;s:12:"private_feed";i:0;s:17:"login_form_widget";i:0;s:12:"users_widget";i:0;s:25:"content_permissions_error";s:85:"<p class="restricted">Sorry, but you do not have permission to view this content.</p>";s:18:"private_feed_error";s:80:"<p class="restricted">You must be logged into the site to view this content.</p>";}', 'yes'),
(232, 'SE_clock', '24', 'yes'),
(233, 'SE_ext_css', 'no', 'yes'),
(234, 'SE_timezone', '+00:00', 'yes'),
(235, 'SE_author', 'manage_options', 'yes'),
(236, 'SE_links', 'none', 'yes'),
(237, 'SE_twitter', 'yes', 'yes'),
(238, 'SE_db_version', '2.1.1', 'yes'),
(260, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(261, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(262, 'widget_upcoming_events', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(263, 'widget_spider_calendar', 'a:2:{i:2;a:8:{s:5:"title";s:0:"";s:8:"calendar";s:1:"1";s:5:"theme";s:1:"1";s:12:"default_view";s:4:"list";s:6:"view_0";s:5:"month";s:6:"view_1";N;s:6:"view_2";N;s:6:"view_3";N;}s:12:"_multiwidget";i:1;}', 'yes'),
(268, '_site_transient_timeout_poptags_40cd750bba9870f18aada2478b24840a', '1431308171', 'yes'),
(269, '_site_transient_poptags_40cd750bba9870f18aada2478b24840a', 'a:40:{s:6:"widget";a:3:{s:4:"name";s:6:"widget";s:4:"slug";s:6:"widget";s:5:"count";s:4:"5159";}s:4:"post";a:3:{s:4:"name";s:4:"Post";s:4:"slug";s:4:"post";s:5:"count";s:4:"3241";}s:6:"plugin";a:3:{s:4:"name";s:6:"plugin";s:4:"slug";s:6:"plugin";s:5:"count";s:4:"3155";}s:5:"admin";a:3:{s:4:"name";s:5:"admin";s:4:"slug";s:5:"admin";s:5:"count";s:4:"2699";}s:5:"posts";a:3:{s:4:"name";s:5:"posts";s:4:"slug";s:5:"posts";s:5:"count";s:4:"2482";}s:7:"sidebar";a:3:{s:4:"name";s:7:"sidebar";s:4:"slug";s:7:"sidebar";s:5:"count";s:4:"1984";}s:9:"shortcode";a:3:{s:4:"name";s:9:"shortcode";s:4:"slug";s:9:"shortcode";s:5:"count";s:4:"1856";}s:6:"google";a:3:{s:4:"name";s:6:"google";s:4:"slug";s:6:"google";s:5:"count";s:4:"1817";}s:7:"twitter";a:3:{s:4:"name";s:7:"twitter";s:4:"slug";s:7:"twitter";s:5:"count";s:4:"1763";}s:6:"images";a:3:{s:4:"name";s:6:"images";s:4:"slug";s:6:"images";s:5:"count";s:4:"1752";}s:4:"page";a:3:{s:4:"name";s:4:"page";s:4:"slug";s:4:"page";s:5:"count";s:4:"1716";}s:8:"comments";a:3:{s:4:"name";s:8:"comments";s:4:"slug";s:8:"comments";s:5:"count";s:4:"1708";}s:5:"image";a:3:{s:4:"name";s:5:"image";s:4:"slug";s:5:"image";s:5:"count";s:4:"1599";}s:8:"facebook";a:3:{s:4:"name";s:8:"Facebook";s:4:"slug";s:8:"facebook";s:5:"count";s:4:"1404";}s:3:"seo";a:3:{s:4:"name";s:3:"seo";s:4:"slug";s:3:"seo";s:5:"count";s:4:"1347";}s:9:"wordpress";a:3:{s:4:"name";s:9:"wordpress";s:4:"slug";s:9:"wordpress";s:5:"count";s:4:"1259";}s:5:"links";a:3:{s:4:"name";s:5:"links";s:4:"slug";s:5:"links";s:5:"count";s:4:"1206";}s:6:"social";a:3:{s:4:"name";s:6:"social";s:4:"slug";s:6:"social";s:5:"count";s:4:"1149";}s:7:"gallery";a:3:{s:4:"name";s:7:"gallery";s:4:"slug";s:7:"gallery";s:5:"count";s:4:"1136";}s:5:"email";a:3:{s:4:"name";s:5:"email";s:4:"slug";s:5:"email";s:5:"count";s:4:"1001";}s:7:"widgets";a:3:{s:4:"name";s:7:"widgets";s:4:"slug";s:7:"widgets";s:5:"count";s:3:"967";}s:5:"pages";a:3:{s:4:"name";s:5:"pages";s:4:"slug";s:5:"pages";s:5:"count";s:3:"920";}s:11:"woocommerce";a:3:{s:4:"name";s:11:"woocommerce";s:4:"slug";s:11:"woocommerce";s:5:"count";s:3:"891";}s:6:"jquery";a:3:{s:4:"name";s:6:"jquery";s:4:"slug";s:6:"jquery";s:5:"count";s:3:"884";}s:3:"rss";a:3:{s:4:"name";s:3:"rss";s:4:"slug";s:3:"rss";s:5:"count";s:3:"858";}s:5:"media";a:3:{s:4:"name";s:5:"media";s:4:"slug";s:5:"media";s:5:"count";s:3:"849";}s:5:"video";a:3:{s:4:"name";s:5:"video";s:4:"slug";s:5:"video";s:5:"count";s:3:"800";}s:4:"ajax";a:3:{s:4:"name";s:4:"AJAX";s:4:"slug";s:4:"ajax";s:5:"count";s:3:"778";}s:7:"content";a:3:{s:4:"name";s:7:"content";s:4:"slug";s:7:"content";s:5:"count";s:3:"752";}s:10:"javascript";a:3:{s:4:"name";s:10:"javascript";s:4:"slug";s:10:"javascript";s:5:"count";s:3:"730";}s:5:"login";a:3:{s:4:"name";s:5:"login";s:4:"slug";s:5:"login";s:5:"count";s:3:"727";}s:9:"ecommerce";a:3:{s:4:"name";s:9:"ecommerce";s:4:"slug";s:9:"ecommerce";s:5:"count";s:3:"717";}s:10:"buddypress";a:3:{s:4:"name";s:10:"buddypress";s:4:"slug";s:10:"buddypress";s:5:"count";s:3:"689";}s:5:"photo";a:3:{s:4:"name";s:5:"photo";s:4:"slug";s:5:"photo";s:5:"count";s:3:"678";}s:4:"feed";a:3:{s:4:"name";s:4:"feed";s:4:"slug";s:4:"feed";s:5:"count";s:3:"673";}s:4:"link";a:3:{s:4:"name";s:4:"link";s:4:"slug";s:4:"link";s:5:"count";s:3:"667";}s:7:"youtube";a:3:{s:4:"name";s:7:"youtube";s:4:"slug";s:7:"youtube";s:5:"count";s:3:"638";}s:8:"security";a:3:{s:4:"name";s:8:"security";s:4:"slug";s:8:"security";s:5:"count";s:3:"635";}s:6:"photos";a:3:{s:4:"name";s:6:"photos";s:4:"slug";s:6:"photos";s:5:"count";s:3:"632";}s:4:"spam";a:3:{s:4:"name";s:4:"spam";s:4:"slug";s:4:"spam";s:5:"count";s:3:"630";}}', 'yes'),
(273, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:"auto_add";a:0:{}}', 'yes'),
(274, 'wauc_regist_dashboard_metabox', 'a:2:{s:4:"UPFN";s:1:"Y";s:9:"metaboxes";a:1:{s:9:"dashboard";a:2:{s:6:"normal";a:1:{s:4:"core";a:3:{s:19:"dashboard_right_now";s:28:"D&rsquo;un coup d&rsquo;œil";s:18:"dashboard_activity";s:9:"Activité";s:21:"wppe_dashboard_widget";s:21:"WP Promo Emails Stats";}}s:4:"side";a:1:{s:4:"core";a:3:{s:21:"wpdm_dashboard_widget";s:26:"WordPress Download Manager";s:21:"dashboard_quick_press";s:27:"Brouillon rapide Brouillons";s:17:"dashboard_primary";s:22:"Nouvelles de WordPress";}}}}}', 'yes'),
(275, 'wauc_regist_metabox', 'a:2:{s:4:"UPFN";s:1:"Y";s:9:"metaboxes";a:4:{s:4:"page";a:3:{s:4:"side";a:2:{s:4:"core";a:2:{s:9:"submitdiv";s:7:"Publier";s:13:"pageparentdiv";s:20:"Attributs de la page";}s:3:"low";a:1:{s:12:"postimagediv";s:15:"Image à la Une";}}s:6:"normal";a:1:{s:4:"core";a:6:{s:10:"postcustom";s:21:"Champs personnalisés";s:16:"commentstatusdiv";s:10:"Discussion";s:7:"slugdiv";s:11:"Identifiant";s:9:"authordiv";s:6:"Auteur";s:11:"commentsdiv";s:12:"Commentaires";s:12:"revisionsdiv";s:10:"Révisions";}}s:8:"advanced";a:1:{s:4:"high";a:1:{s:28:"content-permissions-meta-box";s:19:"Content Permissions";}}}s:4:"post";a:3:{s:4:"side";a:2:{s:4:"core";a:4:{s:9:"submitdiv";s:7:"Publier";s:9:"formatdiv";s:6:"Format";s:11:"categorydiv";s:11:"Catégories";s:16:"tagsdiv-post_tag";s:10:"Mots-clés";}s:3:"low";a:1:{s:12:"postimagediv";s:15:"Image à la Une";}}s:6:"normal";a:1:{s:4:"core";a:8:{s:11:"postexcerpt";s:7:"Extrait";s:13:"trackbacksdiv";s:23:"Envoyer des rétroliens";s:10:"postcustom";s:21:"Champs personnalisés";s:16:"commentstatusdiv";s:10:"Discussion";s:7:"slugdiv";s:11:"Identifiant";s:9:"authordiv";s:6:"Auteur";s:11:"commentsdiv";s:12:"Commentaires";s:12:"revisionsdiv";s:10:"Révisions";}}s:8:"advanced";a:1:{s:4:"high";a:1:{s:28:"content-permissions-meta-box";s:19:"Content Permissions";}}}s:7:"wpdmpro";a:3:{s:6:"normal";a:2:{s:3:"low";a:1:{s:13:"wpdm-settings";s:13:"File Settings";}s:4:"core";a:2:{s:11:"postexcerpt";s:7:"Extrait";s:7:"slugdiv";s:11:"Identifiant";}}s:4:"side";a:2:{s:4:"core";a:3:{s:16:"wpdm-upload-file";s:11:"Attach File";s:9:"submitdiv";s:7:"Publier";s:15:"wpdmcategorydiv";s:10:"Categories";}s:3:"low";a:2:{s:10:"wpdm-items";s:11:"Other Items";s:12:"postimagediv";s:15:"Image à la Une";}}s:8:"advanced";a:1:{s:4:"high";a:1:{s:28:"content-permissions-meta-box";s:19:"Content Permissions";}}}s:10:"attachment";a:3:{s:4:"side";a:1:{s:4:"core";a:1:{s:9:"submitdiv";s:11:"Enregistrer";}}s:6:"normal";a:1:{s:4:"core";a:4:{s:16:"commentstatusdiv";s:10:"Discussion";s:11:"commentsdiv";s:12:"Commentaires";s:7:"slugdiv";s:11:"Identifiant";s:9:"authordiv";s:6:"Auteur";}}s:8:"advanced";a:1:{s:4:"high";a:1:{s:28:"content-permissions-meta-box";s:19:"Content Permissions";}}}}}', 'yes'),
(292, 'wppe_options', 'a:2:{s:13:"subject_email";s:0:"";s:8:"template";s:3237:"<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html>\n	<head>\n		<meta http-equiv="Content-Type" content="text/html;UTF-8" />\n	</head>\n	<body style="margin: 0px; background-color: #F4F3F4; font-family: Helvetica, Arial, sans-serif; font-size:12px;" text="#444444" bgcolor="#F4F3F4" link="#21759B" alink="#21759B" vlink="#21759B" marginheight="0" topmargin="0" marginwidth="0" leftmargin="0">\n		<table cellpadding="0" cellspacing="0" width="100%" bgcolor="#F4F3F4" border="0">\n			<tr>\n				<td style="padding:15px;">\n					<center>\n						<table width="550" cellpadding="0" bgcolor="#ffffff" cellspacing="0" align="center">\n							<tr>\n								<td align="left">\n									<div style="border:solid 1px #d9d9d9;">\n										<table id="header" width="100%" border="0" cellpadding="0" bgcolor="#ffffff" cellspacing="0" style="line-height:1.6;font-size:12px;font-family: Helvetica, Arial, sans-serif;border:solid 1px #FFFFFF;color:#444;">\n											<tr>\n												<td colspan="2" background="http://localhost/3d_jeuxvideo/wp-admin/images/white-grad-active.png" height="30" style="color:#ffffff;" valign="bottom">.</td>\n											</tr>\n											<tr>\n												<td style="line-height:32px;padding-left:30px;" valign="baseline"><span style="font-size:32px;">Newsletter</span></td>\n												<td style="padding-right:30px;" align="right" valign="baseline"><span style="font-size:14px;color:#777777">Jan 2014</span></td>\n											</tr>\n										</table>\n										<table id="content" width="490" border="0" cellpadding="0" bgcolor="#ffffff" cellspacing="0" style="margin-top:15px;margin-right:30px; margin-left:30px;color:#444;line-height:1.6;font-size:12px;font-family: Arial, sans-serif;color: #444;">\n											<tr>\n												<td colspan="2" style="border-top: solid 1px #d9d9d9">\n													<div style="padding:15px 0;">\n														Type your\n													</div>\n												</td>\n											</tr>\n										</table>\n										<table id="footer" width="490" border="0" cellpadding="0" bgcolor="#ffffff" cellspacing="0" style="line-height:1.5;font-size:12px;font-family: Arial, sans-serif;margin-right:30px;margin-left:30px;">\n											<tr style="font-size:11px;color:#999999;">\n												<td style="border-top: solid 1px #d9d9d9;" colspan="2">\n													<div style="padding-top:15px; padding-bottom:1px;"><img height="13" width="13" style="vertical-align: middle;" src="http://localhost/3d_jeuxvideo/wp-admin/images/date-button.gif" alt="Date"  /> Email sent on:</div>\n													<div><img height="12" width="12" style="vertical-align: middle;" src="http://localhost/3d_jeuxvideo/wp-admin/images/comment-grey-bubble.png" alt="Contact"  /> For any requests, please contact <a href="mailto:lmerabli@gmail.com">support</a>\n													<br><br>\n													&copy; 3d_jeuxvideo . All rights reserved</div>\n												</td>\n											</tr>\n                                            <tr>\n												<td colspan="2" style="color:#ffffff;" height="15">.</td>\n                                            </tr>\n										</table>\n									</div>\n								</td>\n							</tr>\n						</table>\n					</center>\n				</td>\n			</tr>\n		</table>\n	</body>\n</html>";}', 'yes'),
(294, 'access_level', 'level_10', 'yes'),
(295, '_wpdm_thumb_w', '200', 'yes'),
(296, '_wpdm_thumb_h', '100', 'yes'),
(297, '_wpdm_pthumb_w', '400', 'yes'),
(298, '_wpdm_pthumb_h', '250', 'yes'),
(299, '_wpdm_athumb_w', '50', 'yes'),
(300, '_wpdm_athumb_h', '50', 'yes'),
(301, '_wpdm_wthumb_h', '150', 'yes'),
(302, '_wpdm_show_ct_bar', '1', 'yes'),
(303, '_wpdm_custom_template', 'page.php', 'yes'),
(304, 'wpdm_default_link_template', '[thumb_100x50]\r\n<br style=''clear:both''/>\r\n<b>[popup_link]</b><br/>\r\n<b>[download_count]</b> downloads', 'yes'),
(305, 'wpdm_default_page_template', '[thumb_800x500]\r\n<br style=''clear:both''/>\r\n[description]\r\n<fieldset class=''pack_stats''>\r\n<legend><b>Package Statistics</b></legend>\r\n<table>\r\n<tr><td>Total Downloads:</td><td>[download_count]</td></tr>\r\n<tr><td>Stock Limit:</td><td>[quota]</td></tr>\r\n<tr><td>Total Files:</td><td>[file_count]</td></tr>\r\n</table>\r\n</fieldset><br>\r\n[download_link]', 'yes'),
(306, '_wpdm_etpl', 'a:2:{s:5:"title";s:18:"Your download link";s:4:"body";b:0;}', 'yes'),
(309, 'tadv_settings', 'a:6:{s:9:"toolbar_1";s:153:"underline,bold,italic,blockquote,bullist,numlist,alignleft,aligncenter,alignright,link,unlink,table,fullscreen,undo,redo,wp_adv,fontselect,fontsizeselect";s:9:"toolbar_2";s:121:"formatselect,alignjustify,strikethrough,outdent,indent,pastetext,removeformat,charmap,wp_more,emoticons,forecolor,wp_help";s:9:"toolbar_3";s:0:"";s:9:"toolbar_4";s:0:"";s:7:"options";s:15:"advlist,menubar";s:7:"plugins";s:107:"anchor,code,insertdatetime,nonbreaking,print,searchreplace,table,visualblocks,visualchars,emoticons,advlist";}', 'yes'),
(310, 'tadv_admin_settings', 'a:2:{s:7:"options";s:0:"";s:16:"disabled_plugins";s:0:"";}', 'yes'),
(311, 'tadv_version', '4000', 'yes'),
(312, 'widget_custom-menu-wizard', 'a:2:{i:2;a:52:{s:14:"allow_all_root";i:0;s:17:"depth_rel_current";i:0;s:18:"fallback_ci_parent";i:0;s:17:"fallback_siblings";i:0;s:11:"flat_output";i:0;s:10:"hide_title";i:0;s:8:"siblings";i:0;s:17:"title_from_branch";i:0;s:22:"title_from_branch_root";i:0;s:18:"title_from_current";i:0;s:23:"title_from_current_root";i:0;s:12:"title_linked";i:0;s:7:"ol_root";i:0;s:6:"ol_sub";i:0;s:10:"hide_empty";i:0;s:10:"fs_filters";i:0;s:12:"fs_fallbacks";i:1;s:9:"fs_output";i:1;s:12:"fs_container";i:1;s:10:"fs_classes";i:1;s:8:"fs_links";i:1;s:14:"fs_alternative";i:1;s:9:"ancestors";i:0;s:17:"ancestor_siblings";i:0;s:5:"depth";i:0;s:6:"branch";i:0;s:4:"menu";i:3;s:5:"level";i:1;s:14:"fallback_depth";i:0;s:5:"title";s:0:"";s:6:"filter";s:0:"";s:12:"branch_start";s:0:"";s:10:"start_mode";s:0:"";s:16:"contains_current";s:0:"";s:9:"container";s:3:"div";s:12:"container_id";s:0:"";s:15:"container_class";s:0:"";s:13:"exclude_level";s:0:"";s:8:"fallback";s:0:"";s:13:"include_level";s:0:"";s:9:"switch_if";s:0:"";s:9:"switch_at";s:0:"";s:9:"switch_to";s:0:"";s:10:"menu_class";s:11:"menu-widget";s:12:"widget_class";s:0:"";s:4:"cmwv";s:5:"3.1.4";s:6:"before";s:0:"";s:5:"after";s:0:"";s:11:"link_before";s:0:"";s:10:"link_after";s:0:"";s:7:"exclude";s:0:"";s:5:"items";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(313, 'wpdmcategory_children', 'a:0:{}', 'yes'),
(331, '_transient_timeout_feed_66a70e9599b658d5cc038e8074597e7c', '1431381217', 'no');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(332, '_transient_feed_66a70e9599b658d5cc038e8074597e7c', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"WordPress Francophone";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:27:"http://www.wordpress-fr.net";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:70:"La communauté francophone autour du CMS WordPress et son écosystème";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 05 May 2015 05:25:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"fr-FR";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:29:"http://wordpress.org/?v=4.2.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:54:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:6:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:77:"L’Hebdo WordPress n°258 : WordPress 4.3 – WordCamps &amp; Evénements WP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"http://feedproxy.google.com/~r/WordpressFrancophone/~3/kwe0XgYW1P0/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:108:"http://www.wordpress-fr.net/2015/05/05/lhebdo-wordpress-n258-wordpress-4-3-wordcamps-evenements-wp/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 05 May 2015 05:25:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:5:{i:0;a:5:{s:4:"data";s:7:"Astuces";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:14:"Développement";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:11:"Evènements";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:10:"Podcasting";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:8:"wordcamp";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"http://www.wordpress-fr.net/?p=7437";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:395:"WordPress 4.3 est lancé Comme toujours, quelques jours après le déploiement d&#8217;une version majeur la suivante est aussitôt mise sur les rails. WordPress 4.3 est donc prévue pour le 18 août prochain et c&#8217;est Konstantin Obenland qui en prend les rênes. (en) Les premières pistes de réflexions sont ouvertes, notamment concernant l&#8217;éditeur. (en) WordPress 4.2.1 [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:7:"Benoît";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3621:"<h3>WordPress 4.3 est lancé</h3>\n<p>Comme toujours, quelques jours après le déploiement d&rsquo;une version majeur la suivante est aussitôt mise sur les rails. WordPress 4.3 est donc <a href="http://wp.me/p2AvED-3mD">prévue pour le 18 août prochain</a> et c&rsquo;est Konstantin Obenland qui en prend les rênes. (en)</p>\n<p>Les premières pistes de réflexions sont ouvertes, <a href="https://make.wordpress.org/core/2015/05/01/editor-wish-list-for-4-3/">notamment concernant l&rsquo;éditeur</a>. (en)</p>\n<h3>WordPress 4.2.1 : Première mise à jour mineure</h3>\n<p>Une faille de sécurité a été décelée rapidement après la sortie de WordPress 4.2, <a href="http://t.co/O3MDAj635H">le patch correctif </a>ne s&rsquo;est donc pas fait attendre (en).</p>\n<h3>WordCamp Lyon : programme et surprises</h3>\n<p>Le WordCamp Lyon avance et se précise. <a href="https://lyon.wordcamp.org/2015/programme/">Le programme est connu</a> et on sait depuis peu qu&rsquo;un <a href="https://lyon.wordcamp.org/2015/nightswapping-vous-offre-2-nuits-a-lyon-pour-le-wordcamp/">nouveau partenaire propose une surprise</a>.</p>\n<h3>WordCamp Europe : les orateurs se dévoilent</h3>\n<p>1ère surprise de taille, <a href="http://europe.wordcamp.org/2015/welcome-the-third-group-of-wceu-speakers/">Xavier (notre Xavier) fait partie des orateurs </a>du prochains WordCamp Europe.</p>\n<h3>WPMX Day</h3>\n<p>Rappelons également que le lendemain du WordCamp Lyon se tiendra le <a href="http://2015.wpmx.org/">WPMX Day</a>, événement majeur dans le Sud-Ouest de la France.</p>\n<h3>Le 11e Podcast de Very French Trip</h3>\n<p><a href="http://veryfrenchtrip.com/podcast/podcast-12-traduction-wordpress/">Pour cette 11e édition</a>, la traduction est à l&rsquo;honneur avec des invités de marque que sont Xavier, Didier, François-Xavier, Mathieu et Grégoire.</p>\n<h3>Les principes de hiérarchie dans le design visuel</h3>\n<p>Un article qui parle de <a href="https://dailypost.wordpress.com/2015/04/29/the-principles-of-design-visual-hierarchy/">design des sites web</a> raconté par un Automatticien. (en)</p>\n<h3>WPRocket élue meilleure extension de cache</h3>\n<p>WPSiteCare a élu <a href="http://www.wpsitecare.com/best-wordpress-plugins/">WPRocket meilleure extension de cache de tous les temps</a> (en)&#8230; et retrouvez également le classement des autres meilleures extensions de tous les temps dans ce classement.</p>\n<h3>Les événements WordPress sur une carte</h3>\n<p>ManageWP.org a mis en ligne une <a href="https://managewp.org/events/">carte interactive avec les différents événements WordPress </a>de la Planète. (en)</p>\n<div class="feedflare">\n<a href="http://feeds.feedburner.com/~ff/WordpressFrancophone?a=kwe0XgYW1P0:5XuUlueSTRA:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/WordpressFrancophone?d=yIl2AUoC8zA" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/WordpressFrancophone?a=kwe0XgYW1P0:5XuUlueSTRA:V_sGLiPBpWU"><img src="http://feeds.feedburner.com/~ff/WordpressFrancophone?i=kwe0XgYW1P0:5XuUlueSTRA:V_sGLiPBpWU" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/WordpressFrancophone?a=kwe0XgYW1P0:5XuUlueSTRA:qj6IDK7rITs"><img src="http://feeds.feedburner.com/~ff/WordpressFrancophone?d=qj6IDK7rITs" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/WordpressFrancophone?a=kwe0XgYW1P0:5XuUlueSTRA:gIN9vFwOqvQ"><img src="http://feeds.feedburner.com/~ff/WordpressFrancophone?i=kwe0XgYW1P0:5XuUlueSTRA:gIN9vFwOqvQ" border="0"></img></a>\n</div><img src="http://feeds.feedburner.com/~r/WordpressFrancophone/~4/kwe0XgYW1P0" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:104:"http://www.wordpress-fr.net/2015/05/05/lhebdo-wordpress-n258-wordpress-4-3-wordcamps-evenements-wp/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:99:"http://www.wordpress-fr.net/2015/05/05/lhebdo-wordpress-n258-wordpress-4-3-wordcamps-evenements-wp/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:6:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:42:"Le PHP Tour 2015 fait étape au Luxembourg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"http://feedproxy.google.com/~r/WordpressFrancophone/~3/tvrMTIYQIZg/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:90:"http://www.wordpress-fr.net/2015/05/01/le-php-tour-2015-fait-etape-au-luxembourg/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 01 May 2015 15:52:54 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Evènements";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:4:"AFUP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"http://www.wordpress-fr.net/?p=7431";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:396:"Nos amis de l&#8217;AFUP organisent le PHP Tour. Cette année, c&#8217;est le Luxembourg qui accueillera l&#8217;événement. L&#8217;AFUP nous a demandé de diffuser leur communiqué de presse, c&#8217;est donc avec plaisir que je m&#8217;exécute. En effet, PHP et WordPress ont des liens évidents et nos 2 communautés ont forcément des tonnes de choses en commun. L&#8217;entraide [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:7:"Benoît";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:6349:"<p><img class="alignleft size-full wp-image-7432" src="http://www.wordpress-fr.net/wp-content/uploads/2015/05/afup.png" alt="afup" width="209" height="99" />Nos amis de l&rsquo;AFUP organisent le PHP Tour. Cette année, c&rsquo;est le Luxembourg qui accueillera l&rsquo;événement.</p>\n<p>L&rsquo;AFUP nous a demandé de diffuser leur communiqué de presse, c&rsquo;est donc avec plaisir que je m&rsquo;exécute. En effet, PHP et WordPress ont des liens évidents et nos 2 communautés ont forcément des tonnes de choses en commun. L&rsquo;entraide de l&rsquo;open source est aussi ici.</p>\n<h2>Le communiqué de presse de l&rsquo;AFUP</h2>\n<blockquote>\n<h3>Le PHP Tour Luxembourg 2015 dévoile son programme</h3>\n<p><em><strong>Le Cloud mis à l&rsquo;honneur, et une large place accordée aux innovations du langage et aux retours d&rsquo;expérience de grandes entreprises</strong></em></p>\n<p>Luxembourg-Ville aura le plaisir d&rsquo;accueillir l&rsquo;étape annuelle du cycle de conférences itinérant de l&rsquo;AFUP, les 12 et 13 mai, au sein de la prestigieuse abbaye de Neumünster. <strong>Le programme de cette édition est en ligne :  conférences anglophones, Cloud, PHP7 et workshops au menu de ces 2 jours 100 % PHP ! </strong></p>\n<p>Comme l&rsquo;indiquait l&rsquo;appel à conférenciers, une partie de la programmation sera tournée vers le Cloud : son coût, sa sécurité, son installation&#8230; Nous aurons ainsi le plaisir d&rsquo;accueillir, parmi tant d&rsquo;autres, Philip Krenn pour « Perils of the Cloud », ou Maxime Thoonsen pour « Ansible pour le Cloud ». Vous saurez tout sur ce nouvel outil incontournable du Web ! Mais le programme se penche évidemment aussi sur le langage : Julien Pauli nous parlera de l&rsquo;avenir de PHP avec « En route vers PHP7 ! », Enrico Zimuel sera présent pour « Pushing Boundaries: Zend Framework 3 and the Future », ainsi que Michelangelo Van Dam pour « The continuous PHP Pipeline ». Enfin, de   nombreux  retours   d&rsquo;expérience   de   grandes   entreprises (Arté,   Canal+,   Mediapart&#8230;)   seront programmés, pour découvrir de quelle façon PHP est utilisé dans les plus grandes compagnies du Europe.</p>\n<h3>Un programme pensé pour notre public anglophone</h3>\n<p>Pour cette édition hors des frontières françaises, un soin particulier a été porté à l&rsquo;équilibre entre les conférences en français et celles en anglais : la moitié du programme propose des conférences anglophones. Pas d&rsquo;inquiétude cependant pour ceux que l&rsquo;anglais effraie : il y a toujours un talk en français programmé en face d&rsquo;une conférence anglophone.</p>\n<h3>Apprenez en compagnie des meilleurs lors des workshops</h3>\n<p>Le mercredi 13 mai verra des ateliers organisés en parallèle des conférences : 3h en petit groupe et en compagnie d&rsquo;experts du langage. Apprenez des meilleurs, en appliquant leurs conseils directement sur votre machine ! Le matin, Manuel Silvoso vous propose de vous initier à la sécurité des applications web. L&rsquo;après-midi, Patrick Allaert vous aidera à créer des extensions PHP. Ces deux ateliers sont sur inscription, et réservés aux visiteurs du PHP Tour Luxembourg</p>\n<h3>Une édition luxembourgeoise exceptionnelle</h3>\n<p>Le PHP Tour, lancé en 2011, est devenu un événement incontournable pour la communauté PHP. Cycle de conférences itinérant, il s&rsquo;est ainsi arrêté à Lille, Nantes et Lyon. Sa programmation pointue aborde les dernières innovations du langage, tout en profitant de ces étapes pour aborder des thématiques propres à la région d&rsquo;accueil et ses enjeux économiques. Cet événement au-delà des frontières françaises est une grande première pour l&rsquo;association, qui illustre par ce biais son intention de représenter les développeurs PHP francophones. Outre cette première édition d&rsquo;un événement AFUP hors des frontières françaises, 2015 marquera également les 20 ans de PHP et les 15 ans de l&rsquo;AFUP. Un double-anniversaire que l&rsquo;association compte bien célébrer tout au long de l&rsquo;année !</p>\n<h5>Quelques mots sur l&rsquo;AFUP :</h5>\n<p>L&rsquo;AFUP, Association Française des Utilisateurs de PHP, est une association loi 1901, qui a pour objectif principal de promouvoir le langage PHP auprès des professionnels et de participer à son développement.<br />\nL&rsquo;AFUP a été créée pour répondre à un besoin croissant des entreprises, celui d&rsquo;avoir un interlocuteur unique pour répondre à leurs questions sur PHP.  Par ailleurs, l&rsquo;AFUP offre un cadre de rencontre et de ressources techniques pour les développeurs qui souhaitent faire avancer le langage PHP lui même.</p>\n<h5>Pour en savoir plus :</h5>\n<p>Le site du PHP Tour Luxembourg 2015 : <a href="http://www.phptour.org">http://www.phptour.org</a><br />\nLe site de l&rsquo;AFUP : <a href="http://www.afup.org">http://www.afup.org</a><br />\nTwitter : @afup</p>\n<h5>Contact Presse :</h5>\n<p>Amélie Deffrennes : communication@afup.org</p></blockquote>\n<h1>Promotion spéciale WordPress Francophone</h1>\n<p>L&rsquo;AFUP propose une réduction exceptionnelle de 50 euros sur le pass 2 jours pour les membres de la communauté WordPress Francophone  avec le code promo suivant : <em>AFUP&lt;3WORDPRESS</em></p>\n<div class="feedflare">\n<a href="http://feeds.feedburner.com/~ff/WordpressFrancophone?a=tvrMTIYQIZg:LL2SqHjRe8k:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/WordpressFrancophone?d=yIl2AUoC8zA" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/WordpressFrancophone?a=tvrMTIYQIZg:LL2SqHjRe8k:V_sGLiPBpWU"><img src="http://feeds.feedburner.com/~ff/WordpressFrancophone?i=tvrMTIYQIZg:LL2SqHjRe8k:V_sGLiPBpWU" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/WordpressFrancophone?a=tvrMTIYQIZg:LL2SqHjRe8k:qj6IDK7rITs"><img src="http://feeds.feedburner.com/~ff/WordpressFrancophone?d=qj6IDK7rITs" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/WordpressFrancophone?a=tvrMTIYQIZg:LL2SqHjRe8k:gIN9vFwOqvQ"><img src="http://feeds.feedburner.com/~ff/WordpressFrancophone?i=tvrMTIYQIZg:LL2SqHjRe8k:gIN9vFwOqvQ" border="0"></img></a>\n</div><img src="http://feeds.feedburner.com/~r/WordpressFrancophone/~4/tvrMTIYQIZg" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:86:"http://www.wordpress-fr.net/2015/05/01/le-php-tour-2015-fait-etape-au-luxembourg/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:1:{i:0;a:5:{s:4:"data";s:81:"http://www.wordpress-fr.net/2015/05/01/le-php-tour-2015-fait-etape-au-luxembourg/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:63:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:6:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:81:"L’Hebdo WordPress n°257 : WordPress.org – Shortcake – WordPress 4.3 et 4.4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:67:"http://feedproxy.google.com/~r/WordpressFrancophone/~3/RJyz4PUcZNA/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:115:"http://www.wordpress-fr.net/2015/04/28/lhebdo-wordpress-n257-wordpress-org-shortcake-wordpress-4-3-et-4-4/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 28 Apr 2015 05:15:07 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:8:{i:0;a:5:{s:4:"data";s:7:"Brèves";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:14:"Développement";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:10:"Extensions";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:9:"WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:7:"Astuces";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:5;a:5:{s:4:"data";s:9:"shortcode";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:6;a:5:{s:4:"data";s:13:"WordPress 4.3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:7;a:5:{s:4:"data";s:13:"WordPress.org";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"http://www.wordpress-fr.net/?p=7425";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:344:"Il est des Hebdos que l&#8217;on pourrait renommer en Mensuel&#8230; celui-ci en fait partie ! Cela fait un mois que je n&#8217;ai pas écrit en ces lieux ! Mon ordinateur s&#8217;éloigne de moi ces temps-ci&#8230; il doit avoir d&#8217;autres chats à fouetter&#8230; Bref, me revoilà ! ', 'no'),
(333, '_transient_timeout_feed_mod_66a70e9599b658d5cc038e8074597e7c', '1431381217', 'no'),
(334, '_transient_feed_mod_66a70e9599b658d5cc038e8074597e7c', '1431338017', 'no'),
(335, '_transient_timeout_feed_1835d2eaaf967b5cddcf4dbccdcaeab9', '1431381220', 'no'),
(336, '_transient_feed_1835d2eaaf967b5cddcf4dbccdcaeab9', 'a:4:{s:5:"child";a:1:{s:0:"";a:1:{s:3:"rss";a:1:{i:0;a:6:{s:4:"data";s:3:"\n\n\n";s:7:"attribs";a:1:{s:0:"";a:1:{s:7:"version";s:3:"2.0";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:1:{s:0:"";a:1:{s:7:"channel";a:1:{i:0;a:6:{s:4:"data";s:49:"\n	\n	\n	\n	\n	\n	\n	\n	\n	\n	\n		\n		\n		\n		\n		\n		\n		\n		\n		\n	";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:5:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:21:"WordPress Francophone";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:27:"http://www.wordpress-fr.net";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:70:"La communauté francophone autour du CMS WordPress et son écosystème";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:13:"lastBuildDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 05 May 2015 05:25:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"language";a:1:{i:0;a:5:{s:4:"data";s:5:"fr-FR";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:9:"generator";a:1:{i:0;a:5:{s:4:"data";s:29:"http://wordpress.org/?v=4.2.1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"item";a:10:{i:0;a:6:{s:4:"data";s:54:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:6:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:77:"L’Hebdo WordPress n°258 : WordPress 4.3 – WordCamps &amp; Evénements WP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"http://feedproxy.google.com/~r/feedburner/cjgL/~3/FiV0asGKK6M/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:108:"http://www.wordpress-fr.net/2015/05/05/lhebdo-wordpress-n258-wordpress-4-3-wordcamps-evenements-wp/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 05 May 2015 05:25:39 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:5:{i:0;a:5:{s:4:"data";s:7:"Astuces";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:14:"Développement";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:11:"Evènements";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:10:"Podcasting";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:8:"wordcamp";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"http://www.wordpress-fr.net/?p=7437";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:395:"WordPress 4.3 est lancé Comme toujours, quelques jours après le déploiement d&#8217;une version majeur la suivante est aussitôt mise sur les rails. WordPress 4.3 est donc prévue pour le 18 août prochain et c&#8217;est Konstantin Obenland qui en prend les rênes. (en) Les premières pistes de réflexions sont ouvertes, notamment concernant l&#8217;éditeur. (en) WordPress 4.2.1 [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:7:"Benoît";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:3723:"<h3>WordPress 4.3 est lancé</h3>\n<p>Comme toujours, quelques jours après le déploiement d&rsquo;une version majeur la suivante est aussitôt mise sur les rails. WordPress 4.3 est donc <a href="http://wp.me/p2AvED-3mD">prévue pour le 18 août prochain</a> et c&rsquo;est Konstantin Obenland qui en prend les rênes. (en)</p>\n<p>Les premières pistes de réflexions sont ouvertes, <a href="https://make.wordpress.org/core/2015/05/01/editor-wish-list-for-4-3/">notamment concernant l&rsquo;éditeur</a>. (en)</p>\n<h3>WordPress 4.2.1 : Première mise à jour mineure</h3>\n<p>Une faille de sécurité a été décelée rapidement après la sortie de WordPress 4.2, <a href="http://t.co/O3MDAj635H">le patch correctif </a>ne s&rsquo;est donc pas fait attendre (en).</p>\n<h3>WordCamp Lyon : programme et surprises</h3>\n<p>Le WordCamp Lyon avance et se précise. <a href="https://lyon.wordcamp.org/2015/programme/">Le programme est connu</a> et on sait depuis peu qu&rsquo;un <a href="https://lyon.wordcamp.org/2015/nightswapping-vous-offre-2-nuits-a-lyon-pour-le-wordcamp/">nouveau partenaire propose une surprise</a>.</p>\n<h3>WordCamp Europe : les orateurs se dévoilent</h3>\n<p>1ère surprise de taille, <a href="http://europe.wordcamp.org/2015/welcome-the-third-group-of-wceu-speakers/">Xavier (notre Xavier) fait partie des orateurs </a>du prochains WordCamp Europe.</p>\n<h3>WPMX Day</h3>\n<p>Rappelons également que le lendemain du WordCamp Lyon se tiendra le <a href="http://2015.wpmx.org/">WPMX Day</a>, événement majeur dans le Sud-Ouest de la France.</p>\n<h3>Le 11e Podcast de Very French Trip</h3>\n<p><a href="http://veryfrenchtrip.com/podcast/podcast-12-traduction-wordpress/">Pour cette 11e édition</a>, la traduction est à l&rsquo;honneur avec des invités de marque que sont Xavier, Didier, François-Xavier, Mathieu et Grégoire.</p>\n<h3>Les principes de hiérarchie dans le design visuel</h3>\n<p>Un article qui parle de <a href="https://dailypost.wordpress.com/2015/04/29/the-principles-of-design-visual-hierarchy/">design des sites web</a> raconté par un Automatticien. (en)</p>\n<h3>WPRocket élue meilleure extension de cache</h3>\n<p>WPSiteCare a élu <a href="http://www.wpsitecare.com/best-wordpress-plugins/">WPRocket meilleure extension de cache de tous les temps</a> (en)&#8230; et retrouvez également le classement des autres meilleures extensions de tous les temps dans ce classement.</p>\n<h3>Les événements WordPress sur une carte</h3>\n<p>ManageWP.org a mis en ligne une <a href="https://managewp.org/events/">carte interactive avec les différents événements WordPress </a>de la Planète. (en)</p>\n<div class="feedflare">\n<a href="http://feeds.feedburner.com/~ff/WordpressFrancophone?a=kwe0XgYW1P0:5XuUlueSTRA:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/WordpressFrancophone?d=yIl2AUoC8zA" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/WordpressFrancophone?a=kwe0XgYW1P0:5XuUlueSTRA:V_sGLiPBpWU"><img src="http://feeds.feedburner.com/~ff/WordpressFrancophone?i=kwe0XgYW1P0:5XuUlueSTRA:V_sGLiPBpWU" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/WordpressFrancophone?a=kwe0XgYW1P0:5XuUlueSTRA:qj6IDK7rITs"><img src="http://feeds.feedburner.com/~ff/WordpressFrancophone?d=qj6IDK7rITs" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/WordpressFrancophone?a=kwe0XgYW1P0:5XuUlueSTRA:gIN9vFwOqvQ"><img src="http://feeds.feedburner.com/~ff/WordpressFrancophone?i=kwe0XgYW1P0:5XuUlueSTRA:gIN9vFwOqvQ" border="0"></img></a>\n</div><img src="http://feeds.feedburner.com/~r/WordpressFrancophone/~4/kwe0XgYW1P0" height="1" width="1" alt=""/><img src="http://feeds.feedburner.com/~r/feedburner/cjgL/~4/FiV0asGKK6M" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:104:"http://www.wordpress-fr.net/2015/05/05/lhebdo-wordpress-n258-wordpress-4-3-wordcamps-evenements-wp/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"1";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:2:{i:0;a:5:{s:4:"data";s:99:"http://www.wordpress-fr.net/2015/05/05/lhebdo-wordpress-n258-wordpress-4-3-wordcamps-evenements-wp/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:67:"http://feedproxy.google.com/~r/WordpressFrancophone/~3/kwe0XgYW1P0/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:1;a:6:{s:4:"data";s:45:"\n		\n		\n		\n		\n		\n				\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:6:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:42:"Le PHP Tour 2015 fait étape au Luxembourg";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"http://feedproxy.google.com/~r/feedburner/cjgL/~3/3_hUZIPodZM/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:90:"http://www.wordpress-fr.net/2015/05/01/le-php-tour-2015-fait-etape-au-luxembourg/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Fri, 01 May 2015 15:52:54 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:2:{i:0;a:5:{s:4:"data";s:11:"Evènements";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:4:"AFUP";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"http://www.wordpress-fr.net/?p=7431";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:396:"Nos amis de l&#8217;AFUP organisent le PHP Tour. Cette année, c&#8217;est le Luxembourg qui accueillera l&#8217;événement. L&#8217;AFUP nous a demandé de diffuser leur communiqué de presse, c&#8217;est donc avec plaisir que je m&#8217;exécute. En effet, PHP et WordPress ont des liens évidents et nos 2 communautés ont forcément des tonnes de choses en commun. L&#8217;entraide [&#8230;]";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:32:"http://purl.org/dc/elements/1.1/";a:1:{s:7:"creator";a:1:{i:0;a:5:{s:4:"data";s:7:"Benoît";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:40:"http://purl.org/rss/1.0/modules/content/";a:1:{s:7:"encoded";a:1:{i:0;a:5:{s:4:"data";s:6451:"<p><img class="alignleft size-full wp-image-7432" src="http://www.wordpress-fr.net/wp-content/uploads/2015/05/afup.png" alt="afup" width="209" height="99" />Nos amis de l&rsquo;AFUP organisent le PHP Tour. Cette année, c&rsquo;est le Luxembourg qui accueillera l&rsquo;événement.</p>\n<p>L&rsquo;AFUP nous a demandé de diffuser leur communiqué de presse, c&rsquo;est donc avec plaisir que je m&rsquo;exécute. En effet, PHP et WordPress ont des liens évidents et nos 2 communautés ont forcément des tonnes de choses en commun. L&rsquo;entraide de l&rsquo;open source est aussi ici.</p>\n<h2>Le communiqué de presse de l&rsquo;AFUP</h2>\n<blockquote>\n<h3>Le PHP Tour Luxembourg 2015 dévoile son programme</h3>\n<p><em><strong>Le Cloud mis à l&rsquo;honneur, et une large place accordée aux innovations du langage et aux retours d&rsquo;expérience de grandes entreprises</strong></em></p>\n<p>Luxembourg-Ville aura le plaisir d&rsquo;accueillir l&rsquo;étape annuelle du cycle de conférences itinérant de l&rsquo;AFUP, les 12 et 13 mai, au sein de la prestigieuse abbaye de Neumünster. <strong>Le programme de cette édition est en ligne :  conférences anglophones, Cloud, PHP7 et workshops au menu de ces 2 jours 100 % PHP ! </strong></p>\n<p>Comme l&rsquo;indiquait l&rsquo;appel à conférenciers, une partie de la programmation sera tournée vers le Cloud : son coût, sa sécurité, son installation&#8230; Nous aurons ainsi le plaisir d&rsquo;accueillir, parmi tant d&rsquo;autres, Philip Krenn pour « Perils of the Cloud », ou Maxime Thoonsen pour « Ansible pour le Cloud ». Vous saurez tout sur ce nouvel outil incontournable du Web ! Mais le programme se penche évidemment aussi sur le langage : Julien Pauli nous parlera de l&rsquo;avenir de PHP avec « En route vers PHP7 ! », Enrico Zimuel sera présent pour « Pushing Boundaries: Zend Framework 3 and the Future », ainsi que Michelangelo Van Dam pour « The continuous PHP Pipeline ». Enfin, de   nombreux  retours   d&rsquo;expérience   de   grandes   entreprises (Arté,   Canal+,   Mediapart&#8230;)   seront programmés, pour découvrir de quelle façon PHP est utilisé dans les plus grandes compagnies du Europe.</p>\n<h3>Un programme pensé pour notre public anglophone</h3>\n<p>Pour cette édition hors des frontières françaises, un soin particulier a été porté à l&rsquo;équilibre entre les conférences en français et celles en anglais : la moitié du programme propose des conférences anglophones. Pas d&rsquo;inquiétude cependant pour ceux que l&rsquo;anglais effraie : il y a toujours un talk en français programmé en face d&rsquo;une conférence anglophone.</p>\n<h3>Apprenez en compagnie des meilleurs lors des workshops</h3>\n<p>Le mercredi 13 mai verra des ateliers organisés en parallèle des conférences : 3h en petit groupe et en compagnie d&rsquo;experts du langage. Apprenez des meilleurs, en appliquant leurs conseils directement sur votre machine ! Le matin, Manuel Silvoso vous propose de vous initier à la sécurité des applications web. L&rsquo;après-midi, Patrick Allaert vous aidera à créer des extensions PHP. Ces deux ateliers sont sur inscription, et réservés aux visiteurs du PHP Tour Luxembourg</p>\n<h3>Une édition luxembourgeoise exceptionnelle</h3>\n<p>Le PHP Tour, lancé en 2011, est devenu un événement incontournable pour la communauté PHP. Cycle de conférences itinérant, il s&rsquo;est ainsi arrêté à Lille, Nantes et Lyon. Sa programmation pointue aborde les dernières innovations du langage, tout en profitant de ces étapes pour aborder des thématiques propres à la région d&rsquo;accueil et ses enjeux économiques. Cet événement au-delà des frontières françaises est une grande première pour l&rsquo;association, qui illustre par ce biais son intention de représenter les développeurs PHP francophones. Outre cette première édition d&rsquo;un événement AFUP hors des frontières françaises, 2015 marquera également les 20 ans de PHP et les 15 ans de l&rsquo;AFUP. Un double-anniversaire que l&rsquo;association compte bien célébrer tout au long de l&rsquo;année !</p>\n<h5>Quelques mots sur l&rsquo;AFUP :</h5>\n<p>L&rsquo;AFUP, Association Française des Utilisateurs de PHP, est une association loi 1901, qui a pour objectif principal de promouvoir le langage PHP auprès des professionnels et de participer à son développement.<br />\nL&rsquo;AFUP a été créée pour répondre à un besoin croissant des entreprises, celui d&rsquo;avoir un interlocuteur unique pour répondre à leurs questions sur PHP.  Par ailleurs, l&rsquo;AFUP offre un cadre de rencontre et de ressources techniques pour les développeurs qui souhaitent faire avancer le langage PHP lui même.</p>\n<h5>Pour en savoir plus :</h5>\n<p>Le site du PHP Tour Luxembourg 2015 : <a href="http://www.phptour.org">http://www.phptour.org</a><br />\nLe site de l&rsquo;AFUP : <a href="http://www.afup.org">http://www.afup.org</a><br />\nTwitter : @afup</p>\n<h5>Contact Presse :</h5>\n<p>Amélie Deffrennes : communication@afup.org</p></blockquote>\n<h1>Promotion spéciale WordPress Francophone</h1>\n<p>L&rsquo;AFUP propose une réduction exceptionnelle de 50 euros sur le pass 2 jours pour les membres de la communauté WordPress Francophone  avec le code promo suivant : <em>AFUP&lt;3WORDPRESS</em></p>\n<div class="feedflare">\n<a href="http://feeds.feedburner.com/~ff/WordpressFrancophone?a=tvrMTIYQIZg:LL2SqHjRe8k:yIl2AUoC8zA"><img src="http://feeds.feedburner.com/~ff/WordpressFrancophone?d=yIl2AUoC8zA" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/WordpressFrancophone?a=tvrMTIYQIZg:LL2SqHjRe8k:V_sGLiPBpWU"><img src="http://feeds.feedburner.com/~ff/WordpressFrancophone?i=tvrMTIYQIZg:LL2SqHjRe8k:V_sGLiPBpWU" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/WordpressFrancophone?a=tvrMTIYQIZg:LL2SqHjRe8k:qj6IDK7rITs"><img src="http://feeds.feedburner.com/~ff/WordpressFrancophone?d=qj6IDK7rITs" border="0"></img></a> <a href="http://feeds.feedburner.com/~ff/WordpressFrancophone?a=tvrMTIYQIZg:LL2SqHjRe8k:gIN9vFwOqvQ"><img src="http://feeds.feedburner.com/~ff/WordpressFrancophone?i=tvrMTIYQIZg:LL2SqHjRe8k:gIN9vFwOqvQ" border="0"></img></a>\n</div><img src="http://feeds.feedburner.com/~r/WordpressFrancophone/~4/tvrMTIYQIZg" height="1" width="1" alt=""/><img src="http://feeds.feedburner.com/~r/feedburner/cjgL/~4/3_hUZIPodZM" height="1" width="1" alt=""/>";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:36:"http://wellformedweb.org/CommentAPI/";a:1:{s:10:"commentRss";a:1:{i:0;a:5:{s:4:"data";s:86:"http://www.wordpress-fr.net/2015/05/01/le-php-tour-2015-fait-etape-au-luxembourg/feed/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:38:"http://purl.org/rss/1.0/modules/slash/";a:1:{s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:1:"2";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}s:42:"http://rssnamespace.org/feedburner/ext/1.0";a:1:{s:8:"origLink";a:2:{i:0;a:5:{s:4:"data";s:81:"http://www.wordpress-fr.net/2015/05/01/le-php-tour-2015-fait-etape-au-luxembourg/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:67:"http://feedproxy.google.com/~r/WordpressFrancophone/~3/tvrMTIYQIZg/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}}}}i:2;a:6:{s:4:"data";s:63:"\n		\n		\n		\n		\n		\n				\n		\n		\n		\n		\n		\n		\n		\n\n		\n		\n				\n			\n		\n		";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";s:5:"child";a:6:{s:0:"";a:7:{s:5:"title";a:1:{i:0;a:5:{s:4:"data";s:81:"L’Hebdo WordPress n°257 : WordPress.org – Shortcake – WordPress 4.3 et 4.4";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"link";a:1:{i:0;a:5:{s:4:"data";s:62:"http://feedproxy.google.com/~r/feedburner/cjgL/~3/gC-2s1whW9Y/";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"comments";a:1:{i:0;a:5:{s:4:"data";s:115:"http://www.wordpress-fr.net/2015/04/28/lhebdo-wordpress-n257-wordpress-org-shortcake-wordpress-4-3-et-4-4/#comments";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:7:"pubDate";a:1:{i:0;a:5:{s:4:"data";s:31:"Tue, 28 Apr 2015 05:15:07 +0000";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:8:"category";a:8:{i:0;a:5:{s:4:"data";s:7:"Brèves";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:1;a:5:{s:4:"data";s:14:"Développement";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:2;a:5:{s:4:"data";s:10:"Extensions";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:3;a:5:{s:4:"data";s:9:"WordPress";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:4;a:5:{s:4:"data";s:7:"Astuces";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:5;a:5:{s:4:"data";s:9:"shortcode";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:6;a:5:{s:4:"data";s:13:"WordPress 4.3";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}i:7;a:5:{s:4:"data";s:13:"WordPress.org";s:7:"attribs";a:0:{}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:4:"guid";a:1:{i:0;a:5:{s:4:"data";s:35:"http://www.wordpress-fr.net/?p=7425";s:7:"attribs";a:1:{s:0:"";a:1:{s:11:"isPermaLink";s:5:"false";}}s:8:"xml_base";s:0:"";s:17:"xml_base_explicit";b:0;s:8:"xml_lang";s:0:"";}}s:11:"description";a:1:{i:0;a:5:{s:4:"data";s:344:"Il est des Hebdos que l&#8217;on pourrait renommer en Mensuel&#8230; celui-ci en fait partie ! Cela fait un mois que je n&#8217;ai pas écrit en ces lieux ! Mon ordinateur s&#8217;éloigne de moi ces temps-ci&#8230; il doit avoir d&#8217;autres chats à fouetter&#8230; Bref, me revoilà ! ', 'no'),
(337, '_transient_timeout_feed_mod_1835d2eaaf967b5cddcf4dbccdcaeab9', '1431381220', 'no'),
(338, '_transient_feed_mod_1835d2eaaf967b5cddcf4dbccdcaeab9', '1431338020', 'no'),
(339, '_transient_timeout_dash_4077549d03da2e451c8b5f002294ff51', '1431381221', 'no'),
(340, '_transient_dash_4077549d03da2e451c8b5f002294ff51', '<div class="rss-widget"><ul><li><a class=''rsswidget'' href=''http://feedproxy.google.com/~r/WordpressFrancophone/~3/kwe0XgYW1P0/''>L’Hebdo WordPress n°258 : WordPress 4.3 – WordCamps &amp; Evénements WP</a> <span class="rss-date">5 mai 2015</span><div class="rssSummary">WordPress 4.3 est lancé Comme toujours, quelques jours après le déploiement d’une version majeur la suivante est aussitôt mise sur les rails. WordPress 4.3 est donc prévue pour le 18 août prochain et c’est Konstantin Obenland qui en prend les rênes. (en) Les premières pistes de réflexions sont ouvertes, notamment concernant l’éditeur. (en) WordPress 4.2.1 [&hellip;]</div></li></ul></div><div class="rss-widget"><ul><li><a class=''rsswidget'' href=''http://feedproxy.google.com/~r/feedburner/cjgL/~3/FiV0asGKK6M/''>L’Hebdo WordPress n°258 : WordPress 4.3 – WordCamps &amp; Evénements WP</a></li><li><a class=''rsswidget'' href=''http://feedproxy.google.com/~r/feedburner/cjgL/~3/3_hUZIPodZM/''>Le PHP Tour 2015 fait étape au Luxembourg</a></li><li><a class=''rsswidget'' href=''http://feedproxy.google.com/~r/feedburner/cjgL/~3/gC-2s1whW9Y/''>L’Hebdo WordPress n°257 : WordPress.org – Shortcake – WordPress 4.3 et 4.4</a></li></ul></div><div class="rss-widget"><ul></ul></div>', 'no'),
(347, '_site_transient_timeout_browser_3fc6b4e5639314d139c5d624e9b51b17', '1431978841', 'yes'),
(348, '_site_transient_browser_3fc6b4e5639314d139c5d624e9b51b17', 'a:9:{s:8:"platform";s:7:"Windows";s:4:"name";s:6:"Chrome";s:7:"version";s:13:"42.0.2311.135";s:10:"update_url";s:28:"http://www.google.com/chrome";s:7:"img_src";s:49:"http://s.wordpress.org/images/browsers/chrome.png";s:11:"img_src_ssl";s:48:"https://wordpress.org/images/browsers/chrome.png";s:15:"current_version";s:2:"18";s:7:"upgrade";b:0;s:8:"insecure";b:0;}', 'yes'),
(358, 'theme_mods_3DJV', 'a:3:{i:0;b:0;s:16:"background_color";s:6:"1d1d1d";s:12:"header_image";s:13:"remove-header";}', 'yes'),
(361, '_site_transient_timeout_wporg_theme_feature_list', '1431460344', 'yes'),
(362, '_site_transient_wporg_theme_feature_list', 'a:4:{s:6:"Colors";a:15:{i:0;s:5:"black";i:1;s:4:"blue";i:2;s:5:"brown";i:3;s:4:"gray";i:4;s:5:"green";i:5;s:6:"orange";i:6;s:4:"pink";i:7;s:6:"purple";i:8;s:3:"red";i:9;s:6:"silver";i:10;s:3:"tan";i:11;s:5:"white";i:12;s:6:"yellow";i:13;s:4:"dark";i:14;s:5:"light";}s:6:"Layout";a:9:{i:0;s:12:"fixed-layout";i:1;s:12:"fluid-layout";i:2;s:17:"responsive-layout";i:3;s:10:"one-column";i:4;s:11:"two-columns";i:5;s:13:"three-columns";i:6;s:12:"four-columns";i:7;s:12:"left-sidebar";i:8;s:13:"right-sidebar";}s:8:"Features";a:20:{i:0;s:19:"accessibility-ready";i:1;s:8:"blavatar";i:2;s:10:"buddypress";i:3;s:17:"custom-background";i:4;s:13:"custom-colors";i:5;s:13:"custom-header";i:6;s:11:"custom-menu";i:7;s:12:"editor-style";i:8;s:21:"featured-image-header";i:9;s:15:"featured-images";i:10;s:15:"flexible-header";i:11;s:20:"front-page-post-form";i:12;s:19:"full-width-template";i:13;s:12:"microformats";i:14;s:12:"post-formats";i:15;s:20:"rtl-language-support";i:16;s:11:"sticky-post";i:17;s:13:"theme-options";i:18;s:17:"threaded-comments";i:19;s:17:"translation-ready";}s:7:"Subject";a:3:{i:0;s:7:"holiday";i:1;s:13:"photoblogging";i:2;s:8:"seasonal";}}', 'yes'),
(364, 'theme_mods_abaris', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1431449686;s:4:"data";a:6:{s:19:"wp_inactive_widgets";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-1";a:2:{i:0;s:17:"spider_calendar-2";i:1;s:20:"custom-menu-wizard-2";}s:8:"footer-1";a:0:{}s:8:"footer-2";a:0:{}s:8:"footer-3";a:0:{}s:8:"footer-4";a:0:{}}}}', 'yes'),
(365, '_transient_is_multi_author', '1', 'yes'),
(370, '_site_transient_update_themes', 'O:8:"stdClass":4:{s:12:"last_checked";i:1431462611;s:7:"checked";a:7:{s:4:"3DJV";s:3:"1.9";s:9:"Magazine1";s:3:"1.0";s:17:"Magazine1_florian";s:3:"1.0";s:13:"twentyfifteen";s:3:"1.0";s:14:"twentyfourteen";s:3:"1.3";s:9:"twentyten";s:3:"1.9";s:14:"twentythirteen";s:3:"1.4";}s:8:"response";a:3:{s:13:"twentyfifteen";a:4:{s:5:"theme";s:13:"twentyfifteen";s:11:"new_version";s:3:"1.2";s:3:"url";s:43:"https://wordpress.org/themes/twentyfifteen/";s:7:"package";s:59:"https://downloads.wordpress.org/theme/twentyfifteen.1.2.zip";}s:14:"twentyfourteen";a:4:{s:5:"theme";s:14:"twentyfourteen";s:11:"new_version";s:3:"1.4";s:3:"url";s:44:"https://wordpress.org/themes/twentyfourteen/";s:7:"package";s:60:"https://downloads.wordpress.org/theme/twentyfourteen.1.4.zip";}s:14:"twentythirteen";a:4:{s:5:"theme";s:14:"twentythirteen";s:11:"new_version";s:3:"1.5";s:3:"url";s:44:"https://wordpress.org/themes/twentythirteen/";s:7:"package";s:60:"https://downloads.wordpress.org/theme/twentythirteen.1.5.zip";}}s:12:"translations";a:0:{}}', 'yes');
INSERT INTO `wp_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(371, '_site_transient_update_plugins', 'O:8:"stdClass":4:{s:12:"last_checked";i:1431454735;s:8:"response";a:2:{s:19:"akismet/akismet.php";O:8:"stdClass":6:{s:2:"id";s:2:"15";s:4:"slug";s:7:"akismet";s:6:"plugin";s:19:"akismet/akismet.php";s:11:"new_version";s:5:"3.1.1";s:3:"url";s:38:"https://wordpress.org/plugins/akismet/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/akismet.3.1.1.zip";}s:34:"spider-event-calendar/calendar.php";O:8:"stdClass":6:{s:2:"id";s:5:"37603";s:4:"slug";s:21:"spider-event-calendar";s:6:"plugin";s:34:"spider-event-calendar/calendar.php";s:11:"new_version";s:6:"1.4.18";s:3:"url";s:52:"https://wordpress.org/plugins/spider-event-calendar/";s:7:"package";s:64:"https://downloads.wordpress.org/plugin/spider-event-calendar.zip";}}s:12:"translations";a:0:{}s:9:"no_update";a:9:{s:41:"custom-menu-wizard/custom-menu-wizard.php";O:8:"stdClass":7:{s:2:"id";s:5:"39058";s:4:"slug";s:18:"custom-menu-wizard";s:6:"plugin";s:41:"custom-menu-wizard/custom-menu-wizard.php";s:11:"new_version";s:5:"3.1.4";s:3:"url";s:49:"https://wordpress.org/plugins/custom-menu-wizard/";s:7:"package";s:67:"https://downloads.wordpress.org/plugin/custom-menu-wizard.3.1.4.zip";s:14:"upgrade_notice";s:182:"Fixed a couple of bugs in the shortcode processing, for when an Alternative is being used.\nAdded the ability to make a title into a link when the title has been set from a menu item.";}s:37:"download-manager/download-manager.php";O:8:"stdClass":6:{s:2:"id";s:5:"12879";s:4:"slug";s:16:"download-manager";s:6:"plugin";s:37:"download-manager/download-manager.php";s:11:"new_version";s:6:"2.7.92";s:3:"url";s:47:"https://wordpress.org/plugins/download-manager/";s:7:"package";s:59:"https://downloads.wordpress.org/plugin/download-manager.zip";}s:9:"hello.php";O:8:"stdClass":6:{s:2:"id";s:4:"3564";s:4:"slug";s:11:"hello-dolly";s:6:"plugin";s:9:"hello.php";s:11:"new_version";s:3:"1.6";s:3:"url";s:42:"https://wordpress.org/plugins/hello-dolly/";s:7:"package";s:58:"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip";}s:29:"insert-pages/insert-pages.php";O:8:"stdClass":6:{s:2:"id";s:5:"45710";s:4:"slug";s:12:"insert-pages";s:6:"plugin";s:29:"insert-pages/insert-pages.php";s:11:"new_version";s:3:"2.4";s:3:"url";s:43:"https://wordpress.org/plugins/insert-pages/";s:7:"package";s:55:"https://downloads.wordpress.org/plugin/insert-pages.zip";}s:19:"members/members.php";O:8:"stdClass":6:{s:2:"id";s:5:"10325";s:4:"slug";s:7:"members";s:6:"plugin";s:19:"members/members.php";s:11:"new_version";s:5:"0.2.4";s:3:"url";s:38:"https://wordpress.org/plugins/members/";s:7:"package";s:56:"https://downloads.wordpress.org/plugin/members.0.2.4.zip";}s:37:"tinymce-advanced/tinymce-advanced.php";O:8:"stdClass":6:{s:2:"id";s:3:"731";s:4:"slug";s:16:"tinymce-advanced";s:6:"plugin";s:37:"tinymce-advanced/tinymce-advanced.php";s:11:"new_version";s:5:"4.1.9";s:3:"url";s:47:"https://wordpress.org/plugins/tinymce-advanced/";s:7:"package";s:65:"https://downloads.wordpress.org/plugin/tinymce-advanced.4.1.9.zip";}s:47:"wp-admin-ui-customize/wp-admin-ui-customize.php";O:8:"stdClass":6:{s:2:"id";s:5:"37324";s:4:"slug";s:21:"wp-admin-ui-customize";s:6:"plugin";s:47:"wp-admin-ui-customize/wp-admin-ui-customize.php";s:11:"new_version";s:7:"1.5.2.7";s:3:"url";s:52:"https://wordpress.org/plugins/wp-admin-ui-customize/";s:7:"package";s:72:"https://downloads.wordpress.org/plugin/wp-admin-ui-customize.1.5.2.7.zip";}s:30:"wedevs-project-manager/cpm.php";O:8:"stdClass":6:{s:2:"id";s:5:"36625";s:4:"slug";s:22:"wedevs-project-manager";s:6:"plugin";s:30:"wedevs-project-manager/cpm.php";s:11:"new_version";s:5:"0.4.6";s:3:"url";s:53:"https://wordpress.org/plugins/wedevs-project-manager/";s:7:"package";s:65:"https://downloads.wordpress.org/plugin/wedevs-project-manager.zip";}s:24:"wp-promo-emails/wppe.php";O:8:"stdClass":6:{s:2:"id";s:5:"54697";s:4:"slug";s:15:"wp-promo-emails";s:6:"plugin";s:24:"wp-promo-emails/wppe.php";s:11:"new_version";s:3:"5.3";s:3:"url";s:46:"https://wordpress.org/plugins/wp-promo-emails/";s:7:"package";s:62:"https://downloads.wordpress.org/plugin/wp-promo-emails.5.3.zip";}}}', 'yes'),
(374, 'category_children', 'a:0:{}', 'yes'),
(375, '_site_transient_timeout_theme_roots', '1431464410', 'yes'),
(376, '_site_transient_theme_roots', 'a:7:{s:4:"3DJV";s:7:"/themes";s:9:"Magazine1";s:7:"/themes";s:17:"Magazine1_florian";s:7:"/themes";s:13:"twentyfifteen";s:7:"/themes";s:14:"twentyfourteen";s:7:"/themes";s:9:"twentyten";s:7:"/themes";s:14:"twentythirteen";s:7:"/themes";}', 'yes');

-- --------------------------------------------------------

--
-- Structure de la table `wp_postmeta`
--

CREATE TABLE IF NOT EXISTS `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=264 ;

--
-- Contenu de la table `wp_postmeta`
--

INSERT INTO `wp_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 4, '_edit_lock', '1431258441:1'),
(3, 6, '_edit_lock', '1431258541:1'),
(4, 6, '_edit_last', '1'),
(5, 6, '_wp_page_template', 'default'),
(6, 8, '_edit_lock', '1431258599:1'),
(7, 8, '_edit_last', '1'),
(8, 8, '_wp_page_template', 'default'),
(11, 12, '_coworker', ''),
(12, 13, '_edit_lock', '1431284552:1'),
(15, 15, '_edit_lock', '1431447397:1'),
(16, 15, '_edit_last', '1'),
(17, 15, '_wp_page_template', 'template_accueil.php'),
(18, 19, '_menu_item_type', 'custom'),
(19, 19, '_menu_item_menu_item_parent', '0'),
(20, 19, '_menu_item_object_id', '19'),
(21, 19, '_menu_item_object', 'custom'),
(22, 19, '_menu_item_target', ''),
(23, 19, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(24, 19, '_menu_item_xfn', ''),
(25, 19, '_menu_item_url', 'http://localhost/3d_jeuxvideo/'),
(26, 19, '_menu_item_orphaned', '1431295594'),
(27, 20, '_menu_item_type', 'post_type'),
(28, 20, '_menu_item_menu_item_parent', '0'),
(29, 20, '_menu_item_object_id', '15'),
(30, 20, '_menu_item_object', 'page'),
(31, 20, '_menu_item_target', ''),
(32, 20, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(33, 20, '_menu_item_xfn', ''),
(34, 20, '_menu_item_url', ''),
(35, 20, '_menu_item_orphaned', '1431295594'),
(36, 21, '_menu_item_type', 'post_type'),
(37, 21, '_menu_item_menu_item_parent', '0'),
(38, 21, '_menu_item_object_id', '8'),
(39, 21, '_menu_item_object', 'page'),
(40, 21, '_menu_item_target', ''),
(41, 21, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(42, 21, '_menu_item_xfn', ''),
(43, 21, '_menu_item_url', ''),
(44, 21, '_menu_item_orphaned', '1431295594'),
(45, 22, '_menu_item_type', 'post_type'),
(46, 22, '_menu_item_menu_item_parent', '0'),
(47, 22, '_menu_item_object_id', '2'),
(48, 22, '_menu_item_object', 'page'),
(49, 22, '_menu_item_target', ''),
(50, 22, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(51, 22, '_menu_item_xfn', ''),
(52, 22, '_menu_item_url', ''),
(53, 22, '_menu_item_orphaned', '1431295594'),
(54, 23, '_menu_item_type', 'post_type'),
(55, 23, '_menu_item_menu_item_parent', '0'),
(56, 23, '_menu_item_object_id', '6'),
(57, 23, '_menu_item_object', 'page'),
(58, 23, '_menu_item_target', ''),
(59, 23, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(60, 23, '_menu_item_xfn', ''),
(61, 23, '_menu_item_url', ''),
(62, 23, '_menu_item_orphaned', '1431295594'),
(65, 25, '_menu_item_type', 'post_type'),
(66, 25, '_menu_item_menu_item_parent', '0'),
(67, 25, '_menu_item_object_id', '15'),
(68, 25, '_menu_item_object', 'page'),
(69, 25, '_menu_item_target', ''),
(70, 25, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(71, 25, '_menu_item_xfn', ''),
(72, 25, '_menu_item_url', ''),
(110, 30, '_menu_item_type', 'custom'),
(111, 30, '_menu_item_menu_item_parent', '0'),
(112, 30, '_menu_item_object_id', '30'),
(113, 30, '_menu_item_object', 'custom'),
(114, 30, '_menu_item_target', ''),
(115, 30, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(116, 30, '_menu_item_xfn', ''),
(117, 30, '_menu_item_url', 'http://localhost/3d_jeuxvideo/wp-admin/edit.php'),
(119, 31, '_menu_item_type', 'custom'),
(120, 31, '_menu_item_menu_item_parent', '0'),
(121, 31, '_menu_item_object_id', '31'),
(122, 31, '_menu_item_object', 'custom'),
(123, 31, '_menu_item_target', ''),
(124, 31, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(125, 31, '_menu_item_xfn', ''),
(126, 31, '_menu_item_url', 'http://localhost/3d_jeuxvideo/wp-admin/upload.php'),
(128, 32, '_edit_lock', '1431304069:1'),
(129, 32, '_edit_last', '1'),
(130, 32, '_wp_page_template', 'default'),
(131, 34, '_edit_lock', '1431300535:1'),
(132, 34, '_edit_last', '1'),
(133, 34, '_wp_page_template', 'default'),
(134, 36, '_edit_lock', '1431300555:1'),
(135, 36, '_edit_last', '1'),
(136, 36, '_wp_page_template', 'default'),
(137, 38, '_edit_lock', '1431300579:1'),
(138, 38, '_edit_last', '1'),
(139, 38, '_wp_page_template', 'default'),
(176, 44, '_edit_lock', '1431301815:1'),
(177, 44, '_edit_last', '1'),
(178, 44, '_wp_page_template', 'default'),
(179, 46, '_edit_lock', '1431340124:1'),
(180, 46, '_edit_last', '1'),
(182, 48, '_edit_lock', '1431302366:1'),
(183, 48, '_edit_last', '1'),
(185, 50, '_edit_lock', '1431302201:1'),
(186, 50, '_edit_last', '1'),
(188, 52, '_edit_lock', '1431302294:1'),
(189, 52, '_edit_last', '1'),
(201, 55, '_edit_lock', '1431303558:1'),
(202, 55, '_edit_last', '1'),
(203, 57, '_wp_attached_file', '2015/05/fiche-de-poste.docx'),
(204, 55, '__wpdm_files', 'a:1:{i:0;s:12:"fiche C.docx";}'),
(205, 55, '__wpdm_legacy_id', ''),
(206, 55, '__wpdm_link_label', ''),
(207, 55, '__wpdm_password', ''),
(208, 55, '__wpdm_quota', ''),
(209, 55, '__wpdm_download_count', ''),
(210, 55, '__wpdm_access', 'a:1:{i:0;s:5:"guest";}'),
(211, 55, '__wpdm_icon', ''),
(212, 55, '__wpdm_masterkey', '554ff5f9c3093'),
(213, 62, '_edit_lock', '1431338568:1'),
(214, 63, '_menu_item_type', 'taxonomy'),
(215, 63, '_menu_item_menu_item_parent', '0'),
(216, 63, '_menu_item_object_id', '4'),
(217, 63, '_menu_item_object', 'category'),
(218, 63, '_menu_item_target', ''),
(219, 63, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(220, 63, '_menu_item_xfn', ''),
(221, 63, '_menu_item_url', ''),
(223, 64, '_menu_item_type', 'taxonomy'),
(224, 64, '_menu_item_menu_item_parent', '0'),
(225, 64, '_menu_item_object_id', '5'),
(226, 64, '_menu_item_object', 'category'),
(227, 64, '_menu_item_target', ''),
(228, 64, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(229, 64, '_menu_item_xfn', ''),
(230, 64, '_menu_item_url', ''),
(232, 65, '_menu_item_type', 'taxonomy'),
(233, 65, '_menu_item_menu_item_parent', '0'),
(234, 65, '_menu_item_object_id', '6'),
(235, 65, '_menu_item_object', 'category'),
(236, 65, '_menu_item_target', ''),
(237, 65, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(238, 65, '_menu_item_xfn', ''),
(239, 65, '_menu_item_url', ''),
(241, 66, '_menu_item_type', 'taxonomy'),
(242, 66, '_menu_item_menu_item_parent', '0'),
(243, 66, '_menu_item_object_id', '7'),
(244, 66, '_menu_item_object', 'category'),
(245, 66, '_menu_item_target', ''),
(246, 66, '_menu_item_classes', 'a:1:{i:0;s:0:"";}'),
(247, 66, '_menu_item_xfn', ''),
(248, 66, '_menu_item_url', ''),
(250, 67, '_edit_lock', '1431339031:1'),
(251, 69, '_edit_lock', '1431339926:1'),
(252, 69, '_edit_last', '1'),
(253, 71, '_wp_attached_file', '2015/05/carte_graphique.png'),
(254, 71, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:300;s:6:"height";i:180;s:4:"file";s:27:"2015/05/carte_graphique.png";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:27:"carte_graphique-150x150.png";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:9:"image/png";}s:6:"medium";a:4:{s:4:"file";s:27:"carte_graphique-300x180.png";s:5:"width";i:300;s:6:"height";i:180;s:9:"mime-type";s:9:"image/png";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(255, 72, '_wp_attached_file', '2015/05/carte_mère_nvlle.jpg'),
(256, 72, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:700;s:6:"height";i:662;s:4:"file";s:29:"2015/05/carte_mère_nvlle.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:29:"carte_mère_nvlle-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:29:"carte_mère_nvlle-300x284.jpg";s:5:"width";i:300;s:6:"height";i:284;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:29:"carte_mère_nvlle-700x198.jpg";s:5:"width";i:700;s:6:"height";i:198;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(257, 73, '_wp_attached_file', '2015/05/cochon.jpg'),
(258, 73, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:330;s:6:"height";i:320;s:4:"file";s:18:"2015/05/cochon.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:18:"cochon-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:18:"cochon-300x291.jpg";s:5:"width";i:300;s:6:"height";i:291;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:18:"cochon-330x198.jpg";s:5:"width";i:330;s:6:"height";i:198;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(260, 76, '_wp_attached_file', '2015/05/image-google-glass2.jpg'),
(261, 76, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:817;s:6:"height";i:518;s:4:"file";s:31:"2015/05/image-google-glass2.jpg";s:5:"sizes";a:3:{s:9:"thumbnail";a:4:{s:4:"file";s:31:"image-google-glass2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:31:"image-google-glass2-300x190.jpg";s:5:"width";i:300;s:6:"height";i:190;s:9:"mime-type";s:10:"image/jpeg";}s:14:"post-thumbnail";a:4:{s:4:"file";s:31:"image-google-glass2-817x198.jpg";s:5:"width";i:817;s:6:"height";i:198;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:11:{s:8:"aperture";i:0;s:6:"credit";s:0:"";s:6:"camera";s:0:"";s:7:"caption";s:0:"";s:17:"created_timestamp";i:0;s:9:"copyright";s:0:"";s:12:"focal_length";i:0;s:3:"iso";i:0;s:13:"shutter_speed";i:0;s:5:"title";s:0:"";s:11:"orientation";i:0;}}'),
(262, 76, '_edit_lock', '1431339828:1'),
(263, 76, '_edit_last', '1');

-- --------------------------------------------------------

--
-- Structure de la table `wp_posts`
--

CREATE TABLE IF NOT EXISTS `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=79 ;

--
-- Contenu de la table `wp_posts`
--

INSERT INTO `wp_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2015-03-09 21:28:31', '2015-03-09 21:28:31', 'Bienvenue dans WordPress. Ceci est votre premier article. Modifiez-le ou supprimez-le, puis lancez-vous&nbsp;!', 'Bonjour tout le monde&nbsp;!', '', 'publish', 'open', 'open', '', 'bonjour-tout-le-monde', '', '', '2015-03-09 21:28:31', '2015-03-09 21:28:31', '', 0, 'http://localhost/3d_jeuxvideo/?p=1', 0, 'post', '', 1),
(2, 1, '2015-03-09 21:28:31', '2015-03-09 21:28:31', 'Voici un exemple de page. Elle est différente d''un article de blog, en cela qu''elle restera à la même place, et s''affichera dans le menu de navigation de votre site (en fonction de votre thème). La plupart des gens commencent par écrire une page « À Propos » qui les présente aux visiteurs potentiels du site. Vous pourriez y écrire quelque chose de ce tenant :\n\n<blockquote>Bonjour ! Je suis un mécanicien qui aspire à devenir un acteur, et voici mon blog. J''habite à Bordeaux, j''ai un super chien baptisé Russell, et j''aime la vodka-ananas (ainsi que regarder la pluie tomber).</blockquote>\n\n...ou bien quelque chose comme ça :\n\n<blockquote>La société 123 Machin Truc a été créée en 1971, et n''a cessé de proposer au public des machins-trucs de qualité depuis lors. Située à Saint-Remy-en-Bouzemont-Saint-Genest-et-Isson, 123 Machin Truc emploie 2 000 personnes, et fabrique toutes sortes de bidules super pour la communauté bouzemontoise.</blockquote>\n\nÉtant donné que vous êtes un nouvel utilisateur de WordPress, vous devriez vous rendre sur votre <a href="http://localhost/3d_jeuxvideo/wp-admin/">tableau de bord</a> pour effacer la présente page, et créer de nouvelles pages avec votre propre contenu. Amusez-vous bien !', 'Page d&rsquo;exemple', '', 'publish', 'open', 'open', '', 'page-d-exemple', '', '', '2015-03-09 21:28:31', '2015-03-09 21:28:31', '', 0, 'http://localhost/3d_jeuxvideo/?page_id=2', 0, 'page', '', 0),
(4, 1, '2015-05-10 12:21:06', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-05-10 12:21:06', '0000-00-00 00:00:00', '', 0, 'http://localhost/3d_jeuxvideo/?page_id=4', 0, 'page', '', 0),
(5, 1, '2015-05-10 12:50:37', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-05-10 12:50:37', '0000-00-00 00:00:00', '', 0, 'http://localhost/3d_jeuxvideo/?p=5', 0, 'post', '', 0),
(6, 1, '2015-05-10 12:51:19', '2015-05-10 11:51:19', 'rien', 'page modele défaut', '', 'publish', 'open', 'open', '', 'page-modele-defaut', '', '', '2015-05-10 12:51:19', '2015-05-10 11:51:19', '', 0, 'http://localhost/3d_jeuxvideo/?page_id=6', 0, 'page', '', 0),
(7, 1, '2015-05-10 12:51:19', '2015-05-10 11:51:19', 'rien', 'page modele défaut', '', 'inherit', 'open', 'open', '', '6-revision-v1', '', '', '2015-05-10 12:51:19', '2015-05-10 11:51:19', '', 6, 'http://localhost/3d_jeuxvideo/?p=7', 0, 'revision', '', 0),
(8, 1, '2015-05-10 12:52:00', '2015-05-10 11:52:00', 'rien 2', 'once colonne', '', 'publish', 'open', 'open', '', 'once-colonne', '', '', '2015-05-10 12:52:12', '2015-05-10 11:52:12', '', 0, 'http://localhost/3d_jeuxvideo/?page_id=8', 0, 'page', '', 0),
(9, 1, '2015-05-10 12:52:00', '2015-05-10 11:52:00', '', 'once colonne', '', 'inherit', 'open', 'open', '', '8-revision-v1', '', '', '2015-05-10 12:52:00', '2015-05-10 11:52:00', '', 8, 'http://localhost/3d_jeuxvideo/?p=9', 0, 'revision', '', 0),
(10, 1, '2015-05-10 12:52:12', '2015-05-10 11:52:12', 'rien 2', 'once colonne', '', 'inherit', 'open', 'open', '', '8-revision-v1', '', '', '2015-05-10 12:52:12', '2015-05-10 11:52:12', '', 8, 'http://localhost/3d_jeuxvideo/?p=10', 0, 'revision', '', 0),
(12, 1, '2015-05-10 18:43:10', '2015-05-10 17:43:10', '', 'test1', '', 'publish', 'open', 'open', '', 'test1', '', '', '2015-05-10 18:43:10', '2015-05-10 17:43:10', '', 0, 'http://localhost/3d_jeuxvideo/?project=test1', 0, 'project', '', 1),
(13, 1, '2015-05-10 18:54:45', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-05-10 18:54:45', '0000-00-00 00:00:00', '', 0, 'http://localhost/3d_jeuxvideo/?p=13', 0, 'post', '', 0),
(15, 1, '2015-05-10 20:40:28', '2015-05-10 19:40:28', '', 'Accueil', '', 'publish', 'closed', 'closed', '', 'accueil-new', '', '', '2015-05-11 01:22:05', '2015-05-11 00:22:05', '', 0, 'http://localhost/3d_jeuxvideo/?page_id=15', 0, 'page', '', 0),
(16, 1, '2015-05-10 20:40:28', '2015-05-10 19:40:28', '', 'accueil new', '', 'inherit', 'open', 'open', '', '15-revision-v1', '', '', '2015-05-10 20:40:28', '2015-05-10 19:40:28', '', 15, 'http://localhost/3d_jeuxvideo/?p=16', 0, 'revision', '', 0),
(18, 1, '2015-05-10 23:02:21', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-05-10 23:02:21', '0000-00-00 00:00:00', '', 0, 'http://localhost/3d_jeuxvideo/?page_id=18', 0, 'page', '', 0),
(19, 1, '2015-05-10 23:06:30', '0000-00-00 00:00:00', '', 'Accueil', '', 'draft', 'open', 'open', '', '', '', '', '2015-05-10 23:06:30', '0000-00-00 00:00:00', '', 0, 'http://localhost/3d_jeuxvideo/?p=19', 1, 'nav_menu_item', '', 0),
(20, 1, '2015-05-10 23:06:34', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-05-10 23:06:34', '0000-00-00 00:00:00', '', 0, 'http://localhost/3d_jeuxvideo/?p=20', 1, 'nav_menu_item', '', 0),
(21, 1, '2015-05-10 23:06:34', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-05-10 23:06:34', '0000-00-00 00:00:00', '', 0, 'http://localhost/3d_jeuxvideo/?p=21', 1, 'nav_menu_item', '', 0),
(22, 1, '2015-05-10 23:06:34', '0000-00-00 00:00:00', '', 'Page d’exemple', '', 'draft', 'open', 'open', '', '', '', '', '2015-05-10 23:06:34', '0000-00-00 00:00:00', '', 0, 'http://localhost/3d_jeuxvideo/?p=22', 1, 'nav_menu_item', '', 0),
(23, 1, '2015-05-10 23:06:34', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-05-10 23:06:34', '0000-00-00 00:00:00', '', 0, 'http://localhost/3d_jeuxvideo/?p=23', 1, 'nav_menu_item', '', 0),
(25, 1, '2015-05-10 23:46:25', '2015-05-10 22:46:25', ' ', '', '', 'publish', 'open', 'open', '', '25', '', '', '2015-05-11 11:06:50', '2015-05-11 10:06:50', '', 0, 'http://localhost/3d_jeuxvideo/?p=25', 1, 'nav_menu_item', '', 0),
(30, 1, '2015-05-10 23:49:13', '2015-05-10 22:49:13', '', 'Articles', '', 'publish', 'open', 'open', '', 'article', '', '', '2015-05-10 23:50:03', '2015-05-10 22:50:03', '', 0, 'http://localhost/3d_jeuxvideo/?p=30', 1, 'nav_menu_item', '', 0),
(31, 1, '2015-05-10 23:50:03', '2015-05-10 22:50:03', '', 'Galerie', '', 'publish', 'open', 'open', '', 'galerie', '', '', '2015-05-10 23:50:03', '2015-05-10 22:50:03', '', 0, 'http://localhost/3d_jeuxvideo/?p=31', 2, 'nav_menu_item', '', 0),
(32, 1, '2015-05-11 00:30:41', '2015-05-10 23:30:41', '[insert page=''actualite-1'' display=''affichage_article.php'']', 'Actualité', '', 'publish', 'closed', 'open', '', 'actualite', '', '', '2015-05-11 01:29:44', '2015-05-11 00:29:44', '', 0, 'http://localhost/3d_jeuxvideo/?page_id=32', 0, 'page', '', 0),
(33, 1, '2015-05-11 00:30:41', '2015-05-10 23:30:41', '', 'Actualité', '', 'inherit', 'open', 'open', '', '32-revision-v1', '', '', '2015-05-11 00:30:41', '2015-05-10 23:30:41', '', 32, 'http://localhost/3d_jeuxvideo/?p=33', 0, 'revision', '', 0),
(34, 1, '2015-05-11 00:31:09', '2015-05-10 23:31:09', '', 'TP', '', 'publish', 'closed', 'open', '', 'tp', '', '', '2015-05-11 00:31:09', '2015-05-10 23:31:09', '', 0, 'http://localhost/3d_jeuxvideo/?page_id=34', 0, 'page', '', 0),
(35, 1, '2015-05-11 00:31:09', '2015-05-10 23:31:09', '', 'TP', '', 'inherit', 'open', 'open', '', '34-revision-v1', '', '', '2015-05-11 00:31:09', '2015-05-10 23:31:09', '', 34, 'http://localhost/3d_jeuxvideo/?p=35', 0, 'revision', '', 0),
(36, 1, '2015-05-11 00:31:34', '2015-05-10 23:31:34', '', 'Tuto', '', 'publish', 'closed', 'open', '', 'tuto', '', '', '2015-05-11 00:31:34', '2015-05-10 23:31:34', '', 0, 'http://localhost/3d_jeuxvideo/?page_id=36', 0, 'page', '', 0),
(37, 1, '2015-05-11 00:31:34', '2015-05-10 23:31:34', '', 'Tuto', '', 'inherit', 'open', 'open', '', '36-revision-v1', '', '', '2015-05-11 00:31:34', '2015-05-10 23:31:34', '', 36, 'http://localhost/3d_jeuxvideo/?p=37', 0, 'revision', '', 0),
(38, 1, '2015-05-11 00:31:55', '2015-05-10 23:31:55', '', 'Média', '', 'publish', 'closed', 'open', '', 'media', '', '', '2015-05-11 00:31:55', '2015-05-10 23:31:55', '', 0, 'http://localhost/3d_jeuxvideo/?page_id=38', 0, 'page', '', 0),
(39, 1, '2015-05-11 00:31:55', '2015-05-10 23:31:55', '', 'Média', '', 'inherit', 'open', 'open', '', '38-revision-v1', '', '', '2015-05-11 00:31:55', '2015-05-10 23:31:55', '', 38, 'http://localhost/3d_jeuxvideo/?p=39', 0, 'revision', '', 0),
(44, 1, '2015-05-11 00:51:09', '2015-05-10 23:51:09', 'Liste des projets\r\n\r\n&nbsp;', 'Projet', '', 'publish', 'open', 'open', '', 'projet', '', '', '2015-05-11 00:51:09', '2015-05-10 23:51:09', '', 0, 'http://localhost/3d_jeuxvideo/?page_id=44', 0, 'page', '', 0),
(45, 1, '2015-05-11 00:51:09', '2015-05-10 23:51:09', 'Liste des projets\r\n\r\n&nbsp;', 'Projet', '', 'inherit', 'open', 'open', '', '44-revision-v1', '', '', '2015-05-11 00:51:09', '2015-05-10 23:51:09', '', 44, 'http://localhost/3d_jeuxvideo/?p=45', 0, 'revision', '', 0),
(46, 1, '2015-05-11 00:57:13', '2015-05-10 23:57:13', '&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n<a href="http://localhost/3d_jeuxvideo/wp-content/uploads/2015/05/image-google-glass2.jpg">Actualité 1</a>\r\n\r\n<a href="http://localhost/3d_jeuxvideo/wp-content/uploads/2015/05/image-google-glass2.jpg"><img class="alignnone size-medium wp-image-76" src="http://localhost/3d_jeuxvideo/wp-content/uploads/2015/05/image-google-glass2-300x190.jpg" alt="image google glass2" width="300" height="190" /></a>\r\n\r\n&nbsp;', 'Actualité 1', '', 'publish', 'open', 'open', '', 'actualite-1', '', '', '2015-05-11 11:27:42', '2015-05-11 10:27:42', '', 0, 'http://localhost/3d_jeuxvideo/?p=46', 0, 'post', '', 0),
(47, 1, '2015-05-11 00:57:13', '2015-05-10 23:57:13', 'Actualité 1', 'Actualité 1', '', 'inherit', 'open', 'open', '', '46-revision-v1', '', '', '2015-05-11 00:57:13', '2015-05-10 23:57:13', '', 46, 'http://localhost/3d_jeuxvideo/?p=47', 0, 'revision', '', 0),
(48, 1, '2015-05-11 00:58:17', '2015-05-10 23:58:17', 'TP1', 'TP 1', '', 'publish', 'open', 'open', '', 'tp-1', '', '', '2015-05-11 01:01:12', '2015-05-11 00:01:12', '', 0, 'http://localhost/3d_jeuxvideo/?p=48', 0, 'post', '', 0),
(49, 1, '2015-05-11 00:58:17', '2015-05-10 23:58:17', 'TP1', 'TP 1', '', 'inherit', 'open', 'open', '', '48-revision-v1', '', '', '2015-05-11 00:58:17', '2015-05-10 23:58:17', '', 48, 'http://localhost/3d_jeuxvideo/?p=49', 0, 'revision', '', 0),
(50, 1, '2015-05-11 00:59:00', '2015-05-10 23:59:00', 'TUTO1', 'TUTO1', '', 'publish', 'open', 'open', '', 'tuto1', '', '', '2015-05-11 00:59:00', '2015-05-10 23:59:00', '', 0, 'http://localhost/3d_jeuxvideo/?p=50', 0, 'post', '', 0),
(51, 1, '2015-05-11 00:59:00', '2015-05-10 23:59:00', 'TUTO1', 'TUTO1', '', 'inherit', 'open', 'open', '', '50-revision-v1', '', '', '2015-05-11 00:59:00', '2015-05-10 23:59:00', '', 50, 'http://localhost/3d_jeuxvideo/?p=51', 0, 'revision', '', 0),
(52, 1, '2015-05-11 00:59:58', '2015-05-10 23:59:58', 'Média 1', 'Média 1', '', 'publish', 'open', 'open', '', 'media-1', '', '', '2015-05-11 00:59:58', '2015-05-10 23:59:58', '', 0, 'http://localhost/3d_jeuxvideo/?p=52', 0, 'post', '', 0),
(53, 1, '2015-05-11 00:59:58', '2015-05-10 23:59:58', 'Média 1', 'Média 1', '', 'inherit', 'open', 'open', '', '52-revision-v1', '', '', '2015-05-11 00:59:58', '2015-05-10 23:59:58', '', 52, 'http://localhost/3d_jeuxvideo/?p=53', 0, 'revision', '', 0),
(55, 1, '2015-05-11 01:21:13', '2015-05-11 00:21:13', '', 'Jeux réseau', '', 'publish', 'closed', 'closed', '', 'jeux-reseau', '', '', '2015-05-11 01:21:13', '2015-05-11 00:21:13', '', 0, 'http://localhost/3d_jeuxvideo/?post_type=wpdmpro&#038;p=55', 0, 'wpdmpro', '', 0),
(56, 1, '2015-05-11 01:17:46', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-05-11 01:17:46', '0000-00-00 00:00:00', '', 0, 'http://localhost/3d_jeuxvideo/?post_type=wpdmpro&p=56', 0, 'wpdmpro', '', 0),
(57, 1, '2015-05-11 01:20:49', '2015-05-11 00:20:49', '', 'fiche de poste', '', 'inherit', 'open', 'open', '', 'fiche-de-poste', '', '', '2015-05-11 01:20:49', '2015-05-11 00:20:49', '', 55, 'http://localhost/3d_jeuxvideo/wp-content/uploads/2015/05/fiche-de-poste.docx', 0, 'attachment', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 0),
(58, 1, '2015-05-11 01:22:05', '2015-05-11 00:22:05', '', 'Accueil', '', 'inherit', 'open', 'open', '', '15-revision-v1', '', '', '2015-05-11 01:22:05', '2015-05-11 00:22:05', '', 15, 'http://localhost/3d_jeuxvideo/?p=58', 0, 'revision', '', 0),
(59, 1, '2015-05-11 01:23:16', '2015-05-11 00:23:16', '[insert page=''actualite-1'' display=''all'']', 'Actualité', '', 'inherit', 'open', 'open', '', '32-autosave-v1', '', '', '2015-05-11 01:23:16', '2015-05-11 00:23:16', '', 32, 'http://localhost/3d_jeuxvideo/?p=59', 0, 'revision', '', 0),
(60, 1, '2015-05-11 01:23:49', '2015-05-11 00:23:49', '[insert page=''actualite-1'' display=''all'']', 'Actualité', '', 'inherit', 'open', 'open', '', '32-revision-v1', '', '', '2015-05-11 01:23:49', '2015-05-11 00:23:49', '', 32, 'http://localhost/3d_jeuxvideo/?p=60', 0, 'revision', '', 0),
(61, 1, '2015-05-11 01:29:44', '2015-05-11 00:29:44', '[insert page=''actualite-1'' display=''affichage_article.php'']', 'Actualité', '', 'inherit', 'open', 'open', '', '32-revision-v1', '', '', '2015-05-11 01:29:44', '2015-05-11 00:29:44', '', 32, 'http://localhost/3d_jeuxvideo/?p=61', 0, 'revision', '', 0),
(62, 1, '2015-05-11 10:53:50', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-05-11 10:53:50', '0000-00-00 00:00:00', '', 0, 'http://localhost/3d_jeuxvideo/?p=62', 0, 'post', '', 0),
(63, 1, '2015-05-11 11:06:50', '2015-05-11 10:06:50', ' ', '', '', 'publish', 'open', 'open', '', '63', '', '', '2015-05-11 11:06:50', '2015-05-11 10:06:50', '', 0, 'http://localhost/3d_jeuxvideo/?p=63', 2, 'nav_menu_item', '', 0),
(64, 1, '2015-05-11 11:06:50', '2015-05-11 10:06:50', ' ', '', '', 'publish', 'open', 'open', '', '64', '', '', '2015-05-11 11:06:50', '2015-05-11 10:06:50', '', 0, 'http://localhost/3d_jeuxvideo/?p=64', 3, 'nav_menu_item', '', 0),
(65, 1, '2015-05-11 11:06:50', '2015-05-11 10:06:50', ' ', '', '', 'publish', 'open', 'open', '', '65', '', '', '2015-05-11 11:06:50', '2015-05-11 10:06:50', '', 0, 'http://localhost/3d_jeuxvideo/?p=65', 4, 'nav_menu_item', '', 0),
(66, 1, '2015-05-11 11:06:50', '2015-05-11 10:06:50', ' ', '', '', 'publish', 'open', 'open', '', '66', '', '', '2015-05-11 11:06:50', '2015-05-11 10:06:50', '', 0, 'http://localhost/3d_jeuxvideo/?p=66', 5, 'nav_menu_item', '', 0),
(67, 1, '2015-05-11 11:10:13', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-05-11 11:10:13', '0000-00-00 00:00:00', '', 0, 'http://localhost/3d_jeuxvideo/?p=67', 0, 'post', '', 0),
(68, 3, '2015-05-11 11:16:34', '0000-00-00 00:00:00', '', 'Brouillon auto', '', 'auto-draft', 'open', 'open', '', '', '', '', '2015-05-11 11:16:34', '0000-00-00 00:00:00', '', 0, 'http://localhost/3d_jeuxvideo/?p=68', 0, 'post', '', 0),
(69, 3, '2015-05-11 11:25:25', '2015-05-11 10:25:25', '[gallery link="file" ids="71,72,73"]', 'actu2', '', 'publish', 'open', 'open', '', 'actu2', '', '', '2015-05-11 11:25:25', '2015-05-11 10:25:25', '', 0, 'http://localhost/3d_jeuxvideo/?p=69', 0, 'post', '', 0),
(70, 3, '2015-05-11 11:17:06', '2015-05-11 10:17:06', '', 'actu2', '', 'inherit', 'open', 'open', '', '69-revision-v1', '', '', '2015-05-11 11:17:06', '2015-05-11 10:17:06', '', 69, 'http://localhost/3d_jeuxvideo/?p=70', 0, 'revision', '', 0),
(71, 1, '2015-05-11 11:21:46', '2015-05-11 10:21:46', '', 'carte_graphique', '', 'inherit', 'open', 'open', '', 'carte_graphique', '', '', '2015-05-11 11:21:46', '2015-05-11 10:21:46', '', 69, 'http://localhost/3d_jeuxvideo/wp-content/uploads/2015/05/carte_graphique.png', 0, 'attachment', 'image/png', 0),
(72, 1, '2015-05-11 11:21:47', '2015-05-11 10:21:47', '', 'carte_mère_nvlle', '', 'inherit', 'open', 'open', '', 'carte_mere_nvlle', '', '', '2015-05-11 11:21:47', '2015-05-11 10:21:47', '', 69, 'http://localhost/3d_jeuxvideo/wp-content/uploads/2015/05/carte_mère_nvlle.jpg', 0, 'attachment', 'image/jpeg', 0),
(73, 1, '2015-05-11 11:21:49', '2015-05-11 10:21:49', '', 'cochon', '', 'inherit', 'open', 'open', '', 'cochon', '', '', '2015-05-11 11:21:49', '2015-05-11 10:21:49', '', 69, 'http://localhost/3d_jeuxvideo/wp-content/uploads/2015/05/cochon.jpg', 0, 'attachment', 'image/jpeg', 0),
(74, 1, '2015-05-11 11:25:07', '2015-05-11 10:25:07', '[gallery link="file" ids="71,72,73"]', 'actu2', '', 'inherit', 'open', 'open', '', '69-autosave-v1', '', '', '2015-05-11 11:25:07', '2015-05-11 10:25:07', '', 69, 'http://localhost/3d_jeuxvideo/?p=74', 0, 'revision', '', 0),
(75, 1, '2015-05-11 11:25:25', '2015-05-11 10:25:25', '[gallery link="file" ids="71,72,73"]', 'actu2', '', 'inherit', 'open', 'open', '', '69-revision-v1', '', '', '2015-05-11 11:25:25', '2015-05-11 10:25:25', '', 69, 'http://localhost/3d_jeuxvideo/?p=75', 0, 'revision', '', 0),
(76, 1, '2015-05-11 11:25:41', '2015-05-11 10:25:41', '', 'image google glass2', '', 'inherit', 'open', 'open', '', 'image-google-glass2', '', '', '2015-05-11 11:26:40', '2015-05-11 10:26:40', '', 46, 'http://localhost/3d_jeuxvideo/wp-content/uploads/2015/05/image-google-glass2.jpg', 0, 'attachment', 'image/jpeg', 0),
(77, 1, '2015-05-11 11:27:23', '2015-05-11 10:27:23', '<a href="http://localhost/3d_jeuxvideo/wp-content/uploads/2015/05/image-google-glass2.jpg"><img class="alignnone size-medium wp-image-76" src="http://localhost/3d_jeuxvideo/wp-content/uploads/2015/05/image-google-glass2-300x190.jpg" alt="image google glass2" width="300" height="190" /></a>\n\n&nbsp;', 'Actualité 1', '', 'inherit', 'open', 'open', '', '46-autosave-v1', '', '', '2015-05-11 11:27:23', '2015-05-11 10:27:23', '', 46, 'http://localhost/3d_jeuxvideo/?p=77', 0, 'revision', '', 0),
(78, 1, '2015-05-11 11:27:42', '2015-05-11 10:27:42', '&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n&nbsp;\r\n\r\n<a href="http://localhost/3d_jeuxvideo/wp-content/uploads/2015/05/image-google-glass2.jpg">Actualité 1</a>\r\n\r\n<a href="http://localhost/3d_jeuxvideo/wp-content/uploads/2015/05/image-google-glass2.jpg"><img class="alignnone size-medium wp-image-76" src="http://localhost/3d_jeuxvideo/wp-content/uploads/2015/05/image-google-glass2-300x190.jpg" alt="image google glass2" width="300" height="190" /></a>\r\n\r\n&nbsp;', 'Actualité 1', '', 'inherit', 'open', 'open', '', '46-revision-v1', '', '', '2015-05-11 11:27:42', '2015-05-11 10:27:42', '', 46, 'http://localhost/3d_jeuxvideo/?p=78', 0, 'revision', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_simple_events`
--

CREATE TABLE IF NOT EXISTS `wp_simple_events` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `event_start` int(10) unsigned zerofill NOT NULL,
  `event_end` int(10) unsigned zerofill NOT NULL,
  `event_title` text COLLATE utf8_bin NOT NULL,
  `event_desc` longtext COLLATE utf8_bin,
  `event_url` text COLLATE utf8_bin,
  `event_loc` text COLLATE utf8_bin NOT NULL,
  `event_loc_url` text COLLATE utf8_bin,
  `event_label` varchar(10) COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `wp_simple_events`
--

INSERT INTO `wp_simple_events` (`id`, `event_start`, `event_end`, `event_title`, `event_desc`, `event_url`, `event_loc`, `event_loc_url`, `event_label`) VALUES
(1, 1431284400, 1431288000, 'test un', 'ddd', '', '', '', 'ddd');

-- --------------------------------------------------------

--
-- Structure de la table `wp_spidercalendar_calendar`
--

CREATE TABLE IF NOT EXISTS `wp_spidercalendar_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `gid` varchar(255) NOT NULL,
  `time_format` tinyint(1) NOT NULL,
  `allow_publish` varchar(255) NOT NULL,
  `def_year` varchar(512) NOT NULL,
  `def_month` varchar(255) NOT NULL,
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `wp_spidercalendar_calendar`
--

INSERT INTO `wp_spidercalendar_calendar` (`id`, `title`, `gid`, `time_format`, `allow_publish`, `def_year`, `def_month`, `published`) VALUES
(2, 'Evenement 1.1', '', 0, '', '', '', 1);

-- --------------------------------------------------------

--
-- Structure de la table `wp_spidercalendar_event`
--

CREATE TABLE IF NOT EXISTS `wp_spidercalendar_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calendar` int(11) NOT NULL,
  `date` date NOT NULL,
  `date_end` date NOT NULL,
  `title` text NOT NULL,
  `category` int(11) DEFAULT NULL,
  `time` varchar(20) NOT NULL,
  `text_for_date` longtext NOT NULL,
  `userID` varchar(255) NOT NULL,
  `repeat_method` varchar(255) NOT NULL,
  `repeat` varchar(255) NOT NULL,
  `week` varchar(255) NOT NULL,
  `month` varchar(255) NOT NULL,
  `month_type` varchar(255) NOT NULL,
  `monthly_list` varchar(255) NOT NULL,
  `month_week` varchar(255) NOT NULL,
  `year_month` varchar(255) NOT NULL,
  `published` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_spidercalendar_event_category`
--

CREATE TABLE IF NOT EXISTS `wp_spidercalendar_event_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `color` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `wp_spidercalendar_event_category`
--

INSERT INTO `wp_spidercalendar_event_category` (`id`, `title`, `published`, `color`, `description`) VALUES
(1, 'Evênement  1', 1, 'FFFFFF', '');

-- --------------------------------------------------------

--
-- Structure de la table `wp_spidercalendar_theme`
--

CREATE TABLE IF NOT EXISTS `wp_spidercalendar_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `width` varchar(255) NOT NULL,
  `cell_height` varchar(255) NOT NULL,
  `bg_top` varchar(255) NOT NULL,
  `bg_bottom` varchar(255) NOT NULL,
  `border_color` varchar(255) NOT NULL,
  `text_color_year` varchar(255) NOT NULL,
  `text_color_month` varchar(255) NOT NULL,
  `text_color_week_days` varchar(255) NOT NULL,
  `text_color_other_months` varchar(255) NOT NULL,
  `text_color_this_month_unevented` varchar(255) NOT NULL,
  `text_color_this_month_evented` varchar(255) NOT NULL,
  `event_title_color` varchar(255) NOT NULL,
  `current_day_border_color` varchar(255) NOT NULL,
  `bg_color_this_month_evented` varchar(255) NOT NULL,
  `next_prev_event_arrowcolor` varchar(255) NOT NULL,
  `show_event_bgcolor` varchar(255) NOT NULL,
  `cell_border_color` varchar(255) NOT NULL,
  `arrow_color_year` varchar(255) NOT NULL,
  `week_days_cell_height` varchar(255) NOT NULL,
  `arrow_color_month` varchar(255) NOT NULL,
  `text_color_sun_days` varchar(255) NOT NULL,
  `title_color` varchar(255) NOT NULL,
  `next_prev_event_bgcolor` varchar(255) NOT NULL,
  `title_font_size` varchar(255) NOT NULL,
  `title_font` varchar(255) NOT NULL,
  `title_style` varchar(255) NOT NULL,
  `date_color` varchar(255) NOT NULL,
  `date_size` varchar(255) NOT NULL,
  `date_font` varchar(255) NOT NULL,
  `date_style` varchar(255) NOT NULL,
  `popup_width` varchar(255) NOT NULL,
  `popup_height` varchar(255) NOT NULL,
  `number_of_shown_evetns` varchar(255) NOT NULL,
  `sundays_font_size` varchar(255) NOT NULL,
  `other_days_font_size` varchar(255) NOT NULL,
  `weekdays_font_size` varchar(255) NOT NULL,
  `border_width` varchar(255) NOT NULL,
  `top_height` varchar(255) NOT NULL,
  `bg_color_other_months` varchar(255) NOT NULL,
  `sundays_bg_color` varchar(255) NOT NULL,
  `weekdays_bg_color` varchar(255) NOT NULL,
  `week_start_day` varchar(255) NOT NULL,
  `weekday_sunday_bg_color` varchar(255) NOT NULL,
  `border_radius` varchar(255) NOT NULL,
  `year_font_size` varchar(255) NOT NULL,
  `month_font_size` varchar(255) NOT NULL,
  `arrow_size` varchar(255) NOT NULL,
  `next_month_text_color` varchar(255) NOT NULL,
  `prev_month_text_color` varchar(255) NOT NULL,
  `next_month_arrow_color` varchar(255) NOT NULL,
  `prev_month_arrow_color` varchar(255) NOT NULL,
  `next_month_font_size` varchar(255) NOT NULL,
  `prev_month_font_size` varchar(255) NOT NULL,
  `month_type` varchar(255) NOT NULL,
  `date_format` varchar(255) NOT NULL,
  `show_time` int(11) NOT NULL,
  `show_repeat` int(11) NOT NULL,
  `date_bg_color` varchar(255) NOT NULL,
  `event_bg_color1` varchar(255) NOT NULL,
  `event_bg_color2` varchar(255) NOT NULL,
  `event_num_bg_color1` varchar(255) NOT NULL,
  `event_num_bg_color2` varchar(255) NOT NULL,
  `event_num_color` varchar(255) NOT NULL,
  `date_font_size` varchar(255) NOT NULL,
  `event_num_font_size` varchar(255) NOT NULL,
  `event_table_height` varchar(255) NOT NULL,
  `date_height` varchar(255) NOT NULL,
  `ev_title_bg_color` varchar(255) NOT NULL,
  `week_font_size` varchar(255) NOT NULL,
  `day_month_font_size` varchar(255) NOT NULL,
  `week_font_color` varchar(255) NOT NULL,
  `day_month_font_color` varchar(255) NOT NULL,
  `views_tabs_bg_color` varchar(255) NOT NULL,
  `views_tabs_text_color` varchar(255) NOT NULL,
  `views_tabs_font_size` varchar(255) NOT NULL,
  `day_start` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Contenu de la table `wp_spidercalendar_theme`
--

INSERT INTO `wp_spidercalendar_theme` (`id`, `title`, `width`, `cell_height`, `bg_top`, `bg_bottom`, `border_color`, `text_color_year`, `text_color_month`, `text_color_week_days`, `text_color_other_months`, `text_color_this_month_unevented`, `text_color_this_month_evented`, `event_title_color`, `current_day_border_color`, `bg_color_this_month_evented`, `next_prev_event_arrowcolor`, `show_event_bgcolor`, `cell_border_color`, `arrow_color_year`, `week_days_cell_height`, `arrow_color_month`, `text_color_sun_days`, `title_color`, `next_prev_event_bgcolor`, `title_font_size`, `title_font`, `title_style`, `date_color`, `date_size`, `date_font`, `date_style`, `popup_width`, `popup_height`, `number_of_shown_evetns`, `sundays_font_size`, `other_days_font_size`, `weekdays_font_size`, `border_width`, `top_height`, `bg_color_other_months`, `sundays_bg_color`, `weekdays_bg_color`, `week_start_day`, `weekday_sunday_bg_color`, `border_radius`, `year_font_size`, `month_font_size`, `arrow_size`, `next_month_text_color`, `prev_month_text_color`, `next_month_arrow_color`, `prev_month_arrow_color`, `next_month_font_size`, `prev_month_font_size`, `month_type`, `date_format`, `show_time`, `show_repeat`, `date_bg_color`, `event_bg_color1`, `event_bg_color2`, `event_num_bg_color1`, `event_num_bg_color2`, `event_num_color`, `date_font_size`, `event_num_font_size`, `event_table_height`, `date_height`, `ev_title_bg_color`, `week_font_size`, `day_month_font_size`, `week_font_color`, `day_month_font_color`, `views_tabs_bg_color`, `views_tabs_text_color`, `views_tabs_font_size`, `day_start`) VALUES
(13, 'Shiny Blue', '700', '70', '005478', 'E1E1E1', '005478', 'F9F2F4', 'F9F2F4', '005D78', 'B0B0B0', '6A6A6A', '6A6A6A', '236283', '005478', 'B4C5CC', '97A0A6', 'B4C5CC', 'A9A9A9', 'CCD1D2', '50', 'CCD1D2', '6A6A6A', 'FFFFFF', '00608A', '', '', 'normal', '262626', '', '', 'normal', '600', '500', '1', '25', '25', '25', '0', '100', 'E1E1E1', 'E1E1E1', 'D6D6D6', 'su', 'B5B5B5', '0', '25', '25', '50', 'CCD1D2', 'CCD1D2', 'CCD1D2', '1010A4', '16', '16', '2', 'w/d/m/y', 1, 1, 'D6D4D5', 'E1E1E1', 'DEDCDD', '005478', '006E91', 'FFFFFF', '15', '13', '30', '25', 'C3D0D6', '15', '12', '005476', '737373', '01799C', 'FFFFFF', '13', 1);

-- --------------------------------------------------------

--
-- Structure de la table `wp_spidercalendar_widget_theme`
--

CREATE TABLE IF NOT EXISTS `wp_spidercalendar_widget_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `ev_title_color` varchar(255) DEFAULT NULL,
  `width` varchar(255) NOT NULL,
  `week_start_day` varchar(255) NOT NULL,
  `font_year` varchar(255) NOT NULL,
  `font_month` varchar(255) NOT NULL,
  `font_day` varchar(255) NOT NULL,
  `font_weekday` varchar(255) NOT NULL,
  `header_bgcolor` varchar(255) NOT NULL,
  `footer_bgcolor` varchar(255) NOT NULL,
  `text_color_month` varchar(255) NOT NULL,
  `text_color_week_days` varchar(255) NOT NULL,
  `text_color_other_months` varchar(255) NOT NULL,
  `text_color_this_month_unevented` varchar(255) NOT NULL,
  `text_color_this_month_evented` varchar(255) NOT NULL,
  `bg_color_this_month_evented` varchar(255) NOT NULL,
  `bg_color_selected` varchar(255) NOT NULL,
  `arrow_color` varchar(255) NOT NULL,
  `text_color_selected` varchar(255) NOT NULL,
  `border_day` varchar(255) NOT NULL,
  `text_color_sun_days` varchar(255) NOT NULL,
  `weekdays_bg_color` varchar(255) NOT NULL,
  `su_bg_color` varchar(255) NOT NULL,
  `cell_border_color` varchar(255) NOT NULL,
  `year_font_size` varchar(255) NOT NULL,
  `year_font_color` varchar(255) NOT NULL,
  `year_tabs_bg_color` varchar(255) NOT NULL,
  `date_format` varchar(255) NOT NULL,
  `title_color` varchar(255) NOT NULL,
  `title_font_size` varchar(255) NOT NULL,
  `title_font` varchar(255) NOT NULL,
  `title_style` varchar(255) NOT NULL,
  `date_color` varchar(255) NOT NULL,
  `date_size` varchar(255) NOT NULL,
  `date_font` varchar(255) NOT NULL,
  `date_style` varchar(255) NOT NULL,
  `next_prev_event_bgcolor` varchar(255) NOT NULL,
  `next_prev_event_arrowcolor` varchar(255) NOT NULL,
  `show_event_bgcolor` varchar(255) NOT NULL,
  `popup_width` varchar(255) NOT NULL,
  `popup_height` varchar(255) NOT NULL,
  `show_repeat` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `wp_spidercalendar_widget_theme`
--

INSERT INTO `wp_spidercalendar_widget_theme` (`id`, `title`, `ev_title_color`, `width`, `week_start_day`, `font_year`, `font_month`, `font_day`, `font_weekday`, `header_bgcolor`, `footer_bgcolor`, `text_color_month`, `text_color_week_days`, `text_color_other_months`, `text_color_this_month_unevented`, `text_color_this_month_evented`, `bg_color_this_month_evented`, `bg_color_selected`, `arrow_color`, `text_color_selected`, `border_day`, `text_color_sun_days`, `weekdays_bg_color`, `su_bg_color`, `cell_border_color`, `year_font_size`, `year_font_color`, `year_tabs_bg_color`, `date_format`, `title_color`, `title_font_size`, `title_font`, `title_style`, `date_color`, `date_size`, `date_font`, `date_style`, `next_prev_event_bgcolor`, `next_prev_event_arrowcolor`, `show_event_bgcolor`, `popup_width`, `popup_height`, `show_repeat`) VALUES
(1, 'Shiny Blue', '005478', '200', 'mo', '', '', '', '', '005478', 'E1E1E1', 'FFFFFF', '2F647D', '939699', '989898', 'FBFFFE', '005478', '005478', 'CED1D0', 'FFFFFF', '005478', '989898', 'D6D6D6', 'B5B5B5', 'D2D2D2', '13', 'ACACAC', 'ECECEC', 'w/d/m/y', 'FFFFFF', '', '', 'normal', '262626', '', '', 'normal', '00608A', '97A0A6', 'B4C5CC', '600', '500', '1');

-- --------------------------------------------------------

--
-- Structure de la table `wp_terms`
--

CREATE TABLE IF NOT EXISTS `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `wp_terms`
--

INSERT INTO `wp_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Non classé', 'non-classe', 0),
(2, 'Menu 1', 'menu-1', 0),
(3, 'menu 2', 'menu-2', 0),
(4, 'Actualités', 'actualite', 0),
(5, 'Tutos', 'tuto', 0),
(6, 'Médias', 'media', 0),
(7, 'TP', 'tp', 0),
(8, 'Jeux', 'jeux', 0),
(9, 'post-format-gallery', 'post-format-gallery', 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_term_relationships`
--

CREATE TABLE IF NOT EXISTS `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `wp_term_relationships`
--

INSERT INTO `wp_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(25, 2, 0),
(30, 3, 0),
(31, 3, 0),
(46, 4, 0),
(48, 7, 0),
(50, 5, 0),
(52, 6, 0),
(55, 8, 0),
(63, 2, 0),
(64, 2, 0),
(65, 2, 0),
(66, 2, 0),
(69, 1, 0),
(69, 9, 0);

-- --------------------------------------------------------

--
-- Structure de la table `wp_term_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Contenu de la table `wp_term_taxonomy`
--

INSERT INTO `wp_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 2),
(2, 2, 'nav_menu', '', 0, 5),
(3, 3, 'nav_menu', '', 0, 2),
(4, 4, 'category', '', 0, 1),
(5, 5, 'category', '', 0, 1),
(6, 6, 'category', '', 0, 1),
(7, 7, 'category', '', 0, 1),
(8, 8, 'wpdmcategory', '', 0, 1),
(9, 9, 'post_format', '', 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `wp_usermeta`
--

CREATE TABLE IF NOT EXISTS `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Contenu de la table `wp_usermeta`
--

INSERT INTO `wp_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'wp_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 1, 'wp_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets,wp410_dfw'),
(13, 1, 'show_welcome_panel', '1'),
(15, 1, 'wp_dashboard_quick_press_last_post_id', '5'),
(16, 2, 'nickname', 'lmerabli'),
(17, 2, 'first_name', 'lio'),
(18, 2, 'last_name', 'Mm'),
(19, 2, 'description', ''),
(20, 2, 'rich_editing', 'true'),
(21, 2, 'comment_shortcuts', 'false'),
(22, 2, 'admin_color', 'fresh'),
(23, 2, 'use_ssl', '0'),
(24, 2, 'show_admin_bar_front', 'true'),
(25, 2, 'wp_capabilities', 'a:1:{s:10:"subscriber";b:1;}'),
(26, 2, 'wp_user_level', '0'),
(27, 2, 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets'),
(28, 1, 'closedpostboxes_page', 'a:0:{}'),
(29, 1, 'metaboxhidden_page', 'a:0:{}'),
(30, 1, 'managenav-menuscolumnshidden', 'a:4:{i:0;s:11:"link-target";i:1;s:11:"css-classes";i:2;s:3:"xfn";i:3;s:11:"description";}'),
(31, 1, 'metaboxhidden_nav-menus', 'a:3:{i:0;s:8:"add-post";i:1;s:12:"add-post_tag";i:2;s:15:"add-post_format";}'),
(32, 1, 'nav_menu_recently_edited', '2'),
(33, 1, 'closedpostboxes_post', 'a:0:{}'),
(34, 1, 'metaboxhidden_post', 'a:1:{i:0;s:9:"authordiv";}'),
(35, 1, 'wp_user-settings', 'libraryContent=browse&wpinsertpage=1'),
(36, 1, 'wp_user-settings-time', '1431303825'),
(37, 3, 'nickname', 'contri'),
(38, 3, 'first_name', ''),
(39, 3, 'last_name', ''),
(40, 3, 'description', ''),
(41, 3, 'rich_editing', 'true'),
(42, 3, 'comment_shortcuts', 'false'),
(43, 3, 'admin_color', 'fresh'),
(44, 3, 'use_ssl', '0'),
(45, 3, 'show_admin_bar_front', 'true'),
(46, 3, 'wp_capabilities', 'a:1:{s:11:"contributor";b:1;}'),
(47, 3, 'wp_user_level', '1'),
(48, 3, 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets,wp410_dfw'),
(50, 3, 'wp_dashboard_quick_press_last_post_id', '68'),
(51, 1, 'session_tokens', 'a:2:{s:64:"ce793b75cdf864a71f6cfee036b014a099583f03ddf86deffe36989e9dbe0cc7";a:4:{s:10:"expiration";i:1431512405;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:108:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36";s:5:"login";i:1431339605;}s:64:"15a288bb157f453f6fafeb81bd738eedf1a58797b5464ec6135720e0598aa7a0";a:4:{s:10:"expiration";i:1431546840;s:2:"ip";s:9:"127.0.0.1";s:2:"ua";s:109:"Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36";s:5:"login";i:1431374040;}}');

-- --------------------------------------------------------

--
-- Structure de la table `wp_users`
--

CREATE TABLE IF NOT EXISTS `wp_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  `subscriber` char(3) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `wp_users`
--

INSERT INTO `wp_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`, `subscriber`) VALUES
(1, 'admin', '$P$BWyqGyNXnoUnohCGiwDEe8d7xcPN0e.', 'admin', 'llm@gmail.com', '', '2015-03-09 21:28:31', '', 0, 'admin', 'Y'),
(2, 'lmerabli', '$P$BWyqGyNXnoUnohCGiwDEe8d7xcPN0e.', 'lmerabli', 'Ll@gmail.com', '', '2015-05-10 08:05:34', '', 0, 'lio Mm', 'Y'),
(3, 'contri', '$P$BZjuBKLBzHKUrpdf4aK1DyR.a.SRu41', 'contri', 'contri@gmail.com', '', '2015-05-11 10:16:11', '', 0, 'contri', 'Y');

-- --------------------------------------------------------

--
-- Structure de la table `wp_wppenewsletter`
--

CREATE TABLE IF NOT EXISTS `wp_wppenewsletter` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `nfrom` char(250) COLLATE utf8_bin NOT NULL,
  `nsubject` text COLLATE utf8_bin NOT NULL,
  `ntemplate` text COLLATE utf8_bin NOT NULL,
  `nmember` char(250) COLLATE utf8_bin NOT NULL,
  `nsub` char(250) COLLATE utf8_bin NOT NULL,
  `nsent` char(3) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `nopen` char(3) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `nbounce` char(3) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ndate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `wp_wpperecords`
--

CREATE TABLE IF NOT EXISTS `wp_wpperecords` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `rsubject` text COLLATE utf8_bin NOT NULL,
  `remail` char(250) COLLATE utf8_bin NOT NULL,
  `rsent` char(3) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ropen` char(3) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `rbounce` char(3) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `rdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
