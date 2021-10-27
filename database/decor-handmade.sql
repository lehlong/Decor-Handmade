-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 26, 2021 at 03:38 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `decor_handmade`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', '25f9e794323b453885f5181f1b624d0b');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Decor&Handmade');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Vải Canvas | Vải bố'),
(2, 'Đồng hồ treo tường, để bàn '),
(3, 'Hoa & Bình hoa'),
(4, 'Thảm Vintage'),
(5, 'Khung ảnh Vintage'),
(6, 'Scrapbook, album ảnh handmade'),
(7, 'Thiệp handmade vintage'),
(8, 'Hộp, túi, ví, giỏ xách'),
(9, 'Hộp nhạc music box'),
(10, 'Đồ da handmade');

-- --------------------------------------------------------

--
-- Table structure for table `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'hlonn.it@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 1, ' Vải bố thô nâu dày vintage', 99000, 'Vải bố thô có thành phần là sợi đay tự nhiên, ít qua xử lý hóa chất, giữ lại tính nguyên sơ của sợi nguyên liệu, rất thân thiện với môi trường. Khổ vải 1.2m; định lượng khoảng 500gr/m2.  Còn gọi là vải đay, vải bao tải, flax fabric v.v...Vải bố rất bền, bề mặt thô, có màu nâu đặc trưng kiểu vintage nên rất được yêu thích dùng may phụ kiện decor tường, phòng; trang trí tiệm quán, shop, cafe, resort, khách sạn, homestay; làm đồ thủ công handmade, may túi vải bố; làm phụ kiện chụp hình.', '1635169732_vai-bo-vintage.webp', 'Vải'),
(2, 1, 1, 'Vải canvas họa tiết retro biển số xe', 199000, 'Vải bố canvas dày, bền màu có họa tiết lạ mắt, phong cách vintage hoài cổ, vải canvas rất dễ phối may khăn trải bàn, rèm cửa và túi vải bố canvas và nhiều sản phẩm khác.  Vải bố canvas rất hợp trang trí nhà cửa, hàng quán, homestay, nhà hàng, khách sạn, căn hộ...', '1635169858_vai-vintage.webp', 'Vải'),
(4, 1, 1, 'Vải canvas họa tiết Botanical', 199000, 'Craft & More bán rất nhiều loại vải bố canvas chuyên dùng mày rèm, khăn bàn, áo gối, tạp dề,... với mẫu mã mang phong cách cổ điển, vintage và sang trọng. Vải canvas có khổ là 1m55; định lượng dày dặn 280gsm.', '1635170130_vai-bo-canvas-day-xanh-den-botanical.webp', '1'),
(6, 1, 1, 'Mẫu vải cotton vintage Xe Đạp', 149000, 'Khổ vải 1m50, định lượng 250g/m; vải có họa tiết vintage hoài cổ', '1635170244_vai-canvas-vintage-o-hcm.webp', 'Vải'),
(7, 1, 1, 'Vải canvas hoa nhỏ vintage', 199000, 'Khổ 1m55; họa tiết hoa lãng mạn phong cách vintage/retro rải đều seamless nên rất dễ phối, may khăn trải bàn, rèm cửa, trang trí tường, phòng khách, phòng ngủ cho căn hộ, nhà cửa, homestay, nhà hàng, khách sạn, resort, hàng quán cafe, shop.', '1635170283_vai-bo-canvas-vintage-hoa-nho.webp', 'Vải'),
(8, 1, 1, 'Vải bố canvas họa tiết lá Dương Sỉ', 149000, 'Vải có họa tiết đều, lập lại (seamless), dễ dàng để bạn phối - may các món đồ trang trí nhà cửa. Khổ vải 1,5m.', '1635170359_vai-canvas-vintage-hn.webp', 'Vải'),
(9, 1, 1, 'Vải canvas vintage sọc khối', 149000, 'Kích thước: khổ 1,55m. Vải bố canvas họa tiết sọc khối phù hợp may rèm, khăn trải bàn, áo gối, phụ kiện chụp ảnh sản phẩm, trang trí quán, nhà cửa.', '1635170415_vai-soc-caro.webp', 'Vải'),
(10, 2, 1, 'Đồng hồ vintage 3 chân tripod', 349000, 'Đồng hồ vintage 3 chân tripod', '1635170565_dong-ho-trang-tri.webp', 'Đồng hồ'),
(11, 2, 1, 'Đồng Hồ Xe Đạp Để Bàn Vintage', 504000, 'Không chỉ là một chiếc đồng hồ để bàn thông thường, mà đó còn là một đồng hồ để bàn với phong cách vintage vô cùng ấn tượng và độc đáo. Xe đạp được thiết kế theo mẫu cổ điển năm 1879 kèm theo một chiếc đồng hồ ở vị trí bánh trước tạo nên sự mới lạ và đặc biệt. Không chỉ giúp ích trong việc xem thời gian, mà bạn còn có thể dùng để trang trí cho không gian nội thất của mình trở nên thật sinh động.', '1635170635_dong-ho-xe-dap-vintage-1.webp', 'Đồng hồ'),
(12, 2, 1, 'Đồng hồ cát trang trí hình bánh răng', 415000, 'Không chỉ là một chiếc đồng hồ để bàn thông thường, mà đó còn là một đồng hồ để bàn với phong cách vintage vô cùng ấn tượng và độc đáo. Xe đạp được thiết kế theo mẫu cổ điển năm 1879 kèm theo một chiếc đồng hồ ở vị trí bánh trước tạo nên sự mới lạ và đặc biệt. Không chỉ giúp ích trong việc xem thời gian, mà bạn còn có thể dùng để trang trí cho không gian nội thất của mình trở nên thật sinh động.', '1635170679_dong-ho-cat-banh-rang-dep-vgc.webp', 'Đồng hồ'),
(13, 2, 1, 'Đồng hồ treo tường 2 mặt', 699000, 'Kích thước: 40x40cm; đường kính mặt đồng hồ 22cm; Chất liệu: sắt mỹ thuật; Thiết kế 2 mặt phù hợp treo góc tường.', '1635170812_dong-ho-treo-tuong-hai-mat-1.webp', 'Đồng hồ'),
(14, 2, 1, 'Đồng hồ trang trí để bàn mô tô', 658000, 'Đồng hồ để bàn trang trí độc lạ đẹp mô hình mô tô phù hợp làm quà tặng, trang trí nhà cửa. Chất liệu: sắt mỹ thuật. Bảo hành: 12 tháng. Kích thước: 28cm x 19cm x 4cm.', '1635170861_dong_ho_de_doc.jpg', 'Đồng hồ'),
(15, 2, 1, 'Đồng hồ cát trang trí khung đồng, xoay 360', 1500000, 'Chiếc đồng hồ cát sẽ khiến không gian phòng trở nên khác biệt, hơn hết, vật dụng trang trí này sẽ nói cho khách đến chơi biết chủ nhân của nó là ai! Thêm nữa, chiếc đồng hồ cát phong cách VINTAGE rất \"ăn ảnh\" nên phù hợp làm đạo cụ chụp ảnh. Nếu có người yêu là một anh chàng hay cô nàng cá tính thì không phải đây là một món quà độc đáo đầy ỳ nghĩa sao? Hay là quà tân gia được không? Hoặc đồng hồ cát có thể sử dụng trang trí quán cafe, shop thời trang, studio, nhà hàng với VINTAGE STYLE. Kích thước: cao 31cm, rộng 17cm, nặng 1.5kg, chất liệu: cát, thủy tinh, đồng. Đế đồng hồ lót vải nhung đen tạo độ bám chắc chắn. Đồng hồ xoay 360º.', '1635170909_5248106dong_ho_cat.jpg', 'Đồng hồ'),
(16, 3, 1, 'Hoa Lavender khô', 89000, 'Hoa Lavender khô', '1635171015_26.webp', 'Hoa'),
(17, 3, 1, 'Lọ thủy tinh trang trí bằng dây thừng', 129000, 'Lọ thủy tinh trang trí bằng dây thừng', '1635171069_chai-thuy-tinh-quan-thung4.webp', 'Bình hoa'),
(18, 3, 1, 'Hoa giấy handmade', 159000, 'Hoa giấy handmade', '1635171156_4032981hoa_gia_dep.jpg', 'Hoa'),
(19, 3, 1, 'Bình cắm hoa trang trí Lyon', 404000, 'Bình cắm hoa trang trí Lyon', '1635171215_binh_hoa_trang_tri.jpg', 'Bình hoa'),
(20, 3, 1, 'Bình sứ giả cổ Victoria', 397000, 'Bình sứ giả cổ Victoria', '1635171252_ban_binh_gom_su_trang_tri.jpg', 'Bình hoa'),
(21, 3, 1, 'Hoa tulip vải handmade size nhỏ', 35000, 'Hoa tulip vải handmade size nhỏ', '1635171319_qua_8_3.jpg', 'Hoa'),
(22, 3, 1, 'Hoa chúc mừng sinh nhật đẹp, độc đáo', 20000, 'Hoa chúc mừng sinh nhật đẹp, độc đáo', '1635171372_hoa_tinh_yeu.jpg', 'Hoa'),
(23, 4, 1, 'Thảm dệt thổ cẩm Bohemian Vintage', 599000, 'Thảm dệt thổ cẩm Bohemian Vintage', '1635171449_tham-tho-cam-vintage-bohemian-1.webp', 'Thảm'),
(24, 4, 1, 'Thảm Phủ Sofa Vintage Four Seasons', 599000, 'Thảm Phủ Sofa Vintage Four Seasons', '1635171497_shop-ban-tham-vintage-hcm.webp', 'Thảm'),
(25, 4, 1, 'Thảm Trải Sàn Cao Cấp JUST OK', 599000, 'Thảm Trải Sàn Cao Cấp JUST OK', '1635171577_tham-vintage-hcm.webp', 'Thảm'),
(26, 5, 1, 'Khung ảnh đôi nhỏ', 249000, 'Khung ảnh đôi nhỏ', '1635171650_khung-anh-go-lon.webp', 'Khung ảnh'),
(27, 5, 1, 'Khung ảnh vintage trắng ngà', 105000, 'Khung ảnh vintage trắng ngà', '1635171713_2558271khung_anh_cuoi_dep_4.jpg', 'Khung ảnh'),
(28, 5, 1, 'Khung ảnh Staring time', 212000, 'Khung ảnh Staring time', '1635171768_khung-anh-go-1.webp', 'Khung ảnh'),
(29, 5, 1, 'Khung gỗ trang trí (17x22)', 199000, 'Khung gỗ trang trí (17x22)', '1635171805_khung-go-trang-tri-3.webp', 'Khung ảnh'),
(30, 5, 1, 'Khung hình lớn 29x34cm', 289000, 'Khung hình lớn 29x34cm', '1635171865_20263601.jpg', 'Khung ảnh'),
(31, 6, 1, 'Album ảnh tự trang trí Love Story (Xanh)', 220000, 'Album ảnh tự trang trí Love Story (Xanh)', '1635171919_scrapbook-tu-trang-tri-33.webp', 'album'),
(32, 6, 1, 'Scrapbook Retro Clock', 649000, 'Scrapbook Retro Clock', '1635171978_scb-retro-8.webp', 'scrapbook'),
(33, 6, 1, 'Scrapbook Vintage', 1620000, 'Scrapbook Vintage', '1635172022_cach_lam_nhung_mon_qua_thu_cong.jpg', 'scrapbook'),
(34, 6, 1, 'Scrapbook Lò Xo Handmade Phong Cách Retro Độc Đáo', 549000, 'Scrapbook Lò Xo Handmade Phong Cách Retro Độc Đáo', '1635172075_scrapbook-handmade-dep-21.webp', 'scrapbook'),
(35, 6, 1, 'Scrapbook Love Blue', 649000, 'Scrapbook Love Blue', '1635172117_1-9-eff73699-4b9b-456e-a338-56e568407f98.webp', 'scrapbook'),
(36, 7, 1, 'Thiệp Dấu Sáp', 19000, 'Thiệp Dấu Sáp', '1635172185_thiep-chuc-mung-sinh-nhat-chong.webp', 'thiệp'),
(37, 7, 1, 'Thiệp Vintage Film', 39000, 'Thiệp Vintage Film', '1635172220_thiep-handmade-lam-theo-y-vintage-film-3.webp', 'thiệp'),
(38, 7, 1, 'Thiệp Black & White', 39000, 'Thiệp Black & White', '1635172259_thiep-chuc-mung-sinh-nhat-nha-giao-vn-20-10-giang-sinh-valentine-8-thang-3-dep.webp', 'thiệp'),
(39, 7, 1, 'Thiệp Da Bò', 50000, 'Thiệp Da Bò', '1635172292_thiep-chuc-mung-cam-on.webp', 'thiệp'),
(40, 7, 1, 'Thiệp gỗ Jigsaws', 39000, 'Thiệp gỗ Jigsaws', '1635172322_thiep-go-jigsaw-3.webp', 'thiệp'),
(41, 7, 1, 'Thiệp Retro Clock', 39000, 'Thiệp Retro Clock', '1635172358_thiep-handmade-vintage-retro-clock-1.webp', 'thiệp'),
(42, 8, 1, 'Ví Đựng Namecard Da Thật', 299000, 'Ví Đựng Namecard Da Thật', '1635172439_vi-da-name-card-5.webp', 'Ví'),
(43, 8, 1, 'Túi xách quai gỗ', 239000, 'Túi xách quai gỗ', '1635172494_tui-quai-go-27.webp', 'Túi xách'),
(44, 8, 1, 'Hộp Khăn Giấy Cổ Điển Retro Ấn Tượng', 305000, 'Hộp Khăn Giấy Cổ Điển Retro Ấn Tượng', '1635172534_hop-khan-giay-co-dien-2.webp', 'hộp'),
(45, 9, 1, 'Hộp Nhạc Hình Thú Animal Đáng Yêu', 179000, 'Hộp Nhạc Hình Thú Animal Đáng Yêu', '1635172658_hop-nhac-hinh-thu-3.webp', 'Hộp nhạc'),
(46, 9, 1, 'Hộp nhạc Vintage chấm bi', 179000, 'Hộp nhạc Vintage chấm bi', '1635172706_4051097qua-sinh-nhat-dep-tang-ban-gai-4889afc3-5663-4424-a725-060e21db1efa.webp', 'Hộp nhạc'),
(47, 9, 1, 'Hộp nhạc Địa Trung Hải', 199000, 'Hộp nhạc Địa Trung Hải', '1635172740_hop-nhac-dia-trung-hai-6.webp', 'Hộp nhạc'),
(48, 9, 1, 'Hộp nhạc gỗ Vintage có khóa', 574000, 'Hộp nhạc gỗ Vintage có khóa', '1635172790_hop-nhac-co-vintage-3-7ffec48b-96b0-43b6-9908-7f19ad3ff1d7.webp', 'Hộp nhạc'),
(49, 10, 1, 'Móc khóa da thật handmade làm theo yêu cầu', 99000, 'Móc khóa da thật handmade làm theo yêu cầu', '1635172860_moc-khoa-da-that-1.webp', 'Đồ da'),
(50, 10, 1, 'Sổ tay da cao cấp handmade làm theo yêu cầu', 349000, 'Sổ tay da cao cấp handmade làm theo yêu cầu', '1635172906_so_tay_da_cao_cap.jpg', 'Ví');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Hai', 'Long', 'hlonn.it@gmail.com', '123456789', '0981618172', 'Ha Noi', 'Cau Giay'),
(26, 'Admin', 'admin', 'admin@gmail.com', '1', '121212', 'DKT', 'HN');

--
-- Triggers `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'Hai', 'Long', 'hlonn.it@gmail.com', '123456789', '0981618172', 'Ha Noi', 'Cau Giay'),
(26, 'Admin', 'admin', 'admin@gmail.com', 'HaiLong1310.', '0981618172', 'DKT', 'HN');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Constraints for table `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
