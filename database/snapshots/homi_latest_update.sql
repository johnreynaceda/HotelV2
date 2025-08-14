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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `frontdesk_inventories`;
CREATE TABLE `frontdesk_inventories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `frontdesk_menu_id` bigint unsigned NOT NULL,
  `number_of_serving` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `frontdesk_menus`;
CREATE TABLE `frontdesk_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `frontdesk_category_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `frontdesks`;
CREATE TABLE `frontdesks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `last_checkin_at` date DEFAULT NULL,
  `last_checkout_at` date DEFAULT NULL,
  `time_to_terminate_queue` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `check_out_time` date DEFAULT NULL,
  `time_to_clean` datetime DEFAULT NULL,
  `started_cleaning_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO `branches` (`id`, `name`, `address`, `autorization_code`, `old_autorization`, `extension_time_reset`, `initial_deposit`, `discount_enabled`, `discount_amount`, `created_at`, `updated_at`) VALUES
(1, 'ALMA RESIDENCES GENSAN', 'Brgy. 1, Gensan, South Cotabato', '12345', NULL, 24, '200.00', 1, '50.00', '2025-07-28 16:39:08', '2025-07-28 16:39:08');
INSERT INTO `branches` (`id`, `name`, `address`, `autorization_code`, `old_autorization`, `extension_time_reset`, `initial_deposit`, `discount_enabled`, `discount_amount`, `created_at`, `updated_at`) VALUES
(2, 'DAVAO', NULL, NULL, NULL, NULL, '200.00', 1, '50.00', '2025-08-14 10:24:39', '2025-08-14 10:24:39');
INSERT INTO `branches` (`id`, `name`, `address`, `autorization_code`, `old_autorization`, `extension_time_reset`, `initial_deposit`, `discount_enabled`, `discount_amount`, `created_at`, `updated_at`) VALUES
(3, 'CAGAYAN', NULL, NULL, NULL, NULL, '200.00', 1, '50.00', '2025-08-14 10:42:42', '2025-08-14 10:42:42');
INSERT INTO `branches` (`id`, `name`, `address`, `autorization_code`, `old_autorization`, `extension_time_reset`, `initial_deposit`, `discount_enabled`, `discount_amount`, `created_at`, `updated_at`) VALUES
(4, 'GENSAN', NULL, NULL, NULL, NULL, '200.00', 1, '50.00', '2025-08-14 10:48:20', '2025-08-14 10:48:20');

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
(3, 3, 3, 3, 9, 872, 24, 200, 0, '2025-07-31 14:40:23', '2025-08-02 14:40:23', 0, 0, 24, '2025-07-31 14:40:23', '2025-08-06 09:32:53');
INSERT INTO `checkin_details` (`id`, `guest_id`, `type_id`, `room_id`, `rate_id`, `static_amount`, `hours_stayed`, `total_deposit`, `total_deduction`, `check_in_at`, `check_out_at`, `is_check_out`, `is_long_stay`, `number_of_hours`, `created_at`, `updated_at`) VALUES
(4, 4, 2, 1, 4, 480, 6, 200, 0, '2025-07-31 14:42:07', '2025-07-31 20:42:07', 1, 0, 0, '2025-07-31 14:42:07', '2025-07-31 14:42:39'),
(5, 5, 2, 1, 4, 480, 6, 200, 0, '2025-07-31 15:00:22', '2025-07-31 21:00:22', 1, 0, 0, '2025-07-31 15:00:22', '2025-07-31 15:00:49'),
(6, 6, 1, 34, 2, 536, 12, 200, 0, '2025-08-05 13:50:37', '2025-08-06 13:50:37', 0, 0, 12, '2025-08-05 13:50:37', '2025-08-06 09:32:41'),
(7, 7, 1, 89, 1, 424, 6, 200, 0, '2025-08-06 09:31:59', '2025-08-06 15:31:59', 0, 0, 0, '2025-08-06 09:31:59', '2025-08-06 09:31:59'),
(8, 8, 2, 168, 5, 592, 12, 200, 0, '2025-08-06 09:33:25', '2025-08-06 21:33:25', 0, 0, 0, '2025-08-06 09:33:25', '2025-08-06 09:35:31'),
(9, 9, 1, 130, 2, 536, 12, 264, 0, '2025-08-08 12:28:24', '2025-08-09 12:28:24', 0, 0, 12, '2025-08-08 12:28:24', '2025-08-08 12:29:27');

INSERT INTO `cleaning_histories` (`id`, `user_id`, `room_id`, `floor_id`, `branch_id`, `start_time`, `end_time`, `current_assigned_floor_id`, `expected_end_time`, `cleaning_duration`, `delayed_cleaning`, `created_at`, `updated_at`) VALUES
(1, 7, 1, 1, 1, '2025-07-31 14:40:14', '2025-07-31 14:59:33', 0, '2025-07-31 17:42:39', '19', 0, '2025-07-31 14:59:33', '2025-07-31 14:59:33');
INSERT INTO `cleaning_histories` (`id`, `user_id`, `room_id`, `floor_id`, `branch_id`, `start_time`, `end_time`, `current_assigned_floor_id`, `expected_end_time`, `cleaning_duration`, `delayed_cleaning`, `created_at`, `updated_at`) VALUES
(2, 7, 1, 1, 1, '2025-07-31 15:00:53', '2025-08-08 12:37:02', 0, '2025-07-31 18:00:49', '11376', 1, '2025-08-08 12:37:02', '2025-08-08 12:37:02');




INSERT INTO `expense_categories` (`id`, `branch_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'food', '2025-08-14 15:39:02', '2025-08-14 15:39:02');




INSERT INTO `extended_guest_reports` (`id`, `branch_id`, `room_id`, `checkin_details_id`, `number_of_extension`, `total_hours`, `shift`, `frontdesk_id`, `partner_name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 2, 24, 'AM', 1, '1', '2025-07-31 13:42:23', '2025-07-31 13:42:31');
INSERT INTO `extended_guest_reports` (`id`, `branch_id`, `room_id`, `checkin_details_id`, `number_of_extension`, `total_hours`, `shift`, `frontdesk_id`, `partner_name`, `created_at`, `updated_at`) VALUES
(2, 1, 34, 6, 1, 12, 'AM', 1, '1', '2025-08-06 09:32:41', '2025-08-06 09:32:41');
INSERT INTO `extended_guest_reports` (`id`, `branch_id`, `room_id`, `checkin_details_id`, `number_of_extension`, `total_hours`, `shift`, `frontdesk_id`, `partner_name`, `created_at`, `updated_at`) VALUES
(3, 1, 3, 3, 1, 24, 'AM', 1, '1', '2025-08-06 09:32:53', '2025-08-06 09:32:53');
INSERT INTO `extended_guest_reports` (`id`, `branch_id`, `room_id`, `checkin_details_id`, `number_of_extension`, `total_hours`, `shift`, `frontdesk_id`, `partner_name`, `created_at`, `updated_at`) VALUES
(4, 1, 130, 9, 1, 12, 'AM', 1, '1', '2025-08-08 12:29:27', '2025-08-08 12:29:27');

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
(1, 1, 'DRINKS', '2025-08-06 09:43:06', '2025-08-06 09:43:06');
INSERT INTO `frontdesk_categories` (`id`, `branch_id`, `name`, `created_at`, `updated_at`) VALUES
(2, 1, 'DESSERTS', '2025-08-06 19:29:08', '2025-08-06 19:29:08');
INSERT INTO `frontdesk_categories` (`id`, `branch_id`, `name`, `created_at`, `updated_at`) VALUES
(3, 1, 'MAIN DISH', '2025-08-06 19:30:14', '2025-08-06 19:30:14');
INSERT INTO `frontdesk_categories` (`id`, `branch_id`, `name`, `created_at`, `updated_at`) VALUES
(4, 1, 'BREAKFAST MEALS', '2025-08-06 19:31:23', '2025-08-06 19:31:23'),
(5, 1, 'BUDGET MEALS', '2025-08-06 19:31:34', '2025-08-06 19:31:34');

INSERT INTO `frontdesk_inventories` (`id`, `branch_id`, `frontdesk_menu_id`, `number_of_serving`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 7, '2025-08-06 09:44:22', '2025-08-08 12:36:05');
INSERT INTO `frontdesk_inventories` (`id`, `branch_id`, `frontdesk_menu_id`, `number_of_serving`, `created_at`, `updated_at`) VALUES
(2, 1, 2, 7, '2025-08-08 12:35:06', '2025-08-08 12:35:37');


INSERT INTO `frontdesk_menus` (`id`, `branch_id`, `frontdesk_category_id`, `name`, `price`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'C2', '40.00', 'menu_images/hliXkf5SVayhrK2Ufb75ozq1AIUOoOhe6CYjiohz.jpg', '2025-08-06 09:43:44', '2025-08-07 14:03:08');
INSERT INTO `frontdesk_menus` (`id`, `branch_id`, `frontdesk_category_id`, `name`, `price`, `image`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 'COKE ZERO', '20', NULL, '2025-08-06 19:29:28', '2025-08-06 19:29:28');
INSERT INTO `frontdesk_menus` (`id`, `branch_id`, `frontdesk_category_id`, `name`, `price`, `image`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 'COKE ZERO', '20', 'menu_images/1LEyv3uOROh6vL71FocZ59Tm8v7xoWKk2r8vfkIf.png', '2025-08-06 19:29:51', '2025-08-09 15:37:04');

INSERT INTO `frontdesks` (`id`, `branch_id`, `name`, `number`, `created_at`, `updated_at`) VALUES
(1, 1, 'frontdesk', '1', '2025-07-28 16:42:40', '2025-07-28 16:42:40');


INSERT INTO `guests` (`id`, `branch_id`, `name`, `contact`, `qr_code`, `room_id`, `previous_room_id`, `rate_id`, `type_id`, `static_amount`, `is_long_stay`, `number_of_days`, `has_discount`, `discount_amount`, `has_kiosk_check_out`, `created_at`, `updated_at`) VALUES
(1, 1, 'jose manalo', 'N/A', '1250001', 1, NULL, 4, 2, 480, 0, 0, 0, '50.00', 1, '2025-07-31 13:37:09', '2025-07-31 13:47:45');
INSERT INTO `guests` (`id`, `branch_id`, `name`, `contact`, `qr_code`, `room_id`, `previous_room_id`, `rate_id`, `type_id`, `static_amount`, `is_long_stay`, `number_of_days`, `has_discount`, `discount_amount`, `has_kiosk_check_out`, `created_at`, `updated_at`) VALUES
(2, 1, 'john romero', 'N/A', '1250002', 4, NULL, 5, 2, 592, 0, 0, 0, '50.00', 1, '2025-07-31 13:37:57', '2025-07-31 14:38:58');
INSERT INTO `guests` (`id`, `branch_id`, `name`, `contact`, `qr_code`, `room_id`, `previous_room_id`, `rate_id`, `type_id`, `static_amount`, `is_long_stay`, `number_of_days`, `has_discount`, `discount_amount`, `has_kiosk_check_out`, `created_at`, `updated_at`) VALUES
(3, 1, 'micheal diaz', 'N/A', '1250003', 3, NULL, 9, 3, 872, 0, 0, 0, '50.00', 0, '2025-07-31 13:38:35', '2025-07-31 14:40:23');
INSERT INTO `guests` (`id`, `branch_id`, `name`, `contact`, `qr_code`, `room_id`, `previous_room_id`, `rate_id`, `type_id`, `static_amount`, `is_long_stay`, `number_of_days`, `has_discount`, `discount_amount`, `has_kiosk_check_out`, `created_at`, `updated_at`) VALUES
(4, 1, 'def', 'N/A', '1250004', 1, NULL, 4, 2, 480, 0, 0, 0, '50.00', 1, '2025-07-31 14:41:54', '2025-07-31 14:42:34'),
(5, 1, 'fed', 'N/A', '1250005', 1, NULL, 4, 2, 480, 0, 0, 0, '50.00', 1, '2025-07-31 15:00:08', '2025-07-31 15:00:43'),
(6, 1, 'test', 'N/A', '1250006', 34, 88, 2, 1, 536, 0, 0, 0, '50.00', 0, '2025-08-05 13:49:41', '2025-08-05 13:52:46'),
(7, 1, 'test_2', 'N/A', '1250007', 89, NULL, 1, 1, 424, 0, 0, 0, '50.00', 0, '2025-08-06 09:31:45', '2025-08-06 09:31:59'),
(8, 1, 'test_3', 'N/A', '1250008', 168, 43, 5, 2, 592, 0, 0, 0, '50.00', 0, '2025-08-06 09:33:17', '2025-08-06 09:35:31'),
(9, 1, 'marites', 'N/A', '1250009', 130, NULL, 2, 1, 536, 0, 0, 0, '50.00', 0, '2025-08-08 12:28:10', '2025-08-08 12:28:24');

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
(8, 'App\\Models\\User', 8),
(3, 'App\\Models\\User', 9),
(6, 'App\\Models\\User', 10),
(2, 'App\\Models\\User', 11),
(5, 'App\\Models\\User', 12),
(4, 'App\\Models\\User', 13),
(7, 'App\\Models\\User', 14),
(2, 'App\\Models\\User', 15),
(3, 'App\\Models\\User', 16),
(6, 'App\\Models\\User', 17),
(5, 'App\\Models\\User', 18),
(4, 'App\\Models\\User', 19),
(7, 'App\\Models\\User', 20),
(3, 'App\\Models\\User', 21),
(2, 'App\\Models\\User', 22),
(6, 'App\\Models\\User', 23),
(5, 'App\\Models\\User', 24),
(4, 'App\\Models\\User', 25),
(7, 'App\\Models\\User', 26);

INSERT INTO `new_guest_reports` (`id`, `branch_id`, `room_id`, `checkin_details_id`, `shift_date`, `shift`, `frontdesk_id`, `partner_name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'July 28, 2025', 'AM', 1, '1', '2025-07-31 13:40:50', '2025-07-31 13:40:50');
INSERT INTO `new_guest_reports` (`id`, `branch_id`, `room_id`, `checkin_details_id`, `shift_date`, `shift`, `frontdesk_id`, `partner_name`, `created_at`, `updated_at`) VALUES
(2, 1, 4, 2, 'July 28, 2025', 'AM', 1, '1', '2025-07-31 14:38:03', '2025-07-31 14:38:03');
INSERT INTO `new_guest_reports` (`id`, `branch_id`, `room_id`, `checkin_details_id`, `shift_date`, `shift`, `frontdesk_id`, `partner_name`, `created_at`, `updated_at`) VALUES
(3, 1, 3, 3, 'July 28, 2025', 'AM', 1, '1', '2025-07-31 14:40:23', '2025-07-31 14:40:23');
INSERT INTO `new_guest_reports` (`id`, `branch_id`, `room_id`, `checkin_details_id`, `shift_date`, `shift`, `frontdesk_id`, `partner_name`, `created_at`, `updated_at`) VALUES
(4, 1, 1, 4, 'July 28, 2025', 'AM', 1, '1', '2025-07-31 14:42:07', '2025-07-31 14:42:07'),
(5, 1, 1, 5, 'July 28, 2025', 'AM', 1, '1', '2025-07-31 15:00:22', '2025-07-31 15:00:22'),
(6, 1, 88, 6, 'July 28, 2025', 'AM', 1, '1', '2025-08-05 13:50:37', '2025-08-05 13:50:37'),
(7, 1, 89, 7, 'July 28, 2025', 'AM', 1, '1', '2025-08-06 09:31:59', '2025-08-06 09:31:59'),
(8, 1, 43, 8, 'July 28, 2025', 'AM', 1, '1', '2025-08-06 09:33:25', '2025-08-06 09:33:25'),
(9, 1, 130, 9, 'July 28, 2025', 'AM', 1, '1', '2025-08-08 12:28:24', '2025-08-08 12:28:24');





INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 4, 'mobile-token', 'a2d09a52b497b88b1706c5c1591e70c9ddc1421701e880a021f5cffb638bac64', '[\"*\"]', '2025-08-01 11:40:24', NULL, '2025-07-31 13:35:39', '2025-08-01 11:40:24');








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
(2, 1, 1, 5, 7, '2025-07-31 15:00:53', '2025-08-08 12:37:02', 11376, 1, 'AM', 1, '2025-07-31 15:00:53', '2025-08-08 12:37:02');
INSERT INTO `room_boy_reports` (`id`, `branch_id`, `room_id`, `checkin_details_id`, `roomboy_id`, `cleaning_start`, `cleaning_end`, `total_hours_spent`, `interval`, `shift`, `is_cleaned`, `created_at`, `updated_at`) VALUES
(3, 1, 4, 2, 7, '2025-08-08 12:37:05', '2025-08-08 12:52:05', 0, 0, 'AM', 0, '2025-08-08 12:37:05', '2025-08-08 12:37:05');

