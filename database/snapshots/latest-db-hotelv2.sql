/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `assigned_frontdesks`;
CREATE TABLE `assigned_frontdesks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `frontdesk_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `branches`;
CREATE TABLE `branches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `autorization_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_autorization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension_time_reset` int DEFAULT NULL,
  `initial_deposit` decimal(10,2) NOT NULL DEFAULT '200.00',
  `discount_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `discount_amount` decimal(10,2) NOT NULL DEFAULT '50.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `check_out_guest_reports`;
CREATE TABLE `check_out_guest_reports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `room_id` bigint unsigned NOT NULL,
  `checkin_details_id` bigint unsigned NOT NULL,
  `shift_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `frontdesk_id` int NOT NULL,
  `partner_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `checkin_details`;
CREATE TABLE `checkin_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `guest_id` bigint unsigned NOT NULL,
  `type_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned NOT NULL,
  `rate_id` bigint unsigned NOT NULL,
  `static_amount` int NOT NULL,
  `hours_stayed` int NOT NULL,
  `total_deposit` int DEFAULT NULL,
  `total_deduction` int NOT NULL DEFAULT '0',
  `check_in_at` datetime NOT NULL,
  `check_out_at` datetime NOT NULL,
  `is_check_out` tinyint(1) NOT NULL DEFAULT '0',
  `is_long_stay` tinyint(1) NOT NULL,
  `number_of_hours` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `cleaning_histories`;
CREATE TABLE `cleaning_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned NOT NULL,
  `floor_id` bigint unsigned NOT NULL,
  `branch_id` bigint unsigned NOT NULL,
  `start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_assigned_floor_id` tinyint(1) NOT NULL,
  `expected_end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cleaning_duration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delayed_cleaning` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `discounts`;
CREATE TABLE `discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` int NOT NULL,
  `is_percentage` tinyint(1) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `expense_categories`;
CREATE TABLE `expense_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `expenses`;
CREATE TABLE `expenses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `shift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_category_id` bigint unsigned NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `expenses_user_id_foreign` (`user_id`),
  CONSTRAINT `expenses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `extended_guest_reports`;
CREATE TABLE `extended_guest_reports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned NOT NULL,
  `checkin_details_id` bigint unsigned NOT NULL,
  `number_of_extension` int NOT NULL,
  `total_hours` int NOT NULL,
  `shift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `frontdesk_id` int NOT NULL,
  `partner_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `extension_rates`;
CREATE TABLE `extension_rates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `hour` int NOT NULL,
  `amount` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `floor_user`;
CREATE TABLE `floor_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `floor_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `floor_user_user_id_foreign` (`user_id`),
  KEY `floor_user_floor_id_foreign` (`floor_id`),
  CONSTRAINT `floor_user_floor_id_foreign` FOREIGN KEY (`floor_id`) REFERENCES `floors` (`id`) ON DELETE CASCADE,
  CONSTRAINT `floor_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `floors`;
CREATE TABLE `floors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `number` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `frontdesk_categories`;
CREATE TABLE `frontdesk_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `frontdesk_inventories`;
CREATE TABLE `frontdesk_inventories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `frontdesk_menu_id` bigint unsigned NOT NULL,
  `number_of_serving` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `frontdesk_menus`;
CREATE TABLE `frontdesk_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `frontdesk_category_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `frontdesks`;
CREATE TABLE `frontdesks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `guests`;
CREATE TABLE `guests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qr_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_id` bigint unsigned NOT NULL,
  `previous_room_id` bigint unsigned DEFAULT NULL,
  `rate_id` bigint unsigned NOT NULL,
  `type_id` bigint unsigned NOT NULL,
  `static_amount` int NOT NULL,
  `is_long_stay` tinyint(1) NOT NULL DEFAULT '0',
  `number_of_days` int DEFAULT NULL,
  `has_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_kiosk_check_out` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `hotel_items`;
CREATE TABLE `hotel_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `inventories`;
CREATE TABLE `inventories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `menu_id` bigint unsigned NOT NULL,
  `number_of_serving` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `menu_categories`;
CREATE TABLE `menu_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `menu_category_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `new_guest_reports`;
CREATE TABLE `new_guest_reports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned NOT NULL,
  `checkin_details_id` bigint unsigned NOT NULL,
  `shift_date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `frontdesk_id` int NOT NULL,
  `partner_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `pub_categories`;
CREATE TABLE `pub_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `pub_inventories`;
CREATE TABLE `pub_inventories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `pub_menu_id` bigint unsigned NOT NULL,
  `number_of_serving` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `pub_menus`;
CREATE TABLE `pub_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `pub_category_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `rates`;
CREATE TABLE `rates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `staying_hour_id` bigint unsigned NOT NULL,
  `type_id` bigint unsigned NOT NULL,
  `amount` int NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '1',
  `has_discount` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `requestable_items`;
CREATE TABLE `requestable_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `room_boy_reports`;
CREATE TABLE `room_boy_reports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned DEFAULT '1',
  `room_id` bigint unsigned NOT NULL,
  `checkin_details_id` bigint unsigned NOT NULL,
  `roomboy_id` bigint unsigned NOT NULL,
  `cleaning_start` datetime NOT NULL,
  `cleaning_end` datetime NOT NULL,
  `total_hours_spent` int NOT NULL,
  `interval` int NOT NULL,
  `shift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_cleaned` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `floor_id` bigint unsigned NOT NULL,
  `number` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Main',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
  `type_id` bigint unsigned NOT NULL,
  `is_priority` tinyint(1) NOT NULL DEFAULT '0',
  `last_checkin_at` date DEFAULT NULL,
  `last_checkout_at` date DEFAULT NULL,
  `time_to_terminate_queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_out_time` date DEFAULT NULL,
  `time_to_clean` datetime DEFAULT NULL,
  `started_cleaning_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `shift_logs`;
CREATE TABLE `shift_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `time_in` datetime NOT NULL,
  `time_out` datetime DEFAULT NULL,
  `frontdesk_ids` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `stay_extensions`;
CREATE TABLE `stay_extensions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `guest_id` bigint unsigned NOT NULL,
  `extension_id` bigint unsigned NOT NULL,
  `hours` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `frontdesk_ids` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `staying_hours`;
CREATE TABLE `staying_hours` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `number` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `temporary_check_in_kiosks`;
CREATE TABLE `temporary_check_in_kiosks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned NOT NULL,
  `guest_id` bigint unsigned NOT NULL,
  `terminated_at` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `temporary_reserveds`;
