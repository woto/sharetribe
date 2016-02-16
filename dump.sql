-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sharetribe_development
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_tokens`
--

DROP TABLE IF EXISTS `auth_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'unsubscribe',
  `person_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `usages_left` int(11) DEFAULT NULL,
  `last_use_attempt` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_auth_tokens_on_token` (`token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_tokens`
--

LOCK TABLES `auth_tokens` WRITE;
/*!40000 ALTER TABLE `auth_tokens` DISABLE KEYS */;
INSERT INTO `auth_tokens` VALUES (1,'A0PFmTPsOpo','login','dGzDsaVWqr5yafYcOudhQ0','2016-01-19 23:42:17',0,'2016-01-19 23:32:18','2016-01-19 23:32:17','2016-01-19 23:32:18'),(2,'4LKQffR-p1U','unsubscribe','ad0vC-VWGr5yaaYcOudhQ0','2016-02-02 00:39:03',1,NULL,'2016-01-26 00:39:03','2016-01-26 00:39:03'),(3,'HQIOf4tP8R4','unsubscribe','ad0vC-VWGr5yaaYcOudhQ0','2016-02-02 00:39:05',1,NULL,'2016-01-26 00:39:05','2016-01-26 00:39:05');
/*!40000 ALTER TABLE `auth_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing_agreements`
--

DROP TABLE IF EXISTS `billing_agreements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `billing_agreements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_account_id` int(11) NOT NULL,
  `billing_agreement_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `paypal_username_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `request_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_agreements`
--

LOCK TABLES `billing_agreements` WRITE;
/*!40000 ALTER TABLE `billing_agreements` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing_agreements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) DEFAULT NULL,
  `start_on` date DEFAULT NULL,
  `end_on` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_bookings_on_transaction_id` (`transaction_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,1,'2016-01-20','2016-01-26','2016-01-20 18:37:27','2016-01-20 18:37:27');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `braintree_accounts`
--

DROP TABLE IF EXISTS `braintree_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `braintree_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `person_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_street_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_locality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_region` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `routing_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hidden_account_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `braintree_accounts`
--

LOCK TABLES `braintree_accounts` WRITE;
/*!40000 ALTER TABLE `braintree_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `braintree_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `community_id` int(11) DEFAULT NULL,
  `sort_priority` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_categories_on_community_id` (`community_id`) USING BTREE,
  KEY `index_categories_on_parent_id` (`parent_id`) USING BTREE,
  KEY `index_categories_on_url` (`url`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,NULL,NULL,'2016-01-19 23:32:15','2016-01-25 01:11:16',1,NULL,'teach'),(22,NULL,NULL,'2016-01-24 23:41:40','2016-01-25 01:11:10',1,1,'learn'),(23,NULL,NULL,'2016-01-26 05:04:48','2016-01-26 05:04:48',2,1,'sdacha-kvartiry-v-ariendu');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_custom_fields`
--

DROP TABLE IF EXISTS `category_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `custom_field_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_custom_fields`
--

LOCK TABLES `category_custom_fields` WRITE;
/*!40000 ALTER TABLE `category_custom_fields` DISABLE KEYS */;
INSERT INTO `category_custom_fields` VALUES (111,1,12,'2016-01-26 02:51:27','2016-01-26 02:51:27'),(112,1,13,'2016-01-26 02:51:30','2016-01-26 02:51:30'),(113,22,13,'2016-01-26 02:51:30','2016-01-26 02:51:30'),(114,1,15,'2016-01-26 02:51:32','2016-01-26 02:51:32'),(115,22,15,'2016-01-26 02:51:32','2016-01-26 02:51:32'),(119,1,18,'2016-01-26 04:13:26','2016-01-26 04:13:26'),(138,23,19,'2016-01-26 05:43:27','2016-01-26 05:43:27'),(139,23,20,'2016-01-26 05:43:28','2016-01-26 05:43:28'),(140,23,21,'2016-01-26 05:43:35','2016-01-26 05:43:35'),(141,23,22,'2016-01-26 05:43:40','2016-01-26 05:43:40'),(142,23,23,'2016-01-26 05:43:43','2016-01-26 05:43:43'),(143,23,24,'2016-01-26 05:43:51','2016-01-26 05:43:51'),(144,23,25,'2016-01-26 05:43:53','2016-01-26 05:43:53'),(145,23,26,'2016-01-26 05:43:55','2016-01-26 05:43:55'),(146,23,27,'2016-01-26 05:44:09','2016-01-26 05:44:09'),(147,23,28,'2016-01-26 05:44:11','2016-01-26 05:44:11'),(148,23,29,'2016-01-26 05:44:13','2016-01-26 05:44:13');
/*!40000 ALTER TABLE `category_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_listing_shapes`
--

DROP TABLE IF EXISTS `category_listing_shapes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_listing_shapes` (
  `category_id` int(11) NOT NULL,
  `listing_shape_id` int(11) NOT NULL,
  UNIQUE KEY `unique_listing_shape_category_joins` (`listing_shape_id`,`category_id`) USING BTREE,
  KEY `index_category_listing_shapes_on_category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_listing_shapes`
--

LOCK TABLES `category_listing_shapes` WRITE;
/*!40000 ALTER TABLE `category_listing_shapes` DISABLE KEYS */;
INSERT INTO `category_listing_shapes` VALUES (1,6),(22,11),(23,14);
/*!40000 ALTER TABLE `category_listing_shapes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_translations`
--

DROP TABLE IF EXISTS `category_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id_with_locale` (`category_id`,`locale`) USING BTREE,
  KEY `index_category_translations_on_category_id` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_translations`
--

LOCK TABLES `category_translations` WRITE;
/*!40000 ALTER TABLE `category_translations` DISABLE KEYS */;
INSERT INTO `category_translations` VALUES (1,1,'en','Teach','2016-01-19 23:32:15','2016-01-25 01:11:16',NULL),(24,22,'en','Learn','2016-01-24 23:41:40','2016-01-25 01:11:10',NULL),(25,23,'en','Сдача квартиры в аренду','2016-01-26 05:04:48','2016-01-26 05:04:48',NULL);
/*!40000 ALTER TABLE `category_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_accounts`
--

DROP TABLE IF EXISTS `checkout_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id_or_personal_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `merchant_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `merchant_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `person_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_accounts`
--

LOCK TABLES `checkout_accounts` WRITE;
/*!40000 ALTER TABLE `checkout_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `checkout_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `listing_id` int(11) DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_listing_id` (`listing_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ident` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_domain` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `consent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_agreement_in_use` tinyint(1) DEFAULT '0',
  `email_admins_about_new_members` tinyint(1) DEFAULT '0',
  `use_fb_like` tinyint(1) DEFAULT '0',
  `real_name_required` tinyint(1) DEFAULT '1',
  `feedback_to_admin` tinyint(1) DEFAULT '1',
  `automatic_newsletters` tinyint(1) DEFAULT '1',
  `join_with_invite_only` tinyint(1) DEFAULT '0',
  `allowed_emails` text COLLATE utf8_unicode_ci,
  `users_can_invite_new_users` tinyint(1) DEFAULT '1',
  `private` tinyint(1) DEFAULT '0',
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_date_in_listings_list` tinyint(1) DEFAULT '0',
  `all_users_can_add_news` tinyint(1) DEFAULT '1',
  `custom_frontpage_sidebar` tinyint(1) DEFAULT '0',
  `event_feed_enabled` tinyint(1) DEFAULT '1',
  `slogan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'other',
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `members_count` int(11) DEFAULT '0',
  `user_limit` int(11) DEFAULT NULL,
  `monthly_price_in_euros` float DEFAULT NULL,
  `logo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo_file_size` int(11) DEFAULT NULL,
  `logo_updated_at` datetime DEFAULT NULL,
  `cover_photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cover_photo_file_size` int(11) DEFAULT NULL,
  `cover_photo_updated_at` datetime DEFAULT NULL,
  `small_cover_photo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `small_cover_photo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `small_cover_photo_file_size` int(11) DEFAULT NULL,
  `small_cover_photo_updated_at` datetime DEFAULT NULL,
  `custom_color1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_color2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stylesheet_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stylesheet_needs_recompile` tinyint(1) DEFAULT '0',
  `service_logo_style` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'full-logo',
  `available_currencies` text COLLATE utf8_unicode_ci,
  `facebook_connect_enabled` tinyint(1) DEFAULT '1',
  `vat` int(11) DEFAULT NULL,
  `commission_from_seller` int(11) DEFAULT NULL,
  `minimum_price_cents` int(11) DEFAULT NULL,
  `testimonials_in_use` tinyint(1) DEFAULT '1',
  `hide_expiration_date` tinyint(1) DEFAULT '0',
  `facebook_connect_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_connect_secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_analytics_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name_display_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'first_name_with_initial',
  `twitter_handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `use_community_location_as_default` tinyint(1) DEFAULT '0',
  `preproduction_stylesheet_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_category_in_listing_list` tinyint(1) DEFAULT '0',
  `default_browse_view` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'grid',
  `wide_logo_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wide_logo_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wide_logo_file_size` int(11) DEFAULT NULL,
  `wide_logo_updated_at` datetime DEFAULT NULL,
  `only_organizations` tinyint(1) DEFAULT NULL,
  `listing_comments_in_use` tinyint(1) DEFAULT '0',
  `show_listing_publishing_date` tinyint(1) DEFAULT '0',
  `require_verification_to_post_listings` tinyint(1) DEFAULT '0',
  `show_price_filter` tinyint(1) DEFAULT '0',
  `price_filter_min` int(11) DEFAULT '0',
  `price_filter_max` int(11) DEFAULT '100000',
  `automatic_confirmation_after_days` int(11) DEFAULT '14',
  `favicon_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `favicon_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `favicon_file_size` int(11) DEFAULT NULL,
  `favicon_updated_at` datetime DEFAULT NULL,
  `default_min_days_between_community_updates` int(11) DEFAULT '7',
  `listing_location_required` tinyint(1) DEFAULT '0',
  `custom_head_script` text COLLATE utf8_unicode_ci,
  `follow_in_use` tinyint(1) NOT NULL DEFAULT '1',
  `logo_processing` tinyint(1) DEFAULT NULL,
  `wide_logo_processing` tinyint(1) DEFAULT NULL,
  `cover_photo_processing` tinyint(1) DEFAULT NULL,
  `small_cover_photo_processing` tinyint(1) DEFAULT NULL,
  `favicon_processing` tinyint(1) DEFAULT NULL,
  `dv_test_file_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dv_test_file` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_communities_on_domain` (`domain`) USING BTREE,
  KEY `index_communities_on_ident` (`ident`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'share','lvh.me',0,'2016-01-19 23:32:14','2016-01-26 04:57:01','---\nlocales:\n- en\n','SHARETRIBE1.0',0,0,0,1,1,1,0,NULL,1,0,NULL,0,1,0,1,NULL,NULL,'other','RU',10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'full-logo','RUB',1,NULL,NULL,NULL,1,1,NULL,NULL,NULL,'first_name_with_initial',NULL,0,NULL,1,'grid',NULL,NULL,NULL,NULL,NULL,1,1,0,1,50000,200000,14,NULL,NULL,NULL,NULL,7,0,NULL,1,0,0,0,0,0,NULL,NULL,NULL),(2,'share2',NULL,0,'2016-01-26 04:55:36','2016-01-26 05:10:01','---\nlocales:\n- en\n','SHARETRIBE1.0',0,0,0,1,1,1,0,NULL,1,0,NULL,0,1,0,1,NULL,NULL,'other','RU',11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'full-logo','RUB',1,NULL,NULL,NULL,1,1,NULL,NULL,NULL,'first_name_with_initial',NULL,0,NULL,1,'grid',NULL,NULL,NULL,NULL,NULL,1,1,0,1,50000,200000,14,NULL,NULL,NULL,NULL,7,0,NULL,1,0,0,0,0,0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_customizations`
--

DROP TABLE IF EXISTS `community_customizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_customizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slogan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `blank_slate` text COLLATE utf8_unicode_ci,
  `welcome_email_content` text COLLATE utf8_unicode_ci,
  `how_to_use_page_content` mediumtext COLLATE utf8_unicode_ci,
  `about_page_content` mediumtext COLLATE utf8_unicode_ci,
  `terms_page_content` mediumtext COLLATE utf8_unicode_ci,
  `privacy_page_content` mediumtext COLLATE utf8_unicode_ci,
  `storefront_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `signup_info_content` text COLLATE utf8_unicode_ci,
  `private_community_homepage_content` mediumtext COLLATE utf8_unicode_ci,
  `verification_to_post_listings_info_content` mediumtext COLLATE utf8_unicode_ci,
  `search_placeholder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_agreement_label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_agreement_content` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `index_community_customizations_on_community_id` (`community_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_customizations`
--

LOCK TABLES `community_customizations` WRITE;
/*!40000 ALTER TABLE `community_customizations` DISABLE KEYS */;
INSERT INTO `community_customizations` VALUES (1,2,'en','Название - eng','Слоган - eng','Описание - eng','2016-01-19 23:32:14','2016-01-26 04:59:28',NULL,NULL,'<h1>How it works</h1><div>Here you can find information about how share works.</div>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Помощь по поиску - eng',NULL,NULL),(2,1,'ru','Название - rus','Слоган - rus','Описание - rus','2016-01-20 11:04:50','2016-01-20 12:47:44',NULL,NULL,'<h1>Как это работает</h1><div>Здесь вы можете информацию о share.</div>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Помощь по поиску - rus',NULL,NULL),(3,2,'ru','Название - eng','','','2016-01-26 05:09:39','2016-01-26 05:10:01',NULL,NULL,'<h1>Как это работает</h1><div>Здесь вы можете информацию о Название - eng.</div>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL);
/*!40000 ALTER TABLE `community_customizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_memberships`
--

DROP TABLE IF EXISTS `community_memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_memberships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `consent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invitation_id` int(11) DEFAULT NULL,
  `last_page_load_date` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'accepted',
  `can_post_listings` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_community_memberships_on_community_id` (`community_id`) USING BTREE,
  KEY `memberships` (`person_id`,`community_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_memberships`
--

LOCK TABLES `community_memberships` WRITE;
/*!40000 ALTER TABLE `community_memberships` DISABLE KEYS */;
INSERT INTO `community_memberships` VALUES (1,'dGzDsaVWqr5yafYcOudhQ0',1,1,'2016-01-19 23:32:17','2016-01-26 00:39:04','SHARETRIBE1.0',NULL,'2016-01-26 00:39:04','accepted',0),(2,'ad0vC-VWGr5yaaYcOudhQ0',1,0,'2016-01-19 23:54:45','2016-01-26 00:38:57','SHARETRIBE1.0',NULL,'2016-01-26 00:38:57','accepted',0),(3,'dWXZjCWJWr5yaaYcOudhQ0',1,0,'2016-01-24 01:51:10','2016-01-24 01:51:13','SHARETRIBE1.0',NULL,'2016-01-24 01:51:10','accepted',0),(4,'aT_MigWUqr5yaaYcOudhQ0',1,0,'2016-01-24 21:48:18','2016-01-26 00:41:41','SHARETRIBE1.0',NULL,'2016-01-26 00:41:41','accepted',0),(5,'b-HEA0WUGr5yaaYcOudhQ0',1,0,'2016-01-24 22:19:11','2016-01-26 00:41:41','SHARETRIBE1.0',NULL,'2016-01-26 00:41:41','accepted',0),(7,'bY9fpaWUKr5yaaYcOudhQ0',1,0,'2016-01-24 22:26:01','2016-01-26 00:41:43','SHARETRIBE1.0',NULL,'2016-01-26 00:41:43','accepted',0),(8,'b8SMhgWUOr5yaaYcOudhQ0',1,0,'2016-01-24 22:33:27','2016-01-26 00:41:44','SHARETRIBE1.0',NULL,'2016-01-26 00:41:44','accepted',0),(9,'c9EH-CWXer5yafYcOudhQ0',1,0,'2016-01-25 03:14:27','2016-01-25 03:14:27','SHARETRIBE1.0',NULL,'2016-01-25 03:14:27','accepted',0),(10,'beaou-W8qr5yaaYcOudhQ0',1,0,'2016-01-26 00:32:23','2016-01-26 00:32:23','SHARETRIBE1.0',NULL,'2016-01-26 00:32:23','accepted',0),(11,'aMGnBEW8yr5yaaYcOudhQ0',1,0,'2016-01-26 00:45:52','2016-01-26 00:45:53','SHARETRIBE1.0',NULL,'2016-01-26 00:45:52','accepted',0),(12,'dGzDsaVWqr5yafYcOudhQ0',2,1,'2016-01-26 05:00:00','2016-01-26 05:00:00','SHARETRIBE1.0',NULL,'2016-01-26 05:00:00','accepted',0);
/*!40000 ALTER TABLE `community_memberships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_translations`
--

DROP TABLE IF EXISTS `community_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) NOT NULL,
  `locale` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `translation_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `translation` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_community_translations_on_community_id` (`community_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_translations`
--

LOCK TABLES `community_translations` WRITE;
/*!40000 ALTER TABLE `community_translations` DISABLE KEYS */;
INSERT INTO `community_translations` VALUES (1,1,'en','903e0b7e-3361-4e70-a897-af84a4d8410e','Offering','2016-01-19 23:32:15','2016-01-19 23:32:15'),(2,1,'en','e2d756ac-2f0b-49e6-9184-6508324629db','Request','2016-01-19 23:32:15','2016-01-19 23:32:15'),(3,1,'en','44898f60-b573-42cd-a22f-16ea6b7640fc','Requesting','2016-01-20 00:38:08','2016-01-20 00:38:08'),(4,1,'en','25500c00-1b23-4a5a-845a-575185e3c0ff','Offer','2016-01-20 00:38:08','2016-01-20 00:38:08'),(5,1,'en','9786e928-7898-4287-865e-a797271caae1','fff','2016-01-20 00:38:08','2016-01-20 00:38:08'),(6,1,'en','93a79553-3417-4d31-a0ec-61a05ff9bc90','fff','2016-01-20 00:38:08','2016-01-20 00:38:08'),(7,1,'en','09f685fd-5406-455b-866f-74e020336b33','Offering','2016-01-20 11:06:40','2016-01-20 11:06:40'),(8,1,'ru','09f685fd-5406-455b-866f-74e020336b33','Предлагающие','2016-01-20 11:06:40','2016-01-20 11:06:40'),(9,1,'en','7032965b-10a2-4d1a-acb3-dc58a8a73c41','Request','2016-01-20 11:06:40','2016-01-20 11:06:40'),(10,1,'ru','7032965b-10a2-4d1a-acb3-dc58a8a73c41','Запрос','2016-01-20 11:06:40','2016-01-20 11:06:40'),(11,1,'en','d06e8587-1ea5-46f1-b726-36084013fe5c','Giving away','2016-01-20 11:44:53','2016-01-20 11:44:53'),(12,1,'ru','d06e8587-1ea5-46f1-b726-36084013fe5c','Отдам бесплатно','2016-01-20 11:44:53','2016-01-20 11:44:53'),(13,1,'en','5fb614bc-2edc-4857-9028-15b78836192c','Request','2016-01-20 11:44:53','2016-01-20 11:44:53'),(14,1,'ru','5fb614bc-2edc-4857-9028-15b78836192c','Запрос','2016-01-20 11:44:53','2016-01-20 11:44:53'),(15,1,'en','6d966224-3bea-4ad2-b484-0d4c69a9b1a5','Requesting','2016-01-20 13:32:25','2016-01-20 13:32:25'),(16,1,'en','8eae6ab4-2989-4c89-9931-3464f6088d0f','Offer','2016-01-20 13:32:25','2016-01-20 13:32:25'),(17,1,'en','3a8a9bf4-7c8f-4f78-8538-be0ed12784b5','Пёр','2016-01-20 13:32:25','2016-01-20 13:32:25'),(18,1,'en','3e5ed00e-f6f9-4575-bd66-770e814aa53c','Селектор лэйбл','2016-01-20 13:32:25','2016-01-20 13:32:25'),(19,1,'en','5e8d1cb5-d86e-4616-b25b-e5dcd6b53bf6','Пёр','2016-01-20 13:32:45','2016-01-20 13:32:45'),(20,1,'en','5b799719-38b8-41b2-b01d-77261e8de51c','Селектор лэйбл','2016-01-20 13:32:45','2016-01-20 13:32:45'),(21,1,'en','c2e1389b-7a2b-44d5-ab2f-e47dfbd29172','vvvv','2016-01-23 21:12:58','2016-01-23 21:12:58'),(22,1,'en','f30897a2-b863-4dd4-b61a-c509008c64ad','bbbb','2016-01-23 21:12:58','2016-01-23 21:12:58'),(23,1,'en','54ab3727-5fea-4570-8bb6-a5cceecbf0ba','11111','2016-01-23 21:13:10','2016-01-23 21:13:10'),(24,1,'en','daf8bd4c-06b1-4b0c-95a9-1f1f8c851e99','22222','2016-01-23 21:13:10','2016-01-23 21:13:10'),(25,1,'en','7338051e-f42e-4551-92e2-31274e28867d','11111','2016-01-23 21:13:21','2016-01-23 21:13:21'),(26,1,'en','14dffcd3-1ddb-465d-8bbe-e83e1b82d49f','2222','2016-01-23 21:13:21','2016-01-23 21:13:21'),(27,1,'en','b36a4299-b452-42cc-8ea7-3d5c6c0ca8a8','333333','2016-01-23 21:13:32','2016-01-23 21:13:32'),(28,1,'en','c22b2257-5273-45ff-8bd6-0e1d9720479a','444444','2016-01-23 21:13:32','2016-01-23 21:13:32'),(29,1,'en','c95f444a-b35e-4277-963b-0fedc397dfe5','Teach','2016-01-23 21:15:25','2016-01-25 01:11:30'),(30,1,'en','103b8746-ebd8-41dd-b7fb-a45172e38d18','Request','2016-01-23 21:15:25','2016-01-23 21:15:25'),(31,1,'en','be63666b-0b95-4ba1-a45a-1ec63dda31b7','30 минут','2016-01-24 02:31:25','2016-01-24 02:31:25'),(32,1,'en','6364b7a9-d466-4f00-809e-1447b753d15d','За 30 минут','2016-01-24 02:31:25','2016-01-24 02:31:25'),(33,1,'en','5a23b00c-3fc4-48a1-af22-420535f2bad0','60 минут','2016-01-24 02:32:32','2016-01-24 02:32:32'),(34,1,'en','dd68f981-3885-4c1e-a6e3-de0c48ed0426','За 60 минут','2016-01-24 02:32:32','2016-01-24 02:32:32'),(35,1,'en','e32aaebc-7447-4f8a-99dc-d476138df8b6','90 мин.','2016-01-24 02:33:31','2016-01-24 02:33:31'),(36,1,'en','ed487a90-69c3-4c38-8311-93257541104a','за 90 мин.','2016-01-24 02:33:31','2016-01-24 02:33:31'),(37,1,'en','15be33de-ad24-4b33-9855-b071567be77f','30 min','2016-01-24 02:36:09','2016-01-24 02:36:09'),(38,1,'en','05f13cb9-4816-4f63-91d5-dbaeea71a5ff','per 30 min','2016-01-24 02:36:10','2016-01-24 02:36:10'),(39,1,'en','e29af837-d392-4caf-8016-872b77729ddf','30 min','2016-01-24 02:36:40','2016-01-24 02:36:40'),(40,1,'en','24a2b940-60a7-4580-bb6c-7d27300ca4a9','per 30 min','2016-01-24 02:36:40','2016-01-24 02:36:40'),(41,1,'en','2bcea1cb-7393-451e-98a9-3a1892323e8c','31 min','2016-01-24 02:36:57','2016-01-24 02:36:57'),(42,1,'en','4b15da02-851d-41e4-aa1b-27baa1d21b2d','per 31 min','2016-01-24 02:36:57','2016-01-24 02:36:57'),(43,1,'en','32dcc235-251f-47cc-9206-4de1aad0456a','32 min','2016-01-24 02:37:13','2016-01-24 02:37:13'),(44,1,'en','0809b2f9-a182-488d-8f3c-40cc80536c6a','per 32 min','2016-01-24 02:37:13','2016-01-24 02:37:13'),(45,1,'en','2f12067e-002f-4974-8788-d09c10f8835f','33 min','2016-01-24 02:37:30','2016-01-24 02:37:30'),(46,1,'en','428e13de-20d8-4ea7-a8f0-d3f3f6ff179c','per 33 min','2016-01-24 02:37:30','2016-01-24 02:37:30'),(47,1,'en','e3c267f0-5e7d-48ce-8148-7916d3b46052','У ученика','2016-01-24 04:03:19','2016-01-24 04:03:19'),(48,1,'en','e9b50a11-5d5d-4c99-bb44-4cfab2206a9f','Request','2016-01-24 04:03:20','2016-01-24 04:03:20'),(49,1,'en','70144e1a-ae7e-4edc-a0e7-051216da49cd','Онлайн (Skype)','2016-01-24 04:03:50','2016-01-24 04:03:50'),(50,1,'en','fe2e4276-dece-4111-9b53-eea8d029227e','Request','2016-01-24 04:03:50','2016-01-24 04:03:50'),(51,1,'en','4247cba2-de4c-42d1-9ac4-abb919f87a85','30 мин.','2016-01-24 04:08:35','2016-01-24 04:08:35'),(52,1,'en','ae680da7-43df-4d30-8c38-f9dd842dbb9b','за 30 мин.','2016-01-24 04:08:35','2016-01-24 04:08:35'),(53,1,'en','6c975788-a9ce-4ec7-9906-679a6e75d7a8','60 мин.','2016-01-24 04:09:05','2016-01-24 04:09:05'),(54,1,'en','cc1b8c3d-582f-4e75-91ca-4cd3cc83e77a','за 60 мин.','2016-01-24 04:09:05','2016-01-24 04:09:05'),(55,1,'en','9bbc53ae-043e-41e5-bbf3-e2e2f3384650','90 мин.','2016-01-24 04:09:30','2016-01-24 04:09:30'),(56,1,'en','f8ca2266-2442-4edf-a200-10950ee2b073','за 90 мин.','2016-01-24 04:09:30','2016-01-24 04:09:30'),(57,1,'en','b1837244-0f63-4125-8b84-745e321bb66b','120 мин.','2016-01-24 04:09:56','2016-01-24 04:09:56'),(58,1,'en','7d35709e-de4a-4864-858a-8c93c660b667','за 120 мин.','2016-01-24 04:09:56','2016-01-24 04:09:56'),(59,1,'en','447f5dd5-eb55-40d1-8bf6-219744eb7185','У ученика','2016-01-24 05:14:02','2016-01-24 05:14:02'),(60,1,'en','121443c1-dc4b-4ccf-8e7b-77c4343dc38b','Request','2016-01-24 05:14:02','2016-01-24 05:14:02'),(61,1,'en','90981230-4c2f-4ae7-9b2c-aca60994e3cc','Онлайн (Skype)','2016-01-24 05:14:17','2016-01-24 05:14:17'),(62,1,'en','791e2673-1b12-4d9e-938e-e188b7ae39a2','Request','2016-01-24 05:14:18','2016-01-24 05:14:18'),(63,1,'en','4c43f1c8-550b-4f61-b729-5bb7186d496d','Learn','2016-01-24 22:38:58','2016-01-25 01:11:36'),(64,1,'en','115f6c61-6593-4314-96a2-2a5bbff27c45','Offer','2016-01-24 22:38:58','2016-01-24 22:38:58'),(65,1,'en','5a40757a-14d6-47f6-9fee-04b9ba1ab9ec','2 hours','2016-01-24 22:54:06','2016-01-24 22:54:06'),(66,1,'en','949c2e5b-dabd-449e-99f4-85c940e22889','per 2 hours','2016-01-24 22:54:06','2016-01-24 22:54:06'),(67,2,'en','bc558cdf-cb0f-4219-8af4-9f2ad242a1c3','Renting out','2016-01-26 05:04:00','2016-01-26 05:04:00'),(68,2,'en','97621d84-0969-411e-8233-922a1a84a8f3','Rent','2016-01-26 05:04:00','2016-01-26 05:04:00'),(69,2,'en','ab32b33b-d2e6-43a2-b2f7-6944705404dd','Renting out','2016-01-26 05:19:47','2016-01-26 05:19:47'),(70,2,'en','3e46a261-ac5b-4103-94ec-77381890fa1b','Rent','2016-01-26 05:19:47','2016-01-26 05:19:47'),(71,2,'en','6d73a848-0251-47ec-ad9d-3ad5f5db7558','Renting out','2016-01-26 05:22:11','2016-01-26 05:22:11'),(72,2,'en','e312baf3-5d59-42da-aafd-9628981d0ed5','Rent','2016-01-26 05:22:11','2016-01-26 05:22:11');
/*!40000 ALTER TABLE `community_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_requests`
--

DROP TABLE IF EXISTS `contact_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plan_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `marketplace_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_requests`
--

LOCK TABLES `contact_requests` WRITE;
/*!40000 ALTER TABLE `contact_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conversations`
--

DROP TABLE IF EXISTS `conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `listing_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_message_at` datetime DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_conversations_on_community_id` (`community_id`) USING BTREE,
  KEY `index_conversations_on_last_message_at` (`last_message_at`) USING BTREE,
  KEY `index_conversations_on_listing_id` (`listing_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conversations`
--

LOCK TABLES `conversations` WRITE;
/*!40000 ALTER TABLE `conversations` DISABLE KEYS */;
INSERT INTO `conversations` VALUES (1,NULL,2,'2016-01-20 18:37:27','2016-01-20 22:42:51','2016-01-20 22:42:51',1);
/*!40000 ALTER TABLE `conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_names`
--

DROP TABLE IF EXISTS `custom_field_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_field_names` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `locale_index` (`custom_field_id`,`locale`) USING BTREE,
  KEY `index_custom_field_names_on_custom_field_id` (`custom_field_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_names`
--

LOCK TABLES `custom_field_names` WRITE;
/*!40000 ALTER TABLE `custom_field_names` DISABLE KEYS */;
INSERT INTO `custom_field_names` VALUES (13,'Опыт преподавания','en','12','2016-01-24 23:26:25','2016-01-26 01:45:21'),(14,'Предмет','en','13','2016-01-24 23:45:41','2016-01-26 02:16:03'),(16,'Уровень знаний','en','15','2016-01-25 01:02:25','2016-01-25 01:02:25'),(19,'Место обучения','en','18','2016-01-26 01:58:18','2016-01-26 04:13:26'),(20,'Число комнат','en','19','2016-01-26 05:05:19','2016-01-26 05:05:19'),(21,'Общая площадь','en','20','2016-01-26 05:11:22','2016-01-26 05:11:22'),(22,'Жилая площадь','en','21','2016-01-26 05:11:42','2016-01-26 05:11:42'),(23,'Площадь кухни','en','22','2016-01-26 05:11:57','2016-01-26 05:11:57'),(24,'Тип постройки','en','23','2016-01-26 05:13:12','2016-01-26 05:13:12'),(25,'Этаж','en','24','2016-01-26 05:13:36','2016-01-26 05:13:36'),(26,'Всего этажей','en','25','2016-01-26 05:13:52','2016-01-26 05:13:52'),(27,'Покрытие пола','en','26','2016-01-26 05:14:58','2016-01-26 05:14:58'),(28,'Высота потолка','en','27','2016-01-26 05:15:14','2016-01-26 05:15:14'),(29,'% Залог','en','28','2016-01-26 05:16:06','2016-01-26 05:16:06'),(30,'Удобства','en','29','2016-01-26 05:17:59','2016-01-26 05:17:59');
/*!40000 ALTER TABLE `custom_field_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_option_selections`
--

DROP TABLE IF EXISTS `custom_field_option_selections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_field_option_selections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_value_id` int(11) DEFAULT NULL,
  `custom_field_option_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_custom_field_option_selections_on_custom_field_option_id` (`custom_field_option_id`) USING BTREE,
  KEY `index_selected_options_on_custom_field_value_id` (`custom_field_value_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=460 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_option_selections`
--

LOCK TABLES `custom_field_option_selections` WRITE;
/*!40000 ALTER TABLE `custom_field_option_selections` DISABLE KEYS */;
INSERT INTO `custom_field_option_selections` VALUES (300,165,38,'2016-01-25 23:22:15','2016-01-25 23:22:15'),(301,166,48,'2016-01-25 23:22:16','2016-01-25 23:22:16'),(302,167,58,'2016-01-25 23:22:16','2016-01-25 23:22:16'),(304,169,35,'2016-01-25 23:22:27','2016-01-25 23:22:27'),(305,170,46,'2016-01-25 23:22:27','2016-01-25 23:22:27'),(306,170,48,'2016-01-25 23:22:27','2016-01-25 23:22:27'),(307,170,49,'2016-01-25 23:22:27','2016-01-25 23:22:27'),(308,170,52,'2016-01-25 23:22:27','2016-01-25 23:22:27'),(309,171,59,'2016-01-25 23:22:27','2016-01-25 23:22:27'),(314,176,45,'2016-01-25 23:23:24','2016-01-25 23:23:24'),(315,176,46,'2016-01-25 23:23:24','2016-01-25 23:23:24'),(316,177,58,'2016-01-25 23:23:24','2016-01-25 23:23:24'),(318,179,46,'2016-01-25 23:23:36','2016-01-25 23:23:36'),(319,179,48,'2016-01-25 23:23:36','2016-01-25 23:23:36'),(320,180,57,'2016-01-25 23:23:36','2016-01-25 23:23:36'),(367,208,35,'2016-01-26 03:37:19','2016-01-26 03:37:19'),(368,209,45,'2016-01-26 03:37:19','2016-01-26 03:37:19'),(369,209,46,'2016-01-26 03:37:19','2016-01-26 03:37:19'),(370,210,57,'2016-01-26 03:37:19','2016-01-26 03:37:19'),(372,212,80,'2016-01-26 03:37:19','2016-01-26 03:37:19'),(390,218,39,'2016-01-26 04:10:01','2016-01-26 04:10:01'),(391,219,67,'2016-01-26 04:10:01','2016-01-26 04:10:01'),(392,219,68,'2016-01-26 04:10:01','2016-01-26 04:10:01'),(393,219,70,'2016-01-26 04:10:01','2016-01-26 04:10:01'),(394,220,60,'2016-01-26 04:10:01','2016-01-26 04:10:01'),(396,222,80,'2016-01-26 04:10:01','2016-01-26 04:10:01'),(397,222,81,'2016-01-26 04:10:01','2016-01-26 04:10:01'),(398,222,82,'2016-01-26 04:10:01','2016-01-26 04:10:01'),(405,227,57,'2016-01-26 04:21:28','2016-01-26 04:21:28'),(406,228,45,'2016-01-26 04:21:28','2016-01-26 04:21:28'),(407,228,68,'2016-01-26 04:21:28','2016-01-26 04:21:28'),(408,229,45,'2016-01-26 04:24:26','2016-01-26 04:24:26'),(409,229,46,'2016-01-26 04:24:26','2016-01-26 04:24:26'),(410,229,49,'2016-01-26 04:24:26','2016-01-26 04:24:26'),(411,229,67,'2016-01-26 04:24:26','2016-01-26 04:24:26'),(412,229,68,'2016-01-26 04:24:26','2016-01-26 04:24:26'),(413,229,69,'2016-01-26 04:24:26','2016-01-26 04:24:26'),(414,229,70,'2016-01-26 04:24:26','2016-01-26 04:24:26'),(415,229,71,'2016-01-26 04:24:26','2016-01-26 04:24:26'),(416,229,72,'2016-01-26 04:24:26','2016-01-26 04:24:26'),(417,229,73,'2016-01-26 04:24:26','2016-01-26 04:24:26'),(418,229,74,'2016-01-26 04:24:26','2016-01-26 04:24:26'),(419,230,40,'2016-01-26 04:24:26','2016-01-26 04:24:26'),(420,231,61,'2016-01-26 04:24:26','2016-01-26 04:24:26'),(421,232,80,'2016-01-26 04:24:26','2016-01-26 04:24:26'),(422,232,81,'2016-01-26 04:24:26','2016-01-26 04:24:26'),(423,232,82,'2016-01-26 04:24:26','2016-01-26 04:24:26'),(424,235,91,'2016-01-26 05:47:20','2016-01-26 05:47:20'),(425,236,96,'2016-01-26 05:47:20','2016-01-26 05:47:20'),(426,236,97,'2016-01-26 05:47:20','2016-01-26 05:47:20'),(427,236,98,'2016-01-26 05:47:20','2016-01-26 05:47:20'),(428,236,100,'2016-01-26 05:47:20','2016-01-26 05:47:20'),(429,236,101,'2016-01-26 05:47:20','2016-01-26 05:47:20'),(430,236,102,'2016-01-26 05:47:20','2016-01-26 05:47:20'),(431,236,103,'2016-01-26 05:47:20','2016-01-26 05:47:20'),(432,236,105,'2016-01-26 05:47:20','2016-01-26 05:47:20'),(433,236,106,'2016-01-26 05:47:20','2016-01-26 05:47:20'),(434,237,46,'2016-01-26 18:49:33','2016-01-26 18:49:33'),(435,237,47,'2016-01-26 18:49:34','2016-01-26 18:49:34'),(436,238,36,'2016-01-26 18:49:34','2016-01-26 18:49:34'),(437,239,57,'2016-01-26 18:49:34','2016-01-26 18:49:34'),(438,240,80,'2016-01-26 18:49:34','2016-01-26 18:49:34'),(439,240,81,'2016-01-26 18:49:34','2016-01-26 18:49:34'),(440,241,45,'2016-01-26 18:50:44','2016-01-26 18:50:44'),(441,241,46,'2016-01-26 18:50:44','2016-01-26 18:50:44'),(442,241,48,'2016-01-26 18:50:44','2016-01-26 18:50:44'),(443,242,36,'2016-01-26 18:50:44','2016-01-26 18:50:44'),(444,243,58,'2016-01-26 18:50:44','2016-01-26 18:50:44'),(445,244,80,'2016-01-26 18:50:44','2016-01-26 18:50:44'),(446,244,81,'2016-01-26 18:50:44','2016-01-26 18:50:44'),(447,245,51,'2016-01-26 18:51:00','2016-01-26 18:51:00'),(448,245,52,'2016-01-26 18:51:00','2016-01-26 18:51:00'),(449,245,53,'2016-01-26 18:51:01','2016-01-26 18:51:01'),(450,246,36,'2016-01-26 18:51:01','2016-01-26 18:51:01'),(451,247,57,'2016-01-26 18:51:01','2016-01-26 18:51:01'),(452,248,81,'2016-01-26 18:51:01','2016-01-26 18:51:01'),(453,248,82,'2016-01-26 18:51:01','2016-01-26 18:51:01'),(454,249,45,'2016-01-26 18:55:02','2016-01-26 18:55:02'),(455,249,46,'2016-01-26 18:55:02','2016-01-26 18:55:02'),(456,250,35,'2016-01-26 18:55:02','2016-01-26 18:55:02'),(457,251,58,'2016-01-26 18:55:02','2016-01-26 18:55:02'),(458,252,81,'2016-01-26 18:55:02','2016-01-26 18:55:02'),(459,252,82,'2016-01-26 18:55:02','2016-01-26 18:55:02');
/*!40000 ALTER TABLE `custom_field_option_selections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_option_titles`
--

DROP TABLE IF EXISTS `custom_field_option_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_field_option_titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_field_option_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `locale_index` (`custom_field_option_id`,`locale`) USING BTREE,
  KEY `index_custom_field_option_titles_on_custom_field_option_id` (`custom_field_option_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_option_titles`
--

LOCK TABLES `custom_field_option_titles` WRITE;
/*!40000 ALTER TABLE `custom_field_option_titles` DISABLE KEYS */;
INSERT INTO `custom_field_option_titles` VALUES (37,'Небольшой опыт','en',35,'2016-01-24 23:26:25','2016-01-24 23:26:25'),(38,'Средний опыт','en',36,'2016-01-24 23:26:25','2016-01-24 23:26:25'),(39,'Школьный учитель','en',37,'2016-01-24 23:26:25','2016-01-24 23:26:25'),(40,'Преподаватель курсов','en',38,'2016-01-24 23:26:25','2016-01-24 23:26:25'),(41,'Серьёзный опыт','en',39,'2016-01-24 23:26:25','2016-01-24 23:26:25'),(42,'Преподаватель вуза','en',40,'2016-01-24 23:26:25','2016-01-24 23:26:25'),(43,'Репетитор-эксперт','en',41,'2016-01-24 23:26:25','2016-01-24 23:26:25'),(44,'Профессор','en',42,'2016-01-24 23:26:25','2016-01-24 23:26:25'),(47,'Математика','en',45,'2016-01-24 23:45:41','2016-01-24 23:45:41'),(48,'Физика','en',46,'2016-01-24 23:45:41','2016-01-24 23:45:41'),(49,'Химия','en',47,'2016-01-24 23:45:41','2016-01-24 23:45:41'),(50,'Иностранный язык','en',48,'2016-01-24 23:45:41','2016-01-24 23:45:41'),(51,'Высшая математика','en',49,'2016-01-24 23:45:42','2016-01-24 23:45:42'),(52,'Комбинаторика','en',50,'2016-01-24 23:45:42','2016-01-24 23:45:42'),(53,'Дифференциальные уравнения','en',51,'2016-01-24 23:45:42','2016-01-24 23:45:42'),(54,'Аналитическая геометрия','en',52,'2016-01-24 23:45:42','2016-01-24 23:45:42'),(55,'Начертательная геометрия','en',53,'2016-01-24 23:45:42','2016-01-24 23:45:42'),(59,'Младшие классы','en',57,'2016-01-25 01:02:25','2016-01-25 01:02:25'),(60,'Старшие классы','en',58,'2016-01-25 01:02:25','2016-01-25 01:02:25'),(61,'Студент','en',59,'2016-01-25 01:02:25','2016-01-25 01:02:25'),(62,'Выпускник/Аспирант','en',60,'2016-01-25 01:02:25','2016-01-25 01:02:25'),(63,'Кандидат наук','en',61,'2016-01-25 01:02:25','2016-01-25 01:02:25'),(64,'Носитель языка','en',62,'2016-01-25 01:02:25','2016-01-25 01:02:25'),(65,'Доктор наук','en',63,'2016-01-25 01:02:25','2016-01-25 01:02:25'),(69,'ЕГЭ','en',67,'2016-01-26 00:34:10','2016-01-26 00:34:10'),(70,'ЕГЭ по математике','en',68,'2016-01-26 00:34:10','2016-01-26 00:34:10'),(71,'ЕГЭ по математике (базовый уровень)','en',69,'2016-01-26 00:34:10','2016-01-26 00:34:10'),(72,'ЕГЭ по математике (профильный уровень)','en',70,'2016-01-26 00:34:10','2016-01-26 00:34:10'),(73,'ЕГЭ по физике','en',71,'2016-01-26 00:34:10','2016-01-26 00:34:10'),(74,'ГИА','en',72,'2016-01-26 00:34:10','2016-01-26 00:34:10'),(75,'ГИА по математике','en',73,'2016-01-26 00:34:10','2016-01-26 00:34:10'),(76,'ГИА по физике','en',74,'2016-01-26 00:34:10','2016-01-26 00:34:10'),(77,'Математика','en',75,'2016-01-26 00:34:10','2016-01-26 00:34:10'),(78,'Физика','en',76,'2016-01-26 00:34:10','2016-01-26 00:34:10'),(79,'Высшая математика','en',77,'2016-01-26 00:34:10','2016-01-26 00:34:10'),(82,'У преподавателя','en',80,'2016-01-26 01:58:18','2016-01-26 01:58:18'),(83,'У ученика','en',81,'2016-01-26 01:58:18','2016-01-26 01:58:18'),(84,'Онлайн (Skype)','en',82,'2016-01-26 01:58:18','2016-01-26 01:58:18'),(85,'ЕГЭ по химии','en',83,'2016-01-26 02:15:52','2016-01-26 02:15:52'),(86,'Кирпич','en',84,'2016-01-26 05:13:12','2016-01-26 05:13:12'),(87,'Монолит','en',85,'2016-01-26 05:13:12','2016-01-26 05:13:12'),(88,'Панель','en',86,'2016-01-26 05:13:13','2016-01-26 05:13:13'),(89,'Блок','en',87,'2016-01-26 05:13:13','2016-01-26 05:13:13'),(90,'Металл','en',88,'2016-01-26 05:13:13','2016-01-26 05:13:13'),(91,'Паркет','en',89,'2016-01-26 05:14:58','2016-01-26 05:14:58'),(92,'Линолеум','en',90,'2016-01-26 05:14:58','2016-01-26 05:14:58'),(93,'Ламинат','en',91,'2016-01-26 05:14:58','2016-01-26 05:14:58'),(94,'Доска','en',92,'2016-01-26 05:14:58','2016-01-26 05:14:58'),(95,'Ковер','en',93,'2016-01-26 05:14:58','2016-01-26 05:14:58'),(96,'Плитка','en',94,'2016-01-26 05:14:58','2016-01-26 05:14:58'),(97,'Без покрытия','en',95,'2016-01-26 05:14:58','2016-01-26 05:14:58'),(98,'Газ','en',96,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(99,'Электричество','en',97,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(100,'Мусоропровод','en',98,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(101,'Телефон','en',99,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(102,'Интернет','en',100,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(103,'Балкон','en',101,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(104,'Железная дверь','en',102,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(105,'Домофон','en',103,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(106,'Охрана / консьерж','en',104,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(107,'Мебель','en',105,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(108,'Стеклопакеты','en',106,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(109,'Раздельный санузел','en',107,'2016-01-26 05:18:00','2016-01-26 05:18:00'),(110,'Дом сдан ГК','en',108,'2016-01-26 05:18:00','2016-01-26 05:18:00'),(111,'Ипотека','en',109,'2016-01-26 05:18:00','2016-01-26 05:18:00');
/*!40000 ALTER TABLE `custom_field_option_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_options`
--

DROP TABLE IF EXISTS `custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_field_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) DEFAULT NULL,
  `sort_priority` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_custom_field_options_on_custom_field_id` (`custom_field_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_options`
--

LOCK TABLES `custom_field_options` WRITE;
/*!40000 ALTER TABLE `custom_field_options` DISABLE KEYS */;
INSERT INTO `custom_field_options` VALUES (35,12,1,'2016-01-24 23:26:25','2016-01-24 23:26:25'),(36,12,2,'2016-01-24 23:26:25','2016-01-24 23:26:25'),(37,12,3,'2016-01-24 23:26:25','2016-01-24 23:26:25'),(38,12,4,'2016-01-24 23:26:25','2016-01-24 23:26:25'),(39,12,5,'2016-01-24 23:26:25','2016-01-24 23:26:25'),(40,12,6,'2016-01-24 23:26:25','2016-01-24 23:26:25'),(41,12,7,'2016-01-24 23:26:25','2016-01-24 23:26:25'),(42,12,8,'2016-01-24 23:26:25','2016-01-24 23:26:25'),(45,13,1,'2016-01-24 23:45:41','2016-01-24 23:45:41'),(46,13,2,'2016-01-24 23:45:41','2016-01-24 23:45:41'),(47,13,3,'2016-01-24 23:45:41','2016-01-24 23:45:41'),(48,13,4,'2016-01-24 23:45:41','2016-01-24 23:45:42'),(49,13,5,'2016-01-24 23:45:42','2016-01-24 23:45:42'),(50,13,6,'2016-01-24 23:45:42','2016-01-24 23:45:42'),(51,13,7,'2016-01-24 23:45:42','2016-01-24 23:45:42'),(52,13,8,'2016-01-24 23:45:42','2016-01-24 23:45:42'),(53,13,9,'2016-01-24 23:45:42','2016-01-24 23:45:42'),(57,15,1,'2016-01-25 01:02:25','2016-01-25 01:02:25'),(58,15,2,'2016-01-25 01:02:25','2016-01-25 01:02:25'),(59,15,3,'2016-01-25 01:02:25','2016-01-25 01:02:25'),(60,15,4,'2016-01-25 01:02:25','2016-01-25 01:02:25'),(61,15,5,'2016-01-25 01:02:25','2016-01-25 01:02:25'),(62,15,6,'2016-01-25 01:02:25','2016-01-25 01:02:25'),(63,15,7,'2016-01-25 01:02:25','2016-01-25 01:02:25'),(67,13,10,'2016-01-26 00:34:10','2016-01-26 00:34:10'),(68,13,11,'2016-01-26 00:34:10','2016-01-26 00:34:10'),(69,13,12,'2016-01-26 00:34:10','2016-01-26 00:34:10'),(70,13,13,'2016-01-26 00:34:10','2016-01-26 00:34:10'),(71,13,14,'2016-01-26 00:34:10','2016-01-26 00:34:10'),(72,13,16,'2016-01-26 00:34:10','2016-01-26 02:15:51'),(73,13,17,'2016-01-26 00:34:10','2016-01-26 02:15:51'),(74,13,18,'2016-01-26 00:34:10','2016-01-26 02:15:51'),(75,13,19,'2016-01-26 00:34:10','2016-01-26 02:15:51'),(76,13,20,'2016-01-26 00:34:10','2016-01-26 02:15:51'),(77,13,21,'2016-01-26 00:34:10','2016-01-26 02:15:51'),(80,18,1,'2016-01-26 01:58:18','2016-01-26 01:58:18'),(81,18,2,'2016-01-26 01:58:18','2016-01-26 01:58:18'),(82,18,3,'2016-01-26 01:58:18','2016-01-26 01:58:18'),(83,13,15,'2016-01-26 02:15:52','2016-01-26 02:15:52'),(84,23,1,'2016-01-26 05:13:12','2016-01-26 05:13:12'),(85,23,2,'2016-01-26 05:13:12','2016-01-26 05:13:13'),(86,23,3,'2016-01-26 05:13:13','2016-01-26 05:13:13'),(87,23,4,'2016-01-26 05:13:13','2016-01-26 05:13:13'),(88,23,5,'2016-01-26 05:13:13','2016-01-26 05:13:13'),(89,26,1,'2016-01-26 05:14:58','2016-01-26 05:14:58'),(90,26,2,'2016-01-26 05:14:58','2016-01-26 05:14:58'),(91,26,3,'2016-01-26 05:14:58','2016-01-26 05:14:58'),(92,26,4,'2016-01-26 05:14:58','2016-01-26 05:14:58'),(93,26,5,'2016-01-26 05:14:58','2016-01-26 05:14:58'),(94,26,6,'2016-01-26 05:14:58','2016-01-26 05:14:58'),(95,26,7,'2016-01-26 05:14:58','2016-01-26 05:14:58'),(96,29,1,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(97,29,2,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(98,29,3,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(99,29,4,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(100,29,5,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(101,29,6,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(102,29,7,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(103,29,8,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(104,29,9,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(105,29,10,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(106,29,11,'2016-01-26 05:17:59','2016-01-26 05:17:59'),(107,29,12,'2016-01-26 05:18:00','2016-01-26 05:18:00'),(108,29,13,'2016-01-26 05:18:00','2016-01-26 05:18:00'),(109,29,14,'2016-01-26 05:18:00','2016-01-26 05:18:00');
/*!40000 ALTER TABLE `custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_field_values`
--

DROP TABLE IF EXISTS `custom_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_field_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) DEFAULT NULL,
  `listing_id` int(11) DEFAULT NULL,
  `text_value` text COLLATE utf8_unicode_ci,
  `numeric_value` float DEFAULT NULL,
  `date_value` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `delta` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_custom_field_values_on_listing_id` (`listing_id`) USING BTREE,
  KEY `index_custom_field_values_on_type` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_field_values`
--

LOCK TABLES `custom_field_values` WRITE;
/*!40000 ALTER TABLE `custom_field_values` DISABLE KEYS */;
INSERT INTO `custom_field_values` VALUES (165,12,7,NULL,NULL,NULL,'2016-01-25 23:22:15','2016-01-25 23:22:15','DropdownFieldValue',0),(166,13,7,NULL,NULL,NULL,'2016-01-25 23:22:16','2016-01-25 23:22:16','CheckboxFieldValue',0),(167,15,7,NULL,NULL,NULL,'2016-01-25 23:22:16','2016-01-25 23:22:16','DropdownFieldValue',0),(169,12,17,NULL,NULL,NULL,'2016-01-25 23:22:27','2016-01-25 23:22:27','DropdownFieldValue',0),(170,13,17,NULL,NULL,NULL,'2016-01-25 23:22:27','2016-01-25 23:22:27','CheckboxFieldValue',0),(171,15,17,NULL,NULL,NULL,'2016-01-25 23:22:27','2016-01-25 23:22:27','DropdownFieldValue',0),(176,13,13,NULL,NULL,NULL,'2016-01-25 23:23:24','2016-01-25 23:23:24','CheckboxFieldValue',0),(177,15,13,NULL,NULL,NULL,'2016-01-25 23:23:24','2016-01-25 23:23:24','DropdownFieldValue',0),(179,13,15,NULL,NULL,NULL,'2016-01-25 23:23:36','2016-01-25 23:23:36','CheckboxFieldValue',0),(180,15,15,NULL,NULL,NULL,'2016-01-25 23:23:36','2016-01-25 23:23:36','DropdownFieldValue',0),(208,12,16,NULL,NULL,NULL,'2016-01-26 03:37:19','2016-01-26 03:37:19','DropdownFieldValue',0),(209,13,16,NULL,NULL,NULL,'2016-01-26 03:37:19','2016-01-26 03:37:19','CheckboxFieldValue',0),(210,15,16,NULL,NULL,NULL,'2016-01-26 03:37:19','2016-01-26 03:37:19','DropdownFieldValue',0),(212,18,16,NULL,NULL,NULL,'2016-01-26 03:37:19','2016-01-26 03:37:19','CheckboxFieldValue',0),(218,12,19,NULL,NULL,NULL,'2016-01-26 04:10:01','2016-01-26 04:10:01','DropdownFieldValue',0),(219,13,19,NULL,NULL,NULL,'2016-01-26 04:10:01','2016-01-26 04:10:01','CheckboxFieldValue',0),(220,15,19,NULL,NULL,NULL,'2016-01-26 04:10:01','2016-01-26 04:10:01','DropdownFieldValue',0),(222,18,19,NULL,NULL,NULL,'2016-01-26 04:10:01','2016-01-26 04:10:01','CheckboxFieldValue',0),(227,15,12,NULL,NULL,NULL,'2016-01-26 04:21:28','2016-01-26 04:21:28','DropdownFieldValue',0),(228,13,12,NULL,NULL,NULL,'2016-01-26 04:21:28','2016-01-26 04:21:28','CheckboxFieldValue',0),(229,13,18,NULL,NULL,NULL,'2016-01-26 04:24:26','2016-01-26 04:24:26','CheckboxFieldValue',0),(230,12,18,NULL,NULL,NULL,'2016-01-26 04:24:26','2016-01-26 04:24:26','DropdownFieldValue',0),(231,15,18,NULL,NULL,NULL,'2016-01-26 04:24:26','2016-01-26 04:24:26','DropdownFieldValue',0),(232,18,18,NULL,NULL,NULL,'2016-01-26 04:24:26','2016-01-26 04:24:26','CheckboxFieldValue',0),(233,24,20,NULL,7,NULL,'2016-01-26 05:47:19','2016-01-26 05:47:19','NumericFieldValue',0),(234,25,20,NULL,9,NULL,'2016-01-26 05:47:20','2016-01-26 05:47:20','NumericFieldValue',0),(235,26,20,NULL,NULL,NULL,'2016-01-26 05:47:20','2016-01-26 05:47:20','DropdownFieldValue',0),(236,29,20,NULL,NULL,NULL,'2016-01-26 05:47:20','2016-01-26 05:47:20','CheckboxFieldValue',0),(237,13,5,NULL,NULL,NULL,'2016-01-26 18:49:33','2016-01-26 18:49:33','CheckboxFieldValue',0),(238,12,5,NULL,NULL,NULL,'2016-01-26 18:49:34','2016-01-26 18:49:34','DropdownFieldValue',0),(239,15,5,NULL,NULL,NULL,'2016-01-26 18:49:34','2016-01-26 18:49:34','DropdownFieldValue',0),(240,18,5,NULL,NULL,NULL,'2016-01-26 18:49:34','2016-01-26 18:49:34','CheckboxFieldValue',0),(241,13,14,NULL,NULL,NULL,'2016-01-26 18:50:44','2016-01-26 18:50:44','CheckboxFieldValue',0),(242,12,14,NULL,NULL,NULL,'2016-01-26 18:50:44','2016-01-26 18:50:44','DropdownFieldValue',0),(243,15,14,NULL,NULL,NULL,'2016-01-26 18:50:44','2016-01-26 18:50:44','DropdownFieldValue',0),(244,18,14,NULL,NULL,NULL,'2016-01-26 18:50:44','2016-01-26 18:50:44','CheckboxFieldValue',0),(245,13,11,NULL,NULL,NULL,'2016-01-26 18:51:00','2016-01-26 18:51:00','CheckboxFieldValue',0),(246,12,11,NULL,NULL,NULL,'2016-01-26 18:51:01','2016-01-26 18:51:01','DropdownFieldValue',0),(247,15,11,NULL,NULL,NULL,'2016-01-26 18:51:01','2016-01-26 18:51:01','DropdownFieldValue',0),(248,18,11,NULL,NULL,NULL,'2016-01-26 18:51:01','2016-01-26 18:51:01','CheckboxFieldValue',0),(249,13,8,NULL,NULL,NULL,'2016-01-26 18:55:02','2016-01-26 18:55:02','CheckboxFieldValue',1),(250,12,8,NULL,NULL,NULL,'2016-01-26 18:55:02','2016-01-26 18:55:02','DropdownFieldValue',1),(251,15,8,NULL,NULL,NULL,'2016-01-26 18:55:02','2016-01-26 18:55:02','DropdownFieldValue',1),(252,18,8,NULL,NULL,NULL,'2016-01-26 18:55:02','2016-01-26 18:55:02','CheckboxFieldValue',1);
/*!40000 ALTER TABLE `custom_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_fields`
--

DROP TABLE IF EXISTS `custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_priority` int(11) DEFAULT NULL,
  `search_filter` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `community_id` int(11) DEFAULT NULL,
  `required` tinyint(1) DEFAULT '1',
  `min` float DEFAULT NULL,
  `max` float DEFAULT NULL,
  `allow_decimals` tinyint(1) DEFAULT '0',
  `boolean_operation` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `boolean_operator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_custom_fields_on_community_id` (`community_id`) USING BTREE,
  KEY `index_custom_fields_on_search_filter` (`search_filter`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_fields`
--

LOCK TABLES `custom_fields` WRITE;
/*!40000 ALTER TABLE `custom_fields` DISABLE KEYS */;
INSERT INTO `custom_fields` VALUES (12,'DropdownField',1,1,'2016-01-24 23:26:25','2016-01-26 04:24:03',1,1,NULL,NULL,0,NULL,'or'),(13,'CheckboxField',0,1,'2016-01-24 23:45:41','2016-01-26 04:24:03',1,1,NULL,NULL,0,NULL,'and'),(15,'DropdownField',2,1,'2016-01-25 01:02:25','2016-01-26 04:24:03',1,1,NULL,NULL,0,NULL,'or'),(18,'CheckboxField',3,1,'2016-01-26 01:58:18','2016-01-26 04:24:03',1,1,NULL,NULL,0,NULL,'or'),(19,'NumericField',NULL,1,'2016-01-26 05:05:19','2016-01-26 05:43:27',2,0,0,5,0,NULL,''),(20,'NumericField',NULL,1,'2016-01-26 05:11:22','2016-01-26 05:43:28',2,0,0,100,0,NULL,''),(21,'NumericField',NULL,1,'2016-01-26 05:11:42','2016-01-26 05:43:35',2,0,0,100,0,NULL,''),(22,'NumericField',NULL,1,'2016-01-26 05:11:57','2016-01-26 05:43:40',2,0,0,100,0,NULL,''),(23,'DropdownField',NULL,1,'2016-01-26 05:13:12','2016-01-26 05:43:43',2,0,NULL,NULL,0,NULL,''),(24,'NumericField',NULL,1,'2016-01-26 05:13:36','2016-01-26 05:43:51',2,0,0,30,0,NULL,''),(25,'NumericField',NULL,1,'2016-01-26 05:13:52','2016-01-26 05:43:53',2,0,0,30,0,NULL,''),(26,'DropdownField',NULL,1,'2016-01-26 05:14:58','2016-01-26 05:43:55',2,0,NULL,NULL,0,NULL,''),(27,'NumericField',NULL,1,'2016-01-26 05:15:14','2016-01-26 05:44:09',2,0,0,10,0,NULL,''),(28,'NumericField',NULL,1,'2016-01-26 05:16:06','2016-01-26 05:44:11',2,0,0,100,0,NULL,''),(29,'CheckboxField',NULL,1,'2016-01-26 05:17:59','2016-01-26 05:44:13',2,0,NULL,NULL,0,NULL,'');
/*!40000 ALTER TABLE `custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delayed_jobs`
--

DROP TABLE IF EXISTS `delayed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delayed_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) DEFAULT '0',
  `attempts` int(11) DEFAULT '0',
  `handler` text COLLATE utf8_unicode_ci,
  `last_error` text COLLATE utf8_unicode_ci,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `queue` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_delayed_jobs_on_attempts_and_run_at_and_priority` (`attempts`,`run_at`,`priority`) USING BTREE,
  KEY `index_delayed_jobs_on_locked_created` (`locked_at`,`created_at`) USING BTREE,
  KEY `delayed_jobs_priority` (`priority`,`run_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2716 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delayed_jobs`
--

LOCK TABLES `delayed_jobs` WRITE;
/*!40000 ALTER TABLE `delayed_jobs` DISABLE KEYS */;
INSERT INTO `delayed_jobs` VALUES (1134,5,3,'--- !ruby/struct:CommunityJoinedJob\nperson_id: aaT1sMWUKr5yaaYcOudhQ0\ncommunity_id: 1\n','Couldn\'t find Person with id=aaT1sMWUKr5yaaYcOudhQ0\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:199:in `raise_record_not_found_exception!\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:285:in `find_one\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:269:in `find_with_ids\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:36:in `find\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-deprecated_finders-1.0.4/lib/active_record/deprecated_finders/relation.rb:122:in `find\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/querying.rb:3:in `find\'\n/home/woto/rails/sharetribe/app/models/person.rb:126:in `find\'\n/home/woto/rails/sharetribe/app/jobs/community_joined_job.rb:14:in `perform\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/backend/base.rb:105:in `block in invoke_job\'\n/home/woto/rails/sharetribe/config/initializers/delayed_job.rb:10:in `call\'\n/home/woto/rails/sharetribe/config/initializers/delayed_job.rb:10:in `block (2 levels) in <class:DelayedJobLoggerPlugin>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block (2 levels) in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/backend/base.rb:102:in `invoke_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:207:in `block (2 levels) in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:91:in `block in timeout\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:101:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:101:in `timeout\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:207:in `block in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/benchmark.rb:294:in `realtime\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:206:in `run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:274:in `block in reserve_and_run_one_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:274:in `reserve_and_run_one_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:190:in `block in work_off\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:189:in `times\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:189:in `work_off\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:154:in `block (4 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/benchmark.rb:294:in `realtime\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:153:in `block (3 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:152:in `block (2 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:151:in `loop\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:151:in `block in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/plugins/clear_locks.rb:7:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block (2 levels) in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:150:in `start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/tasks.rb:9:in `block (2 levels) in <top (required)>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:240:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:240:in `block in execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `each\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:179:in `block in invoke_with_call_chain\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/monitor.rb:211:in `mon_synchronize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:172:in `invoke_with_call_chain\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:165:in `invoke\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:150:in `invoke_task\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block (2 levels) in top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `each\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block in top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:115:in `run_with_threads\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:100:in `top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:78:in `block in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:176:in `standard_exception_handling\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:75:in `run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/bin/rake:33:in `<top (required)>\'\n/home/woto/.rbenv/versions/2.1.2/bin/rake:23:in `load\'\n/home/woto/.rbenv/versions/2.1.2/bin/rake:23:in `<main>\'','2016-01-26 00:44:40','2016-01-26 00:44:40','2016-01-26 00:44:40','host:woto-MacBookPro pid:23798','2016-01-24 22:22:50','2016-01-26 00:44:40',NULL),(1135,5,3,'--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 6\nhost: lvh.me\n','Couldn\'t find CommunityMembership with id=6\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:199:in `raise_record_not_found_exception!\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:285:in `find_one\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:269:in `find_with_ids\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:36:in `find\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-deprecated_finders-1.0.4/lib/active_record/deprecated_finders/relation.rb:122:in `find\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/querying.rb:3:in `find\'\n/home/woto/rails/sharetribe/app/jobs/page_loaded_job.rb:6:in `perform\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/backend/base.rb:105:in `block in invoke_job\'\n/home/woto/rails/sharetribe/config/initializers/delayed_job.rb:10:in `call\'\n/home/woto/rails/sharetribe/config/initializers/delayed_job.rb:10:in `block (2 levels) in <class:DelayedJobLoggerPlugin>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block (2 levels) in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/backend/base.rb:102:in `invoke_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:207:in `block (2 levels) in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:91:in `block in timeout\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:101:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:101:in `timeout\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:207:in `block in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/benchmark.rb:294:in `realtime\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:206:in `run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:274:in `block in reserve_and_run_one_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:274:in `reserve_and_run_one_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:190:in `block in work_off\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:189:in `times\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:189:in `work_off\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:154:in `block (4 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/benchmark.rb:294:in `realtime\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:153:in `block (3 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:152:in `block (2 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:151:in `loop\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:151:in `block in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/plugins/clear_locks.rb:7:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block (2 levels) in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:150:in `start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/tasks.rb:9:in `block (2 levels) in <top (required)>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:240:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:240:in `block in execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `each\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:179:in `block in invoke_with_call_chain\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/monitor.rb:211:in `mon_synchronize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:172:in `invoke_with_call_chain\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:165:in `invoke\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:150:in `invoke_task\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block (2 levels) in top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `each\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block in top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:115:in `run_with_threads\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:100:in `top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:78:in `block in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:176:in `standard_exception_handling\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:75:in `run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/bin/rake:33:in `<top (required)>\'\n/home/woto/.rbenv/versions/2.1.2/bin/rake:23:in `load\'\n/home/woto/.rbenv/versions/2.1.2/bin/rake:23:in `<main>\'','2016-01-26 00:44:40','2016-01-26 00:44:40','2016-01-26 00:44:40','host:woto-MacBookPro pid:23798','2016-01-24 22:22:51','2016-01-26 00:44:40',NULL),(1136,5,3,'--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 6\nhost: lvh.me\n','Couldn\'t find CommunityMembership with id=6\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:199:in `raise_record_not_found_exception!\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:285:in `find_one\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:269:in `find_with_ids\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:36:in `find\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-deprecated_finders-1.0.4/lib/active_record/deprecated_finders/relation.rb:122:in `find\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/querying.rb:3:in `find\'\n/home/woto/rails/sharetribe/app/jobs/page_loaded_job.rb:6:in `perform\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/backend/base.rb:105:in `block in invoke_job\'\n/home/woto/rails/sharetribe/config/initializers/delayed_job.rb:10:in `call\'\n/home/woto/rails/sharetribe/config/initializers/delayed_job.rb:10:in `block (2 levels) in <class:DelayedJobLoggerPlugin>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block (2 levels) in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/backend/base.rb:102:in `invoke_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:207:in `block (2 levels) in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:91:in `block in timeout\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:101:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:101:in `timeout\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:207:in `block in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/benchmark.rb:294:in `realtime\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:206:in `run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:274:in `block in reserve_and_run_one_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:274:in `reserve_and_run_one_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:190:in `block in work_off\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:189:in `times\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:189:in `work_off\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:154:in `block (4 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/benchmark.rb:294:in `realtime\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:153:in `block (3 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:152:in `block (2 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:151:in `loop\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:151:in `block in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/plugins/clear_locks.rb:7:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block (2 levels) in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:150:in `start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/tasks.rb:9:in `block (2 levels) in <top (required)>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:240:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:240:in `block in execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `each\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:179:in `block in invoke_with_call_chain\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/monitor.rb:211:in `mon_synchronize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:172:in `invoke_with_call_chain\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:165:in `invoke\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:150:in `invoke_task\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block (2 levels) in top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `each\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block in top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:115:in `run_with_threads\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:100:in `top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:78:in `block in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:176:in `standard_exception_handling\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:75:in `run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/bin/rake:33:in `<top (required)>\'\n/home/woto/.rbenv/versions/2.1.2/bin/rake:23:in `load\'\n/home/woto/.rbenv/versions/2.1.2/bin/rake:23:in `<main>\'','2016-01-26 00:44:40','2016-01-26 00:44:41','2016-01-26 00:44:41','host:woto-MacBookPro pid:23798','2016-01-24 22:23:10','2016-01-26 00:44:41',NULL),(1137,5,3,'--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 6\nhost: lvh.me\n','Couldn\'t find CommunityMembership with id=6\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:199:in `raise_record_not_found_exception!\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:285:in `find_one\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:269:in `find_with_ids\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:36:in `find\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-deprecated_finders-1.0.4/lib/active_record/deprecated_finders/relation.rb:122:in `find\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/querying.rb:3:in `find\'\n/home/woto/rails/sharetribe/app/jobs/page_loaded_job.rb:6:in `perform\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/backend/base.rb:105:in `block in invoke_job\'\n/home/woto/rails/sharetribe/config/initializers/delayed_job.rb:10:in `call\'\n/home/woto/rails/sharetribe/config/initializers/delayed_job.rb:10:in `block (2 levels) in <class:DelayedJobLoggerPlugin>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block (2 levels) in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/backend/base.rb:102:in `invoke_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:207:in `block (2 levels) in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:91:in `block in timeout\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:101:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:101:in `timeout\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:207:in `block in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/benchmark.rb:294:in `realtime\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:206:in `run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:274:in `block in reserve_and_run_one_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:274:in `reserve_and_run_one_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:190:in `block in work_off\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:189:in `times\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:189:in `work_off\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:154:in `block (4 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/benchmark.rb:294:in `realtime\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:153:in `block (3 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:152:in `block (2 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:151:in `loop\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:151:in `block in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/plugins/clear_locks.rb:7:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block (2 levels) in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:150:in `start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/tasks.rb:9:in `block (2 levels) in <top (required)>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:240:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:240:in `block in execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `each\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:179:in `block in invoke_with_call_chain\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/monitor.rb:211:in `mon_synchronize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:172:in `invoke_with_call_chain\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:165:in `invoke\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:150:in `invoke_task\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block (2 levels) in top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `each\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block in top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:115:in `run_with_threads\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:100:in `top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:78:in `block in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:176:in `standard_exception_handling\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:75:in `run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/bin/rake:33:in `<top (required)>\'\n/home/woto/.rbenv/versions/2.1.2/bin/rake:23:in `load\'\n/home/woto/.rbenv/versions/2.1.2/bin/rake:23:in `<main>\'','2016-01-26 00:44:41','2016-01-26 00:44:41','2016-01-26 00:44:41','host:woto-MacBookPro pid:23798','2016-01-24 22:23:11','2016-01-26 00:44:41',NULL),(1138,5,3,'--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 6\nhost: lvh.me\n','Couldn\'t find CommunityMembership with id=6\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:199:in `raise_record_not_found_exception!\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:285:in `find_one\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:269:in `find_with_ids\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:36:in `find\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-deprecated_finders-1.0.4/lib/active_record/deprecated_finders/relation.rb:122:in `find\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/querying.rb:3:in `find\'\n/home/woto/rails/sharetribe/app/jobs/page_loaded_job.rb:6:in `perform\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/backend/base.rb:105:in `block in invoke_job\'\n/home/woto/rails/sharetribe/config/initializers/delayed_job.rb:10:in `call\'\n/home/woto/rails/sharetribe/config/initializers/delayed_job.rb:10:in `block (2 levels) in <class:DelayedJobLoggerPlugin>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block (2 levels) in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/backend/base.rb:102:in `invoke_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:207:in `block (2 levels) in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:91:in `block in timeout\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:101:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:101:in `timeout\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:207:in `block in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/benchmark.rb:294:in `realtime\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:206:in `run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:274:in `block in reserve_and_run_one_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:274:in `reserve_and_run_one_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:190:in `block in work_off\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:189:in `times\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:189:in `work_off\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:154:in `block (4 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/benchmark.rb:294:in `realtime\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:153:in `block (3 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:152:in `block (2 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:151:in `loop\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:151:in `block in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/plugins/clear_locks.rb:7:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block (2 levels) in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:150:in `start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/tasks.rb:9:in `block (2 levels) in <top (required)>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:240:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:240:in `block in execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `each\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:179:in `block in invoke_with_call_chain\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/monitor.rb:211:in `mon_synchronize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:172:in `invoke_with_call_chain\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:165:in `invoke\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:150:in `invoke_task\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block (2 levels) in top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `each\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block in top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:115:in `run_with_threads\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:100:in `top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:78:in `block in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:176:in `standard_exception_handling\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:75:in `run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/bin/rake:33:in `<top (required)>\'\n/home/woto/.rbenv/versions/2.1.2/bin/rake:23:in `load\'\n/home/woto/.rbenv/versions/2.1.2/bin/rake:23:in `<main>\'','2016-01-26 00:44:41','2016-01-26 00:44:41','2016-01-26 00:44:41','host:woto-MacBookPro pid:23798','2016-01-24 22:24:09','2016-01-26 00:44:41',NULL),(1139,5,3,'--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 6\nhost: lvh.me\n','Couldn\'t find CommunityMembership with id=6\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:199:in `raise_record_not_found_exception!\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:285:in `find_one\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:269:in `find_with_ids\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:36:in `find\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-deprecated_finders-1.0.4/lib/active_record/deprecated_finders/relation.rb:122:in `find\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/querying.rb:3:in `find\'\n/home/woto/rails/sharetribe/app/jobs/page_loaded_job.rb:6:in `perform\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/backend/base.rb:105:in `block in invoke_job\'\n/home/woto/rails/sharetribe/config/initializers/delayed_job.rb:10:in `call\'\n/home/woto/rails/sharetribe/config/initializers/delayed_job.rb:10:in `block (2 levels) in <class:DelayedJobLoggerPlugin>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block (2 levels) in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/backend/base.rb:102:in `invoke_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:207:in `block (2 levels) in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:91:in `block in timeout\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:101:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:101:in `timeout\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:207:in `block in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/benchmark.rb:294:in `realtime\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:206:in `run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:274:in `block in reserve_and_run_one_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:274:in `reserve_and_run_one_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:190:in `block in work_off\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:189:in `times\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:189:in `work_off\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:154:in `block (4 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/benchmark.rb:294:in `realtime\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:153:in `block (3 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:152:in `block (2 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:151:in `loop\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:151:in `block in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/plugins/clear_locks.rb:7:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block (2 levels) in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:150:in `start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/tasks.rb:9:in `block (2 levels) in <top (required)>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:240:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:240:in `block in execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `each\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:179:in `block in invoke_with_call_chain\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/monitor.rb:211:in `mon_synchronize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:172:in `invoke_with_call_chain\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:165:in `invoke\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:150:in `invoke_task\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block (2 levels) in top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `each\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block in top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:115:in `run_with_threads\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:100:in `top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:78:in `block in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:176:in `standard_exception_handling\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:75:in `run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/bin/rake:33:in `<top (required)>\'\n/home/woto/.rbenv/versions/2.1.2/bin/rake:23:in `load\'\n/home/woto/.rbenv/versions/2.1.2/bin/rake:23:in `<main>\'','2016-01-26 00:44:41','2016-01-26 00:44:41','2016-01-26 00:44:41','host:woto-MacBookPro pid:23798','2016-01-24 22:25:08','2016-01-26 00:44:41',NULL),(1140,5,3,'--- !ruby/struct:PageLoadedJob\ncommunity_membership_id: 6\nhost: lvh.me\n','Couldn\'t find CommunityMembership with id=6\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:199:in `raise_record_not_found_exception!\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:285:in `find_one\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:269:in `find_with_ids\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/relation/finder_methods.rb:36:in `find\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-deprecated_finders-1.0.4/lib/active_record/deprecated_finders/relation.rb:122:in `find\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/activerecord-4.0.13/lib/active_record/querying.rb:3:in `find\'\n/home/woto/rails/sharetribe/app/jobs/page_loaded_job.rb:6:in `perform\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/backend/base.rb:105:in `block in invoke_job\'\n/home/woto/rails/sharetribe/config/initializers/delayed_job.rb:10:in `call\'\n/home/woto/rails/sharetribe/config/initializers/delayed_job.rb:10:in `block (2 levels) in <class:DelayedJobLoggerPlugin>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block (2 levels) in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/backend/base.rb:102:in `invoke_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:207:in `block (2 levels) in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:91:in `block in timeout\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:101:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/timeout.rb:101:in `timeout\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:207:in `block in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/benchmark.rb:294:in `realtime\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:206:in `run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:274:in `block in reserve_and_run_one_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:274:in `reserve_and_run_one_job\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:190:in `block in work_off\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:189:in `times\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:189:in `work_off\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:154:in `block (4 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/benchmark.rb:294:in `realtime\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:153:in `block (3 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:152:in `block (2 levels) in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:151:in `loop\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:151:in `block in start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/plugins/clear_locks.rb:7:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/plugins/clear_locks.rb:7:in `block (2 levels) in <class:ClearLocks>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block (2 levels) in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:60:in `block in initialize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:78:in `block in add\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:65:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/lifecycle.rb:38:in `run_callbacks\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/worker.rb:150:in `start\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/delayed_job-4.0.2/lib/delayed/tasks.rb:9:in `block (2 levels) in <top (required)>\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:240:in `call\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:240:in `block in execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `each\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:235:in `execute\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:179:in `block in invoke_with_call_chain\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/2.1.0/monitor.rb:211:in `mon_synchronize\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:172:in `invoke_with_call_chain\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/task.rb:165:in `invoke\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:150:in `invoke_task\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block (2 levels) in top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `each\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:106:in `block in top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:115:in `run_with_threads\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:100:in `top_level\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:78:in `block in run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:176:in `standard_exception_handling\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/lib/rake/application.rb:75:in `run\'\n/home/woto/.rbenv/versions/2.1.2/lib/ruby/gems/2.1.0/gems/rake-10.5.0/bin/rake:33:in `<top (required)>\'\n/home/woto/.rbenv/versions/2.1.2/bin/rake:23:in `load\'\n/home/woto/.rbenv/versions/2.1.2/bin/rake:23:in `<main>\'','2016-01-26 00:44:41','2016-01-26 00:44:41','2016-01-26 00:44:41','host:woto-MacBookPro pid:23798','2016-01-24 22:25:11','2016-01-26 00:44:41',NULL);
/*!40000 ALTER TABLE `delayed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `send_notifications` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_emails_on_address` (`address`) USING BTREE,
  KEY `index_emails_on_person_id` (`person_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
INSERT INTO `emails` VALUES (1,'dGzDsaVWqr5yafYcOudhQ0','oganer@gmail.com','2016-01-19 23:32:17',NULL,'MRiy4OPJIxXkvikC','2016-01-19 23:32:17','2016-01-19 23:32:17',1),(2,'ad0vC-VWGr5yaaYcOudhQ0','fake@example.com','2016-01-19 23:54:46',NULL,'KqZ+HtUHQTqlcBAW','2016-01-19 23:54:45','2016-01-19 23:54:46',1),(3,'dWXZjCWJWr5yaaYcOudhQ0','user1@example.com','2016-01-24 01:51:10',NULL,'f+nl0S+ju3VoVNxZ','2016-01-24 01:51:09','2016-01-24 01:51:10',1),(4,'aT_MigWUqr5yaaYcOudhQ0','fake@mail.ru','2016-01-24 21:48:19',NULL,'RuDgKPBcBKkDJaNP','2016-01-24 21:48:18','2016-01-24 21:48:19',1),(5,'b-HEA0WUGr5yaaYcOudhQ0','zzzz@zzz.zzz','2016-01-24 22:19:12',NULL,'mW0qPoIEVYww/TKq','2016-01-24 22:19:11','2016-01-24 22:19:12',1),(7,'bY9fpaWUKr5yaaYcOudhQ0','fake2@example.com','2016-01-24 22:26:02',NULL,'NxdK1JacxjVSUTZF','2016-01-24 22:26:01','2016-01-24 22:26:02',1),(8,'b8SMhgWUOr5yaaYcOudhQ0','fake3@example.com','2016-01-24 22:33:28',NULL,'yabCVXJNj5ceIPSI','2016-01-24 22:33:27','2016-01-24 22:33:28',1),(9,'c9EH-CWXer5yafYcOudhQ0','fake7@example.com','2016-01-25 03:14:27',NULL,'Nbt7j5wEfdk5Vex1','2016-01-25 03:14:26','2016-01-25 03:14:27',1),(10,'beaou-W8qr5yaaYcOudhQ0','fake111@example.com','2016-01-26 00:32:23',NULL,'MnCGPhQOuwRiS0zt','2016-01-26 00:32:22','2016-01-26 00:32:23',1),(11,'aMGnBEW8yr5yaaYcOudhQ0','fake112@example.com','2016-01-26 00:45:52',NULL,'XbV2/yxjZCFrCUMq','2016-01-26 00:45:52','2016-01-26 00:45:52',1);
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature_flags`
--

DROP TABLE IF EXISTS `feature_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature_flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) NOT NULL,
  `feature` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_feature_flags_on_community_id` (`community_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature_flags`
--

LOCK TABLES `feature_flags` WRITE;
/*!40000 ALTER TABLE `feature_flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci,
  `author_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_handled` int(11) DEFAULT '0',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follower_relationships`
--

DROP TABLE IF EXISTS `follower_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `follower_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `follower_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_follower_relationships_on_person_id_and_follower_id` (`person_id`,`follower_id`) USING BTREE,
  KEY `index_follower_relationships_on_follower_id` (`follower_id`) USING BTREE,
  KEY `index_follower_relationships_on_person_id` (`person_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follower_relationships`
--

LOCK TABLES `follower_relationships` WRITE;
/*!40000 ALTER TABLE `follower_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `follower_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invitations`
--

DROP TABLE IF EXISTS `invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invitations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  `usages_left` int(11) DEFAULT NULL,
  `valid_until` datetime DEFAULT NULL,
  `information` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `inviter_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_invitations_on_code` (`code`) USING BTREE,
  KEY `index_invitations_on_inviter_id` (`inviter_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invitations`
--

LOCK TABLES `invitations` WRITE;
/*!40000 ALTER TABLE `invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_followers`
--

DROP TABLE IF EXISTS `listing_followers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_followers` (
  `person_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `listing_id` int(11) DEFAULT NULL,
  KEY `index_listing_followers_on_listing_id` (`listing_id`) USING BTREE,
  KEY `index_listing_followers_on_person_id` (`person_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_followers`
--

LOCK TABLES `listing_followers` WRITE;
/*!40000 ALTER TABLE `listing_followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `listing_followers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_images`
--

DROP TABLE IF EXISTS `listing_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `image_processing` tinyint(1) DEFAULT NULL,
  `image_downloaded` tinyint(1) DEFAULT '0',
  `error` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `author_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_listing_images_on_listing_id` (`listing_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_images`
--

LOCK TABLES `listing_images` WRITE;
/*!40000 ALTER TABLE `listing_images` DISABLE KEYS */;
INSERT INTO `listing_images` VALUES (1,3,'2016-01-20 11:09:13','2016-01-26 00:38:50','1453111496306.jpg','image/jpeg',177661,'2016-01-26 00:38:48',0,1,NULL,1279,691,'dGzDsaVWqr5yafYcOudhQ0'),(2,3,'2016-01-20 11:09:18','2016-01-26 00:38:52','1453106869119.jpg','image/jpeg',371874,'2016-01-26 00:38:50',0,1,NULL,1278,692,'dGzDsaVWqr5yafYcOudhQ0'),(3,3,'2016-01-20 11:09:24','2016-01-26 00:38:53','1453142851864.jpg','image/jpeg',400124,'2016-01-26 00:38:52',0,1,NULL,1277,688,'dGzDsaVWqr5yafYcOudhQ0');
/*!40000 ALTER TABLE `listing_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_shapes`
--

DROP TABLE IF EXISTS `listing_shapes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_shapes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) NOT NULL,
  `transaction_process_id` int(11) NOT NULL,
  `price_enabled` tinyint(1) NOT NULL,
  `shipping_enabled` tinyint(1) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_tr_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action_button_tr_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_priority` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `multicol_index` (`community_id`,`deleted`,`sort_priority`) USING BTREE,
  KEY `index_listing_shapes_on_community_id` (`community_id`) USING BTREE,
  KEY `index_listing_shapes_on_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_shapes`
--

LOCK TABLES `listing_shapes` WRITE;
/*!40000 ALTER TABLE `listing_shapes` DISABLE KEYS */;
INSERT INTO `listing_shapes` VALUES (1,1,1,1,0,'offering','903e0b7e-3361-4e70-a897-af84a4d8410e','e2d756ac-2f0b-49e6-9184-6508324629db',0,'2016-01-19 23:32:15','2016-01-23 21:15:32',1),(2,1,2,1,0,'requesting','44898f60-b573-42cd-a22f-16ea6b7640fc','25500c00-1b23-4a5a-845a-575185e3c0ff',1,'2016-01-20 00:38:08','2016-01-20 11:44:00',1),(3,1,1,1,0,'offering1','09f685fd-5406-455b-866f-74e020336b33','7032965b-10a2-4d1a-acb3-dc58a8a73c41',2,'2016-01-20 11:06:41','2016-01-20 11:43:55',1),(4,1,1,0,0,'giving-away','d06e8587-1ea5-46f1-b726-36084013fe5c','5fb614bc-2edc-4857-9028-15b78836192c',1,'2016-01-20 11:44:53','2016-01-23 21:14:10',1),(5,1,2,1,0,'requesting','6d966224-3bea-4ad2-b484-0d4c69a9b1a5','8eae6ab4-2989-4c89-9931-3464f6088d0f',2,'2016-01-20 13:32:25','2016-01-23 21:14:16',1),(6,1,1,1,0,'offering1','c95f444a-b35e-4277-963b-0fedc397dfe5','103b8746-ebd8-41dd-b7fb-a45172e38d18',1,'2016-01-23 21:15:25','2016-01-23 21:15:25',0),(7,1,1,1,0,'u-uchienika','e3c267f0-5e7d-48ce-8148-7916d3b46052','e9b50a11-5d5d-4c99-bb44-4cfab2206a9f',2,'2016-01-24 04:03:20','2016-01-24 04:40:57',1),(8,1,1,1,0,'onlain-skype','70144e1a-ae7e-4edc-a0e7-051216da49cd','fe2e4276-dece-4111-9b53-eea8d029227e',3,'2016-01-24 04:03:50','2016-01-24 04:41:05',1),(9,1,1,1,0,'u-uchienika','447f5dd5-eb55-40d1-8bf6-219744eb7185','121443c1-dc4b-4ccf-8e7b-77c4343dc38b',2,'2016-01-24 05:14:02','2016-01-24 22:36:35',1),(10,1,1,1,0,'onlain-skype','90981230-4c2f-4ae7-9b2c-aca60994e3cc','791e2673-1b12-4d9e-938e-e188b7ae39a2',3,'2016-01-24 05:14:18','2016-01-24 22:36:43',1),(11,1,2,0,0,'learn','4c43f1c8-550b-4f61-b729-5bb7186d496d','115f6c61-6593-4314-96a2-2a5bbff27c45',2,'2016-01-24 22:38:58','2016-01-24 22:38:58',0),(14,2,3,1,0,'renting-out','6d73a848-0251-47ec-ad9d-3ad5f5db7558','e312baf3-5d59-42da-aafd-9628981d0ed5',0,'2016-01-26 05:22:11','2016-01-26 05:22:11',0);
/*!40000 ALTER TABLE `listing_shapes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listing_units`
--

DROP TABLE IF EXISTS `listing_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listing_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `quantity_selector` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `name_tr_key` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `selector_tr_key` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `listing_shape_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_listing_units_on_listing_shape_id` (`listing_shape_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listing_units`
--

LOCK TABLES `listing_units` WRITE;
/*!40000 ALTER TABLE `listing_units` DISABLE KEYS */;
INSERT INTO `listing_units` VALUES (2,'custom','number','quantity','9786e928-7898-4287-865e-a797271caae1','93a79553-3417-4d31-a0ec-61a05ff9bc90',2,'2016-01-20 00:38:08','2016-01-20 00:38:08'),(3,'hour','number','time',NULL,NULL,3,'2016-01-20 11:06:41','2016-01-20 11:06:41'),(9,'custom','number','time','3a8a9bf4-7c8f-4f78-8538-be0ed12784b5','3e5ed00e-f6f9-4575-bd66-770e814aa53c',5,'2016-01-23 21:13:10','2016-01-23 21:13:10'),(10,'custom','number','time','5e8d1cb5-d86e-4616-b25b-e5dcd6b53bf6','5b799719-38b8-41b2-b01d-77261e8de51c',5,'2016-01-23 21:13:10','2016-01-23 21:13:10'),(11,'custom','number','quantity','54ab3727-5fea-4570-8bb6-a5cceecbf0ba','daf8bd4c-06b1-4b0c-95a9-1f1f8c851e99',5,'2016-01-23 21:13:10','2016-01-23 21:13:10'),(19,'custom','number','quantity','c2e1389b-7a2b-44d5-ab2f-e47dfbd29172','f30897a2-b863-4dd4-b61a-c509008c64ad',1,'2016-01-23 21:14:29','2016-01-23 21:14:29'),(20,'custom','number','quantity','7338051e-f42e-4551-92e2-31274e28867d','14dffcd3-1ddb-465d-8bbe-e83e1b82d49f',1,'2016-01-23 21:14:29','2016-01-23 21:14:29'),(21,'custom','number','time','b36a4299-b452-42cc-8ea7-3d5c6c0ca8a8','c22b2257-5273-45ff-8bd6-0e1d9720479a',1,'2016-01-23 21:14:29','2016-01-23 21:14:29'),(51,'hour','number','time',NULL,NULL,7,'2016-01-24 04:03:20','2016-01-24 04:03:20'),(54,'hour','number','time',NULL,NULL,8,'2016-01-24 04:03:50','2016-01-24 04:03:50'),(82,'hour','number','time',NULL,NULL,9,'2016-01-24 05:14:02','2016-01-24 05:14:02'),(83,'day','day','time',NULL,NULL,9,'2016-01-24 05:14:02','2016-01-24 05:14:02'),(84,'hour','number','time',NULL,NULL,10,'2016-01-24 05:14:18','2016-01-24 05:14:18'),(85,'day','day','time',NULL,NULL,10,'2016-01-24 05:14:18','2016-01-24 05:14:18'),(95,'hour','number','time',NULL,NULL,6,'2016-01-25 01:11:30','2016-01-25 01:11:30'),(96,'month','number','time',NULL,NULL,12,'2016-01-26 05:04:00','2016-01-26 05:04:00'),(97,'day','day','time',NULL,NULL,13,'2016-01-26 05:19:47','2016-01-26 05:19:47'),(98,'week','number','time',NULL,NULL,13,'2016-01-26 05:19:47','2016-01-26 05:19:47'),(99,'month','number','time',NULL,NULL,13,'2016-01-26 05:19:47','2016-01-26 05:19:47'),(100,'day','day','time',NULL,NULL,14,'2016-01-26 05:22:11','2016-01-26 05:22:11'),(101,'week','number','time',NULL,NULL,14,'2016-01-26 05:22:11','2016-01-26 05:22:11'),(102,'month','number','time',NULL,NULL,14,'2016-01-26 05:22:11','2016-01-26 05:22:11');
/*!40000 ALTER TABLE `listing_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listings`
--

DROP TABLE IF EXISTS `listings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) NOT NULL,
  `author_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_old` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `times_viewed` int(11) DEFAULT '0',
  `language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updates_email_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `sort_date` datetime DEFAULT NULL,
  `listing_type_old` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `origin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valid_until` datetime DEFAULT NULL,
  `delta` tinyint(1) NOT NULL DEFAULT '1',
  `open` tinyint(1) DEFAULT '1',
  `share_type_old` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `privacy` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'private',
  `comments_count` int(11) DEFAULT '0',
  `subcategory_old` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `old_category_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `share_type_id` int(11) DEFAULT NULL,
  `listing_shape_id` int(11) DEFAULT NULL,
  `transaction_process_id` int(11) DEFAULT NULL,
  `shape_name_tr_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action_button_tr_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `price_cents` int(11) DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_type` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity_selector` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_tr_key` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_selector_tr_key` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `require_shipping_address` tinyint(1) DEFAULT '0',
  `pickup_enabled` tinyint(1) DEFAULT '0',
  `shipping_price_cents` int(11) DEFAULT NULL,
  `shipping_price_additional_cents` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_listings_on_new_category_id` (`category_id`) USING BTREE,
  KEY `person_listings` (`community_id`,`author_id`) USING BTREE,
  KEY `homepage_query` (`community_id`,`open`,`sort_date`,`deleted`) USING BTREE,
  KEY `updates_email_listings` (`community_id`,`open`,`updates_email_at`) USING BTREE,
  KEY `homepage_query_valid_until` (`community_id`,`open`,`valid_until`,`sort_date`,`deleted`) USING BTREE,
  KEY `index_listings_on_community_id` (`community_id`) USING BTREE,
  KEY `index_listings_on_listing_shape_id` (`listing_shape_id`) USING BTREE,
  KEY `index_listings_on_category_id` (`old_category_id`) USING BTREE,
  KEY `index_listings_on_open` (`open`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listings`
--

LOCK TABLES `listings` WRITE;
/*!40000 ALTER TABLE `listings` DISABLE KEYS */;
INSERT INTO `listings` VALUES (1,1,'dGzDsaVWqr5yafYcOudhQ0',NULL,'444',0,NULL,'2016-01-20 00:03:46','2016-01-20 00:03:46','2016-01-23 21:15:32','2016-01-20 14:27:35','2016-01-20 00:03:46',NULL,'','',NULL,'2016-04-20 23:59:59',0,0,NULL,'private',0,NULL,NULL,1,NULL,NULL,1,'903e0b7e-3361-4e70-a897-af84a4d8410e','e2d756ac-2f0b-49e6-9184-6508324629db',NULL,20000,'RUB',NULL,'day','day',NULL,NULL,0,0,0,NULL,NULL),(2,1,'dGzDsaVWqr5yafYcOudhQ0',NULL,'bbb',0,NULL,'2016-01-20 00:06:24','2016-01-20 00:34:52','2016-01-23 21:15:32',NULL,'2016-01-20 00:06:24',NULL,'','',NULL,'2016-04-20 23:59:59',0,0,NULL,'private',0,NULL,NULL,1,NULL,NULL,1,'903e0b7e-3361-4e70-a897-af84a4d8410e','e2d756ac-2f0b-49e6-9184-6508324629db',NULL,0,'RUB',NULL,'day','day',NULL,NULL,0,0,0,NULL,NULL),(3,1,'dGzDsaVWqr5yafYcOudhQ0',NULL,'иии',0,NULL,'2016-01-20 11:08:34','2016-01-20 11:08:34','2016-01-26 00:38:53','2016-01-20 11:09:57','2016-01-20 11:24:49',NULL,'','Красноармейская ул., 8к3, Москва, Россия, 125167',NULL,'2016-04-20 23:59:59',0,0,NULL,'private',0,NULL,NULL,1,NULL,NULL,1,'903e0b7e-3361-4e70-a897-af84a4d8410e','e2d756ac-2f0b-49e6-9184-6508324629db',NULL,15000,'RUB',NULL,'day','day',NULL,NULL,0,0,0,NULL,NULL),(4,1,'dGzDsaVWqr5yafYcOudhQ0',NULL,'яяя',0,NULL,'2016-01-20 14:21:09','2016-01-20 14:21:09','2016-01-23 21:14:10',NULL,'2016-01-20 14:21:09',NULL,'','',NULL,'2016-04-20 23:59:59',0,0,NULL,'private',0,NULL,NULL,1,NULL,NULL,1,'d06e8587-1ea5-46f1-b726-36084013fe5c','5fb614bc-2edc-4857-9028-15b78836192c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL),(5,1,'dGzDsaVWqr5yafYcOudhQ0',NULL,'111',0,NULL,'2016-01-23 21:16:07','2016-01-23 21:16:07','2016-01-26 18:49:32','2016-01-26 18:49:31','2016-01-23 21:16:07',NULL,'111','Рубцовско-Дворцовая ул., 1/3к9, Москва, Россия, 107014',NULL,NULL,0,1,NULL,'private',0,NULL,NULL,1,NULL,6,1,'c95f444a-b35e-4277-963b-0fedc397dfe5','103b8746-ebd8-41dd-b7fb-a45172e38d18',NULL,11100,'RUB',NULL,'hour','number',NULL,NULL,0,0,0,NULL,NULL),(6,1,'dGzDsaVWqr5yafYcOudhQ0',NULL,'Научу за 40 руб в день у преподавателя',0,NULL,'2016-01-23 21:16:33','2016-01-23 21:16:33','2016-01-24 22:55:55','2016-01-24 22:55:55','2016-01-23 21:16:33',NULL,'','',NULL,NULL,0,1,NULL,'private',0,NULL,NULL,1,NULL,6,1,'c95f444a-b35e-4277-963b-0fedc397dfe5','103b8746-ebd8-41dd-b7fb-a45172e38d18',NULL,4000,'RUB',NULL,'hour','number',NULL,NULL,0,0,0,NULL,NULL),(7,1,'dGzDsaVWqr5yafYcOudhQ0',NULL,'Listing title',0,NULL,'2016-01-24 00:55:00','2016-01-24 00:55:00','2016-01-25 23:22:15','2016-01-25 23:22:15','2016-01-24 00:55:00',NULL,'Detailed description\nнорильск','4-я 8 Марта ул., 6, Москва, Россия, 125167',NULL,NULL,0,1,NULL,'private',0,NULL,NULL,1,NULL,6,1,'c95f444a-b35e-4277-963b-0fedc397dfe5','103b8746-ebd8-41dd-b7fb-a45172e38d18',NULL,1000,'RUB',NULL,'hour','number',NULL,NULL,0,0,0,NULL,NULL),(8,1,'dWXZjCWJWr5yaaYcOudhQ0',NULL,'тра-та-та',0,NULL,'2016-01-24 01:54:17','2016-01-24 01:54:17','2016-01-26 18:55:02','2016-01-26 18:55:02','2016-01-24 01:54:17',NULL,'','',NULL,NULL,1,1,NULL,'private',0,NULL,NULL,1,NULL,6,1,'c95f444a-b35e-4277-963b-0fedc397dfe5','103b8746-ebd8-41dd-b7fb-a45172e38d18',NULL,1000,'RUB',NULL,'hour','number',NULL,NULL,0,0,0,NULL,NULL),(9,1,'dGzDsaVWqr5yafYcOudhQ0',NULL,'Первая',0,NULL,'2016-01-24 04:05:14','2016-01-24 04:05:14','2016-01-24 22:36:43','2016-01-24 05:16:44','2016-01-24 04:05:14',NULL,'первая','',NULL,'2016-04-24 23:59:59',0,0,NULL,'private',0,NULL,NULL,1,NULL,NULL,1,'90981230-4c2f-4ae7-9b2c-aca60994e3cc','791e2673-1b12-4d9e-938e-e188b7ae39a2',NULL,11100,'RUB',NULL,'hour','number',NULL,NULL,0,0,0,NULL,NULL),(10,1,'dGzDsaVWqr5yafYcOudhQ0',NULL,'Тырым пырым',0,NULL,'2016-01-24 05:58:00','2016-01-24 05:58:00','2016-01-24 22:55:32','2016-01-24 22:55:32','2016-01-24 05:58:00',NULL,'','',NULL,NULL,0,1,NULL,'private',0,NULL,NULL,1,NULL,6,1,'c95f444a-b35e-4277-963b-0fedc397dfe5','103b8746-ebd8-41dd-b7fb-a45172e38d18',NULL,2000,'RUB',NULL,'hour','number',NULL,NULL,0,0,0,NULL,NULL),(11,1,'dGzDsaVWqr5yafYcOudhQ0',NULL,'Научу математике за 20 руб в час у ученика',0,NULL,'2016-01-24 22:39:35','2016-01-24 22:39:35','2016-01-26 18:50:59','2016-01-26 18:50:55','2016-01-24 22:39:35',NULL,'норильск','Бутырская ул., 93, Москва, Россия, 127015',NULL,NULL,0,1,NULL,'private',0,NULL,NULL,1,NULL,6,1,'c95f444a-b35e-4277-963b-0fedc397dfe5','103b8746-ebd8-41dd-b7fb-a45172e38d18',NULL,2000,'RUB',NULL,'hour','number',NULL,NULL,0,0,0,NULL,NULL),(12,1,'dGzDsaVWqr5yafYcOudhQ0',NULL,'Необходима помощь преподавателя',0,NULL,'2016-01-24 22:40:17','2016-01-24 22:40:17','2016-01-26 04:21:28','2016-01-26 04:21:28','2016-01-24 22:40:17',NULL,'Помогите подготовиться к ГИА','',NULL,NULL,0,1,NULL,'private',0,NULL,NULL,22,NULL,11,2,'4c43f1c8-550b-4f61-b729-5bb7186d496d','115f6c61-6593-4314-96a2-2a5bbff27c45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL),(13,1,'dGzDsaVWqr5yafYcOudhQ0',NULL,'Необходима подготовка к ГИА',0,NULL,'2016-01-24 23:50:42','2016-01-24 23:50:42','2016-01-25 23:23:24','2016-01-25 23:23:24','2016-01-24 23:50:42',NULL,'Нужно подготовить моего сына к выпускному экзамену, знания средние.','Полковая ул., 1с20, Москва, Россия, 127018',NULL,NULL,0,1,NULL,'private',0,NULL,NULL,22,NULL,11,2,'4c43f1c8-550b-4f61-b729-5bb7186d496d','115f6c61-6593-4314-96a2-2a5bbff27c45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL),(14,1,'dGzDsaVWqr5yafYcOudhQ0',NULL,'Will teach you Russian language',0,NULL,'2016-01-25 00:44:02','2016-01-25 00:44:02','2016-01-26 18:50:43','2016-01-26 18:50:42','2016-01-25 00:44:02',NULL,'another \ndesc','',NULL,NULL,0,1,NULL,'private',0,NULL,NULL,1,NULL,6,1,'c95f444a-b35e-4277-963b-0fedc397dfe5','103b8746-ebd8-41dd-b7fb-a45172e38d18',NULL,1500,'RUB',NULL,'hour','number',NULL,NULL,0,0,0,NULL,NULL),(15,1,'dGzDsaVWqr5yafYcOudhQ0',NULL,'I want to learn English language',0,NULL,'2016-01-25 00:46:16','2016-01-25 00:46:16','2016-01-25 23:23:36','2016-01-25 23:23:36','2016-01-25 00:46:16',NULL,'Some desc','Московская аллея, Москва, Россия, 125167',NULL,NULL,0,1,NULL,'private',0,NULL,NULL,22,NULL,11,2,'4c43f1c8-550b-4f61-b729-5bb7186d496d','115f6c61-6593-4314-96a2-2a5bbff27c45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL),(16,1,'dGzDsaVWqr5yafYcOudhQ0',NULL,'Научу дисциплинам, которыми владею :)',0,NULL,'2016-01-25 01:20:50','2016-01-25 01:20:50','2016-01-26 03:37:18','2016-01-26 03:37:18','2016-01-25 01:20:50',NULL,'second desc','Мирской пр., Москва, Россия, 127083',NULL,NULL,0,1,NULL,'private',0,NULL,NULL,1,NULL,6,1,'c95f444a-b35e-4277-963b-0fedc397dfe5','103b8746-ebd8-41dd-b7fb-a45172e38d18',NULL,500,'RUB',NULL,'hour','number',NULL,NULL,0,0,0,NULL,NULL),(17,1,'dGzDsaVWqr5yafYcOudhQ0',NULL,'English',0,NULL,'2016-01-25 18:03:47','2016-01-25 18:03:47','2016-01-25 23:22:27','2016-01-25 23:22:26','2016-01-25 18:03:47',NULL,'English','Мирской пр., Москва, Россия, 127083',NULL,NULL,0,1,NULL,'private',0,NULL,NULL,1,NULL,6,1,'c95f444a-b35e-4277-963b-0fedc397dfe5','103b8746-ebd8-41dd-b7fb-a45172e38d18',NULL,500,'RUB',NULL,'hour','number',NULL,NULL,0,0,0,NULL,NULL),(18,1,'beaou-W8qr5yaaYcOudhQ0',NULL,'Математика.',0,NULL,'2016-01-26 00:36:38','2016-01-26 00:36:38','2016-01-26 04:24:25','2016-01-26 04:24:25','2016-01-26 00:36:38',NULL,'','',NULL,NULL,0,1,NULL,'private',0,NULL,NULL,1,NULL,6,1,'c95f444a-b35e-4277-963b-0fedc397dfe5','103b8746-ebd8-41dd-b7fb-a45172e38d18',NULL,130000,'RUB',NULL,'hour','number',NULL,NULL,0,0,0,NULL,NULL),(19,1,'aMGnBEW8yr5yaaYcOudhQ0',NULL,'Подготовлю к ЕГЭ',0,NULL,'2016-01-26 00:48:58','2016-01-26 00:48:58','2016-01-26 04:10:01','2016-01-26 04:10:00','2016-01-26 00:48:58',NULL,'','7-й Марьиной Рощи пр-д, 3, Москва, Россия, 127521',NULL,NULL,0,1,NULL,'private',0,NULL,NULL,1,NULL,6,1,'c95f444a-b35e-4277-963b-0fedc397dfe5','103b8746-ebd8-41dd-b7fb-a45172e38d18',NULL,165000,'RUB',NULL,'hour','number',NULL,NULL,0,0,0,NULL,NULL),(20,2,'dGzDsaVWqr5yafYcOudhQ0',NULL,'Сдам двухкомнатную квартиру',0,NULL,'2016-01-26 05:47:18','2016-01-26 05:47:18','2016-01-26 05:47:18',NULL,'2016-01-26 05:47:18',NULL,'Сдаю квартиру 2-х комнатную.Отдельные комнаты.От соственника.Квартира небольшая но уютная,чистая,хороший ремонт,интернет,стиралка,микроволновка,кондиционер,все есть,есть Балкон. \nрассматриваю славян,приличных,спокойных,платежеспособных,чистоплотных.Рядом есть Атак,еще несколько супермаркетов,аптека,банк,фитнес и т.д.пешком от метро 15 мин.на маршрутке 5 минут,остановка прям возле дома. Квартира сдается с конца января на долгий срок,Стоимость 35000 руб и 35000 за последний месяц.','Фестивальная ул., 13к1с7, Москва, Россия, 125195',NULL,NULL,0,1,NULL,'private',0,NULL,NULL,23,NULL,14,3,'6d73a848-0251-47ec-ad9d-3ad5f5db7558','e312baf3-5d59-42da-aafd-9628981d0ed5',NULL,3500000,'RUB',NULL,'month','number',NULL,NULL,0,0,0,NULL,NULL);
/*!40000 ALTER TABLE `listings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `listing_id` int(11) DEFAULT NULL,
  `person_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_locations_on_community_id` (`community_id`) USING BTREE,
  KEY `index_locations_on_listing_id` (`listing_id`) USING BTREE,
  KEY `index_locations_on_person_id` (`person_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (2,55.799,37.5488,'Красноармейская ул., 8к3, Москва, Россия, 125167','Красноармейская ул., 8к3, Москва, Россия, 125167','2016-01-20 11:09:57','2016-01-20 11:09:57',3,NULL,'origin_loc',NULL),(41,55.8039,37.55,'4-я 8 Марта ул., 6, Москва, Россия, 125167','4-я 8 Марта ул., 6, Москва, Россия, 125167','2016-01-25 23:22:15','2016-01-25 23:22:15',7,NULL,'origin_loc',NULL),(42,55.7969,37.5604,'Мирской пр., Москва, Россия, 127083','Мирской пр., Москва, Россия, 127083','2016-01-25 23:22:27','2016-01-25 23:22:27',17,NULL,'origin_loc',NULL),(43,55.7999,37.6011,'Полковая ул., 1с20, Москва, Россия, 127018','Полковая ул., 1с20, Москва, Россия, 127018','2016-01-25 23:23:24','2016-01-25 23:23:24',13,NULL,'origin_loc',NULL),(44,55.7901,37.5584,'Московская аллея, Москва, Россия, 125167','Московская аллея, Москва, Россия, 125167','2016-01-25 23:23:36','2016-01-25 23:23:36',15,NULL,'origin_loc',NULL),(47,55.7969,37.5604,'Мирской пр., Москва, Россия, 127083','Мирской пр., Москва, Россия, 127083','2016-01-26 00:24:06','2016-01-26 00:24:06',NULL,'dGzDsaVWqr5yafYcOudhQ0','person',NULL),(48,55.8002,37.6107,'7-й Марьиной Рощи пр-д, 3, Москва, Россия, 127521','7-й Марьиной Рощи пр-д, 3, Москва, Россия, 127521','2016-01-26 00:47:24','2016-01-26 00:47:24',NULL,'aMGnBEW8yr5yaaYcOudhQ0','person',NULL),(52,55.7969,37.5604,'Мирской пр., Москва, Россия, 127083','Мирской пр., Москва, Россия, 127083','2016-01-26 03:37:18','2016-01-26 03:37:18',16,NULL,'origin_loc',NULL),(53,55.8002,37.6107,'7-й Марьиной Рощи пр-д, 3, Москва, Россия, 127521','7-й Марьиной Рощи пр-д, 3, Москва, Россия, 127521','2016-01-26 04:10:01','2016-01-26 04:10:01',19,NULL,'origin_loc',NULL),(55,55.856,37.4782,'Фестивальная ул., 13к1с7, Москва, Россия, 125195','Фестивальная ул., 13к1с7, Москва, Россия, 125195','2016-01-26 05:47:19','2016-01-26 05:47:19',20,NULL,'origin_loc',NULL),(56,55.7881,37.693,'Рубцовско-Дворцовая ул., 1/3к9, Москва, Россия, 107014','Рубцовско-Дворцовая ул., 1/3к9, Москва, Россия, 107014','2016-01-26 18:49:33','2016-01-26 18:49:33',5,NULL,'origin_loc',NULL),(57,55.8071,37.5805,'Бутырская ул., 93, Москва, Россия, 127015','Бутырская ул., 93, Москва, Россия, 127015','2016-01-26 18:50:59','2016-01-26 18:50:59',11,NULL,'origin_loc',NULL);
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketplace_plans`
--

DROP TABLE IF EXISTS `marketplace_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketplace_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) NOT NULL,
  `plan_level` int(11) DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_marketplace_plans_on_community_id` (`community_id`) USING BTREE,
  KEY `index_marketplace_plans_on_created_at` (`created_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketplace_plans`
--

LOCK TABLES `marketplace_plans` WRITE;
/*!40000 ALTER TABLE `marketplace_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketplace_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketplace_sender_emails`
--

DROP TABLE IF EXISTS `marketplace_sender_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketplace_sender_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `verification_status` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `verification_requested_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_marketplace_sender_emails_on_community_id` (`community_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketplace_sender_emails`
--

LOCK TABLES `marketplace_sender_emails` WRITE;
/*!40000 ALTER TABLE `marketplace_sender_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketplace_sender_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marketplace_trials`
--

DROP TABLE IF EXISTS `marketplace_trials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marketplace_trials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_marketplace_trials_on_community_id` (`community_id`) USING BTREE,
  KEY `index_marketplace_trials_on_created_at` (`created_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marketplace_trials`
--

LOCK TABLES `marketplace_trials` WRITE;
/*!40000 ALTER TABLE `marketplace_trials` DISABLE KEYS */;
/*!40000 ALTER TABLE `marketplace_trials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_link_translations`
--

DROP TABLE IF EXISTS `menu_link_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_link_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_link_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_menu_link_translations_on_menu_link_id` (`menu_link_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_link_translations`
--

LOCK TABLES `menu_link_translations` WRITE;
/*!40000 ALTER TABLE `menu_link_translations` DISABLE KEYS */;
INSERT INTO `menu_link_translations` VALUES (1,1,'en','http://example.com/en','Eng','2016-01-20 12:45:46','2016-01-20 12:45:46'),(2,1,'ru','http://example.com/ru','Рус','2016-01-20 12:45:46','2016-01-20 12:45:46');
/*!40000 ALTER TABLE `menu_link_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_links`
--

DROP TABLE IF EXISTS `menu_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `sort_priority` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_menu_links_on_community_and_sort` (`community_id`,`sort_priority`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_links`
--

LOCK TABLES `menu_links` WRITE;
/*!40000 ALTER TABLE `menu_links` DISABLE KEYS */;
INSERT INTO `menu_links` VALUES (1,1,'2016-01-20 12:45:46','2016-01-20 12:45:46',0);
/*!40000 ALTER TABLE `menu_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mercury_images`
--

DROP TABLE IF EXISTS `mercury_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mercury_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mercury_images`
--

LOCK TABLES `mercury_images` WRITE;
/*!40000 ALTER TABLE `mercury_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `mercury_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_messages_on_conversation_id` (`conversation_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'ad0vC-VWGr5yaaYcOudhQ0','123','2016-01-20 18:37:27','2016-01-20 18:37:27',1),(2,'dGzDsaVWqr5yafYcOudhQ0','huh?','2016-01-20 22:42:51','2016-01-20 22:42:51',1);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_permissions`
--

DROP TABLE IF EXISTS `order_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_account_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `request_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_username_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verification_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `onboarding_id` varchar(36) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions_granted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_permissions`
--

LOCK TABLES `order_permissions` WRITE;
/*!40000 ALTER TABLE `order_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participations`
--

DROP TABLE IF EXISTS `participations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `is_starter` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_sent_at` datetime DEFAULT NULL,
  `last_received_at` datetime DEFAULT NULL,
  `feedback_skipped` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_participations_on_conversation_id` (`conversation_id`) USING BTREE,
  KEY `index_participations_on_person_id` (`person_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participations`
--

LOCK TABLES `participations` WRITE;
/*!40000 ALTER TABLE `participations` DISABLE KEYS */;
INSERT INTO `participations` VALUES (1,'dGzDsaVWqr5yafYcOudhQ0',1,1,0,'2016-01-20 18:37:27','2016-01-20 22:42:51','2016-01-20 22:42:51',NULL,0),(2,'ad0vC-VWGr5yaaYcOudhQ0',1,0,1,'2016-01-20 18:37:27','2016-01-20 22:42:51',NULL,'2016-01-20 22:42:51',0);
/*!40000 ALTER TABLE `participations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_gateways`
--

DROP TABLE IF EXISTS `payment_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_gateways` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `braintree_environment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `braintree_merchant_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `braintree_master_merchant_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `braintree_public_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `braintree_private_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `braintree_client_side_encryption_key` text COLLATE utf8_unicode_ci,
  `checkout_environment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkout_user_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkout_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_gateways`
--

LOCK TABLES `payment_gateways` WRITE;
/*!40000 ALTER TABLE `payment_gateways` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_rows`
--

DROP TABLE IF EXISTS `payment_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_rows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` int(11) DEFAULT NULL,
  `vat` int(11) DEFAULT NULL,
  `sum_cents` int(11) DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_payment_rows_on_payment_id` (`payment_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_rows`
--

LOCK TABLES `payment_rows` WRITE;
/*!40000 ALTER TABLE `payment_rows` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_settings`
--

DROP TABLE IF EXISTS `payment_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `community_id` int(11) NOT NULL,
  `payment_gateway` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_process` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commission_from_seller` int(11) DEFAULT NULL,
  `minimum_price_cents` int(11) DEFAULT NULL,
  `minimum_transaction_fee_cents` int(11) DEFAULT NULL,
  `confirmation_after_days` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_payment_settings_on_community_id` (`community_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_settings`
--

LOCK TABLES `payment_settings` WRITE;
/*!40000 ALTER TABLE `payment_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payer_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `recipient_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `community_id` int(11) DEFAULT NULL,
  `payment_gateway_id` int(11) DEFAULT NULL,
  `sum_cents` int(11) DEFAULT NULL,
  `currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'CheckoutPayment',
  `braintree_transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_payments_on_payer_id` (`payer_id`) USING BTREE,
  KEY `index_payments_on_conversation_id` (`transaction_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_accounts`
--

DROP TABLE IF EXISTS `paypal_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `community_id` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payer_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `active` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_paypal_accounts_on_community_id` (`community_id`) USING BTREE,
  KEY `index_paypal_accounts_on_payer_id` (`payer_id`) USING BTREE,
  KEY `index_paypal_accounts_on_person_id` (`person_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_accounts`
--

LOCK TABLES `paypal_accounts` WRITE;
/*!40000 ALTER TABLE `paypal_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_ipn_messages`
--

DROP TABLE IF EXISTS `paypal_ipn_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_ipn_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` text COLLATE utf8_unicode_ci,
  `status` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_ipn_messages`
--

LOCK TABLES `paypal_ipn_messages` WRITE;
/*!40000 ALTER TABLE `paypal_ipn_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_ipn_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_payments`
--

DROP TABLE IF EXISTS `paypal_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `payer_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `receiver_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `merchant_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `currency` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `order_total_cents` int(11) DEFAULT NULL,
  `authorization_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authorization_date` datetime DEFAULT NULL,
  `authorization_expires_date` datetime DEFAULT NULL,
  `authorization_total_cents` int(11) DEFAULT NULL,
  `payment_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_total_cents` int(11) DEFAULT NULL,
  `fee_total_cents` int(11) DEFAULT NULL,
  `payment_status` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `pending_reason` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `commission_payment_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commission_payment_date` datetime DEFAULT NULL,
  `commission_status` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'not_charged',
  `commission_pending_reason` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commission_total_cents` int(11) DEFAULT NULL,
  `commission_fee_total_cents` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_paypal_payments_on_transaction_id` (`transaction_id`) USING BTREE,
  UNIQUE KEY `index_paypal_payments_on_authorization_id` (`authorization_id`) USING BTREE,
  UNIQUE KEY `index_paypal_payments_on_order_id` (`order_id`) USING BTREE,
  KEY `index_paypal_payments_on_community_id` (`community_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_payments`
--

LOCK TABLES `paypal_payments` WRITE;
/*!40000 ALTER TABLE `paypal_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_process_tokens`
--

DROP TABLE IF EXISTS `paypal_process_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_process_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_token` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `community_id` int(11) NOT NULL,
  `transaction_id` int(11) NOT NULL,
  `op_completed` tinyint(1) NOT NULL DEFAULT '0',
  `op_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `op_input` text COLLATE utf8_unicode_ci,
  `op_output` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_paypal_process_tokens_on_process_token` (`process_token`) USING BTREE,
  UNIQUE KEY `index_paypal_process_tokens_on_transaction` (`transaction_id`,`community_id`,`op_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_process_tokens`
--

LOCK TABLES `paypal_process_tokens` WRITE;
/*!40000 ALTER TABLE `paypal_process_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_process_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_refunds`
--

DROP TABLE IF EXISTS `paypal_refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_refunds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paypal_payment_id` int(11) DEFAULT NULL,
  `currency` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_total_cents` int(11) DEFAULT NULL,
  `fee_total_cents` int(11) DEFAULT NULL,
  `refunding_id` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_paypal_refunds_on_refunding_id` (`refunding_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_refunds`
--

LOCK TABLES `paypal_refunds` WRITE;
/*!40000 ALTER TABLE `paypal_refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_tokens`
--

DROP TABLE IF EXISTS `paypal_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) NOT NULL,
  `token` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `payment_action` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `merchant_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `receiver_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `item_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_quantity` int(11) DEFAULT NULL,
  `item_price_cents` int(11) DEFAULT NULL,
  `currency` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `express_checkout_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shipping_total_cents` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_paypal_tokens_on_token` (`token`) USING BTREE,
  KEY `index_paypal_tokens_on_community_id` (`community_id`) USING BTREE,
  KEY `index_paypal_tokens_on_transaction_id` (`transaction_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_tokens`
--

LOCK TABLES `paypal_tokens` WRITE;
/*!40000 ALTER TABLE `paypal_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `people` (
  `id` varchar(22) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_admin` int(11) DEFAULT '0',
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'fi',
  `preferences` text COLLATE utf8_unicode_ci,
  `active_days_count` int(11) DEFAULT '0',
  `last_page_load_date` datetime DEFAULT NULL,
  `test_group_number` int(11) DEFAULT '1',
  `active` tinyint(1) DEFAULT '1',
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_salt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `given_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `family_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `image_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_content_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `image_processing` tinyint(1) DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authentication_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `community_updates_last_sent_at` datetime DEFAULT NULL,
  `min_days_between_community_updates` int(11) DEFAULT '1',
  `is_organization` tinyint(1) DEFAULT NULL,
  `organization_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `education` text COLLATE utf8_unicode_ci,
  `experience` text COLLATE utf8_unicode_ci,
  `facts` text COLLATE utf8_unicode_ci,
  `skype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `additional` text COLLATE utf8_unicode_ci,
  UNIQUE KEY `index_people_on_email` (`email`) USING BTREE,
  UNIQUE KEY `index_people_on_facebook_id` (`facebook_id`) USING BTREE,
  UNIQUE KEY `index_people_on_reset_password_token` (`reset_password_token`) USING BTREE,
  UNIQUE KEY `index_people_on_username` (`username`) USING BTREE,
  KEY `index_people_on_authentication_token` (`authentication_token`) USING BTREE,
  KEY `index_people_on_id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES ('dGzDsaVWqr5yafYcOudhQ0','2016-01-19 23:32:17','2016-01-26 08:22:26',0,'en','---\nemail_about_new_messages: true\nemail_about_new_comments_to_own_listing: true\nemail_when_conversation_accepted: true\nemail_when_conversation_rejected: true\nemail_about_new_received_testimonials: true\nemail_about_accept_reminders: true\nemail_about_confirm_reminders: true\nemail_about_testimonial_reminders: true\nemail_about_completed_transactions: true\nemail_about_new_payments: true\nemail_about_payment_reminders: true\nemail_about_new_listings_by_followed_people: true\nemail_from_admins: true\n',0,NULL,4,1,'ruslank',NULL,'$2a$10$zkRbHb9JEOMdWp5k0OXdqu4wKeahwhMAbNk11i91xbfU3pD8/uBJi',NULL,NULL,NULL,20,'2016-01-26 08:22:26','2016-01-26 04:54:04','127.0.0.1','127.0.0.1',NULL,'Ruslan','Kornev','','Лучшие стандарты качества преподавания биологии. Каждая минута занятия переполнена целью. Постоянная оптимизация и контроль качества обучения. Части содержания предмета связаны понятными логическими переходами. Ученики получают доступ к уникальной авторской системе заданий онлайн и могут повышать свои результаты сами.',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,7,0,NULL,0,'МПГУ, факультет переподготовки специалистов по практической психологии, специальность – практический психолог (2011 г.).\r\nКурский государственный педагогический университет, естественно-географический факультет, специальность – учитель биологии (2002 г.).\r\nОбразование: Рурский университет Германии (Ruhr-Universität Bochum), факультет биологии и биотехнологии, программа – биология.','Опыт преподавания – с 2007 года (учитель биологии в школе, г. Москва).','Сертификат Higher Intermediate (KIC Oxford).\r\nКурс Intensive English в Оксфорде (Великобритания, Kaplan International College Oxford).\r\n«Интервью с репетитором по биологии Вадимом Ярославцевым».\r\nПрофессиональный репетитор по биологии с государственной регистрацией.',NULL,'Олимпиады, ГИА, ЕГЭ по биологии, внутренний экзамен по биологии в МГУ, экстернат, медицинские классы, углубленное изучение биологии.'),('ad0vC-VWGr5yaaYcOudhQ0','2016-01-19 23:54:45','2016-01-20 18:38:06',0,'en','---\nemail_about_new_messages: true\nemail_about_new_comments_to_own_listing: true\nemail_when_conversation_accepted: true\nemail_when_conversation_rejected: true\nemail_about_new_received_testimonials: true\nemail_about_accept_reminders: true\nemail_about_confirm_reminders: true\nemail_about_testimonial_reminders: true\nemail_about_completed_transactions: true\nemail_about_new_payments: true\nemail_about_payment_reminders: true\nemail_about_new_listings_by_followed_people: true\nemail_from_admins: true\n',0,NULL,4,1,'woto',NULL,'$2a$10$yzPaRcoCU05V/B9LVnkZluUgAc6gTEkUd1MZ2FPodhKeYCg4dMPbe',NULL,NULL,NULL,5,'2016-01-20 18:38:06','2016-01-20 18:37:53','127.0.0.1','127.0.0.1',NULL,'1','1',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,7,0,NULL,0,NULL,NULL,NULL,NULL,NULL),('dWXZjCWJWr5yaaYcOudhQ0','2016-01-24 01:51:09','2016-01-24 02:13:13',0,'en','---\nemail_about_new_messages: true\nemail_about_new_comments_to_own_listing: true\nemail_when_conversation_accepted: true\nemail_when_conversation_rejected: true\nemail_about_new_received_testimonials: true\nemail_about_accept_reminders: true\nemail_about_confirm_reminders: true\nemail_about_testimonial_reminders: true\nemail_about_completed_transactions: true\nemail_about_new_payments: true\nemail_about_payment_reminders: true\nemail_about_new_listings_by_followed_people: true\nemail_from_admins: true\n',0,NULL,1,1,'user1',NULL,'$2a$10$nGAwBC7B.7kq3e5SzDkmreslqVDoAWbTZglA/mH79/iNb0TEbXf9e',NULL,NULL,NULL,1,'2016-01-24 01:51:10','2016-01-24 01:51:10','127.0.0.1','127.0.0.1',NULL,'user1','user1','','Дифференцирование, построение графиков функций, нахождение экстремумов функций, пределы, определенный и неопределенный интеграл.',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,7,0,NULL,0,'Образование: РУДН, физико-математический факультет, специальность – прикладная математика.\r\nФакультет иностранных языков, квалификация – переводчик французского языка (магистр, 2006 г.).','Педагогический стаж – с 2006 года (РУДН, дискретная математика, математическая логика, теория графов, комбинаторика, научное программирование). \r\nРепетиторская деятельность – с 2006 года.','Курсы испанского языка в Мексике (6 месяцев).\r\nКурсы Language Link – английский язык, сертификат Upper Intermediate.\r\nДиплом по испанскому языку DELE.',NULL,NULL),('aT_MigWUqr5yaaYcOudhQ0','2016-01-24 21:48:18','2016-01-24 21:49:04',0,'en','---\nemail_about_new_messages: true\nemail_about_new_comments_to_own_listing: true\nemail_when_conversation_accepted: true\nemail_when_conversation_rejected: true\nemail_about_new_received_testimonials: true\nemail_about_accept_reminders: true\nemail_about_confirm_reminders: true\nemail_about_testimonial_reminders: true\nemail_about_completed_transactions: true\nemail_about_new_payments: true\nemail_about_payment_reminders: true\nemail_about_new_listings_by_followed_people: true\nemail_from_admins: true\n',0,NULL,3,1,'111',NULL,'$2a$10$9whqjyYggnNtsjraVMHEiuzMNaJc0Q22JJ8TlrLkjPrto0xOPGMQy',NULL,NULL,NULL,1,'2016-01-24 21:48:18','2016-01-24 21:48:18','127.0.0.1','127.0.0.1',NULL,'1','1',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,7,0,NULL,0,NULL,NULL,NULL,NULL,NULL),('b-HEA0WUGr5yaaYcOudhQ0','2016-01-24 22:19:11','2016-01-24 22:22:29',0,'en','---\nemail_about_new_messages: true\nemail_about_new_comments_to_own_listing: true\nemail_when_conversation_accepted: true\nemail_when_conversation_rejected: true\nemail_about_new_received_testimonials: true\nemail_about_accept_reminders: true\nemail_about_confirm_reminders: true\nemail_about_testimonial_reminders: true\nemail_about_completed_transactions: true\nemail_about_new_payments: true\nemail_about_payment_reminders: true\nemail_about_new_listings_by_followed_people: true\nemail_from_admins: true\n',0,NULL,1,1,'zzz',NULL,'',NULL,NULL,NULL,1,'2016-01-24 22:19:11','2016-01-24 22:19:11','127.0.0.1','127.0.0.1',NULL,'','',NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,7,0,NULL,0,NULL,NULL,NULL,NULL,NULL),('bY9fpaWUKr5yaaYcOudhQ0','2016-01-24 22:26:01','2016-01-24 22:30:30',0,'en','---\nemail_about_new_messages: true\nemail_about_new_comments_to_own_listing: true\nemail_when_conversation_accepted: true\nemail_when_conversation_rejected: true\nemail_about_new_received_testimonials: true\nemail_about_accept_reminders: true\nemail_about_confirm_reminders: true\nemail_about_testimonial_reminders: true\nemail_about_completed_transactions: true\nemail_about_new_payments: true\nemail_about_payment_reminders: true\nemail_about_new_listings_by_followed_people: true\nemail_from_admins: true\n',0,NULL,2,1,'fake2',NULL,'$2a$10$6bfNio/FFTUva/78bSBeeOgO.sczbEodftAdfSBYyKlM14xBiOi/O',NULL,NULL,NULL,1,'2016-01-24 22:26:01','2016-01-24 22:26:01','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,7,0,NULL,0,NULL,NULL,NULL,NULL,NULL),('b8SMhgWUOr5yaaYcOudhQ0','2016-01-24 22:33:27','2016-01-24 22:36:06',0,'en','---\nemail_about_new_messages: true\nemail_about_new_comments_to_own_listing: true\nemail_when_conversation_accepted: true\nemail_when_conversation_rejected: true\nemail_about_new_received_testimonials: true\nemail_about_accept_reminders: true\nemail_about_confirm_reminders: true\nemail_about_testimonial_reminders: true\nemail_about_completed_transactions: true\nemail_about_new_payments: true\nemail_about_payment_reminders: true\nemail_about_new_listings_by_followed_people: true\nemail_from_admins: true\n',0,NULL,2,1,'fake3',NULL,'$2a$10$MRelIGuj7CxXooU2vM59hukcGFvR3L3v8hDjZ67AaSlu79Pz3vY.C',NULL,NULL,NULL,1,'2016-01-24 22:33:27','2016-01-24 22:33:27','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,7,0,NULL,0,NULL,NULL,NULL,NULL,NULL),('c9EH-CWXer5yafYcOudhQ0','2016-01-25 03:14:26','2016-01-25 03:15:20',0,'en','---\nemail_about_new_messages: true\nemail_about_new_comments_to_own_listing: true\nemail_when_conversation_accepted: true\nemail_when_conversation_rejected: true\nemail_about_new_received_testimonials: true\nemail_about_accept_reminders: true\nemail_about_confirm_reminders: true\nemail_about_testimonial_reminders: true\nemail_about_completed_transactions: true\nemail_about_new_payments: true\nemail_about_payment_reminders: true\nemail_about_new_listings_by_followed_people: true\nemail_from_admins: true\n',0,NULL,1,1,'fake7',NULL,'$2a$10$zExlxP5awIXVN.xjoAxbc.EHZOz76/2QoEvFddAh/C/CRQQh9/MD.',NULL,NULL,NULL,1,'2016-01-25 03:14:26','2016-01-25 03:14:26','127.0.0.1','127.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,7,1,NULL,0,NULL,NULL,NULL,NULL,NULL),('beaou-W8qr5yaaYcOudhQ0','2016-01-26 00:32:22','2016-01-26 04:08:55',0,'en','---\nemail_about_new_messages: true\nemail_about_new_comments_to_own_listing: true\nemail_when_conversation_accepted: true\nemail_when_conversation_rejected: true\nemail_about_new_received_testimonials: true\nemail_about_accept_reminders: true\nemail_about_confirm_reminders: true\nemail_about_testimonial_reminders: true\nemail_about_completed_transactions: true\nemail_about_new_payments: true\nemail_about_payment_reminders: true\nemail_about_new_listings_by_followed_people: true\nemail_from_admins: true\n',0,NULL,4,1,'fake111',NULL,'$2a$10$j.883ioZ2Qp9DVhPQPU08Owhbcph0mv5FWF.1CjBqtRCsVm3Lm4Gy',NULL,NULL,NULL,2,'2016-01-26 04:08:55','2016-01-26 00:32:22','127.0.0.1','127.0.0.1',NULL,'Юрий ','Сычев','','Свои занятия провожу только индивидуально. Через 1-2 занятия устанавливаю степень подготовленности ученика на настоящий момент. Вырабатывается дальнейшая стратегия проведения уроков по устранению слабых мест, углубления понимания проходимого учебного материала. Добиваюсь более легкого усвоения школьной программы по своим методикам, проверенным многолетней практикой. В результате повышается успеваемость ученика, что является необходимым условием подготовки к успешной сдаче ОГЭ и ЕГЭ на высокий балл. В дальнейшем это будет хорошим фундаментом в изучении математики и физики в высшей школе.','SychevUD_1571cde6.jpg-c130x174.jpg','image/jpeg',6900,'2016-01-26 00:38:46',0,NULL,NULL,NULL,7,NULL,NULL,0,'Образование: Артиллерийская радиотехническая академия им. маршала Л.А. Говорова (г. Харьков), факультет – кибернетики, специальность – средства автоматизации управления и электронно-вычислительные устройства (1966 г.).','Репетиторская деятельность – с 1985 года.\r\nОпыт преподавания – с 1966 года по 1978 год (МГУ им. М.В. Ломоносова, на военной кафедре, преподаватель механико-математического факультета (теория вероятностей, линейного программирования). \r\nПреподаватель на факультетах ВМК и экономическом (исследование операций и системного анализа)).','Кандидат технических наук (1975 г.).\r\nДиссертация защищена в АН СССР (1975 г.).',NULL,''),('aMGnBEW8yr5yaaYcOudhQ0','2016-01-26 00:45:52','2016-01-26 04:12:39',0,'en','---\nemail_about_new_messages: true\nemail_about_new_comments_to_own_listing: true\nemail_when_conversation_accepted: true\nemail_when_conversation_rejected: true\nemail_about_new_received_testimonials: true\nemail_about_accept_reminders: true\nemail_about_confirm_reminders: true\nemail_about_testimonial_reminders: true\nemail_about_completed_transactions: true\nemail_about_new_payments: true\nemail_about_payment_reminders: true\nemail_about_new_listings_by_followed_people: true\nemail_from_admins: true\n',0,NULL,4,1,'fake112',NULL,'$2a$10$MCvKCdXntw7GaTx0Ibtz4eZgZnKoGbBYWac0wdSsbRDDkZ3jVvEBq',NULL,NULL,NULL,2,'2016-01-26 04:09:34','2016-01-26 00:45:52','127.0.0.1','127.0.0.1',NULL,'Диана','Ермакова','','Уважаемые ученики и родители! \r\nИдет запись на 2015-2016 учебный год, подготовка к ЕГЭ: 10, 11 классы, выпускники прошлых лет (только профильный ЕГЭ). \r\nНа утренние места скидки – 1500 руб. / 90 мин.','ErmakovaDV_b731c9ec.jpg-c130x174.jpg','image/jpeg',6971,'2016-01-26 00:47:27',0,NULL,NULL,NULL,7,NULL,NULL,0,'Образование: Московский государственный институт электронной техники, факультет электронных технологий и материалов (физико-химический факультет), специальность – твердотельная электроника и микроэлектроника (диплом с отличием, 2004 г.).','Репетиторская деятельность – с 2008 года.','Результат ЕГЭ по математике – 94 балла (2013 г.).\r\nКурс «Введение в математический анализ», НОУ «Интуит» (2013-2014 гг.).',NULL,'Алгебра, геометрия; ЕГЭ по математике.');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_setting_translations`
--

DROP TABLE IF EXISTS `profile_setting_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_setting_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_setting_id` int(11) DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_profile_setting_translations_on_profile_setting_id` (`profile_setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_setting_translations`
--

LOCK TABLES `profile_setting_translations` WRITE;
/*!40000 ALTER TABLE `profile_setting_translations` DISABLE KEYS */;
INSERT INTO `profile_setting_translations` VALUES (1,1,'en','bbb','2016-01-24 20:04:13','2016-01-24 20:04:13'),(2,2,'en','ccc','2016-01-24 20:08:02','2016-01-24 20:08:02'),(3,3,'en','English','2016-01-24 20:09:45','2016-01-24 20:09:45'),(4,3,'ru','Russian','2016-01-24 20:09:45','2016-01-24 20:09:45'),(5,4,'en','','2016-01-24 20:10:48','2016-01-24 20:10:48'),(6,4,'ru','Места выдачи товаров','2016-01-24 20:10:48','2016-01-24 20:10:48'),(7,5,'en','Education','2016-01-24 20:46:46','2016-01-24 20:46:46'),(8,5,'ru','Образование','2016-01-24 20:46:46','2016-01-24 20:46:46'),(9,6,'en','Eperience','2016-01-24 20:47:54','2016-01-24 20:47:54'),(10,6,'ru','Опыт','2016-01-24 20:47:54','2016-01-24 20:47:54'),(11,7,'en','bbb','2016-01-24 20:58:37','2016-01-24 20:58:37'),(12,7,'ru','ccc','2016-01-24 20:58:37','2016-01-24 20:58:37');
/*!40000 ALTER TABLE `profile_setting_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_settings`
--

DROP TABLE IF EXISTS `profile_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_profile_settings_on_community_id` (`community_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_settings`
--

LOCK TABLES `profile_settings` WRITE;
/*!40000 ALTER TABLE `profile_settings` DISABLE KEYS */;
INSERT INTO `profile_settings` VALUES (1,1,'2016-01-24 20:04:13','2016-01-24 20:04:13'),(2,1,'2016-01-24 20:08:02','2016-01-24 20:08:02'),(3,1,'2016-01-24 20:09:45','2016-01-24 20:09:45'),(4,1,'2016-01-24 20:10:48','2016-01-24 20:10:48'),(5,1,'2016-01-24 20:46:46','2016-01-24 20:46:46'),(6,1,'2016-01-24 20:47:54','2016-01-24 20:47:54'),(7,1,'2016-01-24 20:58:37','2016-01-24 20:58:37');
/*!40000 ALTER TABLE `profile_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prospect_emails`
--

DROP TABLE IF EXISTS `prospect_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prospect_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prospect_emails`
--

LOCK TABLES `prospect_emails` WRITE;
/*!40000 ALTER TABLE `prospect_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `prospect_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20080806070738'),('20080807071903'),('20080807080513'),('20080808095031'),('20080815075550'),('20080818091109'),('20080818092139'),('20080821103835'),('20080825064927'),('20080825114546'),('20080828104013'),('20080828104239'),('20080919122825'),('20080925100643'),('20080925100743'),('20080925103547'),('20080925103759'),('20080925112423'),('20080925114309'),('20080929102121'),('20081008115110'),('20081009160751'),('20081010114150'),('20081024154431'),('20081024182346'),('20081024183444'),('20081103092143'),('20081104070403'),('20081118145857'),('20081121084337'),('20081202140109'),('20081205142238'),('20081215145238'),('20081216060503'),('20090119114525'),('20090218112317'),('20090219094209'),('20090225073742'),('20090323121824'),('20090330064443'),('20090330070210'),('20090330072036'),('20090401181848'),('20090401184511'),('20090401185039'),('20090402144456'),('20090403093157'),('20090406081353'),('20090414142556'),('20090415085812'),('20090415130553'),('20090415131023'),('20090424093506'),('20090424100145'),('20090618112730'),('20090629113838'),('20090629131727'),('20090701065350'),('20090701110931'),('20090713130351'),('20090729124418'),('20090730093917'),('20090730094216'),('20090731134028'),('20090821075949'),('20090904120242'),('20090907155717'),('20091006112446'),('20091028095545'),('20091028131201'),('20091109161516'),('20100322132547'),('20100505110646'),('20100707105549'),('20100721120037'),('20100721123825'),('20100721124444'),('20100726071811'),('20100727102551'),('20100727103659'),('20100729112458'),('20100729124210'),('20100729141955'),('20100729142416'),('20100730120601'),('20100730132825'),('20100809090550'),('20100809120502'),('20100813161213'),('20100817115816'),('20100818102743'),('20100819114104'),('20100820122449'),('20100902135234'),('20100902142325'),('20100908112841'),('20100909105810'),('20100909114132'),('20100920075651'),('20100921155612'),('20100922081110'),('20100922102321'),('20100922122740'),('20100923074241'),('20100927150547'),('20101007131610'),('20101007131827'),('20101013115208'),('20101013124056'),('20101026082126'),('20101027103753'),('20101028151541'),('20101103154108'),('20101103161641'),('20101103163019'),('20101109131431'),('20101116105410'),('20101124104905'),('20101125150638'),('20101126093026'),('20101201105920'),('20101201133429'),('20101203115308'),('20101203115634'),('20101213152125'),('20101216150725'),('20101216151447'),('20101216152952'),('20110308172759'),('20110308192757'),('20110321103604'),('20110322141439'),('20110322151957'),('20110325120932'),('20110412075940'),('20110414105702'),('20110414124938'),('20110421075758'),('20110428134543'),('20110529110417'),('20110629135331'),('20110704123058'),('20110704144650'),('20110707163036'),('20110728110124'),('20110808110217'),('20110808161514'),('20110817123457'),('20110819111416'),('20110819123636'),('20110909072646'),('20110912061834'),('20110912064526'),('20110912065222'),('20110913080622'),('20110914080549'),('20110914115824'),('20110915084232'),('20110915101535'),('20111111140246'),('20111111154416'),('20111111162432'),('20111114122125'),('20111114122315'),('20111116144337'),('20111116164728'),('20111116182825'),('20111123071116'),('20111123071850'),('20111124174508'),('20111210165312'),('20111210165854'),('20111210170231'),('20111211175403'),('20111228153911'),('20120104224115'),('20120105162140'),('20120113091548'),('20120121091558'),('20120206052931'),('20120208145336'),('20120210171827'),('20120303113202'),('20120303125412'),('20120303152837'),('20120303172713'),('20120510094327'),('20120510175152'),('20120514001557'),('20120514050302'),('20120516204538'),('20120518203511'),('20120522162329'),('20120522183329'),('20120526021050'),('20120614052244'),('20120625211426'),('20120628121713'),('20120704072606'),('20120705135703'),('20120705140109'),('20120710084323'),('20120711140918'),('20120718031225'),('20120730024756'),('20120907010347'),('20120907023525'),('20120908052908'),('20120909143322'),('20120929084903'),('20120929091629'),('20121023050946'),('20121105115053'),('20121203142830'),('20121212145626'),('20121214083430'),('20121218125831'),('20121220133808'),('20121229224803'),('20130103081705'),('20130103125240'),('20130103145816'),('20130104071929'),('20130104122958'),('20130105153450'),('20130107095027'),('20130110222425'),('20130123163722'),('20130123164653'),('20130124150000'),('20130208085827'),('20130212104852'),('20130213150133'),('20130213160145'),('20130217121320'),('20130218070405'),('20130305095824'),('20130306172327'),('20130309142322'),('20130317162509'),('20130318083721'),('20130318084043'),('20130318085152'),('20130319162158'),('20130319163113'),('20130320093549'),('20130322171458'),('20130323143126'),('20130325143038'),('20130325153817'),('20130325161150'),('20130325165508'),('20130325174608'),('20130325181741'),('20130326160252'),('20130328124654'),('20130328155825'),('20130329080756'),('20130329081612'),('20130331095134'),('20130331144047'),('20130331200801'),('20130405114540'),('20130418172231'),('20130418173835'),('20130423173017'),('20130424180017'),('20130424183653'),('20130425140120'),('20130514214222'),('20130517133311'),('20130520092054'),('20130520092357'),('20130520103753'),('20130520125924'),('20130520140756'),('20130520172713'),('20130521122031'),('20130521124342'),('20130521171401'),('20130521225614'),('20130531072349'),('20130605074725'),('20130607165451'),('20130710084408'),('20130718104939'),('20130719093816'),('20130719113330'),('20130724065048'),('20130724070139'),('20130729081847'),('20130807083847'),('20130815072527'),('20130815073546'),('20130815075659'),('20130815101112'),('20130823110113'),('20130902140027'),('20130910133213'),('20130917094727'),('20130920121927'),('20130925071631'),('20130925081815'),('20130926070322'),('20130926121237'),('20130930080143'),('20131024081428'),('20131028110133'),('20131028154626'),('20131028183014'),('20131030130320'),('20131031072301'),('20131031093809'),('20131101183938'),('20131104090808'),('20131107124835'),('20131107125413'),('20131108091824'),('20131108113632'),('20131108113650'),('20131111140902'),('20131112115307'),('20131112115308'),('20131112115435'),('20131114112955'),('20131119085439'),('20131119085625'),('20131122175753'),('20131126113141'),('20131126131750'),('20131126134024'),('20131126184439'),('20131128074254'),('20131128074910'),('20131128094614'),('20131128094758'),('20131128094839'),('20131128103251'),('20131128143205'),('20131129095727'),('20131202140547'),('20131203072124'),('20131204091623'),('20131204103910'),('20131206163837'),('20131209073416'),('20131209133946'),('20131210155502'),('20131212065037'),('20131214142413'),('20131214143004'),('20131214143005'),('20131220084742'),('20131220104804'),('20131220104805'),('20131227080454'),('20131227081256'),('20140102125702'),('20140102141643'),('20140102144755'),('20140102145633'),('20140102150134'),('20140102153949'),('20140103084331'),('20140103131350'),('20140106114557'),('20140109091819'),('20140109093432'),('20140109143257'),('20140109190928'),('20140116131654'),('20140123141906'),('20140124095930'),('20140124141214'),('20140128094422'),('20140128094642'),('20140128095047'),('20140129081030'),('20140204082210'),('20140205092212'),('20140205101011'),('20140205121010'),('20140206103152'),('20140207133412'),('20140219160247'),('20140219162023'),('20140222080916'),('20140223190922'),('20140223202734'),('20140223210213'),('20140224150322'),('20140224151953'),('20140225143012'),('20140226074348'),('20140226074445'),('20140226074710'),('20140226074751'),('20140226121423'),('20140227102627'),('20140228164206'),('20140228164428'),('20140228165024'),('20140301074143'),('20140303131213'),('20140304135448'),('20140306083247'),('20140312145533'),('20140312150455'),('20140314132659'),('20140318131351'),('20140319182117'),('20140324073247'),('20140328124957'),('20140328133415'),('20140402070713'),('20140402070714'),('20140411121926'),('20140415092507'),('20140415093234'),('20140417084647'),('20140417085905'),('20140417162548'),('20140417235732'),('20140422120515'),('20140425080207'),('20140425080603'),('20140425080731'),('20140425081001'),('20140425111235'),('20140428132517'),('20140428134415'),('20140507104933'),('20140507105154'),('20140509115747'),('20140512062911'),('20140516095154'),('20140519102507'),('20140519123344'),('20140519132638'),('20140519164823'),('20140523082452'),('20140526064017'),('20140530105841'),('20140530115044'),('20140530115433'),('20140604075725'),('20140604135743'),('20140610115132'),('20140610115217'),('20140611094552'),('20140611094703'),('20140612084036'),('20140613132734'),('20140623112935'),('20140701081453'),('20140701135724'),('20140701140655'),('20140703074142'),('20140703075424'),('20140710125950'),('20140710131146'),('20140711094414'),('20140724084559'),('20140724093459'),('20140724123125'),('20140805102757'),('20140811133602'),('20140811133603'),('20140811133605'),('20140811133606'),('20140811144528'),('20140812065415'),('20140815055023'),('20140815085018'),('20140819054528'),('20140819134039'),('20140819134055'),('20140820132249'),('20140829075839'),('20140829113807'),('20140901082541'),('20140901130206'),('20140902095905'),('20140903111344'),('20140903112203'),('20140903120109'),('20140909074331'),('20140912084032'),('20140912115758'),('20140925093828'),('20140925095608'),('20140925111706'),('20140925112419'),('20140929090537'),('20140930064120'),('20140930064130'),('20140930064140'),('20140930064150'),('20140930064160'),('20140930064170'),('20140930064180'),('20140930064185'),('20140930064190'),('20140930064200'),('20140930074731'),('20140930083026'),('20141001065955'),('20141001070716'),('20141001113744'),('20141003113756'),('20141006100239'),('20141006114330'),('20141007144442'),('20141009083833'),('20141015062240'),('20141015071419'),('20141015080454'),('20141015135248'),('20141015135601'),('20141015150328'),('20141017080930'),('20141020113323'),('20141020225349'),('20141022084419'),('20141022190428'),('20141023120743'),('20141023141235'),('20141023150700'),('20141028080346'),('20141028104522'),('20141028104537'),('20141029090632'),('20141029121848'),('20141029121945'),('20141030140809'),('20141102192640'),('20141104213501'),('20141111183125'),('20141112131736'),('20141113204444'),('20141117165348'),('20141203095726'),('20141204084648'),('20141205094929'),('20141216132850'),('20141216132851'),('20141217152335'),('20141218082446'),('20141219205556'),('20141222130455'),('20150103143459'),('20150107155205'),('20150116125629'),('20150121124432'),('20150121130521'),('20150128113129'),('20150202112254'),('20150204124735'),('20150204124802'),('20150205155400'),('20150205155519'),('20150206125017'),('20150206151234'),('20150212125111'),('20150213091223'),('20150213092629'),('20150213094110'),('20150224140913'),('20150225081656'),('20150225082144'),('20150225122608'),('20150226124214'),('20150226130928'),('20150226131628'),('20150303134630'),('20150303140556'),('20150304074313'),('20150304084451'),('20150311073502'),('20150311100232'),('20150311111824'),('20150311113118'),('20150316084339'),('20150316135852'),('20150316140016'),('20150316140637'),('20150316151552'),('20150316173800'),('20150317080017'),('20150317122824'),('20150317142931'),('20150319121616'),('20150320091305'),('20150320144657'),('20150323085034'),('20150323152147'),('20150324072928'),('20150324112018'),('20150324112042'),('20150324112053'),('20150324112658'),('20150324114726'),('20150325164209'),('20150327075649'),('20150330072934'),('20150330093441'),('20150330094735'),('20150331103317'),('20150331105616'),('20150331112417'),('20150401071256'),('20150401072129'),('20150401140830'),('20150402090934'),('20150402111115'),('20150403101215'),('20150407123639'),('20150407124816'),('20150407130810'),('20150407131139'),('20150413104519'),('20150413134627'),('20150415092447'),('20150416112541'),('20150416134422'),('20150420072530'),('20150420083201'),('20150426113955'),('20150429155804'),('20150507082447'),('20150507084754'),('20150507165715'),('20150508141500'),('20150512082544'),('20150512083212'),('20150512083411'),('20150512083842'),('20150518120830'),('20150518123758'),('20150519124846'),('20150520104604'),('20150520130243'),('20150520131057'),('20150527091815'),('20150527133928'),('20150528120338'),('20150528120717'),('20150608135024'),('20150608140024'),('20150608144130'),('20150609084012'),('20150612104320'),('20150622080657'),('20150630082932'),('20150630122552'),('20150729062045'),('20150729062215'),('20150731115141'),('20150731115426'),('20150731115742'),('20150804113139'),('20150804114651'),('20150805084232'),('20150806114405'),('20150806114717'),('20150807141947'),('20150821131310'),('20150821131616'),('20150825120916'),('20150825121715'),('20150825122606'),('20150828094836'),('20150902090425'),('20150902103231'),('20151008090106'),('20151008130725'),('20151022180225'),('20151022180242'),('20151022183133'),('20151102084029'),('20151202062609'),('20151204083028'),('20151209102951'),('20151215071150'),('20151230071554'),('20151230095128'),('20151231083524'),('20160119092239'),('20160119092534'),('20160120112839'),('20160124012140'),('20160124025857'),('20160124174044'),('20160124174336'),('20160126001222'),('20160126013137'),('20160126013235');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sessions_on_session_id` (`session_id`) USING BTREE,
  KEY `index_sessions_on_updated_at` (`updated_at`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (2,'82d240c10c7ae9ef6ee50930049e4e3b','BAh7CEkiFnJldHVybl90b19jb250ZW50BjoGRUYiBi9JIhJmZWF0dXJlX2Zs\nYWdzBjsARm86CFNldAY6CkBoYXNoewBJIhBfY3NyZl90b2tlbgY7AEZJIjFY\nZExBSnJmRkg3SUxDNDZma2Z6cktHWHR5aVFhdW41VUJFTHdLY0kyOWRvPQY7\nAEY=\n','2016-01-19 23:34:57','2016-01-19 23:34:57'),(3,'897b5efdf43d05f07ffab05e5328eac0','BAh7B0kiDnJldHVybl90bwY6BkVGIhUvZW4vbGlzdGluZ3MvbmV3SSIKZmxh\nc2gGOwBUewdJIgxkaXNjYXJkBjsAVFsASSIMZmxhc2hlcwY7AFR7BjoMd2Fy\nbmluZ0lDOh5BY3RpdmVTdXBwb3J0OjpTYWZlQnVmZmVyIgGAWW91IG11c3Qg\nbG9nIGluIHRvIHNoYXJlIHRvIGNyZWF0ZSBhIG5ldyBsaXN0aW5nLiBJZiB5\nb3UgZG9uJ3QgaGF2ZSBhbiBhY2NvdW50IHlvdSBjYW4gPGEgaHJlZj0iL2Vu\nL3NpZ251cCI+Y3JlYXRlIG9uZSBoZXJlPC9hPi4HOwBUOg9AaHRtbF9zYWZl\nVA==\n','2016-01-19 23:35:10','2016-01-19 23:35:10'),(4,'211686c9b13cb3ad7ab4e2bffd48c03c','BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFWVDFiTGNWUE9qSFJuUm53UGFH\nVy9iNENOOVQ2R2Z4QzVRWGNlWFM5Z2hZPQY7AEY=\n','2016-01-19 23:35:11','2016-01-19 23:35:11'),(5,'1cc0aa58000b19340188cb3b447a23c7','BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFTRlZpV1BqSDJ4T04rM1ZHL3Rv\nKzBySDAxZnBCQWZpbGorSE1UelpVM3JzPQY7AEY=\n','2016-01-19 23:35:28','2016-01-19 23:35:28'),(6,'08d1398b1b3e4bf6bf02ee1775bd7a2c','BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjF4dTNxYytOZVdBVzlML0p5NWJC\nSE9ZSC9YcWJOU05KQW5Nd09QQlBNdThJPQY7AEY=\n','2016-01-19 23:35:37','2016-01-19 23:35:37'),(7,'80161b37c4a3fd380f21981545317ff2','BAh7CEkiFnJldHVybl90b19jb250ZW50BjoGRUYiEC8/bG9jYWxlPWVuSSIS\nZmVhdHVyZV9mbGFncwY7AEZvOghTZXQGOgpAaGFzaHsASSIQX2NzcmZfdG9r\nZW4GOwBGSSIxditXd3pHQzdvZFNQVytZKzMzd21rUnh6OEU1YjIyUTMwYjEz\nTDl0aWo0Yz0GOwBG\n','2016-01-19 23:35:45','2016-01-19 23:35:45'),(8,'37fe688547f26d0f96e456c8b7f464b2','BAh7B0kiDnJldHVybl90bwY6BkVGIhUvZW4vbGlzdGluZ3MvbmV3SSIKZmxh\nc2gGOwBUewdJIgxkaXNjYXJkBjsAVFsASSIMZmxhc2hlcwY7AFR7BjoMd2Fy\nbmluZ0lDOh5BY3RpdmVTdXBwb3J0OjpTYWZlQnVmZmVyIgGAWW91IG11c3Qg\nbG9nIGluIHRvIHNoYXJlIHRvIGNyZWF0ZSBhIG5ldyBsaXN0aW5nLiBJZiB5\nb3UgZG9uJ3QgaGF2ZSBhbiBhY2NvdW50IHlvdSBjYW4gPGEgaHJlZj0iL2Vu\nL3NpZ251cCI+Y3JlYXRlIG9uZSBoZXJlPC9hPi4HOwBUOg9AaHRtbF9zYWZl\nVA==\n','2016-01-19 23:35:52','2016-01-19 23:35:52'),(9,'35327c19db370fb6be4c121cad665b41','BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjF4alkwbnhzOThmSDJBanNQYXBM\nZldpaWNCNi9ZZm5udStpdTNCTE1FL0JrPQY7AEY=\n','2016-01-19 23:35:52','2016-01-19 23:35:52'),(10,'50b3b287470baa01b468d9fa0a63f697','BAh7CEkiFnJldHVybl90b19jb250ZW50BjoGRUYiEC8/bG9jYWxlPWVuSSIS\nZmVhdHVyZV9mbGFncwY7AEZvOghTZXQGOgpAaGFzaHsASSIQX2NzcmZfdG9r\nZW4GOwBGSSIxOU93TGJIL1VMaWdBNE1tUkcvbEF2S0JHWkpYaWQ0RFVNbFZh\naXlTQXR2OD0GOwBG\n','2016-01-19 23:36:16','2016-01-19 23:36:16'),(11,'1d87b10069374e87f3d38947f70a6871','BAh7CEkiFnJldHVybl90b19jb250ZW50BjoGRUYiBi9JIhJmZWF0dXJlX2Zs\nYWdzBjsARm86CFNldAY6CkBoYXNoewBJIhBfY3NyZl90b2tlbgY7AEZJIjE4\nMmJRU3RxaTE3RUJxK0pTenY2bmRtVHRBWmhPWm5PTDFoUERxZWQvMjRNPQY7\nAEY=\n','2016-01-19 23:36:25','2016-01-19 23:36:25'),(12,'054a1a71d67936386d2def142789e6c8','BAh7B0kiDnJldHVybl90bwY6BkVGIhUvZW4vbGlzdGluZ3MvbmV3SSIKZmxh\nc2gGOwBUewdJIgxkaXNjYXJkBjsAVFsASSIMZmxhc2hlcwY7AFR7BjoMd2Fy\nbmluZ0lDOh5BY3RpdmVTdXBwb3J0OjpTYWZlQnVmZmVyIgGAWW91IG11c3Qg\nbG9nIGluIHRvIHNoYXJlIHRvIGNyZWF0ZSBhIG5ldyBsaXN0aW5nLiBJZiB5\nb3UgZG9uJ3QgaGF2ZSBhbiBhY2NvdW50IHlvdSBjYW4gPGEgaHJlZj0iL2Vu\nL3NpZ251cCI+Y3JlYXRlIG9uZSBoZXJlPC9hPi4HOwBUOg9AaHRtbF9zYWZl\nVA==\n','2016-01-19 23:36:27','2016-01-19 23:36:27'),(13,'2164ddd9a2a9998bb13d2e2405b9a996','BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFsMHE5bGw1KzQrS3Z2WHRMMzhF\nOEFrYy9TbHhpVlMvMlc0VmcxWVVsdm9VPQY7AEY=\n','2016-01-19 23:36:27','2016-01-19 23:36:27'),(14,'614676c9ec0f2881e54d58d676b7b67f','BAh7CEkiFnJldHVybl90b19jb250ZW50BjoGRUYiEC8/bG9jYWxlPWVuSSIS\nZmVhdHVyZV9mbGFncwY7AEZvOghTZXQGOgpAaGFzaHsASSIQX2NzcmZfdG9r\nZW4GOwBGSSIxK0MzNEt1MEF3bERjWUlGaHlVTytKd1hBeW12aktWZFVUTjlR\nQnJzWTZwcz0GOwBG\n','2016-01-19 23:36:35','2016-01-19 23:36:35'),(15,'16c86f15abf2c557a2bf89ac4e367960','BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFLQTZoeXJZcXdUZWQ3YnRMMEhJ\nbUJPRXJLSUwzOUNTUjd5MzAvanVxTElvPQY7AEY=\n','2016-01-19 23:43:16','2016-01-19 23:43:16'),(16,'f7fb84735985733c59425f74be427c54','BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFRYTJGcm9HSVl3RGZtcGN5MGVt\nSzRCUFZBU3FSWHdCdjFiNC9IVFhSM1lRPQY7AEY=\n','2016-01-19 23:43:40','2016-01-19 23:43:40'),(17,'02bb8ae4761f67844d65bdb0a513c55c','BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjE2YTJoREsrZkR5aVlTY01JTi9y\nVHIvMWU3Ris4NTBJZFJJdkxGQVFPMjRFPQY7AEY=\n','2016-01-19 23:43:54','2016-01-19 23:43:54'),(18,'b5586172c0ea9718d997dc062bcf70d0','BAh7CEkiFnJldHVybl90b19jb250ZW50BjoGRUYiEC8/bG9jYWxlPWVuSSIS\nZmVhdHVyZV9mbGFncwY7AEZvOghTZXQGOgpAaGFzaHsASSIQX2NzcmZfdG9r\nZW4GOwBGSSIxWGxmQXdDYmF6MUEyMnJhdjdSeTlWSXFPVE9TVEFRa2Z1WW5z\nQXJVUW1OMD0GOwBG\n','2016-01-19 23:44:06','2016-01-19 23:44:06'),(19,'d61d708231d9ff8c9eb38787e5a2496c','BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjE3ZzlJcEZmUHBOcUhIWDd2NXRl\nRzVXZFU5UENTby9MVlBTcittTHY3b01rPQY7AEY=\n','2016-01-19 23:44:09','2016-01-19 23:44:09'),(20,'1dbda8a4105e14b7547ab829fd9d021e','BAh7CEkiFnJldHVybl90b19jb250ZW50BjoGRUYiEC8/bG9jYWxlPWVuSSIS\nZmVhdHVyZV9mbGFncwY7AEZvOghTZXQGOgpAaGFzaHsASSIQX2NzcmZfdG9r\nZW4GOwBGSSIxdVdBYW4yQjJYQldWWjAvVHIyMzIyK09LV1hqU1EyQmRGZkIx\nMmhZUjh5ST0GOwBG\n','2016-01-19 23:44:17','2016-01-19 23:44:17'),(21,'f643496a068665ff4f0ac2f4aa4c0459','BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFJczIyQ3NBNFI0VGdQVkVheTVw\neDREeGZhSnQyOHgrejQyQkluVmZjT0hBPQY7AEY=\n','2016-01-19 23:44:26','2016-01-19 23:44:26'),(22,'a5c6c512b4af56a10c01040ae9037143','BAh7CEkiFnJldHVybl90b19jb250ZW50BjoGRUYiEC8/bG9jYWxlPWVuSSIS\nZmVhdHVyZV9mbGFncwY7AEZvOghTZXQGOgpAaGFzaHsASSIQX2NzcmZfdG9r\nZW4GOwBGSSIxKzF1QXRlcFFmcTgreGxseUNrRytkUTBLSUhlVWVRWitoVE1V\nTGlzcUJIOD0GOwBG\n','2016-01-19 23:54:11','2016-01-19 23:54:11'),(23,'1f375baab23a207d3fa394fa96b34ee7','BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFmRGxTU0RvR2NYTTM3UUFKUXM3\nTjlYeS8ycnlKU2ZhV3ZvQVBZb3lPZFVNPQY7AEY=\n','2016-01-19 23:54:22','2016-01-19 23:54:22'),(24,'9669a40d4cc48d45ad6f3c204dc379d5','BAh7CEkiFnJldHVybl90b19jb250ZW50BjoGRUYiCC9lbkkiEmZlYXR1cmVf\nZmxhZ3MGOwBGbzoIU2V0BjoKQGhhc2h7AEkiEF9jc3JmX3Rva2VuBjsARkki\nMVJHZ1ppWGlQeUNqL0FYaGlpMzlzUWNYVFJ6b0x6cVhjcVprT3ZCWVZ1Uzg9\nBjsARg==\n','2016-01-19 23:54:47','2016-01-19 23:54:47'),(25,'681419109362dd34890e55788a771c9e','BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjE1Y2hJam5WbGM3N0NTcUlxbE02\ndUQyVVc4Q2JlYU0xUzF2bWpuRTQya1dBPQY7AEY=\n','2016-01-19 23:54:53','2016-01-19 23:54:53'),(26,'f4ec11992cc48a471dab527777e9895c','BAh7B0kiDnJldHVybl90bwY6BkVGIiIvZW4vY29tbXVuaXR5X21lbWJlcnNo\naXBzL25ld0kiCmZsYXNoBjsAVHsHSSIMZGlzY2FyZAY7AFRbAEkiDGZsYXNo\nZXMGOwBUewY6DHdhcm5pbmdJIiZZb3UgbXVzdCBsb2cgaW4gdG8gdmlldyB0\naGlzIHBhZ2UGOwBU\n','2016-01-19 23:55:05','2016-01-19 23:55:05'),(27,'fc9bfed273f7e9cc6e01e9e77761d92f','BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFzdHRjZWxUYVM5dDFzV0pHUUJI\nV3RINVp4SWlxZ0JvY2ozN2FkWnFEZEpjPQY7AEY=\n','2016-01-19 23:55:05','2016-01-19 23:55:05'),(28,'72f0e4e86a5921490f2c804e002b9f70','BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjF2RkJvUjBkbEQzTjJqSmlidUpm\nTW1ka0Zoc0ZBV0FGb3BYOFZkb0dOQkh3PQY7AEY=\n','2016-01-19 23:59:51','2016-01-19 23:59:51'),(30,'ce874e67370b627f370f0450f8058c27','BAh7CEkiFnJldHVybl90b19jb250ZW50BjoGRUYiBi9JIhJmZWF0dXJlX2Zs\nYWdzBjsARm86CFNldAY6CkBoYXNoewBJIhBfY3NyZl90b2tlbgY7AEZJIjE2\nSWxuOUdFcndRZklBd1JFdFd6aFNLa3REL29hWW9GZWdQRkhzeG5YcGpBPQY7\nAEY=\n','2016-01-20 11:03:17','2016-01-20 11:03:17'),(31,'60df04079709f3b4a2575c7afb3f5963','BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFIRG1WYU9rRTJHTEkxbllLQ0VR\nZGFNTExENWhjdmp6WE1CNmJSYXVYNzlFPQY7AEY=\n','2016-01-20 11:04:10','2016-01-20 11:04:10'),(32,'29fe001fe3b7581a7adeab27694fd4df','BAh7CEkiFnJldHVybl90b19jb250ZW50BjoGRUYiEC8/bG9jYWxlPWVuSSIS\nZmVhdHVyZV9mbGFncwY7AEZvOghTZXQGOgpAaGFzaHsASSIQX2NzcmZfdG9r\nZW4GOwBGSSIxQ0JuQ2svd1l5MG5Qa3Mwa3M4OUp3UkR0MytiQlpYeHl5Ym85\nY2tLczM5QT0GOwBG\n','2016-01-20 11:04:19','2016-01-20 11:04:19'),(33,'11b96667e245286af90e88fbb59245a0','BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjF3QlRjQTJjMk51ZzAyOE5sOUIz\nTFdKcGRnNlFXL1VoTGZ4Wkl1R0YzOUlzPQY7AEY=\n','2016-01-20 11:04:23','2016-01-20 11:04:23'),(35,'047c8ea4fd7c91452f924411bd6fd4b1','BAh7CEkiFnJldHVybl90b19jb250ZW50BjoGRUYiBi9JIhJmZWF0dXJlX2Zs\nYWdzBjsARm86CFNldAY6CkBoYXNoewBJIhBfY3NyZl90b2tlbgY7AEZJIjEx\nbGNMSmc4amRZc0JJZFNtWXprU3RmcExwMW5JMUNvZ2xFOFNZYUJIS1NjPQY7\nAEY=\n','2016-01-20 18:08:59','2016-01-20 18:08:59'),(36,'58b6f40c69710a5b465edf9f5b46f795','BAh7CEkiFnJldHVybl90b19jb250ZW50BjoGRUYiBi9JIhJmZWF0dXJlX2Zs\nYWdzBjsARm86CFNldAY6CkBoYXNoewBJIhBfY3NyZl90b2tlbgY7AEZJIjFR\nNFdlbDQ5RENvN0kzU1ZGYlNkNVVjUnVFNXdJdkpnRVJwNE0yWkZSOStnPQY7\nAEY=\n','2016-01-20 18:11:18','2016-01-21 16:22:38'),(37,'20cdab7105bfaa356abab817e1b212bd','BAh7CkkiEmZlYXR1cmVfZmxhZ3MGOgZFRm86CFNldAY6CkBoYXNoewBJIht3\nYXJkZW4udXNlci5wZXJzb24ua2V5BjsAVFsHWwZJIhtkR3pEc2FWV3FyNXlh\nZlljT3VkaFEwBjsAVEkiIiQyYSQxMCR6a1JiSGI5SkVPTWRXcDVrME9YZHF1\nBjsAVEkiDnBlcnNvbl9pZAY7AEZADEkiFnJldHVybl90b19jb250ZW50BjsA\nRiIGL0kiEF9jc3JmX3Rva2VuBjsARkkiMXJCSGZJdXFmd2RicFBTRXc5U0pr\nTmsrOHd1ajUzL1poUHFtdDVKSm9OWlk9BjsARg==\n','2016-01-20 18:11:42','2016-01-21 16:32:51'),(43,'69acf6882f970e59635a296960d888df','BAh7C0kiEmZlYXR1cmVfZmxhZ3MGOgZFRm86CFNldAY6CkBoYXNoewBJIht3\nYXJkZW4udXNlci5wZXJzb24ua2V5BjsAVFsHWwZJIhthZDB2Qy1WV0dyNXlh\nYVljT3VkaFEwBjsAVEkiIiQyYSQxMCR5elBhUmNvQ1UwNVYvQjlMVm5rWmx1\nBjsAVEkiDnBlcnNvbl9pZAY7AEZADEkiCmZsYXNoBjsAVHsHSSIMZGlzY2Fy\nZAY7AFRbBzoKZXJyb3I6C25vdGljZUkiDGZsYXNoZXMGOwBUewc7CDA7CUlD\nOh5BY3RpdmVTdXBwb3J0OjpTYWZlQnVmZmVyIidXZWxjb21lLCA8YSBocmVm\nPSIvZW4vd290byI+MTwvYT4hBzsAVDoPQGh0bWxfc2FmZVRJIhZyZXR1cm5f\ndG9fY29udGVudAY7AEYiCC9lbkkiEF9jc3JmX3Rva2VuBjsARkkiMW1ZTG8r\nMmhSRXl3TFB5ekgvLy82cE5NaGZUMkN1dklLckI5VEhrK3ZYT1k9BjsARg==\n','2016-01-20 18:38:07','2016-01-20 18:38:07'),(45,'b0cba5e997de1a15254fcb37700cb3da','BAh7CkkiEmZlYXR1cmVfZmxhZ3MGOgZFRm86CFNldAY6CkBoYXNoewBJIht3\nYXJkZW4udXNlci5wZXJzb24ua2V5BjsAVFsHWwZJIhtkR3pEc2FWV3FyNXlh\nZlljT3VkaFEwBjsAVEkiIiQyYSQxMCR6a1JiSGI5SkVPTWRXcDVrME9YZHF1\nBjsAVEkiDnBlcnNvbl9pZAY7AEZADEkiFnJldHVybl90b19jb250ZW50BjsA\nRiISL2VuP3ZpZXc9bGlzdEkiEF9jc3JmX3Rva2VuBjsARkkiMVBLT2IzeDM2\nZFhUSUFjUmVHamZUMklkcDFySXJiUk1xV0VUR3hMN0p3cmM9BjsARg==\n','2016-01-21 17:02:05','2016-01-21 17:14:14'),(57,'92fd6fa28a3d178181c038749f9d152e','BAh7CkkiFnJldHVybl90b19jb250ZW50BjoGRUYiCC9lbkkiEmZlYXR1cmVf\nZmxhZ3MGOwBGbzoIU2V0BjoKQGhhc2h7AEkiEF9jc3JmX3Rva2VuBjsARkki\nMUtEWllORnRVQkErLzBOQmsyR0pKL3R4NEpUQnBqZXpZdG9xeWZVZkdNYTA9\nBjsARkkiG3dhcmRlbi51c2VyLnBlcnNvbi5rZXkGOwBUWwdbBkkiG2FhVDFz\nTVdVS3I1eWFhWWNPdWRoUTAGOwBUIiIkMmEkMTAkdE00eWlVSHAuVld1MXZy\nYTFMRHJmZUkiDnBlcnNvbl9pZAY7AEZAEA==\n','2016-01-24 22:22:51','2016-01-24 22:22:51'),(69,'ae82e868bf79e350e9333ac89f41b869','BAh7CEkiFnJldHVybl90b19jb250ZW50BjoGRUYiBi9JIhJmZWF0dXJlX2Zs\nYWdzBjsARm86CFNldAY6CkBoYXNoewBJIhBfY3NyZl90b2tlbgY7AEZJIjF1\nYzBqRDNuK200UGU2Y3gyUjhLTFhYSENOK0ZtaUR3dnRMWVdiODFpemtnPQY7\nAEY=\n','2016-01-26 00:32:37','2016-01-26 00:32:37'),(71,'ba76e2ee6fa1ec9e1a8b898e618ce3ab','BAh7CkkiEmZlYXR1cmVfZmxhZ3MGOgZFRm86CFNldAY6CkBoYXNoewBJIht3\nYXJkZW4udXNlci5wZXJzb24ua2V5BjsAVFsHWwZJIhtkR3pEc2FWV3FyNXlh\nZlljT3VkaFEwBjsAVEkiIiQyYSQxMCR6a1JiSGI5SkVPTWRXcDVrME9YZHF1\nBjsAVEkiDnBlcnNvbl9pZAY7AEZADEkiFnJldHVybl90b19jb250ZW50BjsA\nRiIGL0kiEF9jc3JmX3Rva2VuBjsARkkiMUM3bDFvRlh5VzB0VEx1OTRlRVE4\nQkVqRHlPWDlEOURIWExINXFqS0ZCd3M9BjsARg==\n','2016-01-26 00:32:47','2016-01-26 00:32:51'),(77,'076d965e2c69134fcffeb63816a7c978','BAh7C0kiEmZlYXR1cmVfZmxhZ3MGOgZFRm86CFNldAY6CkBoYXNoewBJIht3\nYXJkZW4udXNlci5wZXJzb24ua2V5BjsAVFsHWwZJIhtiZWFvdS1XOHFyNXlh\nYVljT3VkaFEwBjsAVEkiIiQyYSQxMCRqLjg4M2lvWjJRcDlEVmhQUVBVMDhP\nBjsAVEkiDnBlcnNvbl9pZAY7AEZADEkiFnJldHVybl90b19jb250ZW50BjsA\nRiIgL2VuL2xpc3RpbmdzLzE4LW1hdGllbWF0aWthSSIQX2NzcmZfdG9rZW4G\nOwBGSSIxQWVuUHVrd05UUHBNTExTUGM3SmZoY0dTd1piVHJyaXpGVk9YVnky\nU1locz0GOwBGSSIKZmxhc2gGOwBUewdJIgxkaXNjYXJkBjsAVFsGOgtub3Rp\nY2VJIgxmbGFzaGVzBjsAVHsGOwhJIiFMaXN0aW5nIHVwZGF0ZWQgc3VjY2Vz\nc2Z1bGx5BjsAVA==\n','2016-01-26 04:08:55','2016-01-26 04:09:20'),(80,'6fc19b7a3b19c9efa29ef29d2b21c80a','BAh7CEkiFnJldHVybl90b19jb250ZW50BjoGRUYiBi9JIhJmZWF0dXJlX2Zs\nYWdzBjsARm86CFNldAY6CkBoYXNoewBJIhBfY3NyZl90b2tlbgY7AEZJIjFU\ndnROOXRTam5ucE9zR0JiS21oeGxxV2l3eUVQSXlYaVA3UGRtMzVWckxZPQY7\nAEY=\n','2016-01-26 04:10:15','2016-01-26 04:10:15'),(83,'cf03fde3859c190a70e885a62a108726','BAh7CEkiFnJldHVybl90b19jb250ZW50BjoGRUYiBi9JIhJmZWF0dXJlX2Zs\nYWdzBjsARm86CFNldAY6CkBoYXNoewBJIhBfY3NyZl90b2tlbgY7AEZJIjE1\nL2RldzJjaTVZN2xlWTR1TDR0U2lnY1RRdyt4Umw3K0Q2SjRVd21Bc1VNPQY7\nAEY=\n','2016-01-26 04:53:55','2016-01-26 04:53:55'),(84,'b1c6d116f5ec5295e69ad00895b9268e','BAh7BkkiEF9jc3JmX3Rva2VuBjoGRUZJIjFyNW1aR1RJOHE0cFQ2azMzTmNM\nRWhtZkdpZnh6RXI1MmpZdHBOQzZIOU9jPQY7AEY=\n','2016-01-26 04:54:01','2016-01-26 04:54:01'),(85,'dfffb33de8c5ea008d64e61aa076fac9','BAh7CEkiFnJldHVybl90b19jb250ZW50BjoGRUYiEC8/bG9jYWxlPWVuSSIS\nZmVhdHVyZV9mbGFncwY7AEZvOghTZXQGOgpAaGFzaHsASSIQX2NzcmZfdG9r\nZW4GOwBGSSIxZkVvQVBkZEljZm5MNHJhZE94SUZRbURsUWZ6WXNjZDArL0E3\nNDQ5b0J2VT0GOwBG\n','2016-01-26 04:54:04','2016-01-26 04:54:04'),(87,'0a69bae7cf10995f3e1bd815504fd6b5','BAh7CkkiFnJldHVybl90b19jb250ZW50BjoGRUYiBi9JIhJmZWF0dXJlX2Zs\nYWdzBjsARm86CFNldAY6CkBoYXNoewBJIht3YXJkZW4udXNlci5wZXJzb24u\na2V5BjsAVFsHWwZJIhtkR3pEc2FWV3FyNXlhZlljT3VkaFEwBjsAVEkiIiQy\nYSQxMCR6a1JiSGI5SkVPTWRXcDVrME9YZHF1BjsAVEkiDnBlcnNvbl9pZAY7\nAEZADkkiEF9jc3JmX3Rva2VuBjsARkkiMVN5NUViTEtMOS9GRFc4dm1nbnEx\ndkhwQzd0T2ZJdEdxMTBHKytrSmxCUUE9BjsARg==\n','2016-01-26 08:22:27','2016-01-26 19:01:41');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_addresses`
--

DROP TABLE IF EXISTS `shipping_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state_or_province` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `country_code` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_addresses`
--

LOCK TABLES `shipping_addresses` WRITE;
/*!40000 ALTER TABLE `shipping_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `testimonials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` float DEFAULT NULL,
  `text` text COLLATE utf8_unicode_ci,
  `author_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `participation_id` int(11) DEFAULT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `receiver_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_testimonials_on_author_id` (`author_id`) USING BTREE,
  KEY `index_testimonials_on_receiver_id` (`receiver_id`) USING BTREE,
  KEY `index_testimonials_on_transaction_id` (`transaction_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_processes`
--

DROP TABLE IF EXISTS `transaction_processes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_processes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) DEFAULT NULL,
  `process` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `author_is_seller` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_transaction_process_on_community_id` (`community_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_processes`
--

LOCK TABLES `transaction_processes` WRITE;
/*!40000 ALTER TABLE `transaction_processes` DISABLE KEYS */;
INSERT INTO `transaction_processes` VALUES (1,1,'none',1,'2016-01-19 23:32:15','2016-01-26 05:07:13'),(2,1,'none',0,'2016-01-19 23:32:15','2016-01-19 23:32:15'),(3,2,'none',1,'2016-01-26 05:07:41','2016-01-26 05:07:41');
/*!40000 ALTER TABLE `transaction_processes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_transitions`
--

DROP TABLE IF EXISTS `transaction_transitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaction_transitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `metadata` text COLLATE utf8_unicode_ci,
  `sort_key` int(11) DEFAULT '0',
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_transaction_transitions_on_sort_key_and_conversation_id` (`sort_key`,`transaction_id`) USING BTREE,
  KEY `index_transaction_transitions_on_conversation_id` (`transaction_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_transitions`
--

LOCK TABLES `transaction_transitions` WRITE;
/*!40000 ALTER TABLE `transaction_transitions` DISABLE KEYS */;
INSERT INTO `transaction_transitions` VALUES (1,'free','null',0,1,'2016-01-20 18:37:28','2016-01-20 18:37:28');
/*!40000 ALTER TABLE `transaction_transitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `starter_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `listing_id` int(11) NOT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `automatic_confirmation_after_days` int(11) NOT NULL,
  `community_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `starter_skipped_feedback` tinyint(1) DEFAULT '0',
  `author_skipped_feedback` tinyint(1) DEFAULT '0',
  `last_transition_at` datetime DEFAULT NULL,
  `current_state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commission_from_seller` int(11) DEFAULT NULL,
  `minimum_commission_cents` int(11) DEFAULT '0',
  `minimum_commission_currency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_gateway` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `listing_quantity` int(11) DEFAULT '1',
  `listing_author_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `listing_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_type` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price_cents` int(11) DEFAULT NULL,
  `unit_price_currency` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_tr_key` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_selector_tr_key` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_process` varchar(31) COLLATE utf8_unicode_ci DEFAULT 'none',
  `delivery_method` varchar(31) COLLATE utf8_unicode_ci DEFAULT 'none',
  `shipping_price_cents` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `transactions_on_cid_and_deleted` (`community_id`,`deleted`) USING BTREE,
  KEY `index_transactions_on_community_id` (`community_id`) USING BTREE,
  KEY `index_transactions_on_conversation_id` (`conversation_id`) USING BTREE,
  KEY `index_transactions_on_deleted` (`deleted`) USING BTREE,
  KEY `index_transactions_on_last_transition_at` (`last_transition_at`) USING BTREE,
  KEY `index_transactions_on_listing_id` (`listing_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,'ad0vC-VWGr5yaaYcOudhQ0',2,1,0,1,'2016-01-20 18:37:27','2016-01-20 18:37:28',0,0,'2016-01-20 18:37:28','free',0,0,'RUB','none',7,'dGzDsaVWqr5yafYcOudhQ0','bbb','day',0,'RUB',NULL,NULL,'none','none',NULL,0);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-26 22:16:29