INSERT INTO `rooms` (`id`, `branch_id`, `floor_id`, `number`, `area`, `status`, `type_id`, `is_priority`, `last_checkin_at`, `last_checkout_at`, `time_to_terminate_queue`, `check_out_time`, `time_to_clean`, `started_cleaning_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1', 'Main', 'Available', 2, 1, '2025-07-31', '2025-07-31', NULL, '2025-07-31', NULL, NULL, '2025-07-28 16:39:09', '2025-08-08 12:37:02');
INSERT INTO `rooms` (`id`, `branch_id`, `floor_id`, `number`, `area`, `status`, `type_id`, `is_priority`, `last_checkin_at`, `last_checkout_at`, `time_to_terminate_queue`, `check_out_time`, `time_to_clean`, `started_cleaning_at`, `created_at`, `updated_at`) VALUES
(2, 1, 1, '10', 'Main', 'Available', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-28 16:40:33');
INSERT INTO `rooms` (`id`, `branch_id`, `floor_id`, `number`, `area`, `status`, `type_id`, `is_priority`, `last_checkin_at`, `last_checkout_at`, `time_to_terminate_queue`, `check_out_time`, `time_to_clean`, `started_cleaning_at`, `created_at`, `updated_at`) VALUES
(3, 1, 1, '11', 'Main', 'Occupied', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-07-31 14:40:23');
INSERT INTO `rooms` (`id`, `branch_id`, `floor_id`, `number`, `area`, `status`, `type_id`, `is_priority`, `last_checkin_at`, `last_checkout_at`, `time_to_terminate_queue`, `check_out_time`, `time_to_clean`, `started_cleaning_at`, `created_at`, `updated_at`) VALUES
(4, 1, 1, '12', 'Main', 'Cleaning', 2, 1, '2025-07-31', '2025-07-31', NULL, '2025-07-31', '2025-07-31 17:39:06', '2025-08-08 12:37:05', '2025-07-28 16:39:09', '2025-08-08 12:37:05'),
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
(34, 1, 1, '5', 'Main', 'Occupied', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-08-05 13:52:46'),
(35, 1, 1, '50', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(36, 1, 1, '51', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(37, 1, 1, '52', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(38, 1, 1, '53', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(39, 1, 1, '6', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(40, 1, 1, '7', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(41, 1, 1, '8', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(42, 1, 1, '9', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(43, 1, 2, '100', 'Main', 'Uncleaned', 2, 1, NULL, NULL, NULL, NULL, '2025-08-06 12:35:31', NULL, '2025-07-28 16:39:10', '2025-08-06 09:35:31'),
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
(77, 1, 2, '92', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10');
INSERT INTO `rooms` (`id`, `branch_id`, `floor_id`, `number`, `area`, `status`, `type_id`, `is_priority`, `last_checkin_at`, `last_checkout_at`, `time_to_terminate_queue`, `check_out_time`, `time_to_clean`, `started_cleaning_at`, `created_at`, `updated_at`) VALUES
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
(88, 1, 3, '123', 'Main', 'Uncleaned', 1, 1, NULL, NULL, NULL, NULL, '2025-08-05 16:52:46', NULL, '2025-07-28 16:39:10', '2025-08-05 13:52:46'),
(89, 1, 3, '124', 'Main', 'Occupied', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-08-06 09:31:59'),
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
(127, 1, 4, '200', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10');
INSERT INTO `rooms` (`id`, `branch_id`, `floor_id`, `number`, `area`, `status`, `type_id`, `is_priority`, `last_checkin_at`, `last_checkout_at`, `time_to_terminate_queue`, `check_out_time`, `time_to_clean`, `started_cleaning_at`, `created_at`, `updated_at`) VALUES
(128, 1, 4, '201', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(129, 1, 4, '202', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10'),
(130, 1, 4, '203', 'Main', 'Occupied', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-08-08 12:28:24'),
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
(168, 1, 5, '253', 'Main', 'Occupied', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-08-06 09:35:31'),
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
(205, 1, 5, '290', 'Main', 'Available', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:40:05'),
(206, 1, 5, '294', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11');

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('039iZFqqsxmEzYDhxCQ1USaNwtjLEMp4Pkpl5AbA', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnV6ODRkMWF2TFBlSlF3b3lMZDZMOVZwc0ZXYjVIbUZ1WWFZZnYwUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGF5b3V0PS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGcGhwLmluaSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151325);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0G6V62OcI9pL7GbVz6PJvAOs8FUni3FIjvUylSjD', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUZYb2FIT3E0RHVyVFBpR01MRFR0cHF0b2FxbkVaN3ZkOWhiRFpIWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9pbmRleC5waHA/b3B0aW9uPWNvbV9jb250ZW50Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151531);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0Maa9AljRZpO5wHke6471NA36IgSRbzl1ugjiMMF', NULL, '193.32.162.136', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOE1GeFJSVkNjeXhxMmU1ZXpqU3FZU0NKVjdvSkMzMnVQWEhJVm50USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755152251);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0pAzBQZ4a7xzWExxLtAHfqQiPWP71087nbqtFUgD', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSlkzU1FJY1c3bzI1MGpMMFlhWDdHS25oaVFKT1A3NXVaNHl5a21hcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGFnZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm15c3FsJTJGbXkuY25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151476),
('0r61V0GyqzkPzTXyoxOkW7y8h75HyZMZCZfBlKFT', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHBkdDVpNVA3NkxXMUdLUWt4S3U3VEhEOUlPV1R6SlFXQjFRcWZBYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBhc3N3ZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151196),
('1PISRkLUtbJq4Bye0sVdF87KmtNFOiQ6uX6rScXx', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0l2Uk1HUE5ja3U1cUFwbHhQcTRZbm9jSHhZYXpFZ083UXFBZmZYOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29udGVudD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm5naW54JTJGbmdpbnguY29uZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151446),
('1PJIuioeI5PV3rxkIuIw2hGKDMb3giFSvlVygqVG', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3hwWndET3ZLODBNMmI4ajlES2wwZ0p4RVFtUEc5cFFLQzJQSnQ3diI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y2FsbGJhY2s9Li4lMkYuLiUyRi4uJTJGLi4lMkYuZW52Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151423),
('1UZYm4Yw1ewOXyjsO449LB6t4EIhSniJkNiSROmo', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVRuVElPaDVWTjdQUVQ4eUVoT0F0SmtiUktZbWZyZWR3blpvWUw0bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YWN0aW9uPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGc2hhZG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151166),
('22W4KQtBlei0JGqqTxKMLzD0mAQVk7Fr3PFMauzn', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFdkQXkyZFk0VjV4VHFXNkk5d2NmYmUyVWdYbEM0ZDRpQW9xWGdGRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGF0aD1waHAlM0ElMkYlMkZ0ZW1wIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151477),
('29pYM6o3ykYN1KWPZziDtdnWSV4kky9b8tG3jC1v', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibUowVVRTSXlqSUN5clNZUDZEd2J0TjRBN29Ed1MxQlhLYThhc1JYbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29uZmlnPS4uJTJGLi4lMkYuLiUyRi4uJTJGcm9vdCUyRi5iYXNoX2hpc3RvcnkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151359),
('2aJfbYnh4atI3LaPH0ekw9JT8nZiYrhCg9YtFkuC', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1pPVElQcGJTY2xGSW56d1lYV1ZWUnh6RVVYSGRUUkJOMldhNVRkRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGhlbWU9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZob3N0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151407),
('2byYpmokKyGkVc4is3dou4ROPA8hLzXs2Q1YL3fn', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic2NFQXk0MWxyWjQ5SHlPb1JaUDI5cVFSNDFXWnI4WExlYUsyOW1SdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTAxOiJodHRwOi8vMTM5LjU5LjI1Mi4xMDAvP2ZpbGU9ZGF0YSUzQXRleHQlMkZwbGFpbiUzQmJhc2U2NCUyQ1BEOXdhSEFnYzNsemRHVnRLQ2QzYUc5aGJXa25LVHMlMkZQZyUzRCUzRCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151168),
('2HYnkaj2DaqU6oIwBiuOJAMdfG8R87nONzkDPEs4', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSkRhT3k4YnNlNzg1a1I1QUpvQkxPUHUyejIyQkgza09iNmNhd2VuNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c291cmNlPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGaG9zdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151116),
('2LKzvkVf1n0cgsy4Jg52BVtnjQqTPfOGtPjQXa9r', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicExYMDdoM0ZLbDdEQUpyS3FCazRxNDExUG9aRjFWRzlWV2p2Ylh0USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cmVhZD0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRmFwYWNoZTIlMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151404),
('2URobUx2g3uA0o6QIaukHKiPUobZKaWGe40zjAkt', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1hYdUVHUGxZaEE3dDJDb1FhaENvWGJCZm4xWFBGVWQzZnRvWWNsSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGlyPS4uJTJGLi4lMkYuLiUyRi4uJTJGLmVudiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151279),
('2WjvUvc0DDgTy1I9cgoO3x33s1rNZrApJJisYtA0', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTM5bkdSZzlJeWRVOGJ6NHhLNWgzdHN3UlVhRUlKdHVJa3o1WlB3SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Zm9sZGVyPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGbmdpbnglMkZuZ2lueC5jb25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151194),
('31RmvVmyzbl4TmTuBokABSrCxjNmIbokNVwxuTbz', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNFRUbzNoMDgwSnJZeUU0cDVnWmQyUkN3aE5ET2hDRURaU1FsNGpqVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jbHVkZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBhc3N3ZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151643),
('37OXtQycczzUJvd5K1mdfEqg9Q2fO6MyzQ3GI99N', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEI4YUZWTzN4VGJQcnYwc2ZPMGlHWUU5bjhQY3djWVkwV3NSZUtpdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dmlldz0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZ3aW4uaW5pIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151547),
('3bAsY6lmHAiFBnwIhIZkkjLZgP2tuRif3NwLmHNl', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNTg4NmtkUVNyRmRvekFqQTZiSnJNdTlveGttY2txRmRHcFdJMmx2aiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bG9hZD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBocC5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151149),
('3d3vKLHQQX3F5TuzBFUPeAvJDYVvTMszKVlCBAZf', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNU5DcFlpaDdJUDZITVlPUlBtdmhNdVdrZFhEUllLWkZqRWQ5ek9MdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29udGVudD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBocC5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151588),
('3QVdVfTYisgEOwJ7fgTJ2eX0IlFDJyPGAkUkD4Gx', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHlMZE4zVlRkZXdBc3BkSG90TG9uSWdDamJ6eDEzT0h4bTA3YU10UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151773),
('3WVhTVl0VYuTAGI0TkaLL47q6MAHgYgmqskwSkbf', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGhtT2FXUXJKQlNVVzFYd2dRM1JzcDR1eGZySFMzMnQ3bXN3NUJxMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jbHVkZT0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRm5naW54JTJGYWNjZXNzLmxvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151671),
('3YBRQAtMsgSJQOhBcwWMNSPjAkDxy8qKsSFEwF7K', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEFpMFlIYzJaRFdRZG1sT3RaRzBkUmQwNzVveUVORDBKeTVDNjZWMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGF0YT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBhc3N3ZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151103),
('3yMUtmvQzmROroZ8eVImIVIkwaGWJ9bPOgnK2RPt', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkphc1VBcGlpTGNlN1RDaHFNTkpZM1I3aVZ1enJpVkdCNlpyaGMyTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bmF2aWdhdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBhc3N3ZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151631),
('3zw9LVYAKpc4tsoRLqJ9flpuy1jMwmYVtqEOmcA3', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZW54cjlRcDJ4TTh4bTdqVHBLeW1CdXl0QkZiek5reEdHYTM3ODZncCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGU9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZteXNxbCUyRm15LmNuZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151113),
('40x5MgsWnMDMQwnpClBD5lPkTmm0M2i8zdVBuLCb', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYTBMRU41dXZRRXY3NTBwUjJnc3FPVlJmc21vQ1NBWWlCR0lYcVY3SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGF0aD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm15c3FsJTJGbXkuY25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151378),
('45bd0ei5XvrD0FanR8Ly3FGIxaJZMAaVvTsqsx1T', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDk2WkpNYTd5Q0VtRUtjOURMMU9yZFFrazhXcTZ1SnlEcXJmbjI5aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGhlbWU9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZwYXNzd2QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151604),
('48bZI07Xq8SSIVT0U7GfieL8lVt8NEoyI18WWKvB', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGtFendhM1ZvRm85NlZpUml1bHl6RFptSjVNbHkySHpjOEFWTnJDeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jbHVkZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnNoYWRvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151154),
('4CeiPhgvgB2wQt06GiG9GRB2vIn3Dl1W82LML9l1', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOVZ1M0tLbWdveDdDYkNSMmQ2ek5iZUlLQnNTYUxuelJoWnN6TnVubiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151783),
('4cGGl7h3PD4dxgN7ZnfAEy6lRVvEruJNMV2ZmtF4', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSDFubkhLY2JXdXhiWEtrc0xVVVZKVzZkWkVYN0dLOVpNaFVXMmxuNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZ3aW4uaW5pIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151284),
('4IlFkiRgwz0fFb9Duj6LmTvrISns4ekpUWFtJadw', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY2lQaXFTSUl2SjVwbUJOdGU1QUR2MUxXMjBLaDdDWjhWNUtZT2VmWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9sb2dpbj9hY2Nlc3NfdG9rZW49YS5iLmMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151439),
('4J4neuqYXXl1DDGx7nfHrJ9QE43E4Ntg5APXxi2r', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUtRNldvVkJuSEVON3RqV3hSSzRnRTlGSmh5WmxlYkJJYTNYWXBzMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YWN0aW9uPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGcGFzc3dkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151106),
('4s3ctwzRJJBcMpbywHsB1jKmMU9BDLtGGxp7mwTX', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUFydjZYT25FbW9hT3VEM3BxSXV1TndPWmIxYzY1U2RSNmc3TVdkNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bG9hZD0uLiUyRi4uJTJGLi4lMkYuLiUyRnJvb3QlMkYuYmFzaF9oaXN0b3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151300),
('4UahiWnJSYmeoDHWYNcfsS6O1TGSDy5H7vt0dBQ5', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRExFZUs5UTl2S29Ga1RjSm93ZTFrRDhUSDJsS2czVG5iMkhBaEdpciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c2VjdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZ3aW4uaW5pIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151540);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('4yaGxhV3x6WzB64PAWi7XOQcQZo7C307SkSfL9GC', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjg3T3pNU2xaZ3ZDOG1tTWl2b2pVMFZnd2o3Y1dyR2pzaFRuTUdVZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bW9kdWxlPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGbmdpbnglMkZuZ2lueC5jb25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151240);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('5e6d1qnTsuwnRNQo0UT76va9iovcog1qmDPNcxAW', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEEyRlp6YTdwTXVnOWFYT1MyRzFNWU5TTkFObVBoaEtUUnpFTVpMbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dmlldz0uLiUyRi4uJTJGLi4lMkYuLiUyRnByb2MlMkZzZWxmJTJGZW52aXJvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151651);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('5JNMUl5LHrsEIYCAU39RZ35nxBO8mFCvJY9L7rlS', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHA5NWQzZ0RldUZ6MVgzVmJpcEM5NHVhdFptQjBmOUpHQ0ZRbDZVZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGFnZT0uLi4uJTJGJTJGLi4uLiUyRiUyRi4uLi4lMkYlMkZldGMlMkZwYXNzd2QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151601),
('6cGhCGfCXRha8FTaDLkC1jcN1slESAfOaBTPu2US', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFE4NEwzc0hyZllMY1pQZWhiUUJWZXNINkxxajMzUGE0eXYyckp2VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZwYXNzd2QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151355),
('6hddQyoROjgyroBVfvNmxn74Z3UnokvWCYrLvBkP', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ01oNXBVYkppcm40VGpwSXpsbnBWd214OTFlcGtlaEZoODFGeGxCNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y2FsbGJhY2s9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZob3N0bmFtZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151645),
('6mNAVs5ak9QweU3Y83qlSBDjDLQKTqsQaHAjRpLS', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHc3b1ZlcEREcFhyODloUFhqTkN3bDhFUEsyUmdMeDE5M2hFblR2MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW1nPWh0dHAlM0ElMkYlMkYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151409),
('6PKJkLjyff6woLj3lMQHDmzUnlaYm6boTu2OILgq', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0tyRGNEZkpMekw1MDkzdkh1WXhmblFvYkdqN3RscEJ1a1pBWmNmbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151219),
('6rVZJUESToynXH9ZOrNqPbNBt5JUdCZ2mFNIv35O', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjR5RHhkZXN1Zk1EWWZlWXZoM3RqcmtzZ1hUUEN4cUtlTjBvTWUzNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGF0aD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBocC5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151293),
('7BYM5gnf7Sk6SXjORBvJTJPXYUZ0q1hqxH4btfDV', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSURRUlVvSnBaamNodzhTVUR3MEt6RnRaaFd5alVVRTNXSTF6bXpLWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dmlldz0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBocC5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151326),
('7GVwxid7EUvqHK9rPsm5DWyF1jvcsIMg38q6Inwg', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidDlVZUhmWTM3Zk1PN2o0c1NDTDhPTG4zaGRCZE10eHVmWEtSM3pZQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGFnZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBocC5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151260),
('7Kc0i0rDWJE7YEQbbRmIehkeaWIaNpyH6gzIkSWP', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieU4xTEFtVmZwM21QMWNGZWk1WVRNMlhMTjd5NlZiZ0NrOVNOb2hHOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y2FsbGJhY2s9Li4lMkYuLiUyRi4uJTJGLi4lMkZ2YXIlMkZsb2clMkZhcGFjaGUyJTJGYWNjZXNzLmxvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151627),
('7M8Lzk7AsznStiWXxs804gV2MJh5gZLkMk83lS0l', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXlQbVhrZk44NlZRdzc5Yk5oaEhBN0k5VXpUOGZRN2pUM0pURklWbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c291cmNlPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGcGhwLmluaSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151185),
('7mqawyPtJwfaQGRMY3uI64BtuSyDLbYnlrFAKWMY', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEVkOGpBQzJrbmM2Zm5LRjdVaThLaEVkM05rVElFRGhXR0dOeTc0ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c291cmNlPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGaG9zdG5hbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151616),
('7QQsKMLn6wObh1HJS3WWc6W6lqGqWq49acf3LHTX', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWgwSjhqNnJzUFlDWUhtNVRtSnVpZEh5OEFzR3ZtT1AySThsZUduaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGF5b3V0PS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGc2hhZG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151309),
('7ToZrn6Bgk4FR86Dbm57EmtPp1ZA0GFkVjr6N510', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibFZxYWhUT1J3Y2F6MDNZRkl6THFleFBTM0d0WHdNa0Q5bnRuakdJSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGU9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZuZ2lueCUyRm5naW54LmNvbmYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151521),
('7v4jf20HRa4lgbrXkext7saK6k9qwnyLeFYliLyp', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1l1UUR0UG9LVVVWMXc4T095eGlNZndFZzBoZjBlc1ZDeTdyMkZtMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bG9hZD0uLiUyRi4uJTJGLi4lMkYuLiUyRi5lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151243),
('7wgn0FhKSk5LQaDUdk1M4oFO8g2TNCOAliPVMKcv', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkpIS2JxemhGRlVTVnFWTWtuUVNYSjJyV0J4MHpVOWxqZWd3Yjh1SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRndwLWNvbmZpZy5waHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151347),
('7Y3Re7cxuts3QKEJvdY4FpbAgFZtQQAggUbYFWio', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieWJFeHRiZW5qSzFMd29tcVk1UHpmdjBzR0l5eWxUSXkxcmlxaENWUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c291cmNlPS4uJTJGLi4lMkYuLiUyRi4uJTJGaG9tZSUyRnVzZXIlMkYuc3NoJTJGaWRfcnNhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151508),
('7ZbwRJizBVpM4zSn7Ao5OwaizzTPZc2cV185si9I', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1RZT0VCeHpRY282SjA5aGl0a0dOb2lIN1QxSE9GY2tXSDYwNmRSZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Zm9sZGVyPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGcGhwLmluaSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151404),
('8BeMy4dCvD4GxU21UEjEzoctnJhiVG8O2konjM0B', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQThUcVA2T0RWWk9XMHpvb2ZPUThsQ2tjaEQwRnc5bWlyYnU2ejI3NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jbHVkZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RuYW1lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151467),
('8C2E7nGrJGn6tnaVMgWfk3Qb53hI4Xnuhzspgg6K', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXNlNWhMbUtyYmV5Slhhc05mNUk3TkRCSHRHSnhzQWpoWEVWZm15byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dmlldz0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151150),
('8dpP5reUDF7Y96N1fBHNxtDhsa0C715UQNQCgIdh', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUpKUm9ldDFKclp6ZWdWcXEzNGRXdFJZNW1uTld0Z0pLQ2pXeHU5RSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jdW1lbnQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZzaGFkb3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151520),
('8enXBMiQ1EGYGcAlhmPPYjkYxfukdqTPYI5C8qXi', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiamhtbmxhNEdKTDBYMU5WOGprZUhCNUozREtVeVBMTzNvNWd5UkhKUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151401),
('8HqCIqkpz1QSkcxaWttjTm14f1x0FwYKyQjONIhN', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWdPNEc5dGZXbnlxZXRwZHRMRFhjdVRKWGZmUkp4bUZTSXFhell0VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YXNzZXQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZteXNxbCUyRm15LmNuZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151406),
('8kkQY4e1mv2Kahxc3MKteqjC7Kwq1n9B9MBd39uc', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjY3NFlHSGZ2bEF4RVhwRjVpbXpubmE3SVhjcmc0YzFOV1F6QTZydSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dmlldz0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZzeXN0ZW0zMiUyRmNvbmZpZyUyRlNBTSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151142),
('8l4dPNgD4aSag9SaOLV21pUc9auen92vO5Rno60U', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWZBNWFqZWN2d2R0a1VMbmh4VDF0YjZpMkZDSHdScnU2VlB0ekZJUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGU9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZob3N0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151331),
('8MGQcluL9uQ830qaXHZiRop590EeO2vLwCTpj7qa', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUktQa1UzdDh5TTdZcEVha2VWRmhhUXpqY1Q1Mjc2d1ZsOWtaRmR4biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c291cmNlPS4uJTJGLi4lMkYuLiUyRi4uJTJGdmFyJTJGbG9nJTJGbmdpbnglMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151610),
('8SRca5ikcfRhEjuOzONj6lbSSnpi7vz0n6pEot0Y', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTk9pT0hiYlJ0UWswVmptOWdqZUphU3JqQVNNUGUwdWl2MFFMWkFNaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c291cmNlPS4uJTJGLi4lMkYuLiUyRi4uJTJGV0lORE9XUyUyRndpbi5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151584),
('8VRWhD1qPgiGOM8mMkUXQu0ch6FEG0AoVJwxgTky', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRmp0OXNBNVkzVHh4NmJVYjk0WnBnZDBUT2hrZlU4MGxEN3NzYk15bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cmVhZD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm15c3FsJTJGbXkuY25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151114),
('8ZA09XzWykz5kAhqQV9jCK9Ibbte1D60JjDAmesa', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibkF4b0JRV2drYWRzdE42ckl2MllOOFJYd0RINmFKaGJMTHJvSGd0aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YXNzZXQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZwcm9jJTJGc2VsZiUyRmVudmlyb24iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151646),
('99hg5Yk6IXClZtljBOvfsjecWw6cig5nX4yil5Gy', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjZGTnFFZnFZQ1FoQXFpQW5qdU1sUkdSS3FHVUQ4cVN4RWNaa04zaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9pbmRleC5waHAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151636),
('9BhX9hkQcvpUfzAozd8Wb0qhoIF02qkA49q3rzJw', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNW5hVTZxZnZLTERzUU45ZTdtZWhUZ3dYTUJud0ZLckJNZll6V2gweCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Zm9sZGVyPS4uJTJGLi4lMkYuLiUyRi4uJTJGdmFyJTJGbG9nJTJGbmdpbnglMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151308),
('9d61yof35Es7QnAWXWJvcAapmr0SyQP0Wsw7JLGl', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzNlcm5UdDFBcWV0aDd5QTJlSDNwZjVNckpVWjBMeFRaaWxBQUtCeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c291cmNlPS4uJTJGLi4lMkYuLiUyRi4uJTJGV0lORE9XUyUyRnN5c3RlbTMyJTJGY29uZmlnJTJGU0FNIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151340);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('9IhJHGMRKuFpxcKdsLkn6tN5Vrd4g6Kfs3Oiwe56', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQjJXT3N0YkROOW8waHNJbGJmUUNYR21rcjE2aXFFMjFRcW1uWUM4MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRi5lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151575);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('9k6lNChdOsUh00tWd3sOMfkAA8J3fPWRgl1yh56g', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUEFjSGtoeEFIdDNhUjNuc1BQSVY1WEhpMW1NamZuTXRySU1QNTZTVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGhlbWU9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZob3N0bmFtZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151634);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('9L97WM9idSFDXTx79XlHjxZpwRCHzdGY4xO7sWog', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGpJUk5BMWJ1WUgyNUxLbTZuc0laYW10U3JKWnhGTjl5OXIyMkZRYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cmVhZD0uLiUyRi4uJTJGLi4lMkYuLiUyRmhvbWUlMkZ1c2VyJTJGLnNzaCUyRmlkX3JzYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151203),
('9qxEgkfaZs2xEtZsLg9rnDUGKk5uzr8RbQQuMr6l', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieE5lVzFpTG5kWXBRaG5teG5jREZZa1d1Q0hDaFhuc1dZbFU0RkFrWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bW9kdWxlPS4uJTJGLi4lMkYuLiUyRi4uJTJGdmFyJTJGbG9nJTJGYXBhY2hlMiUyRmFjY2Vzcy5sb2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151267),
('9sVxLVY66yJoJZEoI2vjCp89PST28XZJCLpGmsOs', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0ZmbGFFYlVuUG03NUtpcFBhVXBJMk1sTW1Ha2RueDlvWkRqbnc3SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jdW1lbnQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZXSU5ET1dTJTJGd2luLmluaSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151205),
('9u4M4v2iBvJiC04fJfCBQjsQmLFIUeSVRb2yJTz9', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNW8zSk1OQlBvckY2S1poQm1XRGpKMHFFTjFhSXlnYWJaa1IwOVJuOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Zm9sZGVyPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGc2hhZG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151194),
('9V7x88BFPxdhB3vxp6hudxO8LCVL2uekqDI15ImE', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREk3RXdWZGtqd1hxa04wVmE3S2R1bEx3R1VqYThrWTg2bEw3UXZReCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGF0aD0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRmFwYWNoZTIlMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151149),
('9XYYkHVcY0lMl1aZekVwfI3o4juM0LrcPuMMrQ2Q', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGYyUVNFbW5uSm1aMm5QRnladklHZ2pLdGRaN3B4TmVFb2dudTh1byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGU9Li4lMkYuLiUyRi4uJTJGLi4lMkZyb290JTJGLmJhc2hfaGlzdG9yeSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151166),
('A5BXyFamfbXb6vhIoTpOQZiKjlkl272Fw4ZNN9m9', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXFRb2p5eW1qVjRSTmg4MFhCcUJnSmNoVTJObWdzT3ZPRHFFMGJlWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29uZmlnPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGcGFzc3dkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151351),
('a6PUmgSUrK8tkyy3FFcXzq0713CRK7rCkpeILvEH', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibVNHeWE0eHhVdnkzazVVVTd5dTJBSERXQzlHbUdvVGdGUEtCUHN0ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jPS4uJTJGLi4lMkYuLiUyRi4uJTJGLmVudiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151669),
('afOVgdCNBHMegBuTX3cvQXr9Ad476mY6ZnAGKIpd', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2Ftd2FCWkRQNmZENlhvNTNSaWxIVk1LZWJHVzFXaHp5VDl4b25MUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGVfZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRm5naW54JTJGYWNjZXNzLmxvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151152),
('agkvOgOvaCM1fQjI2YPNag6xQ4aJgfwSLn81RRt3', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT09ad1NxNmQxM21hUW9yZmhEdjZ1UEZHZ25WSUEzSDA3a1Z3UGV1WSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y2FsbGJhY2s9Li4lMkYuLiUyRi4uJTJGLi4lMkZyb290JTJGLmJhc2hfaGlzdG9yeSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151613),
('aH6dBuj0W8VHWHVRoC5feIHJsjDVZ1Z4Rrg6KHBe', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHppNDFBOXR2c0ZkWGljVFJtQ1h1cG5uNDJ6OVpaQ3I5ZXNRc3JkaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGF5b3V0PS4uJTJGLi4lMkYuLiUyRi4uJTJGdmFyJTJGbG9nJTJGbmdpbnglMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151257),
('AiA6sWRdHE6dB7ferhlusyYWQawTZ4E7QAjQXltE', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHhjYllPdE4xNmVRNnhzUnV2dXNjbnhLYzNJS3ZxeFE4U0trZHFXZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29udGVudD0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRmFwYWNoZTIlMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151220),
('AIlYlfjg8qwzNZVAzCiRWTigkpAsRtwDNxpqFe0w', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidjV2aGdXRWNSNGxpV1lRV3E5eWRlZlRsZ0R2T0YxREtJZUVnM2JrVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bmF2aWdhdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm15c3FsJTJGbXkuY25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151128),
('AmBOIpFhsD0ztY9KgKG2GYn2GeL063csORKbAI7e', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1NiMVB4ajVac1NBT1FjNDY0OVFtVnUwVHVJcUZOVFJoV3I5Ukc5bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnNoYWRvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151392),
('AMfxDMTM05H60rX4NvDCZ6RYKGvy9wbMrSyBpizg', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMExIM3BNaUdQSGE3blBJdXRINmk5NHY3TmZ2cWZoN1pHVzBXM0l0SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YXNzZXQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZob21lJTJGdXNlciUyRi5zc2glMkZpZF9yc2EiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151114),
('AO7cKoSNV9xrM0Y6ro6t2wQHvatZaMxmzK4AlsRP', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0xQMzR4TVdweU9xeXpQMVZjd3hEdG1qVmVpMHZYdjM2N0I2RjA4TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151436),
('apobLRluQJmlE502GhaCAMcgPd9FyK8RxWw60foa', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZVpXVE5OSk1lMkgzV2JLUTIySmlGZ054ZXE0cEZadG1aMzJUUWdwMSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovLzEzOS41OS4yNTIuMTAwL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vMTM5LjU5LjI1Mi4xMDAvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151401),
('apoZHq4gRRfLt0HVgCHSzpzOqfAnXDrtHtDfFmPH', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlFQUEFxeFMwc2RVM3JMYlowSFgxOFM3TXFhbzFNQ0twU3diQWhIdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jPS4uJTJGLi4lMkYuLiUyRi4uJTJGLmVudiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151321),
('ARqIEQK8O6hhaGgO8Za3M6epf2T4nEDSrkRDGHKV', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1RFMHhqbFdHaTIyeHc2S1JUTkFKQ3lkeWVzemJMejlwNTVlUDRIWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGF0YT0uLiUyRi4uJTJGLi4lMkYuLiUyRi5lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151614),
('atVlDBGNmOGfvAMdRmhvIroQfIDuTNrn0xnf5nrT', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN25uVkZKNm40MzlkdXdFMmRMV2x3WTByN1FUMHNhVG1UN3F3Ylk5ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bW9kdWxlPS4uJTJGLi4lMkYuLiUyRi4uJTJGaG9tZSUyRnVzZXIlMkYuc3NoJTJGaWRfcnNhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151323),
('AvCmOMo8Vi22EotPLnTF2qmHOTbPn7GheQufBqkR', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2d1a3JZUlFXVnQxMnRORldDaTZOZ2tucFpyQ0NKY3BCVnlWanVzTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OTI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dHBsPSU3QiU3QmNvbnN0cnVjdG9yLmNvbnN0cnVjdG9yJTI4JTI3YWxlcnQlMjgxJTI5JTI3JTI5JTI4JTI5JTdEJTdEIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151630),
('aZFjMRAYkzBY6vVhbxktjIr0CvTxclUZ5PAdL1GY', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWHJsc09NRWdXZWJmdk42VUZsUVY1MzRseWw0YjljcjlvUUZlSWl4WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGFnZT0uLiUyRi4uJTJGLi4lMkYuLiUyRi5lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151543),
('b1ntuF4eDIOD13bdW5dliiwSbqniQTKceC87CRKc', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3FoNGNubE44NEZVMjcxZ1JwZFdBa3JUZVJDb3hqenNjc2pOUWNqbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bW9kdWxlPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGcGhwLmluaSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151121),
('b2EC3epzceqcdbPB31jpmvXB2mDzkFJ6DoNzo81U', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlFseWg3dTdtTXhiU1BqQ3Nuc2ZQdG52S21CTnBtWU9aaDRvMnlvSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGF0aD0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZ3aW4uaW5pIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151511),
('b365YnKCLo7470DzS5PiNT9rkis7rC4UROtbwyJu', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRk8xUGtOU2RRUnZsc0VrajZPY2pBajJ3MWFYckNib0d0V3U3WlFYUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YXNzZXQ9Li4lMkYuLiUyRi4uJTJGLi4lMkYuZW52Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151393),
('b976H3gayPZhdoDYlW5RCZfXmePgCNSiMO6Czdyt', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGVSZjU4MXIwMWQ3OVRndG81TG5FTEQ0bXNiNkh3N3lFaVFGMGpVeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c291cmNlPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGbmdpbnglMkZuZ2lueC5jb25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151462),
('bBLvQld4XGu0Ih9UyVnrsHybBWn8ycJR9LdNRui6', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidENVU1hKY3Fna2x1U0FBZ1J6dUhXNzdPeWtpUnZwZEZrWDlJQUhFZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bmF2aWdhdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm5naW54JTJGbmdpbnguY29uZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151418),
('bBx7tppy5NLRuI3RYoXpTfal4zt86sOVM9YTA5Zm', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWhPcWRSVG1LbjMzODJXcVdnUnpIc2JYYm5ZR2NFWG5GbGZIbG10byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151781),
('bChFcetFuCIikjFHW3LbdaK7RM6hiLpfwYNPLB3S', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnp0d0ZFc3RMNlc5R3N3UWdkYnJRN1BSU2FkQTVVT1Z3ZkZrQ0hsTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29udGVudD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151517),
('BJRblFHhYPdKO4SkOAu4H2ZCBcmGb0ma66MWHgwY', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia2huVmxYZFQyNUxqMldrY2Q1SjdTNUZkeXoyY1cyWFNXakZCM0NCYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGVfZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151114),
('BopGrSoLYzFOmvmXmgEkAvpLUlZJ89xd3UPIT1KC', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiczFIN09rTFM0ckdMYVVkTHVkbHdKbDd2M0psWU1NUEsxeDNtNW9sSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGaG9zdG5hbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151110),
('boWld7RMKDBTl2s2RVjZjSTr1hq0xcapKR1XYpTz', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjBLWng3UEcwUHd6cVJhMVpDc0JrUjQ1MWFVdWd1bFdQajlFSGJFTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGFnZT0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZ3aW4uaW5pIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151584);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('bPhUU1lWCGn6rwmcHqMTJyZODhSlUWZlNQQkqbU3', NULL, '101.33.66.34', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzdPTjZhWldJVE5aOXBla2lVNmgxenpSMHlRS2RFVkNlTGJ5UWMwZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755153593);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('BrARJx5l5KT7ZS6zueOQ9wb8LWxOuZlrwm5mBg66', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidThYOGdOY0ZWRW1nY2E3WFJRZ1lreVZIWVp1N1hXVGhoY3VObmtQMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29uZmlnPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGaG9zdG5hbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151164);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('bTErfFwxV6DRLxD5bXYOl8q7BvBKcwFN9M1JQtTJ', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNExKb1ZjQzBWZm5yRFprU2RvaDRHWm54WGU5TTIwTDlkNWtBUVpyNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGF0aD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151487),
('bTkHfBLeHT4efPRRNZGQ1L6IZVEfZbSbyEurSl2z', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlNoTTRvZjJLbm1obkloMVBOcVRwaHpqQjhLVzFmaUpqRmxmMUh3QyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YXNzZXQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZXSU5ET1dTJTJGd2luLmluaSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151154),
('BTV4LtdYMvo6yJeduGSPJXeotu4FCsTDcBqBVChD', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkZqTm1MMVk4Qnp5b1lweTYyZzNMYUF3SXJtOFFReUxqQ2VlRVJxNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c291cmNlPS4uJTJGLi4lMkYuLiUyRi4uJTJGcm9vdCUyRi5iYXNoX2hpc3RvcnkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151313),
('BuGw4TJ6WwKHA6yma3ynBKeFUPsOIyRh9G5DsVRc', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2V6WGtlS2Y4RTZETHBrTTd0SmhSWldpSndKc3B1SG5ad0tmQWV5UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGlyPS4uJTJGLi4lMkYuLiUyRi4uJTJGcHJvYyUyRnNlbGYlMkZlbnZpcm9uIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151354),
('buSqdXzcJ01YID3QBgMyLOZCxCqZMgvK2oUiar8i', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1hNNGJhRjlleEtyZTI4U2VWdHlnY0diRktubUU1RzdpUHlCaTVaYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Zm9sZGVyPS4uJTJGLi4lMkYuLiUyRi4uJTJGaG9tZSUyRnVzZXIlMkYuc3NoJTJGaWRfcnNhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151447),
('BWkuRKOR1UrP8N6UxEUuI1zMmtX3HwB9Rrxo2wM1', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibjZrRHE1dUVka3Jybk4zcVJGRThUT3AzeXp5TTNSeHJGRURkUmk5SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y2FsbGJhY2s9Li4lMkYuLiUyRi4uJTJGLi4lMkZob21lJTJGdXNlciUyRi5zc2glMkZpZF9yc2EiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151434),
('ByUmOSdJ92QD7koWG2LEy8lCjqzIajwL5zYpYNYF', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnhEbmJYdVE4aEVEUlBSZ1EwQ0JQUEwzV1BvdnluNVZFN3BTQkdBMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y2FsbGJhY2s9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZwaHAuaW5pIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151273),
('C27xWsUFX90J9GZLlIV0kWqPqsU1YxDnS0DXLqRn', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUozZUpVbklhQnJqQlNoc1pSYkZJSUtYUk56b29SdGZWZG9VcFhOZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29uZmlnPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGaG9zdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151253),
('c4ToZds8UPRqVM9pBL1O7KPGAN1dKaKfGKhnuflF', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3JiY014cW5PQ1U4S1Qwc1hObUpTTlVBd2JKYk1OWlB4SnllWDBCRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGF0aD0uLiUyRi4uJTJGLi4lMkYuLiUyRnJvb3QlMkYuYmFzaF9oaXN0b3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151322),
('C6pVKCLfVU07uzttZhSMJ6jYfxIrCVU7ARVSP4xA', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU0U0UmVUdTRJV1M0OThWNU1nZWwyRnM2TVA4ME9URTlCZWVERjRBNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151788),
('Ch6AhE7wT9Ibhwg2sRznRZcB48VD50yp6FvuPkiQ', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEFhOTBUdW5Ma0kzR2Jid3JnNWFlZG1hUkZ0bHBTSG5ld0JwdGtjVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jdW1lbnQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZteXNxbCUyRm15LmNuZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151632),
('chFbmvpUoAPONoUwh1w9U57lj1wVxLbUb5jREYWc', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWpiVWx0TFJERmZGVnBISDN6c3FyNU0ya0lVV2N1UGJMSExiWEVoZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGF0YT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm15c3FsJTJGbXkuY25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151176),
('cJCmRWQ5ErLxL3zlTXhmaNiLyIkuXwfRDHPmozVn', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFRuU29leXNpV1R2OTRGeFBLUWJnOTFjWXJFYjlGQzNDSHUwREFaUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YWN0aW9uPS4uJTJGLi4lMkYuLiUyRi4uJTJGdmFyJTJGbG9nJTJGbmdpbnglMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151318),
('CktiNw0QNimTXYh6SzeL2xLxMtS3xtmuCEhcfHOm', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS050elJkZ2ZFbE9rd2FiQllQYlFtSFNmTnFKMG9BcENma1JPVjJqQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jPS4uJTJGLi4lMkYuLiUyRi4uJTJGcHJvYyUyRnNlbGYlMkZlbnZpcm9uIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151386),
('clhGsfi1Nqwx0Lo1AethWzQDcvEfiM7o8mo0ie8I', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkZCMlhEZThjWG5xUm9DQjhodGtHaW1sN0N1cVdncVRoU0l3UDEwViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YXNzZXQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZuZ2lueCUyRm5naW54LmNvbmYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151371),
('CPCMFspSUWFDwMu8HzOJkrAQIJZutS3ZuQvfhaPB', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0xIOEZmOFN4NHdhV1pmTW9pU3dqRHRURloyTEMxbGZCaVJmM09pQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bW9kdWxlPS4uJTJGLi4lMkYuLiUyRi4uJTJGcHJvYyUyRnNlbGYlMkZlbnZpcm9uIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151189),
('CQ9twQXKQwWGtt1qJc38H5W2RkYxI9dQCCwtnHRM', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3E4Vmg0N2wzSGhIc2xHOXNFNkh0UFdBbG1kVmdaa29PVEYxeE1vUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c2VjdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRnJvb3QlMkYuYmFzaF9oaXN0b3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151372),
('CqS6j2QT6ev2coAh7pVwD968QGm9HgpJwe0tHW3l', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkU2cEtPeUs4YUl2dDhMeGJYdHU2Qkc5WmhYVVFKT3VsNnJEcUpweiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jdW1lbnQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZwcm9jJTJGc2VsZiUyRmVudmlyb24iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151426),
('cVaefcrwvCFodNiqJpn43Z6lN9MRWJo874nIRPIA', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidDJFTUdBa3FITmhKMUNvRzg3Tll6T2tpeGl1WmJZR3lTM3lwaXFraSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGcGFzc3dkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151614),
('d0DcBS380AIejf5IBX0rzJJrii5BFV0m9531flHi', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzI0NnR4YXAwcEJlaGFWemhmOUtVS1d0c0lFT21ubWZ4bWZDcDVHOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGF0aD1odHRwJTNBJTJGJTJGIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151583),
('d5jvMKpY9XaYMLWaY8vh1UDj9IbvfwSMqIfw3FGB', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGFibUpRU2EzQWZrZGt3RnpDMmFlWmV1SUpjcmVCVHNqbnRpOUVOWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YWN0aW9uPS4uJTJGLi4lMkYuLiUyRi4uJTJGLmVudiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151299),
('D7GpQH3Sza0swe8fYZewDCCUAs7ORBfgpQrCCeXx', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFBsZjByTWNQdkRlelZ5S2VtQUNxRFdCbjRPUkJPM1VBekd3anNWMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGF0aD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RuYW1lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151640),
('d8lDJBkNxExdyhgViTPXb108pY5OCSW3xluln3j5', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVI2d21VYXozazJnMnJ0VmNiY1kwbWxLWFJuZWxlUjNtR2c4VnZhWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bG9hZD0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRmFwYWNoZTIlMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151118),
('daTWKHCSoAJ9r8pThIDbQG0SCvns8JMmyTS01MiL', NULL, '172.89.67.230', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmxJNElsMnZPTkNVa2RFck1DVGJDSEN1bDhYbFpmamZzcmxrU29IeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755154233),
('DbUUfOSgAbh9skxqmcWQzZhre1CZ4i8qelPausOJ', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVjJQdzFsVEpGTnZ4NlBHa3MxY09VRlpHbllHU1JFendLbWFvSEdBMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmhvbWUlMkZ1c2VyJTJGLnNzaCUyRmlkX3JzYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151232),
('DCI25dL5drq09eDT89AnthFWaf4nlHLPzf2TITIJ', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0ZEckNKcGgwRlFzelJDa1luSkJGOTFoQXJ3UXdYTnZOcWtGTUwxNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGF0YT0uLiUyRi4uJTJGLi4lMkYuLiUyRnByb2MlMkZzZWxmJTJGZW52aXJvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151652),
('dFF08qLftMwYccKwKqYeVAhNGmKTu83nxjV05ted', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkhEVWNFRzhIQWhOajd5bEQ1S29PbWxuQWlqN2o5V2t2ajE0S0FGUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dmlldz0uLiUyRi4uJTJGLi4lMkYuLiUyRnJvb3QlMkYuYmFzaF9oaXN0b3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151569),
('DiekaRnVIUaCfFgIV1vgZ2L5sv6pTYjrdlMGEtWq', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieWR6WkQ5TUVYNXRrbFVKUlBHbE9OMnRVd2taZlRJMEwzeUZ4c055aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGVfZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRi5lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151305),
('dKdaTn91CdRZzP8OfELLIxLQcE0KwAmcZnIFOrkq', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDdPaThweFZFcUZRY29pRnV4VFZGYXRLd0E1eG5GNzU1S1ZTOGl6RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c2VjdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRnByb2MlMkZzZWxmJTJGZW52aXJvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151125),
('dlBTSWkjdMA6HVRikDm81Herr0rKz5f1lssV851h', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia040WjV3NGlUcXNjdGFNdU5LMm05RXFMdlhncnUza3g3VnBlYXZneCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bmV4dD1odHRwJTNBJTJGJTJGMTI3LjAuMC4xJTNBODAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151265),
('dMTRpbFzeNWLovS9FhtZvjcZDasPBFXLzQFmSKYq', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVV0Q2ZXS3pTdFN4YkFWbDBJWDBUUFFoMU9ONzhQZmxiNEthUU81VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jPS4uJTJGLi4lMkYuLiUyRi4uJTJGcm9vdCUyRi5iYXNoX2hpc3RvcnkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151346);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('dmWdZTDvYUi73AHgQO9KeJpjDmURj2DCRCzZXOkw', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjUyZmN5dk82emJ3d2REeTY0NzlYQmpFcEs5a0N5NGVmSVhFTGpmeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGc2hhZG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151631);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('dQOAG8Y2PXn2jjKko08UfctRxor8jTF9KSTDcf6e', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoielppTzlCMWJ1aU42dEZVbHhuVERaS203TWdjaFBHQTNPZ1pFVW1xNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dmlldz0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm15c3FsJTJGbXkuY25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151623);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('DtMLHVxhtULUaNrTAaSBqjzkwQmB2NeDI8JfGSU2', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDh2Z3dvWU9hejR1RzY1YlpobGVPS0J2VUNiREgwMHlPSHJrcG1EZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGF0YT1odHRwJTNBJTJGJTJGaW50ZXJuYWwlMkYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151606),
('dWesBpQsSpdsk9ZqJlHKksabdytkOcHfNuQngN1l', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic050a2w1U3htOTBhd0pzNUFabVU4ZnI4V1hybFQ5T1pWdTRTSkhqNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGU9Li4lMkYuLiUyRi4uJTJGLi4lMkZXSU5ET1dTJTJGc3lzdGVtMzIlMkZjb25maWclMkZTQU0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151192),
('DXwRy6dXKPMUaeSsIOPCvBo6NChBgNh9TQ6RA8yK', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXp2cnpBN3lkOGd2UEMxUG9CaEoyaWtiV0RPRXgwNTZWQlhxODFwSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGU9Li4lMkYuLiUyRi4uJTJGLi4lMkZ2YXIlMkZsb2clMkZuZ2lueCUyRmFjY2Vzcy5sb2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151482),
('DZdipdADi33Ry5XQMr1rhP2fSKSLsJV3lqiWQfLD', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTmRxMk5idFlGYTM1UWZsam85Sks4ckF0bG55NmN2Mm9jY1RTQWFocSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGVfZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RuYW1lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151554),
('E1TQ6UBm8K8mQdXTvNdlBr8al0un1BCZc926y1Bi', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia21ZRmlHUlZaeEtjeE5HcnlWSVBEZE9ZbVREWHJKdVNucTZJSmhXdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RuYW1lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151258),
('E5VIz12xx2J9LSSMgk8ChuEpUvrhRzOJGpZa6EAr', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2M1VTg2SUUxVXJ2REoyT3M2UXN4NDhmQVhpc0R2aHNza1VrendiNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGFnZT0uLiUyRi4uJTJGLi4lMkZldGMlMkZwYXNzd2QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151615),
('E7RSUIWg8cE3oPCQPynwRc4tMkk1LC9LOTEPDMAO', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzJaSkJjSlZvVE1MZjRIS3dBbENNdW1nWUR2SFYxOWF0Z1g4S0xTaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Zm9sZGVyPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGcGFzc3dkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151478),
('E8wh587uBUo9ges9HZI1WxiDjwCcLaeInEnY2lw9', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibnJua3lwWmlTWGpnZHI1c1duQzduN3hkeFptV1FFQWVXWGZ2OERMWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cmVhZD0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZ3aW4uaW5pIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151455),
('EBTMEwJi2UJmS57sPNjUw5CGsvTcAEmpNDjMt66U', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVklIR0c3TVd5RkJ4c0tEQmhCbm5WbHJYNXVxOHJ6cjV0RG5MdGh5RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bG9hZD0uLiUyRi4uJTJGLi4lMkYuLiUyRnByb2MlMkZzZWxmJTJGZW52aXJvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151202),
('EeQRi2B678CVcsEfF1nMs9EGYYbdHHw6ls0cFoPx', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnJ2VEl5YWNmQkNjUGFqRUcwY2YwdjFIaGNuUEZYc0RndFdWWUQ1VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRi5lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151534),
('EjbppiRg7xYDKrTqbLXGOVQo2FRaXHChGdfBGLAp', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWUwYUpybkdoUnlSeDRaSk5Ea0p0ZDVHSkU1OENDaDV0bHZ6OWttQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jdW1lbnQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZyb290JTJGLmJhc2hfaGlzdG9yeSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151270),
('EjudPmUXwbMUJ0yaex5xf7ATTsVYP1A3rwYOlDek', NULL, '79.124.58.198', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMHVkdmlMc0FpTnNjZ2xLaFEySm1PY0V5SlpRN3NxZlAyMGVBWU82SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/WERFQlVHX1NFU1NJT05fU1RBUlQ9cGhwc3Rvcm0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755155914),
('EMaAHomZ7kZMlA3QWFOaIvAyeosMiCIdjciZkGcG', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSUJEdjUxSWpKME1DUTRjc3YwdTlGcHhTNmlWcGVpeFR0dEJPMzNEcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c2VjdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm15c3FsJTJGbXkuY25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151656),
('emTdj0ZEZys22TB6Epn26kfRJ0yQ9aH3u0AL4PSa', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmdhbnBxWll0Tkp4UTMzRVRNMGpaTlBVdWxDMzNVdWg3d0p4MWQwMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGbmdpbnglMkZuZ2lueC5jb25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151640),
('eN1CVoWEoL34HmHVBeKKdvbDuEoZ92UCM5Di72ae', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzdVZVg5OGR0WWNnYUpBdENXNG9WZnNXVXJXbmJNMksxUHhhSlZsQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bmF2aWdhdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZzeXN0ZW0zMiUyRmNvbmZpZyUyRlNBTSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151438),
('EOioRpcSA6iast5IavPHmeI7y004E4Nk1RiZlUzN', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibFk0NU5la2c0YnFWaU1pdG55cHhabXhmMXE3aW14MlJHTmE0OFdITyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jdW1lbnQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZob3N0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151382),
('eopATOwdmn6mG33OaXmOLjBOpDrPZxchoaiWV57E', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0VNbGxmMGQxb3hwQ0c3VTV3bFFyZEhHMW04TkpYTWN2Z1BiUU41ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dmlldz0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRm5naW54JTJGYWNjZXNzLmxvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151579),
('EqVuhwFc5mfIK2MWk2iiuyQ0hdkt7JI1jUb6ZuQ9', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZDc2bVk2TWtVNEFQZ3lhSkdpcVJkUmFCdlBkYnBNcHg5SDhPRVNGYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGVfZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRnByb2MlMkZzZWxmJTJGZW52aXJvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151209),
('EsncFoDV9zbGm4pNFrh1G8jTVDapixIrplkBBi32', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic3VTQ2xqZDQ3SmIyU0JHZnZ1UjhuYWlqTWNNZDRKTDdvOWx5Z2djeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bW9kdWxlPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGc2hhZG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151465),
('EU5DGg3PWvGcPLRr3t6fHo06fcUYdYrV7rwUTPVO', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1lLcGh1S3p4ajFwYUg2RmIzUlVvR1FPY0xHUXJ3VG5yMTgxNjBycCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29uZmlnPS4uJTJGLi4lMkYuLiUyRi4uJTJGaG9tZSUyRnVzZXIlMkYuc3NoJTJGaWRfcnNhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151106),
('eUQi5E1P7aLlx7wuPeuqp8akEb12WAbkwIhheHCu', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTJwQjVic2VIV2w0TkZteEdiU2lyWWNXZk9ycjlROGI0ZFFNNmlsciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29uZmlnPS4uJTJGLi4lMkYuLiUyRi4uJTJGdmFyJTJGbG9nJTJGbmdpbnglMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151573),
('Exau7kB2PedXVpsTJQovQKp3ShDOGqICyqmzLZHd', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjhnMzJRc1BHYWxQWHhEN0FKU0lsS1BmZUpHY3RYVUluZFZyZzJLYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGF0aD0uLiUyRi4uJTJGLi4lMkYuLiUyRnByb2MlMkZzZWxmJTJGZW52aXJvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151223),
('EZhTALzzefNGw3ZCKRMptVK2co7UR7SMyFjcmR8q', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibVV3N3hGZUdVZUhSRnhJSDFidzlRVXRnVDRUc0p2R0FzZzkxTkZTWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBocC5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151185),
('F36xSSo9c6ldRzcTPHt4Fyrg0g0vBrtIycHd2XGk', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0xPWDNzR09sVnhuYWN5TGZUTkxCaEhJUU9vamJCNlpGRnRONWowOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9pbmRleC5waHA/b3B0aW9uPWNvbV91c2VycyZ2aWV3PWxvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151179),
('f4S44o2tB8Hy0OJMzn9PTItKihvUIEH7Wa2YWfjC', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGFyblNrRlhKVGRDQktxRUoyU3FVbkpvODhEQm9FdTdVZTBCUTloMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jPS4uJTJGLi4lMkYuLiUyRi4uJTJGV0lORE9XUyUyRnN5c3RlbTMyJTJGY29uZmlnJTJGU0FNIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151271),
('F9os1RytiK1bbM59aRfbAcXBKniHEBbpVNSiPkIz', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibDdvNTRNb3hsNmJGY2tzSjd2SjE1eUZ2ODJybVZHOFFoVmI5d1R5OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGF5b3V0PS4uJTJGLi4lMkYuLiUyRi4uJTJGV0lORE9XUyUyRnN5c3RlbTMyJTJGY29uZmlnJTJGU0FNIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151134),
('FBon8Zp4GF4AbztVLx9f9BbgWaAGWpJR8lMF98NP', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzlVOWtvWXdrZjBEU3BYWFAzQnN6QUF6MGpJSms5NUtrS3poZ1JRcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGF0YT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RuYW1lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151571),
('Fc0EIHHi21RuYwLVGlg6pRNDo42Tyic0v4A0Z39V', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEd5dEpKMFY4OHNESnBWYmhYTzBSeGZwd3R3TDI3dnRWZWZBY0tIRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZ3aW4uaW5pIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151671),
('FdNHK8ZEmg66eUcMxJOecA3TW0PgIUFrhR42LSos', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid2sydEdZaFlGcElteHJmaHFsNU83V0QxVFNNYTF1R1Fmejhsdm1tUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jdW1lbnQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZuZ2lueCUyRm5naW54LmNvbmYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151529),
('fdpwjTm42vH8s9PXsojtXDrxfjRpeeYSiFdiGzI6', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWU4dnZOTnBTS1NUSWRUSkZ5aFc3RTlJd1pYUGVsMnI5UWRIWHpLbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dXJpPWh0dHAlM0ElMkYlMkZsb2NhbGhvc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151436),
('feZtaRFDqpAnsmbzw1OH2DDHr9YbJaZIJdXtdTaE', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVDVtajRyZzZzcUU1YVFPRW1vVFVRYndQaWpRWENrZTNXZ3NDOGtCciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGF0YT0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZ3aW4uaW5pIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151438),
('fGNaFETubzhHPNH2RVOLiiB89dGRh8IUYeuHEaAA', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiakpNZ2dWYU9nd1ByeXNaS3puVTVYUmdSWnkzYTB3ZG40MU1WNWZUeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dmlldz0uLiUyRi4uJTJGLi4lMkYuLiUyRi5lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151115);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('FieZk7KsFNOyWEThrPrdIQLnKKWB5nT5X3nKbfJp', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVm5qUEVXcmZkUkh1b2NTVldrUFhrRFBEelFwSU1mZFhhR1ppSkhaNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dmlldz0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRmFwYWNoZTIlMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151411);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('FJOECirpELmPbBKzm3CYvgAL7swEliKfSjUPDLKW', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzNEcG10NE53TENjZzh1T1g0MVR1d2MxV0U5SHdoRGl6SDFGaUpRWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRnByb2MlMkZzZWxmJTJGZW52aXJvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151399);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Foft1M6pWurjjfffpWyFcorxVEliLGEQFVAW4pWf', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoialZ0alFSVGxPU0xKVXhaSmpiMFB1ZTFDeTl0enQxZ0Y0VjJyY1pBMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnNoYWRvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151129),
('fokLA6QOpL0Medg1g0LM37Z5ZNv8dxOsLox5GGm9', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWZIMGJpSFdsdU5OQ0hLWjFMZ3VOQkVXcUQ1enhuMWVkN3lsQko1NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bmF2aWdhdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRmhvbWUlMkZ1c2VyJTJGLnNzaCUyRmlkX3JzYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151178),
('FPjB0FigVomAz3EYV6be01k8VCZ0hfC2IpyYXW6x', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieXJvQkV6MjBzN3c3bVd2cG5udDJpczlwRHEyV2wxeVdEYndtZ3hPZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YXNzZXQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZwYXNzd2QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151332),
('ftdrtEF2KFyIsxX4yRw6Ip3hNmZvnDKAFPVzIxu9', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWFY0Zzd1NTNaNnlITWlvd29YcmNVSG8wemRnTHNDYjRWOHl5MjlmVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGFnZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RuYW1lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151611),
('fUAEQOebL02eYGykGBa0W1ALc3Sp9wU8iobGn9ql', NULL, '34.52.204.70', 'python-requests/2.32.4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNlhkMDQ2Q3RyT0M3ak83R0h2UzZpbTNzeVVwTjN3Y2xiQUJNMFlVSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755155280),
('FUfArIz4FqigzNsHluODNzuCbfEhBQXBGC4NPtAY', NULL, '130.211.53.197', 'python-requests/2.32.4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYkY5QTdweGRGVTVYWTkxeHh3NmNxTnZhVmh5V2hYcERTdEY2dFY2ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755157575),
('fUpxQYj6mcREHGni2BSDHBGXacZTfpCo7kUzEnXe', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVlRaSjNsd2ZNN1FiOGdNSFBwVE4zSjhRNU5ENTl5QnV3VXJlOXBkZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29uZmlnPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGbXlzcWwlMkZteS5jbmYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151495),
('g1tHqtDJihPo32nhD0nLuU7bTcJPRDqP7yb3UwJv', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiek9KQmRoelh6OUg0MUZUajNOdjlwTFhjcGgySDFlZG82ZGdTdVQ2TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151419),
('gAbeHYa8m2FeMEYitTCsRC6LWk2najvtr6Dy5yVr', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUptWXhBMUduVEJPZkJteHlPVVd1MWZ5cDdrTVJSeXk4VGdVNGc4NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGhlbWU9Li4lMkYuLiUyRi4uJTJGLi4lMkZ2YXIlMkZsb2clMkZuZ2lueCUyRmFjY2Vzcy5sb2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151282),
('Gc8Sgy1mkJC7MCxBq0eOA6SrpFJy49Fyx6Bgwkjd', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmxZUW9ZY3ptaDlicGo4Mk50TE9ROUprR21BRUJ3Z2NzcFhsZ1pYZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cmVhZD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RuYW1lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151266),
('gcbpJleT7LbusCgce86aUyjxxYIDKaF1wNPNGEfk', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRERiNWg5aW1tRGcwekx1U2I4VGN4eGFaaDFpTGFFOW1lRGZ3TDQ5YiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGFnZT0uLiUyRi4uJTJGLi4lMkYuLiUyRnJvb3QlMkYuYmFzaF9oaXN0b3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151421),
('Gcm0V520pavrMfwE9Yf4uWoXIJgF15kwg3tRcWCQ', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFhpcmdHYVVhUXZMTUVDa3lmUVhBU2NtSXNTRzRsUE5LTUt1RzFjeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGlyPS4uJTJGLi4lMkYuLiUyRi4uJTJGdmFyJTJGbG9nJTJGbmdpbnglMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151363),
('GCnLZ52fGngJBz68S2IO4HcvUKJb31zzpAfsYP3S', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicGV0cm50cFlPeFpHUWRuTDRhZjNYdWZadkVUakJRRnpuNDA2am1IRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151622),
('GDGf4uUaEHeFpJv0hVijuGKb0HqltAw249WkBab4', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1NGNjFmVUFYcUg2VlFSRjRNd0Y2SlREM2hGVWNMcWlTZDUwUnVFSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dmlldz0uLiUyRi4uJTJGLi4lMkYuLiUyRmhvbWUlMkZ1c2VyJTJGLnNzaCUyRmlkX3JzYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151662),
('Gdu1drmfIeFhFkQB2TldYEPvsS6a7G8kCNKz4Ad8', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEdSb2pFcHowSnBMa2xVTlgzcGhPNlNSNjNRRDZNcnl5S3lJbGl4eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jbHVkZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm5naW54JTJGbmdpbnguY29uZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151150),
('gEpCDzF1fwR8GsX1GEupzRYXecKfjCumz4QeMGIP', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWN2dGtaQ1RjdWtaSkV4NFhDZ2R3ckZ1TnkyWXlhOEpBakpJa0ZMUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y2FsbGJhY2s9Li4lMkYuLiUyRi4uJTJGLi4lMkZXSU5ET1dTJTJGd2luLmluaSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151498),
('gfaD3LOYYSRv1ffeLHzdP99Pdtp1WiEC77G5L7zF', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1BRcDhzMUZIeXdaR2kwdXVEVUhTNUVQZjY3MXVVZ3BwVG5uVVhSMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YWN0aW9uPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGaG9zdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151202),
('GIn9SpCAXfS3dZiJhaWOE5XDIZhLg5rSICt3PKYk', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEdtMlBCTVRsNnpxZ3ZqZVJWNWdteGR3QmYzdmRpakNPdnFoSEJoNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c291cmNlPS4uJTJGLi4lMkYuLiUyRi4uJTJGdmFyJTJGbG9nJTJGYXBhY2hlMiUyRmFjY2Vzcy5sb2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151352),
('GpFvNFqK75YusKTTDw3UhHPQ3xGPFvIxx4cORvwq', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1FabXJpS3B0a3NDMTBXN1U1ZktER3pVN0JvdVM2c01lS3BuS2hMZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29udGVudD0uLiUyRi4uJTJGLi4lMkYuLiUyRnJvb3QlMkYuYmFzaF9oaXN0b3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151489),
('gqXMdJzQsiZLT6cESwENyofHdbbcB5TzcQ3BX5GG', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWozeGxlNGZ2dmxpSEdzcFlsOXNGYlpBU1BzNzR6cFZtODZ0TWN0ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRndwLWNvbmZpZy5waHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151629),
('Gsw4opsTbj8ZNNkBLiHulcrrfP3AM0eujRlk2ULL', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWnkwR3V2elJWZE5zWjA1bXBuTEs1YUVhODE0QzR2dWp0TmNWcjlpayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGU9Li4lMkYuLiUyRi4uJTJGLi4lMkYuZW52Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151480),
('gx77JJWPZJfwXKm5XLZQNriTwxNhHBfgGopjgMVp', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFY4ZUZIelNjMlhKT3JBc1FGZ1B6MUNOYmxNbjhSVDZPMlZhWk9pQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGhlbWU9Li4lMkYuLiUyRi4uJTJGLi4lMkZ3cC1jb25maWcucGhwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151311),
('GxExBnoNna2SISDyKHaLzkVLx8S4b45nr2vtSBP0', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmdKS0NlRzZ3cFhQcHpPWnpsYWFxcTE0cE5yUHpuSWJ3bmhqaTExSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jbHVkZT0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZ3aW4uaW5pIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151517),
('gYHCc07fW4eg2X6PAIDys2chiise4X6yQzwOutI2', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1V2OERzc0xiQVhIV0duaVMxaVlhVlVDUFZXalNJMWl1ekJWUDBsaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bmF2aWdhdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRndwLWNvbmZpZy5waHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151235),
('H0xJMbXOqY7vOBos8EWxjkBTPWUPxZhpgmlK5CUh', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXZLQnB0TTdYd0cxbjR2MXV6TFZZbnNyZ215blp0MGJHZWhUVVkyZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c291cmNlPS4uJTJGLi4lMkYuLiUyRi4uJTJGd3AtY29uZmlnLnBocCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151187),
('H2yPNoLG3sLTnknIun2xENk2JxKkDwhu3jiuJfzI', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieEFDY3lZTURpdGUzaWJEbFZObURJam9wYUEzSmo3VWZNMkhvczlrdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Zm9sZGVyPS4uJTJGLi4lMkYuLiUyRi4uJTJGdmFyJTJGbG9nJTJGYXBhY2hlMiUyRmFjY2Vzcy5sb2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151208),
('H4l3eAKYS6dIphoVAhaAL6Hxc0gAfE5AcO7poXJM', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjFrNVB0ZUZQSGpxRXZESk5VN3BCdTI2WklyZ1VrYWI3Um5RVDdhYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGlyPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGaG9zdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151140),
('H8kwBPL451QqGHAESrrnZXM8qmR1u1IKOkKKmvl2', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieGZ1a2NMNTNweDY2SU0xcFpwS2N0d0I3d3pBUEp5RVBFcnhxNDd1byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRnByb2MlMkZzZWxmJTJGZW52aXJvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151296),
('hBJncsBPSftT5JlRR4VQEDMjAmEPHtdfapzHdc4u', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiVFA2UjB1NEkwS1RkUG56U3Z0OFc2bkVza3ZGRFU2SnM5VzdOYXNxSSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0MToiaHR0cDovLzEzOS41OS4yNTIuMTAwL2luZGV4LnBocC9kYXNoYm9hcmQiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo0MToiaHR0cDovLzEzOS41OS4yNTIuMTAwL2luZGV4LnBocC9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151636),
('HCq16gIYeDiNq2HD05c2u6AUuTRoSdk5s327wag5', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOUtlU3MyVzJUNWE0Y1NhVktwY1FmWEwxbFhBSHhtYVhCd01CWVo0cSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRm5naW54JTJGYWNjZXNzLmxvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151516),
('HCs68k5A8P4mxaovoNB9OxWv1tEd0wsXJbo4DXNk', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzVoZnhWRHk3SGNJT3lxTlFydk9UTDZpWWpnRUg1VDlOdEFjUlhnciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cmVhZD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnNoYWRvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151456);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('hecXfQyTFxOBHQ6tAHdGYfIVUukolEdjcgwX07Wf', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHZIZkNFQWZCWUd2TDlETUxDYVBmNzBsajlSTzZBQU4zS2lKejVhcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YWN0aW9uPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGcGhwLmluaSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151614);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('HFeTTcSPSLsMRVXjdNvGA2CsOzCp97ATC3VT6FkY', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXdNV2JwWnh0UUdkYmJhWnhmSGpWNnhDNEt6R2xiclV5eGp2ekdORyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c2VjdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151442);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('hfJPetZm7mpdlxbP9h6pCfXIB5Wk2dufzAaTUCdP', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidU5yaEtyNjM1dng2MnBic0N6V1VxZDdPTVZGd0lvcmkwejNLclhYZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGhlbWU9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZzaGFkb3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151653),
('hHDtR2l3xYKrDuNM6DPcKH41JD9t0TrIxLSuyOwC', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUUlJWjVRRHl6Uk9TVTEyNDFhTDQxSW9xMGFmNmY0SGtKbEFJR2xGMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jdW1lbnQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZob3N0bmFtZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151396),
('HhWrnUUKXXOeRBPClyq9AFz84mnrDBvR6D4VVRmI', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFJlM2swQm14cHZhV0RCZFJnRFYwUklVeTlncXRGaEYzU1dBYzFWUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGlyPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGbmdpbnglMkZuZ2lueC5jb25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151264),
('hjcLD3apGsSj8ZoXLshMmQZo5Qkz8xn6KaBMWrGb', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicjFPeXBaRzNkMDVpSWIybzd2b2FiaFBkT3pIR3NWem1TSFphbkdVSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c2VjdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRmFwYWNoZTIlMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151264),
('hL7Bp9sGDS2txIINdhHcftbD8JVSzMOyLBKTNhCD', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWRybjN6WXV1Ukk5Z3NPT3FUZFUwZXo3cEJQaDN0T1JsNmRzODVtYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YXNzZXQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZyb290JTJGLmJhc2hfaGlzdG9yeSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151102),
('hntaxUuyJUaG4Hnr6TrjCPAWen3PGCeMDJyuQThF', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUVlHT3QySFNYYTlZREF4ckNKbTljbDQ4THptdWhleGViaGtpS1NmQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBocC5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151620),
('hO0okYmy9B6DFBmLA5uhjYcnUDXWpzQLucMoFJbR', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWlKblJYTFBxY2l4eGYySGdUTnFoc2J6ZjE5YzVybUYyZXJ6MDZsUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YWN0aW9uPS4uJTJGLi4lMkYuLiUyRi4uJTJGV0lORE9XUyUyRndpbi5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151350),
('hpPeF2g6dHu9WqSDZqaiUy2OPVmyKdM5O0NpAdhE', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTdyVmVyU2ZleTBWekR3azdOeUFwUTVYRXZlSHJteDBRaWdkRHdtZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bG9hZD0uLiUyRi4uJTJGLi4lMkYuLiUyRndwLWNvbmZpZy5waHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151285),
('HR4V22WFMtHSsuNgpCLPrvOHb7y7TYkjEGEPYFw1', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibml2YTR6M3dKUUZ4S2k5TzdVeHBJT1pLbnFzbHBnWmhHTXFuQWFrRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cmVhZD0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRm5naW54JTJGYWNjZXNzLmxvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151662),
('hSuuC7nrri7VLXUU7Q9ontrApbVNz3wnFNMwxN92', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUW9nbEVrTUI2TFdKdTBNWjRaMWppTHBuV3Vhc2NDa25RTndqcFdnZSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozMToiaHR0cDovLzEzOS41OS4yNTIuMTAwL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwOi8vMTM5LjU5LjI1Mi4xMDAvZGFzaGJvYXJkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151493),
('Hu9qEINbvqziqLGsa0gE9dTlH2Ry9pzrwAPEztbk', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkR4bWtjVm5aZDRRVW9UNWJDWTRwNnFSbE9vVjNtdlNnUU1MajNNdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RuYW1lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151333),
('Hwbj4XpF2sde5D6xHv3xyFp7lxiPjXII7Qq16fdV', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOG1pQXNsdTZHVjAzUmg1TFdYYmY4bXRjUEVhVUtlU0hVWmlIMHJNZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c2VjdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZzeXN0ZW0zMiUyRmNvbmZpZyUyRlNBTSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151108),
('I67GkMtFgVXi4xx2R5p8o1tgCMXcb5OlqiWmLxXy', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDZMcjk1QUl2RnJ2YWp6Z1A3WnBla0xmemhlYVdmNHdYakFLYUh0ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YXNzZXQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZXSU5ET1dTJTJGc3lzdGVtMzIlMkZjb25maWclMkZTQU0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151383),
('i67KQ2T5fY1mp2NWxj54XeqraAhKL9F469yWAiqN', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmJLdzViRjl5dXJMMXlpclJHMk5lQ2pPRW5wS2N0VU4zUHYySnZDQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29uZmlnPS4uJTJGLi4lMkYuLiUyRi4uJTJGV0lORE9XUyUyRnN5c3RlbTMyJTJGY29uZmlnJTJGU0FNIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151332),
('i7H12OI66JTiGHCVu6QqkRVNg5nNFAPtP4uOame2', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEQzZjNDVWRtUTlOa3NlWUlRd0h5alI1cGlKQ1JTRTNXaXVETEhoaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cmVhZD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151213),
('IAUkT3c7eYSxFbsct7SSyLtFAc4QnVuiGhP82gMd', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnJ0c29vSG9FQnk3c05lZzRQUmtOdHRHU29oc3hMMWlzNnlkNDlsMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jdW1lbnQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZ2YXIlMkZsb2clMkZhcGFjaGUyJTJGYWNjZXNzLmxvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151519),
('IEGP0nYhCSwkq8SSExBtcaf4rjKt00onY44EtKIp', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3F0YjBpM1Bta1BQVEVPU0R1Uk5OVGJaSGlWckRKWDV4OWZWc2hDTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGVzdD1odHRwJTNBJTJGJTJGbG9jYWxob3N0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151619),
('IiNpnCZxFCMiTqz8wAze4qPukt3e37ANz0g9GGeu', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGFyaUN4QWNnVzV6YmQ4dWRHWkhOUWp1RkNMcElXYWxIOWZMY3hyRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGhlbWU9Li4lMkYuLiUyRi4uJTJGLi4lMkZ2YXIlMkZsb2clMkZhcGFjaGUyJTJGYWNjZXNzLmxvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151132),
('imI8NLguGe2kG5DpErXmj8L6Tzpp112maLHnB2NR', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicExjcWdsdTBvWGZ5b3BFMnd5OEZyVG1panVadWtqR1BDMlYzRUZPNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cmVkaXJlY3Q9aHR0cCUzQSUyRiUyRjE2OS4yNTQuMTY5LjI1NCUyRiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151410),
('INSxjks7E3CnBqR0BMqxUJna2OcNOdrhWaXRaUAC', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkZ5azhzR3VFT0JFdXQ2dDRwcHJZbTVERU5RTXQ2dlgzRmt2Vk1BTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c2VjdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBocC5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151540),
('ItkQm7tTKAp5RS5FUE6X8zcEdPPZWpGIJH8XrUFN', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1JWTkRDcU9ZQ3JsSU1CS3BzUm00dVVTb1VqM3ozSHNzeFNkRzA0bCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jbHVkZT0uLiUyRi4uJTJGLi4lMkYuLiUyRnByb2MlMkZzZWxmJTJGZW52aXJvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151549),
('izXwCdU0wPiw8Zikwsn3gYvnEMvR3INPvnh07n7x', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGdFcHVmUHZoY2pIeVJaT1I5eEVTNE5DWU9HUTZ5dE1wdjg3eVU2YiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGc2hhZG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151641),
('j292qutIanlV8Ucnak31luql9Zm8fW99h1FDWlyh', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVV3NnZBOFdxMWNTUGlReHlMeWU2Q2c1cEFNeDlSQmV5M25kaEtaayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jPS4uJTJGLi4lMkYuLiUyRi4uJTJGd3AtY29uZmlnLnBocCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151361),
('J2iHxFkN9PJzbYPfWLxqaWgCdpxToiLUATzDJrIx', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlY5dlZobUpFeDJudnR4bW9qcjhRZkdYWUZpaVhXb09ENmt6TEh2byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGhlbWU9Li4lMkYuLiUyRi4uJTJGLi4lMkZXSU5ET1dTJTJGc3lzdGVtMzIlMkZjb25maWclMkZTQU0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151381),
('j3bo2RfQiwfGbBE4ox0n5JnnzFeWDYZgeKamIUD2', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTNDcjQwclNES1JkTWI4NGxjcXpkeFh1QWVBZDcxc0tQRVBFZDJkZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jdW1lbnQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZ3cC1jb25maWcucGhwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151512),
('J5lYiTLSmukUqtbMXMrveuTSw1mY5P0HrkVqxDKz', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYVFoclRoN0Mzb0YyUUFOY2lBc0Y2S1Q4bXIwYjJlbTRad1NtT0FGUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cmVhZD0uLiUyRi4uJTJGLi4lMkYuLiUyRi5lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151448),
('j7WaxTOTMcsjUo2hIwdQd2Wk9uZFXasdVVtzCBpq', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidkh5dFA0cENoYmp0dllCVFl6UEZXNWVBN1dxYTZhc2F3V3dmTXZzMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRm5naW54JTJGYWNjZXNzLmxvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151613),
('J9hG6a4Ka0R5VyfN6ncODJvkFiry3JafNudNjVhs', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmJjenU3VjhBdHlzaU1ONUZGUFdreHcyVVdvNlFqbEJNZEx0Zks4ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jPS4uJTJGLi4lMkYuLiUyRi4uJTJGdmFyJTJGbG9nJTJGbmdpbnglMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151329),
('j9ubV6JbZIg9chQSe7SpFac4PNLlusvfd6H8q0Yr', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjBkZ3hEbWYxUlBXUm5Wd2ZlV1kzRUVBdTlya2lobDRVWVIwTTVvUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGlyPS4uJTJGLi4lMkYuLiUyRi4uJTJGd3AtY29uZmlnLnBocCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151451),
('JcQEeDu957gAztqQPrCGzATuL2GDmb0GgzNLibSq', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEFPb3BJTWFrWFNLR2pxRGNnUmhPU2h4UWdMMXZFWnRKSE9UbUVsTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OTc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGFnZT1waHAlM0ElMkYlMkZmaWx0ZXIlMkZjb252ZXJ0LmJhc2U2NC1lbmNvZGUlMkZyZXNvdXJjZSUzRHdwLWNvbmZpZy5waHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151376),
('jiBmahll3YUrsaRUqX5EI9KtvtdpMrsQXBOOtH80', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUdNQkZ0OWkzdklENHo0YnVvaUtGRFl2UDhwbXZtbVo1WnV5Z25SYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGFnZT0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZzeXN0ZW0zMiUyRmNvbmZpZyUyRlNBTSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151464);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('JNdKtZReW1KesvLyTtLW3sD4pXwFerKL1scGbiBn', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidTk5ZlF4QllxUGhPOXkwOFdwb001MmIwVXgwUXhMUmpvV1BKbFBDSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bmF2aWdhdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBocC5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151615);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('jrbEbB8ySPr2FjMVGXtER1bFx42yY9Z3RySPiO13', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEJRRURkZGMxVkVMODgzRTQyWmRaZ3QyUU5BejhOWUZPWjRwb2JMaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm5naW54JTJGbmdpbnguY29uZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151526);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('JTCHCOhydlyjelttUlUAsCKDqswg5FavnYiG0BvQ', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWp5WUpieGRoR3BnVmV4YXg1UFFnU0Y0OXYwSzFTNXdnWDVoRnFoVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGF0YT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm5naW54JTJGbmdpbnguY29uZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151577),
('JTsR8iD5nZ2PjaHxyVhfh3lAdQ8LHPWqDkjGHxOx', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHVORlN6dnRQZ21yZk1RdWRBZk1lZ0ZzbHBPV3Q0VjdZektUVEptRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jbHVkZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmhvbWUlMkZ1c2VyJTJGLnNzaCUyRmlkX3JzYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151365),
('JTXp7F08mpczIxpZ2SXOk8YvlGgqgSFkBgI0RQG4', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiazMzc1JmOXZzWW5pdEVrV0UyVEVoaEt0WDc5SkNMNjV0aG5LSUt3cyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Zm9yd2FyZD1odHRwJTNBJTJGJTJGIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151597),
('jvEjqefyXU4519MlhisRgK6FnodXg9pIKWrS6jAJ', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFhaM25IVnlEUmJXQkQ0UHNZbzd4UGprRTVpR2E2d0xNU3pNeEpsbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGhlbWU9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZteXNxbCUyRm15LmNuZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151248),
('jvpvdZyJa2dwLKWDIzGKpSkcBCpTUpRBZagDUJQh', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemhQeDh3aGNUYk1VS0RvUkpLa0dlb1E4ZXJKdEhsR0pzcDFwVXhYbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jdW1lbnQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZwaHAuaW5pIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151540),
('K3hc7yOGJfmWiScdNbemd9pZM6g28WweFA4SCKBQ', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYU5saUxmZURNbFhWVFhkT2N2TWR5UTZmUEMwWjZnalcyd3FmZmJMMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bmF2aWdhdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRmFwYWNoZTIlMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151337),
('K5EvtbmXe3obBvmxIN8hjugUAANK7Drm5AmcxS0G', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaXpxNDUwY3RTUjk0TmtjOHZmZU9xM0lySmRBOVRkUmdSWlpxSGJsZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGlyPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGbXlzcWwlMkZteS5jbmYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151211),
('K98sdCt7YXyUMryIhdEh4WQMVUHbhEEdN9u4BYI6', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVjJibng5ekhqOVhIVGpkMWFQVDVUYnowdUVaZ29Qb1lpVjFtTHllayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGF0YT0uLiUyRi4uJTJGLi4lMkYuLiUyRndwLWNvbmZpZy5waHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151286),
('KaSF4J63eYeKNahAICrgyqlp1Y97QMrp0E7fFijS', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVmJmUU52aHFPeVEyRG5pNXY4anp4V3FYM0VZR3hGTWVoVWJ2WnUwcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGlyPS4uJTJGLi4lMkYuLiUyRi4uJTJGV0lORE9XUyUyRndpbi5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151310),
('keCp6zBmYbP61jWpVHReGwcm1ifoktwDmNCDwRKG', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieXoxd3hZWk5rUkthVVRyNzNLdEFUYkRBRDZDd1RyTGJPcHQ5YXRtcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jbHVkZT0uLiUyRi4uJTJGLi4lMkYuLiUyRnJvb3QlMkYuYmFzaF9oaXN0b3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151244),
('kf3WouWC5MLu5G7CVvRy3HeXtBO3jPi7w30k9MJO', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSGdzS1B2Vll4MURTYmlKSnFEUlNzbUlwZE9aN2t2VTFHd2EzUXNIeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c2VjdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRi5lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151647),
('KgutJOXlOiwmhEht7sr7ppLgjLWEh5qpAegGtJgi', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaUpFdkF3ZE5QZHUwRlhzUXZjaHhJWXpsTVl1YlBFWWRRd2JrRDd0VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jPS4uJTJGLi4lMkYuLiUyRi4uJTJGV0lORE9XUyUyRndpbi5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151413),
('KJDSk86E2JLD3gC36HRqUNZJPRjCwgmMBtVaNgRx', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEJTMDlQOXB4NFphcHg0NzhtMGVvejA2dHBuUUhUQmlQT0t5RkR2UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGU9Li4lMkYuLiUyRi4uJTJGLi4lMkZob21lJTJGdXNlciUyRi5zc2glMkZpZF9yc2EiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151162),
('kmzEyqazceI7pK4yYWp5CGRHM44Dp7gt2gdvk4x7', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmVFenBCUXBWUGltSG51TTdQdktlSTRZZnEyWGdieEp5c1FTSEI4ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YXNzZXQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZ2YXIlMkZsb2clMkZuZ2lueCUyRmFjY2Vzcy5sb2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151268),
('KoLhN247NEUdjJ89iCyFfX4XyqNvhFBjSutxXemr', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTXBNRFNFb0NXU3U3Z1RYZWlzVk1GcEdmdDR0b3A4dDNsWGh2Y0dPTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9sb2dpbj9wcD1lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151781),
('KPU1BCW2uCNXY5LOzGieckDuhcCm7t4z6HfNA03L', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjNUM2JRTDE5bUpGcjZNYnpsN3ZjdEQ4STBlSnNiVWFrUEJteWRIZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Zm9sZGVyPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGaG9zdG5hbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151513),
('KQlAAOWBKgKoIC9f4TZPYtHDfpEtY6qNEK3WGUnZ', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmZZbHZLeHJHYjJWU09MbHFKOVlsYjIwNHB0NzdsSXg3UDE3cEJOeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bmF2aWdhdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRi5lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151430),
('kseDvnok9iTrnYBYsPyZg5obC9Rw65r0nlPe0voo', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3c4V3htZnVPeWxSSkZJZUY5dDJVUFVPRGVLTVhKeDc1YnlFQnRkdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Zm9sZGVyPS4uJTJGLi4lMkYuLiUyRi4uJTJGcHJvYyUyRnNlbGYlMkZlbnZpcm9uIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151453),
('ku23bjHi5Yyc9B7GFq2qsTIep5Uq4CtsB5zr3LJy', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQWJtUWJXS0UyUFRhUkVCa212RUlsa21jRlVOMkhFdEprRFdRa1ZnOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YWN0aW9uPS4uJTJGLi4lMkYuLiUyRi4uJTJGaG9tZSUyRnVzZXIlMkYuc3NoJTJGaWRfcnNhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151418),
('KX8luRmE3xnEgwvFEdfJB9eFSCAJi3KRrXN5aj58', NULL, '91.224.92.17', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2xSaFh1QXhpNDlGVEVHZ043dWxEQWJac091VzU1dTVTMTNsdFFCNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755150569),
('l8R4ft3TXVfK6qsz4ivEt1cdXztgBbxs1S48vP9r', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib3hIWURkQ2haWEM2Umw0Q1pDbUpkS3lwMUhXRFdrMTNVYUxSaVRCVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9sb2dpbj9wcD1lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151105),
('lBJB7fzKn6Kq01DbPZbpRwfJgTq211DoGKfDRQRt', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2RQMnhYNFcweXhBbUxNRVQ1a1ZCTGR2NXRpcUdTNkxzd3lOS1d2TyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGF5b3V0PS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGcGFzc3dkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151404),
('Lfe7Ph3K3TyOzxgm3Pvc6LtMHNO0CWQQzMukLPvO', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia01ocEMyOGVjcWlqcENlbmhvdGFYSUxRMHhRSEJsSnBtQW16Y3ZOVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dXJsPWh0dHAlM0ElMkYlMkYxMjcuMC4wLjEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151232),
('lkxJz5ofzJZkGXxivHQsqbktDWPwE5VKWjqPwszg', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidnR4UDVieVl5TVh4MnM4MVI1ejY5eDJ5dzVZbnBkdExrVlBkQlRiSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y2FsbGJhY2s9aHR0cCUzQSUyRiUyRiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151440),
('lN6BHwqVS3WS2OPF2WYv4pP1a31L7fOJgopPKrhl', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVJBTE1rOTJtWm9qU3BZbnV4U01PN3NTb3daRTFZYVA1TzVOTTMzMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YXNzZXQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZob3N0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151316),
('lnERuqpzrdx9FIbrCXq2rhRsNEpLdXWsOcdhkJHx', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREIwQjZ6SVcwb3hsa2VNd3d4MTcwWkZlbnJnRjA3aXQzMWJaSzdnWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jPS4uJTJGLi4lMkYuLiUyRi4uJTJGd3AtY29uZmlnLnBocCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151213),
('LryhhqwonGfN0oFOJW220n4mvwVQdSngcM9SBxSA', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidmhHc1RHRmpSaU5kdms2ZTZDdmZiczdBeEI3U1NqSkdzWHNRVjJkSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YXNzZXQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZob3N0bmFtZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151246),
('LtzvqmT19emRFuWwjRB2WuEI6SRXQ54pvZOeO6L1', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU21KR244Zk1OaHpOOEdCZTBoenE0TUNaRTRZbWFaMFFvelduS3N4ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Zm9sZGVyPS4uJTJGLi4lMkYuLiUyRi4uJTJGcm9vdCUyRi5iYXNoX2hpc3RvcnkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151445),
('lu091Dnoz9lG6B99j2wmTUIAE4fPTAPrw8XYGdd8', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXhKT05INVV1UUNyRmVsd3J6VTEyRnlDTDFVNWdwaEVSRUQ2WXdheSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bmF2aWdhdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnNoYWRvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151641),
('Lv3dCNSeb3eWAHnAtQyJHNZIBfveCITlLNfuBHlm', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVBZaWN6VW9wMDYyU1EwN2dTYWF1WkNEVlZQQXpVbXVWUjhLMGw4MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGU9Li4lMkYuLiUyRi4uJTJGLi4lMkZ3cC1jb25maWcucGhwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151455),
('lVFfAAGWRWzSna5gnkLsGV8AbNqzyFK8kDMcVUYX', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMVZFU3p4U2M2QnNIQzY0M3hhRXg4Z0tzWERqY0UxNnhnWFMyVzVUMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGF0aD0uLiUyRi4uJTJGLi4lMkYuLiUyRi4uJTJGLi4lMkZib290LmluaSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151423),
('LwrDmdpNZJmhxyvBxUa6RQZJhUYzIP46r7aiUgZ3', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicUNFTFJ1WnZyYkE3aWRiaVNHTFFjd2pjSzJLNjN1NW15a1ZzYm9oUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bG9hZD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm5naW54JTJGbmdpbnguY29uZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151321);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('LX6URiNXavoBMfdKTsdGFNoaGg9SU5vBjXBQnM8W', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidEhTOW53ZzZDTmRrVk1Td3VTMnREZFk5VmVOZVgwOXhXTTlhb2NtbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGF0YT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnNoYWRvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151650);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('lYCQ1jM1Lx1Hehf10IIl26kcF3fVvkYYjK8Niuui', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ2pOMEsyNXNsZER5cnFXcFE0bnY3c2dmVmdoUWtBSEc4Z1cyZ2dWUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y3NwX3JlcG9ydF91cmk9aHR0cCUzQSUyRiUyRmV2aWwuY29tIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151134);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('LYEG5lR2WsaG6QvZMdDYt1J4hQeZKg5Ttmgs15KG', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmdpRnplSUZUQkh1Q295cXZNZ2daWTJhNW9zendMbHhCMW8ya0x0aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGFnZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBhc3N3ZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151666),
('m1SW5gCJB3JUsSGlTsjorwHawcYqgfNAW7EjTxYx', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia3RZM09hWVFIdjhBbkthdkJraGZVVmdMTmZYNTFhcVFReVY0bkVUaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9pbmRleC5waHAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151632),
('m8et851sPMs2ziUSS12KNnIC2vFTsfRHB0naCoeg', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGhXZHFnUmRSRHhVNWgzam93ODZHYXY1N2V6bGJjdGpQQ0huUzBZMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dmlldz0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBhc3N3ZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151170),
('m9vrKvcdFeJyE5W9fJQFaw1bhMWe6J3YIMQPoKu9', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMmpRRzdVRkdERVhzWHNtcHNNZVlTV2JqbEx4eHBoMWZjZXYxUk43dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGF5b3V0PS4uJTJGLi4lMkYuLiUyRi4uJTJGcm9vdCUyRi5iYXNoX2hpc3RvcnkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151523),
('meIjWXt5o4F81cBFf2bDDpOjO3D0zSq8ChoXCkgX', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidTlIUEhpR2w2QzhNek5tZTJvdUtCWUdNRExxZjJTdTlhQU8zcXVLZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jbHVkZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151229),
('mgkI1Rz5P6uFI5RQlOuDZLPyz1cj5fTqaNegtjda', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidktwZXdnY3NXd0RiZ3pZQXc4UjR5VHpDZjEzaTMwaE9VVHBiU1N1MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGlyPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGcGhwLmluaSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151453),
('mGYcgJlMteIX5jBM4AdCyoMgwIanrSz6afnfaP23', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWozcHR1aGFWM2lDaWp3N2xvM1JOOFYyamt1b3lTd3lvTE83WXFvciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dmlldz0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RuYW1lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151591),
('mho2yEdF9W9RjAS0FwJobRaPLuOz86ySDmJSeFNk', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRW5qdlRIWEJ4QWZLVURXUFJvREQ2MmRKT2k2T2xSSUZQZVB4Qm1OViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9sb2dpbj9mb3J3YXJkVG9rZW49Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151338),
('MmCghIXnYF6Smpw96LBYANrPM1jwTBV19qFKsIWh', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDJZYW13cGJ0VVRxMzJpbnRwYnB2ejZCZVZkYURQaVFPbXk5YVVBQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jPS4uJTJGLi4lMkYuLiUyRi4uJTJGdmFyJTJGbG9nJTJGYXBhY2hlMiUyRmFjY2Vzcy5sb2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151619),
('MNgG6o0VcyEWuBxhhfY9rONBnS04YK4ZI6NNOCYM', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTU10SHI2ODFmbFJRWmw2aWQzUlQyaDV5dFdPVG5INUx4d1J5N2lBcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGU9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZzaGFkb3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151330),
('MnY57oRnqnvVTDjKqlb0zWFikuhXM6s3rZvhniqk', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS09mMDhUNjhmVDgzQ1NHWkVvRU1pSUFpU3oxazR4aGtmMXlLRjlHQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bW9kdWxlPS4uJTJGLi4lMkYuLiUyRi4uJTJGd3AtY29uZmlnLnBocCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151667),
('mnz0ytLrloRb80lkEpfpkiBMhoenYOty749s7cuV', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzhWZ203cGM1a2lhdVBiMXI0OXR6NG0zNzg3SXB0U1JvOGhieHFxViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y2FsbGJhY2s9Li4lMkYuLiUyRi4uJTJGLi4lMkZ3cC1jb25maWcucGhwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151283),
('moqOPps6ww8ADmByDVT6pqjfox4yy7sz6vKj1KBj', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1A5OVRkaUxiVVQ2ZVlacDd0cXVCdjZaa3F0d1FJc2t0Yng3RjZrbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29udGVudD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RuYW1lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151608),
('MQKpU6oETlZfaUPrXAdQ5phNWMzfXqWkkCpO1DZE', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYnNKUjZnVWdaT3hWN3NxbzR3MVlRUWw5dUZLQ09oVzMyNnhyWG5pMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c2VjdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm5naW54JTJGbmdpbnguY29uZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151182),
('msdntu5OpxdkY7VMxfJqMt7wdFdQedWE0teDDWGm', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1MzMjJJZ1ZMY2JiTVNEVzBZQWNhcWpFWnZJTWFheGlsRXpPYk9LbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGF0YT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151160),
('mXG0Xqd6OdPEScUIludmIzRslyePG8klZQJfw26K', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWFYbEgxN2RieHdiYU5DaXZlZ0hkWkJtMkYyNzZheElGbHl3V1pEaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGFnZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm5naW54JTJGbmdpbnguY29uZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151475),
('MxtSevGRtuue6vYt5722xMt5Wh2Injz9bKWsoPAZ', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1VzZGJJeHVDT3FmZzl6Qkp0RXNxUDNxYkNXMkVkUEtuYkxkazd1aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dmlldz0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm5naW54JTJGbmdpbnguY29uZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151214),
('MzfWGph8bbz7P5Bt16mK7UyXGatT99NL9iDLGPhM', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEhFaFg2OE1EMkJZWExFamJaMDg4Mk1FeDdJVm5qSnhpN0Y5OUljOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YXNzZXQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZ2YXIlMkZsb2clMkZhcGFjaGUyJTJGYWNjZXNzLmxvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151603),
('n3K1rYCQwyULUQSZ6P2rL9nerFlCMcIBtcdGtSGD', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlBIOHZQd3RGYVJ0bEFVSWZ0VVdoZVhOY3JJSVdiVXBwam1OZ1ZySCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGU9Li4lMkYuLiUyRi4uJTJGLi4lMkZXSU5ET1dTJTJGd2luLmluaSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151273),
('N45m1UdAjulbIulUtG9MzBMGRXA6kKDWWYwws3fP', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3NLWG1UUXNoQ0F5cHFLdHFsYmhwWjdTNXlrVW43Zk1GcExMSkRXayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29udGVudD0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZzeXN0ZW0zMiUyRmNvbmZpZyUyRlNBTSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151602),
('N5FAGwUxukAKkIjGLbcumcs2RiDhfbISSm8jKDYv', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFl3THFHUm5LaEQyT29taTJUczZIS2NtMmxuOGptakU0eGFSQkdPbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGhlbWU9Li4lMkYuLiUyRi4uJTJGLi4lMkZwcm9jJTJGc2VsZiUyRmVudmlyb24iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151243),
('NFxtXPykZpbU2XtwGPqq3r0UHLPYkPuhxbMuAoda', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDMzUXJvQzFaeVlxTHJ6VXVYcmlDanlUM2RSdFhHMVdVY2UyRnVZdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YWN0aW9uPS4uJTJGLi4lMkYuLiUyRi4uJTJGd3AtY29uZmlnLnBocCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151507),
('niHEoOEYeXKvt3JdNH3EKYPAtrq9ZFBTRRnHjvdA', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVFGVkthdHNOc0dNVTJ4SmdrbWVRYzh0SGp1V2lJcElVcm12OFpkaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cmVhZD0uLiUyRi4uJTJGLi4lMkYuLiUyRnJvb3QlMkYuYmFzaF9oaXN0b3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151580),
('NkeoPpiXHVqlRWnbIzjl98hdMSWLqD8ixc1aisxZ', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYzk2Z0UzblBlckU4RXNETHpjWGlLRlU1Z0FpZDcwbGJBMjVtTml2USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGF0aD0uLiUyRi4uJTJGLi4lMkYuLiUyRndwLWNvbmZpZy5waHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151131),
('nPNqmN76gVzHHQlR60hxJj5N7tFXK62krRb7y28x', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibDViWXFQMzRxWDdTaWU1azdGeWcwY2hUUmdMSGdRS2loU0hxcWpYUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGaG9zdG5hbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151444),
('o1KhncnOmVnchuC1tdYy7HDN3qT0dFvUhZ65UQYJ', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkV4YVFuUVhveEo5WWZPeldpamQ0ZFE1NnhBOWIyOUNrMUpQTjhGayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGVfZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBhc3N3ZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151226),
('O5CQS95xu8OZfTxydzYzKluerNG23tKVrkpXxYgH', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiekVRNGdUUW1BR2E4Y3VuSkpCZEh6OU5QcTVGMkZ6MHd5eG83eGtQdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGcGFzc3dkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151475),
('O6cltlbwIPPHuN4YG2nn96kOc9y1axMHgTyLmKyQ', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV3BsSU5XcXdQNDdEaVozZWVxeDZVOWVWR2UyVFl6WFJ2dXZQbzJaSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c2VjdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RuYW1lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151175),
('o80i1832etjcDusaD6k9n4dlQRlE8I4xVlKkvxgL', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0k3UEZucnpsZ0QzWGJFdDhXb3hqMGdkekFoSDM5SXFqYzJNM0RhMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c291cmNlPWh0dHAlM0ElMkYlMkYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151192),
('OCvVkpBoyymDcfW25Ylb6T2teI2PzINqRJLG29ho', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT29JY3pCYUFxN0ZNd1cwOVE0aDZOeGc1d3B5SnVYSzV6bUs1Zmc0eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y2FsbGJhY2s9Li4lMkYuLiUyRi4uJTJGLi4lMkZwcm9jJTJGc2VsZiUyRmVudmlyb24iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151323),
('OElIwCoLtiRQF3QTz52ikHVSpITM2Xm4AOrVYNPR', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiREtrWDJpVGt1a0prVlByams3S0l4MkU5cnhvR3JkeTFzMWhoTW8wUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151493),
('oH3NGheVVHaUU5y31Vg4P5ZQxYICAihbFZgshsuV', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTJGYWNqdjRyQzZFcm9DcWhJeHVpQzlQWXFaMkk4aDB4RHF3QkxoMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bW9kdWxlPS4uJTJGLi4lMkYuLiUyRi4uJTJGcm9vdCUyRi5iYXNoX2hpc3RvcnkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151305);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('oH6f3UFQjFbCQFsKJnZMO6vOrkTbIE18mbLrGCDK', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUnVYdWFudWk2cmZ0UDhIdWNQb0dyVXl2STFYa0YwMEVjR2YwbWNrRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRmhvbWUlMkZ1c2VyJTJGLnNzaCUyRmlkX3JzYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151427),
('OMfHP3t8DEcXaIVB0GKPJ1iYNbfL1QMYDkFHMQwD', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTFrTVRienpHVEdLYXY3R1p3NzQ3SFhsR2c4ajl4TnJ6SGJ4Z1NsMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dmlldz0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnNoYWRvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151587),
('oWF9raaQfqtwCe3xCU8wyagmz9h5PD7PH55iNJ9i', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2hBWjg5NWs4YzYzSnZ5UGZxMzNoY3o0UHlzMllSc3FGOXduYTVoMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dmlldz0uLiUyRi4uJTJGLi4lMkYuLiUyRndwLWNvbmZpZy5waHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151110),
('oXx2OH0edrVv7q9Q9jy5iFJ0oUJzBF22yKqoraCM', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkFKZHRWd1FuOG9QQmluNEpZb0x6WEE0UEdyeU53aGVIU05MbW14dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cmVhZD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBhc3N3ZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151120),
('p0V2kvb4Xot17xB2bFF27Ok7JoHFlvEWwcmSDJYG', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib2hwVHJUcTFkZDlEN1NhdXk0V01vdWJwc0dTQ2w4TmQ3Z095UTZYcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bW9kdWxlPS4uJTJGLi4lMkYuLiUyRi4uJTJGdmFyJTJGbG9nJTJGbmdpbnglMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151114),
('p1ygxF1vsbzx5EPNguwmqe55tfGNYDSQJbhREd1Z', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicExDdzhFWWFSTEI0Q3BVQ3RMV2xQYkx5NVFOYkZLc0h3NEdnb1pUViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm15c3FsJTJGbXkuY25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151109),
('p8kpjOeZdYGfmU3T99y5SlpkRJ0AvM6uXx8h5BSi', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkI1NU1iaEhZcjdyVWU1dzhONUNFdTV6OU5jNmRkeEdwZmREdklvSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGFnZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151395),
('pBDFquhW0pVM1co9d3yi1wiUt9W3lwyHuWp8MceV', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicnFROGIwUDMwM2NkSWFKU3NSeXJBY3FYcGFQTzZzaGl4eFJuMmtYMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jbHVkZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBocC5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151259),
('pEHjFvJYtZxunWyGyRNSDgr2CEiX2LszUzn3FPce', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiemNpU3B1RDVSVFJESXpqaUFaNjF6dkkzaVVobXR0Q2pMRjNMd0I5eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c291cmNlPS4uJTJGLi4lMkYuLiUyRi4uJTJGLmVudiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151175),
('pGDh6vEKxr4K9szMFJR9xhHhjsg5pDHdHT9E8pNA', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmswWUhCUEhDV2lqTnNMUHVsUlpXZ3ZWRXFGbmJJRk9Ucmd2VUJoZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bG9hZD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RuYW1lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151366),
('pHWS42rjtNsuzhO1bo8uj6l5KW0p6bkMb83cTUny', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZU9FaDl3RlcwQ3BjTnQ2RGlTODU0VkVLSkxLb2ZJa0drUTBKc0FzcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGhlbWU9Li4lMkYuLiUyRi4uJTJGLi4lMkZob21lJTJGdXNlciUyRi5zc2glMkZpZF9yc2EiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151268),
('piGGNK3ycOviV5N3dWpNdLi9s3QCqQ4tdiRYubIX', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUVHYklzS3ZEUmZKU3JSUjFVSERSblg2U1V5Qlg2emJhUVhvb1lFeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Zm9sZGVyPS4uJTJGLi4lMkYuLiUyRi4uJTJGd3AtY29uZmlnLnBocCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151363),
('PITaAJxuZFWSNrm5uu7Dlv5fbq32LvvEcIfBay1s', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYlBUV3d1Y2gxaTlWOFFsOXlmU2JtMGNGckhzV2s0bldzdElicHRhaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGF0YT0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRm5naW54JTJGYWNjZXNzLmxvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151611),
('pjJzZhWB8K810gBNC01aSXrZwewKqDci9vaH4P1k', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXR3QmoyVkxSZUJmMzF4Y1hHOFlZWFRNcHZaeEZGY1NIMWtzQjVBQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c2VjdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnNoYWRvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151659),
('pLosj9IYPUKKoCM00UndX4aJuSzDnQH0a47zUaZX', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3h4dFIyZGxzU0w3SHplOHU3cXFuVEVwVE5QWFJHa2ZXME5BSkVsbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bG9hZD0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZzeXN0ZW0zMiUyRmNvbmZpZyUyRlNBTSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151499),
('pN1ZQIThaN8hYfBHLrmv0BOr8q7Eg8fMEd4nPZup', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkJVcU5VYkoyZ01mQ1JKU2Qzb3lPWmFBQnZOblkxZjFNN2VtRlJiaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jPS4uJTJGLi4lMkYuLiUyRi4uJTJGcHJvYyUyRnNlbGYlMkZlbnZpcm9uIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151551),
('PPfbj26deIY6A5xqpXBxvZ09XZcmSiZswbZ28uOr', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlhaRGhkaXlZZ29heDM0bGhkc0E5T3NNSHJSd2dQdWtGMHp1TjZ3aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGlyPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGcGFzc3dkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151310),
('pts24Rn1bLhPckVi4WU1ogdoCDHZaTwr3VkZtgTx', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUWdMamppNmlQYVhhdUVNcERTQVRaY0ZIZmJncDdYbWpLcm1nQmtVVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGVfZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZ3aW4uaW5pIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151672),
('pUR7cLfe1OTyZEKVWUpB9PiXVzrqDWT90a8YUe2C', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicHhYUnV6TXFNNEJOcTlkNkdpeWF5Y2pxZlhPcVI4YUFjbTJzSzRFeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bW9kdWxlPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGbXlzcWwlMkZteS5jbmYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151520),
('pyou8ybPKXKwJryKFNIcTWBtXjAfLPHFFaDBl1vR', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1h6UG1pM014ODVnQ1cyWFNwbXpQN3BGU3R4SHNRSzJTaTU2NFFRaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cmVhZD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBocC5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151561),
('q44FzddIVpOFjaK0rhu8a283dbBkdlqYY5fHrGUz', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidlo4TGVtMWppZ09Lakx4c1ZOQTZXVUNnb3ZnQWMxMGc3TE5hdG4yRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jPS4uJTJGLi4lMkYuLiUyRi4uJTJGdmFyJTJGbG9nJTJGbmdpbnglMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151166),
('q7auvKD0Pf9LBrHaFlS6BUfJZhlzFLVm2fVOTxdn', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMDlocENlcFo3dTd4bXZZRVlobkVLTEx6Skp1N2NTTlR6OWpQNEl6QyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGVfZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm15c3FsJTJGbXkuY25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151559),
('QAmDf6XgHRg6LFxY1mGDvsBhqvtcEuGJ72fuJde6', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYnVWQm9jbU5oYkxuVlJNOHdjSUN5bUFhMXFGUlo0d2NJWjlyQmxibiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGhlbWU9Li4lMkYuLiUyRi4uJTJGLi4lMkZyb290JTJGLmJhc2hfaGlzdG9yeSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151465),
('QancxnD5NwomGvQwVAJTuHo7I9XxSwqPfzFlxokL', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmtyblN1VjRXaFl3MzQ0ZkNibDF3MHJ4OUJNamZwRkEzNEJyV0tHRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGF5b3V0PS4uJTJGLi4lMkYuLiUyRi4uJTJGdmFyJTJGbG9nJTJGYXBhY2hlMiUyRmFjY2Vzcy5sb2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151521),
('qcUp2Sb8iIAcTMPeuwih34DWOvD1rk8gsuvTlxbA', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSEZqM1dFU0xOYnN4Z2N1V0FJRlpWUmJzWEY1N1hXUUx1bkQzNEVvTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZmVlZD1odHRwJTNBJTJGJTJGIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151141),
('qebiiPqeOzvD19cOje4ZBvOAjxifGHm0POZ0W3AK', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZlJXang1RzdzUnU4N0Q1S1dzNG1LVVVTNk9rQW5GMGlsSG1leGJXdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c2VjdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRm5naW54JTJGYWNjZXNzLmxvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151397),
('QEQcNz0LCv01tb7blfVjo0jFrsKzKMFV0jmH1UfW', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGc3TjFQckd4V2pKOExxNUNYdEY3MjhEUTFpREx5bUpuMmxTQld2MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGF5b3V0PS4uJTJGLi4lMkYuLiUyRi4uJTJGaG9tZSUyRnVzZXIlMkYuc3NoJTJGaWRfcnNhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151304),
('QhIxNEUSpWz7XY0NWtGFOrS9dxgDwuARFEw1H7WC', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaHFVNmQ4YXhta0x1dFIzajh4ZTNTbzgxanpTZzFkMVZBZlBmUDNETSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bW9kdWxlPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGaG9zdG5hbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151180),
('QipCAh6BqJED9iRl05cuS7pLE8Z2UEBwoqXohEnj', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWlZudVAwWDBjZ3g2cktuVlJHcE42ZW0wNjZBR2RJeTN4d3cxYmRsRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGVfZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBocC5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151362),
('QL0L8n8akpwwKVql1aQT1YWIytc7jkY7phV37lOg', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRFBqbE5FNmF5UWdrUHpiSFNNMm00UVVSOXBaM1pKQmVWVFVJMG9vUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRmFwYWNoZTIlMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151570),
('QpSzZa74fMk5Q4XvXRulcyjGSUHLXFMog71GHbMR', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1pnd2RTcXVwTE0yRU9HMmtxQ3ZIUk9iRG9UUVBBeGFGSXJoaGNSMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YXNzZXQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZ3cC1jb25maWcucGhwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151441),
('qqdigtj9LIklgDdo83njfqbedTlsPQG4mapMKu5I', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2JjOUE2Z2JXaTlxb0JlN2FFcmZ6TzdidjlObndLWlF0SElLWmM0dyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGFnZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnNoYWRvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151387),
('qQDLyAezQAX3nY2T8rf6PZnMu8b27NcQVw4vR3iW', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTTdIMUNoZ0M0WFVzMmJpVG1tYnAwV282aUh6aGFMbjBlN2lLYXpwViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y2FsbGJhY2s9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZteXNxbCUyRm15LmNuZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151328);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('quCvS1Mjz7NUGfPGY8ua2UuY1Bcp8Xemgy9VwIZ3', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjY3ck1mS1U3OURjQzBjblM5eUdkN01MRFNvVU5wV1FoZlpxeHBsdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c291cmNlPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGbXlzcWwlMkZteS5jbmYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151457);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('QVyL753TWzKAP79rerpHMw2HPh5DTWHE4PtFzERB', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnFSenBrZElPa1RldENVempSZnIwZ1F2UUNMZWZCbHA1RGgyQ1l3RyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGbXlzcWwlMkZteS5jbmYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151386);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('QwyrmqfzDtDr0SyTh3fbDlPnERnVfi2r3yH7FnJu', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlJVUTNveEM4d2x2d0djSmlrTmEyamo1SFRRb1BzTVFHeUJieFFtZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jdW1lbnQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZ2YXIlMkZsb2clMkZuZ2lueCUyRmFjY2Vzcy5sb2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151344),
('QYsN8TbaoZAfsWxmpMXX6rzEY0xiaSXjK7eWfFsl', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUtlam9NbVRvdlVWcERETnNsOExodW9Fc3ZqMWV0bzZ6OHVEdm85ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bG9hZD0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRm5naW54JTJGYWNjZXNzLmxvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151366),
('qzvYu5ZomOoBmEeBI0zZK9UiajKLpAikHnAD2WWI', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHdUZzVyUjFPbmN6dXZra0x2Z2wzUUJUN0NHSDRDQ2ZrYTFNQ09mSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jPS4uJTJGLi4lMkYuLiUyRi4uJTJGaG9tZSUyRnVzZXIlMkYuc3NoJTJGaWRfcnNhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151408),
('r14LZ9CHIt95wcuIvagJTu2S1L0XLRm5Rlyvaxmz', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0RJVkZ4U0U0TkZybnBhWkRMblloeDdldGhJYnRsdU9zR1FkUmhETCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29uZmlnPS4uJTJGLi4lMkYuLiUyRi4uJTJGLmVudiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151482),
('r3Mh03lwZzajKZ749xP7hd4NvmU0S745R9d69owV', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGdOMlJRT3d5dGxoOUtrN0tRTnBTYUh3NUhjbXFySmFGaFI5UURZcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGU9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZob3N0bmFtZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151491),
('R5uIJEGqjqpH8hzpd7aZlJfKXQgq7RN1tzy7RWSZ', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWp4Y2pFekxlY1NCR0haUjRvZHlMQXIwNE0zVTFKOE41cE14Q0xwcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGhlbWU9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZwaHAuaW5pIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151199),
('R8xXYEo1n58hS5nvxyA7FL5gAUpfotZ9D4RtXHi3', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2RKczZHUHpjNWdleGlVVm1vdXJzdzJJNGhJZmlROURZMlBDeWI1NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGcGhwLmluaSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151389),
('rcaGrFj0Vccar8QrK90CpW98z06p5kgPdY3LQ93E', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic1MxOTBQd2k0T05Ic0NvSDJ5WnNXa3ZsT0RIc3ZoZ0pCVDBaamE2NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGFnZT0uLiUyRi4uJTJGLi4lMkYuLiUyRnByb2MlMkZzZWxmJTJGZW52aXJvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151461),
('Re9PQ2DpvrGLvpnbiSdILwrQEtMuAZciwK12U808', NULL, '204.76.203.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiclhZM3V5UEhLanRXUDh0elJTdWdoS2xaQ3ZDb09WdXI3VVVmT2VwTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755157038),
('rFZcfrvfz87KXCBMSCUTes4MhauFZuHL12bAfxAN', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUJpWjVWTjRyUENvMEF0UUhkbkpxOGh5SVlFZGpyVG55UWtPNXJNRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGU9Li4lMkYuLiUyRi4uJTJGLi4lMkZwcm9jJTJGc2VsZiUyRmVudmlyb24iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151340),
('RlclAZUnSdnjmOYsO9Hq1q1Vt19an33WQHnfSVO7', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib1BUenV6M1R2Wnh5cHl0bmZpbWUxTmJnRE5lTzZhQnlFQks1bGZBZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151211),
('rlG3kApoKyNPhCdleQYHEMt4IPV21apO15GfmI3e', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3JXMUxiQjd2bDIxWEZad0V4dTV3REdVYXpBMklJcEo5UmRGYmZ5TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGFnZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmhvbWUlMkZ1c2VyJTJGLnNzaCUyRmlkX3JzYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151620),
('rniFQouob8yqeIvj7KOAYIoRACQ3cMhtbF5453rN', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNURQcnJDaEE0TVlFbUVKWkl5SzhkUlpTQnJJWU1rak9mbUQ1Zk1ZTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRmFwYWNoZTIlMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151597),
('rp0GQ8uQJCoxqXT7qbLlLqTT0qPpfSUkAVamR5Mf', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjRwV3QwNG0wZGxMdFNKY1hIRHl2ZXp0d3VvQnRzaGVUZTlqOWIxMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bmF2aWdhdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRm5naW54JTJGYWNjZXNzLmxvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151316),
('RQ46OUqNQbtQXF6cyxJLVeYDuO4WZsdsz5UOuPyM', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianZUU1dMbEgxY0RCbFo3cFI1MEN0ZlduVHRhekQ5VU5qUmZsT2MzQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jPS4uJTJGLi4lMkYuLiUyRi4uJTJGV0lORE9XUyUyRnN5c3RlbTMyJTJGY29uZmlnJTJGU0FNIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151545),
('RRE0oSGzmIv3MMcFvyfDwVWeKGhwyIpFPholApHy', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMW1MamdRZ2t0bU1ZMWZPU1RjZ0RjTFlLNkQwQmNyMWo5bmtPcjRIcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YXBpPWh0dHAlM0ElMkYlMkYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151440),
('rtP3ff4KT3o13gLatmgljMx2MI29sJceYrpO6yzM', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV0ZOelVKcUVtaHJYQlRkZDV0cmZWb3M5b1BETFdNUWpJQUJHMkk1byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGlyPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGaG9zdG5hbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151122),
('rvoL1ebPgM70nvE1cvrbGxq9eztqXAyZiAQZwNX3', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnhNT0FhU1kyeEk3akF6SW1rMEJ0UFRvaTAzYkxENFZ1NlFaUnlDaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29udGVudD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnNoYWRvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151410),
('SCFZ4IPXMBLwU8zTcSjIDCGvXnYkLYe9UpPo7RLy', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2RYSlFTUUFHRjZVZHNMTDhzQ1kzYndqRmhYY0RKaE5abEdNZFFodCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29udGVudD0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZ3aW4uaW5pIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151374),
('Sd5WVoojGrz28j2lscTJm9ZJfOV1qaduHVq3bcKy', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidTRPcTZ1cFRLeDVBQ0xveWhRUXhjMUxZU0VGc3ZLTnpNOEZBR2dSMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YWN0aW9uPS4uJTJGLi4lMkYuLiUyRi4uJTJGcm9vdCUyRi5iYXNoX2hpc3RvcnkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151290),
('sg8PSIeAviysc9unQbByEms9wurb4r66eSfb45Ci', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnVFSks0YVFGa3BBaFdMZ1paMXdYSVNTZW10RnloYjdUREdkSjE0RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YWN0aW9uPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGaG9zdG5hbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151407),
('ShyZun7Kc5kDKeuaeBz5oPTBkouTobe4RTbIMrNU', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYldaQVBQeHVjTVdDa2ZQQjdYalRlOWhpZmVkdmhRN1JTdWh3WHVndSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YXNzZXQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZwaHAuaW5pIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151453),
('siEkiUCoVXYheHmAXWNvA7zMy4fK3MbPAg33HttP', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSm1LNTFxQzRjbFJoT0tvdkNFWGlCUXZ6eG9tS2lJM21xamxiRlllTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGF0aD0uLiUyRi4uJTJGLi4lMkYuLiUyRmhvbWUlMkZ1c2VyJTJGLnNzaCUyRmlkX3JzYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151612),
('sJkKsDSj6wTrhiz7mzgC90Z719vP2DMdijkuiPx9', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnhMRFpTTnZTaHlvdzh6cXJYUVFrTk1zNE9DQWcybWlvSnVaVWZVYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29uZmlnPS4uJTJGLi4lMkYuLiUyRi4uJTJGcHJvYyUyRnNlbGYlMkZlbnZpcm9uIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151521),
('sJQ8PNA6xqeMy8kZvifkDLGPE5rWIPpReGSDK4fN', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMjdtODFDZk50aDBFOTZ1ZGIxbW1LZW9Ec1hrNlNWZHZBajFVNUxxeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29uZmlnPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGcGhwLmluaSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151160),
('sKLdR3mW8qoEna3WobgWpVqI3rCV6WUWm7p6dGhi', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0czR0ZvRkdJQ05UM0RWQ2c5SEI4dnJRenh6bWRpTlA5aUZsakFQSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGF5b3V0PS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGaG9zdG5hbWUiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151302),
('sORQ7r3Mf2WV3wKXEKh6G2pBkERzcfgPJTlmftXX', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnJZeWlIc2Y2MDZUUUMzR1dMQ0lvNVpwN3cxVG9IMGNiUllHc1dIZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bW9kdWxlPS4uJTJGLi4lMkYuLiUyRi4uJTJGLmVudiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151191),
('SUbVI5VcHRfGIhgO7PwhjyiosXmQMfjPHAXJpu14', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEg5SmZCOW9NU0FSM2Z6M0p6cmd1TUJUQ2NwbnhpUHVmd285UU45NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y2FsbGJhY2s9Li4lMkYuLiUyRi4uJTJGLi4lMkZ2YXIlMkZsb2clMkZuZ2lueCUyRmFjY2Vzcy5sb2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151347),
('t0Kxq6fbOMZdjIjKfVqt6vr2LCWNquTnj2koXvDS', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicnNQZ1BoYzZhVTJtWldJdXh1WUNPQzlqNlZzdmJFd3RITllxWlZxZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGF0aD0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRm5naW54JTJGYWNjZXNzLmxvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151318),
('tbDVXT5GQVVYzDhl6i0qF9f1dM6mWC0WkdHG8vKK', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjBpVnR6YjVXUkpKcjd6TmEyOW9QRFZHeE9aY0VCUGxpQWhDcDFCcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGlyPS4uJTJGLi4lMkYuLiUyRi4uJTJGaG9tZSUyRnVzZXIlMkYuc3NoJTJGaWRfcnNhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151459),
('TBtj7q6xLN5vpH2zxatrOOOgb5yftBhn65YesnlN', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRkNJTnlsMldSM1FyS1BseEt1SlNqV0pDbmpQdmJWS2lOWk5hQmhzQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGbmdpbnglMkZuZ2lueC5jb25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151343),
('TcCb9RDmZZzDY8qVVzsrpQZoOx6tXZ3b62NQUtlX', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmE1N3dSTlBEMEp5TjdqWWFjVzFHdUgzWEc3Zk42YTJ1c0k0dTNvcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bG9hZD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnNoYWRvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151500);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('Th9Ihm68WsOUqoCMrRWcuApdhiPgnLMbziwIs5Ms', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0pSMVhJbnpDUW0yVUxmTTJVMlFXOEpzd1BQR3JKVm5hRnlsOXZWYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jPS4uJTJGLi4lMkYuLiUyRi4uJTJGV0lORE9XUyUyRndpbi5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151410);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('tIkGWEYN7qGzrzSBrBQAcT6eZpxNXfBtTDf90uxh', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmlHNmcxc0R5UzNGNklRZGVFRXFMeGdsMDJxN2tYUkIydldPRjRNVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGF5b3V0PS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGbXlzcWwlMkZteS5jbmYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151460);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('tnTw7b3ZbMjpSjdiQ3bkj14qBBPNtn7mEjQZoVpN', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkFpV2YzVFczQ2lFaVRCaXJtZnJ3Vnd2d2hsa0tZc2lpUnJHSXZqRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGF0YT0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZzeXN0ZW0zMiUyRmNvbmZpZyUyRlNBTSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151473),
('tS6cp9MBWsb4yw7j3rs9BWkFU2OQM9d02Wm41ylz', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNm42Q0ZXQjdpM2Q2WmJxdnZLYmd1ekU3VHl6ZjRmSWlJdnpWdEJ6eiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c291cmNlPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGcGFzc3dkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151161),
('TSsJbpArAeCpQgUAmszXQdugG80T9YlS00n8puqk', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTGt1SEtmZmdJQ2l4TGRIU3J5MVBwZlFISWJiVVhIZEswMG90RUREZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGF0aD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm5naW54JTJGbmdpbnguY29uZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151106),
('tWB6pYaDNnzu391VVu4TCLjmIx8mWsujiu8CU1Ed', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0ZOSE1FcDgycnBQT0JtTUhBaW5YYlhrbkl4ekowQjdoWHdvZ1dNTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dHBsPSU3QiU3QmNvbnN0cnVjdG9yLmNvbnN0cnVjdG9yJTI4JTI3d2hvYW1pJTI3JTI5JTI4JTI5JTdEJTdEIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151582),
('ty5pwRYBRxlmXHAKGPLBBdCvBGjrVND8I26ronTY', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGlpWUhGakV5ZWUwMkU2UDcwdk1qOEpuY3dYODU4eVZFN0NNNHNCQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGU9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZwaHAuaW5pIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151289),
('U2N7sgLClOhP17O2gk2JjTrQS1zBhjiphRo76Ziq', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicVJWcGRJaGxIZFhva3l3RFdKNXlCTWFIS0lZZHZwSU5kczVDaUo3MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jdW1lbnQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZXSU5ET1dTJTJGc3lzdGVtMzIlMkZjb25maWclMkZTQU0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151265),
('U2pjIlcqBUxjz3CLFjrZpnJ6bW78uzxJ3Y5WhyHp', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZzVCdmRBb3RUZW5RQTl4MEU4cmlEbzlzZDB5ckd3dkZWalhxR2I5NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGVfZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRnJvb3QlMkYuYmFzaF9oaXN0b3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151616),
('U782p34h9xKG2GWbwl4s1tCO6gxvdsPQrssNECGc', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibUxKeUNEM2pMd3VsSlZMSDBUcXJZa09PeG5CS0I0MWFsZnJ2MWRtOSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jbHVkZT0uLiUyRi4uJTJGLi4lMkYuLiUyRndwLWNvbmZpZy5waHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151657),
('ua6Dq8oebch6YOrBGnyQeF8mXJQK1bzajDcmdy97', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiakx2ejM5Q3BSbUhOcXpkZHNHZWpCdmdKd2I0ekIwMGtkY1lSZmhkZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bG9hZD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm15c3FsJTJGbXkuY25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151443),
('uacR83irzE8p58vajKsBXnCxIPHSUrlK5O6CUUfm', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoianNHRHJhb3pucUxjN3RxY0cxckUySE9aU2w3azdMbHlrM2dCc2UzWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YWN0aW9uPS4uJTJGLi4lMkYuLiUyRi4uJTJGcHJvYyUyRnNlbGYlMkZlbnZpcm9uIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151577),
('uAQJmZnNvfR9izMtd3ZMRrcsnzBy5bCYBCtpvjF7', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieTB4YTZ6Ums3TnF5V1NsOTV3VFZXVUliSzVhc0xiWkZPRlpxWFp1ayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YWN0aW9uPS4uJTJGLi4lMkYuLiUyRi4uJTJGdmFyJTJGbG9nJTJGYXBhY2hlMiUyRmFjY2Vzcy5sb2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151533),
('ucArNInRaX4OiV2k4dq0xqwXKAqLp9SHv1ZEKMwZ', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNUFsVWpiWUtrZUlyQTR3Uk11dml4ZlF2UUlvbnRMSjdHUHBDUjNSUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c291cmNlPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGc2hhZG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151248),
('UdezvCPtqRK0HP3Aqqk2MZ8IaXGgI0bOpc9UzaPm', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUVdDQ3h6UXlKVVZBb3lSMkFwdGczWmVtYWM2SXVCTUtLMUFqVDVHSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGVfZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnNoYWRvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151519),
('UHcBvNZPY2he7aaXlkXU3Gb7uE8JKyenwAPCcGYi', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidzhkSGlCQTM0cTdCOWw3QnE3aVBuRDQ4SkYyM2psYU1wbGJVQVdFTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29udGVudD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm15c3FsJTJGbXkuY25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151216),
('UHGcRADKDDYOiWECGISqVLNiztjON8jPzbsirAie', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZW90Y3dmZ1ZHMXh3alJxU3B3OUtkWTBCazUzWVBtUWhDT1BSWk0yVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm15c3FsJTJGbXkuY25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151591),
('UlO7WR0bLfjPQIJYvKS9ap8wj7ermXE2fgBOiYjP', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiamdSMUJKS1h3YldKWjd4VEdQa29sQWJMWk11clNLMlN1b2dJY0lBciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGaG9zdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151489),
('uNhrTwjKnojtuQpx8XA99iDqqEBHzsBRQCINIXWu', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0cxVHptYzFVeUpyZmRnS2tWajhYOFhBekMyNnhteDlpUkJ3U05JYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bW9kdWxlPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGcGFzc3dkIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151448),
('UrhK0Z6ijr9IlFV5ITle55CkYWcI9F9u7B6b7fYQ', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHNxQ0g0SDh1c0NGRWdTbEg1UU5iWW1vQ2dyZFV0dTFLY0tnNTZ3MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZzeXN0ZW0zMiUyRmNvbmZpZyUyRlNBTSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151399),
('us7HWt5FoYw4Gf4aefsHlxpTNQqXXBH5Kw2J79Yr', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVU1lWmtGYWJiOXBtZURqdXU1alNJcElSWXBhVElmVDhDWGhKMXQweCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jdW1lbnQ9Li4lMkYuLiUyRi4uJTJGLi4lMkYuZW52Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151355),
('usi9wqhrL6ZTYOAKkUdOtOxObtb5eAV7hTmlmvv8', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXFLd1JDNXhuRGxYY01Zb05RWDhZcUc4QVliWWRPb1E4SmREa282MyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jPS4uJTJGLi4lMkYuLiUyRi4uJTJGaG9tZSUyRnVzZXIlMkYuc3NoJTJGaWRfcnNhIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151329),
('UvRO1a5IZXodJlsVQPbWsgX8IaVEUgV96FSCnPrR', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHdKZzZBSzdoZFl4VXVsOUNzejZPT3BSaUFNVloyUktkSHdqTHRWNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGhlbWU9Li4lMkYuLiUyRi4uJTJGLi4lMkYuZW52Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151110),
('uWwpdKUb0ERmOBzAZBFtwDYv0BXQfuyWMaqfK60T', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnVGMjQ5akZVcWE1MEI3MjFXSEczSTFXczlhSmRCRlg0YWFmMnNYTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YXNzZXQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZzaGFkb3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151495),
('UZWNKD39WhZ4kYJerIcPnH55bmDSRQ1NF2rHN5ux', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0hZUnQ3bmdqWHppTTh2RFJ5MFpNQThhR1FQQkxjWnplYXRLTGFiViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGluaz1odHRwJTNBJTJGJTJGIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151375),
('V06lC6fXhlRjCginr9JbtCnHQhuYiwz7e9YHfE9M', NULL, '91.224.92.17', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRWE1aVFVT052R1dTazFVUXNUbU81dWxkcDNxTGhnNnAyUWxtYlNVVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755154126),
('V0Vt7kzP0yRtrERVm3mJORlcLO80ArZaNfPoYYUt', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0dGV1V1QWFxSFdZVlJsZ1JIaVliUGFGSld2bVpoYVJmUnNyU0VoTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c2VjdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBhc3N3ZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151196),
('V4g2Ku5jpHvaCUd3tMt6FjjMenZfQh9WrWWWC9Af', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOTltWXYyUXhrYXFOaTFzQ3hxUlBKOGdsMGZxbFYxU0p4Y01JMkhrYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bW9kdWxlPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGaG9zdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151607),
('V6CEk8j3udmvO8XMyJmGGN6a8lzfsYsdxlv6zSYf', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGNTV3pnMWhhT2dKcERYRFo4WnFXWGZiYVQycnpvOE93TklHOWtPRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cmVhZD0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZzeXN0ZW0zMiUyRmNvbmZpZyUyRlNBTSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151438),
('vAiHcCnScAs8EaxEGSxu8Zy75W2B9dptrwauyoZL', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicm1FZzdPajg1OXRFaVdTTFJWbk0yUmtqWWs4RHA5RjZYNlZFMjlxRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGlyPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGc2hhZG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151341),
('VczR6LHATxk93SwlGCsXjWgm5XLiZ3zxeNb4bMHU', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVEM2NFZJcmxnSzVoQ25BdjJTNUVzNk0wa2s3TnU4dUZBeGFCTWM0UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Zm9sZGVyPS4uJTJGLi4lMkYuLiUyRi4uJTJGLmVudiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151209),
('vdDcYJVKqXaErY1hTkEzrEnaiajmXdDdwkGoucEe', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTHF0Y1VodFhDaE5GVVNObGZYRTNXTkI1UEZJWTdWUHdBNW5ndVJEeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29udGVudD0uLiUyRi4uJTJGLi4lMkYuLiUyRi5lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151650),
('vDMyspRSfWo0Nr6ag0qdMLTWrOZiJCr75id1UHDj', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1hrOEptcTd5UURMSDhUTzkwQlRzbWpNZ3lwcHVoUEdxZ1N0eWZpWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29uZmlnPS4uJTJGLi4lMkYuLiUyRi4uJTJGd3AtY29uZmlnLnBocCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151219),
('VF4ctFuOb37H6PoaNB7YjMP0YsT2t98mcLdEQISO', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTdTR3dwbUNBUjlKNUZYRzBQWXRKSmNwRzhPNmROWkRjdXRYcVk0SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGVfZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRndwLWNvbmZpZy5waHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151197);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('VhJTrBzbqhHVrQ6BngmJaiZ5iselIyCm0pNVsPEX', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHF0WlMxdVJSbk1CNVB5UEVYWHFmT2ZHVmJISXcxN0QxOUsydHBkOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGhlbWU9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZuZ2lueCUyRm5naW54LmNvbmYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151602);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('vHm1KF598n51AdBDlbpMynalc7QxkEXgA0X8RHQX', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoielJhb3RJVW5oQlp0dUZhM2xmWUNjWXZBUmI3RjlsR2p5bUNMVFMwZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bmF2aWdhdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151505);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('vM9Polk3jbV9fvBDo3cgOJMA3ic0G6drR4uDCDjg', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0xLZTNSOWRydzlFU0lLRU5RNFg3b3hyTmMzV2R5NklMTVZZMDNLUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Zm9sZGVyPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGaG9zdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151312),
('VNSy1RZsynqv865dtKnJz9YmoAaS5YkwdGFvVChU', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTRYa2pQbTdHZEh1RUEzU1V6WXdsM3NLTHVDaFlCczhGeWZxeExzayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGF5b3V0PS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGaG9zdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151429),
('VrXuUm4AYwcpYKwCm9vw4AYydNnQZoBmeu5js996', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEk0b29FbHZRRURDaXpiRFF4MXRZdVFucnZJSXFHbXhDZTdJTE5ibyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGF0aD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBhc3N3ZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151132),
('VuMo6Xn5hZGJpwmKwMVczVWitNnKdRj5bmVJbMyR', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieHBtNnNGd3ZGaGpJeG1kR1B2V0ZDcGxoQ3lqa3VNVXVFWkJINUlOUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm5naW54JTJGbmdpbnguY29uZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151434),
('vWCfKhbI28GxcUJQXB6rWAVNpVY1ysUAJN8gRrSG', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFhXanNJZVNScll5c2tYN1hsN3NpblVtbzV2WE9JeGM1UGIyd28zaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGF0YT0uLiUyRi4uJTJGLi4lMkYuLiUyRnJvb3QlMkYuYmFzaF9oaXN0b3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151511),
('vzuiZAw1o5PRRbYJQg0Gm5xsTKpA7zMb3jQGVo6G', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkdNbDlXWDhxQ2ZnSTJPbndkUGlEdjF2c1hqRjhxT1RrVHplQU40NSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGbXlzcWwlMkZteS5jbmYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151589),
('w0LaTp4gC0Zjj2gFC6CKGNZu2Vj6FUTo9EGU9z6z', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidm8xdTFidFp5d3BWV2d0U3JtNXRyWHViOTZqZGtEQzhDdEl0cm9lUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29uZmlnPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGc2hhZG93Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151628),
('W46RDHVByk8S5cTq0WWq8ZG78pZhxzDoyJRcXlJI', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXVhSXBtSlFJTUg3ZHg1dFhqdlZ5UnVJOHlpdFJCQ3ZmU09GOU1hNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGlyPS4uJTJGLi4lMkYuLiUyRi4uJTJGdmFyJTJGbG9nJTJGYXBhY2hlMiUyRmFjY2Vzcy5sb2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151300),
('W59uqtFx1l5Wcy9Iov83oD8zFADPnVVrYwb0wa6E', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieG8wek9ya0FpQnR3bjJqV2loaFFlelRSRVI4STVMSFN6d3AzWEd6RiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y2FsbGJhY2s9Li4lMkYuLiUyRi4uJTJGLi4lMkZXSU5ET1dTJTJGc3lzdGVtMzIlMkZjb25maWclMkZTQU0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151136),
('waN5QAEKHrX4LxDeeNHM30RZuxt9wwr9fwA3H361', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicldrQWJHTmNlNU1lUWR3SnRUNlNSdkdtNnBDdzZPWXlwcEVheDNWVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MTAxOiJodHRwOi8vMTM5LjU5LjI1Mi4xMDAvP3BhZ2U9ZGF0YSUzQXRleHQlMkZwbGFpbiUzQmJhc2U2NCUyQ1BEOXdhSEFnYzNsemRHVnRLQ2QzYUc5aGJXa25LVHMlMkZQZyUzRCUzRCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151422),
('WH9fabRkKBxq7KYSVT0kJFAwb0Yty9hqfEa8tYe2', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1I3b05oaThGYUxYeXFBN1YzMEdDQjRuZmZFNUU4MmNNVjVxSTFYTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y2FsbGJhY2s9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZwYXNzd2QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151522),
('WhCpnHf3CVy0IikaYzOLVUu1ckmXm0xtPTNInOmb', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiajY4aE9FS2llWmtlaHBXSElxNUlOaWJ3UXlXMkxpM0pkRmpRWjhWViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cmVhZD0uLiUyRi4uJTJGLi4lMkYuLiUyRndwLWNvbmZpZy5waHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151195),
('Wm2fuhoLXTRmBRkonNL9DgYYFta63PtMBm6bU41h', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGZ6eFFSY1lhZWFQUVNPaUxxUkdyNlRLalB2bXBRcFQ5UkZXa29xWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGVfZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRmFwYWNoZTIlMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151557),
('WNV5SoaQVkNpyhbzNljUqzzrCxzQcY8jNsYRYsVf', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1BjcHM0d1VzbWduSEJESHUwaFRBenowYjBQaFdIN0k3YUFJNVJKdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jbHVkZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm15c3FsJTJGbXkuY25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151346),
('WQI4C1eBSP2c3xAb2MUgER1JmkcrPHD2FHLmUkTr', 6, '49.145.221.110', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYTI5YXZmVEk0dXA0ZFJPdER5Nlk3YUUwbXpqMjQzY2RXekdTUUlTMCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9iYWNrLW9mZmljZS9leHBlbnNlcyI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjY7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkM1JON2ZLQzNjQ0JEMTF4MS5zbXdTT2RTaFBzSHZGL3RrRGwvZTUubXR2bzZSV1cuRTlNcUMiO30=', 1755157154),
('WRe7Z9OeqR9Ei2xOh2ZfJhFXC2hqXg93p797kaeF', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiakV2YWFuVUIwMmFhZjRqcUtuYVlQZDI4ekVjY0J3emlKM1B0SE84bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29udGVudD0uLiUyRi4uJTJGLi4lMkYuLiUyRnByb2MlMkZzZWxmJTJGZW52aXJvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151330),
('WvYv8ycEoHKEWTwvTwZtORJlcfTSmymMJ1pJ0Rca', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDlzbE96TEVUc3pOeVlYUW9jdGxWYXJVazF1Qzk1QzF3OHI4RjlZZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBhc3N3ZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151497),
('WwWnGzbBVeaJ7viGS5IpLG9Id3D9q6zMhLTE9rmL', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1luWElwV1hxTDlQYmJZR0lrYlhFV3dyNUsxOEg3SGcxSkx3ZlJPOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGF0YT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBocC5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151524),
('WXc2pkyVs7oiv3cTbqcB2MBIp0fqPyJsRb8Tdubi', NULL, '44.222.226.245', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/136.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZG80N21SVjJCN0x1M09zQ2VVVW1tVTNJZ0JGb3hqUG13aHZEZ0hjMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755156848),
('wyFleLkkClZrmqggrvzhiu0fvN1pnWjqoY2daxYj', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkN5OTJtNVV2M3NxSkdYSXhMR3Nnak1CbWV5aUI4M29sVk5ORnR5ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGaG9zdHMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151144),
('WyxdU5E7xutPdFB9zN7JPHhPeYukNz401FWA4Cd1', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmRjWFVWTWp3VzN6cGhZaldCblFoR0JxNGNDVXdCRnJ6RHIyalBjciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGF0aD0uLiUyRi4uJTJGLi4lMkYuLiUyRi5lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151473),
('X1WpQti140WtPfkh3w8EfFgdOGR53oOVsEzjYgTv', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieUZtN015aEhSckM0Y1BGc3RuR2FIRWhxN2tIZ1RydjZkNkFFenNaciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y2FsbGJhY2s9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZob3N0cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151413),
('x2K89PyGSQ8HmCDNoRA8tBz4MOpp3ViuiN6L70fC', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidWNZUWtVMzBEd3VScTVFeGJOYVE0RGl5V0pCbmxGTEx4SFVCNUMydiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bW9kdWxlPS4uJTJGLi4lMkYuLiUyRi4uJTJGV0lORE9XUyUyRndpbi5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151398),
('X78Pc5JaqdrtdyXg52S4863PfWW5plJyZ9I2tbQe', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzR5Qnk2bG5rYmJRTDVNb1FwMzNCWWlybjFrazFkTGRQaHBkYUw1cSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGF0YT0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRmFwYWNoZTIlMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151627),
('xATLY0luWhTgiDu0sUmoywSrHxN5BPCnqU9wRQcy', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid1MzRE9TZE9SSWJjSGRObmdoMTlVOFppMVJjU09XR2gydkNJQVdXMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OTA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGVfZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZzeXN0ZW0zMiUyRmNvbmZpZyUyRlNBTSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151331),
('xAVc9toky9lgLxdw0hG1c6WPmlOeF1v2anAn6oKQ', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkpjQ3dKTmNXRkM4dTBab0gyYmRPZk9yM0xEdjBENDdoTnZiU3ZrYSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGlyPS4uJTJGLi4lMkYuLiUyRi4uJTJGcm9vdCUyRi5iYXNoX2hpc3RvcnkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151288),
('XgqW5KTYF80Srtbt3sT8FN3PNFJg0gszDVYYsj2G', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHgxdHNJYXMzZUpjZXhTN2RqTjZueWcwUjNMZmJibWxINzk4Nm5INyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29udGVudD0uLiUyRi4uJTJGLi4lMkYuLiUyRndwLWNvbmZpZy5waHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151577),
('XiAbkCnLyWLmgC7qLSMSXTfQ1XCh2jhb6d86fDjt', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibDVFWkRhZ1ZOOWVXRHNiV21abkdNc2N4Y2dpZ1Fua3k4N1J6cDk4SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YWN0aW9uPS4uJTJGLi4lMkYuLiUyRi4uJTJGV0lORE9XUyUyRnN5c3RlbTMyJTJGY29uZmlnJTJGU0FNIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151667),
('xL5jGX08Zznv9HHWtgw6ckKll7lTPBfjaGJHBjFV', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQTB4SzA2d3RTQVlERlV5NFd6ekJjT1FDWnZJUGp6RWdPSzN3eGJXaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cmVhZD0uLiUyRi4uJTJGLi4lMkYuLiUyRnByb2MlMkZzZWxmJTJGZW52aXJvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151230),
('xm5VUiwa2ViWLU1nz7OTKPwVpmszxVvkM8iax9au', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWG14cjJjMnJyMVR5MjZGdUNpTWpCS3dudU9TWEZNNmxHTk1IUDZsdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGF5b3V0PS4uJTJGLi4lMkYuLiUyRi4uJTJGV0lORE9XUyUyRndpbi5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151175),
('XMzw61TKlRBza8KLf45c968vcgEZ4rk102DcpuS2', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHBOSUVRUE1lWDNGTFNJMEgxekZkRkoyT3VUVldZdFNVNmdOWDk2MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Zm9sZGVyPS4uJTJGLi4lMkYuLiUyRi4uJTJGV0lORE9XUyUyRndpbi5pbmkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151670),
('XnhxRo447gWC6pMHsh7VCjYtPu4LLhzX4SNAcRnE', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWDlxZjlSSnR5dHhTanBYRnkzSXdCOFdsWWFWYkN3bE9hSzE5Ym5HMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jdW1lbnQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZwYXNzd2QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151160),
('xo8bWMEMfPYKxl3GJPKmzOCm2H5t888hgEjvz5Wz', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid0VGV0tHUUJYcGEwZlAwQnE4cm8wSHpTUVNKN2pwdXZBQzF3Z2NoUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bmF2aWdhdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRnByb2MlMkZzZWxmJTJGZW52aXJvbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151479),
('Xpwr3My1sI7hZVwFMrLIyPQQJQV86J0tvtUE6dli', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieVZXMWM0dXRtOEdOQWgzakZjcU9OcFQ3d0tpTUdCcVF4M1BHOVd5YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c2VjdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRmhvbWUlMkZ1c2VyJTJGLnNzaCUyRmlkX3JzYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151579),
('XS0jwOlvWbYSK0KbIXfcmUR1XVCD1XLBsm1kqtrq', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNm9qQjFwN0VSblhPVHlkd2hFNlNlQmNzZWlxeG5FUlF1VmVsTEo5MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGcGhwLmluaSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151156),
('XuC4fFuTc8VuRUJeBtCIEQyTP84HnkRnqkvHqHe2', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFhoRnJLWHRMZkxpRUhaQWU1cHU2WWJoUzF6UjdDZzdhVDFPTzh3SCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/b3Blbj1odHRwJTNBJTJGJTJGIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151529),
('Xx49FRia1zto9my8TyZDT1iDDL9GM2N736nSq690', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRlgwdm9Ud1h3UnloNUNlQnhiSzF2cVBXTGpWUWxaOWtxM0ZHYWlxTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jbHVkZT0uLiUyRi4uJTJGLi4lMkYuLiUyRi5lbnYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151451),
('Y3jOU3riY9Gfts1JtZftinImhvjJ9ICdsdP1HgQ6', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblJLUlJvaXVmY2NHc0VVTzJhWlZEb1BtclpBY0JlelhBcmdHdGpsRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGFuZz0uLiUyRi4uJTJGLi4lMkYuLiUyRnJvb3QlMkYuYmFzaF9oaXN0b3J5Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151527),
('Y5oNnRLM8q1YgCQCTEy6Sf976oEUE5cPYiFapBDd', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkQzTkQwVXpSQWo2WERabWM3WGVhT055Nkp5RXpWVkF0eUs1S1M2bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bG9hZD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBhc3N3ZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151224),
('Y6SIEDXozXI3c5mPAYWAGxO6fd9VLUTBPRFq9E6Y', 7, '119.93.157.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiWmllWk8xdm9nZ3ZzWWxTYWtrWGUwbU1JZEVYbXo1U3dmVWlrRUloSCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9yb29tYm95L2Rhc2hib2FyZCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjc7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkY24ub3JHMVdEMy4vbThld2FXQk9vTzNOZjQ1RzdqVWRMVmtjb1cxQnBhTDdFZjFnUExhQXUiO30=', 1755158428),
('y6XGRSbxGLrPU5KdIZPuXOV3lQdzopXFNN6G9epy', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUEdoamdjT1lpbVh1RzhMbUxYM0V1TFpQQVhURnRTcDVCbXFndGlDQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bW9kdWxlPS4uJTJGLi4lMkYuLiUyRi4uJTJGV0lORE9XUyUyRnN5c3RlbTMyJTJGY29uZmlnJTJGU0FNIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151298),
('ybDmMVO1AMGGqGeoRsOF8Bhim1AA8BsLc36UX9t0', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibjN5bUJNRlJ3eXhEZE1aODNocnozU0tlV1VZWGhtTWxMT2dJSUtNNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jPS4uJTJGLi4lMkYuLiUyRi4uJTJGdmFyJTJGbG9nJTJGYXBhY2hlMiUyRmFjY2Vzcy5sb2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151193),
('yBEAqdvUc6mclvq45oMg74B95NINuoujTOKe7qWU', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEZhZERoMVhET3BLckFleThQdHhrQmg0dGxESmhtRkJqWm15a3dWOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZGlyPS4uJTJGLi4lMkYuLiUyRi4uJTJGV0lORE9XUyUyRnN5c3RlbTMyJTJGY29uZmlnJTJGU0FNIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151219),
('ybsCA18ejUrdB8pYAeU8ekX3LCu2Femlq28NPbSl', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRVdWb0pEZ3pPdW82QUhhT04wamlROUVzTFVKWWJDc2xxQ0x1MUZqRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Zm9sZGVyPS4uJTJGLi4lMkYuLiUyRi4uJTJGV0lORE9XUyUyRnN5c3RlbTMyJTJGY29uZmlnJTJGU0FNIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151188),
('yCPLNW5a5Ct77uHrRNgdcpisXQc9I530fzcquggr', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFFXbWhSQ1NtV3JwVnhUcVIwWUpRdzRJSXZNSFpzRFBFRXZGREVabyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZmlsZT0uLi4uJTJGJTJGLi4uLiUyRiUyRi4uLi4lMkYlMkZldGMlMkZwYXNzd2QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151168),
('YCzUyBUGY1OEdNf4EqIUh2HBWNDvdbogiRrFNKwP', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1dvRWtQQW5jQkRJRjRKZVBhTjh0NUV2UndOdGhkM1FnNVo0am5WTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29udGVudD0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRm5naW54JTJGYWNjZXNzLmxvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151394),
('yE9iWPahAhzkpiiye6LMGwVV4kk0Fb4O2kqUCErF', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiajM3UUFPcHd1THhoVTczYUsyVkVvS1luYnJ6ZjRzaWZOdVRlNFYwZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cmVhZD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm5naW54JTJGbmdpbnguY29uZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151237),
('YFqHTSpaDCjpERD8TaBGUOOHEyGyqWmi4AUP67d7', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODdzWHBaQ0RBMzFzSXg3M090S2hLVlZaOXFHZ3pwbE1PN3p0M2lFUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZzeXN0ZW0zMiUyRmNvbmZpZyUyRlNBTSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151539),
('yggPYaPYDw0vTppHuPse4zz0gHwm53MRKlPBOpq4', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN1prQmJGeTFXcXFESFY0VlBxekV5d1p1NXM3cEFaN2VBZGdDZk1oNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGF5b3V0PS4uJTJGLi4lMkYuLiUyRi4uJTJGLmVudiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151414),
('YGMJqwjUQqgz3fp8IR1uArYDUHZ6lhyClVSEuEIF', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia0JRWlU5VFNwMlZxTXgzWXZjdDhmWmplcXFsZXlTd2loT0lpU0JmVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGF5b3V0PS4uJTJGLi4lMkYuLiUyRi4uJTJGd3AtY29uZmlnLnBocCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151634),
('YGrZ8sHAfeGClCJBEdzS8qVysM0QyorViaKv1PHx', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN3VrTHpjb3JYcXEzSDcwVVlyT1YzN3FSNzFCTTM2Z1g5Y3dZRmNXRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGVfZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRm5naW54JTJGbmdpbnguY29uZiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151281),
('YjDajiVdKuOsGnt278jV145qkUkpJD31O2IDIxTq', NULL, '185.242.226.113', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFdNVWFyVHcxMWFBOFVmQWtVcWRqN25pdmp5UzBONGxHSGhpTEx0SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755158117),
('yLizlHUzwpGwjAh0100m56AzNT7fnhTx1GmezuNP', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibjl1c1l2OWphMUtlTmdsWTlvQ1RwVFBTdllWNEtqb2g3Mm1oZ3ZzdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29uZmlnPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGbmdpbnglMkZuZ2lueC5jb25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151589),
('ymcFMxtpap0zlxwSK0xL3p3owRyICZEOnj70Z0UC', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUzdlNjJZVnhvRDdIaTZuNEpTZWdTbEZCenJnRUg4UHhBRGFYQUhrdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jPS4uJTJGLi4lMkYuLiUyRi4uJTJGcm9vdCUyRi5iYXNoX2hpc3RvcnkiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151609),
('yqlGRYo1YmMuljuasqwT04sBzMn3hjj9Mf2bMip8', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiclBVaGx2STJoTWNWQ2ZuQkplQlJBcEZWNVNEZlVQRTlvY2dYb290byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGhlbWU9Li4lMkYuLiUyRi4uJTJGLi4lMkZXSU5ET1dTJTJGd2luLmluaSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151161),
('ySlem5WpxUfwatrBuZPQzt3Tv6T3Gk7aawdg5ogc', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0ZlM1R1ZnhIU0tDampHWkpXamhyazYyYVFMb0dEZGNVQnZxM29PaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGVfZmlsZT0uLiUyRi4uJTJGLi4lMkYuLiUyRmhvbWUlMkZ1c2VyJTJGLnNzaCUyRmlkX3JzYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151566),
('YtYJgctdxZUtrQ14dpugAwWjswNTJ0aSnqLVVM7P', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmVTdngxZllSNUhTQ1JONWxpVUw0RlV5eWc5RHhONkw5YmVZbTJuciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bG9hZD0uLiUyRi4uJTJGLi4lMkYuLiUyRmhvbWUlMkZ1c2VyJTJGLnNzaCUyRmlkX3JzYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151152),
('YvU6VpPK5ZSEe80gJOJ75aVwpH0UH7Ri8IqvuGTv', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGIxbWRzdDFseEZKWlNnWVdKbWxzeDg4TU5Fd2k0UDdGSExmYWY2ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGFnZT0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRm5naW54JTJGYWNjZXNzLmxvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151295),
('YwImUXHv4Q3azfzuCBhKTc2eOQdc4zKgNFtj9ZZW', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNExQcGxYZlRYbmE2QXV4SzRjNjFaNDhMZGpjWENMZnQxbE5IYk5FbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bGF5b3V0PS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGbmdpbnglMkZuZ2lueC5jb25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151479),
('YxoNxXiE5Idu8srrJqVEFeEMOT0f0jvodQFdKTDI', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNktTWWZGNWNRbjRzUG1pMjFGbHpyTTcyUTY1RWt0S3hSN2lYcDBMZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29udGVudD0uLiUyRi4uJTJGLi4lMkYuLiUyRmhvbWUlMkZ1c2VyJTJGLnNzaCUyRmlkX3JzYSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151302),
('Yze46Cc2hR9DI6SRqSaeR1t4a1XyIoKZwSi4bsFg', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjJGZGlYMVhBZVY4akVaQTNLb0ZtTHR1dU1TZGtmU0tqN2h1MU9RdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Njg6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bmF2aWdhdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRmhvc3RuYW1lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151656),
('yzfIj31aazz0GwD6lXTaIzjw38ytZPfRiIK0N31W', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicTZDTExzbEdpTkQ0Ym9XbXFmaEJUeUR5RWQ1a0QwU2FZelVJUjc5QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGU9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZwYXNzd2QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151615),
('z35ioN1pc9947Bdyo6sxbGiomYVUsA7qOC1RgK0z', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUEdZc0xBMWtRbGFDNHhPckxBdENOdVhjcEh2eUh2ZnJMVERtRXc4WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Zm9sZGVyPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGbXlzcWwlMkZteS5jbmYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151580),
('zchCcNHoyYcH6y9soRHIjdbUhb5RDfx0CnmxDuP2', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQUN3S2tCZldHYWJXMERRb0JuVlNYRkFpbm1oSFIxODRuZXByc2RhbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29uZmlnPS4uJTJGLi4lMkYuLiUyRi4uJTJGdmFyJTJGbG9nJTJGYXBhY2hlMiUyRmFjY2Vzcy5sb2ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151469),
('ZCIjfXOh5TUvasMLHwZSe4Dn0H9XwAkJqkJDjseD', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR2psM3NSb3pqdmZ5QWRaVzZJRkIwbTBYZlNwbTAzWlZpWkhDWWVzZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c2VjdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRndwLWNvbmZpZy5waHAiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151510),
('ZDbsI2zWG79gDM23KfBSPzSWmKlOH2WNCZENCzY6', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzdzMDNQOU5lS1lvbURWUkhTeWZoZjNGU2xCUnNycktXTXZRRGljTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YWN0aW9uPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGbmdpbnglMkZuZ2lueC5jb25mIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151148),
('ZdtYEKnbNS61ixwoEttZEWrgQDlmTpsPhAcIlsd8', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM2ppejlROVEwQk91VTdLYlllc256RW5OOGlFOHIwaGhjRFhzaFY4VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/c291cmNlPS4uJTJGLi4lMkYuLiUyRi4uJTJGcHJvYyUyRnNlbGYlMkZlbnZpcm9uIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151390),
('ZGpLLmiMuHPta1WT87oD9YRvXqx7fx5lNDZ2jUXG', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaGRjSDNpYmFPT2tjRzhlZGQ3MjdwSGpreTdOWVA2YzBTTFVUNm52eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y2FsbGJhY2s9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZzaGFkb3ciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151433),
('ZKOouRuvaoYmW8Gb0mbXdkjhokt1GxZkuGPOElTN', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnl4VEdvOGp5RDk0dmNsUUltbnZqMU0wTmJPM093RFBVTmxCdEdUViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/YWN0aW9uPS4uJTJGLi4lMkYuLiUyRi4uJTJGZXRjJTJGbXlzcWwlMkZteS5jbmYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151428),
('ZLd9ddY5ZnraO3j0qqA1kv4xKKO5t1A1ufk1j16U', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVk1EZGU3YmJDTzNPVGZESEZ0eWNzMFo0Y0ltOVhObmxsa1BEajJiUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZG9jdW1lbnQ9Li4lMkYuLiUyRi4uJTJGLi4lMkZob21lJTJGdXNlciUyRi5zc2glMkZpZF9yc2EiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151473),
('ZlL9jC2YW48SkG5oe5fIzTcesgKET35w0r1DhdXu', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiODQ4c1lKcVRESlA0cDhRajZEVU5uejdwb0U5R3JzbWJpcEdOZ2RlRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/dGVtcGxhdGU9Li4lMkYuLiUyRi4uJTJGLi4lMkZ2YXIlMkZsb2clMkZhcGFjaGUyJTJGYWNjZXNzLmxvZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151403),
('zNnbvxBdxwPqzlkyC75bVl0QsI3gbbOOcISxCE56', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGJrZ2NhZW0wRFkxeGt5cWRSQmJmV01WRmF6YlNUNzBzaDBiVFptdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jbHVkZT0uLiUyRi4uJTJGLi4lMkYuLiUyRnZhciUyRmxvZyUyRmFwYWNoZTIlMkZhY2Nlc3MubG9nIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151599),
('Zo5B27vSjAcewyZSBdAbLsPLoGh8BU8zBK9h4xxm', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVWhXbVRBaHl4aER5RFhnaVZzSzI5QVBOWjdrcE41MkM0aUlNWGNWMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZmlsZT1waHAlM0ElMkYlMkZpbnB1dCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151263),
('zqmKRmOdRGCQIfEAy9moX18r2pBhBRrYMfRWx7r8', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1V0SElSa0ljV2lKSWVqS2pEZ0hUc3VRMHFBQnBqRXhEdWNZaUlkSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bmF2aWdhdGlvbj0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZ3aW4uaW5pIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151637),
('zqXcKEySFuf4WT3TgAWk4dvqcVZ1IULA8Mu5puTN', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibXlOYlh6YVdSYWdGNVJqTkxjc3NuTnNhNTBmWDZjdHdRQkljdXB3OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/ZmlsZT0uLiUyRi4uJTJGLi4lMkZldGMlMkZwYXNzd2QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151424),
('ZrSPGVe6yF6uaITTeFrcWmvOe8SwHOYqloTWtb6D', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTEZOZERLYWtNRjFJVXRMbWZTTGlyNkh1RktXTG5GQU9OdXN6aE9EUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y29udGVudD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnBhc3N3ZCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151514),
('zrt9G5q0IgJjfkOEOBArhUguKMRDw4GwfwdHq444', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1hZSzZadU1NRWhJWHBhNUlpQm1TOTF2b1BmOU42eVZHV3Z4U2V5WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGF0aD0uLiUyRi4uJTJGLi4lMkYuLiUyRmV0YyUyRnNoYWRvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151182),
('ZRYDf4OSnmK5AaCcFaBgjQSsuOcePHAkcPVHVyI5', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVpuOGZabTl1SU91YmthMHJOUmNaTkdBT2VKckM0dnc5N25ESHpsMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODQ6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/aW5jbHVkZT0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZzeXN0ZW0zMiUyRmNvbmZpZyUyRlNBTSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151642),
('ZSmwHnVPxjEXasBBf37ADQ0Rf88S0fl5xKngBheB', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieHBncWhmdFBGQWZpakdScm54U3lyVndOeVNXbDRMR0NXUXFNdTJaYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/cGF0aD0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZzeXN0ZW0zMiUyRmNvbmZpZyUyRlNBTSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1755151301),
('ZtBgiyn8RFj9IsJtM4uaisRPkJKiK4jXH1V2yBcC', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3pNb1RKNERzWUVpQW9QRW5QclEzUllSWVdENjhydklHTUxkc0xnaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjU6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/bG9hZD0uLiUyRi4uJTJGLi4lMkYuLiUyRldJTkRPV1MlMkZ3aW4uaW5pIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1755151668),
('zYcEC8PpSH2TEMLIfeq1RFZ6pP2RqOmY2BvS24Ds', NULL, '185.177.72.57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNDBsb2c5dXNYd3Y5WHR6aExzQ2U0ZnRQRzNzZVlOaWZJMGtQYTVVMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/Y2FsbGJhY2s9Li4lMkYuLiUyRi4uJTJGLi4lMkZldGMlMkZuZ2lueCUyRm5naW54LmNvbmYiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1755151184);

INSERT INTO `shift_logs` (`id`, `time_in`, `time_out`, `frontdesk_ids`, `created_at`, `updated_at`) VALUES
(1, '2025-07-28 16:43:01', NULL, '[1, \"1\"]', '2025-07-28 16:43:01', '2025-07-28 16:43:01');


INSERT INTO `stay_extensions` (`id`, `guest_id`, `extension_id`, `hours`, `amount`, `frontdesk_ids`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '12', '336', '\"[1,\\\"1\\\"]\"', '2025-07-31 13:42:23', '2025-07-31 13:42:23');
INSERT INTO `stay_extensions` (`id`, `guest_id`, `extension_id`, `hours`, `amount`, `frontdesk_ids`, `created_at`, `updated_at`) VALUES
(2, 1, 2, '12', '336', '\"[1,\\\"1\\\"]\"', '2025-07-31 13:42:31', '2025-07-31 13:42:31');
INSERT INTO `stay_extensions` (`id`, `guest_id`, `extension_id`, `hours`, `amount`, `frontdesk_ids`, `created_at`, `updated_at`) VALUES
(3, 6, 2, '12', '336', '\"[1,\\\"1\\\"]\"', '2025-08-06 09:32:41', '2025-08-06 09:32:41');
INSERT INTO `stay_extensions` (`id`, `guest_id`, `extension_id`, `hours`, `amount`, `frontdesk_ids`, `created_at`, `updated_at`) VALUES
(4, 3, 4, '24', '560', '\"[1,\\\"1\\\"]\"', '2025-08-06 09:32:53', '2025-08-06 09:32:53'),
(5, 9, 2, '12', '336', '\"[1,\\\"1\\\"]\"', '2025-08-08 12:29:27', '2025-08-08 12:29:27');

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
(3, 1, 1, 1, 1, 6, '\"[1,\\\"1\\\"]\"', 'Extension', 336, 0, 0, 0, '2025-07-31 14:38:38', NULL, 'Guest Extension : 12 hours', '2025-07-31 13:42:23', '2025-07-31 14:38:38');
INSERT INTO `transactions` (`id`, `branch_id`, `room_id`, `guest_id`, `floor_id`, `transaction_type_id`, `assigned_frontdesk_id`, `description`, `payable_amount`, `paid_amount`, `change_amount`, `deposit_amount`, `paid_at`, `override_at`, `remarks`, `created_at`, `updated_at`) VALUES
(4, 1, 1, 1, 1, 6, '\"[1,\\\"1\\\"]\"', 'Extension', 336, 0, 0, 0, '2025-07-31 14:38:38', NULL, 'Guest Extension : 12 hours', '2025-07-31 13:42:31', '2025-07-31 14:38:38'),
(5, 1, 4, 2, 1, 1, '\"[1,\\\"1\\\"]\"', 'Guest Check In', 592, 592, 0, 0, '2025-07-31 14:38:03', NULL, 'Guest Checked In at room #12', '2025-07-31 14:38:03', '2025-07-31 14:38:03'),
(6, 1, 4, 2, 1, 2, '\"[1,\\\"1\\\"]\"', 'Deposit', 200, 592, 0, 200, '2025-07-31 14:38:03', NULL, 'Deposit From Check In (Room Key & TV Remote)', '2025-07-31 14:38:03', '2025-07-31 14:38:03'),
(7, 1, 3, 3, 1, 1, '\"[1,\\\"1\\\"]\"', 'Guest Check In', 872, 872, 0, 0, '2025-07-31 14:40:23', NULL, 'Guest Checked In at room #11', '2025-07-31 14:40:23', '2025-07-31 14:40:23'),
(8, 1, 3, 3, 1, 2, '\"[1,\\\"1\\\"]\"', 'Deposit', 200, 872, 0, 200, '2025-07-31 14:40:23', NULL, 'Deposit From Check In (Room Key & TV Remote)', '2025-07-31 14:40:23', '2025-07-31 14:40:23'),
(9, 1, 1, 4, 1, 1, '\"[1,\\\"1\\\"]\"', 'Guest Check In', 480, 480, 0, 0, '2025-07-31 14:42:07', NULL, 'Guest Checked In at room #1', '2025-07-31 14:42:07', '2025-07-31 14:42:07'),
(10, 1, 1, 4, 1, 2, '\"[1,\\\"1\\\"]\"', 'Deposit', 200, 480, 0, 200, '2025-07-31 14:42:07', NULL, 'Deposit From Check In (Room Key & TV Remote)', '2025-07-31 14:42:07', '2025-07-31 14:42:07'),
(11, 1, 1, 5, 1, 1, '\"[1,\\\"1\\\"]\"', 'Guest Check In', 480, 480, 0, 0, '2025-07-31 15:00:22', NULL, 'Guest Checked In at room #1', '2025-07-31 15:00:22', '2025-07-31 15:00:22'),
(12, 1, 1, 5, 1, 2, '\"[1,\\\"1\\\"]\"', 'Deposit', 200, 480, 0, 200, '2025-07-31 15:00:22', NULL, 'Deposit From Check In (Room Key & TV Remote)', '2025-07-31 15:00:22', '2025-07-31 15:00:22'),
(13, 1, 88, 6, 3, 1, '\"[1,\\\"1\\\"]\"', 'Guest Check In', 536, 536, 0, 0, '2025-08-05 13:50:37', NULL, 'Guest Checked In at room #123', '2025-08-05 13:50:37', '2025-08-05 13:50:37'),
(14, 1, 88, 6, 3, 2, '\"[1,\\\"1\\\"]\"', 'Deposit', 200, 536, 0, 200, '2025-08-05 13:50:37', NULL, 'Deposit From Check In (Room Key & TV Remote)', '2025-08-05 13:50:37', '2025-08-05 13:50:37'),
(15, 1, 34, 6, 1, 7, '\"[1,\\\"1\\\"]\"', 'Room Transfer', 0, 0, 0, 0, NULL, NULL, 'Guest Transfered from Room #123 (Single size Bed) to Room #5 (Single size Bed) - Reason: guba ang gripo', '2025-08-05 13:52:46', '2025-08-05 13:52:46'),
(16, 1, 89, 7, 3, 1, '\"[1,\\\"1\\\"]\"', 'Guest Check In', 424, 424, 0, 0, '2025-08-06 09:31:59', NULL, 'Guest Checked In at room #124', '2025-08-06 09:31:59', '2025-08-06 09:31:59'),
(17, 1, 89, 7, 3, 2, '\"[1,\\\"1\\\"]\"', 'Deposit', 200, 424, 0, 200, '2025-08-06 09:31:59', NULL, 'Deposit From Check In (Room Key & TV Remote)', '2025-08-06 09:31:59', '2025-08-06 09:31:59'),
(18, 1, 34, 6, 1, 6, '\"[1,\\\"1\\\"]\"', 'Extension', 336, 0, 0, 0, NULL, NULL, 'Guest Extension : 12 hours', '2025-08-06 09:32:41', '2025-08-06 09:32:41'),
(19, 1, 3, 3, 1, 6, '\"[1,\\\"1\\\"]\"', 'Extension', 560, 0, 0, 0, NULL, NULL, 'Guest Extension : 24 hours', '2025-08-06 09:32:53', '2025-08-06 09:32:53'),
(20, 1, 43, 8, 2, 1, '\"[1,\\\"1\\\"]\"', 'Guest Check In', 592, 600, 8, 0, '2025-08-06 09:33:25', NULL, 'Guest Checked In at room #100', '2025-08-06 09:33:25', '2025-08-06 09:33:25'),
(21, 1, 43, 8, 2, 2, '\"[1,\\\"1\\\"]\"', 'Deposit', 200, 600, 8, 200, '2025-08-06 09:33:25', NULL, 'Deposit From Check In (Room Key & TV Remote)', '2025-08-06 09:33:25', '2025-08-06 09:33:25'),
(22, 1, 168, 8, 5, 7, '\"[1,\\\"1\\\"]\"', 'Room Transfer', 0, 0, 0, 0, NULL, NULL, 'Guest Transfered from Room #100 ( Double size Bed) to Room #253 ( Double size Bed) - Reason: no water', '2025-08-06 09:35:31', '2025-08-06 09:35:31'),
(23, 1, 89, 7, 3, 9, '\"[1,\\\"1\\\"]\"', 'Food and Beverages', 80, 80, 0, 0, '2025-08-06 09:45:17', NULL, 'Guest Added Food and Beverages: (Front Desk) (2) C2', '2025-08-06 09:45:04', '2025-08-06 09:45:17'),
(24, 1, 130, 9, 4, 1, '\"[1,\\\"1\\\"]\"', 'Guest Check In', 536, 600, 64, 0, '2025-08-08 12:28:24', NULL, 'Guest Checked In at room #203', '2025-08-08 12:28:24', '2025-08-08 12:28:24'),
(25, 1, 130, 9, 4, 2, '\"[1,\\\"1\\\"]\"', 'Deposit', 200, 600, 64, 200, '2025-08-08 12:28:24', NULL, 'Deposit From Check In (Room Key & TV Remote)', '2025-08-08 12:28:24', '2025-08-08 12:28:24'),
(26, 1, 130, 9, 4, 2, '\"[1,\\\"1\\\"]\"', 'Deposit', 64, 600, 0, 64, '2025-08-08 12:28:24', NULL, 'Deposit From Check In (Excess Amount)', '2025-08-08 12:28:24', '2025-08-08 12:28:24'),
(27, 1, 130, 9, 4, 8, '\"[1,\\\"1\\\"]\"', 'Amenities', 20, 20, 0, 0, '2025-08-08 12:28:48', NULL, 'Guest Added Amenities: (1) EXTRA PILLOW', '2025-08-08 12:28:43', '2025-08-08 12:28:48'),
(28, 1, 130, 9, 4, 6, '\"[1,\\\"1\\\"]\"', 'Extension', 336, 0, 0, 0, NULL, NULL, 'Guest Extension : 12 hours', '2025-08-08 12:29:27', '2025-08-08 12:29:27'),
(29, 1, 130, 9, 4, 9, '\"[1,\\\"1\\\"]\"', 'Food and Beverages', 120, 120, 0, 0, '2025-08-08 12:29:59', NULL, 'Guest Added Food and Beverages: (Front Desk) (3) C2', '2025-08-08 12:29:46', '2025-08-08 12:29:59'),
(30, 1, 130, 9, 4, 9, '\"[1,\\\"1\\\"]\"', 'Food and Beverages', 60, 0, 0, 0, NULL, NULL, 'Guest Added Food and Beverages: (Front Desk) (3) COKE ZERO', '2025-08-08 12:35:37', '2025-08-08 12:35:37'),
(31, 1, 130, 9, 4, 9, '\"[1,\\\"1\\\"]\"', 'Food and Beverages', 320, 320, 0, 0, '2025-08-08 12:36:13', NULL, 'Guest Added Food and Beverages: (Front Desk) (8) C2', '2025-08-08 12:36:05', '2025-08-08 12:36:13');

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
(7, 1, 'Roomboy', 'roomboy@gmail.com', NULL, '$2y$10$cn.orG1WD3./m8ewaWBOoO3Nf45G7jUdLVkcoW1BpaL7Ef1gPLaAu', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, 4, NULL, NULL, NULL, '2025-07-28 16:39:09', '2025-08-08 12:37:05'),
(8, 1, 'PUB Kitchen', 'pub-kitchen@gmail.com', NULL, '$2y$10$FjzCpCHXLRrxvWNd.glOeuf48o4YcrWyGx9N.I0U3vOthw1HwnVIC', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11'),
(9, 2, 'Front Desk Davao', 'frontdeskdavao@gmail.com', NULL, '$2y$10$qM/0SEMHpay8CyQrilwY0u/4WijheDZcLxczAgJA4gN2psKNihB0a', NULL, NULL, NULL, 'DAVAO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-14 10:32:09', '2025-08-14 10:35:38'),
(10, 2, 'Kiosk Davao', 'kioskdavao@gmail.com', NULL, '$2y$10$TvLuGa5UM3r2vu.7z9NTwO5rNNspBsvXq0hkj2rkX67/1yvE6Yxym', NULL, NULL, NULL, 'DAVAO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-14 10:36:11', '2025-08-14 10:36:11'),
(11, 2, 'Admin Davao', 'admindavao@gmail.com', NULL, '$2y$10$Z/WVZ/otQcnAIV0ec7VMIOrQBdXjhJZ9Dn19djQM3ht0sbjxMSeTu', NULL, NULL, NULL, 'DAVAO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-14 10:36:45', '2025-08-14 10:36:45'),
(12, 2, 'Kitchen Davao', 'kitchendavao@gmail.com', NULL, '$2y$10$DiVgmg37RchZK/rEdWBgwOfzp.jKlGgc0wrVP.kV6VdfkJH7u8FJa', NULL, NULL, NULL, 'DAVAO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-14 10:37:22', '2025-08-14 10:37:22'),
(13, 2, 'Roomboy Davao', 'roomboydavao@gmail.com', NULL, '$2y$10$p03bEpr018E2KIwYT7SIgePDPR.PODzdLZnKwGOb0AJYwlfmwFQgG', NULL, NULL, NULL, 'DAVAO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-14 10:37:53', '2025-08-14 10:37:53'),
(14, 2, 'Back Office Davao', 'backofficedavao@gmail.com', NULL, '$2y$10$0zGcCdWi1kA9AjIwpDMcyeVEAg6fjCs03v8ErHuHF2g6rNWmA7gQm', NULL, NULL, NULL, 'DAVAO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-14 10:38:33', '2025-08-14 10:38:33'),
(15, 3, 'Admin Cagayan', 'admincagayan@gmail.com', NULL, '$2y$10$22d08ypkcTFZ1SFEzi4xLO6gpJhh1IMyoTVll70j5Ig/Zv9L99kQ6', NULL, NULL, NULL, 'CAGAYAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-14 10:44:57', '2025-08-14 10:44:57'),
(16, 3, 'Front Desk Cagayan', 'frontdeskcagayan@gmail.com', NULL, '$2y$10$9KMXcvRwm7.xnl8ZU6cf4e4X35Iu1D3GSnbk4gr3.K9jWrH9chT8e', NULL, NULL, NULL, 'CAGAYAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-14 10:45:27', '2025-08-14 10:45:27'),
(17, 3, 'Kiosk Cagayan', 'kioskcagayan@gmail.com', NULL, '$2y$10$Kp/agoD9cz.xpdVHJutgJOD4xOLaeKUuQhVuQPBLUsnheWjIlWXnq', NULL, NULL, NULL, 'CAGAYAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-14 10:45:53', '2025-08-14 10:45:53'),
(18, 3, 'Kitchen Cagayan', 'kitchencagayan@gmail.com', NULL, '$2y$10$BYBQrh0L.DwtnQRexFJRCOwIg2hLtXNk8yhrXCHIhppC55LAZW5.q', NULL, NULL, NULL, 'CAGAYAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-14 10:46:20', '2025-08-14 10:46:20'),
(19, 3, 'Roomboy Cagayan', 'roomboycagayan@gmail.com', NULL, '$2y$10$P0565gCAcd5TTRhXbJrq2OFShU9.nDA1G56qDOcfqY3fk0u1HKnVa', NULL, NULL, NULL, 'CAGAYAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-14 10:46:44', '2025-08-14 10:46:44'),
(20, 3, 'Back Office Cagayan', 'backofficecagayan@gmail.com', NULL, '$2y$10$QQgNonNWQaVS5uKXnMwM7OmyOq2J21y09yYboKJ1pvmUpyg1t4bv6', NULL, NULL, NULL, 'CAGAYAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-14 10:47:20', '2025-08-14 10:47:20'),
(21, 4, 'Front Desk Gensan', 'frontdeskgensan@gmail.com', NULL, '$2y$10$V8bDqQoe2Ia2MFiAr/KlyuHBQeb09cQd9PpJmDmCkM/yShPS2FG.K', NULL, NULL, NULL, 'GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-14 10:48:46', '2025-08-14 10:48:46'),
(22, 4, 'Admin Gensan', 'admingensan@gmail.com', NULL, '$2y$10$bYVj7lJ4BLG6Ki2NpENfXOXZLUyiJti8Qltgwod6f54ZDWhnxRxSO', NULL, NULL, NULL, 'GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-14 10:49:07', '2025-08-14 10:49:07'),
(23, 4, 'Kiosk Gensan', 'kioskgensan@gmail.com', NULL, '$2y$10$GGKVVINayXBDe2Vik45vUOd0Dr1u.YwBEQWvU0sBtIwe10o57s3Me', NULL, NULL, NULL, 'GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-14 10:49:31', '2025-08-14 10:49:31'),
(24, 4, 'Kitchen Gensan', 'kitchengensan@gmail.com', NULL, '$2y$10$lnsOlcO8fELgDWtB7e7LD.dmKTGQ7KaowJWaRHGgP9/ZYSPLWPW.6', NULL, NULL, NULL, 'GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-14 10:50:00', '2025-08-14 10:50:00'),
(25, 4, 'Roomboy Gensan', 'roomboygensan@gmail.com', NULL, '$2y$10$s/7XU2QMun7cH1V5Tg1JaelV9gpKmSdev2dMGKQQGZ806iecY4nOu', NULL, NULL, NULL, 'GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-14 10:50:21', '2025-08-14 10:50:21'),
(26, 4, 'Back Office Gensan', 'backofficegensan@gmail.com', NULL, '$2y$10$5ZDURWt65Fo.JYTKzFH3Y.g/pR0/VG7fPopQB7fQIzR3A30N.nLoO', NULL, NULL, NULL, 'GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-14 10:50:42', '2025-08-14 10:50:42');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;