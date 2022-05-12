-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 12, 2022 lúc 08:38 AM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ltweb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id` int(11) NOT NULL,
  `historyId` int(11) NOT NULL,
  `itemId` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bill`
--

INSERT INTO `bill` (`id`, `historyId`, `itemId`, `price`, `size`, `quantity`) VALUES
(21, 7, 3, 560000, 38, 3),
(22, 8, 6, 422400, 35, 1),
(23, 9, 73, 94500, 35, 1),
(24, 10, 6, 422400, 35, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `hashkey` varchar(255) NOT NULL,
  `timeupdate` timestamp NOT NULL DEFAULT current_timestamp(),
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `hashkey`, `timeupdate`, `data`) VALUES
(16, '892858d8-ccff-4e08-9580-d1624e864290', '2022-05-12 04:18:43', '[{\"quantity\":1,\"size\":35,\"price\":141100,\"id\":69}]'),
(17, '95d8b68f-ff95-426e-bcf0-69ab4295a7a3', '2022-05-12 06:24:44', '[]');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `color`
--

CREATE TABLE `color` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `color`
--

INSERT INTO `color` (`id`, `name`) VALUES
(1, 'WHITE'),
(2, 'BLACK'),
(3, 'RED'),
(4, 'BLUE'),
(5, 'GREEN'),
(6, 'YELLOW'),
(7, 'BROWN');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `timecreat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `history`
--

INSERT INTO `history` (`id`, `userId`, `status`, `name`, `phone`, `address`, `timecreat`) VALUES
(7, 7, -1, 'Trương Quang Kiên', '0123123123', 'Hà Nội, Hà Đông', '2022-05-12 04:19:05'),
(8, 7, 1, 'Trương Quang Kiên', '0123123123', 'Hà Nội, Hà Đông', '2022-05-12 06:25:29'),
(9, 7, 0, 'Trương Quang Kiên', '0123123123', 'Hà Nội, Hà Đông', '2022-05-12 06:26:52'),
(10, 7, 0, 'Trương Quang Kiên', '0123123123', 'Hà Nội, Hà Đông', '2022-05-12 06:32:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1024) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `colorId` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `new` tinyint(1) NOT NULL DEFAULT 0,
  `sale` int(11) NOT NULL DEFAULT 0,
  `infos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `thump` varchar(255) NOT NULL DEFAULT '',
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `timecreat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `item`
--

INSERT INTO `item` (`id`, `type`, `name`, `description`, `price`, `colorId`, `status`, `new`, `sale`, `infos`, `thump`, `image`, `timecreat`) VALUES
(1, 0, 'Giày Bóng Đá Nam Biti\'s Hunter Football DSMH02401DOO (Đỏ)', 'Chưa có mô tả cho sản phẩm này', 596600, 3, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '45_thump_20220512_073800.jpg', '[\"45_image_0_20220512_073801.jpg\",\"45_image_1_20220512_073801.jpg\",\"45_image_2_20220512_073801.jpg\",\"45_image_3_20220512_073801.jpg\"]', '2022-05-12 03:35:54'),
(2, 0, 'Giày Bóng Đá Nam Biti\'s Hunter Football DSMH02401TRG (Trắng)', 'Chưa có mô tả cho sản phẩm này', 500000, 1, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '46_thump_20220512_073835.jpg', '[\"46_image_0_20220512_073835.jpg\",\"46_image_1_20220512_073835.jpg\",\"46_image_2_20220512_073835.jpg\",\"46_image_3_20220512_073835.jpg\"]', '2022-05-12 03:35:54'),
(3, 0, 'Giày Bóng Đá Nam Biti\'s Hunter Football DSMH02401VAG (Vàng)', 'Chưa có mô tả cho sản phẩm này', 560000, 6, 1, 1, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '47_thump_20220512_073903.jpg', '[\"47_image_0_20220512_073903.jpg\",\"47_image_1_20220512_073904.jpg\",\"47_image_2_20220512_073904.jpg\",\"47_image_3_20220512_073904.jpg\"]', '2022-05-12 03:35:54'),
(4, 0, 'Giày Bóng Đá Nam Biti\'s Hunter Football DSMH09100DEN (Đen)', 'Chưa có mô tả cho sản phẩm này', 490000, 2, 1, 0, 25, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '48_thump_20220512_073932.jpg', '[\"48_image_0_20220512_073932.jpg\",\"48_image_1_20220512_073932.jpg\",\"48_image_2_20220512_073932.jpg\",\"48_image_3_20220512_073932.jpg\"]', '2022-05-12 03:35:54'),
(5, 0, 'Giày Bóng Đá Nam Biti\'s Hunter Football Futsal DSMH09100TRG (Trắng)', 'Chưa có mô tả cho sản phẩm này', 360000, 1, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '49_thump_20220512_074352.jpg', '[\"49_image_0_20220512_074352.jpg\",\"49_image_1_20220512_074352.jpg\",\"49_image_2_20220512_074352.jpg\",\"49_image_3_20220512_074352.jpg\"]', '2022-05-12 03:35:54'),
(6, 0, 'Giày Thể Thao Cao Cấp Nam Biti\'s Hunter X Old Kool Black DSMH06500DEN (Đen)', 'Chưa có mô tả cho sản phẩm này', 660000, 2, 1, 0, 36, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '50_thump_20220512_074448.jpg', '[\"50_image_0_20220512_074448.jpg\",\"50_image_1_20220512_074448.jpg\",\"50_image_2_20220512_074448.jpg\",\"50_image_3_20220512_074448.jpg\"]', '2022-05-12 03:35:54'),
(7, 0, 'Giày Thể Thao Nam Biti’s Hunter Core Z Collection Stone DSMH06400DEN (Đen)', 'Chưa có mô tả cho sản phẩm này', 660000, 2, 1, 1, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '51_thump_20220512_074518.jpg', '[\"51_image_0_20220512_074518.jpg\",\"51_image_1_20220512_074518.jpg\",\"51_image_2_20220512_074518.jpg\",\"51_image_3_20220512_074518.jpg\"]', '2022-05-12 03:35:54'),
(8, 0, 'Giày Thể Thao Nam Biti’s Hunter X Z Collection InOrange DSMH06300TRANG(Trắng)', 'Chưa có mô tả cho sản phẩm này', 355000, 1, 1, 1, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '52_thump_20220512_074637.jpg', '[\"52_image_0_20220512_074637.jpg\",\"52_image_1_20220512_074637.jpg\",\"52_image_2_20220512_074637.jpg\",\"52_image_3_20220512_074637.jpg\"]', '2022-05-12 03:35:54'),
(9, 0, 'Giày Thể Thao Nam Biti\'s DSM07423DEN (Đen)', 'Chưa có mô tả cho sản phẩm này', 366000, 2, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '53_thump_20220512_074710.jpg', '[\"53_image_0_20220512_074710.jpg\",\"53_image_1_20220512_074710.jpg\",\"53_image_2_20220512_074710.jpg\",\"53_image_3_20220512_074710.jpg\"]', '2022-05-12 03:35:54'),
(10, 0, 'Giày Thể Thao Nam Biti\'s DSM074233DEN (Đen)', 'Chưa có mô tả cho sản phẩm này', 550000, 2, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '54_thump_20220512_074738.jpg', '[\"54_image_0_20220512_074738.jpg\",\"54_image_1_20220512_074738.jpg\",\"54_image_2_20220512_074738.jpg\",\"54_image_3_20220512_074738.jpg\"]', '2022-05-12 03:35:54'),
(11, 0, 'Giày Thể Thao Nam Biti\'s DSM074500DEN (Đen)', 'Chưa có mô tả cho sản phẩm này', 340000, 2, 1, 0, 16, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '55_thump_20220512_074820.jpg', '[\"55_image_0_20220512_074820.jpg\",\"55_image_1_20220512_074820.jpg\",\"55_image_2_20220512_074820.jpg\",\"55_image_3_20220512_074820.jpg\"]', '2022-05-12 03:35:54'),
(12, 0, 'Giày Thể Thao Nam Biti\'s DSM074500XNH (Xanh)', 'Chưa có mô tả cho sản phẩm này', 380000, 4, 1, 1, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '56_thump_20220512_074846.jpg', '[\"56_image_0_20220512_074846.jpg\",\"56_image_1_20220512_074846.jpg\",\"56_image_2_20220512_074846.jpg\",\"56_image_3_20220512_074846.jpg\"]', '2022-05-12 03:35:54'),
(13, 0, 'Giày Thể Thao Nam Biti\'s DSM074733DEN (Đen)', 'Chưa có mô tả cho sản phẩm này', 420000, 2, 1, 0, 25, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '57_thump_20220512_074908.jpg', '[\"57_image_0_20220512_074908.jpg\",\"57_image_1_20220512_074908.jpg\",\"57_image_2_20220512_074908.jpg\",\"57_image_3_20220512_074908.jpg\"]', '2022-05-12 03:35:54'),
(14, 0, 'Giày Thể Thao Nam Biti\'s DSM074933TRANG(Trắng)', 'Chưa có mô tả cho sản phẩm này', 320000, 1, 1, 0, 23, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '58_thump_20220512_075116.jpg', '[\"58_image_0_20220512_075116.jpg\",\"58_image_1_20220512_075116.jpg\",\"58_image_2_20220512_075116.jpg\",\"58_image_3_20220512_075116.jpg\"]', '2022-05-12 03:35:54'),
(15, 0, 'Giày Thể Thao Nam Biti\'s Hunter Core 3D-Airmesh Black DSMH08700DEN (Đen)', 'Chưa có mô tả cho sản phẩm này', 330000, 2, 1, 0, 38, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '59_thump_20220512_075141.jpg', '[\"59_image_0_20220512_075141.jpg\",\"59_image_1_20220512_075141.jpg\",\"59_image_2_20220512_075141.jpg\",\"59_image_3_20220512_075141.jpg\"]', '2022-05-12 03:35:54'),
(16, 0, 'Giày Thể Thao Nam Biti\'s Hunter Core 3D-Airmesh Grey DSMH08700TRANG(Trắng)', 'Chưa có mô tả cho sản phẩm này', 410000, 1, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '60_thump_20220512_075203.jpg', '[\"60_image_0_20220512_075203.jpg\",\"60_image_1_20220512_075203.jpg\",\"60_image_2_20220512_075203.jpg\",\"60_image_3_20220512_075203.jpg\"]', '2022-05-12 03:35:54'),
(17, 0, 'Giày Thể Thao Nam Biti\'s Hunter Nameless Edition x Công Trí - B&W No.4 DSMH05901TRANG(Trắng)', 'Chưa có mô tả cho sản phẩm này', 860000, 1, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '61_thump_20220512_075304.jpg', '[\"61_image_0_20220512_075304.jpg\",\"61_image_1_20220512_075304.jpg\"]', '2022-05-12 03:35:54'),
(18, 0, 'Giày Thể Thao Nam Biti\'s Hunter Nameless Edition x Công Trí - B&W No.5 DSMH06101TRANG(Trắng)', 'Chưa có mô tả cho sản phẩm này', 850000, 1, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '62_thump_20220512_075335.jpg', '[\"62_image_0_20220512_075335.jpg\",\"62_image_1_20220512_075335.jpg\",\"62_image_2_20220512_075335.jpg\"]', '2022-05-12 03:35:54'),
(19, 0, 'Giày Thể Thao Nam Biti\'s Hunter Street - Retro Collection DSMH08800NAU (Nâu)', 'Chưa có mô tả cho sản phẩm này', 430000, 7, 1, 1, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '63_thump_20220512_075405.jpg', '[\"63_image_0_20220512_075405.jpg\",\"63_image_1_20220512_075405.jpg\",\"63_image_2_20220512_075405.jpg\",\"63_image_3_20220512_075405.jpg\"]', '2022-05-12 03:35:54'),
(20, 0, 'Giày Thể Thao Nam Biti\'s Hunter Street - Retro Collection DSMH08800TRANG (Trắng)', 'Chưa có mô tả cho sản phẩm này', 440000, 1, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '64_thump_20220512_075427.jpg', '[\"64_image_0_20220512_075427.jpg\",\"64_image_1_20220512_075427.jpg\",\"64_image_2_20220512_075427.jpg\",\"64_image_3_20220512_075427.jpg\"]', '2022-05-12 03:35:54'),
(21, 0, 'Giày Thể Thao Nam Biti\'s Hunter X Midnight EZ-STRAP DSMH07600DEN (Đen)', 'Chưa có mô tả cho sản phẩm này', 550000, 2, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '65_thump_20220512_075607.jpg', '[\"65_image_0_20220512_075607.jpg\",\"65_image_1_20220512_075607.jpg\",\"65_image_2_20220512_075607.jpg\",\"65_image_3_20220512_075607.jpg\"]', '2022-05-12 03:35:54'),
(22, 0, 'Giày Thể Thao Nam Trung Cấp Biti\'s DSM074400DEN (Đen)', 'Chưa có mô tả cho sản phẩm này', 540000, 2, 1, 1, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '66_thump_20220512_075635.jpg', '[\"66_image_0_20220512_075635.jpg\",\"66_image_1_20220512_075635.jpg\",\"66_image_2_20220512_075635.jpg\",\"66_image_3_20220512_075635.jpg\"]', '2022-05-12 03:35:54'),
(23, 0, 'Giày Thể Thao Trung Cấp Nam Biti\'s DSM073600XNH (Xanh)', 'Chưa có mô tả cho sản phẩm này', 320000, 4, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '67_thump_20220512_075731.jpg', '[\"67_image_0_20220512_075731.jpg\",\"67_image_1_20220512_075731.jpg\",\"67_image_2_20220512_075731.jpg\",\"67_image_3_20220512_075731.jpg\"]', '2022-05-12 03:35:54'),
(68, 1, 'Dép Da PU Nam Biti\'s SD1020000DEN (Đen)', 'Chưa có mô tả cho sản phẩm này', 270000, 2, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '68_thump_20220512_081614.jpg', '[\"68_image_0_20220512_081614.jpg\",\"68_image_1_20220512_081614.jpg\",\"68_image_2_20220512_081614.jpg\",\"68_image_3_20220512_081614.jpg\"]', '2022-05-12 03:35:54'),
(69, 1, 'Dép Eva Phun Nam Biti\'s DEM007300D (Đen)', 'Chưa có mô tả cho sản phẩm này', 170000, 2, 1, 0, 17, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '69_thump_20220512_081643.jpg', '[\"69_image_0_20220512_081643.jpg\",\"69_image_1_20220512_081643.jpg\",\"69_image_2_20220512_081643.jpg\",\"69_image_3_20220512_081643.jpg\"]', '2022-05-12 03:35:54'),
(70, 1, 'Dép Eva Phun Nam Biti\'s DEM007300TRG (Trắng)', 'Chưa có mô tả cho sản phẩm này', 177000, 1, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '70_thump_20220512_081744.jpg', '[\"70_image_0_20220512_081744.jpg\",\"70_image_1_20220512_081744.jpg\",\"70_image_2_20220512_081744.jpg\",\"70_image_3_20220512_081744.jpg\"]', '2022-05-12 03:35:54'),
(71, 1, 'Dép Eva Phun Nam Biti\'s DEM007300XAH (Xanh)', 'Chưa có mô tả cho sản phẩm này', 180000, 4, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '71_thump_20220512_081809.jpg', '[\"71_image_0_20220512_081809.jpg\",\"71_image_1_20220512_081809.jpg\",\"71_image_2_20220512_081809.jpg\",\"71_image_3_20220512_081809.jpg\"]', '2022-05-12 03:35:54'),
(72, 1, 'Dép Eva Phun Nam Biti\'s DEM010400DO(Đỏ)', 'Chưa có mô tả cho sản phẩm này', 190000, 3, 1, 0, 23, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '72_thump_20220512_081835.jpg', '[\"72_image_0_20220512_081835.jpg\",\"72_image_1_20220512_081835.jpg\",\"72_image_2_20220512_081835.jpg\",\"72_image_3_20220512_081835.jpg\"]', '2022-05-12 03:35:54'),
(73, 1, 'Dép Eva Phun Nam Biti\'s DEM010400VAG (Vàng)', 'Chưa có mô tả cho sản phẩm này', 150000, 6, 1, 0, 37, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '73_thump_20220512_081908.jpg', '[\"73_image_0_20220512_081908.jpg\",\"73_image_1_20220512_081908.jpg\",\"73_image_2_20220512_081908.jpg\",\"73_image_3_20220512_081908.jpg\"]', '2022-05-12 03:35:54'),
(74, 1, 'Dép Eva Phun Nam Biti\'s DEM011700DEN (Đen)', 'Chưa có mô tả cho sản phẩm này', 210000, 2, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '74_thump_20220512_081931.jpg', '[\"74_image_0_20220512_081931.jpg\",\"74_image_1_20220512_081931.jpg\",\"74_image_2_20220512_081931.jpg\",\"74_image_3_20220512_081931.jpg\"]', '2022-05-12 03:35:54'),
(76, 1, 'Dép Eva Phun Nam Biti\'s DEM011700XNH (Xanh)', 'Chưa có mô tả cho sản phẩm này', 210000, 4, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '76_thump_20220512_082052.jpg', '[\"76_image_0_20220512_082052.jpg\",\"76_image_1_20220512_082052.jpg\",\"76_image_2_20220512_082052.jpg\",\"76_image_3_20220512_082052.jpg\"]', '2022-05-12 03:35:54'),
(77, 1, 'Dép Evaphun Nam Biti\'s DDM037500NAU (Nâu)', 'Chưa có mô tả cho sản phẩm này', 170000, 7, 1, 1, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '77_thump_20220512_082118.jpg', '[\"77_image_0_20220512_082118.jpg\",\"77_image_1_20220512_082118.jpg\",\"77_image_2_20220512_082118.jpg\",\"77_image_3_20220512_082118.jpg\"]', '2022-05-12 03:35:54'),
(78, 1, 'Dép Nam Biti\'s DRM041100VAG (Vàng)', 'Chưa có mô tả cho sản phẩm này', 230000, 6, 1, 1, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '78_thump_20220512_082143.jpg', '[\"78_image_0_20220512_082143.jpg\",\"78_image_1_20220512_082143.jpg\",\"78_image_2_20220512_082143.jpg\",\"78_image_3_20220512_082143.jpg\"]', '2022-05-12 03:35:54'),
(79, 1, 'Dép PU Phun Nam Biti\'s DPM030244NAU (Nâu)', 'Chưa có mô tả cho sản phẩm này', 150000, 7, 1, 1, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '79_thump_20220512_082216.jpg', '[\"79_image_0_20220512_082216.jpg\",\"79_image_1_20220512_082216.jpg\",\"79_image_2_20220512_082216.jpg\",\"79_image_3_20220512_082216.jpg\"]', '2022-05-12 03:35:54'),
(80, 1, 'Dép Xốp Nam Biti\'s DXM149833DEN (Đen)', 'Chưa có mô tả cho sản phẩm này', 120000, 2, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '80_thump_20220512_082240.jpg', '[\"80_image_0_20220512_082240.jpg\",\"80_image_1_20220512_082240.jpg\",\"80_image_2_20220512_082240.jpg\",\"80_image_3_20220512_082240.jpg\"]', '2022-05-12 03:35:54'),
(81, 1, 'Dép Xốp Nam Biti\'s DXM149833NAU (Nâu)', 'Chưa có mô tả cho sản phẩm này', 180000, 7, 1, 1, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '81_thump_20220512_082300.jpg', '[\"81_image_0_20220512_082300.jpg\",\"81_image_1_20220512_082300.jpg\",\"81_image_2_20220512_082300.jpg\",\"81_image_3_20220512_082300.jpg\"]', '2022-05-12 03:35:54'),
(82, 1, 'Dép Xốp Nam Biti\'s DXM150433NAU (Nâu)', 'Chưa có mô tả cho sản phẩm này', 190000, 7, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '82_thump_20220512_082346.jpg', '[\"82_image_0_20220512_082346.jpg\",\"82_image_1_20220512_082346.jpg\",\"82_image_2_20220512_082346.jpg\",\"82_image_3_20220512_082346.jpg\"]', '2022-05-12 03:35:54'),
(83, 0, 'Giày Bóng Đá Nam Biti\'s Hunter Football DSMH02400XDG (Xanh Dương)', 'Chưa có mô tả cho sản phẩm này', 670000, 4, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '83_thump_20220512_090057.jpg', '[\"83_image_0_20220512_090057.jpg\",\"83_image_1_20220512_090057.jpg\",\"83_image_2_20220512_090057.jpg\",\"83_image_3_20220512_090057.jpg\"]', '2022-05-12 03:35:54'),
(84, 0, 'Giày Bóng Đá Nam Biti\'s Hunter Football DSMH02400XLC (Xanh Lá Cây)', 'Giày Bóng Đá Nam', 750000, 5, 1, 1, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '84_thump_20220512_090133.jpg', '[\"84_image_0_20220512_090133.jpg\",\"84_image_1_20220512_090133.jpg\",\"84_image_2_20220512_090133.jpg\",\"84_image_3_20220512_090133.jpg\"]', '2022-05-12 03:35:54'),
(85, 0, 'Giày Bóng Đá Nam Biti\'s Hunter Football DSMH03800DEN (Đen)', 'Description 1', 640000, 2, 1, 1, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '85_thump_20220512_090206.jpg', '[\"85_image_0_20220512_090206.jpg\",\"85_image_1_20220512_090206.jpg\",\"85_image_2_20220512_090206.jpg\",\"85_image_3_20220512_090206.jpg\"]', '2022-05-12 03:35:54'),
(86, 0, 'Giày Thể Thao Nam Biti\'s Hunter BKL Tết Edition 2020 DSMH02301DOO (Đỏ)', 'Description 2', 360000, 3, 1, 0, 23, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '86_thump_20220512_090235.jpg', '[\"86_image_0_20220512_090235.jpg\",\"86_image_1_20220512_090235.jpg\",\"86_image_2_20220512_090235.jpg\",\"86_image_3_20220512_090235.jpg\"]', '2022-05-12 03:35:54'),
(87, 0, 'Giày Thể Thao Nam Biti\'s Hunter Core Festive Breezer Black DSMH04200DEN (Đen)', 'Chưa có mô tả cho sản phẩm này', 560000, 2, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '87_thump_20220512_090303.jpg', '[\"87_image_0_20220512_090303.jpg\",\"87_image_1_20220512_090303.jpg\",\"87_image_2_20220512_090303.jpg\",\"87_image_3_20220512_090303.jpg\"]', '2022-05-12 03:35:54'),
(88, 0, 'Giày Thể Thao Nam Biti\'s Hunter Core Festive Spice Pumpkin DSMH03202DEN (Đen)', 'Description 1', 590000, 2, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '88_thump_20220512_090337.jpg', '[\"88_image_0_20220512_090337.jpg\",\"88_image_1_20220512_090337.jpg\",\"88_image_2_20220512_090337.jpg\",\"88_image_3_20220512_090337.jpg\"]', '2022-05-12 03:35:54'),
(89, 0, 'Giày Thể Thao Nam Biti\'s Hunter Marvel Captain DSMH00911XNH (Xanh)', 'Chưa có mô tả cho sản phẩm này', 550000, 4, 1, 1, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '89_thump_20220512_090414.jpg', '[\"89_image_0_20220512_090414.jpg\",\"89_image_1_20220512_090414.jpg\",\"89_image_2_20220512_090414.jpg\",\"89_image_3_20220512_090414.jpg\"]', '2022-05-12 03:35:54'),
(90, 0, 'Giày Thể Thao Nam Biti\'s Hunter Street Jingle Red DSMH01301DOO (Đỏ)', 'Chưa có mô tả cho sản phẩm này', 530000, 3, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '90_thump_20220512_090530.jpg', '[\"90_image_0_20220512_090530.jpg\",\"90_image_1_20220512_090530.jpg\",\"90_image_2_20220512_090530.jpg\",\"90_image_3_20220512_090530.jpg\"]', '2022-05-12 03:35:54'),
(91, 0, 'Giày Thể Thao Nam Biti\'s Hunter Street Vintage Green DSMH04000XNG (Xanh lá)', 'Description 2', 540000, 5, 1, 1, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '91_thump_20220512_090612.jpg', '[\"91_image_0_20220512_090612.jpg\",\"91_image_1_20220512_090612.jpg\",\"91_image_2_20220512_090612.jpg\",\"91_image_3_20220512_090612.jpg\"]', '2022-05-12 03:35:54'),
(92, 0, 'Giày Thể Thao Nam Biti\'s Hunter X Americano DSMH03400DEN (Đen)', 'Chưa có mô tả cho sản phẩm này', 450000, 2, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '92_thump_20220512_090652.jpg', '[\"92_image_0_20220512_090652.jpg\",\"92_image_1_20220512_090652.jpg\",\"92_image_2_20220512_090652.jpg\",\"92_image_3_20220512_090652.jpg\"]', '2022-05-12 03:35:54'),
(93, 0, 'Giày Thể Thao Nam Biti\'s Hunter X Festive Aurora Black DSMH03401XDG (Xanh Dương)', 'Chưa có mô tả cho sản phẩm này', 340000, 4, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '93_thump_20220512_090719.jpg', '[\"93_image_0_20220512_090719.jpg\",\"93_image_1_20220512_090720.jpg\",\"93_image_2_20220512_090720.jpg\",\"93_image_3_20220512_090720.jpg\"]', '2022-05-12 03:35:54'),
(94, 0, 'Giày Thể Thao Nam Biti\'s Hunter X Festive Frosty-White DSMH03500TRG (Trắng)', 'Chưa có mô tả cho sản phẩm này', 240000, 1, 1, 1, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '94_thump_20220512_090748.jpg', '[\"94_image_0_20220512_090748.jpg\",\"94_image_1_20220512_090748.jpg\",\"94_image_2_20220512_090748.jpg\",\"94_image_3_20220512_090748.jpg\"]', '2022-05-12 03:35:54'),
(95, 0, 'Giày Thể Thao Nam Biti\'s Hunter X Festive Spice Pumpkin DSMH03500DEN (Đen)', 'Description 3', 240000, 2, 1, 0, 0, '[{\"quantity\":107,\"size\":35},{\"quantity\":12,\"size\":38},{\"quantity\":63,\"size\":41},{\"quantity\":12,\"size\":45},{\"quantity\":2,\"size\":40}]', '95_thump_20220512_090814.jpg', '[\"95_image_0_20220512_090814.jpg\",\"95_image_1_20220512_090814.jpg\",\"95_image_2_20220512_090814.jpg\",\"95_image_3_20220512_090814.jpg\"]', '2022-05-12 03:35:54'),
(96, 0, 'Giày Thể Thao Nam Biti\'s Hunter X Matcha DSMH03400GREEN (Xanh lá)', 'Description 5', 560000, 5, 1, 1, 0, '[]', '96_thump_20220512_090843.jpg', '[\"96_image_0_20220512_090843.jpg\",\"96_image_1_20220512_090843.jpg\",\"96_image_2_20220512_090843.jpg\",\"96_image_3_20220512_090843.jpg\"]', '2022-05-12 03:35:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `hashkey` varchar(255) NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT 0,
  `timecreat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `name`, `phone`, `email`, `password`, `hashkey`, `level`, `timecreat`) VALUES
(7, 'Trương Quang Kiên', '0123123123', 'tqkien2306@gmail.com', '4297f44b13955235245b2497399d7a93', '95d8b68f-ff95-426e-bcf0-69ab4295a7a3', 1, '2022-05-11 06:54:21'),
(8, 'Bùi Anh Quân', '02131232131', 'dmkakdskf@gmail.com', '4297f44b13955235245b2497399d7a93', '364556bd-4383-4a14-895c-4d4d2d23356c', 0, '2022-05-11 14:23:01');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `colorId` (`colorId`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `color`
--
ALTER TABLE `color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`colorId`) REFERENCES `color` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
