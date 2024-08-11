-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 5.7.33 - MySQL Community Server (GPL)
-- OS Server:                    Win64
-- HeidiSQL Versi:               11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk cashier
CREATE DATABASE IF NOT EXISTS `cashier` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cashier`;

-- membuang struktur untuk table cashier.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel cashier.cache: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;

-- membuang struktur untuk table cashier.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel cashier.cache_locks: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;

-- membuang struktur untuk table cashier.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `promo` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel cashier.categories: ~3 rows (lebih kurang)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
REPLACE INTO `categories` (`id`, `name`, `promo`, `created_at`, `updated_at`) VALUES
	(1, 'drink', 0, NULL, NULL),
	(2, 'food', 0, NULL, NULL),
	(3, 'promo', 1, NULL, NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- membuang struktur untuk table cashier.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel cashier.failed_jobs: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- membuang struktur untuk table cashier.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel cashier.jobs: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- membuang struktur untuk table cashier.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel cashier.job_batches: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;

-- membuang struktur untuk table cashier.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel cashier.migrations: ~11 rows (lebih kurang)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2024_08_05_125759_create_categories_table', 1),
	(5, '2024_08_05_143119_create_tables_table', 1),
	(6, '2024_08_05_143337_create_products_table', 1),
	(7, '2024_08_05_143651_create_promos_table', 1),
	(8, '2024_08_06_003907_create_orders_table', 1),
	(9, '2024_08_06_004608_create_order_details_table', 1),
	(10, '2024_08_08_020928_create_personal_access_tokens_table', 1),
	(11, '2024_08_08_130152_create_printers_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- membuang struktur untuk table cashier.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_table` bigint(20) unsigned NOT NULL,
  `total_price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_id_table_foreign` (`id_table`),
  CONSTRAINT `orders_id_table_foreign` FOREIGN KEY (`id_table`) REFERENCES `tables` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel cashier.orders: ~17 rows (lebih kurang)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
