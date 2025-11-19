/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP TABLE IF EXISTS `activity_logs`;
CREATE TABLE `activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `activity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `autorization_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_autorization` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `shift_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shift` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frontdesk_id` int NOT NULL,
  `partner_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `checkin_details`;
CREATE TABLE `checkin_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `guest_id` bigint unsigned NOT NULL,
  `frontdesk_id` int DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `cleaning_histories`;
CREATE TABLE `cleaning_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `room_id` bigint unsigned NOT NULL,
  `floor_id` bigint unsigned NOT NULL,
  `branch_id` bigint unsigned NOT NULL,
  `start_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_assigned_floor_id` tinyint(1) NOT NULL,
  `expected_end_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cleaning_duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delayed_cleaning` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `discounts`;
CREATE TABLE `discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `expenses`;
CREATE TABLE `expenses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `shift` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expense_category_id` bigint unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `shift` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frontdesk_id` int NOT NULL,
  `partner_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `frontdesk_inventories`;
CREATE TABLE `frontdesk_inventories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `frontdesk_menu_id` bigint unsigned NOT NULL,
  `number_of_serving` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `frontdesk_menus`;
CREATE TABLE `frontdesk_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `frontdesk_category_id` bigint unsigned NOT NULL,
  `item_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `frontdesks`;
CREATE TABLE `frontdesks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `guests`;
CREATE TABLE `guests` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qr_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_id` bigint unsigned NOT NULL,
  `previous_room_id` bigint unsigned DEFAULT NULL,
  `rate_id` bigint unsigned NOT NULL,
  `type_id` bigint unsigned NOT NULL,
  `static_amount` int NOT NULL,
  `is_long_stay` tinyint(1) NOT NULL DEFAULT '0',
  `number_of_days` int DEFAULT NULL,
  `has_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `has_kiosk_check_out` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `hotel_items`;
CREATE TABLE `hotel_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `menu_category_id` bigint unsigned NOT NULL,
  `item_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `shift_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shift` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frontdesk_id` int NOT NULL,
  `partner_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `pub_categories`;
CREATE TABLE `pub_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `shift` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_cleaned` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `floor_id` bigint unsigned NOT NULL,
  `number` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Main',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'available',
  `type_id` bigint unsigned NOT NULL,
  `is_priority` tinyint(1) NOT NULL DEFAULT '0',
  `last_checkin_at` datetime DEFAULT NULL,
  `last_checkout_at` datetime DEFAULT NULL,
  `time_to_terminate_queue` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_out_time` datetime DEFAULT NULL,
  `time_to_clean` datetime DEFAULT NULL,
  `started_cleaning_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `hours` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `frontdesk_ids` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payable_amount` int NOT NULL DEFAULT '0',
  `paid_amount` int NOT NULL DEFAULT '0',
  `change_amount` int NOT NULL DEFAULT '0',
  `deposit_amount` int NOT NULL DEFAULT '0',
  `paid_at` datetime DEFAULT NULL,
  `override_at` datetime DEFAULT NULL,
  `remarks` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `transfer_reason_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `transfer_reasons`;
CREATE TABLE `transfer_reasons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transfer_reasons_branch_id_foreign` (`branch_id`),
  CONSTRAINT `transfer_reasons_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `types`;
