-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 21, 2021 lúc 08:45 AM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `gf`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id_bill` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `order_code` varchar(50) NOT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `status_bill` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id_bill`, `id_customer`, `date_order`, `order_code`, `total`, `payment`, `status_bill`) VALUES
(182, 195, '2021-12-02', 'ca0cc', 50000, 'COD', 1),
(183, 196, '2021-12-02', '1765d', 68000, 'COD', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id_bill_detail` int(11) UNSIGNED NOT NULL,
  `id_bill` int(10) DEFAULT NULL,
  `id_product` int(10) DEFAULT NULL,
  `id_post_bill_detail` int(11) NOT NULL,
  `order_code` varchar(50) NOT NULL,
  `quantity` int(10) DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bill_detail`
--

INSERT INTO `bill_detail` (`id_bill_detail`, `id_bill`, `id_product`, `id_post_bill_detail`, `order_code`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(115, 173, 108, 34, '22c19', 1, 25000, '2021-11-30 05:20:39', '2021-11-30 05:20:39'),
(116, 174, 108, 34, '275c4', 1, 25000, '2021-11-30 05:29:51', '2021-11-30 05:29:51'),
(117, 175, 108, 34, '435c4', 1, 25000, '2021-11-30 13:51:32', '2021-11-30 13:51:32'),
(118, 176, 109, 35, 'c95ae', 1, 25000, '2021-11-30 14:30:03', '2021-11-30 14:30:03'),
(124, 182, 132, 58, 'ca0cc', 1, 50000, '2021-12-02 15:17:27', '2021-12-02 15:17:27'),
(125, 183, 126, 52, '1765d', 2, 34000, '2021-12-02 15:19:21', '2021-12-02 15:19:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL,
  `coupon_name` varchar(255) NOT NULL,
  `coupon_qty` int(50) NOT NULL,
  `coupon_number` int(11) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `coupon_condition` int(11) NOT NULL,
  `coupon_date_start` varchar(50) NOT NULL,
  `coupon_date_end` varchar(50) NOT NULL,
  `coupon_status` int(10) NOT NULL,
  `coupon_used` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `coupon_name`, `coupon_qty`, `coupon_number`, `coupon_code`, `coupon_condition`, `coupon_date_start`, `coupon_date_end`, `coupon_status`, `coupon_used`) VALUES
(13, 'tam', 1, 50, 'tam', 0, '03-12-2021', '18-12-2021', 0, NULL),
(14, 'Mười Điểm', 100, 20, 'muoidiem', 0, '03-12-2021', '31-12-2021', 0, NULL),
(15, 'abc', 100, 50, 'xinchao', 0, '03-12-2021', '31-12-2021', 0, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(186, 'Bùi Ngọc Khai Tâm', 'nam', 'buingockhaitam01@gmail.com', '695', '123456', NULL, '2021-11-30 05:20:39', '2021-11-30 05:20:39'),
(187, 'Bùi Ngọc Khai Tâm', 'nam', 'buingockhaitam01@gmail.com', '695', '123456', NULL, '2021-11-30 05:29:51', '2021-11-30 05:29:51'),
(188, 'Bùi Ngọc Khai Tâm', 'nam', 'buingockhaitam01@gmail.com', '695', '123456', NULL, '2021-11-30 13:51:32', '2021-11-30 13:51:32'),
(189, 'Bùi Ngọc Khai Tâm', 'nam', 'buingockhaitam01@gmail.com', '695', '123456', NULL, '2021-11-30 14:30:03', '2021-11-30 14:30:03'),
(195, 'Nguyễn Đăng Trình', 'nam', 'dangtrinh.nguyen2001@gmail.com', 'Gò Vấp', '0834021232', NULL, '2021-12-02 15:17:27', '2021-12-02 15:17:27'),
(196, 'Nguyễn Đăng Trình', 'nam', 'dangtrinh.nguyen2001@gmail.com', 'Gò Vấp', '0834021232', NULL, '2021-12-02 15:19:21', '2021-12-02 15:19:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `gallery`
--

CREATE TABLE `gallery` (
  `gallery_id` int(11) NOT NULL,
  `gallery_name` varchar(255) NOT NULL,
  `gallery_image` varchar(255) NOT NULL,
  `gallery_product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `id_payment` int(10) NOT NULL,
  `id_customer` varchar(255) NOT NULL,
  `id_post_payment` int(11) NOT NULL,
  `order_code` varchar(255) NOT NULL,
  `code_bank` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post`
--

CREATE TABLE `post` (
  `id_post` int(10) NOT NULL,
  `sp_vi` varchar(255) NOT NULL,
  `sp_en` varchar(255) NOT NULL,
  `description_vi` text DEFAULT NULL,
  `description_en` text DEFAULT NULL,
  `product_slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `post`
--

INSERT INTO `post` (`id_post`, `sp_vi`, `sp_en`, `description_vi`, `description_en`, `product_slug`) VALUES
(34, 'Bún Bò', 'Bun Bo', '<p><strong>Th&agrave;nh phần:</strong></p>\r\n\r\n<p><strong>+&nbsp;</strong>Topping:&nbsp;Chả cua, gầu b&ograve;, ng&ograve; gai, rau răm, h&agrave;nh l&aacute;, h&agrave;nh t&acirc;y</p>\r\n\r\n<p><strong>+&nbsp;</strong>Ăn k&egrave;m:&nbsp;B&uacute;n tươi, rau muống b&agrave;o, bắp chuối b&agrave;o, gi&aacute; sống, ng&ograve; gai, chanh kh&ocirc;ng hạt, ớt Batri, Sa tế kh&ocirc;, rau quế, h&uacute;ng quế</p>\r\n\r\n<p><strong>+&nbsp;</strong>Nước l&egrave;o: Xương ống b&ograve;, xương b&aacute;nh ch&egrave; heo, t&ocirc;m kh&ocirc;, tỏi, h&agrave;nh t&iacute;m, h&agrave;nh t&acirc;y, ớt sừng, sả c&acirc;y, sa tế, dầu ăn, đường ph&egrave;n, đường c&aacute;t, bột ngọt, nước mắm</p>\r\n\r\n<p><strong>Khẩu phần:</strong>&nbsp;1 người</p>\r\n\r\n<p><strong>Thời gian ho&agrave;n tất</strong>&nbsp;(chưa bao gồm thời gian vận chuyển): 10 ph&uacute;t</p>', '<p><strong>Ingredients:</strong></p>\r\n\r\n<p>+ Topping: Crab spring rolls, brisket, cilantro, Vietnamese coriander, spring onions, onions</p>\r\n\r\n<p>+ Served with: Fresh vermicelli, shredded water spinach, shredded banana blossom, raw bean sprouts, cilantro, seedless lemons, Batri chilies, dried shacha sauce, basil</p>\r\n\r\n<p>+ Broth: Beef bone, pork kneecap, dried shrimps, garlic, red onions, onions, horn peppers, lemongrass, shacha sauce, cooking oil, rock sugar, granulated sugar, monosodium glutamate, fish sauce</p>\r\n\r\n<p><strong>Servings</strong>: 1 serving</p>\r\n\r\n<p><strong>Cook time</strong>: 10 minutes</p>', 'bun-bo'),
(35, 'Salad cá hồi xông khói', 'Seasonal smoked salmon, vegetable salad', '<p><strong>Th&agrave;nh phần:&nbsp;</strong>C&aacute; hồi x&ocirc;ng kh&oacute;i, t&aacute;o đỏ, t&aacute;o xanh, củ dền, c&agrave; rốt, x&agrave; l&aacute;ch lolo, x&agrave; l&aacute;ch carron, chanh d&acirc;y, dầu oliu, rau quế, mayonaise,...</p>\r\n\r\n<p><strong>Khẩu phần:</strong>&nbsp;1-2 người</p>\r\n\r\n<p><strong>Năng lượng:</strong>&nbsp;Protein: 11.2, Carbs: 14.4, Fat: 12.2, Total Kcal: 211.8</p>\r\n\r\n<p><strong>Thời gian ho&agrave;n tất</strong>&nbsp;(chưa bao gồm thời gian vận chuyển): 15 ph&uacute;t</p>', '<p><strong>Ingredients</strong>: Smoked salmon, red apple, green apple, beetroot, carrot, lolo lettuce, carron lettuce, passion fruit, olive oil, basil, mayonnaise,...</p>\r\n\r\n<p><strong>Servings</strong>: 1 &ndash; 2 people</p>\r\n\r\n<p><strong>Calories</strong>: Protein: 11.2, Carbs: 14.4, Fat: 12.2, Total Kcal: 211.8</p>\r\n\r\n<p><strong>Cook time</strong>: 15 minutes</p>', 'salad'),
(36, 'Nem chua', 'Fermented pork roll', '<p><strong>Th&agrave;nh phần:</strong>&nbsp;Nạc m&ocirc;ng, da heo, muối hột, đường c&aacute;t, ti&ecirc;u đen hạt</p>\r\n\r\n<p>+ Ăn k&egrave;m: Th&iacute;nh bắp (Bắp hạt Mỹ kh&ocirc;), tương ớt, đinh lăng, l&aacute; sung, tỏi c&ocirc; đơn, ớt hiểm</p>\r\n\r\n<p><strong>Khẩu phần:</strong>&nbsp;1 - 2 người</p>\r\n\r\n<p><strong>Thời gian ho&agrave;n tất</strong>&nbsp;(chưa bao gồm thời gian vận chuyển): 10 ph&uacute;t</p>', '<p><strong>Ingredients</strong>: Pork, pig skin, garlic, American sweet corn, banana leaves, sugar, salt, MSG, whole black pepper+ Served with: Dried corn flakes (American sweet corn), chili sauce, lentils, fig leaves, garlic, chili</p>\r\n\r\n<p><strong>Servings</strong>: 1-2</p>\r\n\r\n<p><strong>Cook time</strong>: 10 minutes</p>', 'nem-chua'),
(37, 'Chạo Tôm', 'Grilled shrimp lemongrass skewers', '<p><strong>Th&agrave;nh phần:</strong>&nbsp;T&ocirc;m, gi&ograve; sống, mỡ lưng heo, trứng g&agrave;, sả, riềng, ng&ograve; r&iacute;, gừng, h&agrave;nh t&iacute;m, dầu m&egrave;, bột ngọt, dầu m&agrave;u điều, đường c&aacute;t</p>\r\n\r\n<p>+ Nước chấm: Nước mắm, đường c&aacute;t, thơm, bột ngọt, tỏi, ớt sừng, chanh Đ&agrave; Lạt</p>\r\n\r\n<p>+ Ăn k&egrave;m: B&uacute;n tươi, b&aacute;nh tr&aacute;ng, dưa leo, thơm gọt, khế chua, diếp c&aacute;, h&uacute;ng lủi, t&iacute;a t&ocirc;, ng&ograve; r&iacute;, l&aacute; quế, x&agrave; l&aacute;ch l&ocirc; l&ocirc; t&iacute;m</p>\r\n\r\n<p>+ Trang tr&iacute;: Dầu ăn Tường An, h&agrave;nh l&aacute;, đậu phộng, ớt sừng, h&agrave;nh boa-r&ocirc;</p>\r\n\r\n<p><strong>Khẩu phần:</strong>&nbsp;1 - 2 người</p>\r\n\r\n<p><strong>Thời gian ho&agrave;n tất</strong>&nbsp;(chưa bao gồm thời gian vận chuyển): 10 - 12 ph&uacute;t</p>', '<p><strong>Ingredients</strong>: Shrimp, original marinated minced pork, pork fatback, chicken eggs, lemongrass, galangal, coriander, ginger, red onion, sesame oil, monosodium glutamate, cashew oil, sugar</p>\r\n\r\n<p>+ Dipping sauce: Fish sauce, rock sugar, chili sauce, white sesame, chili, peanut butter, garlic, kumquat</p>\r\n\r\n<p>+ Served with: fresh vermicelli, rice paper, cucumber, pineapple, star fruit, lettuce, basil, perilla, coriander, cinnamon leaf, purple lettuce.</p>\r\n\r\n<p>+ Garnish: Tuong An cooking oil, scallions, peanuts, horn peppers, leek.</p>\r\n\r\n<p><strong>Servings</strong>: 1 - 2 people</p>\r\n\r\n<p><strong>Cook time</strong>: 10 - 12 minutes</p>', 'chao-tom'),
(38, 'Salad bò Nam Bộ', 'Southern Vietnamese beef salad', '<p><strong>Th&agrave;nh phần:</strong>&nbsp;Thăn b&ograve;, h&uacute;ng quế, ng&ograve; gai, rau c&agrave;ng cua, l&aacute; c&oacute;c, l&aacute; quế vị, x&agrave; l&aacute;ch l&ocirc; l&ocirc; xanh, tắc, khế, c&agrave; ph&aacute;o, h&agrave;nh t&iacute;m, sả, ớt sừng, m&egrave; trắng, l&aacute; chanh th&aacute;i</p>\r\n\r\n<p><strong>Khẩu phần:</strong>&nbsp;1 - 2 người</p>\r\n\r\n<p><strong>Năng lượng:&nbsp;</strong>Protein - 23.165, Carbs - 7.4, Fats - 6.1 (Total Kcal - 177.16)</p>\r\n\r\n<p><strong>Thời gian ho&agrave;n tất</strong>&nbsp;(chưa bao gồm thời gian vận chuyển): 15 ph&uacute;t</p>', '<p><strong>Ingredients</strong>: Beef tenderloin, basil, coriander, coriander, coriander leaves, cinnamon leaves, green batch lettuce, kumquat, star fruit, eggplant, red onion, lemongrass, horn pepper, white sesame, lemon leaf</p>\r\n\r\n<p><strong>Servings</strong>: 1 &ndash; 2 people</p>\r\n\r\n<p><strong>Calories</strong>: Protein - 23.165, Carbs - 7.4, Fats - 6.1 (Total Kcal - 177.16)</p>\r\n\r\n<p><strong>Cook time</strong>: 15 minutes</p>', 'salad-bo-nam-bo'),
(39, 'Cà ri gà', 'Chicken Curry', '<p><strong>Th&agrave;nh phần:</strong>&nbsp;G&agrave; ta Bến Tre, khoai lang, khoai m&ocirc;n, củ sen, h&agrave;nh t&iacute;m, sả c&acirc;y, gừng củ, gi&aacute; sống, tỏi, bột c&agrave; ri, bột ngọt, nước mắm, hạt n&ecirc;m, muối Th&aacute;i, ti&ecirc;u đen, dầu ăn, giấm trắng</p>\r\n\r\n<p>+ Nước d&ugrave;ng: Nước dừa tươi, nước cốt dừa, xương g&agrave;, củ sắn, h&agrave;nh t&acirc;y, bắp Mỹ, c&agrave; rốt, gừng củ, h&agrave;nh t&iacute;m</p>\r\n\r\n<p>+ Ăn k&egrave;m: B&aacute;nh m&igrave;</p>\r\n\r\n<p>+ Trang tr&iacute;: H&agrave;nh boa-r&ocirc;, ng&ograve; r&iacute;, ớt sừng,</p>\r\n\r\n<p>- Muối chấm g&agrave;: Muối, bột ngọt, đường, ti&ecirc;u đen, chanh Đ&agrave; Lạt</p>\r\n\r\n<p><strong>Khẩu phần:</strong>&nbsp;1 - 2 người</p>\r\n\r\n<p><strong>Thời gian ho&agrave;n tất</strong>&nbsp;(chưa bao gồm thời gian vận chuyển): 10 -12 ph&uacute;t</p>', '<p><strong>Ingredients</strong>: Ben Tre chicken, sweet potatoes, taros, lotus root, red onions, lemongrass, ginger, raw bean sprouts, garlic, curry powder, monosodium glutamate, fish sauce, seasoning, Thai salt, black pepper, cooking oil, white vinegar</p>\r\n\r\n<p>+ Broth: Fresh coconut water, coconut milk, chicken bones, tapioca, onions, American corn, carrots, ginger, red onions</p>\r\n\r\n<p>+ Served with: Bread</p>\r\n\r\n<p>+ Garnish: Allium Porum, coriander, horn pepper</p>\r\n\r\n<p>+ Dipping salt for chicken: Salt, monosodium glutamate, sugar, black pepper, Da Lat lemons</p>\r\n\r\n<p><strong>Servings</strong>: 1 - 2 people</p>\r\n\r\n<p><strong>Cook time</strong>: 10 -12 minutes</p>', 'ca-ri-ga'),
(40, 'Sườn heo nướng BBQ táo đỏ', 'Roasted BBQ pork ribs, red apple sauce, grilled vegetable', '<p><strong>Th&agrave;nh phần:</strong>&nbsp;Sườn tươi Việt Nam, củ sen, bột chi&ecirc;n gi&ograve;n, gia vị n&oacute;ng Ấn độ - Garam Masala, bột ngũ vị hương, bột ớt Paprika, bột tỏi, bột h&agrave;nh t&acirc;y.</p>\r\n\r\n<p>+ Sốt BBQ t&aacute;o đỏ: H&agrave;nh t&acirc;y, h&agrave;nh t&iacute;m, rượu vodka H&agrave; Nội, giấm b&ograve; - Worcestershire, ti&ecirc;u, tương c&agrave; chua, sốt c&agrave; chua, tương ớt, giấm t&aacute;o, t&aacute;o đỏ, sốt x&ocirc;ng kh&oacute;i - Hickory</p>\r\n\r\n<p><strong>Khẩu phần:</strong>&nbsp;1 - 2 người</p>\r\n\r\n<p><strong>Thời gian ho&agrave;n tất</strong>&nbsp;(chưa bao gồm thời gian vận chuyển): 20 ph&uacute;t</p>', '<p><strong>Ingredients</strong>: Fresh Vietnamese ribs, lotus root, deep-fried flour, Indian spices - Garam Masala, five-spice powder, Paprika chili powder, garlic powder, onion powder.</p>\r\n\r\n<p><strong>Red apple BBQ sauce</strong>: Onion, Hanoi vodka, beef vinegar - Worcestershire, pepper, ketchup, chili sauce, apple cider vinegar, red apple, smoked sauce - Hickory<br />\r\nServings: 1-2 people</p>\r\n\r\n<p><strong>Cook time</strong>: 20 minutes</p>', 'suon-heo-nuong-bbq-tao-do'),
(41, 'Ba rọi chiên mắm ngò', 'Deep fried pork belly, coriander fish sauce', '<p><strong>Th&agrave;nh phần:</strong>&nbsp;Thịt ba rọi r&uacute;t sườn Ba Lan, bột chi&ecirc;n gi&ograve;n, gạo th&aacute;i, ng&ograve; r&iacute;, tỏi củ, sả c&acirc;y, tắc, ớt sừng, dưa leo, ng&ograve; r&iacute;, ớt hiểm, thơm gọt, h&uacute;ng quế, h&uacute;ng lủi, l&ocirc; l&ocirc; xanh, l&ocirc; l&ocirc; t&iacute;m, dầu ăn, đường c&aacute;t, tương ớt, nước mắm, giấm gạo</p>\r\n\r\n<p><strong>Khẩu phần:</strong>&nbsp;1 - 2 người</p>\r\n\r\n<p><strong>Năng lượng:&nbsp;</strong>Protein - 16.7, Carbs - 0, Fats - 30.9 (Total Kcal - 344.9)</p>\r\n\r\n<p><strong>Thời gian ho&agrave;n tất</strong>&nbsp;(chưa bao gồm thời gian vận chuyển): 15 ph&uacute;t</p>', '<p><strong>Ingredients</strong>: Polish pork belly, deep-fried powder, Thai rice, coriander, garlic, lemongrass, kumquat, horn pepper, cucumber, Bird&#39;s eye chili, pineapple, basil, basil, water mint, green lettuce, purple lettuce, cooking oil, granulated sugar, chili sauce, fish sauce, rice vinegar</p>\r\n\r\n<p><strong>Servings</strong>: 1 &ndash; 2 people</p>\r\n\r\n<p><strong>Calories</strong>: Protein - 16.7, Carbs - 0, Fats - 30.9 (Total Kcal - 344.9)</p>\r\n\r\n<p><strong>Cook time</strong>: 15 minutes</p>', 'ba-roi-chien-mam-ngo'),
(42, 'Canh bí nụ nhồi tôm thịt', 'Stuffed prawn, pork pumpkin flower bud soup', '<p><strong>Th&agrave;nh phần:</strong>&nbsp;T&ocirc;m bạc thẻ, gi&ograve; sống, ba chỉ heo xay, b&ocirc;ng b&iacute; nụ, ng&ograve; r&iacute;, h&agrave;nh l&aacute;, tỏi củ, h&agrave;nh t&iacute;m, ớt sừng, bắp Mỹ, h&agrave;nh t&acirc;y, củ sắn nước, xương g&agrave;, đậu hủ non</p>\r\n\r\n<p><strong>Khẩu phần:</strong>&nbsp;1 - 2 người</p>\r\n\r\n<p><strong>Năng lượng:&nbsp;</strong>Protein - 25.6, Carbs - 10.1, Fats - 4.1 (Total Kcal - 179.7)</p>\r\n\r\n<p><strong>Thời gian ho&agrave;n tất</strong>&nbsp;(chưa bao gồm thời gian vận chuyển): 15 ph&uacute;t</p>', '<p><strong>Ingredients</strong>: Pumpkin flower bud, chicken bone, prawn, minced pork, pork fat, chicken egg, carrot, onion, spring onion, sweet corn, shallot, tapioca starch, pepper, salt, sugar, chicken powder...</p>\r\n\r\n<p><strong>Servings</strong>: 1-2 people</p>\r\n\r\n<p><strong>Calories</strong>: 179.7 kcal</p>\r\n\r\n<p><strong>Cook time</strong>: 15 minutes</p>', 'canh-bi-nu-nhoi-tom-thit'),
(43, 'Canh chua cá lóc', 'Vietnamese sweet & sour snakehead fish soup', '<p><strong>Th&agrave;nh phần:</strong>&nbsp;C&aacute; l&oacute;c fillet , me ch&iacute;n, c&agrave; chua, đậu bắp, bạc h&agrave;, thơm gọt, ớt sừng đỏ, ng&ograve; gai, rau om, ớt hiểm đỏ, tỏi củ, dầu ăn, bột thịt g&agrave;, muối, nước mắm</p>\r\n\r\n<p><strong>Khẩu phần:</strong>&nbsp;1 - 2 người</p>\r\n\r\n<p><strong>Năng lượng:&nbsp;</strong>Protein - 22.9, Carbs - 7.1, Fats - 2.2 (Total Kcal - 139.8)</p>\r\n\r\n<p><strong>Thời gian ho&agrave;n tất</strong>&nbsp;(chưa bao gồm thời gian vận chuyển): 15 ph&uacute;t</p>', '<p><strong>Ingredients</strong>: Snakehead fish fillet, ripe tamarind, tomato, okra, mint, pineapple, red pepper, coriander, cilantro, red pepper, garlic, cooking oil, chicken meat flour, salt, fish sauce</p>\r\n\r\n<p><strong>Servings</strong>: 1-2 people</p>\r\n\r\n<p><strong>Calories</strong>: Protein - 22.9, Carbs - 7.1, Fats - 2.2 (Total Kcal - 139.8)</p>\r\n\r\n<p><strong>Cook time</strong>: 15 minutes</p>', 'canh-chua-ca-loc'),
(44, 'Mì spaghetti sốt kem nấm', 'Creamy mushroom spaghetti', '<p><strong>Th&agrave;nh phần:</strong>&nbsp;M&igrave; spaghetti, ba chỉ x&ocirc;ng kh&oacute;i (Bacon), tỏi, h&agrave;nh t&acirc;y, nấm đ&ocirc;ng c&ocirc;, nấm đ&ugrave;i g&agrave;, kem sữa nấu, sữa tươi tiệt tr&ugrave;ng, trứng g&agrave;, ph&ocirc; mai parmesan, dầu &ocirc;-liu extra virgin, bơ lạt Anchor, đường c&aacute;t, muối, ti&ecirc;u đen</p>\r\n\r\n<p>+ Trang tr&iacute;: ng&ograve; t&acirc;y</p>\r\n\r\n<p>+ Ăn k&egrave;m: ph&ocirc; mai parmesan</p>\r\n\r\n<p><strong>Khẩu phần:</strong>&nbsp;1 - 2 người</p>\r\n\r\n<p><strong>Thời gian ho&agrave;n tất</strong>&nbsp;(chưa bao gồm thời gian vận chuyển): 10 ph&uacute;t</p>', '<p><strong>Ingredients</strong>: Spaghetti noodles, cooking cream, milk, smoked bacon, Parmesan cheese, shiitake mushroom, king oyster mushroom, onion, garlic, chicken egg, olive oil, parsley, sugar, salt...</p>\r\n\r\n<p>+ Decor: parsley</p>\r\n\r\n<p>+ Served with: parmesan cheese</p>\r\n\r\n<p><strong>Servings</strong>: 1-2 people</p>\r\n\r\n<p><strong>Cook time</strong>: 10 minutes</p>', 'mi-spaghetti-sot-kem-nam'),
(45, 'Dương chi cam lộ', 'Mango pomelo sago', '<p><strong>Th&agrave;nh phần:&nbsp;</strong>Puree xo&agrave;i, xo&agrave;i tươi, t&eacute;p bưởi da xanh, bột b&aacute;ng</p>', '<p><strong>Ingredients</strong>: Mango Puree, fresh mango, pomelo, tapioca starch</p>', 'duong-chi-cam-lo'),
(46, 'Chả giò pate', 'Deep fried pork pâté spring rolls', '<p><strong>Quy c&aacute;ch đ&oacute;ng g&oacute;i:</strong>&nbsp;1/ Cuốn: 06: 30 Gr / 1 cuốn - Tổng 180 Gr</p>\r\n\r\n<p>2/ Sốt: 50 Gr</p>\r\n\r\n<p>Tổng định lượng 230 Gr</p>\r\n\r\n<p><strong>Hương vị:&nbsp;B&ugrave;i b&eacute;o của pate &amp; ph&ocirc; mai, vỏ gi&ograve;n</strong></p>\r\n\r\n<p><strong>Nguy&ecirc;n vật liệu:&nbsp;</strong>Pa-t&ecirc; heo (11.34%), ph&ocirc; mai (11.34%), xo&agrave;i c&aacute;t (7.57%), t&aacute;o đỏ (7.57%), t&aacute;o xanh (7.57%), h&agrave;nh t&acirc;y, cần t&acirc;y, h&agrave;nh boa-r&ocirc;, khoai m&ocirc;n, khoai lang, tr&aacute;i l&ecirc;, cỏ xạ hương, l&aacute; hương thảo, ng&ograve; t&acirc;y, bột chi&ecirc;n x&ugrave;, bột chi&ecirc;n gi&ograve;n, da b&aacute;nh p&iacute;a, ma-yo-ne, sữa chua, chanh v&agrave;ng, rượu vang đỏ, bơ lạt, đường c&aacute;t, muối Th&aacute;i, ti&ecirc;u đen xay...</p>\r\n\r\n<p><strong>Nhiệt độ bảo quản &amp; HSD:&nbsp;</strong>Chả gi&ograve; &amp; sốt chấm: Ngăn đ&ocirc;ng -18&deg;C (HSD: 20 ng&agrave;y)</p>\r\n\r\n<p><strong>Khuyến c&aacute;o:</strong>&nbsp;Kh&ocirc;ng</p>\r\n\r\n<p><strong>Gợi &yacute; d&ugrave;ng k&egrave;m:</strong>&nbsp;Tr&agrave; sữa l&agrave;i hoa đậu biếc, ch&egrave; dưỡng nhan,...</p>', '<p><strong>Net weight</strong>: 200 g</p>\r\n\r\n<p><strong>Ingredients:&nbsp;</strong>Pork p&acirc;t&eacute; (11.34%), cheese (11.34%), ripped mango (7.57%), red apple (7.57%), green apple (7.57%), onion, leek, celery, taro, sweet potato, pear, thyme, rosemary, parsley, panko powder, crispy powder, wheat wrappers, mayonnaise, yoghurt, lemon, red wine, unsalted butter, sugar, salt, pepper...</p>\r\n\r\n<p><strong>Cooking Guidance:</strong></p>\r\n\r\n<p>Step 1: Thaw food in the refrigerator at 2-4&deg;C (around 4h). Do not consume thawed foods which is over 70h.</p>\r\n\r\n<p>Step 2: Deep frying the spring rolls:</p>\r\n\r\n<p>+ Deep fry the spring rolls at 160&deg;C in 3-4 minutes</p>\r\n\r\n<p>+ Turn the spring rolls during deep fry until golden brown</p>\r\n\r\n<p>Step 3: Served with defrosted dipping sauce.</p>\r\n\r\n<p><strong>Notice</strong>:</p>\r\n\r\n<p>- Cooking oil needs to be at the right temperature.</p>\r\n\r\n<p>- Spring rolls are easy to be burnt at high oil temperature (&gt;180&deg;C).</p>\r\n\r\n<p>- Place the rolls on the wire rack, and let the excess oil drain.</p>\r\n\r\n<p><strong>Warning</strong>:</p>\r\n\r\n<p>- The product&#39;s packaging is not suitable for microwave cooking.</p>\r\n\r\n<p>- Please be advised that our food may have come in contact or contain peanuts, tree nuts, soy, milk, eggs, wheat, shellfish or fish.</p>\r\n\r\n<p><strong>Reservation &amp; Expiry Date:&nbsp;</strong>Store at -18 ᣞC (30 days from the date of manufacture)</p>', 'cha-gio-pate'),
(47, 'Ức gà chiên xù', 'Crispy chicken, tomato cheese sauce', '<p><strong>Nhiệt độ bảo quản &amp; hạn sử dụng:</strong>&nbsp;Ngăn đ&ocirc;ng -18&deg;C<br />\r\nHSD: 20 ng&agrave;y</p>\r\n\r\n<p><strong>Khối lượng tịnh / Khối lượng tịnh hỗn hợp:</strong>&nbsp;350gr</p>\r\n\r\n<p><strong>Nguy&ecirc;n vật liệu:</strong>&nbsp;Khoai t&acirc;y (28.3%), ức g&agrave; r&uacute;t xương (20.3%), ph&ocirc; mai (7.6%), bột chi&ecirc;n x&ugrave; (2.8%), c&agrave; chua, tỏi, ti&ecirc;u xay, bột ớt, muối Th&aacute;i, đường c&aacute;t, dầu ăn...</p>\r\n\r\n<p><strong>Hướng dẫn chế biến:&nbsp;</strong></p>\r\n\r\n<p>Bước 1: R&atilde; đ&ocirc;ng sản phẩm trong ngăn m&aacute;t 10-12h. Kh&ocirc;ng sử dụng sản phẩm sau khi r&atilde; đ&ocirc;ng hơn 60h.<br />\r\nBước 2: Chi&ecirc;n g&agrave;:<br />\r\n+ C&aacute;ch 1: Cho g&agrave; v&agrave;o nồi chi&ecirc;n kh&ocirc;ng dầu tại 180&deg;C trong 3-5 ph&uacute;t<br />\r\n+ C&aacute;ch 2: Nướng g&agrave; trong l&ograve; đ&atilde; ổn định nhiệt độ 180&deg;C trong 3-5 ph&uacute;t.<br />\r\nBước 3: X&agrave;o khoai t&acirc;y:<br />\r\n+ Cho 10 Gr bơ v&ocirc; chảo n&oacute;ng<br />\r\n+ Khi bơ tan, th&igrave; cho khoai t&acirc;y v&agrave;o x&agrave;o. Đảo đều trong khoảng 2 ph&uacute;t.</p>\r\n\r\n<p><strong>Th&ocirc;ng tin th&ecirc;m:</strong>&nbsp;</p>\r\n\r\n<p>- Cho g&agrave; v&agrave;o l&ograve; khi nhiệt độ đạt y&ecirc;u cầu (180&deg;C).<br />\r\n- Bơ sẽ ch&aacute;y nếu chảo qu&aacute; n&oacute;ng.</p>\r\n\r\n<p><strong>Th&ocirc;ng tin cảnh b&aacute;o:</strong>&nbsp;</p>\r\n\r\n<p>- Bao b&igrave; sản phẩm kh&ocirc;ng sử dụng được cho l&ograve; vi s&oacute;ng.<br />\r\n- Kh&ocirc;ng sử dụng nếu dị ứng với một trong những th&agrave;nh phần của sản phẩm.</p>', '<p><strong>Net weight</strong>: 350 g</p>\r\n\r\n<p><strong>Ingredients:</strong>&nbsp;Potato (28.3%), boneless chicken breast (20.3%), cheese (7.6%), crispy powder (2.8%), tomato, garlic, pepper, paprika powder, salt, sugar, cooking oil...</p>\r\n\r\n<p><strong>Cooking Guidance:</strong></p>\r\n\r\n<p>Step 1: Thaw food in the refrigerator at 2-4&deg;C (around 10-12h). Do not consume thawed foods that are over 60h.</p>\r\n\r\n<p>Step2: Roast the chicken breast:</p>\r\n\r\n<p>+ Option 1: Fry the chicken breast in air-fryer at 180&deg;C around 3-5 minutes.</p>\r\n\r\n<p>+ Option 2: Preheat the oven to 180&deg;C for 15 minutes then roast the chicken breast at 180&deg;C around 3-5 minutes.</p>\r\n\r\n<p>Step 3: Stir fry the potato</p>\r\n\r\n<p>+ Add 10 Gr of unsalted butter into one hot pan</p>\r\n\r\n<p>+ Add potato to the pan when the butter is completely melted. Stir frequently for 2 minutes.</p>\r\n\r\n<p><strong>Notice</strong>:</p>\r\n\r\n<p>- Allow the oven to preheat for at least 15 minutes (180&deg;C).</p>\r\n\r\n<p>- High cooking temp will lead to burnt butter</p>\r\n\r\n<p><strong>Warning</strong>:</p>\r\n\r\n<p>- The product&#39;s packaging is not suitable for microwave cooking.</p>\r\n\r\n<p>- Please be advised that our food may have come in contact or contain peanuts, tree nuts, soy, milk, eggs, wheat, shellfish or fish.</p>\r\n\r\n<p><strong>Reservation &amp; Expiry Date:&nbsp;</strong>Store at -18 ᣞC (30 days from the date of manufacture)</p>', 'uc-ga-chien-xu'),
(48, 'Giò thủ', 'Head cheese', '<p><strong>Quy c&aacute;ch đ&oacute;ng g&oacute;i:</strong>&nbsp;Khoanh gi&ograve; thủ 200 gr</p>\r\n\r\n<p><strong>Hương vị:&nbsp;</strong>Hương vị ho&agrave; quyện, gi&ograve;n dai, thơm của ti&ecirc;u</p>\r\n\r\n<p><strong>Nguy&ecirc;n vật liệu:</strong>&nbsp;Tai heo (64.9%), h&agrave;nh t&iacute;m (6.5%), nấm m&egrave;o (5.8%), mũi heo (2.6%), gi&ograve; heo r&uacute;t xương (1.9%), l&aacute; chuối, muối Th&aacute;i, giấm gạo, ti&ecirc;u đen hạt, hạt n&ecirc;m, bột ngọt, nước mắm, đường c&aacute;t, dầu ăn</p>\r\n\r\n<p><strong>Nhiệt độ bảo quản &amp; HSD:</strong>&nbsp;Gi&ograve; thủ: Ngăn m&aacute;t 3-5&deg;C (HSD: 07 ng&agrave;y)</p>\r\n\r\n<p><strong>Khuyến c&aacute;o:</strong>&nbsp;Sản phẩm ăn liền</p>', '<p><strong>Net weight</strong>: 200 g</p>\r\n\r\n<p><strong>Ingredients:&nbsp;</strong>Pork ear (64.9%), shallot (6.5%), wood ear mushroom (5.8%), pig snout (2.6%), boneless pork hock (1.9%), banana leaves, salt, rice vinegar, whole pepper, pork powder, MSG, fish sauce, sugar, cooking oil</p>\r\n\r\n<p><strong>Cooking Guidance:</strong></p>\r\n\r\n<p>- Served cold.</p>\r\n\r\n<p>- Slice into small pieces as your desire.</p>\r\n\r\n<p><strong>Warning</strong>:</p>\r\n\r\n<p>- Please be advised that our food may have come in contact with or contain peanuts, tree nuts, soy, milk, eggs, wheat, shellfish, or fish.</p>\r\n\r\n<p><strong>Reservation &amp; Expiry Date:&nbsp;</strong>Store at 3-5&deg;C (07 days from the date of manufacture)</p>', 'gio-thu'),
(49, 'Sốt cay', 'Spicy sauce', '<p><strong>Quy c&aacute;ch:</strong>&nbsp;Hũ thuỷ tinh 150ml</p>\r\n\r\n<p><strong>Hương vị:</strong>&nbsp;Vị cay nhẹ, thơm m&ugrave;i l&aacute; chanh</p>\r\n\r\n<p><strong>Nguy&ecirc;n vật liệu:</strong>&nbsp;Ớt hiểm, ớt&nbsp; sừng, l&aacute;&nbsp; chanh, chanh, muối th&aacute;i, đường c&aacute;t, nước mắm, sữa đặc, sốt&nbsp; Mayonaise,...</p>\r\n\r\n<p><strong>Hướng dẫn sử dụng:&nbsp;</strong>Ngăn m&aacute;t 3-5&deg;C (HSD: 07 ng&agrave;y)</p>\r\n\r\n<p><strong>Gợi &yacute; d&ugrave;ng k&egrave;m:</strong>&nbsp;Ngon hơn khi sử dụng c&ugrave;ng m&oacute;n nướng v&agrave; m&oacute;n chi&ecirc;n</p>', '<p><strong>Net weight</strong>: 150 g</p>\r\n\r\n<p><strong>Ingredients:&nbsp;</strong>Sugar (27.8%), chili pepper (13.9%), fish sauce (13.9%), lime (11.1%), mayonnaise (9.7%), concentrated milk (9.7%), bird chili, passion fruit, lime leaf, MSG, salt</p>\r\n\r\n<p><strong>Notice</strong>:</p>\r\n\r\n<p>- Well-served with roasted meats and grilled seafood.</p>\r\n\r\n<p><strong>Warning</strong>:</p>\r\n\r\n<p>- Please be advised that our food may have come in contact with or contain peanuts, tree nuts, soy, milk, eggs, wheat, shellfish, or fish.</p>\r\n\r\n<p><strong>Reservation &amp; Expiry Date:&nbsp;</strong>Store at 3-5&deg;C (07 days from the date of manufacture)</p>', 'sot-cay'),
(50, 'Sốt mác mác', '\"Mac Mac\" sauce', '<p><strong>Quy c&aacute;ch:</strong>&nbsp;Hũ thuỷ tinh 100ml</p>\r\n\r\n<p><strong>Hương vị:&nbsp;</strong>Chua nhẹ của chanh d&acirc;y, hơi b&eacute;o của sốt Mayonaise, thơm nhẹ nh&agrave;ng m&ugrave;i quế &amp; chanh d&acirc;y</p>\r\n\r\n<p><strong>Nguy&ecirc;n vật liệu:</strong>&nbsp;Dầu oliu, chanh d&acirc;y, sốt&nbsp; Mayonaise, muối th&aacute;i, đường c&aacute;t,...</p>\r\n\r\n<p><strong>Hướng dẫn sử dụng:</strong></p>\r\n\r\n<p>- Ngăn m&aacute;t 3-5&deg;C (HSD: 07 ng&agrave;y)</p>\r\n\r\n<p>- Trộn rau theo tỉ lệ 30 Gr sốt &amp; 100 Gr x&agrave; l&aacute;ch hỗn hợp</p>\r\n\r\n<p><strong>Lưu &yacute;:</strong></p>\r\n\r\n<p>&nbsp;- Lắc đều trước khi sử dụng.</p>\r\n\r\n<p>- Ngon hơn khi ăn k&egrave;m c&aacute;c loại x&agrave; l&aacute;ch &Acirc;u.&nbsp;</p>', '<p><strong>Net weight</strong>: 100 g</p>\r\n\r\n<p><strong>Ingredients:&nbsp;</strong>Mayonnaise (32.8%), passion fruit (24.6%), sugar (16.4%), Vietnamese basil (12.3%), olive oil (12.3%), salt (1.6%)</p>\r\n\r\n<p><strong>Cooking Guidance:</strong></p>\r\n\r\n<p>Mixing guide: 30 Gr of sauce &amp; 100 Gr of mixed lettuce</p>\r\n\r\n<p><strong>Notice</strong>:</p>\r\n\r\n<p>- Shake well before using.</p>\r\n\r\n<p>- Well-served with Western lettuce.</p>\r\n\r\n<p><strong>Warning</strong>:</p>\r\n\r\n<p>- Please be advised that our food may have come in contact with or contain peanuts, tree nuts, soy, milk, eggs, wheat, shellfish, or fish.</p>\r\n\r\n<p><strong>Reservation &amp; Expiry Date:&nbsp;</strong>Store at 3-5&deg;C (03 days from the date of manufacture.</p>', 'sot-mac-mac'),
(51, 'Củ sen phô mai', 'Lotus root, cheese chips', '<p><strong>Quy c&aacute;ch:</strong>&nbsp;Hũ nhựa 90 gram</p>\r\n\r\n<p><strong>Hương vị:</strong>&nbsp;Vị ngon, b&ugrave;i của củ sen, mặn &amp; b&eacute;o của ph&ocirc; mai</p>\r\n\r\n<p><strong>Nguy&ecirc;n vật liệu:</strong>&nbsp;Củ sen tươi, bột ph&ocirc; mai, bột tỏi, bột ớt, bột thịt g&agrave;,...</p>\r\n\r\n<p><strong>Th&ocirc;ng tin sản phẩm:</strong>&nbsp;Củ sen ph&ocirc; mai - m&oacute;n ăn nhẹ thơm ngon, gi&agrave;u dinh dưỡng l&agrave; lựa chọn l&yacute; tưởng cho c&aacute;c t&iacute;n đồ ăn vặt mỗi ng&agrave;y. Với từng miếng củ sen gi&ograve;n tan, bao phủ b&ecirc;n ngo&agrave;i l&agrave; lớp bột ph&ocirc; mai b&eacute;o thơm, mặn mặn đủ khiến bạn ăn ho&agrave;i kh&ocirc;ng ch&aacute;n. Th&ecirc;m v&agrave;o đ&oacute;, m&oacute;n ăn hấp dẫn n&agrave;y c&ograve;n chứa nhiều kho&aacute;ng chất, protein thực vật v&agrave; h&agrave;m lượng vitamin c&ugrave;ng chất xơ lớn rất tốt cho sức khỏe, ph&ugrave; hợp cho mọi độ tuổi.</p>\r\n\r\n<p><strong>Hướng dẫn sử dụng:</strong></p>\r\n\r\n<p>HSD: 30 ng&agrave;y</p>\r\n\r\n<p>HDBQ: Bảo quản nơi kh&ocirc; r&aacute;o, tho&aacute;ng m&aacute;t. Đậy k&iacute;n nắp hộp khi sử dụng kh&ocirc;ng hết.</p>\r\n\r\n<p><strong>Khuyến c&aacute;o:</strong>&nbsp;Kh&ocirc;ng</p>\r\n\r\n<p><strong>Gợi &yacute; d&ugrave;ng k&egrave;m:&nbsp;</strong>Tr&agrave; sữa TASTY, Hồng tr&agrave; cam quế, Dragon fruit yakult,..</p>', '<p><strong>Net weight</strong>: 90 g</p>\r\n\r\n<p><strong>Ingredients:&nbsp;</strong>Fresh lotus roots (64.4%), crispy powder (18.4%), cooking oil (11.5%), cheese powder (4.6%), garlic powder, onion powder, chicken powder, chili powder</p>\r\n\r\n<p><strong>Notice</strong>:&nbsp;Once opened, consume within 03 days</p>\r\n\r\n<p><strong>Warning</strong>:</p>\r\n\r\n<p>- Please be advised that our food may have come in contact or contain peanuts, tree nuts, soy, milk, eggs, wheat, shellfish or fish.</p>\r\n\r\n<p><strong>Reservation &amp; Expiry Date:&nbsp;</strong>Store at room temperature (30 days from the date of manufacture)</p>', 'cu-sen-pho-mai'),
(52, 'Dragon Fruit Yakult', 'Dragon Fruit Yakult', '<p><strong>Th&agrave;nh phần:&nbsp;</strong>Yakult, nước &eacute;p sơri thanh long, tr&acirc;n ch&acirc;u trắng</p>', '<p><strong>Ingredients</strong>: Yakult, acerola juice, dragon fruit juice, white pearls</p>', 'dragon-fruit-yakult'),
(53, 'Vitamin Day', 'Vitamin Day', '<p><strong>Th&agrave;nh phần:&nbsp;</strong>Nước &eacute;p cam, nước &eacute;p thơm, nha đam, tr&acirc;n ch&acirc;u trắng</p>', '<p><strong>Ingredients</strong>: Orange juice, pineapple juice, aloe vera, white pearl</p>', 'vitamin-day'),
(54, 'Trà sữa', 'Milk tea', '<p><strong>Th&agrave;nh phần:&nbsp;</strong>Tr&agrave; đen, bột sữa t&aacute;ch b&eacute;o, tr&acirc;n ch&acirc;u mật ong</p>', '<p><strong>Ingredients</strong>: Black tea, skim milk powder, honey pearls</p>', 'tra-sua'),
(55, 'Cà phê sữa đá', 'Iced milk coffee', '<p><strong>Th&agrave;nh phần:&nbsp;</strong>C&agrave; ph&ecirc; pha phin, sữa đặc, sữa b&eacute;o</p>', '<p><strong>Ingredients</strong>: Filtered coffee, full-fat milk, condensed milk</p>', 'ca-phe-sua-da'),
(56, 'Tiramisu coffee', 'Tiramisu coffee', '<p><strong>Th&agrave;nh phần:&nbsp;</strong>C&agrave; ph&ecirc; pha phin, syrup b&aacute;nh cookies, sữa đặc, sữa tươi, milk foam, kẹo dalgona</p>', '<p><strong>Ingredients</strong>: Filtered coffee, cookie syrup, condensed milk, fresh milk, milk foam, dalgona candy</p>', 'tiramisu-coffee'),
(57, 'Trà sữa xoài sầu riêng', 'Durian mango milk tea', '<p><strong>Thành ph&acirc;̀n</strong>: Tr&agrave; Oolong, mứt xo&agrave;i, bột sầu ri&ecirc;ng, bột sữa t&aacute;ch b&eacute;o</p>', '<p><strong>Ingredients</strong>: Oolong tea, mango jam, durian powder, skim milk powder</p>', 'trà-sũa-xoài-sàu-rieng'),
(58, 'Cà phê đen chai', 'Black coffee', '<p><strong>Quy c&aacute;ch:&nbsp;</strong>Chai thủy tinh dẹt, dung t&iacute;ch 200ml.</p>\r\n\r\n<p><strong>Hương vị:&nbsp;</strong>Đậm vị c&agrave; ph&ecirc;.</p>\r\n\r\n<p><strong>Th&agrave;nh phần:&nbsp;</strong>C&agrave; ph&ecirc; pha phin, đường.</p>', '<p><strong>Specification</strong>: Flat glass bottle, capacity 250ml ~ 1 serving</p>\r\n\r\n<p><strong>Taste</strong>: Strong coffee flavor.</p>\r\n\r\n<p><strong>Ingredients</strong>: Filtered coffee, sugar.</p>', 'ca-phe-den-chai'),
(59, 'Cà phê sữa', 'Milk coffee', '<p><strong>Quy c&aacute;ch:&nbsp;</strong>Chai thủy tinh dẹt, dung t&iacute;ch 200ml.</p>\r\n\r\n<p><strong>Hương vị:&nbsp;</strong>Đậm cafe, vị ngọt b&eacute;o.</p>\r\n\r\n<p><strong>Th&agrave;nh phần:&nbsp;</strong>C&agrave; ph&ecirc; L&acirc;m Đồng pha phin, sữa mix.</p>', '<p><strong>Specification</strong>: Flat glass bottle, capacity 200ml</p>\r\n\r\n<p><strong>Taste</strong>: Strong coffee, sweet and fatty taste</p>\r\n\r\n<p><strong>Ingredients</strong>: Lam Dong filtered coffee, milk</p>', 'ca-phe-sua'),
(60, 'Original cold brew coffee', 'Original cold brew coffee', '<p><strong>Quy c&aacute;ch</strong>:&nbsp;Chai thuỷ tinh tr&ograve;n, dung t&iacute;ch 200ml ~ 2-3 lần uống</p>\r\n\r\n<p><strong>Hương vị</strong>: Vị cafe thơm nhẹ nh&agrave;ng</p>\r\n\r\n<p><strong>Nguy&ecirc;n vật liệu</strong>: 100% C&agrave; ph&ecirc; Arabica ủ lạnh</p>\r\n\r\n<p><strong>Hướng dẫn sử dụng</strong>:</p>\r\n\r\n<p>Hạn sử dụng: 7 ng&agrave;y&nbsp;</p>\r\n\r\n<p>N&ecirc;n sử dụng trong v&ograve;ng 24h kể từ khi mở nắp</p>\r\n\r\n<p>Lắc đều trước khi sử dụng</p>\r\n\r\n<p><strong>Khuyến c&aacute;o</strong>:&nbsp;Sản phẩm c&oacute; chứa cafein</p>', '<p><strong>Specification</strong>: Round glass bottle, capacity 250ml ~ 2-3 servings</p>\r\n\r\n<p><strong>Taste</strong>: Light coffee taste</p>\r\n\r\n<p><strong>Ingredients</strong>: 100% cold brewed Arabica coffee</p>\r\n\r\n<p><strong>Directions for use</strong>: Expiry date: 5 days</p>\r\n\r\n<p>Should be used within 24 hours of opening</p>\r\n\r\n<p>Shake well before using</p>\r\n\r\n<p><strong>Recommendation</strong>: The product contains caffeine</p>', 'original-cold-brew-coffee'),
(61, 'Trà hibiscus thanh yên', 'Yuzu Hibiscus Jasmine', '<p><strong>Quy c&aacute;ch</strong>:&nbsp;Chai thuỷ tinh tr&ograve;n, dung t&iacute;ch 250ml ~ 2 lần uống</p>\r\n\r\n<p><strong>Hương vị</strong>:&nbsp;Vị tr&agrave; xanh kết hợp với tr&agrave; hoa, chua của mứt thanh y&ecirc;n, gi&ograve;n của tr&acirc;n ch&acirc;u trắng</p>\r\n\r\n<p><strong>Nguy&ecirc;n vật liệu</strong>:&nbsp;Tr&agrave; xanh hoa l&agrave;i Đ&agrave;i Loan, hoa lạc thần, mứt thanh y&ecirc;n Nhật, tr&acirc;n ch&acirc;u trắng</p>\r\n\r\n<p><strong>Th&ocirc;ng tin sản phẩm</strong>: Tr&agrave; hibiscus thanh y&ecirc;n l&agrave; sự kết hợp tinh tế giữa 2 loại tr&agrave; xanh hoa l&agrave;i Đ&agrave;i Loan, hoa lạc thần v&agrave; mứt thanh y&ecirc;n. Thức uống bật l&ecirc;n hương vị đậm v&agrave; thơm của tr&agrave; &amp; hậu vị thanh m&aacute;t chua nhẹ</p>\r\n\r\n<p><strong>Hướng dẫn sử dụng</strong>:&nbsp;Hạn sử dụng: 72 giờ</p>\r\n\r\n<p>N&ecirc;n sử dụng trong v&ograve;ng 24h kể từ khi mở nắp</p>\r\n\r\n<p>Lắc đều trước khi sử dụng</p>\r\n\r\n<p><strong>Khuyến c&aacute;o</strong>:&nbsp;&quot;Sản phẩm c&oacute; chứa rất &iacute;t cafein&quot;</p>', '<p><strong>Specification</strong>: Round glass bottle, capacity 250ml ~ 2 servings</p>\r\n\r\n<p><strong>Taste</strong>: Green tea flavor combined with flower tea, sour of Citrus jam, crispy of white pearls</p>\r\n\r\n<p><strong>Ingredients</strong>: Taiwanese jasmine green tea, Citrus flowers, Citrus Japanese jam, white pearls</p>\r\n\r\n<p><strong>Product information</strong>: Citrus hibiscus tea is a delicate combination between 2 types of green tea, Taiwanese jasmine flower, passion flower and Citrus jam. The drink brings out the bold and aromatic flavor of tea &amp; the last mild sour taste</p>\r\n\r\n<p><strong>Directions for use</strong>: Expiry date: 72 hours</p>\r\n\r\n<p>Should be used within 24 hours of opening</p>\r\n\r\n<p>Shake well before using</p>\r\n\r\n<p><strong>Recommendation</strong>: The product contains very little caffeine</p>', 'tra-hibiscus-thanh-yen'),
(62, 'Trà lài kiwi nha đam', 'Aloe Kiwi Jasmine', '<p><strong>Quy c&aacute;ch</strong>:&nbsp;Chai thuỷ tinh tr&ograve;n, dung t&iacute;ch 250ml ~ 1 lần uống</p>\r\n\r\n<p><strong>Hương vị</strong>:&nbsp;Vị tr&agrave; tr&agrave; xanh, m&aacute;t, thanh của nha đam, hương nhẹ l&aacute; dứa, sả, hậu vị thơm kiwi</p>\r\n\r\n<p><strong>Nguy&ecirc;n vật liệu</strong>:&nbsp;Tr&agrave; xanh hoa l&agrave;i Đ&agrave;i Loan, mứt kiwi, nha đam, syrup sả l&aacute; dứa</p>\r\n\r\n<p><strong>Th&ocirc;ng tin sản phẩm</strong>: Tr&agrave; l&agrave;i kiwi nha đam l&agrave; sự kết hợp thuần t&uacute;y từ tr&agrave; xanh hoa l&agrave;i Đ&agrave;i Loan c&ugrave;ng sự ngọt thanh của nha đam, kiwi v&agrave; l&aacute; dứa mang đến nhiều tầng hương vị thơm ngon kh&oacute; cưỡng</p>\r\n\r\n<p><strong>Hướng dẫn sử dụng</strong>:&nbsp;Hạn sử dụng: 72 giờ</p>\r\n\r\n<p>N&ecirc;n sử dụng trong v&ograve;ng 24h kể từ khi mở nắp</p>\r\n\r\n<p>Lắc đều trước khi sử dụng</p>\r\n\r\n<p><strong>Khuyến c&aacute;o</strong>:&nbsp;&quot;Sản phẩm c&oacute; chứa cafein&quot;</p>', '<p><strong>Specification</strong>: Round glass bottle, capacity 250ml ~ 1 servings</p>\r\n\r\n<p><strong>Taste</strong>: Green tea, cool of aloe vera, light flavor of pandan, lemongrass, kiwi flavor aftertaste</p>\r\n\r\n<p><strong>Ingredients</strong>: Taiwan jasmine green tea, kiwi jam, aloe vera, lemongrass pandan leaf syrup</p>\r\n\r\n<p><strong>Product information</strong>: Aloe kiwi jasmine tea is a pure combination of Taiwanese jasmine green tea with the sweetness of aloe vera, kiwi and pandan leaves to bring many layers of irresistible delicious flavor.</p>\r\n\r\n<p><strong>Directions for use</strong>: Expiry date: 72 hours</p>\r\n\r\n<p>Should be used within 24 hours of opening</p>\r\n\r\n<p>Shake well before using</p>\r\n\r\n<p><strong>Recommendation</strong>: The product contains very little caffeine</p>', 'tra-lai-kiwi-nha-dam'),
(63, 'Trà hibiscus táo dứa', 'Apple Pandan Hibiscus', '<p><strong>Quy c&aacute;ch</strong>: Chai thuỷ tinh tr&ograve;n, dung t&iacute;ch 250ml ~ 2 lần uống</p>\r\n\r\n<p><strong>Hương vị</strong>: Vị tr&agrave; hoa nhẹ nh&agrave;ng, thơm m&ugrave;i sả &amp; l&aacute; dứa</p>\r\n\r\n<p><strong>Nguy&ecirc;n vật liệu</strong>:&nbsp;Hoa Lạc Thần, t&aacute;o xanh, syrup sả l&aacute; dứa, tr&acirc;n ch&acirc;u trắng</p>\r\n\r\n<p><strong>Th&ocirc;ng tin sản phẩm</strong>:&nbsp;Tr&agrave; kh&ocirc;ng những c&oacute; nhiều t&aacute;c dụng tốt cho sức khoẻ: cải thiện hệ ti&ecirc;u ho&aacute;, cholesterol trong m&aacute;u, huyết &aacute;p, giảm c&acirc;n,... m&agrave; hương vị cũng đặc biệt thơm ngon bằng sự kết hợp của t&aacute;o xanh, m&ugrave;i thơm của sả v&agrave; độ gi&ograve;n của tr&acirc;n ch&acirc;u</p>\r\n\r\n<p><strong>Hướng dẫn sử dụng</strong>:Hạn sử dụng: 72 giờ</p>\r\n\r\n<p>N&ecirc;n sử dụng trong v&ograve;ng 24h kể từ khi mở nắp</p>\r\n\r\n<p>Lắc đều trước khi sử dụng</p>\r\n\r\n<p><strong>Khuyến c&aacute;o</strong>:&nbsp;&quot;Sản phẩm c&oacute; chứa cafein&quot;</p>', '<p><strong>Specification</strong>: Round glass bottle, capacity 250ml ~ 2 servings</p>\r\n\r\n<p><strong>Taste</strong>: Mild floral tea flavor mixed with fragrant of with lemongrass and pandan leaves</p>\r\n\r\n<p><strong>Ingredients</strong>: Flowers, green apple, lemongrass pandan leaf syrup, white pearls</p>\r\n\r\n<p><strong>Product information</strong>: Apple Pandan Hibiscus tea is not only especially delicious with the combination of green apples, the scent of lemongrass and the crispiness of pearls, but also has many good health effects such as improving digestion, blood cholesterol, blood pressure, losing weight,</p>\r\n\r\n<p><strong>Directions for use</strong>: Expiry date: 72 hours</p>\r\n\r\n<p>Should be used within 24 hours of opening</p>\r\n\r\n<p>Shake well before using</p>\r\n\r\n<p><strong>Recommendation</strong>: The product contains very little caffeine</p>', 'tra-hibiscus-tao-dua'),
(64, 'Set lẩu Thái 2-3 người', 'Thai-style hotpot 2-3 guests', '<p><strong>Quy c&aacute;ch đ&oacute;ng g&oacute;i</strong>:&nbsp;Set lẩu gồm nước lẩu Th&aacute;i &amp; đồ ăn k&egrave;m.</p>\r\n\r\n<p>1 set bao gồm:&nbsp;Lẩu th&aacute;i (1200ml),&nbsp;Bắp b&ograve; (100gr),&nbsp;T&ocirc;m thẻ (80gr), Mực (80gr),&nbsp;C&aacute; vi&ecirc;n (10 vi&ecirc;n),&nbsp;Nấm kim ch&acirc;m (100gr),&nbsp;Cải thảo (100gr),&nbsp;&nbsp;Rau muống (100gr), M&igrave; tươi (150gr).</p>\r\n\r\n<p><strong>Hương vị</strong>:&nbsp;Chua, cay, thơm m&ugrave;i sả, riềng &amp; l&aacute; chanh</p>\r\n\r\n<p><strong>Nguy&ecirc;n vật liệu (nước lẩu)</strong>:&nbsp;Sả c&acirc;y, củ riềng, h&agrave;nh t&iacute;m, l&aacute; chanh, t&ocirc;m, ớt sừng, gừng, tomyum paste, c&agrave; chua paste, nước cốt dừa, muối Th&aacute;i, đường c&aacute;t, nước mắm, dầu ăn...</p>\r\n\r\n<p><strong>Nhiệt độ bảo quản &amp; HSD</strong>:&nbsp;</p>\r\n\r\n<p>​Nước lẩu: Ngăn đ&ocirc;ng -18&deg;C (HSD: 20 ng&agrave;y) / ngăn m&aacute;t 3-5&deg;C (HSD: 72 giờ)</p>\r\n\r\n<p>Thịt &amp; Hải sản: Ngăn đ&ocirc;ng -18&deg;C (HSD: 20 ng&agrave;y) / ngăn m&aacute;t 3-5&deg;C (HSD: 24 giờ)</p>\r\n\r\n<p>Rau lẩu &amp; M&igrave; tươi: Ngăn m&aacute;t 3-5&deg;C (HSD: 24 giờ)​</p>\r\n\r\n<p><strong>Khuyến c&aacute;o</strong>:&nbsp;Th&agrave;nh phần c&oacute; khả năng dị ứng: t&ocirc;m</p>\r\n\r\n<p><strong>Gợi &yacute; d&ugrave;ng k&egrave;m</strong>:&nbsp;Dragon fruit yakult, hồng tr&agrave; cam quế.</p>', '<p><strong>Packaging</strong>: Hotpot set includes Thai hotpot broth &amp; side dishes</p>\r\n\r\n<p>1 set includes: Thai Hot Pot (1200ml), Beef Cabbage (100gr), Shrimp (80gr), Squid (80gr), Fish ball (10 capsules), Enoki mushrooms (100gr), Cabbage (100gr), Water spinach (100gr), Fresh Noodles (150gr).</p>\r\n\r\n<p>Net weight: 2.000g</p>\r\n\r\n<p><strong>Taste</strong>: Sour, spicy, fragrant with lemongrass, galangal &amp; lime leaves</p>\r\n\r\n<p><strong>Ingredients:</strong></p>\r\n\r\n<p>Broth: Pork hock bone (20.3%), pork parietal bone (20.3%), cassava (8.1%), cassava tubers (8.1%), carrot (8.1%), white peppercorn (1.1%), whole black pepper (1.1%), pink pepper (0.3%), ginger, shallot, leek, cinnamon, star anise, clove, sweet corn, salt, sugar, fish sauce, cooking oil...</p>\r\n\r\n<p><strong>Reservation &amp; Expiry Date:</strong></p>\r\n\r\n<p>Broth: Store at -18 ᣞC (30 days from the date of manufacture)</p>\r\n\r\n<p>Meats &amp; Seafoods: Store at -18 ᣞC (30 days from the date of manufacture)</p>\r\n\r\n<p>Vegetables &amp; Fresh noodles: Store at 3-5&deg;C (24 hours from the time of manufacture)</p>\r\n\r\n<p><strong>Cooking guidance:</strong></p>\r\n\r\n<p>Step 1: Thaw food in the refrigerator at 2-4&deg;C (around 20-24h). Do not consume thawed broth which is over 48h and 24h for thawed meats &amp; seafoods</p>\r\n\r\n<p>Step 2: Reheat the broth:</p>\r\n\r\n<p>+ Unseal the packaging then add the broth into a pot</p>\r\n\r\n<p>+ Set the heat to high fire till reaching its boiling point</p>\r\n\r\n<p>+ Then add seafoods, meats, vegetables...into the pot. Wait till the broth boils again.</p>\r\n\r\n<p>+ Turn the fire off</p>\r\n\r\n<p><strong>Notice:</strong></p>\r\n\r\n<p>- Well-served with seafoods, meats, vegetables, fresh rice noodles, egg noodles...</p>\r\n\r\n<p>- Stir frequently when reheating the broth</p>\r\n\r\n<p>- Preservatives free</p>', 'set-lau-thai-2-3-nguoi'),
(65, 'Set lẩu hồng tiêu 2-3 người', 'Pink peppercorn hotpot', '<p><strong>Quy c&aacute;ch đ&oacute;ng g&oacute;i</strong>:Set lẩu gồm nước lẩu hồng ti&ecirc;u &amp; đồ ăn k&egrave;m.</p>\r\n\r\n<p>1 set bao gồm: Lẩu hồng ti&ecirc;u (1200ml),&nbsp;Ba chỉ b&ograve; (100gr),&nbsp;T&ocirc;m thẻ (80gr), Mực (80gr), B&ograve; vi&ecirc;n (10 vi&ecirc;n),&nbsp;Nấm kim ch&acirc;m (100gr), Nấm b&agrave;o ngư (100gr),&nbsp; Rau nấm (100gr), Bắp (120gr), M&igrave; tươi (150gr).</p>\r\n\r\n<p><strong>Hương vị</strong>:&nbsp;Hơi cay vị ti&ecirc;u. Vị ngọt từ nước hầm xương &amp; thơm nhẹ của quế &amp; hồi.</p>\r\n\r\n<p><strong>Nguy&ecirc;n vật liệu (nước lẩu)</strong>:&nbsp;Ti&ecirc;u hồng, gừng, h&agrave;nh&nbsp; t&iacute;m, h&agrave;nh baro, quế c&acirc;y, đinh&nbsp; hương, hoa hồi, xương&nbsp; ống&nbsp; heo, c&agrave; rốt, bắp.&nbsp; muối th&aacute;i, đường c&aacute;t, nước mắm, dầu ăn,...</p>\r\n\r\n<p><strong>Nhiệt độ bảo quản &amp; HSD</strong>:&nbsp;</p>\r\n\r\n<p>Nước lẩu: Ngăn đ&ocirc;ng -18&deg;C (HSD: 20 ng&agrave;y) / ngăn m&aacute;t 3-5&deg;C (HSD: 72 giờ)</p>\r\n\r\n<p>Thịt &amp; Hải sản: Ngăn đ&ocirc;ng -18&deg;C (HSD: 20 ng&agrave;y) / ngăn m&aacute;t 3-5&deg;C (HSD: 24 giờ)</p>\r\n\r\n<p>Rau lẩu &amp; M&igrave; tươi: Ngăn m&aacute;t 3-5&deg;C (HSD: 24 giờ)​</p>\r\n\r\n<p><strong>Khuyến c&aacute;o</strong>:&nbsp;Th&agrave;nh phần c&oacute; khả năng dị ứng: t&ocirc;m</p>\r\n\r\n<p><strong>Gợi &yacute; d&ugrave;ng k&egrave;m</strong>:&nbsp;Dragon fruit yakult. Tr&agrave; vải hoa hồng.</p>', '<p><strong>Net weight</strong>: 2,000 g</p>\r\n\r\n<p><strong>Ingredients:</strong></p>\r\n\r\n<p>Broth: Pork hock bone (20.3%), pork parietal bone (20.3%), cassava (8.1%), cassava tubers (8.1%), carrot (8.1%), white peppercorn (1.1%), whole black pepper (1.1%), pink pepper (0.3%), ginger, shallot, leek, cinnamon, star anise, clove, sweet corn, salt, sugar, fish sauce, cooking oil...</p>\r\n\r\n<p><strong>Cooking Guidance:</strong></p>\r\n\r\n<p>Step 1: Thaw food in the refrigerator at 2-4&deg;C (around 20-24h). Do not consume thawed broth which is over 48h and 24h for thawed meats &amp; seafoods</p>\r\n\r\n<p>Step 2: Reheat the broth:</p>\r\n\r\n<p>+ Unseal the packaging then add the broth into a pot</p>\r\n\r\n<p>+ Set the heat to high fire till reaching its boiling point</p>\r\n\r\n<p>+ Then add seafood, meats, vegetables...into the pot. Wait till the broth boils again.</p>\r\n\r\n<p>+ Turn the fire off</p>\r\n\r\n<p><strong>Notice</strong>:</p>\r\n\r\n<p>- Well-served with seafood, meats, vegetables, fresh rice noodles, egg noodles...</p>\r\n\r\n<p>- Stir frequently when reheating the broth.</p>\r\n\r\n<p><strong>Warning</strong>:</p>\r\n\r\n<p>- Food should be thoroughly defrosted before cooking.</p>\r\n\r\n<p>- The product&#39;s packaging is not suitable for microwave cooking.</p>\r\n\r\n<p>- Please be advised that our food may have come in contact with or contain peanuts, tree nuts, soy, milk, eggs, wheat, shellfish, or fish.</p>\r\n\r\n<p><strong>Reservation &amp; Expiry Date:</strong></p>\r\n\r\n<p>Broth: Store at -18 ᣞC (30 days from the date of manufacture)</p>\r\n\r\n<p>Meats &amp; Seafood: Store at -18 ᣞC (30 days from the date of manufacture)</p>\r\n\r\n<p>Vegetables &amp; Fresh noodles: Store at 3-5&deg;C (24 hours from the time of manufacture</p>', 'set-lau-hong-tieu-2-3-nguoi'),
(66, 'Cháo sườn', 'Ribs rice porridge', '<p><strong>Quy c&aacute;ch đ&oacute;ng g&oacute;i</strong>:</p>\r\n\r\n<p>1/ Ch&aacute;o nền: 500 Gr</p>\r\n\r\n<p>2/ Sườn &amp; tai heo bằm: 110 Gr</p>\r\n\r\n<p><strong>Tổng định lượng: 600 Gr</strong></p>\r\n\r\n<p><strong>Hương vị</strong>:&nbsp;&nbsp;Thanh đạm , bổ dưỡng cho sức khỏe.</p>\r\n\r\n<p>Ch&aacute;o sườn xay n&aacute;t nhuyễn hạt gạo, kiểu như ch&aacute;o dinh dưỡng.</p>\r\n\r\n<p><strong>Nguy&ecirc;n vật liệu</strong>:&nbsp;Sườn heo, tai heo, xương ống heo, nấm m&egrave;o, h&agrave;nh t&iacute;m, gạo ST25, gừng, muối th&aacute;i, đường c&aacute;t, nước mắm,...</p>\r\n\r\n<p><strong>Nhiệt độ bảo quản &amp; HSD</strong>:&nbsp;Ch&aacute;o, Tai heo x&agrave;o &amp; Sườn heo: Ngăn đ&ocirc;ng -18&deg;C (HSD: 20 ng&agrave;y) / ngăn m&aacute;t 3-5&deg;C (HSD: 72 giờ)</p>\r\n\r\n<p><strong>Khuyến c&aacute;o</strong>:&nbsp;Th&agrave;nh phần c&oacute; khả năng dị ứng: nấm m&egrave;o, nước mắm.</p>\r\n\r\n<p><strong>Gợi &yacute; d&ugrave;ng k&egrave;m</strong>:&nbsp;Salad rau trộn sốt m&aacute;c m&aacute;c,&nbsp;Sữa hạnh nh&acirc;n.</p>\r\n\r\n<p><strong>Hướng dẫn chế biến:</strong></p>\r\n\r\n<p><strong>Bước 1:&nbsp;</strong>R&atilde; đ&ocirc;ng sản phẩm trong ngăn m&aacute;t 10-12 tiếng.</p>\r\n\r\n<p><strong>Bước 2:</strong>&nbsp;L&agrave;m n&oacute;ng ch&aacute;o sườn:</p>\r\n\r\n<p>&nbsp;+ Cắt bao h&uacute;t ch&acirc;n kh&ocirc;ng, cho ch&aacute;o &amp; sườn v&ocirc; nồi</p>\r\n\r\n<p>&nbsp;+ H&acirc;m ch&aacute;o dưới lửa vừa khoảng 2-3 ph&uacute;t. Khuấy ch&aacute;o đều tay đến khi ch&aacute;o s&ocirc;i</p>\r\n\r\n<p>&nbsp;+ Tắt lửa, cho ch&aacute;o ra t&ocirc;.</p>\r\n\r\n<p><strong>Bước 3:&nbsp;</strong>L&agrave;m n&oacute;ng tai heo</p>\r\n\r\n<p>&nbsp;+ Cho tai heo v&ocirc; ch&eacute;n sứ</p>\r\n\r\n<p>&nbsp;+ Microwave trong khoảng 1 ph&uacute;t (1000W / Trung B&igrave;nh)</p>\r\n\r\n<p>&nbsp;+ Cho tai heo l&ecirc;n tr&ecirc;n mặt ch&aacute;o.</p>\r\n\r\n<p><strong>Th&ocirc;ng tin th&ecirc;m:</strong></p>\r\n\r\n<p>Lưu &yacute;:</p>\r\n\r\n<p>&nbsp;- Khuấy ch&aacute;o nhẹ trong qu&aacute; tr&igrave;nh h&acirc;m, tr&aacute;nh ch&aacute;y dưới đ&aacute;y nồi v&agrave; ch&aacute;o bị t&aacute;ch lớp.</p>\r\n\r\n<p>&nbsp;- Kh&ocirc;ng microwave tai heo trong bao h&uacute;t ch&acirc;n kh&ocirc;ng k&iacute;n.</p>\r\n\r\n<p>&nbsp;- Ngon hơn khi d&ugrave;ng k&egrave;m ti&ecirc;u xay, h&agrave;nh phi, h&agrave;nh l&aacute;, ng&ograve; r&iacute;, b&aacute;nh quẩy.</p>\r\n\r\n<p><strong>Th&ocirc;ng&nbsp; tin&nbsp; khuyến&nbsp; c&aacute;o:</strong></p>\r\n\r\n<p>- Bao b&igrave; sản phẩm kh&ocirc;ng sử dụng được cho l&ograve; microwave</p>\r\n\r\n<p>&nbsp;- Sử dụng sản phẩm trong ng&agrave;y sau khi đ&atilde; r&atilde; đ&ocirc;ng.</p>\r\n\r\n<p>&nbsp;- Kh&ocirc;ng sử dụng sản phẩm nếu bạn bị dị ứng với c&aacute;c th&agrave;nh phần của m&oacute;n.</p>', '<p><strong>Net weight</strong>: 600 g</p>\r\n\r\n<p><strong>Ingredients:&nbsp;</strong>Pork bone (35.4%), pork ribs (18.9%), ST25 rice (9.5%), minced pork (7.1%), Northern sticky rice (4.7%), pig&#39;s ear (3.5%), wood ear mushroom, shallot, ginger, salt, sugar, fish sauce...</p>\r\n\r\n<p><strong>Cooking Guidance:</strong></p>\r\n\r\n<p>Step 1: Thaw food in the refrigerator at 2-4&deg;C (around 10-12h). Do not consume thawed foods which is over 60h.</p>\r\n\r\n<p>Step 2: Reheat the ribs rice porridge:</p>\r\n\r\n<p>+ Unseal the packaging then bring porridge and ribs to a pot</p>\r\n\r\n<p>+ Reheat the porridge under medium fire for around 2-3 minutes. Stir the pot frequently till boiling point</p>\r\n\r\n<p>+ Turn the fire off, then pour the porridge into a bowl</p>\r\n\r\n<p>Step 3: Reheat the pig&#39;s ear:</p>\r\n\r\n<p>+ Unseal the packaging then add pig&#39;s ear to a chinaware bowl. Reheat in microwave for 1 minute</p>\r\n\r\n<p>+ After microwave, add pig&#39;s ear on top of porridge</p>\r\n\r\n<p><strong>Notice</strong>:</p>\r\n\r\n<p>- Stir frequently when reheating over low fire to avoid burning the bottom of the pot.</p>\r\n\r\n<p>- Do not microwave pig&#39;s ear with a plastic cover.</p>\r\n\r\n<p>- Well-served with pepper, crispy shallot, spring onion, coriander, bagel twists.</p>\r\n\r\n<p><strong>Warning</strong>:</p>\r\n\r\n<p>- The product&#39;s packaging is not suitable for microwave cooking.</p>\r\n\r\n<p>- Please be advised that our food may have come in contact with or contain peanuts, tree nuts, soy, milk, eggs, wheat, shellfish or fish.</p>\r\n\r\n<p><strong>Reservation &amp; Expiry Date:&nbsp;</strong>Store at -18 ᣞC (30 days from the date of manufacture)</p>', 'chao-suon');
INSERT INTO `post` (`id_post`, `sp_vi`, `sp_en`, `description_vi`, `description_en`, `product_slug`) VALUES
(67, 'Mì spaghetti sốt bò bằm', 'Bolognese spaghetti', '<p><strong>Th&agrave;nh phần</strong>:&nbsp;M&igrave; spaghetti, thịt b&ograve;, thịt heo, sốt c&agrave; chua, l&aacute; nguyệt quế, cỏ xạ hương, rượu vang, bơ, đường c&aacute;t, muối Th&aacute;i, dầu &ocirc;-liu, ph&ocirc; mai Parmesan...</p>\r\n\r\n<p><strong>M&ocirc; tả m&oacute;n</strong>: Dai ngon của sợi m&igrave;. Vị ngọt của b&ograve;, chua nhẹ của c&agrave; chua, b&eacute;o của ph&ocirc; mai</p>\r\n\r\n<p><strong>Hướng dẫn chế biến</strong></p>\r\n\r\n<p><strong>Bước 1:</strong>&nbsp;R&atilde; đ&ocirc;ng sốt, ph&ocirc; mai v&agrave; bơ lạt trong ngăn m&aacute;t 10-12 tiếng.</p>\r\n\r\n<p><strong>Bước 2:</strong>&nbsp;Trụng m&igrave; qua nước s&ocirc;i trong khoảng 3 gi&acirc;y. Vớt m&igrave; ra, để r&aacute;o.</p>\r\n\r\n<p><strong>Bước 3</strong>: X&agrave;o m&igrave;:</p>\r\n\r\n<p>+ Cho 10 Gr bơ v&ocirc; chảo n&oacute;ng</p>\r\n\r\n<p>+ Khi bơ tan, cho m&igrave; v&ocirc; chảo. X&agrave;o m&igrave; dưới lửa vừa trong khoảng 1-2 ph&uacute;t đến khi m&igrave; săn lại</p>\r\n\r\n<p>+ Cuộn tr&ograve;n m&igrave; v&agrave; cho m&igrave; ra dĩa</p>\r\n\r\n<p>+ Cho sốt b&ograve; bằm v&ocirc; chảo, nấu trong khoảng 1 ph&uacute;t đến khi s&ocirc;i. Th&igrave; rưới sốt đều l&ecirc;n m&igrave;.</p>\r\n\r\n<p><strong>Bước 4:</strong>&nbsp;Rắc ph&ocirc; mai đều l&ecirc;n mặt sốt.</p>\r\n\r\n<p><strong>Th&ocirc;ng tin khuyến c&aacute;o&nbsp;</strong></p>\r\n\r\n<p>&nbsp;- Bao b&igrave; sản phẩm kh&ocirc;ng sử dụng được cho l&ograve; microwave.</p>\r\n\r\n<p>&nbsp;- Sử dụng sản phẩm trong ng&agrave;y sau khi đ&atilde; r&atilde; đ&ocirc;ng.</p>\r\n\r\n<p>&nbsp;- Kh&ocirc;ng sử dụng sản phẩm nếu bạn bị dị ứng với c&aacute;c th&agrave;nh phần của m&oacute;n.</p>\r\n\r\n<p><strong>Hạn sử dụng</strong>:</p>\r\n\r\n<p>- M&igrave; spaghetti: Ngăn m&aacute;t 3-5&deg;C (HSD: 72 giờ)</p>\r\n\r\n<p>-&nbsp;Sốt b&ograve; bằm, ph&ocirc; mai, bơ lạt<strong>:</strong>&nbsp;Ngăn đ&ocirc;ng -18&deg;C (HSD: 20 ng&agrave;y) / ngăn m&aacute;t 3-5&deg;C (HSD: 72 giờ)</p>', '<p><strong>Net weight</strong>: 320 g</p>\r\n\r\n<p><strong>Ingredients:&nbsp;</strong>Spaghetti noodles (29.2%), minced beef (16.5%), minced pork (4.2%), Parmesan cheese (4.2%), tomato sauce (2.2%), white wine (2.2%), bay leaf, thyme, unsalted butter, sugar, salt, olive oil...</p>\r\n\r\n<p><strong>Cooking Guidance:</strong></p>\r\n\r\n<p>Step 1: Thaw food in the refrigerator at 2-4&deg;C (around 10-12h). Do not consume thawed foods that are over 60h.</p>\r\n\r\n<p>Step 2:</p>\r\n\r\n<p>+ Boiled one water pot, blanch the spaghetti for 3-5 seconds. Place the spaghetti on the wire rack, and let the excess water drain.</p>\r\n\r\n<p>Step 3: Stir fry the spaghetti:</p>\r\n\r\n<p>+ On a hot pan, add 10 gr of unsalted butter</p>\r\n\r\n<p>+ Add the spaghetti to the pan when the butter is completely melted. Stir fry the spaghetti under medium fire for around 1-2 minutes then turn the fire off</p>\r\n\r\n<p>+ Rolling the spaghetti then slowly transfer to a deep plat</p>\r\n\r\n<p>+ Add bolognese sauce to the same pan, heating under medium fire for 1 minute till boiling. Then pour the sauce on top of spaghetti</p>\r\n\r\n<p>Step 4: Sprinkling the cheese on top of the sauce</p>\r\n\r\n<p><strong>Notice</strong>:</p>\r\n\r\n<p>- Stir frequently the sauce while cooking to avoid burning the bottom of the pan.</p>\r\n\r\n<p>- 10 Gr of extra virgin olive oil could be a replacement for unsalted butter.</p>\r\n\r\n<p><strong>Warning</strong>:</p>\r\n\r\n<p>- The product&#39;s packaging is not suitable for microwave cooking.</p>\r\n\r\n<p>- Please be advised that our food may have come in contact with or contain peanuts, tree nuts, soy, milk, eggs, wheat, shellfish, or fish.</p>\r\n\r\n<p><strong>Reservation &amp; Expiry Date:&nbsp;</strong>Store at -18 ᣞC (30 days from the date of manufacture)</p>', 'mi-spaghetti-sot-bo-bam');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `id_post` int(10) DEFAULT NULL,
  `product_quantity` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_soid` int(11) NOT NULL,
  `unit_price` int(100) DEFAULT NULL,
  `promotion_price` int(100) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT 0,
  `date_sale` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hours_sale` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `id_type`, `id_post`, `product_quantity`, `product_soid`, `unit_price`, `promotion_price`, `image`, `sub_image`, `new`, `date_sale`, `hours_sale`, `created_at`, `updated_at`) VALUES
(108, 23, 34, '10', 2, 40000, 0, '1638352884.bun-bo-5c2538.jpg', NULL, 0, NULL, '00:00:00', NULL, NULL),
(109, 23, 35, '14', 1, 35000, 25000, '1638282543.17-salad-ca-hoi-xong-khoi-sot-mac-mac-1-46f580.jpg', NULL, 0, '2021/12/03', '04:05:03', NULL, NULL),
(110, 23, 36, '10', 0, 30000, 0, '1638353329.nem-chua-423b24.jpg', NULL, 1, '2021/12/01', '2:0:0', NULL, NULL),
(111, 23, 37, '10', 0, 40000, 0, '1638353548.chao-tom-4e2c30.jpg', NULL, 1, '2021/12/01', '2:2:2', NULL, NULL),
(112, 23, 38, '10', 0, 55000, 0, '1638353625.salad-bo-1280x1000-4dbe98.jpg', NULL, 1, '2021/12/01', '2:1:1', NULL, NULL),
(113, 23, 39, '10', 0, 45000, 0, '1638353819.ca-ri-ga-2-798687.jpg', NULL, 0, '2021/12/02', '2:2:1', NULL, NULL),
(114, 23, 40, '10', 0, 55000, 50000, '1638353979.suon-bbq-1280x1000-a26752.jpg', NULL, 0, '2021/12/03', '4:4:6', NULL, NULL),
(115, 23, 41, '10', 0, 45000, 0, '1638354087.ba-roi-mam-ngo-1280x1000-950393.jpg', NULL, 0, '2021/12/02', '2:4:5', NULL, NULL),
(116, 23, 42, '10', 0, 35000, 30000, '1638354191.canh-bi-nu-1280x1000-998921.jpg', NULL, 1, '2021/12/03', '5:5:5', NULL, NULL),
(117, 23, 43, '10', 0, 40000, 0, '1638354278.canh-chua-ca-loc-1280x1000-368f8.jpg', NULL, 0, '2021/12/03', '4:4:6', NULL, NULL),
(118, 23, 44, '10', 0, 60000, 0, '1638354374.my-y-kem-nam-2-b72070.jpg', NULL, 1, '2021/12/03', '5:5:5', NULL, NULL),
(119, 23, 45, '10', 0, 30000, 0, '1638354450.p1533285-19f19.jpg', NULL, 0, '2021/12/01', '3:3:3', NULL, NULL),
(120, 24, 46, '10', 0, 80000, 0, '1638354586.cha-gio-pate-4a667.jpg', NULL, 0, '2021/12/03', '2:2:3', NULL, NULL),
(121, 24, 47, '10', 0, 100000, 90000, '1638354770.uc-ga-chien-xu-2e9167.jpg', NULL, 1, '2021/12/03', '8:8:8', NULL, NULL),
(122, 24, 48, '10', 0, 48000, 0, '1638354861.gio-thu-0d4762.jpg', NULL, 0, '2021/12/03', '2:2:2', NULL, NULL),
(123, 24, 49, '10', 0, 38000, 0, '1638355069.sot-cay-tasty-d04145.jpg', NULL, 0, '2021/12/03', '5:5:5', NULL, NULL),
(124, 24, 50, '0', 0, 58000, 0, '1638355144.sot-mac-mac-bb0299.jpg', NULL, 1, '2021/12/03', '3:3:3', NULL, NULL),
(125, 24, 51, '10', 0, 68000, 0, '1638355282.cu-sen-pho-mai-90gr-bfb429.jpg', NULL, 1, '2021/12/03', '5:5:5', NULL, NULL),
(126, 25, 52, '10', 0, 40000, 34000, '1638355362.yakul-1-cd6d44.jpg', NULL, 1, '2021/12/03', '8:8:8', NULL, NULL),
(127, 25, 53, '10', 0, 40000, 0, '1638355437.cam-thom-1-69050.jpg', NULL, 0, '2021/12/03', '6:6:6', NULL, NULL),
(128, 25, 54, '10', 0, 45000, 35000, '1638355501.tra-sua-tasty-1280x1000-9a3c27.jpg', NULL, 0, '2021/12/03', '10:10:10', NULL, NULL),
(129, 25, 55, '10', 0, 30000, 0, '1638355558.cafe-sua-1280x1000-be0b27.jpg', NULL, 0, '2021/12/01', '5:4:5', NULL, NULL),
(130, 25, 56, '0', 0, 45000, 0, '1638355613.tiramisu-coffee-1280x1000-922a43.jpg', NULL, 1, '2021/12/03', '5:5:5', NULL, NULL),
(131, 25, 57, '10', 0, 45000, 0, '1638355691.olong-xoai-sau-rieng-1280x1000-092064.jpg', NULL, 1, '2021/12/03', '8:8:8', NULL, NULL),
(132, 25, 58, '9', 1, 60000, 50000, '1638355753.cafe-den-0f5038.jpg', NULL, 0, '2021/12/03', '4:5:6', NULL, NULL),
(133, 25, 59, '10', 0, 65000, 0, '1638355860.cafe-sua-b71a8.jpg', NULL, 0, '2021/12/03', '6:6:6', NULL, NULL),
(134, 25, 60, '0', 0, 70000, 0, '1638355944.coldbrew-d2eb71.jpg', NULL, 0, '2021/12/03', '8:9:9', NULL, NULL),
(135, 25, 61, '10', 0, 35000, 0, '1638356017.hibiscus-thanh-yen-165481.jpg', NULL, 1, '2021/12/03', '4:5:6', NULL, NULL),
(136, 25, 62, '10', 0, 40000, 35000, '1638356097.tra-lai-kiwi-629b31.jpg', NULL, 0, '2021/12/03', '3:3:3', NULL, NULL),
(137, 25, 63, '0', 0, 40000, 0, '1638356189.hibiscus-tao-dua-e0c627.jpg', NULL, 1, '2021/12/03', '4:5:6', NULL, NULL),
(138, 24, 64, '10', 0, 280000, 0, '1638356291.lau-thai-38bb29.jpg', NULL, 0, '2021/12/03', '4:4:4', NULL, NULL),
(139, 24, 65, '10', 0, 300000, 280000, '1638356387.lau-hong-tieu-218e0.jpg', NULL, 1, '2021/12/03', '5:5:5', NULL, NULL),
(140, 24, 66, '10', 0, 70000, 0, '1638356480.chao-suon-a26e80.jpg', NULL, 0, '2021/12/03', '4:4:4', NULL, NULL),
(141, 24, 67, '10', 0, 86000, 78000, '1638356589.my-y-bo-bam-557d49.jpg', NULL, 0, '2021/12/03', '9:9:9', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rating`
--

CREATE TABLE `rating` (
  `rating_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `rating`
--

INSERT INTO `rating` (`rating_id`, `product_id`, `rating_number`) VALUES
(1, 16, 2),
(2, 16, 4),
(3, 77, 3),
(4, 74, 3),
(5, 74, 1),
(6, 91, 4),
(7, 91, 3),
(8, 91, 3),
(9, 91, 3),
(10, 91, 4),
(11, 91, 4),
(12, 91, 4),
(13, 91, 3),
(14, 91, 2),
(15, 91, 1),
(16, 91, 1),
(17, 91, 1),
(18, 100, 3),
(19, 100, 3),
(20, 86, 3),
(21, 95, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `status_slide` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`, `status_slide`) VALUES
(26, 'chi-tiet-san-pham-108/bun-bo', '1638245438.bun-bo-tasty-767724.jpg', 0),
(29, 'chi-tiet-san-pham-116/canh-bi-nu-nhoi-tom-thit', '1638512967.canh-bi-3-7dd823.jpg', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `social`
--

CREATE TABLE `social` (
  `social_id` int(10) NOT NULL,
  `provider_user_id` varchar(255) NOT NULL,
  `provider` varchar(255) NOT NULL,
  `user` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `social`
--

INSERT INTO `social` (`social_id`, `provider_user_id`, `provider`, `user`) VALUES
(1, '100417728284693981439', 'GOOGLE', 27),
(2, '108072461302466486528', 'GOOGLE', 17);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `statistical`
--

CREATE TABLE `statistical` (
  `id_statistic` int(11) NOT NULL,
  `order_date` varchar(255) NOT NULL,
  `sales` varchar(255) NOT NULL,
  `profit` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `statistical`
--

INSERT INTO `statistical` (`id_statistic`, `order_date`, `sales`, `profit`, `quantity`, `total_order`) VALUES
(16, '2021-11-30', '114000', '110000', 4, 4),
(17, '2021-12-02', '60000', '59000', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_products`
--

INSERT INTO `type_products` (`id`, `name_type`, `image`) VALUES
(23, 'Món Dùng Ngay', '1638245848.download93.png'),
(24, 'Món Chế Biến Sẵn', '1638352627.ready-meal-rgb-color-icon-260nw-171455254395.jpg'),
(25, 'Đồ Uống', '1638352666.images36.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_token` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `user_token`, `remember_token`, `level`, `created_at`, `updated_at`) VALUES
(32, 'Đăng Trình', 'admin@gmail.com', '$2y$10$ey/AJyJvB0eHfG4yzfroguU8BAk94xlWgAGC4J0SkzO9oViHZ8Wd6', '123456', 'HCM', NULL, NULL, 1, NULL, '2021-12-03 02:01:24'),
(42, 'Bùi Ngọc Khai Tâm', 'buingockhaitam01@gmail.com', '$2y$10$makcS0SuKyiz9ytaYIgYweb9pevuwG4tHYEnsAf.ogAB.eeC1zkpS', '123456', '695', NULL, NULL, 2, '2021-11-30 03:44:54', '2021-11-30 03:44:54'),
(43, 'Khai Tâm', 'dangtrinh3006@gmail.com', '$2y$10$Q3LYy0NEBAAilndKvBn41uLH9ic7ZmH/vegMFZ5.uVqq1OEbXXOtu', '0834021111', 'Gò Vấp', NULL, NULL, 4, '2021-12-02 09:12:04', '2021-12-03 02:01:45'),
(44, 'Phương Nhi', 'nhanvien@gmail.com', '$2y$10$86VIWg5wZ93J2jPqLG1ZYeeqLCFeyqlJ5.WgFj8UsZBKes5cevLCC', '0834021234', 'Gò Vấp HCM', NULL, NULL, 3, '2021-12-02 13:51:32', '2021-12-03 02:01:03'),
(45, 'Nguyễn Đăng Trình', 'dangtrinh.nguyen2001@gmail.com', '$2y$10$lpaTHH03Kuc8j69l7oQAleuOWoIyYHgdPraeQcpJcWiKYlrvy0Oze', '0834021232', 'Gò Vấp', NULL, NULL, 2, '2021-12-02 14:56:05', '2021-12-02 14:56:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `visitors`
--

CREATE TABLE `visitors` (
  `id_visitors` int(11) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `date_visitor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `visitors`
--

INSERT INTO `visitors` (`id_visitors`, `ip_address`, `date_visitor`) VALUES
(5, '::1', '2021-12-03');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id_bill`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Chỉ mục cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id_bill_detail`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Chỉ mục cho bảng `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`gallery_id`),
  ADD KEY `gallery_product_id` (`gallery_product_id`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id_payment`);

--
-- Chỉ mục cho bảng `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_post`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `zazaza` (`id_post`);

--
-- Chỉ mục cho bảng `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`rating_id`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `social`
--
ALTER TABLE `social`
  ADD PRIMARY KEY (`social_id`);

--
-- Chỉ mục cho bảng `statistical`
--
ALTER TABLE `statistical`
  ADD PRIMARY KEY (`id_statistic`);

--
-- Chỉ mục cho bảng `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id_visitors`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id_bill` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=184;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id_bill_detail` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT cho bảng `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT cho bảng `gallery`
--
ALTER TABLE `gallery`
  MODIFY `gallery_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `id_payment` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `post`
--
ALTER TABLE `post`
  MODIFY `id_post` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT cho bảng `rating`
--
ALTER TABLE `rating`
  MODIFY `rating_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `social`
--
ALTER TABLE `social`
  MODIFY `social_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `statistical`
--
ALTER TABLE `statistical`
  MODIFY `id_statistic` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT cho bảng `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT cho bảng `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id_visitors` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `gallery_ibfk_1` FOREIGN KEY (`gallery_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`),
  ADD CONSTRAINT `zazaza` FOREIGN KEY (`id_post`) REFERENCES `post` (`id_post`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