REPLACE INTO `orders` (`id`, `id_table`, `total_price`, `created_at`, `updated_at`) VALUES
	(14, 1, 56000, '2024-08-09 01:09:58', '2024-08-09 01:09:58'),
	(15, 1, 56000, '2024-08-09 01:21:02', '2024-08-09 01:21:02'),
	(16, 1, 56000, '2024-08-09 01:21:23', '2024-08-09 01:21:23'),
	(17, 1, 56000, '2024-08-09 01:27:19', '2024-08-09 01:27:19'),
	(18, 1, 56000, '2024-08-09 01:34:48', '2024-08-09 01:34:48'),
	(19, 1, 79000, '2024-08-09 01:37:36', '2024-08-09 01:37:36'),
	(20, 1, 107000, '2024-08-10 15:35:09', '2024-08-10 15:35:09'),
	(21, 1, 89000, '2024-08-10 15:50:47', '2024-08-10 15:50:47'),
	(22, 1, 89000, '2024-08-10 15:52:14', '2024-08-10 15:52:14'),
	(23, 1, 89000, '2024-08-10 15:55:13', '2024-08-10 15:55:13'),
	(24, 1, 95000, '2024-08-10 16:47:54', '2024-08-10 16:47:54'),
	(25, 1, 95000, '2024-08-10 16:49:40', '2024-08-10 16:49:40'),
	(26, 1, 95000, '2024-08-10 16:50:03', '2024-08-10 16:50:03'),
	(27, 1, 95000, '2024-08-10 17:14:54', '2024-08-10 17:14:54'),
	(28, 1, 95000, '2024-08-10 17:15:03', '2024-08-10 17:15:03'),
	(29, 1, 95000, '2024-08-10 17:29:37', '2024-08-10 17:29:37'),
	(30, 1, 89000, '2024-08-10 17:46:29', '2024-08-10 17:46:29');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- membuang struktur untuk table cashier.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_order` bigint(20) unsigned NOT NULL,
  `id_product` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_per_item` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_details_id_order_foreign` (`id_order`),
  KEY `order_details_id_product_foreign` (`id_product`),
  CONSTRAINT `order_details_id_order_foreign` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_details_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel cashier.order_details: ~60 rows (lebih kurang)
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
REPLACE INTO `order_details` (`id`, `id_order`, `id_product`, `quantity`, `price_per_item`, `created_at`, `updated_at`) VALUES
	(16, 21, 1, 1, 12000, '2024-08-10 15:50:47', '2024-08-10 15:50:47'),
	(17, 21, 7, 1, 2000, '2024-08-10 15:50:47', '2024-08-10 15:50:47'),
	(18, 21, 6, 1, 6000, '2024-08-10 15:50:47', '2024-08-10 15:50:47'),
	(19, 21, 11, 2, 23000, '2024-08-10 15:50:47', '2024-08-10 15:50:47'),
	(20, 21, 3, 1, 8000, '2024-08-10 15:50:47', '2024-08-10 15:50:47'),
	(21, 21, 8, 1, 15000, '2024-08-10 15:50:47', '2024-08-10 15:50:47'),
	(22, 22, 1, 1, 12000, '2024-08-10 15:52:14', '2024-08-10 15:52:14'),
	(23, 22, 7, 1, 2000, '2024-08-10 15:52:14', '2024-08-10 15:52:14'),
	(24, 22, 6, 1, 6000, '2024-08-10 15:52:14', '2024-08-10 15:52:14'),
	(25, 22, 11, 2, 23000, '2024-08-10 15:52:14', '2024-08-10 15:52:14'),
	(26, 22, 3, 1, 8000, '2024-08-10 15:52:14', '2024-08-10 15:52:14'),
	(27, 22, 8, 1, 15000, '2024-08-10 15:52:14', '2024-08-10 15:52:14'),
	(28, 23, 1, 1, 12000, '2024-08-10 15:55:13', '2024-08-10 15:55:13'),
	(29, 23, 7, 1, 2000, '2024-08-10 15:55:13', '2024-08-10 15:55:13'),
	(30, 23, 6, 1, 6000, '2024-08-10 15:55:13', '2024-08-10 15:55:13'),
	(31, 23, 11, 2, 23000, '2024-08-10 15:55:13', '2024-08-10 15:55:13'),
	(32, 23, 3, 1, 8000, '2024-08-10 15:55:13', '2024-08-10 15:55:13'),
	(33, 23, 8, 1, 15000, '2024-08-10 15:55:13', '2024-08-10 15:55:13'),
	(34, 24, 1, 1, 12000, '2024-08-10 16:47:54', '2024-08-10 16:47:54'),
	(35, 24, 7, 1, 2000, '2024-08-10 16:47:54', '2024-08-10 16:47:54'),
	(36, 24, 6, 2, 6000, '2024-08-10 16:47:54', '2024-08-10 16:47:54'),
	(37, 24, 11, 2, 23000, '2024-08-10 16:47:54', '2024-08-10 16:47:54'),
	(38, 24, 3, 1, 8000, '2024-08-10 16:47:54', '2024-08-10 16:47:54'),
	(39, 24, 8, 1, 15000, '2024-08-10 16:47:54', '2024-08-10 16:47:54'),
	(40, 25, 1, 1, 12000, '2024-08-10 16:49:40', '2024-08-10 16:49:40'),
	(41, 25, 7, 1, 2000, '2024-08-10 16:49:40', '2024-08-10 16:49:40'),
	(42, 25, 6, 2, 6000, '2024-08-10 16:49:40', '2024-08-10 16:49:40'),
	(43, 25, 11, 2, 23000, '2024-08-10 16:49:40', '2024-08-10 16:49:40'),
	(44, 25, 3, 1, 8000, '2024-08-10 16:49:40', '2024-08-10 16:49:40'),
	(45, 25, 8, 1, 15000, '2024-08-10 16:49:40', '2024-08-10 16:49:40'),
	(46, 26, 1, 1, 12000, '2024-08-10 16:50:03', '2024-08-10 16:50:03'),
	(47, 26, 7, 1, 2000, '2024-08-10 16:50:03', '2024-08-10 16:50:03'),
	(48, 26, 6, 2, 6000, '2024-08-10 16:50:03', '2024-08-10 16:50:03'),
	(49, 26, 11, 2, 23000, '2024-08-10 16:50:03', '2024-08-10 16:50:03'),
	(50, 26, 3, 1, 8000, '2024-08-10 16:50:03', '2024-08-10 16:50:03'),
	(51, 26, 8, 1, 15000, '2024-08-10 16:50:03', '2024-08-10 16:50:03'),
	(52, 27, 1, 1, 12000, '2024-08-10 17:14:54', '2024-08-10 17:14:54'),
	(53, 27, 7, 1, 2000, '2024-08-10 17:14:54', '2024-08-10 17:14:54'),
	(54, 27, 6, 2, 6000, '2024-08-10 17:14:54', '2024-08-10 17:14:54'),
	(55, 27, 11, 2, 23000, '2024-08-10 17:14:54', '2024-08-10 17:14:54'),
	(56, 27, 3, 1, 8000, '2024-08-10 17:14:54', '2024-08-10 17:14:54'),
	(57, 27, 8, 1, 15000, '2024-08-10 17:14:54', '2024-08-10 17:14:54'),
	(58, 28, 1, 1, 12000, '2024-08-10 17:15:03', '2024-08-10 17:15:03'),
	(59, 28, 7, 1, 2000, '2024-08-10 17:15:03', '2024-08-10 17:15:03'),
	(60, 28, 6, 2, 6000, '2024-08-10 17:15:03', '2024-08-10 17:15:03'),
	(61, 28, 11, 2, 23000, '2024-08-10 17:15:03', '2024-08-10 17:15:03'),
	(62, 28, 3, 1, 8000, '2024-08-10 17:15:03', '2024-08-10 17:15:03'),
	(63, 28, 8, 1, 15000, '2024-08-10 17:15:03', '2024-08-10 17:15:03'),
	(64, 29, 1, 1, 12000, '2024-08-10 17:29:37', '2024-08-10 17:29:37'),
	(65, 29, 7, 1, 2000, '2024-08-10 17:29:37', '2024-08-10 17:29:37'),
	(66, 29, 6, 2, 6000, '2024-08-10 17:29:37', '2024-08-10 17:29:37'),
	(67, 29, 11, 2, 23000, '2024-08-10 17:29:37', '2024-08-10 17:29:37'),
	(68, 29, 3, 1, 8000, '2024-08-10 17:29:37', '2024-08-10 17:29:37'),
	(69, 29, 8, 1, 15000, '2024-08-10 17:29:37', '2024-08-10 17:29:37'),
	(70, 30, 1, 1, 12000, '2024-08-10 17:46:29', '2024-08-10 17:46:29'),
	(71, 30, 7, 1, 2000, '2024-08-10 17:46:29', '2024-08-10 17:46:29'),
	(72, 30, 6, 1, 6000, '2024-08-10 17:46:29', '2024-08-10 17:46:29'),
	(73, 30, 11, 2, 23000, '2024-08-10 17:46:29', '2024-08-10 17:46:29'),
	(74, 30, 3, 1, 8000, '2024-08-10 17:46:29', '2024-08-10 17:46:29'),
	(75, 30, 8, 1, 15000, '2024-08-10 17:46:29', '2024-08-10 17:46:29');
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;

-- membuang struktur untuk table cashier.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel cashier.password_reset_tokens: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;

-- membuang struktur untuk table cashier.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
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

-- Membuang data untuk tabel cashier.personal_access_tokens: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- membuang struktur untuk table cashier.printers
CREATE TABLE IF NOT EXISTS `printers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_category` bigint(20) unsigned DEFAULT NULL,
  `bill` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel cashier.printers: ~3 rows (lebih kurang)
/*!40000 ALTER TABLE `printers` DISABLE KEYS */;
REPLACE INTO `printers` (`id`, `name`, `id_category`, `bill`, `created_at`, `updated_at`) VALUES
	(1, 'Printer A (Kasir)', NULL, 1, NULL, NULL),
	(2, 'Printer B (Bar)', 1, 0, NULL, NULL),
	(3, 'Printer C (Dapur)', 2, 0, NULL, NULL);
/*!40000 ALTER TABLE `printers` ENABLE KEYS */;

-- membuang struktur untuk table cashier.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint(20) NOT NULL,
  `id_category` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_id_category_foreign` (`id_category`),
  CONSTRAINT `products_id_category_foreign` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel cashier.products: ~11 rows (lebih kurang)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