CREATE TABLE `types` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `unoccupied_room_reports`;
CREATE TABLE `unoccupied_room_reports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `shift` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rooms` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `frontdesk_id` int NOT NULL,
  `partner_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `branch_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `roomboy_assigned_floor_id` bigint unsigned DEFAULT NULL,
  `roomboy_cleaning_room_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assigned_frontdesks` json DEFAULT NULL,
  `time_in` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `activity_logs` (`id`, `branch_id`, `user_id`, `activity`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Create Room', 'Created room 108', '2025-11-18 14:30:46', '2025-11-18 14:30:46'),
(2, 1, 2, 'Create Room', 'Created room 117', '2025-11-18 14:31:07', '2025-11-18 14:31:07'),
(3, 1, 2, 'Create Room', 'Created room 119', '2025-11-18 14:31:23', '2025-11-18 14:31:23'),
(4, 1, 2, 'Create Room', 'Created room 300', '2025-11-18 14:32:17', '2025-11-18 14:32:17'),
(5, 1, 2, 'Create Frontdesk', 'Created frontdesk Bhong', '2025-11-18 14:36:36', '2025-11-18 14:36:36'),
(6, 1, 2, 'Create Category', 'Created category Snacks', '2025-11-18 14:37:02', '2025-11-18 14:37:02'),
(7, 1, 2, 'Create Category', 'Created category Drinks', '2025-11-18 14:37:08', '2025-11-18 14:37:08'),
(8, 1, 2, 'Update Room', 'Updated room 25', '2025-11-18 14:39:14', '2025-11-18 14:39:14'),
(9, 1, 2, 'Update Room', 'Updated room 30', '2025-11-18 14:39:24', '2025-11-18 14:39:24'),
(10, 1, 2, 'Update Room', 'Updated room 11', '2025-11-18 14:39:34', '2025-11-18 14:39:34'),
(11, 1, 2, 'Update Room', 'Updated room 15', '2025-11-18 14:39:45', '2025-11-18 14:39:45'),
(12, 1, 2, 'Update Room', 'Updated room 108', '2025-11-18 14:39:57', '2025-11-18 14:39:57'),
(13, 1, 2, 'Update Room', 'Updated room 117', '2025-11-18 14:40:08', '2025-11-18 14:40:08'),
(14, 1, 2, 'Update Room', 'Updated room 119', '2025-11-18 14:40:21', '2025-11-18 14:40:21'),
(15, 1, 2, 'Update Room', 'Updated room 200', '2025-11-18 14:40:33', '2025-11-18 14:40:33'),
(16, 1, 2, 'Update Room', 'Updated room 201', '2025-11-18 14:40:40', '2025-11-18 14:40:40'),
(17, 1, 2, 'Update Room', 'Updated room 300', '2025-11-18 14:40:49', '2025-11-18 14:40:49'),
(18, 1, 2, 'Create Menu', 'Created menu Chippy', '2025-11-18 14:43:21', '2025-11-18 14:43:21'),
(19, 1, 2, 'Create Menu', 'Created menu Nissin Cup Noodles', '2025-11-18 14:44:13', '2025-11-18 14:44:13'),
(20, 1, 2, 'Add Inventory', 'Added inventory for menu Chippy', '2025-11-18 14:44:30', '2025-11-18 14:44:30'),
(21, 1, 2, 'Add Inventory', 'Added inventory for menu Nissin Cup Noodles', '2025-11-18 14:44:34', '2025-11-18 14:44:34'),
(22, 1, 2, 'Create Menu', 'Created menu Coke Zero', '2025-11-18 15:00:09', '2025-11-18 15:00:09'),
(23, 1, 2, 'Create Menu', 'Created menu C2', '2025-11-18 15:00:44', '2025-11-18 15:00:44'),
(24, 1, 2, 'Create Menu', 'Created menu Nature\'s Spring 10ML', '2025-11-18 15:02:15', '2025-11-18 15:02:15'),
(25, 1, 2, 'Create Frontdesk', 'Created frontdesk Tan', '2025-11-18 15:02:29', '2025-11-18 15:02:29'),
(26, 1, 3, 'Check In from Kiosk', 'Checked in guest Marie Dela Cruz from kiosk', '2025-11-18 15:02:45', '2025-11-18 15:02:45'),
(27, 1, 3, 'Check In from Kiosk', 'Checked in guest Pie Tzu from kiosk', '2025-11-18 15:02:56', '2025-11-18 15:02:56'),
(28, 1, 3, 'Check In from Kiosk', 'Checked in guest Jose Pru from kiosk', '2025-11-18 15:03:12', '2025-11-18 15:03:12'),
(29, 1, 3, 'Check In from Kiosk', 'Checked in guest Ela Ziu from kiosk', '2025-11-18 15:03:40', '2025-11-18 15:03:40'),
(30, 1, 3, 'Check In from Kiosk', 'Checked in guest Kian Lee from kiosk', '2025-11-18 15:05:07', '2025-11-18 15:05:07'),
(31, 1, 3, 'Check In from Kiosk', 'Checked in guest Shein Tan from kiosk', '2025-11-18 15:05:29', '2025-11-18 15:05:29'),
(32, 1, 3, 'Check In from Kiosk', 'Checked in guest Carie Perry from kiosk', '2025-11-18 15:05:38', '2025-11-18 15:05:38'),
(33, 1, 3, 'Check In from Kiosk', 'Checked in guest Inna Liu from kiosk', '2025-11-18 15:05:46', '2025-11-18 15:05:46'),
(34, 1, 3, 'Check In from Kiosk', 'Checked in guest Ella Cy from kiosk', '2025-11-18 15:05:58', '2025-11-18 15:05:58'),
(35, 1, 3, 'Check In from Kiosk', 'Checked in guest Ariel Lee from kiosk', '2025-11-18 15:06:24', '2025-11-18 15:06:24'),
(36, 1, 3, 'Add Amenities', 'Added new amenities of ₱20 for guest Marie Dela Cruz', '2025-11-18 15:07:35', '2025-11-18 15:07:35'),
(37, 1, 3, 'Add Amenities', 'Added new amenities of ₱40 for guest Marie Dela Cruz', '2025-11-18 15:08:02', '2025-11-18 15:08:02'),
(38, 1, 2, 'Add Inventory', 'Added inventory for menu Coke Zero', '2025-11-18 15:08:51', '2025-11-18 15:08:51'),
(39, 1, 2, 'Add Inventory', 'Added inventory for menu C2', '2025-11-18 15:08:55', '2025-11-18 15:08:55'),
(40, 1, 2, 'Add Inventory', 'Added inventory for menu Nature\'s Spring 10ML', '2025-11-18 15:08:58', '2025-11-18 15:08:58'),
(41, 1, 3, 'Add Food and Beverages', 'Added new food and beverages of ₱10 for guest Marie Dela Cruz', '2025-11-18 15:12:37', '2025-11-18 15:12:37'),
(42, 1, 3, 'Add Food and Beverages', 'Added new food and beverages of ₱15 for guest Marie Dela Cruz', '2025-11-18 15:13:15', '2025-11-18 15:13:15'),
(43, 1, 3, 'Add Damage Charges', 'Added new damage charges of ₱200 for guest Marie Dela Cruz', '2025-11-18 15:13:51', '2025-11-18 15:13:51'),
(44, 1, 3, 'Add Damage Charges', 'Added new damage charges of ₱300 for guest Marie Dela Cruz', '2025-11-18 15:14:29', '2025-11-18 15:14:29'),
(45, 1, 3, 'Add Deposit', 'Added new deposit of ₱1000 for guest Marie Dela Cruz', '2025-11-18 15:14:55', '2025-11-18 15:14:55'),
(46, 1, 3, 'Add Amenities', 'Added new amenities of ₱20 for guest Pie Tzu', '2025-11-18 15:16:27', '2025-11-18 15:16:27'),
(47, 1, 3, 'Add Damage Charges', 'Added new damage charges of ₱500 for guest Pie Tzu', '2025-11-18 15:17:05', '2025-11-18 15:17:05'),
(48, 1, 3, 'Add Damage Charges', 'Added new damage charges of ₱130 for guest Jose Pru', '2025-11-18 15:18:18', '2025-11-18 15:18:18'),
(49, 1, 3, 'Add Damage Charges', 'Added new damage charges of ₱5000 for guest Jose Pru', '2025-11-18 15:18:31', '2025-11-18 15:18:31'),
(50, 1, 3, 'Add Food and Beverages', 'Added new food and beverages of ₱10 for guest Ela Ziu', '2025-11-18 15:19:27', '2025-11-18 15:19:27'),
(51, 1, 3, 'Add Damage Charges', 'Added new damage charges of ₱500 for guest Ela Ziu', '2025-11-18 15:19:40', '2025-11-18 15:19:40'),
(52, 1, 3, 'Add Extension', 'Added new extension of ₱1172 for guest Kian Lee', '2025-11-18 15:20:56', '2025-11-18 15:20:56'),
(53, 1, 3, 'Add Food and Beverages', 'Added new food and beverages of ₱30 for guest Kian Lee', '2025-11-18 15:21:17', '2025-11-18 15:21:17'),
(54, 1, 3, 'Add Damage Charges', 'Added new damage charges of ₱500 for guest Kian Lee', '2025-11-18 15:21:35', '2025-11-18 15:21:35'),
(55, 1, 3, 'Add Extension', 'Added new extension of ₱1060 for guest Shein Tan', '2025-11-18 15:22:35', '2025-11-18 15:22:35'),
(56, 1, 3, 'Add Food and Beverages', 'Added new food and beverages of ₱15 for guest Shein Tan', '2025-11-18 15:23:46', '2025-11-18 15:23:46'),
(57, 1, 3, 'Add Deposit', 'Added new deposit of ₱500 for guest Shein Tan', '2025-11-18 15:24:07', '2025-11-18 15:24:07'),
(58, 1, 3, 'Add Extension', 'Added new extension of ₱200 for guest Carie Perry', '2025-11-18 15:26:02', '2025-11-18 15:26:02'),
(59, 1, 3, 'Add Food and Beverages', 'Added new food and beverages of ₱15 for guest Carie Perry', '2025-11-18 15:26:28', '2025-11-18 15:26:28'),
(60, 1, 3, 'Add Deposit', 'Added new deposit of ₱1000 for guest Carie Perry', '2025-11-18 15:27:01', '2025-11-18 15:27:01'),
(61, 1, 3, 'Add Extension', 'Added new extension of ₱200 for guest Inna Liu', '2025-11-18 15:27:55', '2025-11-18 15:27:55'),
(62, 1, 3, 'Add Food and Beverages', 'Added new food and beverages of ₱30 for guest Inna Liu', '2025-11-18 15:28:13', '2025-11-18 15:28:13'),
(63, 1, 3, 'Add Deposit', 'Added new deposit of ₱2000 for guest Inna Liu', '2025-11-18 15:28:32', '2025-11-18 15:28:32'),
(64, 1, 3, 'Add Extension', 'Added new extension of ₱1116 for guest Ella Cy', '2025-11-18 15:29:21', '2025-11-18 15:29:21'),
(65, 1, 3, 'Add Food and Beverages', 'Added new food and beverages of ₱10 for guest Ella Cy', '2025-11-18 15:29:45', '2025-11-18 15:29:45'),
(66, 1, 3, 'Add Deposit', 'Added new deposit of ₱5000 for guest Ella Cy', '2025-11-18 15:30:23', '2025-11-18 15:30:23'),
(67, 1, 3, 'Add Extension', 'Added new extension of ₱716 for guest Ariel Lee', '2025-11-18 15:34:56', '2025-11-18 15:34:56'),
(68, 1, 3, 'Add Food and Beverages', 'Added new food and beverages of ₱15 for guest Ariel Lee', '2025-11-18 15:36:01', '2025-11-18 15:36:01'),
(69, 1, 3, 'Add Deposit', 'Added new deposit of ₱1000 for guest Ariel Lee', '2025-11-18 15:36:34', '2025-11-18 15:36:34'),
(70, 1, 3, 'Pay All Unpaid Balances', 'All unpaid balances are paid for guest Jose Pru', '2025-11-18 15:38:58', '2025-11-18 15:38:58'),
(71, 1, 3, 'Check Out', 'Checked out guest Jose Pru from Room #11', '2025-11-18 15:39:06', '2025-11-18 15:39:06'),
(72, 1, 3, 'Pay All Unpaid Balances', 'All unpaid balances are paid for guest Ela Ziu', '2025-11-18 15:39:25', '2025-11-18 15:39:25'),
(73, 1, 3, 'Check Out', 'Checked out guest Ela Ziu from Room #15', '2025-11-18 15:39:29', '2025-11-18 15:39:29'),
(74, 1, 2, 'Update Roomboy Designation', 'Updated roomboy designation for Roomboy', '2025-11-18 15:40:23', '2025-11-18 15:40:23'),
(75, 1, 3, 'Payment with Deposit', 'Payment of ₱585 with deposit for guest Marie Dela Cruz', '2025-11-19 08:48:12', '2025-11-19 08:48:12'),
(76, 1, 3, 'Check Out', 'Checked out guest Marie Dela Cruz from Room #25', '2025-11-19 08:48:52', '2025-11-19 08:48:52'),
(77, 1, 3, 'Pay All Unpaid Balances', 'All unpaid balances are paid for guest Pie Tzu', '2025-11-19 08:49:24', '2025-11-19 08:49:24'),
(78, 1, 3, 'Check Out', 'Checked out guest Pie Tzu from Room #30', '2025-11-19 08:49:32', '2025-11-19 08:49:32'),
(79, 1, 3, 'Payment with Deposit', 'Payment of ₱215 with deposit for guest Carie Perry', '2025-11-19 08:51:01', '2025-11-19 08:51:01'),
(80, 1, 3, 'Check Out', 'Checked out guest Carie Perry from Room #119', '2025-11-19 08:51:13', '2025-11-19 08:51:13'),
(81, 1, 3, 'Payment with Deposit', 'Payment of ₱230 with deposit for guest Inna Liu', '2025-11-19 08:52:27', '2025-11-19 08:52:27'),
(82, 1, 3, 'Check Out', 'Checked out guest Inna Liu from Room #200', '2025-11-19 08:52:40', '2025-11-19 08:52:40');

INSERT INTO `branches` (`id`, `name`, `address`, `autorization_code`, `old_autorization`, `extension_time_reset`, `initial_deposit`, `discount_enabled`, `discount_amount`, `created_at`, `updated_at`) VALUES
(1, 'ALMA RESIDENCES GENSAN', 'Brgy. 1, Gensan, South Cotabato', '12345', NULL, 24, '200.00', 1, '50.00', '2025-11-18 14:22:59', '2025-11-18 14:22:59');
INSERT INTO `check_out_guest_reports` (`id`, `room_id`, `checkin_details_id`, `shift_date`, `shift`, `frontdesk_id`, `partner_name`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 'November 18, 2025', 'AM', 1, 'Tan', '2025-11-18 15:39:06', '2025-11-18 15:39:06'),
(2, 6, 4, 'November 18, 2025', 'AM', 1, 'Tan', '2025-11-18 15:39:29', '2025-11-18 15:39:29'),
(3, 17, 1, 'November 18, 2025', 'AM', 1, 'Tan', '2025-11-19 08:48:52', '2025-11-19 08:48:52'),
(4, 23, 2, 'November 18, 2025', 'AM', 1, 'Tan', '2025-11-19 08:49:32', '2025-11-19 08:49:32'),
(5, 209, 7, 'November 18, 2025', 'AM', 1, 'Tan', '2025-11-19 08:51:13', '2025-11-19 08:51:13'),
(6, 127, 8, 'November 18, 2025', 'AM', 1, 'Tan', '2025-11-19 08:52:40', '2025-11-19 08:52:40');
INSERT INTO `checkin_details` (`id`, `guest_id`, `frontdesk_id`, `type_id`, `room_id`, `rate_id`, `static_amount`, `hours_stayed`, `total_deposit`, `total_deduction`, `check_in_at`, `check_out_at`, `is_check_out`, `is_long_stay`, `number_of_hours`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 17, 3, 760, 24, 1200, 585, '2025-11-18 15:02:45', '2025-11-19 15:02:45', 1, 0, 0, '2025-11-18 15:02:45', '2025-11-19 08:48:52'),
(2, 2, 1, 1, 23, 3, 760, 24, 200, 0, '2025-11-18 15:02:56', '2025-11-19 15:02:56', 1, 0, 0, '2025-11-18 15:02:56', '2025-11-19 08:49:32'),
(3, 3, 1, 2, 3, 4, 480, 6, 200, 0, '2025-11-18 15:03:12', '2025-11-18 21:03:12', 1, 0, 0, '2025-11-18 15:03:12', '2025-11-18 15:39:06'),
(4, 4, 1, 2, 6, 4, 480, 6, 200, 0, '2025-11-18 15:03:40', '2025-11-18 21:03:40', 1, 0, 0, '2025-11-18 15:03:40', '2025-11-18 15:39:29'),
(5, 5, 1, 3, 207, 9, 872, 24, 200, 0, '2025-11-18 15:05:07', '2025-11-20 15:05:07', 0, 0, 24, '2025-11-18 15:05:07', '2025-11-18 15:20:56'),
(6, 6, 1, 1, 208, 3, 760, 24, 700, 0, '2025-11-18 15:05:29', '2025-11-20 15:05:29', 0, 0, 24, '2025-11-18 15:05:29', '2025-11-18 15:24:07'),
(7, 7, 1, 1, 209, 2, 536, 12, 1200, 215, '2025-11-18 15:05:38', '2025-11-19 15:05:38', 1, 0, 24, '2025-11-18 15:05:38', '2025-11-19 08:51:13'),
(8, 8, 1, 3, 127, 8, 648, 12, 2200, 230, '2025-11-18 15:05:46', '2025-11-19 15:05:46', 1, 0, 24, '2025-11-18 15:05:46', '2025-11-19 08:52:40'),
(9, 9, 1, 2, 128, 6, 816, 24, 5200, 0, '2025-11-18 15:05:58', '2025-11-20 15:05:58', 0, 0, 24, '2025-11-18 15:05:58', '2025-11-18 15:30:23'),
(10, 10, 1, 2, 210, 6, 816, 24, 1200, 0, '2025-11-18 15:06:24', '2025-11-19 21:06:24', 0, 0, 6, '2025-11-18 15:06:24', '2025-11-18 15:36:34');
INSERT INTO `cleaning_histories` (`id`, `user_id`, `room_id`, `floor_id`, `branch_id`, `start_time`, `end_time`, `current_assigned_floor_id`, `expected_end_time`, `cleaning_duration`, `delayed_cleaning`, `created_at`, `updated_at`) VALUES
(1, 7, 3, 1, 1, '2025-11-18 15:42:21', '2025-11-18 16:04:07', 1, '2025-11-18 18:39:06', '21', 0, '2025-11-18 16:04:07', '2025-11-18 16:04:07'),
(2, 7, 6, 1, 1, '2025-11-18 16:04:11', '2025-11-18 16:28:08', 1, '2025-11-18 18:39:29', '23', 0, '2025-11-18 16:28:08', '2025-11-18 16:28:08');



INSERT INTO `extended_guest_reports` (`id`, `branch_id`, `room_id`, `checkin_details_id`, `number_of_extension`, `total_hours`, `shift`, `frontdesk_id`, `partner_name`, `created_at`, `updated_at`) VALUES
(1, 1, 207, 5, 1, 24, 'AM', 1, 'Tan', '2025-11-18 15:20:56', '2025-11-18 15:20:56'),
(2, 1, 208, 6, 1, 24, 'AM', 1, 'Tan', '2025-11-18 15:22:35', '2025-11-18 15:22:35'),
(3, 1, 209, 7, 1, 12, 'AM', 1, 'Tan', '2025-11-18 15:26:02', '2025-11-18 15:26:02'),
(4, 1, 127, 8, 1, 12, 'AM', 1, 'Tan', '2025-11-18 15:27:55', '2025-11-18 15:27:55'),
(5, 1, 128, 9, 1, 24, 'AM', 1, 'Tan', '2025-11-18 15:29:21', '2025-11-18 15:29:21'),
(6, 1, 210, 10, 1, 6, 'AM', 1, 'Tan', '2025-11-18 15:34:56', '2025-11-18 15:34:56');
INSERT INTO `extension_rates` (`id`, `branch_id`, `hour`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 100, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(2, 1, 12, 200, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(3, 1, 18, 400, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(4, 1, 24, 500, '2025-11-18 14:23:01', '2025-11-18 14:23:01');

INSERT INTO `floor_user` (`id`, `user_id`, `floor_id`, `created_at`, `updated_at`) VALUES
(1, 7, 1, NULL, NULL),
(2, 7, 2, NULL, NULL),
(3, 7, 3, NULL, NULL),
(4, 7, 4, NULL, NULL),
(5, 7, 5, NULL, NULL);
INSERT INTO `floors` (`id`, `branch_id`, `number`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(2, 1, 2, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(3, 1, 3, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(4, 1, 4, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(5, 1, 5, '2025-11-18 14:23:00', '2025-11-18 14:23:00');
INSERT INTO `frontdesk_categories` (`id`, `branch_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Snacks', '2025-11-18 14:37:02', '2025-11-18 14:37:02'),
(2, 1, 'Drinks', '2025-11-18 14:37:08', '2025-11-18 14:37:08');
INSERT INTO `frontdesk_inventories` (`id`, `branch_id`, `frontdesk_menu_id`, `number_of_serving`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 98, '2025-11-18 14:44:30', '2025-11-18 15:29:45'),
(2, 1, 2, 98, '2025-11-18 14:44:34', '2025-11-18 15:28:13'),
(3, 1, 3, 98, '2025-11-18 15:08:51', '2025-11-18 15:26:28'),
(4, 1, 4, 99, '2025-11-18 15:08:55', '2025-11-18 15:12:37'),
(5, 1, 5, 98, '2025-11-18 15:08:58', '2025-11-18 15:36:01');
INSERT INTO `frontdesk_menus` (`id`, `branch_id`, `frontdesk_category_id`, `item_code`, `name`, `price`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2003', 'Chippy', '10', 'menu_images/zXOiIYhLM2Bstz70TkHotizrXp21s8oPgaaIDlJn.jpg', '2025-11-18 14:43:21', '2025-11-18 14:43:21'),
(2, 1, 1, '130', 'Nissin Cup Noodles', '30', 'menu_images/VVluefVT9TGLYNoGXHDE25xG6DUt3796pNqdJgfw.jpg', '2025-11-18 14:44:13', '2025-11-18 14:44:13'),
(3, 1, 2, '2023', 'Coke Zero', '15', 'menu_images/lJ94udBKRUWpcIArkLdcaP2yS1nCVkB4f41N2ClJ.jpg', '2025-11-18 15:00:09', '2025-11-18 15:00:09'),
(4, 1, 2, '23121', 'C2', '10', 'menu_images/TKXzl0HfetYB43nOJNSpCP6o3WPUKvY3OlWW49RW.jpg', '2025-11-18 15:00:44', '2025-11-18 15:00:44'),
(5, 1, 2, '2313', 'Nature\'s Spring 10ML', '15', 'menu_images/2t2kBZf9F5H84KNA0wAfsy2Dd5uNOwyEclE5utbl.png', '2025-11-18 15:02:15', '2025-11-18 15:02:15');
INSERT INTO `frontdesks` (`id`, `branch_id`, `name`, `number`, `created_at`, `updated_at`) VALUES
(1, 1, 'Bhong', '1', '2025-11-18 14:36:36', '2025-11-18 14:36:36'),
(2, 1, 'Tan', '2', '2025-11-18 15:02:29', '2025-11-18 15:02:29');
INSERT INTO `guests` (`id`, `branch_id`, `name`, `contact`, `qr_code`, `room_id`, `previous_room_id`, `rate_id`, `type_id`, `static_amount`, `is_long_stay`, `number_of_days`, `has_discount`, `discount_amount`, `has_kiosk_check_out`, `created_at`, `updated_at`) VALUES
(1, 1, 'Marie Dela Cruz', 'N/A', '1250001', 17, NULL, 3, 1, 760, 0, 0, 0, '50.00', 1, '2025-11-18 14:43:32', '2025-11-19 08:44:00'),
(2, 1, 'Pie Tzu', 'N/A', '1250002', 23, NULL, 3, 1, 760, 0, 0, 0, '50.00', 1, '2025-11-18 14:44:15', '2025-11-19 08:44:18'),
(3, 1, 'Jose Pru', 'N/A', '1250003', 3, NULL, 4, 2, 480, 0, 0, 0, '50.00', 1, '2025-11-18 14:44:58', '2025-11-18 15:38:25'),
(4, 1, 'Ela Ziu', 'N/A', '1250004', 6, NULL, 4, 2, 480, 0, 0, 0, '50.00', 1, '2025-11-18 14:53:57', '2025-11-18 15:38:38'),
(5, 1, 'Kian Lee', 'N/A', '1250005', 207, NULL, 9, 3, 872, 0, 0, 0, '50.00', 0, '2025-11-18 14:55:01', '2025-11-18 15:05:07'),
(6, 1, 'Shein Tan', 'N/A', '1250006', 208, NULL, 3, 1, 760, 0, 0, 0, '50.00', 0, '2025-11-18 14:57:21', '2025-11-18 15:05:29'),
(7, 1, 'Carie Perry', 'N/A', '1250007', 209, NULL, 2, 1, 536, 0, 0, 0, '50.00', 1, '2025-11-18 14:58:21', '2025-11-19 08:44:52'),
(8, 1, 'Inna Liu', 'N/A', '1250008', 127, NULL, 8, 3, 648, 0, 0, 0, '50.00', 1, '2025-11-18 14:59:31', '2025-11-19 08:46:14'),
(9, 1, 'Ella Cy', 'N/A', '1250009', 128, NULL, 6, 2, 816, 0, 0, 0, '50.00', 0, '2025-11-18 15:00:26', '2025-11-18 15:05:58'),
(10, 1, 'Ariel Lee', 'N/A', '1250010', 210, NULL, 6, 2, 816, 0, 0, 0, '50.00', 0, '2025-11-18 15:01:08', '2025-11-18 15:06:24');
INSERT INTO `hotel_items` (`id`, `branch_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'MAIN DOOR', 5000, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(2, 1, 'PURTAHAN SA C.R.', 2500, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(3, 1, 'SUGA SA ROOM', 150, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(4, 1, 'SUGA SA C.R.', 130, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(5, 1, 'SAMIN SULOD SA ROOM', 1000, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(6, 1, 'SAMIN SULOD SA C.R.', 1000, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(7, 1, 'SAMIN SA GAWAS', 1500, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(8, 1, 'SALOG SA ROOM PER TILES', 1200, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(9, 1, 'SALOG SA C.R. PER TILE', 1200, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(10, 1, 'RUG/ TRAPO SA SALOG', 40, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(11, 1, 'UNLAN', 500, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(12, 1, 'HABOL', 500, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(13, 1, 'PUNDA', 200, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(14, 1, 'PUNDA WITH MANTSA(HAIR DYE)', 500, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(15, 1, 'BEDSHEET WITH INK', 500, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(16, 1, 'BED PAD WITH INK', 800, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(17, 1, 'BED SKIRT WITH INK', 1500, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(18, 1, 'TOWEL', 300, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(19, 1, 'DOORKNOB C.R.', 350, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(20, 1, 'MAIN DOOR DOORKNOB', 500, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(21, 1, 'T.V.', 30000, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(22, 1, 'TELEPHONE', 1000, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(23, 1, 'DECODER PARA SA CABLE', 1600, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(24, 1, 'CORD SA DECODER', 100, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(25, 1, 'CHARGER SA DECODER', 400, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(26, 1, 'WIRING SA TELEPHONE', 100, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(27, 1, 'WIRINGS SA T.V.', 200, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(28, 1, 'WIRING SA DECODER', 50, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(29, 1, 'CEILING', 0, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(30, 1, 'SHOWER HEAD', 800, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(31, 1, 'SHOWER BULB', 800, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(32, 1, 'BIDET', 400, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(33, 1, 'HINGES/ TOWEL BAR', 200, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(34, 1, 'TAKLOB SA TANGKE', 1200, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(35, 1, 'TANGKE SA BOWL', 3000, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(36, 1, 'TAKLOB SA BOWL', 1000, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(37, 1, 'ILALOM SA LABABO', 0, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(38, 1, 'SINK/LABABO', 1500, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(39, 1, 'BASURAHAN', 70, '2025-11-18 14:23:01', '2025-11-18 14:23:01');




INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
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
(54, '2025_08_07_135126_add_column_image_on_frontdesk_menus', 1),
(55, '2025_08_08_142506_add_column_branch_id_to_room_boy_reports', 1),
(56, '2025_08_12_135730_create_floor_user_table', 1),
(57, '2025_08_28_161029_create_transfer_reasons_table', 1),
(58, '2025_08_29_083259_add_column_is_active_to_users_table', 1),
(59, '2025_09_11_161912_create_activity_logs_table', 1),
(60, '2025_09_24_145204_add_column_frontdesk_id_to_checkin_details_table', 1),
(61, '2025_10_10_081926_add_column_item_code_to_menus_table', 1),
(62, '2025_10_10_083455_add_column_item_code_to_frontdesk_menus_table', 1);

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 7),
(5, 'App\\Models\\User', 5),
(6, 'App\\Models\\User', 4),
(7, 'App\\Models\\User', 6),
(8, 'App\\Models\\User', 8);
INSERT INTO `new_guest_reports` (`id`, `branch_id`, `room_id`, `checkin_details_id`, `shift_date`, `shift`, `frontdesk_id`, `partner_name`, `created_at`, `updated_at`) VALUES
(1, 1, 17, 1, 'November 18, 2025', 'AM', 1, 'Tan', '2025-11-18 15:02:45', '2025-11-18 15:02:45'),
(2, 1, 23, 2, 'November 18, 2025', 'AM', 1, 'Tan', '2025-11-18 15:02:56', '2025-11-18 15:02:56'),
(3, 1, 3, 3, 'November 18, 2025', 'AM', 1, 'Tan', '2025-11-18 15:03:12', '2025-11-18 15:03:12'),
(4, 1, 6, 4, 'November 18, 2025', 'AM', 1, 'Tan', '2025-11-18 15:03:40', '2025-11-18 15:03:40'),
(5, 1, 207, 5, 'November 18, 2025', 'AM', 1, 'Tan', '2025-11-18 15:05:07', '2025-11-18 15:05:07'),
(6, 1, 208, 6, 'November 18, 2025', 'AM', 1, 'Tan', '2025-11-18 15:05:29', '2025-11-18 15:05:29'),
(7, 1, 209, 7, 'November 18, 2025', 'AM', 1, 'Tan', '2025-11-18 15:05:38', '2025-11-18 15:05:38'),
(8, 1, 127, 8, 'November 18, 2025', 'AM', 1, 'Tan', '2025-11-18 15:05:46', '2025-11-18 15:05:46'),
(9, 1, 128, 9, 'November 18, 2025', 'AM', 1, 'Tan', '2025-11-18 15:05:58', '2025-11-18 15:05:58'),
(10, 1, 210, 10, 'November 18, 2025', 'AM', 1, 'Tan', '2025-11-18 15:06:24', '2025-11-18 15:06:24');


INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 4, 'mobile-token', 'aebf21b0d75665adefd38512a30516caedb85a24961cfcb20242fa8c27bda6b8', '[\"*\"]', NULL, NULL, '2025-11-18 14:37:01', '2025-11-18 14:37:01'),
(2, 'App\\Models\\User', 4, 'mobile-token', '548c54640b984e6e5f4f192a1fc20ab3e332bcf2ffb0585c22bdb5f1c67001d3', '[\"*\"]', '2025-11-18 15:01:08', NULL, '2025-11-18 14:42:12', '2025-11-18 15:01:08');



INSERT INTO `rates` (`id`, `branch_id`, `staying_hour_id`, `type_id`, `amount`, `is_available`, `has_discount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 224, 1, 0, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(2, 1, 2, 1, 336, 1, 0, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(3, 1, 4, 1, 560, 1, 0, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(4, 1, 1, 2, 280, 1, 0, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(5, 1, 2, 2, 392, 1, 0, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(6, 1, 4, 2, 616, 1, 0, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(7, 1, 1, 3, 336, 1, 0, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(8, 1, 2, 3, 448, 1, 0, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(9, 1, 4, 3, 672, 1, 0, '2025-11-18 14:23:01', '2025-11-18 14:23:01');
INSERT INTO `requestable_items` (`id`, `branch_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'EXTRA PERSON WITH FREE PILLOW, BLANKET,TOWEL', 100, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(2, 1, 'EXTRA PILLOW', 20, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(3, 1, 'EXTRA TOWEL', 20, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(4, 1, 'EXTRA BLANKET', 20, '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(5, 1, 'EXTRA FITTED SHEET', 20, '2025-11-18 14:23:01', '2025-11-18 14:23:01');

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'web', '2025-11-18 14:22:59', '2025-11-18 14:22:59'),
(2, 'admin', 'web', '2025-11-18 14:22:59', '2025-11-18 14:22:59'),
(3, 'frontdesk', 'web', '2025-11-18 14:22:59', '2025-11-18 14:22:59'),
(4, 'roomboy', 'web', '2025-11-18 14:22:59', '2025-11-18 14:22:59'),
(5, 'kitchen', 'web', '2025-11-18 14:22:59', '2025-11-18 14:22:59'),
(6, 'kiosk', 'web', '2025-11-18 14:22:59', '2025-11-18 14:22:59'),
(7, 'back_office', 'web', '2025-11-18 14:22:59', '2025-11-18 14:22:59'),
(8, 'pub_kitchen', 'web', '2025-11-18 14:23:01', '2025-11-18 14:23:01');
INSERT INTO `room_boy_reports` (`id`, `branch_id`, `room_id`, `checkin_details_id`, `roomboy_id`, `cleaning_start`, `cleaning_end`, `total_hours_spent`, `interval`, `shift`, `is_cleaned`, `created_at`, `updated_at`) VALUES
(1, 1, 3, 3, 7, '2025-11-18 15:42:21', '2025-11-18 16:04:07', 21, 0, 'AM', 1, '2025-11-18 15:42:21', '2025-11-18 16:04:07'),
(2, 1, 6, 4, 7, '2025-11-18 16:04:11', '2025-11-18 16:28:08', 23, 0, 'AM', 1, '2025-11-18 16:04:11', '2025-11-18 16:28:08'),
(3, 1, 17, 1, 7, '2025-11-19 08:53:18', '2025-11-19 09:08:18', 0, 0, 'AM', 0, '2025-11-19 08:53:18', '2025-11-19 08:53:18');
INSERT INTO `rooms` (`id`, `branch_id`, `floor_id`, `number`, `area`, `status`, `type_id`, `is_priority`, `last_checkin_at`, `last_checkout_at`, `time_to_terminate_queue`, `check_out_time`, `time_to_clean`, `started_cleaning_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(2, 1, 1, '10', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(3, 1, 1, '11', 'Main', 'Available', 2, 1, '2025-11-18 15:03:12', '2025-11-18 15:39:06', NULL, '2025-11-18 15:39:06', NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 16:04:07'),
(4, 1, 1, '12', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(5, 1, 1, '14', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(6, 1, 1, '15', 'Main', 'Available', 2, 1, '2025-11-18 15:03:40', '2025-11-18 15:39:29', NULL, '2025-11-18 15:39:29', NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 16:28:08'),
(7, 1, 1, '16', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(8, 1, 1, '17', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(9, 1, 1, '18', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(10, 1, 1, '19', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(11, 1, 1, '2', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(12, 1, 1, '20', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(13, 1, 1, '21', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(14, 1, 1, '22', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(15, 1, 1, '23', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(16, 1, 1, '24', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(17, 1, 1, '25', 'Main', 'Cleaning', 1, 1, '2025-11-18 15:02:45', '2025-11-19 08:48:52', NULL, '2025-11-19 08:48:52', '2025-11-19 11:48:52', '2025-11-19 08:53:17', '2025-11-18 14:23:00', '2025-11-19 08:53:17'),
(18, 1, 1, '26', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(19, 1, 1, '27', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(20, 1, 1, '28', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(21, 1, 1, '29', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(22, 1, 1, '3', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(23, 1, 1, '30', 'Main', 'Uncleaned', 1, 1, '2025-11-18 15:02:56', '2025-11-19 08:49:32', NULL, '2025-11-19 08:49:32', '2025-11-19 11:49:32', NULL, '2025-11-18 14:23:00', '2025-11-19 08:49:32'),
(24, 1, 1, '31', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(25, 1, 1, '32', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(26, 1, 1, '33', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(27, 1, 1, '34', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(28, 1, 1, '35', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(29, 1, 1, '36', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(30, 1, 1, '37', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(31, 1, 1, '38', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(32, 1, 1, '39', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(33, 1, 1, '4', 'Main', 'Available', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(34, 1, 1, '5', 'Main', 'Available', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(35, 1, 1, '50', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(36, 1, 1, '51', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(37, 1, 1, '52', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(38, 1, 1, '53', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(39, 1, 1, '6', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(40, 1, 1, '7', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(41, 1, 1, '8', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(42, 1, 1, '9', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(43, 1, 2, '100', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(44, 1, 2, '101', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(45, 1, 2, '60', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(46, 1, 2, '61', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(47, 1, 2, '62', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(48, 1, 2, '63', 'Main', 'Available', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(49, 1, 2, '64', 'Main', 'Available', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(50, 1, 2, '65', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(51, 1, 2, '66', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(52, 1, 2, '67', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(53, 1, 2, '68', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(54, 1, 2, '69', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(55, 1, 2, '70', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(56, 1, 2, '71', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(57, 1, 2, '72', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(58, 1, 2, '73', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(59, 1, 2, '74', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(60, 1, 2, '75', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(61, 1, 2, '76', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(62, 1, 2, '77', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(63, 1, 2, '78', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(64, 1, 2, '79', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(65, 1, 2, '80', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(66, 1, 2, '81', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(67, 1, 2, '82', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(68, 1, 2, '83', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(69, 1, 2, '84', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(70, 1, 2, '85', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(71, 1, 2, '86', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(72, 1, 2, '87', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(73, 1, 2, '88', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(74, 1, 2, '89', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(75, 1, 2, '90', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(76, 1, 2, '91', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(77, 1, 2, '92', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(78, 1, 2, '93', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(79, 1, 2, '94', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(80, 1, 2, '95', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(81, 1, 2, '96', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(82, 1, 2, '97', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(83, 1, 2, '98', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(84, 1, 2, '99', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(85, 1, 3, '120', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(86, 1, 3, '121', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(87, 1, 3, '122', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(88, 1, 3, '123', 'Main', 'Available', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:27:43'),
(89, 1, 3, '124', 'Main', 'Available', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:27:44'),
(90, 1, 3, '125', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(91, 1, 3, '126', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(92, 1, 3, '127', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(93, 1, 3, '128', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(94, 1, 3, '129', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(95, 1, 3, '130', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(96, 1, 3, '131', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(97, 1, 3, '132', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(98, 1, 3, '133', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(99, 1, 3, '134', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(100, 1, 3, '135', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(101, 1, 3, '136', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(102, 1, 3, '137', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(103, 1, 3, '138', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(104, 1, 3, '139', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(105, 1, 3, '150', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(106, 1, 3, '151', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(107, 1, 3, '152', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(108, 1, 3, '153', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(109, 1, 3, '154', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(110, 1, 3, '155', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(111, 1, 3, '156', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(112, 1, 3, '157', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(113, 1, 3, '158', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(114, 1, 3, '159', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(115, 1, 3, '160', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(116, 1, 3, '161', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(117, 1, 3, '162', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(118, 1, 3, '163', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(119, 1, 3, '164', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(120, 1, 3, '165', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(121, 1, 3, '166', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(122, 1, 3, '167', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(123, 1, 3, '168', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(124, 1, 3, '169', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(125, 1, 3, '170', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(126, 1, 3, '171', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(127, 1, 4, '200', 'Main', 'Uncleaned', 3, 1, '2025-11-18 15:05:46', '2025-11-19 08:52:40', NULL, '2025-11-19 08:52:40', '2025-11-19 11:52:40', NULL, '2025-11-18 14:23:00', '2025-11-19 08:52:40'),
(128, 1, 4, '201', 'Main', 'Occupied', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 15:05:58'),
(129, 1, 4, '202', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(130, 1, 4, '203', 'Main', 'Available', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:27:44'),
(131, 1, 4, '204', 'Main', 'Available', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:27:45'),
(132, 1, 4, '205', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(133, 1, 4, '206', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(134, 1, 4, '207', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(135, 1, 4, '208', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(136, 1, 4, '209', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(137, 1, 4, '210', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(138, 1, 4, '211', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(139, 1, 4, '212', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(140, 1, 4, '214', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(141, 1, 4, '215', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(142, 1, 4, '216', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(143, 1, 4, '217', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(144, 1, 4, '218', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(145, 1, 4, '219', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(146, 1, 4, '220', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(147, 1, 4, '221', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(148, 1, 4, '222', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(149, 1, 4, '223', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(150, 1, 4, '224', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(151, 1, 4, '225', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(152, 1, 4, '226', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(153, 1, 4, '227', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(154, 1, 4, '228', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(155, 1, 4, '229', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(156, 1, 4, '230', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(157, 1, 4, '231', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(158, 1, 4, '232', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(159, 1, 4, '233', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(160, 1, 4, '234', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(161, 1, 4, '235', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(162, 1, 4, '236', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(163, 1, 4, '237', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(164, 1, 4, '238', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(165, 1, 4, '239', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(166, 1, 4, '250', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(167, 1, 4, '251', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(168, 1, 5, '253', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(169, 1, 5, '254', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(170, 1, 5, '255', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(171, 1, 5, '256', 'Main', 'Available', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:27:45'),
(172, 1, 5, '257', 'Main', 'Available', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(173, 1, 5, '258', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(174, 1, 5, '259', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(175, 1, 5, '260', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(176, 1, 5, '261', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(177, 1, 5, '262', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(178, 1, 5, '263', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(179, 1, 5, '264', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(180, 1, 5, '265', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(181, 1, 5, '266', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(182, 1, 5, '267', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(183, 1, 5, '268', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(184, 1, 5, '269', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(185, 1, 5, '270', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(186, 1, 5, '271', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(187, 1, 5, '272', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(188, 1, 5, '273', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(189, 1, 5, '274', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(190, 1, 5, '275', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(191, 1, 5, '276', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(192, 1, 5, '277', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(193, 1, 5, '278', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(194, 1, 5, '279', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(195, 1, 5, '280', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(196, 1, 5, '281', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(197, 1, 5, '282', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(198, 1, 5, '283', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(199, 1, 5, '284', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(200, 1, 5, '285', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(201, 1, 5, '286', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(202, 1, 5, '287', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(203, 1, 5, '288', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(204, 1, 5, '289', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(205, 1, 5, '290', 'Main', 'Available', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(206, 1, 5, '294', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(207, 1, 3, '108', NULL, 'Occupied', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:30:46', '2025-11-18 15:05:07'),
(208, 1, 2, '117', NULL, 'Occupied', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:31:07', '2025-11-18 15:05:29'),
(209, 1, 1, '119', NULL, 'Uncleaned', 1, 1, '2025-11-18 15:05:38', '2025-11-19 08:51:13', NULL, '2025-11-19 08:51:13', '2025-11-19 11:51:13', NULL, '2025-11-18 14:31:23', '2025-11-19 08:51:13'),
(210, 1, 3, '300', NULL, 'Occupied', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-11-18 14:32:17', '2025-11-18 15:06:24');
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('a6DVogBOjUF5RPJKfhKDHgpe7vUNuBqX2GSclWeN', NULL, '204.76.203.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoicDRXbkFsMG93bWtaVlRZeHpoYjRDRnRyaEhyRzVkNWROT3lmT3hNeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1763511982),
('AKr1DQljJ5St6HSJQLnFnHj9uKuNPIuu3S4yTq2d', NULL, '87.251.78.46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmZ3bTVOY3FlcmpiYnYwMVlNOTRZcGNLQWhMOTJBcERTYjZ2aTVHcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763507465),
('ALSPKjkkPQjDGU3cPLIYxbarBvMqyjAjbrH02UCV', NULL, '147.185.132.126', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibjFBdDBrRGlaZ2c3QzBpVElhUEE1Y1VoRk5wb1pNTDVweUJXdTJzbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763510429),
('avDhNajod5DCRHjfruYcZ1BmdTp2AaHWwK3y5gzx', 6, '122.52.149.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiOEFGZGZaMEpSSnNFQ2d6VjdySU0zbzNWWFBQMGswSEJYdFU0bklNdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9iYWNrLW9mZmljZS9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo2O3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJHpmQTFZczAuTjc5L1NrT0VOaHhSamVhUGIvU1E4SU9rWGsxLngvamMzVmJKbkg0NHJVYUMuIjt9', 1763513513),
('DYQnvUi7HwilI1I0cIPV9EMg0P9fM3CSdSw3dRFB', NULL, '204.76.203.212', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiUDZlUHl2OHJkTE1aR01VQnFoTGoyMk1JTjVRSjRKcTlWR2pDemQ4MiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1763506736),
('gckCQOwRYppFW70Xq3Oo8Aglnwc3Pn4K23yXkFTd', 7, '122.52.149.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiS21nUkd6clJoMVptdWtNUW1FVmtwY3Y5eFhEN2M4RTJzWW5PSE5JeSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9yb29tYm95L2Rhc2hib2FyZCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjc7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkYmwwZG90QTJJWGhuUlFybVZJVHpxLmZ6c0N1VnNrQVlWUmxON2NjTU8vVWx0LlJTOFBKaEciO30=', 1763513798),
('J3WVda4WoVXpLJuJJ9ZkXBz5OzcQi3MkpP0U3ozn', NULL, '170.106.73.216', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFVRWXo2SjhMZ2JzRnlJb0VrRTRzQ3U3YnNCOXhwQkJuTDc3TW1GMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763512605),
('jW0WkHvFAoelP8nMCT4Bd4LMisVV5vwKQvSzrqYy', 6, '122.52.149.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRW9rSUo4TFAxMnJQNU9aQ3VuTEVnS1dUczY4NzE2N0RwWnY4ZUZ5NCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQxOiJodHRwOi8vMTM5LjU5LjI1Mi4xMDAvYmFjay1vZmZpY2UvcmVwb3J0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjY7fQ==', 1763513690),
('q7WUVm7mvgZsVkyqWFze7KoHwbhaPfOqSFgxcfjo', NULL, '87.120.191.120', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoid1pDSENWYkNWYW5VeFpySkxqYkt6Rmd6cXRuT3FsZDdoT1FZNGdObiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1763512834),
('RoubUK7Ev3kWtVvLGkjM4hZADaubESQBuUUkrsK1', NULL, '154.38.165.235', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmU3bHZOSnJrR3A1d0dobWdYdmdGWmhGVXhuTUJhZXVPeTVYNzBzbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1763510196);
INSERT INTO `shift_logs` (`id`, `time_in`, `time_out`, `frontdesk_ids`, `created_at`, `updated_at`) VALUES
(1, '2025-11-18 15:01:56', NULL, '[1, \"Tan\"]', '2025-11-18 15:01:56', '2025-11-18 15:01:56');
INSERT INTO `stay_extensions` (`id`, `guest_id`, `extension_id`, `hours`, `amount`, `frontdesk_ids`, `created_at`, `updated_at`) VALUES
(1, 5, 4, '24', '1172', '\"[1,\\\"Tan\\\"]\"', '2025-11-18 15:20:56', '2025-11-18 15:20:56'),
(2, 6, 4, '24', '1060', '\"[1,\\\"Tan\\\"]\"', '2025-11-18 15:22:35', '2025-11-18 15:22:35'),
(3, 7, 2, '12', '200', '\"[1,\\\"Tan\\\"]\"', '2025-11-18 15:26:02', '2025-11-18 15:26:02'),
(4, 8, 2, '12', '200', '\"[1,\\\"Tan\\\"]\"', '2025-11-18 15:27:55', '2025-11-18 15:27:55'),
(5, 9, 4, '24', '1116', '\"[1,\\\"Tan\\\"]\"', '2025-11-18 15:29:21', '2025-11-18 15:29:21'),
(6, 10, 1, '6', '716', '\"[1,\\\"Tan\\\"]\"', '2025-11-18 15:34:56', '2025-11-18 15:34:56');
INSERT INTO `staying_hours` (`id`, `branch_id`, `number`, `created_at`, `updated_at`) VALUES
(1, 1, 6, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(2, 1, 12, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(3, 1, 18, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(4, 1, 24, '2025-11-18 14:23:00', '2025-11-18 14:23:00');


INSERT INTO `transaction_types` (`id`, `name`, `position`, `created_at`, `updated_at`) VALUES
(1, 'Check In', '1', '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(2, 'Deposit', '2', '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(3, 'Kitchen Order', '3', '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(4, 'Damage Charges', '4', '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(5, 'Cashout', '5', '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(6, 'Extend', '6', '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(7, 'Transfer Room', '7', '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(8, 'Amenities', '8', '2025-11-18 14:23:01', '2025-11-18 14:23:01'),
(9, 'Food and Beverages', '8', '2025-11-18 14:23:01', '2025-11-18 14:23:01');
INSERT INTO `transactions` (`id`, `branch_id`, `room_id`, `guest_id`, `floor_id`, `transaction_type_id`, `assigned_frontdesk_id`, `description`, `payable_amount`, `paid_amount`, `change_amount`, `deposit_amount`, `paid_at`, `override_at`, `remarks`, `transfer_reason_id`, `created_at`, `updated_at`) VALUES
(1, 1, 17, 1, 1, 1, '\"[1,\\\"Tan\\\"]\"', 'Guest Check In', 760, 760, 0, 0, '2025-11-18 15:02:45', NULL, 'Guest Checked In at room #25', NULL, '2025-11-18 15:02:45', '2025-11-18 15:02:45'),
(2, 1, 17, 1, 1, 2, '\"[1,\\\"Tan\\\"]\"', 'Deposit', 200, 760, 0, 200, '2025-11-18 15:02:45', NULL, 'Deposit From Check In (Room Key & TV Remote)', NULL, '2025-11-18 15:02:45', '2025-11-18 15:02:45'),
(3, 1, 23, 2, 1, 1, '\"[1,\\\"Tan\\\"]\"', 'Guest Check In', 760, 760, 0, 0, '2025-11-18 15:02:56', NULL, 'Guest Checked In at room #30', NULL, '2025-11-18 15:02:56', '2025-11-18 15:02:56'),
(4, 1, 23, 2, 1, 2, '\"[1,\\\"Tan\\\"]\"', 'Deposit', 200, 760, 0, 200, '2025-11-18 15:02:56', NULL, 'Deposit From Check In (Room Key & TV Remote)', NULL, '2025-11-18 15:02:56', '2025-11-18 15:02:56'),
(5, 1, 3, 3, 1, 1, '\"[1,\\\"Tan\\\"]\"', 'Guest Check In', 480, 480, 0, 0, '2025-11-18 15:03:12', NULL, 'Guest Checked In at room #11', NULL, '2025-11-18 15:03:12', '2025-11-18 15:03:12'),
(6, 1, 3, 3, 1, 2, '\"[1,\\\"Tan\\\"]\"', 'Deposit', 200, 480, 0, 200, '2025-11-18 15:03:12', NULL, 'Deposit From Check In (Room Key & TV Remote)', NULL, '2025-11-18 15:03:12', '2025-11-18 15:03:12'),
(7, 1, 6, 4, 1, 1, '\"[1,\\\"Tan\\\"]\"', 'Guest Check In', 480, 480, 0, 0, '2025-11-18 15:03:40', NULL, 'Guest Checked In at room #15', NULL, '2025-11-18 15:03:40', '2025-11-18 15:03:40'),
(8, 1, 6, 4, 1, 2, '\"[1,\\\"Tan\\\"]\"', 'Deposit', 200, 480, 0, 200, '2025-11-18 15:03:40', NULL, 'Deposit From Check In (Room Key & TV Remote)', NULL, '2025-11-18 15:03:40', '2025-11-18 15:03:40'),
(9, 1, 207, 5, 3, 1, '\"[1,\\\"Tan\\\"]\"', 'Guest Check In', 872, 872, 0, 0, '2025-11-18 15:05:07', NULL, 'Guest Checked In at room #108', NULL, '2025-11-18 15:05:07', '2025-11-18 15:05:07'),
(10, 1, 207, 5, 3, 2, '\"[1,\\\"Tan\\\"]\"', 'Deposit', 200, 872, 0, 200, '2025-11-18 15:05:07', NULL, 'Deposit From Check In (Room Key & TV Remote)', NULL, '2025-11-18 15:05:07', '2025-11-18 15:05:07'),
(11, 1, 208, 6, 2, 1, '\"[1,\\\"Tan\\\"]\"', 'Guest Check In', 760, 760, 0, 0, '2025-11-18 15:05:29', NULL, 'Guest Checked In at room #117', NULL, '2025-11-18 15:05:29', '2025-11-18 15:05:29'),
(12, 1, 208, 6, 2, 2, '\"[1,\\\"Tan\\\"]\"', 'Deposit', 200, 760, 0, 200, '2025-11-18 15:05:29', NULL, 'Deposit From Check In (Room Key & TV Remote)', NULL, '2025-11-18 15:05:29', '2025-11-18 15:05:29'),
(13, 1, 209, 7, 1, 1, '\"[1,\\\"Tan\\\"]\"', 'Guest Check In', 536, 536, 0, 0, '2025-11-18 15:05:38', NULL, 'Guest Checked In at room #119', NULL, '2025-11-18 15:05:38', '2025-11-18 15:05:38'),
(14, 1, 209, 7, 1, 2, '\"[1,\\\"Tan\\\"]\"', 'Deposit', 200, 536, 0, 200, '2025-11-18 15:05:38', NULL, 'Deposit From Check In (Room Key & TV Remote)', NULL, '2025-11-18 15:05:38', '2025-11-18 15:05:38'),
(15, 1, 127, 8, 4, 1, '\"[1,\\\"Tan\\\"]\"', 'Guest Check In', 648, 648, 0, 0, '2025-11-18 15:05:46', NULL, 'Guest Checked In at room #200', NULL, '2025-11-18 15:05:46', '2025-11-18 15:05:46'),
(16, 1, 127, 8, 4, 2, '\"[1,\\\"Tan\\\"]\"', 'Deposit', 200, 648, 0, 200, '2025-11-18 15:05:46', NULL, 'Deposit From Check In (Room Key & TV Remote)', NULL, '2025-11-18 15:05:46', '2025-11-18 15:05:46'),
(17, 1, 128, 9, 4, 1, '\"[1,\\\"Tan\\\"]\"', 'Guest Check In', 816, 816, 0, 0, '2025-11-18 15:05:58', NULL, 'Guest Checked In at room #201', NULL, '2025-11-18 15:05:58', '2025-11-18 15:05:58'),
(18, 1, 128, 9, 4, 2, '\"[1,\\\"Tan\\\"]\"', 'Deposit', 200, 816, 0, 200, '2025-11-18 15:05:58', NULL, 'Deposit From Check In (Room Key & TV Remote)', NULL, '2025-11-18 15:05:58', '2025-11-18 15:05:58'),
(19, 1, 210, 10, 3, 1, '\"[1,\\\"Tan\\\"]\"', 'Guest Check In', 816, 816, 0, 0, '2025-11-18 15:06:24', NULL, 'Guest Checked In at room #300', NULL, '2025-11-18 15:06:24', '2025-11-18 15:06:24'),
(20, 1, 210, 10, 3, 2, '\"[1,\\\"Tan\\\"]\"', 'Deposit', 200, 816, 0, 200, '2025-11-18 15:06:24', NULL, 'Deposit From Check In (Room Key & TV Remote)', NULL, '2025-11-18 15:06:24', '2025-11-18 15:06:24'),
(21, 1, 17, 1, 1, 8, '\"[1,\\\"Tan\\\"]\"', 'Amenities', 20, 0, 0, 0, '2025-11-19 08:48:12', NULL, 'Guest Added Amenities: (1) EXTRA FITTED SHEET', NULL, '2025-11-18 15:07:35', '2025-11-19 08:48:12'),
(22, 1, 17, 1, 1, 8, '\"[1,\\\"Tan\\\"]\"', 'Amenities', 40, 0, 0, 0, '2025-11-19 08:48:12', NULL, 'Guest Added Amenities: (2) EXTRA PILLOW', NULL, '2025-11-18 15:08:02', '2025-11-19 08:48:12'),
(23, 1, 17, 1, 1, 9, '\"[1,\\\"Tan\\\"]\"', 'Food and Beverages', 10, 0, 0, 0, '2025-11-19 08:48:12', NULL, 'Guest Added Food and Beverages: (Front Desk) (1) C2', NULL, '2025-11-18 15:12:37', '2025-11-19 08:48:12'),
(24, 1, 17, 1, 1, 9, '\"[1,\\\"Tan\\\"]\"', 'Food and Beverages', 15, 0, 0, 0, '2025-11-19 08:48:12', NULL, 'Guest Added Food and Beverages: (Front Desk) (1) Coke Zero', NULL, '2025-11-18 15:13:15', '2025-11-19 08:48:12'),
(25, 1, 17, 1, 1, 4, '\"[1,\\\"Tan\\\"]\"', 'Damage Charges', 200, 0, 0, 0, '2025-11-19 08:48:12', NULL, 'Guest Charged for Damage: (1) PUNDA', NULL, '2025-11-18 15:13:51', '2025-11-19 08:48:12'),
(26, 1, 17, 1, 1, 4, '\"[1,\\\"Tan\\\"]\"', 'Damage Charges', 300, 0, 0, 0, '2025-11-19 08:48:12', NULL, 'Guest Charged for Damage: (1) TOWEL', NULL, '2025-11-18 15:14:29', '2025-11-19 08:48:12'),
(27, 1, 17, 1, 1, 2, '\"[1,\\\"Tan\\\"]\"', 'Deposit', 1000, 0, 0, 1000, '2025-11-18 15:14:55', NULL, 'Guest Deposit: deposit', NULL, '2025-11-18 15:14:55', '2025-11-18 15:14:55'),
(28, 1, 23, 2, 1, 8, '\"[1,\\\"Tan\\\"]\"', 'Amenities', 20, 0, 0, 0, '2025-11-19 08:49:24', NULL, 'Guest Added Amenities: (1) EXTRA BLANKET', NULL, '2025-11-18 15:16:27', '2025-11-19 08:49:24'),
(29, 1, 23, 2, 1, 4, '\"[1,\\\"Tan\\\"]\"', 'Damage Charges', 500, 0, 0, 0, '2025-11-19 08:49:24', NULL, 'Guest Charged for Damage: (1) BEDSHEET WITH INK', NULL, '2025-11-18 15:17:05', '2025-11-19 08:49:24'),
(30, 1, 3, 3, 1, 4, '\"[1,\\\"Tan\\\"]\"', 'Damage Charges', 130, 0, 0, 0, '2025-11-18 15:38:58', NULL, 'Guest Charged for Damage: (1) SUGA SA C.R.', NULL, '2025-11-18 15:18:18', '2025-11-18 15:38:58'),
(31, 1, 3, 3, 1, 4, '\"[1,\\\"Tan\\\"]\"', 'Damage Charges', 5000, 0, 0, 0, '2025-11-18 15:38:58', NULL, 'Guest Charged for Damage: (1) MAIN DOOR', NULL, '2025-11-18 15:18:31', '2025-11-18 15:38:58'),
(32, 1, 6, 4, 1, 9, '\"[1,\\\"Tan\\\"]\"', 'Food and Beverages', 10, 0, 0, 0, '2025-11-18 15:39:25', NULL, 'Guest Added Food and Beverages: (Front Desk) (1) Chippy', NULL, '2025-11-18 15:19:27', '2025-11-18 15:39:25'),
(33, 1, 6, 4, 1, 4, '\"[1,\\\"Tan\\\"]\"', 'Damage Charges', 500, 0, 0, 0, '2025-11-18 15:39:25', NULL, 'Guest Charged for Damage: (1) UNLAN', NULL, '2025-11-18 15:19:40', '2025-11-18 15:39:25'),
(34, 1, 207, 5, 3, 6, '\"[1,\\\"Tan\\\"]\"', 'Extension', 1172, 0, 0, 0, NULL, NULL, 'Guest Extension : 24 hours', NULL, '2025-11-18 15:20:56', '2025-11-18 15:20:56'),
(35, 1, 207, 5, 3, 9, '\"[1,\\\"Tan\\\"]\"', 'Food and Beverages', 30, 0, 0, 0, NULL, NULL, 'Guest Added Food and Beverages: (Front Desk) (1) Nissin Cup Noodles', NULL, '2025-11-18 15:21:17', '2025-11-18 15:21:17'),
(36, 1, 207, 5, 3, 4, '\"[1,\\\"Tan\\\"]\"', 'Damage Charges', 500, 0, 0, 0, NULL, NULL, 'Guest Charged for Damage: (1) HABOL', NULL, '2025-11-18 15:21:35', '2025-11-18 15:21:35'),
(37, 1, 208, 6, 2, 6, '\"[1,\\\"Tan\\\"]\"', 'Extension', 1060, 0, 0, 0, NULL, NULL, 'Guest Extension : 24 hours', NULL, '2025-11-18 15:22:35', '2025-11-18 15:22:35'),
(38, 1, 208, 6, 2, 9, '\"[1,\\\"Tan\\\"]\"', 'Food and Beverages', 15, 0, 0, 0, NULL, NULL, 'Guest Added Food and Beverages: (Front Desk) (1) Nature\'s Spring 10ML', NULL, '2025-11-18 15:23:46', '2025-11-18 15:23:46'),
(39, 1, 208, 6, 2, 2, '\"[1,\\\"Tan\\\"]\"', 'Deposit', 500, 0, 0, 500, '2025-11-18 15:24:07', NULL, 'Guest Deposit: change', NULL, '2025-11-18 15:24:07', '2025-11-18 15:24:07'),
(40, 1, 209, 7, 1, 6, '\"[1,\\\"Tan\\\"]\"', 'Extension', 200, 0, 0, 0, '2025-11-19 08:51:01', NULL, 'Guest Extension : 12 hours', NULL, '2025-11-18 15:26:02', '2025-11-19 08:51:01'),
(41, 1, 209, 7, 1, 9, '\"[1,\\\"Tan\\\"]\"', 'Food and Beverages', 15, 0, 0, 0, '2025-11-19 08:51:01', NULL, 'Guest Added Food and Beverages: (Front Desk) (1) Coke Zero', NULL, '2025-11-18 15:26:28', '2025-11-19 08:51:01'),
(42, 1, 209, 7, 1, 2, '\"[1,\\\"Tan\\\"]\"', 'Deposit', 1000, 0, 0, 1000, '2025-11-18 15:27:01', NULL, 'Guest Deposit: Food', NULL, '2025-11-18 15:27:01', '2025-11-18 15:27:01'),
(43, 1, 127, 8, 4, 6, '\"[1,\\\"Tan\\\"]\"', 'Extension', 200, 0, 0, 0, '2025-11-19 08:52:27', NULL, 'Guest Extension : 12 hours', NULL, '2025-11-18 15:27:55', '2025-11-19 08:52:27'),
(44, 1, 127, 8, 4, 9, '\"[1,\\\"Tan\\\"]\"', 'Food and Beverages', 30, 0, 0, 0, '2025-11-19 08:52:27', NULL, 'Guest Added Food and Beverages: (Front Desk) (1) Nissin Cup Noodles', NULL, '2025-11-18 15:28:13', '2025-11-19 08:52:27'),
(45, 1, 127, 8, 4, 2, '\"[1,\\\"Tan\\\"]\"', 'Deposit', 2000, 0, 0, 2000, '2025-11-18 15:28:32', NULL, 'Guest Deposit: Food', NULL, '2025-11-18 15:28:32', '2025-11-18 15:28:32'),
(46, 1, 128, 9, 4, 6, '\"[1,\\\"Tan\\\"]\"', 'Extension', 1116, 0, 0, 0, NULL, NULL, 'Guest Extension : 24 hours', NULL, '2025-11-18 15:29:21', '2025-11-18 15:29:21'),
(47, 1, 128, 9, 4, 9, '\"[1,\\\"Tan\\\"]\"', 'Food and Beverages', 10, 0, 0, 0, NULL, NULL, 'Guest Added Food and Beverages: (Front Desk) (1) Chippy', NULL, '2025-11-18 15:29:45', '2025-11-18 15:29:45'),
(48, 1, 128, 9, 4, 2, '\"[1,\\\"Tan\\\"]\"', 'Deposit', 5000, 0, 0, 5000, '2025-11-18 15:30:23', NULL, 'Guest Deposit: Change', NULL, '2025-11-18 15:30:23', '2025-11-18 15:30:23'),
(49, 1, 210, 10, 3, 6, '\"[1,\\\"Tan\\\"]\"', 'Extension', 716, 0, 0, 0, NULL, NULL, 'Guest Extension : 6 hours', NULL, '2025-11-18 15:34:56', '2025-11-18 15:34:56'),
(50, 1, 210, 10, 3, 9, '\"[1,\\\"Tan\\\"]\"', 'Food and Beverages', 15, 0, 0, 0, NULL, NULL, 'Guest Added Food and Beverages: (Front Desk) (1) Nature\'s Spring 10ML', NULL, '2025-11-18 15:36:01', '2025-11-18 15:36:01'),
(51, 1, 210, 10, 3, 2, '\"[1,\\\"Tan\\\"]\"', 'Deposit', 1000, 0, 0, 1000, '2025-11-18 15:36:34', NULL, 'Guest Deposit: Food', NULL, '2025-11-18 15:36:34', '2025-11-18 15:36:34'),
(52, 1, 17, 1, 1, 5, '\"[1,\\\"Tan\\\"]\"', 'Cashout', 585, 585, 0, 0, '2025-11-19 08:48:12', NULL, 'Cashout from paying all unpaid balances', NULL, '2025-11-19 08:48:12', '2025-11-19 08:48:12'),
(53, 1, 209, 7, 1, 5, '\"[1,\\\"Tan\\\"]\"', 'Cashout', 215, 215, 0, 0, '2025-11-19 08:51:01', NULL, 'Cashout from paying all unpaid balances', NULL, '2025-11-19 08:51:01', '2025-11-19 08:51:01'),
(54, 1, 127, 8, 4, 5, '\"[1,\\\"Tan\\\"]\"', 'Cashout', 230, 230, 0, 0, '2025-11-19 08:52:27', NULL, 'Cashout from paying all unpaid balances', NULL, '2025-11-19 08:52:27', '2025-11-19 08:52:27');
INSERT INTO `transfer_reasons` (`id`, `branch_id`, `reason`, `created_at`, `updated_at`) VALUES
(1, 1, 'Guba Aircon ', '2025-11-18 15:02:44', '2025-11-18 15:02:44');
INSERT INTO `types` (`id`, `branch_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Single size Bed', NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(2, 1, ' Double size Bed', NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00'),
(3, 1, 'Twin size Bed', NULL, '2025-11-18 14:23:00', '2025-11-18 14:23:00');

INSERT INTO `users` (`id`, `branch_id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `branch_name`, `remember_token`, `current_team_id`, `roomboy_assigned_floor_id`, `roomboy_cleaning_room_id`, `profile_photo_path`, `assigned_frontdesks`, `time_in`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Superadmin', 'superadmin@gmail.com', NULL, '$2y$10$AS0BKyvK6miOacAE/0Tcm.HnBugXPEqcZkR4eFUukZMk3VFNdBxOi', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-18 14:22:59', '2025-11-18 14:22:59'),
(2, 1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$Uxss8a5CGSv6v4bIOTDO0e5yAnTy/fqaFXCPHimaIqOmecw9FeLLu', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-18 14:22:59', '2025-11-18 14:22:59'),
(3, 1, 'Frontdesk', 'frontdesk@gmail.com', NULL, '$2y$10$Hy8OBxd.w9aVqWnC.CqAiOBeH3.kOvPmp8j2l/oJgeZgIPsEjI5Ku', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, '\"[1,\\\"Tan\\\"]\"', '2025-11-18 15:01:56', 1, '2025-11-18 14:22:59', '2025-11-18 15:01:56'),
(4, 1, 'Kiosk', 'kiosk@gmail.com', NULL, '$2y$10$SAJEP6QOtOw3v06ahlvrte/BpW0Pk/cvN4lSpOkY1IM1Y3Gyd9Equ', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-18 14:22:59', '2025-11-18 14:22:59'),
(5, 1, 'Kitchen', 'kitchen@gmail.com', NULL, '$2y$10$DuUvgQc5q6t1KJC5L4wz9.yW8ETnITjT5Gk1ViPFwA/.ZZiYjHr.2', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-18 14:22:59', '2025-11-18 14:22:59'),
(6, 1, 'Back Office', 'back-office@gmail.com', NULL, '$2y$10$zfA1Ys0.N79/SkOENhxRjeaPb/SQ8IOkXk1.x/jc3VbJnH44rUaC.', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-18 14:22:59', '2025-11-18 14:22:59'),
(7, 1, 'Roomboy', 'roomboy@gmail.com', NULL, '$2y$10$bl0dotA2IXhnRQrmVITzq.fzsCuVskAYVRlN7ccMO/Ult.RS8PJhG', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, 1, 17, NULL, NULL, NULL, 1, '2025-11-18 14:23:00', '2025-11-19 08:53:17'),
(8, 1, 'PUB Kitchen', 'pub-kitchen@gmail.com', NULL, '$2y$10$hxtTYrumv9KjjPx6zPpc7ez2JCtcltIlSuUtB8NyO8vGZNcnawaFu', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2025-11-18 14:23:01', '2025-11-18 14:23:01');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;