CREATE TABLE `temporary_reserveds` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned NOT NULL,
  `guest_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `transaction_types`;
CREATE TABLE `transaction_types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned NOT NULL,
  `guest_id` bigint unsigned NOT NULL,
  `floor_id` bigint unsigned NOT NULL,
  `transaction_type_id` bigint unsigned NOT NULL,
  `assigned_frontdesk_id` json NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payable_amount` int NOT NULL DEFAULT '0',
  `paid_amount` int NOT NULL DEFAULT '0',
  `change_amount` int NOT NULL DEFAULT '0',
  `deposit_amount` int NOT NULL DEFAULT '0',
  `paid_at` datetime DEFAULT NULL,
  `override_at` datetime DEFAULT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `types`;
CREATE TABLE `types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `unoccupied_room_reports`;
CREATE TABLE `unoccupied_room_reports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `shift` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rooms` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `frontdesk_id` int NOT NULL,
  `partner_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `branch_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `roomboy_assigned_floor_id` bigint unsigned DEFAULT NULL,
  `roomboy_cleaning_room_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_frontdesks` json DEFAULT NULL,
  `time_in` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO `branches` (`id`, `name`, `address`, `autorization_code`, `old_autorization`, `extension_time_reset`, `initial_deposit`, `discount_enabled`, `discount_amount`, `created_at`, `updated_at`) VALUES
(1, 'ALMA RESIDENCES GENSAN', 'Brgy. 1, Gensan, South Cotabato', '12345', NULL, 24, '200.00', 1, '50.00', '2025-07-28 16:39:08', '2025-07-28 16:39:08');


INSERT INTO `check_out_guest_reports` (`id`, `room_id`, `checkin_details_id`, `shift_date`, `shift`, `frontdesk_id`, `partner_name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'July 28, 2025', 'AM', 1, '1', '2025-07-31 14:38:42', '2025-07-31 14:38:42');
INSERT INTO `check_out_guest_reports` (`id`, `room_id`, `checkin_details_id`, `shift_date`, `shift`, `frontdesk_id`, `partner_name`, `created_at`, `updated_at`) VALUES
(2, 4, 2, 'July 28, 2025', 'AM', 1, '1', '2025-07-31 14:39:06', '2025-07-31 14:39:06');
INSERT INTO `check_out_guest_reports` (`id`, `room_id`, `checkin_details_id`, `shift_date`, `shift`, `frontdesk_id`, `partner_name`, `created_at`, `updated_at`) VALUES
(3, 1, 4, 'July 28, 2025', 'AM', 1, '1', '2025-07-31 14:42:39', '2025-07-31 14:42:39');
INSERT INTO `check_out_guest_reports` (`id`, `room_id`, `checkin_details_id`, `shift_date`, `shift`, `frontdesk_id`, `partner_name`, `created_at`, `updated_at`) VALUES
(4, 1, 5, 'July 28, 2025', 'AM', 1, '1', '2025-07-31 15:00:49', '2025-07-31 15:00:49');

INSERT INTO `checkin_details` (`id`, `guest_id`, `type_id`, `room_id`, `rate_id`, `static_amount`, `hours_stayed`, `total_deposit`, `total_deduction`, `check_in_at`, `check_out_at`, `is_check_out`, `is_long_stay`, `number_of_hours`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, 4, 480, 6, 200, 0, '2025-07-31 13:40:50', '2025-08-01 19:40:50', 1, 0, 12, '2025-07-31 13:40:50', '2025-07-31 14:38:42');
INSERT INTO `checkin_details` (`id`, `guest_id`, `type_id`, `room_id`, `rate_id`, `static_amount`, `hours_stayed`, `total_deposit`, `total_deduction`, `check_in_at`, `check_out_at`, `is_check_out`, `is_long_stay`, `number_of_hours`, `created_at`, `updated_at`) VALUES
(2, 2, 2, 4, 5, 592, 12, 200, 0, '2025-07-31 14:38:03', '2025-08-01 02:38:03', 1, 0, 0, '2025-07-31 14:38:03', '2025-07-31 14:39:06');
INSERT INTO `checkin_details` (`id`, `guest_id`, `type_id`, `room_id`, `rate_id`, `static_amount`, `hours_stayed`, `total_deposit`, `total_deduction`, `check_in_at`, `check_out_at`, `is_check_out`, `is_long_stay`, `number_of_hours`, `created_at`, `updated_at`) VALUES
(3, 3, 3, 3, 9, 872, 24, 200, 0, '2025-07-31 14:40:23', '2025-08-01 14:40:23', 0, 0, 0, '2025-07-31 14:40:23', '2025-07-31 14:40:23');
INSERT INTO `checkin_details` (`id`, `guest_id`, `type_id`, `room_id`, `rate_id`, `static_amount`, `hours_stayed`, `total_deposit`, `total_deduction`, `check_in_at`, `check_out_at`, `is_check_out`, `is_long_stay`, `number_of_hours`, `created_at`, `updated_at`) VALUES
(4, 4, 2, 1, 4, 480, 6, 200, 0, '2025-07-31 14:42:07', '2025-07-31 20:42:07', 1, 0, 0, '2025-07-31 14:42:07', '2025-07-31 14:42:39'),
(5, 5, 2, 1, 4, 480, 6, 200, 0, '2025-07-31 15:00:22', '2025-07-31 21:00:22', 1, 0, 0, '2025-07-31 15:00:22', '2025-07-31 15:00:49');

INSERT INTO `cleaning_histories` (`id`, `user_id`, `room_id`, `floor_id`, `branch_id`, `start_time`, `end_time`, `current_assigned_floor_id`, `expected_end_time`, `cleaning_duration`, `delayed_cleaning`, `created_at`, `updated_at`) VALUES
(1, 7, 1, 1, 1, '2025-07-31 14:40:14', '2025-07-31 14:59:33', 0, '2025-07-31 17:42:39', '19', 0, '2025-07-31 14:59:33', '2025-07-31 14:59:33');








INSERT INTO `extended_guest_reports` (`id`, `branch_id`, `room_id`, `checkin_details_id`, `number_of_extension`, `total_hours`, `shift`, `frontdesk_id`, `partner_name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2, 24, 'AM', 1, '1', '2025-07-31 13:42:23', '2025-07-31 13:42:31');


INSERT INTO `extension_rates` (`id`, `branch_id`, `hour`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 100, '2025-07-28 16:39:11', '2025-07-28 16:39:11');
INSERT INTO `extension_rates` (`id`, `branch_id`, `hour`, `amount`, `created_at`, `updated_at`) VALUES
(2, 1, 12, 200, '2025-07-28 16:39:11', '2025-07-28 16:39:11');
INSERT INTO `extension_rates` (`id`, `branch_id`, `hour`, `amount`, `created_at`, `updated_at`) VALUES
(3, 1, 18, 400, '2025-07-28 16:39:11', '2025-07-28 16:39:11');
INSERT INTO `extension_rates` (`id`, `branch_id`, `hour`, `amount`, `created_at`, `updated_at`) VALUES
(4, 1, 24, 500, '2025-07-28 16:39:11', '2025-07-28 16:39:11');





