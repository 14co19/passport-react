-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 15, 2022 at 12:40 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `transactions` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credited` bigint(20) UNSIGNED DEFAULT NULL,
  `debited` bigint(20) UNSIGNED DEFAULT NULL,
  `balance` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `user_id`, `transactions`, `credited`, `debited`, `balance`, `created_at`, `updated_at`) VALUES
(1, 2, 'test', 1000, NULL, 1000, '2022-02-15 04:51:25', '2022-02-15 04:51:25'),
(4, 2, 'test', 1000, NULL, 2000, '2022-02-15 04:59:11', '2022-02-15 04:59:11'),
(5, 2, 'test', 1000, NULL, 3000, '2022-02-15 05:00:05', '2022-02-15 05:00:05'),
(6, 2, 'test', 1000, NULL, 4000, '2022-02-15 05:01:35', '2022-02-15 05:01:35'),
(7, 2, 'again test', 1000, NULL, 5000, '2022-02-15 05:26:06', '2022-02-15 05:26:06'),
(8, 2, 'Test again', 235, NULL, 5235, '2022-02-15 05:27:55', '2022-02-15 05:27:55'),
(9, 2, 'test', 100, NULL, 5335, '2022-02-15 05:28:47', '2022-02-15 05:28:47'),
(10, 2, 'test', 100, NULL, 5435, '2022-02-15 05:29:24', '2022-02-15 05:29:24'),
(12, 2, 'test', NULL, 1000, 4435, '2022-02-15 05:36:46', '2022-02-15 05:36:46'),
(13, 2, 'to buy a watch', NULL, 1000, 3435, '2022-02-15 05:37:28', '2022-02-15 05:37:28');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2022_02_13_154502_create_accounts_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0637a2836509a5d3856e7a904253eb9d963c958bb1a5c86cfefe69de618cda078561dedc5a950739', 1, 2, NULL, '[]', 0, '2022-02-14 08:20:36', '2022-02-14 08:20:36', '2022-02-15 13:50:36'),
('0970e5b905145480f903245256aa6bcc000780f03a7389a591efe2210e04f7a8e092d63d19a8a5b9', 1, 2, NULL, '[]', 0, '2022-02-14 09:11:44', '2022-02-14 09:11:44', '2022-02-15 14:41:44'),
('145c4fbebf5095743edaad4196b4ef3a1fb414da72be23545bd814c23ac049174c6878e90b4256d3', 1, 2, NULL, '[]', 0, '2022-02-14 10:20:57', '2022-02-14 10:20:57', '2022-02-15 15:50:57'),
('1ecb9ebf93e3a46947b255f98597d5e3ec361e866832d4df8e77e1a8439cb59f91ac6233be8a0511', 1, 2, NULL, '[]', 0, '2022-02-15 00:47:42', '2022-02-15 00:47:42', '2022-02-16 06:17:42'),
('2dcfac85d1f915c19852455a03bdbd8eab7a671441b04190b71539e189f855044db4c452afb72a11', 1, 2, NULL, '[]', 0, '2022-02-14 09:28:40', '2022-02-14 09:28:40', '2022-02-15 14:58:40'),
('2ff43d9277dd62d692f188a49d82cfbc7f1d0aa97034c0cb8d6d5b67e5dd7873e060282f6fa5b0a2', 2, 2, NULL, '[]', 0, '2022-02-14 08:19:20', '2022-02-14 08:19:20', '2022-02-15 13:49:20'),
('321cd079554a367559a07fb3d27510465e856ff934fb754debd94d2559b103da9b6de2d006590942', 1, 2, NULL, '[]', 0, '2022-02-13 13:45:44', '2022-02-13 13:45:44', '2022-02-14 19:15:44'),
('379e4d699f81dcbf592be6372b1f340752ea59caa90190de983a7364ebd3abee59c3ff14ec62e282', 1, 2, NULL, '[]', 0, '2022-02-13 13:42:40', '2022-02-13 13:42:40', '2022-02-14 19:12:40'),
('3d73ed5c3d8ce1dc5bbaa96ebd96487e04d5622ec39c947f629532dff4eaf55104cf37c921703cbe', 2, 2, NULL, '[]', 0, '2022-02-15 01:40:00', '2022-02-15 01:40:00', '2022-02-16 07:10:00'),
('473e0b42cd5d07f8dc6719c8a83205c8109894bc63458a8c65ce8c6f9aa65c62a5dd7fcc86a9d6f5', 1, 2, NULL, '[]', 0, '2022-02-14 10:19:39', '2022-02-14 10:19:39', '2022-02-15 15:49:39'),
('47f28d30b4a70a4260cfaecbb53cedca900d560863295536bf444ee461df1eff4d19f8f7ae09d72d', 1, 2, NULL, '[]', 0, '2022-02-15 00:56:10', '2022-02-15 00:56:10', '2022-02-16 06:26:10'),
('492e3d9b81e138ed561dd57b51939fc38f8e1b0056ed2e2b902b25d129189374eb7a39685108d952', 1, 2, NULL, '[]', 0, '2022-02-14 09:26:57', '2022-02-14 09:26:57', '2022-02-15 14:56:57'),
('4c6102dbdbe7336c177ce924766f7f2f6e449fb97fadee53973f97792214e3ef7d3bd46a72411757', 1, 2, NULL, '[]', 0, '2022-02-14 09:21:30', '2022-02-14 09:21:30', '2022-02-15 14:51:30'),
('557faada518b863e9a1be9703428f26526faa9ceacb351da33faaf39e648e88493a295096e284ceb', 2, 2, NULL, '[]', 0, '2022-02-14 08:19:06', '2022-02-14 08:19:06', '2022-02-15 13:49:06'),
('5bde01feb1949cc13fb36aadc0f7d3bde6cda445eb1db9dfb4792e49b2f8972b269834dfb5a65875', 1, 2, NULL, '[]', 0, '2022-02-14 04:29:17', '2022-02-14 04:29:17', '2022-02-15 09:59:17'),
('64141056c26a2624cd88f1a2d937e24a8729379d46b28203e56549514f19c203f4078042a3bc613c', 1, 2, NULL, '[]', 0, '2022-02-14 09:19:05', '2022-02-14 09:19:05', '2022-02-15 14:49:05'),
('69724663c90488917f71e1b0c0624460791cc3884241e5746afb21f477dac6a622e8c5fd6ffcaa3d', 1, 2, NULL, '[]', 0, '2022-02-15 05:37:54', '2022-02-15 05:37:54', '2022-02-16 11:07:54'),
('69a3afb203c93fb3490d031a1f679c27dd56848f0417acd11aac13148c1c1cd04d1bff7cf5acc72c', 1, 2, NULL, '[]', 0, '2022-02-14 09:24:21', '2022-02-14 09:24:21', '2022-02-15 14:54:21'),
('71ce0eb6cc692afce526a7a7d780bb6dffb845087ca58947e3c0a876d77fc77b5c12d144138fdc50', 1, 2, NULL, '[]', 0, '2022-02-14 09:28:11', '2022-02-14 09:28:11', '2022-02-15 14:58:11'),
('753be7141480f31a88c31d655376a51e83829764e975f05608bfe64e4640f9dd242ea508cb0b6ea8', 1, 2, NULL, '[]', 0, '2022-02-15 01:12:34', '2022-02-15 01:12:34', '2022-02-16 06:42:34'),
('7702716ef67d02e309e9060edd93394b37f781f84ddaf702021c80a315c57e9bc765ca1234cd306a', 1, 2, NULL, '[]', 0, '2022-02-14 12:13:49', '2022-02-14 12:13:49', '2022-02-15 17:43:49'),
('77938aaf0e79593359172a8cea47199ee29ea673c8e2593588d216f49bb07ae1089f136782e075b3', 1, 2, NULL, '[]', 0, '2022-02-14 09:30:10', '2022-02-14 09:30:10', '2022-02-15 15:00:10'),
('79ac455d13f8e6392127e3a76264a6b60ed128d1b32cfaa5ff72cb50c5275f659f55d7bb17cbf761', 1, 2, NULL, '[]', 0, '2022-02-15 05:41:29', '2022-02-15 05:41:29', '2022-02-16 11:11:29'),
('7a512e6a524e455a8c5fb9b2f82d661c3ffcf7789f54702fc4411eb622d5811dff8964f13c6cb2c2', 1, 2, NULL, '[]', 0, '2022-02-15 05:53:55', '2022-02-15 05:53:55', '2022-02-16 11:23:55'),
('7d7b5f4a953e3fbc6d589eeeff79fa7ac02b8ff405716011263c27365688d234e65c422c21a72637', 1, 2, NULL, '[]', 0, '2022-02-15 01:30:56', '2022-02-15 01:30:56', '2022-02-16 07:00:56'),
('86184fea3b13c2f7c4776309942b6469d62f802797ed1706ce8190603506d9dcba71aa5a2f09b85c', 1, 2, NULL, '[]', 0, '2022-02-14 08:18:42', '2022-02-14 08:18:42', '2022-02-15 13:48:42'),
('9b964582f8c4ab715a0f489096abe361fea4c9bbd674ecb540b43d701addc9ad086f0f465ea62ae0', 1, 2, NULL, '[]', 0, '2022-02-13 13:46:31', '2022-02-13 13:46:31', '2022-02-14 19:16:31'),
('a0c643aeabe405a554a442fdf825726878ffbce0bf485944f9fe5355e0468d8d5908cdb13bb53118', 1, 2, NULL, '[]', 0, '2022-02-14 12:15:53', '2022-02-14 12:15:53', '2022-02-15 17:45:53'),
('a25461b89ffaaa2dd99c71bd3b40ae060517fcc56c56f2e0f62cb5884d8eecb8d7f5d6f33debcbe3', 1, 2, NULL, '[]', 0, '2022-02-14 10:10:14', '2022-02-14 10:10:14', '2022-02-15 15:40:14'),
('af2509f6612cf58a6b4b29636e05cf8feaafa75ecec162cbc3891cd5f4ff926348077d649dcee136', 2, 2, NULL, '[]', 0, '2022-02-15 01:38:47', '2022-02-15 01:38:47', '2022-02-16 07:08:47'),
('be268048197288905a4075781f21de2b5f0d1e16a6e2c79a8df6be6d2de41680c89589e3f31a69b4', 2, 2, NULL, '[]', 0, '2022-02-15 01:41:26', '2022-02-15 01:41:26', '2022-02-16 07:11:26'),
('c03967ed02ed493a72054cb0a356e1e99ecb23a93c87397d38343891d42e656fb7d267982559e5a3', 2, 2, NULL, '[]', 0, '2022-02-14 08:20:29', '2022-02-14 08:20:29', '2022-02-15 13:50:29'),
('c04155ddad3c1b546b13727fa9f19a375a4b48ce90923240f11ec37ed1e4ccd893b774cadc194f9b', 1, 2, NULL, '[]', 0, '2022-02-14 10:09:00', '2022-02-14 10:09:00', '2022-02-15 15:39:00'),
('c3e7cd9b4b1dcb470c1293544069ba701bc2e7754e2617c0dc5eaafc17d0a29dda5630fb1fb6fb4b', 1, 2, NULL, '[]', 0, '2022-02-14 10:17:55', '2022-02-14 10:17:55', '2022-02-15 15:47:55'),
('d4c32edc42f12d7685bf40eca4cd9978a717f324378ab9dc149bfcabf712c55d8f3f49b233101d16', 1, 2, NULL, '[]', 0, '2022-02-14 04:29:52', '2022-02-14 04:29:52', '2022-02-15 09:59:52'),
('e257dff06995d6ab15454406601a0604d7e569a04a804c9e5164a1c3c11a4c8220470ba8741bf738', 1, 2, NULL, '[]', 0, '2022-02-14 09:22:11', '2022-02-14 09:22:11', '2022-02-15 14:52:11'),
('ed18b12dcda9dc83e8e4bcffba56516be42b4ac557963209437ed2c84cc4426c1d6649ab65f0a2ad', 1, 2, NULL, '[]', 0, '2022-02-14 08:14:54', '2022-02-14 08:14:54', '2022-02-15 13:44:54'),
('f111a20c855bc4829825252199795feace2e79137b002b5603ca999eb39ba39032b59fb927a29d5c', 1, 2, NULL, '[]', 0, '2022-02-13 13:45:13', '2022-02-13 13:45:13', '2022-02-14 19:15:13'),
('f74c90d2f9040ef84148dba5c4516b81e3a0d8696e4a2d1039ada479f6637d54b197f0af60f70af1', 1, 2, NULL, '[]', 0, '2022-02-15 00:47:44', '2022-02-15 00:47:44', '2022-02-16 06:17:44'),
('fae613fedda8acc2bf4ab2fa0d675a3b10ab385ead67b179d7e3cc560cce45aa76c1b839c21f972a', 1, 2, NULL, '[]', 0, '2022-02-14 10:12:04', '2022-02-14 10:12:04', '2022-02-15 15:42:04');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Bank Personal Access Client', 'ShedVRj5X6B37FdqItGtWuzTWDhbDdQ3r7Jfm239', NULL, 'http://localhost', 1, 0, 0, '2022-02-13 10:27:57', '2022-02-13 10:27:57'),
(2, NULL, 'Bank Password Grant Client', 'zSrAk8QX5VExONOzSdYNHeKJqSfdSUM3j7FTj9ca', 'users', 'http://localhost', 0, 1, 0, '2022-02-13 10:27:57', '2022-02-13 10:27:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-02-13 10:27:57', '2022-02-13 10:27:57');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('0ad8665784c56fd4cbc20fbe981549f0cc8277f3ba968f7b96b777da0a825c0ad4206e16f7282e26', 'ed18b12dcda9dc83e8e4bcffba56516be42b4ac557963209437ed2c84cc4426c1d6649ab65f0a2ad', 0, '2023-02-14 13:44:54'),
('0b9c704a78a8959624350d0ff21c4e44222a905b526807c76a9b2543b1c92cb5554a07d38ae6c458', '145c4fbebf5095743edaad4196b4ef3a1fb414da72be23545bd814c23ac049174c6878e90b4256d3', 0, '2023-02-14 15:50:57'),
('1695f64c4e0b63e17a4d011acb3521e4ca1d9592ac7446d56580644d8daf56ad3328a70f34bbe931', '47f28d30b4a70a4260cfaecbb53cedca900d560863295536bf444ee461df1eff4d19f8f7ae09d72d', 0, '2023-02-15 06:26:10'),
('1841d814f413b8b00df5818dc95539cb0b5f2e0b0cb9774ad4af596af570653ff4573a95bd968498', '7d7b5f4a953e3fbc6d589eeeff79fa7ac02b8ff405716011263c27365688d234e65c422c21a72637', 0, '2023-02-15 07:00:56'),
('249fe52c53c200300810fba835db840875e56ec2f119db4a2e91f4c48072bea5e7db68f5647fbd19', 'f111a20c855bc4829825252199795feace2e79137b002b5603ca999eb39ba39032b59fb927a29d5c', 0, '2023-02-13 19:15:13'),
('27fcbbcbd3ba78ce75625f9e9a8e6ddf11a8e319541fb79e2769ee4d5013db018b17771e22d47308', '492e3d9b81e138ed561dd57b51939fc38f8e1b0056ed2e2b902b25d129189374eb7a39685108d952', 0, '2023-02-14 14:56:57'),
('2a74e4ae7f4920231a40e112d6fc66634fc9adfc13b568653ddc524962433c61bbc8b11aac1a7221', 'a0c643aeabe405a554a442fdf825726878ffbce0bf485944f9fe5355e0468d8d5908cdb13bb53118', 0, '2023-02-14 17:45:53'),
('31ef23fea2ff065ad481450ef7e912c52a8eaf1d5512c61efb96d969d84c5d4f5ba0ada5743894ed', 'c3e7cd9b4b1dcb470c1293544069ba701bc2e7754e2617c0dc5eaafc17d0a29dda5630fb1fb6fb4b', 0, '2023-02-14 15:47:55'),
('35dcd3244e73e0e390b3fece0a2d8741137b2e5b0fb7c443daff4332d211bda64d31dd279fb2a867', 'fae613fedda8acc2bf4ab2fa0d675a3b10ab385ead67b179d7e3cc560cce45aa76c1b839c21f972a', 0, '2023-02-14 15:42:04'),
('37690bc44e4e8fc58ab94ee5abb3c74d0f4e921f6564c22733e8975c99f977bea5218e9eb7310294', '2ff43d9277dd62d692f188a49d82cfbc7f1d0aa97034c0cb8d6d5b67e5dd7873e060282f6fa5b0a2', 0, '2023-02-14 13:49:20'),
('425cb4fa336d6322cbb75266f754f72c140fc8df4a3360a0d05b51a8f90db5b3e3aa07be2d666bca', 'be268048197288905a4075781f21de2b5f0d1e16a6e2c79a8df6be6d2de41680c89589e3f31a69b4', 0, '2023-02-15 07:11:26'),
('4aa38b11864198b2d73fb2feff454d5a551b9fab885d6be85ac1824bfc52a4c6992206c854503a58', '69724663c90488917f71e1b0c0624460791cc3884241e5746afb21f477dac6a622e8c5fd6ffcaa3d', 0, '2023-02-15 11:07:54'),
('57809fc1281d96ec0c0fd09f4d30ee91342647311a986ff1161afec2c4aee43b81bd68fd3bb3e3e7', '69a3afb203c93fb3490d031a1f679c27dd56848f0417acd11aac13148c1c1cd04d1bff7cf5acc72c', 0, '2023-02-14 14:54:21'),
('5b884963ea0cfcb7c6c759a3a07f6eed50e17ca5ff85e6076317198272c5674b7a141531db4d4fda', '473e0b42cd5d07f8dc6719c8a83205c8109894bc63458a8c65ce8c6f9aa65c62a5dd7fcc86a9d6f5', 0, '2023-02-14 15:49:39'),
('5f3cde180ad396979d92b2a457cc994cd29b1bf1e42990ce8210b251177baf1f4d67de822e94ee3c', '9b964582f8c4ab715a0f489096abe361fea4c9bbd674ecb540b43d701addc9ad086f0f465ea62ae0', 0, '2023-02-13 19:16:31'),
('65891f3677ad9e3adf1994561999b6ade153dff6e84ecb7a348ae4b902de8e5f8d2e72f08240e3b4', 'c04155ddad3c1b546b13727fa9f19a375a4b48ce90923240f11ec37ed1e4ccd893b774cadc194f9b', 0, '2023-02-14 15:39:00'),
('7ea545120133c2a6347420dc3c3b74e48ea91cbd4353d4d58160c088ab7e4efd23c084c5b8f6764e', 'af2509f6612cf58a6b4b29636e05cf8feaafa75ecec162cbc3891cd5f4ff926348077d649dcee136', 0, '2023-02-15 07:08:47'),
('81cbb1aa5174f0068c408b2a2cb6490e916d901f4ea80ee27dab101c2604e4d17e1a127a0a93c41e', '0970e5b905145480f903245256aa6bcc000780f03a7389a591efe2210e04f7a8e092d63d19a8a5b9', 0, '2023-02-14 14:41:44'),
('82c9722bc199fbbe13774274377e2802b3be0449ab757c623fcbc5c4d11b01f4988849bacaa556e3', '86184fea3b13c2f7c4776309942b6469d62f802797ed1706ce8190603506d9dcba71aa5a2f09b85c', 0, '2023-02-14 13:48:42'),
('8935969e3e4c7ab6953e6708385270816c1e2ba3a5b239a6b3a3540d961507777084ec647703fe5f', '2dcfac85d1f915c19852455a03bdbd8eab7a671441b04190b71539e189f855044db4c452afb72a11', 0, '2023-02-14 14:58:40'),
('93ee786487880d0be1adf966cd16a60b150f60f160053a5f2bff8da15a47c518b4c6b9d8644287c4', 'c03967ed02ed493a72054cb0a356e1e99ecb23a93c87397d38343891d42e656fb7d267982559e5a3', 0, '2023-02-14 13:50:29'),
('9b809f247370c55b44e56d73d7e2de8ab328f56821844087b19956b76b84fe44cc970d8dbabf7142', 'd4c32edc42f12d7685bf40eca4cd9978a717f324378ab9dc149bfcabf712c55d8f3f49b233101d16', 0, '2023-02-14 09:59:52'),
('9c97efdf738544e59aec7271e9095a2765f8415ccb7295715c6609bdd174d2b0e7621fe750b34d32', '7702716ef67d02e309e9060edd93394b37f781f84ddaf702021c80a315c57e9bc765ca1234cd306a', 0, '2023-02-14 17:43:49'),
('aa41756b051f20e9b535ebf138fcf4d172b752b4cfbff23929b5f043234bb9143d0dc2fabe5fd728', '379e4d699f81dcbf592be6372b1f340752ea59caa90190de983a7364ebd3abee59c3ff14ec62e282', 0, '2023-02-13 19:12:40'),
('b06a63bd6ce96a0e777044e7bb84ab625d342d3270f0b2f6cebc6fce184911e90aa306c87a44fd5d', '321cd079554a367559a07fb3d27510465e856ff934fb754debd94d2559b103da9b6de2d006590942', 0, '2023-02-13 19:15:44'),
('b090fac5bd95827972e821cd0fa1d645ee3befe4e04cc274fca6ecd2faf45fcd993dd49eb276821c', '79ac455d13f8e6392127e3a76264a6b60ed128d1b32cfaa5ff72cb50c5275f659f55d7bb17cbf761', 0, '2023-02-15 11:11:29'),
('b66c076a919621cf0fb381e62ee22e93d780976f2cdd4d2aa7f302bce6dc1b60b12f73d36b73d8c1', '557faada518b863e9a1be9703428f26526faa9ceacb351da33faaf39e648e88493a295096e284ceb', 0, '2023-02-14 13:49:06'),
('c6ede98146f0524e5ee2b1b2fe9be0668aafd0989f8bdf3b7e5ff0f406129c147f414f68ae063867', '3d73ed5c3d8ce1dc5bbaa96ebd96487e04d5622ec39c947f629532dff4eaf55104cf37c921703cbe', 0, '2023-02-15 07:10:00'),
('c95ea4743227c301c7a9c9ef47c87106ba6366912b6126378f91d8057e186f37d30c1a6075fc3e08', '77938aaf0e79593359172a8cea47199ee29ea673c8e2593588d216f49bb07ae1089f136782e075b3', 0, '2023-02-14 15:00:10'),
('cbeca3c550e7254f2ec0b20e7e49a718a45f95aaf34e7d8f4d605dc2af9eed4de5ca7ad7401a1a54', '4c6102dbdbe7336c177ce924766f7f2f6e449fb97fadee53973f97792214e3ef7d3bd46a72411757', 0, '2023-02-14 14:51:30'),
('cd83cf2619844af19ef0fe1a1d0d3cf3b3c7364594ed5fc0b670790c5c277cbb9cdc47c12f1b239f', 'a25461b89ffaaa2dd99c71bd3b40ae060517fcc56c56f2e0f62cb5884d8eecb8d7f5d6f33debcbe3', 0, '2023-02-14 15:40:14'),
('cef1e0769885956909338a68ebf4b490f55fea3e467c0c8e65e78a3040001919ae73f5a22d5a7ab6', 'f74c90d2f9040ef84148dba5c4516b81e3a0d8696e4a2d1039ada479f6637d54b197f0af60f70af1', 0, '2023-02-15 06:17:44'),
('d1c4a84a141b240aa9881f3cac13c27975bad0a7ca3a98179f4112d2b99880618784cc348677fa2e', '0637a2836509a5d3856e7a904253eb9d963c958bb1a5c86cfefe69de618cda078561dedc5a950739', 0, '2023-02-14 13:50:36'),
('d4aa25dc95fd3cba0e947b84cd20af0837c92ba8901f31b905b7e0723c49d62d3f592476af89bd65', '753be7141480f31a88c31d655376a51e83829764e975f05608bfe64e4640f9dd242ea508cb0b6ea8', 0, '2023-02-15 06:42:34'),
('d9bd1c575f289fd82a32eb712b5dac7a229158236664b4fbfbae2772673cfc9e6996171fde17f35e', '64141056c26a2624cd88f1a2d937e24a8729379d46b28203e56549514f19c203f4078042a3bc613c', 0, '2023-02-14 14:49:05'),
('e419d2ed3b03946a070ab248c0075baca137b5f8b3b133d5465e1ae8860c107eacd6a9f1b1a46d75', '71ce0eb6cc692afce526a7a7d780bb6dffb845087ca58947e3c0a876d77fc77b5c12d144138fdc50', 0, '2023-02-14 14:58:11'),
('ef277f7e6230d3059012a35d4b9e880404d71a0661ef8d89226b2ecdc57dc0e9506d9aef01c158f7', '5bde01feb1949cc13fb36aadc0f7d3bde6cda445eb1db9dfb4792e49b2f8972b269834dfb5a65875', 0, '2023-02-14 09:59:17'),
('f0375ad2f82bc0908dabddf878df4951cb69f3bb5148f6425433202d4ded53a54bc373606209e448', 'e257dff06995d6ab15454406601a0604d7e569a04a804c9e5164a1c3c11a4c8220470ba8741bf738', 0, '2023-02-14 14:52:11'),
('f39ff57f87a0c9acbf34129f85f6941d59b58852c7f9fa91c9c1afa7eb75efce41d7cc1fdcc4aa22', '1ecb9ebf93e3a46947b255f98597d5e3ec361e866832d4df8e77e1a8439cb59f91ac6233be8a0511', 0, '2023-02-15 06:17:42'),
('f6510b8ee3ef7971dd6657856e8e8702a5bd5a94cab9bb0e61cd31127b6bc47879fd35a95722e953', '7a512e6a524e455a8c5fb9b2f82d661c3ffcf7789f54702fc4411eb622d5811dff8964f13c6cb2c2', 0, '2023-02-15 11:23:55');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'authToken', 'd14669456a7c2860677eef24740675c430c755637304a6a84a0f359e096e5764', '[\"*\"]', NULL, '2022-02-13 12:25:26', '2022-02-13 12:25:26'),
(2, 'App\\Models\\User', 1, 'authToken', '74094af2de2bc82e32aa81c19582ea316dcbb8eedbd1113b206b201ef5cca53a', '[\"*\"]', NULL, '2022-02-13 12:28:02', '2022-02-13 12:28:02'),
(3, 'App\\Models\\User', 1, 'authToken', 'f351232b241bbbd75177d6302ec72d2256a28239032390bac2e07e4f571393a7', '[\"*\"]', NULL, '2022-02-13 12:28:36', '2022-02-13 12:28:36'),
(4, 'App\\Models\\User', 1, 'authToken', '5e59a16311a9fbf26be4859610824f830da7caf02b8f61fef6ac034926ef98dd', '[\"*\"]', NULL, '2022-02-13 12:29:10', '2022-02-13 12:29:10'),
(5, 'App\\Models\\User', 1, 'authToken', '5e042cf67b13f614f2d3970dbbb54c34038b78373cbcdc069f8584087cf55e52', '[\"*\"]', NULL, '2022-02-13 12:29:14', '2022-02-13 12:29:14'),
(6, 'App\\Models\\User', 1, 'authToken', '9a78932973e556b66fe22fb2bc1d4799d419783d11f6270a0119fbf5a979fa08', '[\"*\"]', NULL, '2022-02-13 12:29:22', '2022-02-13 12:29:22'),
(7, 'App\\Models\\User', 1, 'authToken', '4b81ef0ffdd8d81f2e7c54b646fdfb6933da9b53881e83ebd1d2e29809bc3c14', '[\"*\"]', NULL, '2022-02-13 12:31:00', '2022-02-13 12:31:00'),
(8, 'App\\Models\\User', 1, 'authToken', '23fa357d13f5fcd54b3a93511fd1d8c4cc3f868354034f8014f3ccc986ca64b7', '[\"*\"]', NULL, '2022-02-13 12:36:48', '2022-02-13 12:36:48'),
(9, 'App\\Models\\User', 1, 'accessToken', '2de7c7ec8489509c49a772ec0e2ff9e2c6ee39d16db4644d20b976c78bb43dde', '[\"*\"]', NULL, '2022-02-13 12:38:00', '2022-02-13 12:38:00'),
(10, 'App\\Models\\User', 1, 'accessToken', '21bd66c4f9156219f13e65481da09501b4ae8a13f078e02820ef342db48c477e', '[\"*\"]', NULL, '2022-02-13 12:38:02', '2022-02-13 12:38:02'),
(11, 'App\\Models\\User', 1, 'authToken', '100f2d69cc0ee699637c8c4af224f4ecc2cd74b43c1a7389beddcadbbd403054', '[\"*\"]', NULL, '2022-02-13 12:38:32', '2022-02-13 12:38:32'),
(12, 'App\\Models\\User', 1, 'authToken', 'b67b2d835d4e9b146c841f8a311a232177b028da0b7bdc54923f051eb3e98663', '[\"*\"]', NULL, '2022-02-13 12:42:10', '2022-02-13 12:42:10'),
(13, 'App\\Models\\User', 1, 'authToken', '4e26d15a77f5cbc3d7544ea398525a04c98c01e59d70a2ab0f085fb552f03f75', '[\"*\"]', NULL, '2022-02-13 12:42:12', '2022-02-13 12:42:12'),
(14, 'App\\Models\\User', 1, 'authToken', '319a441eebaf6da3a7e63850fe19f3c587bc8621780c4fc5ce117e395bdce3b0', '[\"*\"]', NULL, '2022-02-13 12:42:13', '2022-02-13 12:42:13'),
(15, 'App\\Models\\User', 1, 'authToken', '22e44506f0bc0aa4dd351550ae9ef528a9eb056d386ebb3a708771fff20cae4c', '[\"*\"]', NULL, '2022-02-13 12:45:25', '2022-02-13 12:45:25'),
(16, 'App\\Models\\User', 1, 'authToken', '8ac92fa29be71ba92eadda167c853d0807d7f46baab4cdc809c319d9a31d5213', '[\"*\"]', NULL, '2022-02-13 12:45:28', '2022-02-13 12:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Tom Hardy', 'tomh@example.com', 'banker', NULL, '$2y$10$NrqSt3fZA8lCvldTACR1W..KJ4pKxaxz1LZn6xWSdXQRPDA3Ior7O', NULL, '2022-02-13 11:48:50', '2022-02-13 11:48:50'),
(2, 'Betty Jones', 'bettyj@example.com', 'customer', NULL, '$2y$10$7bNgJW9ryGzmhstrjk.hz.xRElgZRzERJR5KFOTEY5LE8VN2iarkq', NULL, '2022-02-13 13:17:07', '2022-02-13 13:17:07'),
(3, 'Mike Jay', 'mike@example.com', 'customer', NULL, '$2y$10$ooGypm6rp6WseWhCFNOFa.rJSEys7p8t3a0r9ktR1g45hiIUoyNbW', NULL, '2022-02-15 05:40:33', '2022-02-15 05:40:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