REPLACE INTO `products` (`id`, `name`, `price`, `id_category`, `created_at`, `updated_at`) VALUES
	(1, 'Jeruk Dingin', 12000, 1, NULL, NULL),
	(2, 'Jeruk Panas', 10000, 1, NULL, NULL),
	(3, 'Teh Manis', 8000, 1, NULL, NULL),
	(4, 'Teh Tawar', 5000, 1, NULL, NULL),
	(5, 'Kopi Dingin', 8000, 1, NULL, NULL),
	(6, 'Kopi Panas', 6000, 1, NULL, NULL),
	(7, 'Extra Es Batu', 2000, 1, NULL, NULL),
	(8, 'Mie Goreng', 15000, 2, NULL, NULL),
	(9, 'Mie Kuah', 15000, 2, NULL, NULL),
	(10, 'Nasi Goreng', 15000, 2, NULL, NULL),
	(11, 'Nasi Goreng + Jeruk', 23000, 3, '2024-08-08 13:23:49', '2024-08-08 13:23:49');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- membuang struktur untuk table cashier.promos
CREATE TABLE IF NOT EXISTS `promos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_promo` bigint(20) unsigned NOT NULL,
  `id_product` bigint(20) unsigned NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promos_id_promo_foreign` (`id_promo`),
  KEY `promos_id_product_foreign` (`id_product`),
  CONSTRAINT `promos_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`),
  CONSTRAINT `promos_id_promo_foreign` FOREIGN KEY (`id_promo`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel cashier.promos: ~2 rows (lebih kurang)
/*!40000 ALTER TABLE `promos` DISABLE KEYS */;
REPLACE INTO `promos` (`id`, `id_promo`, `id_product`, `quantity`, `created_at`, `updated_at`) VALUES
	(1, 11, 10, 1, '2024-08-08 13:23:49', '2024-08-08 13:23:49'),
	(2, 11, 1, 1, '2024-08-08 13:23:49', '2024-08-08 13:23:49');
/*!40000 ALTER TABLE `promos` ENABLE KEYS */;

-- membuang struktur untuk table cashier.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel cashier.sessions: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- membuang struktur untuk table cashier.tables
CREATE TABLE IF NOT EXISTS `tables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel cashier.tables: ~3 rows (lebih kurang)
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
REPLACE INTO `tables` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(1, 'Meja 1', NULL, NULL),
	(2, 'Meja 2', NULL, NULL),
	(3, 'Meja 3', NULL, NULL);
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;

-- membuang struktur untuk table cashier.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Membuang data untuk tabel cashier.users: ~0 rows (lebih kurang)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