INSERT INTO `floors` (`id`, `branch_id`, `number`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-07-28 16:39:09', '2025-07-28 16:39:09');
INSERT INTO `floors` (`id`, `branch_id`, `number`, `created_at`, `updated_at`) VALUES
(2, 1, 2, '2025-07-28 16:39:09', '2025-07-28 16:39:09');
INSERT INTO `floors` (`id`, `branch_id`, `number`, `created_at`, `updated_at`) VALUES
(3, 1, 3, '2025-07-28 16:39:09', '2025-07-28 16:39:09');
INSERT INTO `floors` (`id`, `branch_id`, `number`, `created_at`, `updated_at`) VALUES
(4, 1, 4, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(5, 1, 5, '2025-07-28 16:39:09', '2025-07-28 16:39:09');

INSERT INTO `frontdesk_categories` (`id`, `branch_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pasta', '2025-08-06 14:04:19', '2025-08-06 14:04:19');
INSERT INTO `frontdesk_categories` (`id`, `branch_id`, `name`, `created_at`, `updated_at`) VALUES
(2, 1, 'Snacks', '2025-08-06 14:13:31', '2025-08-06 14:13:31');
INSERT INTO `frontdesk_categories` (`id`, `branch_id`, `name`, `created_at`, `updated_at`) VALUES
(3, 1, 'Burgers', '2025-08-06 14:13:41', '2025-08-06 14:13:41');
INSERT INTO `frontdesk_categories` (`id`, `branch_id`, `name`, `created_at`, `updated_at`) VALUES
(4, 1, 'Drinks', '2025-08-06 16:30:45', '2025-08-06 16:30:45');

INSERT INTO `frontdesk_inventories` (`id`, `branch_id`, `frontdesk_menu_id`, `number_of_serving`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 50, '2025-08-06 15:37:02', '2025-08-06 15:37:02');
INSERT INTO `frontdesk_inventories` (`id`, `branch_id`, `frontdesk_menu_id`, `number_of_serving`, `created_at`, `updated_at`) VALUES
(3, 1, 2, 10, '2025-08-06 16:19:52', '2025-08-06 16:19:52');
INSERT INTO `frontdesk_inventories` (`id`, `branch_id`, `frontdesk_menu_id`, `number_of_serving`, `created_at`, `updated_at`) VALUES
(4, 1, 1, 10, '2025-08-06 16:24:40', '2025-08-06 16:24:40');

INSERT INTO `frontdesk_menus` (`id`, `branch_id`, `frontdesk_category_id`, `name`, `price`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Spaghetti', '250', 'menu_images/IV55yPcWv88d7wAUarFeMHnucfmPWLJ9WfvrK5Ro.png', '2025-08-06 14:38:54', '2025-08-07 13:58:49');
INSERT INTO `frontdesk_menus` (`id`, `branch_id`, `frontdesk_category_id`, `name`, `price`, `image`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 'Carbonara', '100', 'menu_images/wlX6zLXDC8jLUCmroylOCR33SFX3XZNmF4g2AZt9.jpg', '2025-08-06 16:17:18', '2025-08-07 13:59:57');
INSERT INTO `frontdesk_menus` (`id`, `branch_id`, `frontdesk_category_id`, `name`, `price`, `image`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 'Pasta', '50', NULL, '2025-08-06 16:18:01', '2025-08-06 16:18:01');
INSERT INTO `frontdesk_menus` (`id`, `branch_id`, `frontdesk_category_id`, `name`, `price`, `image`, `created_at`, `updated_at`) VALUES
(4, 1, 2, 'Kropek', '100', NULL, '2025-08-06 16:19:10', '2025-08-06 16:30:21'),
(5, 1, 3, 'smash', '500', NULL, '2025-08-06 16:22:31', '2025-08-06 16:22:31'),
(6, 1, 1, 'test', '1', 'menu_images/prvnrsNbLJTYSBvfnceJMEWEdMLwERv6ENxHRuiI.jpg', '2025-08-07 13:54:09', '2025-08-07 13:54:09'),
(7, 1, 1, 'test2', '200', 'menu_images/tb9cSkqESnnjzbJ37fcCIvKBsI4NWrL62NvB5jdU.png', '2025-08-07 14:01:00', '2025-08-11 09:15:41');

INSERT INTO `frontdesks` (`id`, `branch_id`, `name`, `number`, `created_at`, `updated_at`) VALUES
(1, 1, 'frontdesk', '1', '2025-07-28 16:42:40', '2025-07-28 16:42:40');


INSERT INTO `guests` (`id`, `branch_id`, `name`, `contact`, `qr_code`, `room_id`, `previous_room_id`, `rate_id`, `type_id`, `static_amount`, `is_long_stay`, `number_of_days`, `has_discount`, `discount_amount`, `has_kiosk_check_out`, `created_at`, `updated_at`) VALUES
(1, 1, 'jose manalo', 'N/A', '1250001', 1, NULL, 4, 2, 480, 0, 0, 0, '50.00', 1, '2025-08-31 13:37:09', '2025-07-31 13:47:45');
INSERT INTO `guests` (`id`, `branch_id`, `name`, `contact`, `qr_code`, `room_id`, `previous_room_id`, `rate_id`, `type_id`, `static_amount`, `is_long_stay`, `number_of_days`, `has_discount`, `discount_amount`, `has_kiosk_check_out`, `created_at`, `updated_at`) VALUES
(2, 1, 'john romero', 'N/A', '1250002', 4, NULL, 5, 2, 592, 0, 0, 0, '50.00', 1, '2025-07-31 13:37:57', '2025-07-31 14:38:58');
INSERT INTO `guests` (`id`, `branch_id`, `name`, `contact`, `qr_code`, `room_id`, `previous_room_id`, `rate_id`, `type_id`, `static_amount`, `is_long_stay`, `number_of_days`, `has_discount`, `discount_amount`, `has_kiosk_check_out`, `created_at`, `updated_at`) VALUES
(3, 1, 'micheal diaz', 'N/A', '1250003', 3, NULL, 9, 3, 872, 0, 0, 0, '50.00', 0, '2025-07-31 13:38:35', '2025-07-31 14:40:23');
INSERT INTO `guests` (`id`, `branch_id`, `name`, `contact`, `qr_code`, `room_id`, `previous_room_id`, `rate_id`, `type_id`, `static_amount`, `is_long_stay`, `number_of_days`, `has_discount`, `discount_amount`, `has_kiosk_check_out`, `created_at`, `updated_at`) VALUES
(4, 1, 'def', 'N/A', '1250004', 1, NULL, 4, 2, 480, 0, 0, 0, '50.00', 1, '2025-07-31 14:41:54', '2025-07-31 14:42:34'),
(5, 1, 'fed', 'N/A', '1250005', 1, NULL, 4, 2, 480, 0, 0, 0, '50.00', 1, '2025-07-31 15:00:08', '2025-07-31 15:00:43');

INSERT INTO `hotel_items` (`id`, `branch_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'MAIN DOOR', 5000, '2025-07-28 16:39:11', '2025-07-28 16:39:11');
INSERT INTO `hotel_items` (`id`, `branch_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(2, 1, 'PURTAHAN SA C.R.', 2500, '2025-07-28 16:39:11', '2025-07-28 16:39:11');
INSERT INTO `hotel_items` (`id`, `branch_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(3, 1, 'SUGA SA ROOM', 150, '2025-07-28 16:39:11', '2025-07-28 16:39:11');
INSERT INTO `hotel_items` (`id`, `branch_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(4, 1, 'SUGA SA C.R.', 130, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(5, 1, 'SAMIN SULOD SA ROOM', 1000, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(6, 1, 'SAMIN SULOD SA C.R.', 1000, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(7, 1, 'SAMIN SA GAWAS', 1500, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(8, 1, 'SALOG SA ROOM PER TILES', 1200, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(9, 1, 'SALOG SA C.R. PER TILE', 1200, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(10, 1, 'RUG/ TRAPO SA SALOG', 40, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(11, 1, 'UNLAN', 500, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(12, 1, 'HABOL', 500, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(13, 1, 'PUNDA', 200, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(14, 1, 'PUNDA WITH MANTSA(HAIR DYE)', 500, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(15, 1, 'BEDSHEET WITH INK', 500, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(16, 1, 'BED PAD WITH INK', 800, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(17, 1, 'BED SKIRT WITH INK', 1500, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(18, 1, 'TOWEL', 300, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(19, 1, 'DOORKNOB C.R.', 350, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(20, 1, 'MAIN DOOR DOORKNOB', 500, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(21, 1, 'T.V.', 30000, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(22, 1, 'TELEPHONE', 1000, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(23, 1, 'DECODER PARA SA CABLE', 1600, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(24, 1, 'CORD SA DECODER', 100, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(25, 1, 'CHARGER SA DECODER', 400, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(26, 1, 'WIRING SA TELEPHONE', 100, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(27, 1, 'WIRINGS SA T.V.', 200, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(28, 1, 'WIRING SA DECODER', 50, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(29, 1, 'CEILING', 0, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(30, 1, 'SHOWER HEAD', 800, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(31, 1, 'SHOWER BULB', 800, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(32, 1, 'BIDET', 400, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(33, 1, 'HINGES/ TOWEL BAR', 200, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(34, 1, 'TAKLOB SA TANGKE', 1200, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(35, 1, 'TANGKE SA BOWL', 3000, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(36, 1, 'TAKLOB SA BOWL', 1000, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(37, 1, 'ILALOM SA LABABO', 0, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(38, 1, 'SINK/LABABO', 1500, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(39, 1, 'BASURAHAN', 70, '2025-07-28 16:39:11', '2025-07-28 16:39:11');









INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_01_09_003353_create_sessions_table', 1),
(7, '2023_01_09_011352_create_permission_tables', 1),
(8, '2023_01_09_013909_create_branches_table', 1),
(9, '2023_01_09_044158_create_types_table', 1),
(10, '2023_01_09_062131_create_staying_hours_table', 1),
(11, '2023_01_09_062147_create_rates_table', 1),
(12, '2023_01_10_013013_create_floors_table', 1),
(13, '2023_01_10_053310_create_rooms_table', 1),
(14, '2023_01_11_054703_create_discounts_table', 1),
(15, '2023_01_11_072554_create_extension_rates_table', 1),
(16, '2023_01_11_082241_create_hotel_items_table', 1),
(17, '2023_01_11_112128_create_requestable_items_table', 1),
(18, '2023_01_13_015319_create_guests_table', 1),
(19, '2023_01_13_015911_create_temporary_check_in_kiosks_table', 1),
(20, '2023_01_13_110452_create_jobs_table', 1),
(21, '2023_01_13_133418_create_transactions_table', 1),
(22, '2023_01_13_133436_create_checkin_details_table', 1),
(23, '2023_01_17_110924_create_transaction_types_table', 1),
(24, '2023_01_24_111333_create_cleaning_histories_table', 1),
(25, '2023_01_24_170546_create_menu_categories_table', 1),
(26, '2023_01_24_184549_create_menus_table', 1),
(27, '2023_01_24_184821_create_inventories_table', 1),
(28, '2023_01_31_110026_create_frontdesks_table', 1),
(29, '2023_01_31_114024_create_assigned_frontdesks_table', 1),
(30, '2023_02_06_205903_create_expense_categories_table', 1),
(31, '2023_02_07_081720_create_expenses_table', 1),
(32, '2023_02_08_204445_create_shift_logs_table', 1),
(33, '2023_02_09_101803_create_stay_extensions_table', 1),
(34, '2023_02_28_110640_create_new_guest_reports_table', 1),
(35, '2023_02_28_143009_create_check_out_guest_reports_table', 1),
(36, '2023_03_01_115621_create_room_boy_reports_table', 1),
(37, '2023_03_02_135506_create_unoccupied_room_reports_table', 1),
(38, '2023_03_02_144943_create_extended_guest_reports_table', 1),
(39, '2023_03_09_214821_create_temporary_reserveds_table', 1),
(40, '2024_05_06_083859_create_frontdesk_categories_table', 1),
(41, '2024_05_06_084015_create_frontdesk_menus_table', 1),
(42, '2024_05_06_084026_create_frontdesk_inventories_table', 1),
(43, '2024_05_06_170704_create_pub_categories_table', 1),
(44, '2024_05_06_170716_create_pub_menus_table', 1),
(45, '2024_05_06_170724_create_pub_inventories_table', 1),
(46, '2024_05_20_150902_add_column_previous_room_id_on_guests_table', 1),
(47, '2025_06_05_092953_change_data_type_on_rooms_table', 1),
(48, '2025_06_16_090707_add_column_initial_deposit_to_branch_table', 1),
(49, '2025_06_18_102414_add_column_deposit_enabled_to_branches_table', 1),
(50, '2025_06_18_140238_add_column_has_discount_to_guests_table', 1),
(51, '2025_06_24_102431_add_column_has_discount_to_rates_table', 1),
(52, '2025_07_01_104113_add_column_has_kiosk_check_out_to_guests_table', 1),
(53, '2025_07_21_111252_add_column_user_id_to_expenses_table', 1),
(54, '2025_08_07_135126_add_column_image_on_frontdesk_menus', 2),
(55, '2025_08_08_142506_add_column_branch_id_to_room_boy_reports', 3),
(56, '2025_08_12_135730_create_floor_user_table', 4);



INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(2, 'App\\Models\\User', 2);
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(3, 'App\\Models\\User', 3);
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(6, 'App\\Models\\User', 4),
(5, 'App\\Models\\User', 5),
(7, 'App\\Models\\User', 6),
(4, 'App\\Models\\User', 7),
(8, 'App\\Models\\User', 8);

INSERT INTO `new_guest_reports` (`id`, `branch_id`, `room_id`, `checkin_details_id`, `shift_date`, `shift`, `frontdesk_id`, `partner_name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'July 28, 2025', 'AM', 1, '1', '2025-07-31 13:40:50', '2025-07-31 13:40:50');
INSERT INTO `new_guest_reports` (`id`, `branch_id`, `room_id`, `checkin_details_id`, `shift_date`, `shift`, `frontdesk_id`, `partner_name`, `created_at`, `updated_at`) VALUES
(2, 1, 4, 2, 'July 28, 2025', 'AM', 1, '1', '2025-07-31 14:38:03', '2025-07-31 14:38:03');
INSERT INTO `new_guest_reports` (`id`, `branch_id`, `room_id`, `checkin_details_id`, `shift_date`, `shift`, `frontdesk_id`, `partner_name`, `created_at`, `updated_at`) VALUES
(3, 1, 3, 3, 'July 28, 2025', 'AM', 1, '1', '2025-07-31 14:40:23', '2025-07-31 14:40:23');
INSERT INTO `new_guest_reports` (`id`, `branch_id`, `room_id`, `checkin_details_id`, `shift_date`, `shift`, `frontdesk_id`, `partner_name`, `created_at`, `updated_at`) VALUES
(4, 1, 1, 4, 'July 28, 2025', 'AM', 1, '1', '2025-07-31 14:42:07', '2025-07-31 14:42:07'),
(5, 1, 1, 5, 'July 28, 2025', 'AM', 1, '1', '2025-07-31 15:00:22', '2025-07-31 15:00:22');





INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 4, 'mobile-token', 'a2d09a52b497b88b1706c5c1591e70c9ddc1421701e880a021f5cffb638bac64', '[\"*\"]', '2025-07-31 15:27:16', NULL, '2025-07-31 13:35:39', '2025-07-31 15:27:16');








INSERT INTO `rates` (`id`, `branch_id`, `staying_hour_id`, `type_id`, `amount`, `is_available`, `has_discount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 224, 1, 0, '2025-07-28 16:39:11', '2025-07-28 16:39:11');
INSERT INTO `rates` (`id`, `branch_id`, `staying_hour_id`, `type_id`, `amount`, `is_available`, `has_discount`, `created_at`, `updated_at`) VALUES
(2, 1, 2, 1, 336, 1, 0, '2025-07-28 16:39:11', '2025-07-28 16:39:11');
INSERT INTO `rates` (`id`, `branch_id`, `staying_hour_id`, `type_id`, `amount`, `is_available`, `has_discount`, `created_at`, `updated_at`) VALUES
(3, 1, 4, 1, 560, 1, 0, '2025-07-28 16:39:11', '2025-07-28 16:39:11');
INSERT INTO `rates` (`id`, `branch_id`, `staying_hour_id`, `type_id`, `amount`, `is_available`, `has_discount`, `created_at`, `updated_at`) VALUES
(4, 1, 1, 2, 280, 1, 0, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(5, 1, 2, 2, 392, 1, 1, '2025-07-28 16:39:11', '2025-07-28 16:39:40'),
(6, 1, 4, 2, 616, 1, 1, '2025-07-28 16:39:11', '2025-07-28 16:39:43'),
(7, 1, 1, 3, 336, 1, 0, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(8, 1, 2, 3, 448, 1, 1, '2025-07-28 16:39:11', '2025-07-28 16:39:48'),
(9, 1, 4, 3, 672, 1, 1, '2025-07-28 16:39:11', '2025-07-28 16:39:50');

INSERT INTO `requestable_items` (`id`, `branch_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'EXTRA PERSON WITH FREE PILLOW, BLANKET,TOWEL', 100, '2025-07-28 16:39:11', '2025-07-28 16:39:11');
INSERT INTO `requestable_items` (`id`, `branch_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(2, 1, 'EXTRA PILLOW', 20, '2025-07-28 16:39:11', '2025-07-28 16:39:11');
INSERT INTO `requestable_items` (`id`, `branch_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(3, 1, 'EXTRA TOWEL', 20, '2025-07-28 16:39:11', '2025-07-28 16:39:11');
INSERT INTO `requestable_items` (`id`, `branch_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(4, 1, 'EXTRA BLANKET', 20, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(5, 1, 'EXTRA FITTED SHEET', 20, '2025-07-28 16:39:11', '2025-07-28 16:39:11');



INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'web', '2025-07-28 16:39:08', '2025-07-28 16:39:08');
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'web', '2025-07-28 16:39:08', '2025-07-28 16:39:08');
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(3, 'frontdesk', 'web', '2025-07-28 16:39:08', '2025-07-28 16:39:08');
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(4, 'roomboy', 'web', '2025-07-28 16:39:08', '2025-07-28 16:39:08'),
(5, 'kitchen', 'web', '2025-07-28 16:39:08', '2025-07-28 16:39:08'),
(6, 'kiosk', 'web', '2025-07-28 16:39:08', '2025-07-28 16:39:08'),
(7, 'back_office', 'web', '2025-07-28 16:39:08', '2025-07-28 16:39:08'),
(8, 'pub_kitchen', 'web', '2025-07-28 16:39:11', '2025-07-28 16:39:11');

INSERT INTO `room_boy_reports` (`id`, `branch_id`, `room_id`, `checkin_details_id`, `roomboy_id`, `cleaning_start`, `cleaning_end`, `total_hours_spent`, `interval`, `shift`, `is_cleaned`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 7, '2025-07-31 14:40:14', '2025-07-31 14:59:33', 19, 0, 'AM', 1, '2025-07-31 14:40:14', '2025-07-31 14:59:33');
INSERT INTO `room_boy_reports` (`id`, `branch_id`, `room_id`, `checkin_details_id`, `roomboy_id`, `cleaning_start`, `cleaning_end`, `total_hours_spent`, `interval`, `shift`, `is_cleaned`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 5, 7, '2025-07-31 15:00:53', '2025-07-31 15:15:53', 0, 1, 'AM', 0, '2025-07-31 15:00:53', '2025-07-31 15:00:53');


INSERT INTO `rooms` (`id`, `branch_id`, `floor_id`, `number`, `area`, `status`, `type_id`, `is_priority`, `last_checkin_at`, `last_checkout_at`, `time_to_terminate_queue`, `check_out_time`, `time_to_clean`, `started_cleaning_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1', 'Main', 'Cleaning', 2, 1, '2025-07-31', '2025-07-31', NULL, '2025-07-31', '2025-07-31 18:00:49', '2025-07-31 15:00:53', '2025-07-28 16:39:09', '2025-07-31 15:00:53');
INSERT INTO `rooms` (`id`, `branch_id`, `floor_id`, `number`, `area`, `status`, `type_id`, `is_priority`, `last_checkin_at`, `last_checkout_at`, `time_to_terminate_queue`, `check_out_time`, `time_to_clean`, `started_cleaning_at`, `created_at`, `updated_at`) VALUES
(2, 1, 1, '10', 'Main', 'Available', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:40:33');
INSERT INTO `rooms` (`id`, `branch_id`, `floor_id`, `number`, `area`, `status`, `type_id`, `is_priority`, `last_checkin_at`, `last_checkout_at`, `time_to_terminate_queue`, `check_out_time`, `time_to_clean`, `started_cleaning_at`, `created_at`, `updated_at`) VALUES
(3, 1, 1, '11', 'Main', 'Occupied', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-31 14:40:23');
INSERT INTO `rooms` (`id`, `branch_id`, `floor_id`, `number`, `area`, `status`, `type_id`, `is_priority`, `last_checkin_at`, `last_checkout_at`, `time_to_terminate_queue`, `check_out_time`, `time_to_clean`, `started_cleaning_at`, `created_at`, `updated_at`) VALUES
(4, 1, 1, '12', 'Main', 'Uncleaned', 2, 1, '2025-07-31', '2025-07-31', NULL, '2025-07-31', '2025-07-31 17:39:06', NULL, '2025-07-28 16:39:09', '2025-07-31 14:39:06'),
(5, 1, 1, '14', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(6, 1, 1, '15', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:40:43'),
(7, 1, 1, '16', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:40:44'),
(8, 1, 1, '17', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(9, 1, 1, '18', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(10, 1, 1, '19', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:40:44'),
(11, 1, 1, '2', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(12, 1, 1, '20', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(13, 1, 1, '21', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(14, 1, 1, '22', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(15, 1, 1, '23', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:40:47'),
(16, 1, 1, '24', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(17, 1, 1, '25', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(18, 1, 1, '26', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:40:47'),
(19, 1, 1, '27', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(20, 1, 1, '28', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(21, 1, 1, '29', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(22, 1, 1, '3', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(23, 1, 1, '30', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(24, 1, 1, '31', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(25, 1, 1, '32', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(26, 1, 1, '33', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(27, 1, 1, '34', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(28, 1, 1, '35', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(29, 1, 1, '36', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(30, 1, 1, '37', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(31, 1, 1, '38', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(32, 1, 1, '39', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(33, 1, 1, '4', 'Main', 'Available', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:40:05'),
(34, 1, 1, '5', 'Main', 'Available', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:40:06'),
(35, 1, 1, '50', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(36, 1, 1, '51', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(37, 1, 1, '52', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(38, 1, 1, '53', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(39, 1, 1, '6', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(40, 1, 1, '7', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(41, 1, 1, '8', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(42, 1, 1, '9', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(43, 1, 2, '100', 'Main', 'Available', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:33'),
(44, 1, 2, '101', 'Main', 'Available', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:34'),
(45, 1, 2, '60', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(46, 1, 2, '61', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(47, 1, 2, '62', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(48, 1, 2, '63', 'Main', 'Available', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:06'),
(49, 1, 2, '64', 'Main', 'Available', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:06'),
(50, 1, 2, '65', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(51, 1, 2, '66', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(52, 1, 2, '67', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(53, 1, 2, '68', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(54, 1, 2, '69', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(55, 1, 2, '70', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:48'),
(56, 1, 2, '71', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(57, 1, 2, '72', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(58, 1, 2, '73', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:48'),
(59, 1, 2, '74', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:49'),
(60, 1, 2, '75', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(61, 1, 2, '76', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(62, 1, 2, '77', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:50'),
(63, 1, 2, '78', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(64, 1, 2, '79', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(65, 1, 2, '80', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(66, 1, 2, '81', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:50'),
(67, 1, 2, '82', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(68, 1, 2, '83', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:51'),
(69, 1, 2, '84', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:51'),
(70, 1, 2, '85', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(71, 1, 2, '86', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(72, 1, 2, '87', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(73, 1, 2, '88', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(74, 1, 2, '89', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(75, 1, 2, '90', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(76, 1, 2, '91', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(77, 1, 2, '92', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(78, 1, 2, '93', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(79, 1, 2, '94', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(80, 1, 2, '95', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(81, 1, 2, '96', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(82, 1, 2, '97', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(83, 1, 2, '98', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(84, 1, 2, '99', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(85, 1, 3, '120', 'Main', 'Available', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:34'),
(86, 1, 3, '121', 'Main', 'Available', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:34'),
(87, 1, 3, '122', 'Main', 'Available', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:35'),
(88, 1, 3, '123', 'Main', 'Available', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:03'),
(89, 1, 3, '124', 'Main', 'Available', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:03'),
(90, 1, 3, '125', 'Main', 'Available', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:35'),
(91, 1, 3, '126', 'Main', 'Available', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:35'),
(92, 1, 3, '127', 'Main', 'Available', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:36'),
(93, 1, 3, '128', 'Main', 'Available', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:36'),
(94, 1, 3, '129', 'Main', 'Available', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:37'),
(95, 1, 3, '130', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:42'),
(96, 1, 3, '131', 'Main', 'Available', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:37'),
(97, 1, 3, '132', 'Main', 'Available', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:37'),
(98, 1, 3, '133', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:42'),
(99, 1, 3, '134', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(100, 1, 3, '135', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(101, 1, 3, '136', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(102, 1, 3, '137', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:43'),
(103, 1, 3, '138', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(104, 1, 3, '139', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(105, 1, 3, '150', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(106, 1, 3, '151', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:43'),
(107, 1, 3, '152', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(108, 1, 3, '153', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(109, 1, 3, '154', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:44'),
(110, 1, 3, '155', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(111, 1, 3, '156', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(112, 1, 3, '157', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(113, 1, 3, '158', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(114, 1, 3, '159', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(115, 1, 3, '160', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(116, 1, 3, '161', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(117, 1, 3, '162', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(118, 1, 3, '163', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(119, 1, 3, '164', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(120, 1, 3, '165', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(121, 1, 3, '166', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(122, 1, 3, '167', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(123, 1, 3, '168', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(124, 1, 3, '169', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(125, 1, 3, '170', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(126, 1, 3, '171', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(127, 1, 4, '200', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(128, 1, 4, '201', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(129, 1, 4, '202', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(130, 1, 4, '203', 'Main', 'Available', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:03'),
(131, 1, 4, '204', 'Main', 'Available', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:04'),
(132, 1, 4, '205', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(133, 1, 4, '206', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(134, 1, 4, '207', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(135, 1, 4, '208', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(136, 1, 4, '209', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(137, 1, 4, '210', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:45'),
(138, 1, 4, '211', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(139, 1, 4, '212', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(140, 1, 4, '214', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:45'),
(141, 1, 4, '215', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:45'),
(142, 1, 4, '216', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(143, 1, 4, '217', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(144, 1, 4, '218', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:46'),
(145, 1, 4, '219', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(146, 1, 4, '220', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(147, 1, 4, '221', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(148, 1, 4, '222', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:46'),
(149, 1, 4, '223', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(150, 1, 4, '224', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(151, 1, 4, '225', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:40:46'),
(152, 1, 4, '226', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(153, 1, 4, '227', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(154, 1, 4, '228', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(155, 1, 4, '229', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(156, 1, 4, '230', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(157, 1, 4, '231', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(158, 1, 4, '232', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(159, 1, 4, '233', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(160, 1, 4, '234', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(161, 1, 4, '235', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(162, 1, 4, '236', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(163, 1, 4, '237', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(164, 1, 4, '238', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(165, 1, 4, '239', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(166, 1, 4, '250', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(167, 1, 4, '251', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(168, 1, 5, '253', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(169, 1, 5, '254', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(170, 1, 5, '255', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(171, 1, 5, '256', 'Main', 'Available', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:40:04'),
(172, 1, 5, '257', 'Main', 'Available', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:40:05'),
(173, 1, 5, '258', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(174, 1, 5, '259', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(175, 1, 5, '260', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(176, 1, 5, '261', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(177, 1, 5, '262', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(178, 1, 5, '263', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(179, 1, 5, '264', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(180, 1, 5, '265', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(181, 1, 5, '266', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(182, 1, 5, '267', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(183, 1, 5, '268', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(184, 1, 5, '269', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(185, 1, 5, '270', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(186, 1, 5, '271', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(187, 1, 5, '272', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(188, 1, 5, '273', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(189, 1, 5, '274', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(190, 1, 5, '275', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(191, 1, 5, '276', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(192, 1, 5, '277', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(193, 1, 5, '278', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(194, 1, 5, '279', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(195, 1, 5, '280', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(196, 1, 5, '281', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(197, 1, 5, '282', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(198, 1, 5, '283', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(199, 1, 5, '284', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(200, 1, 5, '285', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(201, 1, 5, '286', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(202, 1, 5, '287', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(203, 1, 5, '288', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(204, 1, 5, '289', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(205, 1, 5, '290', 'Main', 'Available', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:40:05');
INSERT INTO `rooms` (`id`, `branch_id`, `floor_id`, `number`, `area`, `status`, `type_id`, `is_priority`, `last_checkin_at`, `last_checkout_at`, `time_to_terminate_queue`, `check_out_time`, `time_to_clean`, `started_cleaning_at`, `created_at`, `updated_at`) VALUES
(206, 1, 5, '294', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11');

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('SYKNWjREGkpkONukZIQ46jrxLXjzbCyqyp7CLxff', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibVpxRE5UQlpJWE9RRW5WbWZpOVRLYXNuY1B0c3g3SGhhMVU0eWNCMyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi91c2VycyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkMk9YSWlwS0phT0ZZb2l3UWJLZEVDdW93cHpMWFhrUWNJWW9BaWJYSUJ2SDZ5OVdYaFZJOFciO30=', 1754978699);


INSERT INTO `shift_logs` (`id`, `time_in`, `time_out`, `frontdesk_ids`, `created_at`, `updated_at`) VALUES
(1, '2025-07-28 16:43:01', NULL, '[1, \"1\"]', '2025-07-28 16:43:01', '2025-07-28 16:43:01');


INSERT INTO `stay_extensions` (`id`, `guest_id`, `extension_id`, `hours`, `amount`, `frontdesk_ids`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '12', '336', '\"[1,\\\"1\\\"]\"', '2025-07-31 13:42:23', '2025-07-31 13:42:23');
INSERT INTO `stay_extensions` (`id`, `guest_id`, `extension_id`, `hours`, `amount`, `frontdesk_ids`, `created_at`, `updated_at`) VALUES
(2, 1, 2, '12', '336', '\"[1,\\\"1\\\"]\"', '2025-07-31 13:42:31', '2025-07-31 13:42:31');


INSERT INTO `staying_hours` (`id`, `branch_id`, `number`, `created_at`, `updated_at`) VALUES
(1, 1, 6, '2025-07-28 16:39:09', '2025-07-28 16:39:09');
INSERT INTO `staying_hours` (`id`, `branch_id`, `number`, `created_at`, `updated_at`) VALUES
(2, 1, 12, '2025-07-28 16:39:09', '2025-07-28 16:39:09');
INSERT INTO `staying_hours` (`id`, `branch_id`, `number`, `created_at`, `updated_at`) VALUES
(3, 1, 18, '2025-07-28 16:39:09', '2025-07-28 16:39:09');
INSERT INTO `staying_hours` (`id`, `branch_id`, `number`, `created_at`, `updated_at`) VALUES
(4, 1, 24, '2025-07-28 16:39:09', '2025-07-28 16:39:09');





INSERT INTO `transaction_types` (`id`, `name`, `position`, `created_at`, `updated_at`) VALUES
(1, 'Check In', '1', '2025-07-28 16:39:11', '2025-07-28 16:39:11');
INSERT INTO `transaction_types` (`id`, `name`, `position`, `created_at`, `updated_at`) VALUES
(2, 'Deposit', '2', '2025-07-28 16:39:11', '2025-07-28 16:39:11');
INSERT INTO `transaction_types` (`id`, `name`, `position`, `created_at`, `updated_at`) VALUES
(3, 'Kitchen Order', '3', '2025-07-28 16:39:11', '2025-07-28 16:39:11');
INSERT INTO `transaction_types` (`id`, `name`, `position`, `created_at`, `updated_at`) VALUES
(4, 'Damage Charges', '4', '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(5, 'Cashout', '5', '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(6, 'Extend', '6', '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(7, 'Transfer Room', '7', '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(8, 'Amenities', '8', '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(9, 'Food and Beverages', '8', '2025-07-28 16:39:11', '2025-07-28 16:39:11');

INSERT INTO `transactions` (`id`, `branch_id`, `room_id`, `guest_id`, `floor_id`, `transaction_type_id`, `assigned_frontdesk_id`, `description`, `payable_amount`, `paid_amount`, `change_amount`, `deposit_amount`, `paid_at`, `override_at`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 1, '\"[1,\\\"1\\\"]\"', 'Guest Check In', 480, 480, 0, 0, '2025-07-31 13:40:50', NULL, 'Guest Checked In at room #1', '2025-07-31 13:40:50', '2025-07-31 13:40:50');
INSERT INTO `transactions` (`id`, `branch_id`, `room_id`, `guest_id`, `floor_id`, `transaction_type_id`, `assigned_frontdesk_id`, `description`, `payable_amount`, `paid_amount`, `change_amount`, `deposit_amount`, `paid_at`, `override_at`, `remarks`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 1, 1, 2, '\"[1,\\\"1\\\"]\"', 'Deposit', 200, 480, 0, 200, '2025-07-31 13:40:50', NULL, 'Deposit From Check In (Room Key & TV Remote)', '2025-07-31 13:40:50', '2025-07-31 13:40:50');
INSERT INTO `transactions` (`id`, `branch_id`, `room_id`, `guest_id`, `floor_id`, `transaction_type_id`, `assigned_frontdesk_id`, `description`, `payable_amount`, `paid_amount`, `change_amount`, `deposit_amount`, `paid_at`, `override_at`, `remarks`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 1, 1, 6, '\"[1,\\\"1\\\"]\"', 'Extension', 336, 336, 0, 0, '2025-07-31 14:38:38', NULL, 'Guest Extension : 12 hours', '2025-07-31 13:42:23', '2025-07-31 14:38:38');
INSERT INTO `transactions` (`id`, `branch_id`, `room_id`, `guest_id`, `floor_id`, `transaction_type_id`, `assigned_frontdesk_id`, `description`, `payable_amount`, `paid_amount`, `change_amount`, `deposit_amount`, `paid_at`, `override_at`, `remarks`, `created_at`, `updated_at`) VALUES
(4, 1, 1, 1, 1, 6, '\"[1,\\\"1\\\"]\"', 'Extension', 336, 0, 0, 0, '2025-07-31 14:38:38', NULL, 'Guest Extension : 12 hours', '2025-07-31 13:42:31', '2025-07-31 14:38:38'),
(5, 1, 4, 2, 1, 1, '\"[1,\\\"1\\\"]\"', 'Guest Check In', 592, 592, 0, 0, '2025-07-31 14:38:03', NULL, 'Guest Checked In at room #12', '2025-07-31 14:38:03', '2025-07-31 14:38:03'),
(6, 1, 4, 2, 1, 2, '\"[1,\\\"1\\\"]\"', 'Deposit', 200, 592, 0, 200, '2025-07-31 14:38:03', NULL, 'Deposit From Check In (Room Key & TV Remote)', '2025-07-31 14:38:03', '2025-07-31 14:38:03'),
(7, 1, 3, 3, 1, 1, '\"[1,\\\"1\\\"]\"', 'Guest Check In', 872, 872, 0, 0, '2025-07-31 14:40:23', NULL, 'Guest Checked In at room #11', '2025-07-31 14:40:23', '2025-07-31 14:40:23'),
(8, 1, 3, 3, 1, 2, '\"[1,\\\"1\\\"]\"', 'Deposit', 200, 872, 0, 200, '2025-07-31 14:40:23', NULL, 'Deposit From Check In (Room Key & TV Remote)', '2025-07-31 14:40:23', '2025-07-31 14:40:23'),
(9, 1, 1, 4, 1, 1, '\"[1,\\\"1\\\"]\"', 'Guest Check In', 480, 480, 0, 0, '2025-07-31 14:42:07', NULL, 'Guest Checked In at room #1', '2025-07-31 14:42:07', '2025-07-31 14:42:07'),
(10, 1, 1, 4, 1, 2, '\"[1,\\\"1\\\"]\"', 'Deposit', 200, 480, 0, 200, '2025-07-31 14:42:07', NULL, 'Deposit From Check In (Room Key & TV Remote)', '2025-07-31 14:42:07', '2025-07-31 14:42:07'),
(11, 1, 1, 5, 1, 1, '\"[1,\\\"1\\\"]\"', 'Guest Check In', 480, 480, 0, 0, '2025-07-31 15:00:22', NULL, 'Guest Checked In at room #1', '2025-07-31 15:00:22', '2025-07-31 15:00:22'),
(12, 1, 1, 5, 1, 2, '\"[1,\\\"1\\\"]\"', 'Deposit', 200, 480, 0, 200, '2025-07-31 15:00:22', NULL, 'Deposit From Check In (Room Key & TV Remote)', '2025-07-31 15:00:22', '2025-07-31 15:00:22');

INSERT INTO `types` (`id`, `branch_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Single size Bed', NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09');
INSERT INTO `types` (`id`, `branch_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(2, 1, ' Double size Bed', NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09');
INSERT INTO `types` (`id`, `branch_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(3, 1, 'Twin size Bed', NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09');



INSERT INTO `users` (`id`, `branch_id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `branch_name`, `remember_token`, `current_team_id`, `roomboy_assigned_floor_id`, `roomboy_cleaning_room_id`, `profile_photo_path`, `assigned_frontdesks`, `time_in`, `created_at`, `updated_at`) VALUES
(1, 1, 'Superadmin', 'superadmin@gmail.com', NULL, '$2y$10$cCxMTrjHcK08pf4lqqgT5Onop9ZuVEmJWRoohE9kx7ooXgksRFfzC', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:08', '2025-07-28 16:39:08');
INSERT INTO `users` (`id`, `branch_id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `branch_name`, `remember_token`, `current_team_id`, `roomboy_assigned_floor_id`, `roomboy_cleaning_room_id`, `profile_photo_path`, `assigned_frontdesks`, `time_in`, `created_at`, `updated_at`) VALUES
(2, 1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$2OXIipKJaOFYoiwQbKdECuowpzLXXkQcIYoAibXIBvH6y9WXhVI8W', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09');
INSERT INTO `users` (`id`, `branch_id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `branch_name`, `remember_token`, `current_team_id`, `roomboy_assigned_floor_id`, `roomboy_cleaning_room_id`, `profile_photo_path`, `assigned_frontdesks`, `time_in`, `created_at`, `updated_at`) VALUES
(3, 1, 'Frontdesk', 'frontdesk@gmail.com', NULL, '$2y$10$slMibp06tSpWR02xB9UUjuSxybnvI/0oIRaKDmbbRrBz/UdogT6O.', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, '\"[1,\\\"1\\\"]\"', '2025-07-28 16:43:01', '2025-07-28 16:39:09', '2025-07-28 16:43:01');
INSERT INTO `users` (`id`, `branch_id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `branch_name`, `remember_token`, `current_team_id`, `roomboy_assigned_floor_id`, `roomboy_cleaning_room_id`, `profile_photo_path`, `assigned_frontdesks`, `time_in`, `created_at`, `updated_at`) VALUES
(4, 1, 'Kiosk', 'kiosk@gmail.com', NULL, '$2y$10$fMYmc0d8Dcpza4v7C8vP4.CN9WhWWoal4epRNHo7UmyaU5nKOxiRK', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(5, 1, 'Kitchen', 'kitchen@gmail.com', NULL, '$2y$10$yqqkZT7QzGVgPfO1S87xDewIX8KYXLaaVdtYBlKWDkwSBS0psKANq', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(6, 1, 'Back Office', 'back-office@gmail.com', NULL, '$2y$10$3RN7fKC3cCBD11x1.smwSOdShPsHvF/tkDl/e5.mtvo6RWW.E9MqC', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:39:09'),
(7, 1, 'Roomboy', 'roomboy@gmail.com', NULL, '$2y$10$cn.orG1WD3./m8ewaWBOoO3Nf45G7jUdLVkcoW1BpaL7Ef1gPLaAu', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, 1, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-31 15:00:53'),
(8, 1, 'PUB Kitchen', 'pub-kitchen@gmail.com', NULL, '$2y$10$FjzCpCHXLRrxvWNd.glOeuf48o4YcrWyGx9N.I0U3vOthw1HwnVIC', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;