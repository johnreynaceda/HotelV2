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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `expense_category_id` bigint unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'ALMA RESIDENCES GENSAN', 'Brgy. 1, Gensan, South Cotabato', '12345', NULL, 24, '200.00', 1, '50.00', '2025-06-30 11:51:44', '2025-06-30 11:51:44');
















INSERT INTO `extension_rates` (`id`, `branch_id`, `hour`, `amount`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 100, '2025-06-30 11:51:47', '2025-06-30 11:51:47');
INSERT INTO `extension_rates` (`id`, `branch_id`, `hour`, `amount`, `created_at`, `updated_at`) VALUES
(2, 1, 12, 200, '2025-06-30 11:51:47', '2025-06-30 11:51:47');
INSERT INTO `extension_rates` (`id`, `branch_id`, `hour`, `amount`, `created_at`, `updated_at`) VALUES
(3, 1, 18, 400, '2025-06-30 11:51:47', '2025-06-30 11:51:47');
INSERT INTO `extension_rates` (`id`, `branch_id`, `hour`, `amount`, `created_at`, `updated_at`) VALUES
(4, 1, 24, 500, '2025-06-30 11:51:47', '2025-06-30 11:51:47');



INSERT INTO `floors` (`id`, `branch_id`, `number`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2025-06-30 11:51:44', '2025-06-30 11:51:44');
INSERT INTO `floors` (`id`, `branch_id`, `number`, `created_at`, `updated_at`) VALUES
(2, 1, 2, '2025-06-30 11:51:44', '2025-06-30 11:51:44');
INSERT INTO `floors` (`id`, `branch_id`, `number`, `created_at`, `updated_at`) VALUES
(3, 1, 3, '2025-06-30 11:51:44', '2025-06-30 11:51:44');
INSERT INTO `floors` (`id`, `branch_id`, `number`, `created_at`, `updated_at`) VALUES
(4, 1, 4, '2025-06-30 11:51:44', '2025-06-30 11:51:44'),
(5, 1, 5, '2025-06-30 11:51:44', '2025-06-30 11:51:44');







INSERT INTO `frontdesks` (`id`, `branch_id`, `name`, `number`, `created_at`, `updated_at`) VALUES
(1, 1, 'frontdesk', '1', '2025-06-30 11:53:42', '2025-06-30 11:53:42');


INSERT INTO `guests` (`id`, `branch_id`, `name`, `contact`, `qr_code`, `room_id`, `previous_room_id`, `rate_id`, `type_id`, `static_amount`, `is_long_stay`, `number_of_days`, `has_discount`, `discount_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 'test', 'N/A', '1250001', 88, NULL, 2, 1, 336, 0, 0, 0, NULL, '2025-06-30 11:56:47', '2025-06-30 11:56:47');


INSERT INTO `hotel_items` (`id`, `branch_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'MAIN DOOR', 5000, '2025-06-30 11:51:46', '2025-06-30 11:51:46');
INSERT INTO `hotel_items` (`id`, `branch_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(2, 1, 'PURTAHAN SA C.R.', 2500, '2025-06-30 11:51:46', '2025-06-30 11:51:46');
INSERT INTO `hotel_items` (`id`, `branch_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(3, 1, 'SUGA SA ROOM', 150, '2025-06-30 11:51:46', '2025-06-30 11:51:46');
INSERT INTO `hotel_items` (`id`, `branch_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(4, 1, 'SUGA SA C.R.', 130, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(5, 1, 'SAMIN SULOD SA ROOM', 1000, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(6, 1, 'SAMIN SULOD SA C.R.', 1000, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(7, 1, 'SAMIN SA GAWAS', 1500, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(8, 1, 'SALOG SA ROOM PER TILES', 1200, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(9, 1, 'SALOG SA C.R. PER TILE', 1200, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(10, 1, 'RUG/ TRAPO SA SALOG', 40, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(11, 1, 'UNLAN', 500, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(12, 1, 'HABOL', 500, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(13, 1, 'PUNDA', 200, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(14, 1, 'PUNDA WITH MANTSA(HAIR DYE)', 500, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(15, 1, 'BEDSHEET WITH INK', 500, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(16, 1, 'BED PAD WITH INK', 800, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(17, 1, 'BED SKIRT WITH INK', 1500, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(18, 1, 'TOWEL', 300, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(19, 1, 'DOORKNOB C.R.', 350, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(20, 1, 'MAIN DOOR DOORKNOB', 500, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(21, 1, 'T.V.', 30000, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(22, 1, 'TELEPHONE', 1000, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(23, 1, 'DECODER PARA SA CABLE', 1600, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(24, 1, 'CORD SA DECODER', 100, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(25, 1, 'CHARGER SA DECODER', 400, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(26, 1, 'WIRING SA TELEPHONE', 100, '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(27, 1, 'WIRINGS SA T.V.', 200, '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(28, 1, 'WIRING SA DECODER', 50, '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(29, 1, 'CEILING', 0, '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(30, 1, 'SHOWER HEAD', 800, '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(31, 1, 'SHOWER BULB', 800, '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(32, 1, 'BIDET', 400, '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(33, 1, 'HINGES/ TOWEL BAR', 200, '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(34, 1, 'TAKLOB SA TANGKE', 1200, '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(35, 1, 'TANGKE SA BOWL', 3000, '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(36, 1, 'TAKLOB SA BOWL', 1000, '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(37, 1, 'ILALOM SA LABABO', 0, '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(38, 1, 'SINK/LABABO', 1500, '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(39, 1, 'BASURAHAN', 70, '2025-06-30 11:51:47', '2025-06-30 11:51:47');









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
(51, '2025_06_24_102431_add_column_has_discount_to_rates_table', 1);



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















INSERT INTO `rates` (`id`, `branch_id`, `staying_hour_id`, `type_id`, `amount`, `is_available`, `has_discount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 224, 1, 0, '2025-06-30 11:51:47', '2025-06-30 11:51:47');
INSERT INTO `rates` (`id`, `branch_id`, `staying_hour_id`, `type_id`, `amount`, `is_available`, `has_discount`, `created_at`, `updated_at`) VALUES
(2, 1, 2, 1, 336, 1, 0, '2025-06-30 11:51:47', '2025-06-30 11:51:47');
INSERT INTO `rates` (`id`, `branch_id`, `staying_hour_id`, `type_id`, `amount`, `is_available`, `has_discount`, `created_at`, `updated_at`) VALUES
(3, 1, 4, 1, 560, 1, 0, '2025-06-30 11:51:47', '2025-06-30 11:51:47');
INSERT INTO `rates` (`id`, `branch_id`, `staying_hour_id`, `type_id`, `amount`, `is_available`, `has_discount`, `created_at`, `updated_at`) VALUES
(4, 1, 1, 2, 280, 1, 0, '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(5, 1, 2, 2, 392, 1, 1, '2025-06-30 11:51:47', '2025-06-30 11:54:09'),
(6, 1, 4, 2, 616, 1, 1, '2025-06-30 11:51:47', '2025-06-30 11:54:13'),
(7, 1, 1, 3, 336, 1, 0, '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(8, 1, 2, 3, 448, 1, 1, '2025-06-30 11:51:47', '2025-06-30 11:54:17'),
(9, 1, 4, 3, 672, 1, 1, '2025-06-30 11:51:47', '2025-06-30 11:54:20');

INSERT INTO `requestable_items` (`id`, `branch_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(1, 1, 'EXTRA PERSON WITH FREE PILLOW, BLANKET,TOWEL', 100, '2025-06-30 11:51:47', '2025-06-30 11:51:47');
INSERT INTO `requestable_items` (`id`, `branch_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(2, 1, 'EXTRA PILLOW', 20, '2025-06-30 11:51:47', '2025-06-30 11:51:47');
INSERT INTO `requestable_items` (`id`, `branch_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(3, 1, 'EXTRA TOWEL', 20, '2025-06-30 11:51:47', '2025-06-30 11:51:47');
INSERT INTO `requestable_items` (`id`, `branch_id`, `name`, `price`, `created_at`, `updated_at`) VALUES
(4, 1, 'EXTRA BLANKET', 20, '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(5, 1, 'EXTRA FITTED SHEET', 20, '2025-06-30 11:51:47', '2025-06-30 11:51:47');



INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'web', '2025-06-30 11:51:44', '2025-06-30 11:51:44');
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(2, 'admin', 'web', '2025-06-30 11:51:44', '2025-06-30 11:51:44');
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(3, 'frontdesk', 'web', '2025-06-30 11:51:44', '2025-06-30 11:51:44');
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(4, 'roomboy', 'web', '2025-06-30 11:51:44', '2025-06-30 11:51:44'),
(5, 'kitchen', 'web', '2025-06-30 11:51:44', '2025-06-30 11:51:44'),
(6, 'kiosk', 'web', '2025-06-30 11:51:44', '2025-06-30 11:51:44'),
(7, 'back_office', 'web', '2025-06-30 11:51:44', '2025-06-30 11:51:44'),
(8, 'pub_kitchen', 'web', '2025-06-30 11:51:47', '2025-06-30 11:51:47');



INSERT INTO `rooms` (`id`, `branch_id`, `floor_id`, `number`, `area`, `status`, `type_id`, `is_priority`, `last_checkin_at`, `last_checkout_at`, `time_to_terminate_queue`, `check_out_time`, `time_to_clean`, `started_cleaning_at`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1', 'Main', 'Available', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:44', '2025-06-30 11:53:52');
INSERT INTO `rooms` (`id`, `branch_id`, `floor_id`, `number`, `area`, `status`, `type_id`, `is_priority`, `last_checkin_at`, `last_checkout_at`, `time_to_terminate_queue`, `check_out_time`, `time_to_clean`, `started_cleaning_at`, `created_at`, `updated_at`) VALUES
(2, 1, 1, '10', 'Main', 'Available', 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:44', '2025-06-30 11:53:52');
INSERT INTO `rooms` (`id`, `branch_id`, `floor_id`, `number`, `area`, `status`, `type_id`, `is_priority`, `last_checkin_at`, `last_checkout_at`, `time_to_terminate_queue`, `check_out_time`, `time_to_clean`, `started_cleaning_at`, `created_at`, `updated_at`) VALUES
(3, 1, 1, '11', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:44', '2025-06-30 11:53:56');
INSERT INTO `rooms` (`id`, `branch_id`, `floor_id`, `number`, `area`, `status`, `type_id`, `is_priority`, `last_checkin_at`, `last_checkout_at`, `time_to_terminate_queue`, `check_out_time`, `time_to_clean`, `started_cleaning_at`, `created_at`, `updated_at`) VALUES
(4, 1, 1, '12', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:44', '2025-06-30 11:51:44'),
(5, 1, 1, '14', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:44', '2025-06-30 11:51:44'),
(6, 1, 1, '15', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(7, 1, 1, '16', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(8, 1, 1, '17', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(9, 1, 1, '18', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(10, 1, 1, '19', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(11, 1, 1, '2', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(12, 1, 1, '20', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(13, 1, 1, '21', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(14, 1, 1, '22', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(15, 1, 1, '23', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(16, 1, 1, '24', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(17, 1, 1, '25', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(18, 1, 1, '26', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(19, 1, 1, '27', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(20, 1, 1, '28', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(21, 1, 1, '29', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(22, 1, 1, '3', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(23, 1, 1, '30', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(24, 1, 1, '31', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(25, 1, 1, '32', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(26, 1, 1, '33', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(27, 1, 1, '34', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(28, 1, 1, '35', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(29, 1, 1, '36', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(30, 1, 1, '37', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(31, 1, 1, '38', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(32, 1, 1, '39', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(33, 1, 1, '4', 'Main', 'Available', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(34, 1, 1, '5', 'Main', 'Available', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(35, 1, 1, '50', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(36, 1, 1, '51', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(37, 1, 1, '52', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(38, 1, 1, '53', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(39, 1, 1, '6', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(40, 1, 1, '7', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(41, 1, 1, '8', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(42, 1, 1, '9', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(43, 1, 2, '100', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(44, 1, 2, '101', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(45, 1, 2, '60', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(46, 1, 2, '61', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(47, 1, 2, '62', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(48, 1, 2, '63', 'Main', 'Available', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(49, 1, 2, '64', 'Main', 'Available', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(50, 1, 2, '65', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(51, 1, 2, '66', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(52, 1, 2, '67', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(53, 1, 2, '68', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(54, 1, 2, '69', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(55, 1, 2, '70', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(56, 1, 2, '71', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(57, 1, 2, '72', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(58, 1, 2, '73', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(59, 1, 2, '74', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(60, 1, 2, '75', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(61, 1, 2, '76', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(62, 1, 2, '77', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(63, 1, 2, '78', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(64, 1, 2, '79', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(65, 1, 2, '80', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(66, 1, 2, '81', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(67, 1, 2, '82', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(68, 1, 2, '83', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(69, 1, 2, '84', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(70, 1, 2, '85', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(71, 1, 2, '86', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(72, 1, 2, '87', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(73, 1, 2, '88', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(74, 1, 2, '89', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(75, 1, 2, '90', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(76, 1, 2, '91', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(77, 1, 2, '92', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(78, 1, 2, '93', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(79, 1, 2, '94', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(80, 1, 2, '95', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(81, 1, 2, '96', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(82, 1, 2, '97', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(83, 1, 2, '98', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(84, 1, 2, '99', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(85, 1, 3, '120', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(86, 1, 3, '121', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(87, 1, 3, '122', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(88, 1, 3, '123', 'Main', 'Available', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:53:49'),
(89, 1, 3, '124', 'Main', 'Available', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:53:50'),
(90, 1, 3, '125', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(91, 1, 3, '126', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(92, 1, 3, '127', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(93, 1, 3, '128', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(94, 1, 3, '129', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(95, 1, 3, '130', 'Main', 'Available', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:53:56'),
(96, 1, 3, '131', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(97, 1, 3, '132', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(98, 1, 3, '133', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(99, 1, 3, '134', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(100, 1, 3, '135', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(101, 1, 3, '136', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(102, 1, 3, '137', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(103, 1, 3, '138', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(104, 1, 3, '139', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(105, 1, 3, '150', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(106, 1, 3, '151', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(107, 1, 3, '152', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(108, 1, 3, '153', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(109, 1, 3, '154', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(110, 1, 3, '155', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(111, 1, 3, '156', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(112, 1, 3, '157', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(113, 1, 3, '158', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(114, 1, 3, '159', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(115, 1, 3, '160', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(116, 1, 3, '161', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(117, 1, 3, '162', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(118, 1, 3, '163', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(119, 1, 3, '164', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(120, 1, 3, '165', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(121, 1, 3, '166', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:45', '2025-06-30 11:51:45'),
(122, 1, 3, '167', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(123, 1, 3, '168', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(124, 1, 3, '169', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(125, 1, 3, '170', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(126, 1, 3, '171', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(127, 1, 4, '200', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(128, 1, 4, '201', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(129, 1, 4, '202', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(130, 1, 4, '203', 'Main', 'Available', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(131, 1, 4, '204', 'Main', 'Available', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(132, 1, 4, '205', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(133, 1, 4, '206', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(134, 1, 4, '207', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(135, 1, 4, '208', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(136, 1, 4, '209', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(137, 1, 4, '210', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(138, 1, 4, '211', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(139, 1, 4, '212', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(140, 1, 4, '214', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(141, 1, 4, '215', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(142, 1, 4, '216', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(143, 1, 4, '217', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(144, 1, 4, '218', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(145, 1, 4, '219', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(146, 1, 4, '220', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(147, 1, 4, '221', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(148, 1, 4, '222', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(149, 1, 4, '223', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(150, 1, 4, '224', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(151, 1, 4, '225', 'Main', 'Available', 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(152, 1, 4, '226', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(153, 1, 4, '227', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(154, 1, 4, '228', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(155, 1, 4, '229', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(156, 1, 4, '230', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(157, 1, 4, '231', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(158, 1, 4, '232', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(159, 1, 4, '233', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(160, 1, 4, '234', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(161, 1, 4, '235', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(162, 1, 4, '236', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(163, 1, 4, '237', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(164, 1, 4, '238', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(165, 1, 4, '239', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(166, 1, 4, '250', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(167, 1, 4, '251', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(168, 1, 5, '253', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(169, 1, 5, '254', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(170, 1, 5, '255', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(171, 1, 5, '256', 'Main', 'Available', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(172, 1, 5, '257', 'Main', 'Available', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(173, 1, 5, '258', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(174, 1, 5, '259', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(175, 1, 5, '260', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(176, 1, 5, '261', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(177, 1, 5, '262', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(178, 1, 5, '263', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(179, 1, 5, '264', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(180, 1, 5, '265', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(181, 1, 5, '266', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(182, 1, 5, '267', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(183, 1, 5, '268', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(184, 1, 5, '269', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(185, 1, 5, '270', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(186, 1, 5, '271', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(187, 1, 5, '272', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(188, 1, 5, '273', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(189, 1, 5, '274', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(190, 1, 5, '275', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(191, 1, 5, '276', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(192, 1, 5, '277', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(193, 1, 5, '278', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(194, 1, 5, '279', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(195, 1, 5, '280', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(196, 1, 5, '281', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(197, 1, 5, '282', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(198, 1, 5, '283', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(199, 1, 5, '284', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(200, 1, 5, '285', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(201, 1, 5, '286', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(202, 1, 5, '287', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(203, 1, 5, '288', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(204, 1, 5, '289', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46'),
(205, 1, 5, '290', 'Main', 'Available', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46');
INSERT INTO `rooms` (`id`, `branch_id`, `floor_id`, `number`, `area`, `status`, `type_id`, `is_priority`, `last_checkin_at`, `last_checkout_at`, `time_to_terminate_queue`, `check_out_time`, `time_to_clean`, `started_cleaning_at`, `created_at`, `updated_at`) VALUES
(206, 1, 5, '294', 'Main', 'Available', 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:46', '2025-06-30 11:51:46');

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('G0OnUjIiY3c4IWeSqEm7SOKp7mwvKPsuUCYBu4iL', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiZzMyRkdtOHY5TGxSbDNjREVNM1JtaUc3TjlPVUdCQ1p1MnRiZ3pEOCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9mcm9udGRlc2svY2hlY2staW4tZnJvbS1raW9zay8xIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MztzOjIxOiJwYXNzd29yZF9oYXNoX3NhbmN0dW0iO3M6NjA6IiQyeSQxMCQubktqYkxMNS4zdGd5Nkw0a3VGWTZ1dnpVUm9IM2xVOFQ0LmRzS0VLUDNsWmNQS2NvQlNJQyI7fQ==', 1751260431);


INSERT INTO `shift_logs` (`id`, `time_in`, `time_out`, `frontdesk_ids`, `created_at`, `updated_at`) VALUES
(1, '2025-06-30 11:58:26', NULL, '[1, \"2\"]', '2025-06-30 11:58:26', '2025-06-30 11:58:26');




INSERT INTO `staying_hours` (`id`, `branch_id`, `number`, `created_at`, `updated_at`) VALUES
(1, 1, 6, '2025-06-30 11:51:44', '2025-06-30 11:51:44');
INSERT INTO `staying_hours` (`id`, `branch_id`, `number`, `created_at`, `updated_at`) VALUES
(2, 1, 12, '2025-06-30 11:51:44', '2025-06-30 11:51:44');
INSERT INTO `staying_hours` (`id`, `branch_id`, `number`, `created_at`, `updated_at`) VALUES
(3, 1, 18, '2025-06-30 11:51:44', '2025-06-30 11:51:44');
INSERT INTO `staying_hours` (`id`, `branch_id`, `number`, `created_at`, `updated_at`) VALUES
(4, 1, 24, '2025-06-30 11:51:44', '2025-06-30 11:51:44');

INSERT INTO `temporary_check_in_kiosks` (`id`, `branch_id`, `room_id`, `guest_id`, `terminated_at`, `created_at`, `updated_at`) VALUES
(1, 1, 88, 1, '2025-06-30 12:16:47', '2025-06-30 11:56:47', '2025-06-30 11:56:47');




INSERT INTO `transaction_types` (`id`, `name`, `position`, `created_at`, `updated_at`) VALUES
(1, 'Check In', '1', '2025-06-30 11:51:47', '2025-06-30 11:51:47');
INSERT INTO `transaction_types` (`id`, `name`, `position`, `created_at`, `updated_at`) VALUES
(2, 'Deposit', '2', '2025-06-30 11:51:47', '2025-06-30 11:51:47');
INSERT INTO `transaction_types` (`id`, `name`, `position`, `created_at`, `updated_at`) VALUES
(3, 'Kitchen Order', '3', '2025-06-30 11:51:47', '2025-06-30 11:51:47');
INSERT INTO `transaction_types` (`id`, `name`, `position`, `created_at`, `updated_at`) VALUES
(4, 'Damage Charges', '4', '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(5, 'Cashout', '5', '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(6, 'Extend', '6', '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(7, 'Transfer Room', '7', '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(8, 'Amenities', '8', '2025-06-30 11:51:47', '2025-06-30 11:51:47'),
(9, 'Food and Beverages', '8', '2025-06-30 11:51:47', '2025-06-30 11:51:47');



INSERT INTO `types` (`id`, `branch_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Single size Bed', NULL, '2025-06-30 11:51:44', '2025-06-30 11:51:44');
INSERT INTO `types` (`id`, `branch_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(2, 1, ' Double size Bed', NULL, '2025-06-30 11:51:44', '2025-06-30 11:51:44');
INSERT INTO `types` (`id`, `branch_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(3, 1, 'Twin size Bed', NULL, '2025-06-30 11:51:44', '2025-06-30 11:51:44');



INSERT INTO `users` (`id`, `branch_id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `branch_name`, `remember_token`, `current_team_id`, `roomboy_assigned_floor_id`, `roomboy_cleaning_room_id`, `profile_photo_path`, `assigned_frontdesks`, `time_in`, `created_at`, `updated_at`) VALUES
(1, 1, 'Superadmin', 'superadmin@gmail.com', NULL, '$2y$10$P5tohUDF6wi6KytQJOW89edUkT.ppEtnIWJp31Pk0vxwiGALLzJ4y', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:44', '2025-06-30 11:51:44');
INSERT INTO `users` (`id`, `branch_id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `branch_name`, `remember_token`, `current_team_id`, `roomboy_assigned_floor_id`, `roomboy_cleaning_room_id`, `profile_photo_path`, `assigned_frontdesks`, `time_in`, `created_at`, `updated_at`) VALUES
(2, 1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$PWa7AXhC71G8Maa2sUwoYOKpboPmDymmF.wMz8JYftZ.rDwvbySK6', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:44', '2025-06-30 11:51:44');
INSERT INTO `users` (`id`, `branch_id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `branch_name`, `remember_token`, `current_team_id`, `roomboy_assigned_floor_id`, `roomboy_cleaning_room_id`, `profile_photo_path`, `assigned_frontdesks`, `time_in`, `created_at`, `updated_at`) VALUES
(3, 1, 'Frontdesk', 'frontdesk@gmail.com', NULL, '$2y$10$.nKjbLL5.3tgy6L4kuFY6uvzURoH3lU8T4.dsKEKP3lZcPKcoBSIC', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, '\"[1,\\\"2\\\"]\"', '2025-06-30 11:58:26', '2025-06-30 11:51:44', '2025-06-30 11:58:26');
INSERT INTO `users` (`id`, `branch_id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `branch_name`, `remember_token`, `current_team_id`, `roomboy_assigned_floor_id`, `roomboy_cleaning_room_id`, `profile_photo_path`, `assigned_frontdesks`, `time_in`, `created_at`, `updated_at`) VALUES
(4, 1, 'Kiosk', 'kiosk@gmail.com', NULL, '$2y$10$uSg9AqOui75.eESR58sf5uKMCLEbviLfcDVR53C.zyPZGd6Clmee.', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:44', '2025-06-30 11:51:44'),
(5, 1, 'Kitchen', 'kitchen@gmail.com', NULL, '$2y$10$gpt/CjZgtK3jnJDxUpHEOOEgp5pJyU4qHP.Q.pSsvfCFqNnTeIYpG', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:44', '2025-06-30 11:51:44'),
(6, 1, 'Back Office', 'back-office@gmail.com', NULL, '$2y$10$YCqi7Tv8JbQ2U9n3xXIlOe/mSCQ6HUASibBc0qIz0kLGrhfah5xdG', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:44', '2025-06-30 11:51:44'),
(7, 1, 'Roomboy', 'roomboy@gmail.com', NULL, '$2y$10$sQauFMdaBiXCOi5zvtCZOunoxHsQFe9kOe8ZbTeOrb5l8AtehNU2S', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:44', '2025-06-30 11:51:44'),
(8, 1, 'PUB Kitchen', 'pub-kitchen@gmail.com', NULL, '$2y$10$kpHwiSswapOAyLfmwT06S.dRTq2Fucssl7a1/tZpj5Of8JyRDNJAy', NULL, NULL, NULL, 'ALMA RESIDENCES GENSAN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-30 11:51:47', '2025-06-30 11:51:47');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;