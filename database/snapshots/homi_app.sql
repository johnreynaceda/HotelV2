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
  `start_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_assigned_floor_id` tinyint(1) NOT NULL,
  `expected_end_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cleaning_duration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delayed_cleaning` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `frontdesk_inventories`;
CREATE TABLE `frontdesk_inventories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `frontdesk_menu_id` bigint unsigned NOT NULL,
  `number_of_serving` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `frontdesk_menus`;
CREATE TABLE `frontdesk_menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint unsigned NOT NULL,
  `frontdesk_category_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(53, '2025_07_21_111252_add_column_user_id_to_expenses_table', 1);



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

INSERT INTO `room_boy_reports` (`id`, `room_id`, `checkin_details_id`, `roomboy_id`, `cleaning_start`, `cleaning_end`, `total_hours_spent`, `interval`, `shift`, `is_cleaned`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 7, '2025-07-31 14:40:14', '2025-07-31 14:59:33', 19, 0, 'AM', 1, '2025-07-31 14:40:14', '2025-07-31 14:59:33');
INSERT INTO `room_boy_reports` (`id`, `room_id`, `checkin_details_id`, `roomboy_id`, `cleaning_start`, `cleaning_end`, `total_hours_spent`, `interval`, `shift`, `is_cleaned`, `created_at`, `updated_at`) VALUES
(2, 1, 5, 7, '2025-07-31 15:00:53', '2025-07-31 15:15:53', 0, 1, 'AM', 0, '2025-07-31 15:00:53', '2025-07-31 15:00:53');


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
(127, 1, 4, '200', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:10', '2025-07-28 16:39:10');
INSERT INTO `rooms` (`id`, `branch_id`, `floor_id`, `number`, `area`, `status`, `type_id`, `is_priority`, `last_checkin_at`, `last_checkout_at`, `time_to_terminate_queue`, `check_out_time`, `time_to_clean`, `started_cleaning_at`, `created_at`, `updated_at`) VALUES
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
(205, 1, 5, '290', 'Main', 'Available', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:40:05'),
(206, 1, 5, '294', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-28 16:39:11', '2025-07-28 16:39:11');

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0JraCzbqjpSalYK8ffMuSrbNK8xI9NpZX1f3DrNB', NULL, '168.76.20.229', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36 QIHU 360SE', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDFLa0ZTTGFPNmdobWoyeFE1Q0xpbUl3cWRRcVdrZ21wcVFwS2JNaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1754007959);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('1OLLUReRLUiW2GIeZbzwWL53OW41bMS0Z5ApVdvQ', NULL, '83.222.191.14', 'python-requests/2.32.4', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoid3RjeVR2YVVLNHdmVVBlcG1MSmhEZ280emUweEZZOFZhVUxPbkZnOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1754001725);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('24TLI2f5zibuvCw4LWhQg53jT4aQs0fq6los2YNd', 6, '180.194.100.253', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoibnVacnk5bVBzbnVzMkQxYTFQN09SVnNTU1ZpUnZ4eWRkY1BsMVRBUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9iYWNrLW9mZmljZS9zYWxlcy1yZXBvcnQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo2O3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJDNSTjdmS0MzY0NCRDExeDEuc213U09kU2hQc0h2Ri90a0RsL2U1Lm10dm82UldXLkU5TXFDIjt9', 1753948871);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2Hs3uBV8j1wjeEnSFylIAkejyuIwmmzxSf8BRiIf', NULL, '185.242.226.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWdjUzFEVk9BM2J2REFkanZnVDdCVnlNM1E0aENNbmxINTlaNVNZZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753999511),
('2ZHIR0kcVPOy006UXSr05pE0J3BmnUJ7IWthcFkZ', NULL, '204.76.203.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMXhmbjZLVDd6d0lPaUg5ekJqZUdicW1SeTYyWmszSURDbEw3aFg5dCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753967808),
('3WuyqQQleqIMJDncEHfDx1uLvcX9o0VHX2RbFjST', NULL, '147.185.132.18', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVGpCbDVJNXJwWWRpejRVRnFHZFh6N0MwNFM0MHRpTzExVENwcFA0RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753950457),
('4CMu9Fe8LHIoefHEm1H8bETjqFpw6Gv6YaOckm80', NULL, '91.224.92.17', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVgydzVVc0hGVE03QzRVV1lRNk1kbHpvd3lDMUVaVmprNkFoamJrUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753994699),
('54a6HO2tlgSE61bdrSc7MsSrTmS7LBVorgEk6Nja', NULL, '206.0.183.151', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU1VGV0ZXVlFpYjd4ZGZWaFlNemJ3WWNLWHhpZXE4d0hVQW1pSDRwNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753986787),
('6mWS7SKodgdUOaj3Z0kujXCrOPTwCqSTbQroaABe', NULL, '91.224.92.17', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1JSWHMzUDdpbWZZNE5LdTVncHJEbEFScFdyM05HaEkzcnFJbjROZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753984537),
('73DtRIV1pW77bqsklEgWhiT6uupULpCbIP0uqhZg', NULL, '91.224.92.17', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGpGcHBEYmFZdnlZNDlXNGptNUVOVFNzV2V3SDVwS0g2SzBIc1k0ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753976166),
('7aWCbVKxK5GpM3QhqzWo9PsAblyqHumsYE4M1WjT', NULL, '91.224.92.17', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1hVTndiUmNZYk1YS0pWV1o4akZ2aVkzb2tsbXl5Qk9lbDhERXBwRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1754003917),
('86VGUVhQOGF9EGdVk0uZEB4aR41UcF1RXBC3cjDX', NULL, '204.76.203.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRlBXTEphYXRvNlFBeVlOSFdIeGkzdFB4T1ZRU2I2MUhVS1RzYWRpYSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1754002265),
('89jKQOgmI5LqbO8YXHipdDDk7uborua7GgbukI9o', NULL, '204.76.203.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiVWlCNHpvQnJVaFY0OEc5SVZXSnZDdkZ1YkNJVHk2U0NpYnl5ZlBSZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753981706),
('9nwmTf8SjNat12WmgAWGOBu2Q1QtjbBn2sUmmUcA', NULL, '103.59.156.16', 'Mozilla/5.0 (Linux; U; Android 4.4.2; en-us; SCH-I535 Build/KOT49H) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEwwejI4ZnFxWTlKUVllZkg4R3FVdXpZSmVKV3hscDdVRmxJT1hNQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753970099),
('9OCa7yfCvffvPO580N5K2nTEUS8pjBEqjaRUVaIw', NULL, '109.162.150.230', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZUMxNWlYMkp4VERTSjdvOUVmZFViSmFwb3YwTjhLbFNxSkNVT1hFbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753991237),
('9wHQ9UbELL3Qn9CwfWKP4AoeFzRyhn1z3WQuju9i', 3, '180.194.100.253', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiMUx1MHVlZk01OGV4MGd2blBmVkhHMjBWZ3VlUmxmUFMwU2lxN1RuSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9mcm9udGRlc2svZ3Vlc3QtdHJhbnNhY3Rpb24vMSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkc2xNaWJwMDZ0U3BXUjAyeEI5VVVqdVN4eWJudkkvMG9JUmFLRG1iYlJyQnovVWRvZ1Q2Ty4iO30=', 1753942727),
('b2TpzJhtFLkvaCdaN8dcCwNVWdK5mcnv9OeDEDGO', NULL, '3.137.73.221', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiekY4aXl5a0EzSnlrdlZhcFF0UUlmdmRMZnJiVVF5U1VPY1lvcjVZZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753948404),
('b8OLnCPSodNcKDAOfRYHxy2zvEVhyIKMAGBdxBh5', NULL, '91.224.92.17', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTTdnNzQzYWdKd0N1U3hmamF2YThaTGFuSk9NU0hQZUFZU3RBV3VmZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1754009476),
('Box6hE9W1bvur5efExf6aZVfQpg4V1gaVD5GSg8w', NULL, '204.76.203.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiNE1lVFRxSmVJMzNhRTZBTHQ1VjdQOUY5MVlkelJMZDFxcXY3MjRnZSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753941491),
('de2tSVjkXkkaXNopxLPRwy9moIL7MENbi7DDLjjb', NULL, '109.162.150.230', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/601.7.7 (KHTML, like Gecko) Version/9.1.2 Safari/601.7.7', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieks5WnZ1MlZpOWs0dDFSellTZ3RQRXBLZ2NSZTc3bVptMGFkZE5VZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753991237),
('dF3IfrJrMAs8OJLbL4T4EmJiDAM6jo3CSBs4zzm0', NULL, '204.76.203.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoienNBQXZhQVM4Q2pUREt0cHpzUlpyTmNQWU1DOHZDcjNOUDR2SzBLeiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1754008600),
('drYDPVgIuiatDWtQKJW6HIw25qAu9ogH7eGx5wM5', NULL, '43.133.253.253', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoienlzVkYxQ1IxTVJHdjJZbUljVWNia0FadUg0d0F3QmI4OGdTZXZ6MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753945879),
('E4jrtrE73PWOKND2uyxZyjX9wxNKtmhWYyxZqqPf', NULL, '109.162.150.230', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicnhVUTNaVERLcnFFc2tZTWZ3dGZRSGNwQlVpSUd5bUpPT0VVdXdSaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753991237),
('eZUBXIPaPNj37XQOWo8cPNXOMMKQNb5tsccYUM5o', NULL, '91.224.92.17', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQk5Ob25mbWVSdGlJNjBJd09LRjJERTRMWm12czdVTFdTMkxKQnZuRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753977600),
('f1p6IvcRGkPBxhyUJuuVwXRH5PwOkMcJql4K4Rob', 6, '27.110.168.106', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVVFBdmJpNkMzTXBoSmdZeVRGcGM1UGg0amRoQjZPSWRoT3FGQVRiayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9iYWNrLW9mZmljZS9zYWxlcy1yZXBvcnQiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo2O3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJDNSTjdmS0MzY0NCRDExeDEuc213U09kU2hQc0h2Ri90a0RsL2U1Lm10dm82UldXLkU5TXFDIjt9', 1753947936),
('fVD7kAkAiCrabsng3PzVI702suAXQvUke4BhLp2R', NULL, '180.194.100.253', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRHNkUGg3M0xuNUxEMDh2djIySWVKb2doTUdwbE9jSmNwWlhxaHB3NCI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNjoiaHR0cDovLzEzOS41OS4yNTIuMTAwL2tpb3NrL2NoZWNrLWluIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753972481),
('g5dOpWkOEolPnwpy4pQgEDD1th4421Aq01YIpXs5', NULL, '43.159.148.221', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicWE3UllMMEFKMUVpOTh3ZWpGdWJnMEZoME44MGdPVko5RHk0ekxpYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753954182),
('Gn5BOkF5xCvj77y4gqnushmokHte6SCOE23Ni1FC', NULL, '204.76.203.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiY0p6TUpyS0ExRW50OFJReE5TSEQxVnJwekhKRnBWeXFvOXRVdGltYiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753994944),
('Gw1gALIzqJ47zyYfgypEVIKRN2qE0ubNozIgY9UB', NULL, '204.76.203.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiMWxKdnZKNGNpZ2FEZ3lMVHUyVDRhYnNDT1lSbkduQzJUYkZHSHVUbyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753961247),
('HgjGhyD8DgkOaR3G2WXxGB1kCq1R5ycR4xoQguKP', NULL, '193.46.255.153', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUm5DUWsyUkFBTHR3VHhtT3dTQlNValhoTGhOUzhKaml3c1BjSGF4QyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1754008396),
('hkiZp4b1Ryuw1A2K9eTBOEihodcmB2OS5NVrOJN1', 3, '180.194.100.253', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiMkpxVVcwbGRQa0xxOHh1RWVZeEJIY1RIdVYwNnM4eWJETVYyQ0ttSCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ3OiJodHRwOi8vMTM5LjU5LjI1Mi4xMDAvZnJvbnRkZXNrL3Jvb20tbW9uaXRvcmluZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkc2xNaWJwMDZ0U3BXUjAyeEI5VVVqdVN4eWJudkkvMG9JUmFLRG1iYlJyQnovVWRvZ1Q2Ty4iO30=', 1753951194),
('HkzH9dVOI4bqmFfF3EmB3q53IbXyDEuIePbyc5lh', NULL, '193.46.255.153', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWZIaWpJNU5VZnVIMVViTGVBemplRVhSWUMzTjUwYUE3MlhCZ0YzVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753999699),
('hMs3oPfYPOFyy4rm5Te8ictTJFG2T73fZMfiE9y4', NULL, '64.62.156.122', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 OPR/108.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicTlyWlJsWFFHTjJ6TkxYSkx2Wkc1b2FlWTdENk5zYnFjeDJLU01UMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753958520),
('IeteZf7a9IMNvCLJmzghGrlh3fKpREIlBmq2gQl9', NULL, '91.224.92.17', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWp1VVJkQWN6eU9CcU9DMHd5ZGQzb0lWQ2VpbmRBZVZJTDB6Tk50NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753944477),
('ig8gBmr9ioAAicuVILNjIh5VCRUKwZRhkh3dG7pw', NULL, '134.122.106.248', 'Mozilla/5.0 zgrab/0.x', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWJEYXRzRkcyZUx2QVU0ZUpCWHgwYTE4RkJ4M0dmY2k3QlRsNlhnQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1754009334),
('iPfM7mT1pTPla48JneGxeu2Mud2hUzl12BgV4XBE', NULL, '91.224.92.17', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjVSOUNFeTRKbVBpOHdKWHR0NzdlOEFMWlM2cklQeWluWFJKdEh3RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753949671),
('IviKBJbBQGvPQugfqs4lNMsnGa2UrpbWTIiLH3Dl', NULL, '3.137.73.221', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2hVblRoYWpreGlmOUd2TEdETTZWSDlBY3FUbkRvNnhGVzRYMGRBTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753948396),
('JG2GLcKkt7D7B8qB41fXqGkg6WX7LyE3XhqMY1ki', NULL, '93.174.93.12', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.90 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUE4zZzh1VENtcndBRVZhWFRaVlJFUURRS1dRNUplSkhHcFNCOVBKeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753981643),
('KKOUQnaIBpc7SUIfUDXS0YLFlgy54f0t8OPzWb8y', NULL, '91.224.92.17', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN0pVanpPaDFzMGI0SEo3S3VsYlk0dU5yWEhUU2pIVzlVbE1DTW1yZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753969630),
('krHvI9UYbqbVzvAXiALItqaq2JuF6HkVNIj4FkO7', NULL, '103.59.156.16', 'Mozilla/5.0 (Linux; U; Android 4.4.2; en-us; SCH-I535 Build/KOT49H) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaDRmaVhZeXhlaDFKQTRobkFMYXhwc29sVmtvaVVNbW0ySmtHYlpPMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753948690);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('KUkHiwM4p9573ZnAzb39YS7pKL3ZaYo2pbRKRAvH', NULL, '91.224.92.17', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMXBOVXZmdWtwb2dPeEhqUkYxOGdrM0RwZ2JWVm5BREtSMEtRREtpTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753996535);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('kzpWgOCQ3m0XKqClA3EB76EOiKUDxpXTGV3xCUNE', NULL, '103.59.156.16', 'Mozilla/5.0 (Linux; U; Android 4.4.2; en-us; SCH-I535 Build/KOT49H) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZGR3RHB4OFpqTndpaGVSQWpNTmVBRVUyMTVJa045RFkwSWZPcTlKeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753965964);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('l2SKUWyprITkuCUyjE0MP0WUiiNjNXFJtb6IkDg6', NULL, '204.76.203.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiY0RRVDJPdm95WVdMSndSd0FJQjRoOGNuN3JtalpUVGY3Y0tiWjJMQSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753988791),
('L4k7tgKwGP1z6dHjYGCv1twZoykBfUIeM3iWZ9Zz', NULL, '185.242.226.153', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.190 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiYW0xU1RpVW1OaE1jbmVxSW14Wklyd01OY0lBR1ZIUG41c2U4allkNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753969622),
('LcgHttF6Ar6RYtMtGoVOblH5Je30J0YSszEbJ553', NULL, '91.224.92.17', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDBCYXVhcjlwTlM2SndLRmRabmdiNHpxek1PTmZGUE01cFd2Mjc5VCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753942346),
('lqZNouRmwFitb4nrrdMNseKjho5gZ91ALCvESFi6', NULL, '91.224.92.17', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlNwSUtXanNxdVB2TVhSbTVlMHlZUE9lcUlmSDZ3cEZjUkZiUm93VyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753955868),
('mA35NumI2xXDCse8fPIWn3shLzjq1s7G69C0850c', NULL, '170.39.218.2', 'l9tcpid/v1.1.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiblRwRkJVb0JFOElxekh1c2JpVkhMOVVvVVZlVUt5TmRqYklicUZpTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753956949),
('mt5iDHAbYtSq4CeMwsMSMEe7w5lHJjyZUOJXZt9q', NULL, '193.46.255.153', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1UwTTZoTWw0aTFqazVlVmxDU3M0WEQ4cTFSRjNINEhFR0FaR3dtWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753981286),
('nhzSRNZ3eGk6dWHOkLYYzauwVuOq6lMvRsM8pDLo', NULL, '204.76.203.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiRnhUbFpZTmdNVjR6WmUzTnUxVjdJVHpabzJVMGR6cmt6clhleDdCRiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753947994),
('nK419OeiA8TG1u1EdVX4VJtGgkiHHLoPpAnAWzbv', NULL, '204.76.203.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiOXZvN2Y5M1B1RUNRY2h1QVhMd0hMS3VhODBMRG1DbTJERHdTaHBsUCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753974676),
('o956bMRfWt3kjQjm8TXTsM28a3J9xcn0guk6FSlk', NULL, '170.64.168.60', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibVYxaTdma040em5QSG9aV1hoUlhQSlQ2WGw4RGNXRlRtRDR1dER2VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753951223),
('oASmbwOWtExApmumTrecLtJpUPocyoSlTQv2CjIu', 7, '180.194.100.253', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVU9CMXFpVG43dGpaWnlmMFcxc2Z5em9EWWxKc3BUaW12anU3QThUWiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzk6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC9yb29tYm95L2Rhc2hib2FyZCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjc7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAkY24ub3JHMVdEMy4vbThld2FXQk9vTzNOZjQ1RzdqVWRMVmtjb1cxQnBhTDdFZjFnUExhQXUiO30=', 1753951758),
('oJySsqwMVRk5Eieyp7eakibFB5jSBfGBfND2RLvz', NULL, '168.76.20.229', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.2623.112 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNDNDNlQ5TUFrNFE1ZUl6TnRqWXN3WEs4Qk9vaTg4TnpVSGJ0bHplRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1754007959),
('PaFxByktAjQPn3tf7Z7rOvxKjcF64cFHU01GJP0a', NULL, '43.131.23.154', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiem1jYTVJU2c1Uk9RSVhhckxVWFMwSUJpdkhBWDFzWGMxTmFnN1pKdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753963736),
('ppH4qr6okWBeDugxkEEZy2sGT5DKBwYNOQoO1Llc', 6, '122.52.149.206', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRFlKcWhTYVNVVnQ5bk1mZ2ZhNGRJYmc0MzNtZ2lLbXNEYm12NUFDRSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ2OiJodHRwOi8vMTM5LjU5LjI1Mi4xMDAvYmFjay1vZmZpY2Uvc2FsZXMtcmVwb3J0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Njt9', 1754011376),
('Q2pDKZ82qLiUiuw5hvX6Ek4Ewi1EkAUCpB4elIt9', NULL, '31.135.134.45', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2743.116 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQVBpakdHV2JpeTRhbTRIWnIyQWJDRXZhSlNiYVJkZ0toTHlSamZ4eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1754009906),
('q8gLXu2ef8M0awqjpL0m8pmPZcqKsHFwXYZJGcqw', 2, '180.194.100.253', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYlNFY3lOdUpuZjR0Tkg5djVjZVVOY1RZMXJlNTdXbXg1MFZBUFhpdCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMzOiJodHRwOi8vMTM5LjU5LjI1Mi4xMDAvYWRtaW4vdXNlcnMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO30=', 1753945373),
('Q9xNSBH5nQIhHPOY1fntE02mbhlP0F4vlGO9CfG9', NULL, '162.142.125.208', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnNoc05zekVmWUgyeFlkZW1lWDAxY283MjhmTml5d0lPR0d0UHBvMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753939975),
('QKQwXyyiTK7eO0tyNdeykhH9q4hGxIlPJmx5H7jJ', NULL, '91.224.92.17', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZXd2dkFFM2VIVFNUUm44SGE0RjRjcVJyWmRjcVJMV0dCV01JamQyTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753962860),
('r4Q0FxDlKWKIVKXSWIC0ppBD3pDUOpnCKDBa5PFG', NULL, '43.157.95.239', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibWFvaHR4TXVRNGhmdnlXM1hFa2M4MW51emhOZ2NyMHRDclVLSUV4aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753980564),
('RWW5mcTesjOCrxsqgkUtjG6rmGZXiPXqhSbfiyRc', NULL, '205.210.31.21', 'Hello from Palo Alto Networks, find out more about our scans in https://docs-cortex.paloaltonetworks.com/r/1/Cortex-Xpanse/Scanning-activity', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRTBxQTdEbW1vWnlPeGlsdXVVblhldklhWHY3WWR3aDg5bXN2YnZ2eCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753992992),
('sTnpCLpnlY4MDzhXBzDseVfb2deFHZM7hmZKN0aB', NULL, '193.46.255.153', '', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnd1UjZURDNFMFpxZ2pOUUdTTGw4dEZoaGVVa0t0aXYwNDRwTmthVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753991109),
('t6ayjn32GZORFmJNk8vVG9ZFgObzBHSbkRApn6On', NULL, '124.78.64.35', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmJRTVM1dDAzVE10bmhLcWxiN21vcXd0UkNuTDJKbVk5dVRTSjJYeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1754005779),
('TuvfNfFVIhXo7WU16PRu9xDkXfAfiFseeHUagtCf', NULL, '138.197.89.42', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWJva0Y5eDB3M3Jjc0NmYlNrMUpyVWxMVEZHQlF1WFFka214eVBzciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753969509),
('TvHZw5cPKouOk6phYbSZh3GDOoGOFETjtPYOiCV5', NULL, '43.153.71.132', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkJvQjB0VlgxZEtIWXJvRjNzZVZoakdhZDRHREJtaUR6T252RHN5SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753997424),
('VaIDrppgkfLYt7iiSTWiG1ap6QIgEFZpa424nZaK', NULL, '104.152.52.200', 'curl/7.61.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRDZobXdRUjBMdHp4QTNwbUNkU3ZTbmVMMU5tWHFadkRSWHNmTUpVZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753975067),
('VwgqcvXL2nJYUCTMra3eUCjxGVrF2BztZNa9DMx0', NULL, '3.130.96.91', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHVSZ1hRZTJMVUVSVExPSnRUdXh2YThIbGVHZk80Tm11bVNpSXBOQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753950281),
('W4k6KQ4B7ir7mYKt2TA4Q2E7FWzYnTo6pHoXrhJA', NULL, '43.159.143.190', 'Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmRoanRVbTNHOXhNeUFqMjhTNFpmUlRDRHdLYkQwNGV6VlY2MlRtbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753970551),
('wa9S4cMGctEFS0qcHdBqgrdt1GgCgUeUsATjWJqL', NULL, '79.124.58.198', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0VubHA3OEdjVjFmYnZKSTVoanpvR2JzMnVXUHhuVzJlSEQ4alk5SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMC8/WERFQlVHX1NFU1NJT05fU1RBUlQ9cGhwc3Rvcm0iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753978260),
('xmMHEFrH3AnehteBB0EJzHyBECr0oOF0c4JUlNjm', NULL, '162.142.125.208', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVXBGMXJXVGJxOEtEcnl2SEphWHVIbVdSY1hYcFU2cFdVTEM0ZE5HdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1753939964),
('yC5CqrJgRNEaqnmwol1LzS2uIsf2PMZgmgiRW1Nu', NULL, '204.76.203.219', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.85 Safari/537.36 Edg/90.0.818.46', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiSWRjTHNVZkxQRkwxb1dScm1RWkFaWnRnYlF1bWFvWlVibzNoUkZhZCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1753954583),
('yVNTgVYsiIMGAwUNYOvyNtQAVmqhggzBycbvj3Fi', NULL, '64.62.197.167', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6.1 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTJqZWpDUDh3U0ZSQzBialA1ZGphUllLUmUwZ3gzRWFSbjlCaDlhMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMzkuNTkuMjUyLjEwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1754007338);

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