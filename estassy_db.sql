-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2022 at 05:48 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `estassy`
--
CREATE DATABASE IF NOT EXISTS `estassy` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `estassy`;

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `banner_id` int(10) NOT NULL,
  `banner` varchar(100) NOT NULL,
  `gambar` varchar(150) NOT NULL,
  `link` varchar(500) NOT NULL,
  `status` enum('on','off') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`banner_id`, `banner`, `gambar`, `link`, `status`) VALUES
(5, 'Kopi Susu Gula Aren', 'banner5.png', 'index.php?page=detail&menu_id=7', 'on'),
(6, 'Macha Latte', 'banner6.png', 'index.php?page=detail&menu_id=13', 'on'),
(7, 'Macchiato', 'banner7.png', 'index.php?page=detail&menu_id=14', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(10) NOT NULL,
  `kategori` varchar(150) NOT NULL,
  `status` enum('on','off') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori`, `status`) VALUES
(1, 'Coffee', 'on'),
(2, 'Non-coffee', 'on'),
(3, 'Dessert', 'on'),
(4, 'Happy-Hour', 'off');

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasi_pembayaran`
--

CREATE TABLE `konfirmasi_pembayaran` (
  `konfirmasi_id` int(10) NOT NULL,
  `pesanan_id` int(10) NOT NULL,
  `nomor_account` varchar(20) NOT NULL,
  `nama_account` varchar(150) NOT NULL,
  `tanggal_transfer` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konfirmasi_pembayaran`
--

INSERT INTO `konfirmasi_pembayaran` (`konfirmasi_id`, `pesanan_id`, `nomor_account`, `nama_account`, `tanggal_transfer`) VALUES
(5, 8, '1234', 'Habib', '2021-12-21');

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `kota_id` int(10) NOT NULL,
  `kota` varchar(150) NOT NULL,
  `tarif` int(10) NOT NULL,
  `status` enum('on','off') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`kota_id`, `kota`, `tarif`, `status`) VALUES
(1, 'Jakarta', 6000, 'on'),
(2, 'Depok', 8000, 'on'),
(3, 'Bekasi', 9000, 'on'),
(4, 'Tangerang', 11000, 'on'),
(5, 'Estassy Coffee', 2000, 'on');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `menu_id` int(10) NOT NULL,
  `kategori_id` int(10) NOT NULL,
  `nama_menu` varchar(250) NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(300) NOT NULL,
  `harga` int(10) NOT NULL,
  `stok` tinyint(1) NOT NULL,
  `status` enum('on','off') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`menu_id`, `kategori_id`, `nama_menu`, `deskripsi`, `gambar`, `harga`, `stok`, `status`) VALUES
(1, 1, 'Espresso', '<p>Secangkir kopi yang padat dan kental yang berasal dari saripati biji kopi atau ekstrak biji kopi yang diproses dengan mesin bertekanan tinggi. Disajikan dalam single shot cup atau double shot cup.</p>', 'espresso.png', 18000, 99, 'on'),
(2, 1, 'Affogato', '<p>Affogato adalah jenis minuman kopi yang disajikan dengan satu sendok es krim dan satu atau dua gelas espresso. Affogato adalah kelezatan ekstra yang disajikan dalam jajaran jenis minuman kopi lainnya. Affogato lebih cocok disebut desert, karena sangat cocok dinikmati sehabis makan berat.</p>', 'affogato.png', 20000, 99, 'on'),
(3, 1, 'Black Coffee', '<p>Black Coffee adalah jenis minuman kopi yang sederhana, dibuat dengan biji kopi bubuk yang direndam dalam air panas, dan disajikan hangat. Jika Anda ingin terdengar mewah, Anda bisa menyebut kopi hitam dengan nama aslinya, yakni cafe noir.</p>', 'black coffee.png', 14000, 100, 'on'),
(4, 1, 'Hazelnut Latte', '<p>Campuran susu yang membuatnya manis, dan espresso yang terbuat biji kopi Gayo, Toraja, dan Flores. Menu ini adalah menu favorit para pelanggan.</p>', 'Hazelnut Latte.png', 18000, 100, 'on'),
(5, 1, 'Cappuccino', '<p>Minuman khas Italia dengan bahan dasar espresso yang dicampur dengan susu. Memiliki rasa yang lebih pekat daripada latte.</p>', 'cappucino.png', 18000, 100, 'on'),
(6, 1, 'Americano', '<p>Kopi ini cocok untuk orang-orang yang tidak terlalu menyukai kopi yang terasa sangat kuat dan pahit.</p>', 'americano.png', 15000, 100, 'on'),
(7, 1, 'Es Kopi Susu Gula Aren', '<p>Racikan kopi dengan bahan campuran susu dan gula aren. Disajikan menggunakan es batu di dalam gelas yeay.</p>', 'Kopi Susu Gula Aren.png', 16000, 100, 'on'),
(8, 1, 'Galão', '<p>Gal&atilde;o adalah jenis minuman kopi yang berasal dari Portugal. Jenis minuman kopi panas ini sangat erat kaitannya dengan latte dan cappucino. Satu-satunya perbedaan adalah gal&atilde;o mengandung sekitar dua kali lebih banyak milk foam, menjadikannya minuman yang lebih ringan dibandingkan dengan latte ataupun cappuccino.</p>', 'galao.png', 23000, 100, 'on'),
(10, 1, 'Iced Coffee', '<p>Iced Coffee adalah salah satu jenis minuman kopi tersimpel yang bisa Anda buat dan temukan di daftar menu kafe atau kedai kopi. Iced coffee pada dasarnya adalah campuran kopi dengan es yang sederhana, biasanya disajikan dengan sedikit susu, krim, atau pemanis.</p>', 'iced coffee.png', 18000, 100, 'on'),
(11, 1, 'Cold Brew', '<p>Cold Brew adalah jenis minuman kopi yang hanya bisa disajikan dalam bentuk dingin atau es. Cold brew memiliki tekstur yang lembut, yang dibuat dengan menyeduh kopi yang baru digiling dengan air dingin. Dalam proses Cold Brew, seduhan kopi dengan air dingin tersebut lalu disimpan semalaman di dalam kulkas. Keesokan harinya, seduhan bisa disaring dan langsung diminum atau diencerkan dengan air apabila terlalu kental, sesuaikan dengan selera Anda.</p>', 'cold brew.png', 24000, 100, 'on'),
(12, 1, 'Mocha', '<p>Mocha adalah perpaduan unik kopi dan cokelat panas. Bubuk atau sirup coklat memberikan rasa yang kaya dan lembut serta mengurangi keasaman espresso pada jenis minuman kopi satu ini.</p>', 'mocha.png', 22000, 100, 'on'),
(13, 1, 'Matcha Latte', '<p>Terbuat dari bubuk matcha yang berasal dari daun teh hijau dan latte yang memiliki lapisan busa tipis di atasnya. Bisa disajikan secara hangat maupun dingin.</p>', 'Matcha Latte.png', 22000, 100, 'on'),
(14, 1, 'Macchiato', '<p>Secangkir espresso yang diberi bubuhan dua sendok makan busa susu dan disajikan di cangkir espresso.&nbsp;</p>', 'macchiato.png', 24000, 100, 'on'),
(15, 3, 'Annsmazing', '<p>Dessert yang satu ini sebenarnya merupakan New York Cheesecake yang dipadukan dengan rasa buah-buahan yang segar yang ada di selai raspberry. Campuran antara makanan dari Amerika Serikat dan Perancis selatan ini pasti bakal bikin kamu merasa seperti sedang jalan-jalan ke luar negeri.</p>', 'Annsmazing.png', 22000, 99, 'on'),
(16, 3, 'Biskuit', '<p>Biskuit atau kue kering tak hanya dapat disantap sebagai dessert, namun juga kerap dinikmati sebagai kudapan. Bisa dicampur dengan minuman dengan kombinasi kopi atau teh yang dapat memberikan rasa yang unik dimulut.</p>', 'Biscuit.png', 10000, 98, 'on'),
(17, 3, 'Galette', '<p>Bentuk pai galette terbuka, seperti pai krim hingga tart. Biasa memakai isian buah yang sekaligus dimasak saat proses pemanggangan. Bagian tengah lapisan pai terbuka, sehingga saat dipanggang sari-sari buah akan mengeras</p>', 'Galette.png', 28000, 99, 'on'),
(18, 3, 'Puff Pastry', '<p>Jenis pastry renyah yang satu ini bisa dibilang cukup umum ditemukan di berbagai toko kue dengan varian rasa yang berbeda-beda. Puff terbuat dari adonan dasar yang diolesi lemak dan dilipat berulang kali. Rasanya yang gurih dan manis, serta bentuknya yang mengembang akan membuat kamu semakin penasaran untuk mencicipinya.</p>', 'Puff Pastry.png', 18000, 99, 'on'),
(19, 3, 'Custard Pudding', '<p>Pada sajian custard, pengental yang digunakan adalah telur. Sedangkan, sajian puding menggunakan maizena sebagai pengentalnya. Rasanya yang lembut dan manis membuatnya sangat pas untuk disantap usai menikmati menu makanan berat, terutama yang berlemak.</p>', 'Custard Pudding.png', 28000, 99, 'on'),
(20, 2, 'Black Tea', '<p>Teh yang meriah untuk merayakan momen-momen penting dalam hidup, teh hitam ini dicampur dengan bunga matahari dan buah-buahan eksotis yang menakjubkan.</p>', 'Black tea.png', 10000, 99, 'on'),
(21, 2, 'Green Tea', '<p>Perpaduan menarik dari teh hijau panen terbaik dan akar ginseng langka dimahkotai dengan nada memikat dan tak terlupakan dari nanas kerajaan yang lezat. Teh yang luar biasa untuk dikejar sampai ke ujung bumi.</p>', 'Green Tea.png', 18000, 99, 'on'),
(22, 2, 'Honey Tea', '<p>Lembut dan menenangkan, bunga chamomile Tea yang langka ini memiliki aroma madu yang kaya dan menghasilkan cangkir emas</p>', 'Honey Tea.png', 15000, 99, 'on'),
(23, 2, 'Choco', '<p>Wajib mencoba minuman Choco khas Estassy. Tersedia dalam pilihan hangat dan dingin, paduan rasa susu yang rich dengan pekatnya coklat benar-benar dapat memanjakan lidah siapapun.</p>', 'Choco.png', 20000, 99, 'on'),
(24, 2, 'Raspberry Black Currant', '<p>Berbahan dasar teh dan jus Raspberry / Mangga, menu Estassy blended yang satu ini cukup memberikan angin segar untuk para pengunjung yang alergi dengan laktosa.</p>', 'Raspberry Black Currant.png', 22000, 99, 'on'),
(25, 2, 'Mineral Water', '<p>Minuman air mineral yang sudah bagian dari kehidupan manusia sehari-hari, sehingga dibutuhkan untuk siapapun yang dapat melengkapi hidup Anda.</p>', 'Mineral Water.png', 10000, 99, 'on'),
(26, 1, 'Caramel Macchiato', '<p>Berbahan dasar espresso dengan campuran sirup vanilla yang creamy dan diberi topping busa susu dan sirup karamel.</p>', 'Caramel Macchiato.png', 20000, 100, 'on'),
(27, 1, 'Coconut Coffee', '<p>Kopi yang dikombinasi dengan coconut milk dan juga coconut water. Mencicipi kopi jenis ini memberikan sensasi yang berbeda.</p>', 'Coconut Coffee.png', 18000, 100, 'on');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `pesanan_id` int(10) NOT NULL,
  `kota_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `nama_penerima` varchar(150) NOT NULL,
  `nomor_telepon` varchar(15) NOT NULL,
  `alamat` varchar(300) NOT NULL,
  `tanggal_pemesanan` datetime NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`pesanan_id`, `kota_id`, `user_id`, `nama_penerima`, `nomor_telepon`, `alamat`, `tanggal_pemesanan`, `status`) VALUES
(8, 1, 8, 'Habib', '1122', '1122', '2021-12-21 09:22:26', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pesanan_detail`
--

CREATE TABLE `pesanan_detail` (
  `pesanan_id` int(10) NOT NULL,
  `menu_id` int(10) NOT NULL,
  `quantity` tinyint(2) NOT NULL,
  `harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesanan_detail`
--

INSERT INTO `pesanan_detail` (`pesanan_id`, `menu_id`, `quantity`, `harga`) VALUES
(8, 16, 1, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `level` varchar(30) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `email` varchar(160) NOT NULL,
  `alamat` varchar(400) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(300) NOT NULL,
  `status` enum('on','off') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `level`, `nama`, `email`, `alamat`, `phone`, `password`, `status`) VALUES
(7, 'superadmin', 'Aqmal Idris', 'aqmal@estassy.com', 'Jl. Deket', '0813456789', '202cb962ac59075b964b07152d234b70', 'on'),
(8, 'customer', 'Habib Septrian', 'habib@estassy.com', 'Jl. Jomblo', '081122334455', '202cb962ac59075b964b07152d234b70', 'on'),
(11, 'customer', 'Allan Sukma Yudhanto', 'allan@estassy.com', 'Jl. Sana', '0821222324', '202cb962ac59075b964b07152d234b70', 'on'),
(12, 'customer', 'Customer', 'customer@gmail.com', 'Jl. Customer', '08123123', '202cb962ac59075b964b07152d234b70', 'on');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `konfirmasi_pembayaran`
--
ALTER TABLE `konfirmasi_pembayaran`
  ADD PRIMARY KEY (`konfirmasi_id`),
  ADD KEY `pesanan_id` (`pesanan_id`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`kota_id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`menu_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`pesanan_id`),
  ADD KEY `kota_id` (`kota_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pesanan_detail`
--
ALTER TABLE `pesanan_detail`
  ADD KEY `pesanan_id` (`pesanan_id`),
  ADD KEY `barang_id` (`menu_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `banner_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `konfirmasi_pembayaran`
--
ALTER TABLE `konfirmasi_pembayaran`
  MODIFY `konfirmasi_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
  MODIFY `kota_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `menu_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `pesanan_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `konfirmasi_pembayaran`
--
ALTER TABLE `konfirmasi_pembayaran`
  ADD CONSTRAINT `konfirmasi_pembayaran_ibfk_1` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanan` (`pesanan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`kota_id`) REFERENCES `kota` (`kota_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pesanan_detail`
--
ALTER TABLE `pesanan_detail`
  ADD CONSTRAINT `pesanan_detail_ibfk_1` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanan` (`pesanan_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pesanan_detail_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `kelompok3`
--
CREATE DATABASE IF NOT EXISTS `kelompok3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `kelompok3`;

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `banner_id` int(10) NOT NULL,
  `banner` varchar(100) NOT NULL,
  `gambar` varchar(150) NOT NULL,
  `link` varchar(500) NOT NULL,
  `status` enum('on','off') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`banner_id`, `banner`, `gambar`, `link`, `status`) VALUES
(1, 'Apple Iphone 6', 'banner1.png', 'index.php?page=detail&barang_id=5', 'on'),
(2, 'Samsung A3 A300H', 'banner2.png', 'index.php?page=detail&barang_id=6', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `barang_id` int(10) NOT NULL,
  `kategori_id` int(10) NOT NULL,
  `nama_barang` varchar(250) NOT NULL,
  `spesifikasi` text NOT NULL,
  `gambar` varchar(300) NOT NULL,
  `harga` int(10) NOT NULL,
  `stok` tinyint(1) NOT NULL,
  `status` enum('on','off') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`barang_id`, `kategori_id`, `nama_barang`, `spesifikasi`, `gambar`, `harga`, `stok`, `status`) VALUES
(1, 1, 'Galaxy Note 3', 'Layar 5.7\", 16GB Memori <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis aliquam sagittis. Aliquam tristique neque elit, at ullamcorper ante sollicitudin quis. Fusce dictum sollicitudin aliquam. Aenean ut mi pretium, porta leo eget, consectetur nulla. Cras ut turpis ullamcorper, pharetra mi interdum, varius velit. Donec sagittis urna et dolor fringilla, fringilla hendrerit sapien vulputate. Nulla vel commodo leo. Ut sit amet eleifend nisl, vitae dictum tortor. Praesent ac vestibulum erat. Sed nec ligula vitae dui ornare vulputate. Vestibulum ante sem, elementum nec vestibulum in, pretium vitae arcu. Aenean ultricies commodo bibendum. Proin tempus, erat eget euismod luctus, lorem sapien laoreet ipsum, ut scelerisque ante mi non erat. Integer efficitur semper massa.</p>\n\n<p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eget feugiat felis. Donec aliquam odio arcu, ac sollicitudin nisi volutpat vitae. Nulla facilisi. Nam ex leo, molestie nec augue id, rutrum cursus enim. Nullam tempus iaculis velit. Praesent feugiat velit faucibus magna tristique sollicitudin. Mauris eu lectus velit. Phasellus sagittis diam velit, a hendrerit risus euismod at. Nullam at dignissim massa, vitae facilisis eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In gravida sagittis hendrerit. Cras id arcu ornare sem feugiat malesuada quis auctor orci. Curabitur euismod finibus sagittis.\n</p>', 'samsung-galaxy-note-3.png', 7800000, 9, 'on'),
(2, 1, 'lenovo A7000 Dual SIM', 'Layar 5.5\", 8GB Memori <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis aliquam sagittis. Aliquam tristique neque elit, at ullamcorper ante sollicitudin quis. Fusce dictum sollicitudin aliquam. Aenean ut mi pretium, porta leo eget, consectetur nulla. Cras ut turpis ullamcorper, pharetra mi interdum, varius velit. Donec sagittis urna et dolor fringilla, fringilla hendrerit sapien vulputate. Nulla vel commodo leo. Ut sit amet eleifend nisl, vitae dictum tortor. Praesent ac vestibulum erat. Sed nec ligula vitae dui ornare vulputate. Vestibulum ante sem, elementum nec vestibulum in, pretium vitae arcu. Aenean ultricies commodo bibendum. Proin tempus, erat eget euismod luctus, lorem sapien laoreet ipsum, ut scelerisque ante mi non erat. Integer efficitur semper massa.</p>\n\n<p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eget feugiat felis. Donec aliquam odio arcu, ac sollicitudin nisi volutpat vitae. Nulla facilisi. Nam ex leo, molestie nec augue id, rutrum cursus enim. Nullam tempus iaculis velit. Praesent feugiat velit faucibus magna tristique sollicitudin. Mauris eu lectus velit. Phasellus sagittis diam velit, a hendrerit risus euismod at. Nullam at dignissim massa, vitae facilisis eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In gravida sagittis hendrerit. Cras id arcu ornare sem feugiat malesuada quis auctor orci. Curabitur euismod finibus sagittis.\n</p>', 'Lenovo-A7000.png', 2200000, 10, 'on'),
(3, 1, 'Mi 4i', 'Layar 5\", 16GB Memori <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis aliquam sagittis. Aliquam tristique neque elit, at ullamcorper ante sollicitudin quis. Fusce dictum sollicitudin aliquam. Aenean ut mi pretium, porta leo eget, consectetur nulla. Cras ut turpis ullamcorper, pharetra mi interdum, varius velit. Donec sagittis urna et dolor fringilla, fringilla hendrerit sapien vulputate. Nulla vel commodo leo. Ut sit amet eleifend nisl, vitae dictum tortor. Praesent ac vestibulum erat. Sed nec ligula vitae dui ornare vulputate. Vestibulum ante sem, elementum nec vestibulum in, pretium vitae arcu. Aenean ultricies commodo bibendum. Proin tempus, erat eget euismod luctus, lorem sapien laoreet ipsum, ut scelerisque ante mi non erat. Integer efficitur semper massa.</p>\r\n\r\n<p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eget feugiat felis. Donec aliquam odio arcu, ac sollicitudin nisi volutpat vitae. Nulla facilisi. Nam ex leo, molestie nec augue id, rutrum cursus enim. Nullam tempus iaculis velit. Praesent feugiat velit faucibus magna tristique sollicitudin. Mauris eu lectus velit. Phasellus sagittis diam velit, a hendrerit risus euismod at. Nullam at dignissim massa, vitae facilisis eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In gravida sagittis hendrerit. Cras id arcu ornare sem feugiat malesuada quis auctor orci. Curabitur euismod finibus sagittis.\r\n</p>', 'mi-4i.png', 2800000, 1, 'on'),
(4, 1, 'Samsung Grand Prime', 'Layar 5\", 8GB Memori <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis aliquam sagittis. Aliquam tristique neque elit, at ullamcorper ante sollicitudin quis. Fusce dictum sollicitudin aliquam. Aenean ut mi pretium, porta leo eget, consectetur nulla. Cras ut turpis ullamcorper, pharetra mi interdum, varius velit. Donec sagittis urna et dolor fringilla, fringilla hendrerit sapien vulputate. Nulla vel commodo leo. Ut sit amet eleifend nisl, vitae dictum tortor. Praesent ac vestibulum erat. Sed nec ligula vitae dui ornare vulputate. Vestibulum ante sem, elementum nec vestibulum in, pretium vitae arcu. Aenean ultricies commodo bibendum. Proin tempus, erat eget euismod luctus, lorem sapien laoreet ipsum, ut scelerisque ante mi non erat. Integer efficitur semper massa.</p>\n\n<p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eget feugiat felis. Donec aliquam odio arcu, ac sollicitudin nisi volutpat vitae. Nulla facilisi. Nam ex leo, molestie nec augue id, rutrum cursus enim. Nullam tempus iaculis velit. Praesent feugiat velit faucibus magna tristique sollicitudin. Mauris eu lectus velit. Phasellus sagittis diam velit, a hendrerit risus euismod at. Nullam at dignissim massa, vitae facilisis eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In gravida sagittis hendrerit. Cras id arcu ornare sem feugiat malesuada quis auctor orci. Curabitur euismod finibus sagittis.\n</p>', 'samsung-galaxy-grand-prime.png', 2250000, 10, 'on'),
(5, 1, 'Apple iPhone 6', '<p>Layar 4,7&quot;, 128GB Memori</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis aliquam sagittis. Aliquam tristique neque elit, at ullamcorper ante sollicitudin quis. Fusce dictum sollicitudin aliquam. Aenean ut mi pretium, porta leo eget, consectetur nulla. Cras ut turpis ullamcorper, pharetra mi interdum, varius velit. Donec sagittis urna et dolor fringilla, fringilla hendrerit sapien vulputate. Nulla vel commodo leo. Ut sit amet eleifend nisl, vitae dictum tortor. Praesent ac vestibulum erat. Sed nec ligula vitae dui ornare vulputate. Vestibulum ante sem, elementum nec vestibulum in, pretium vitae arcu. Aenean ultricies commodo bibendum. Proin tempus, erat eget euismod luctus, lorem sapien laoreet ipsum, ut scelerisque ante mi non erat. Integer efficitur semper massa.</p><p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eget feugiat felis. Donec aliquam odio arcu, ac sollicitudin nisi volutpat vitae. Nulla facilisi. Nam ex leo, molestie nec augue id, rutrum cursus enim. Nullam tempus iaculis velit. Praesent feugiat velit faucibus magna tristique sollicitudin. Mauris eu lectus velit. Phasellus sagittis diam velit, a hendrerit risus euismod at. Nullam at dignissim massa, vitae facilisis eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In gravida sagittis hendrerit. Cras id arcu ornare sem feugiat malesuada quis auctor orci. Curabitur euismod finibus sagittis.</p>', 'iphone-6-silver.png', 12700000, 2, 'on'),
(6, 1, 'Samsung A3 A300H', 'Layar 4.5\", 16GB Memori <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis aliquam sagittis. Aliquam tristique neque elit, at ullamcorper ante sollicitudin quis. Fusce dictum sollicitudin aliquam. Aenean ut mi pretium, porta leo eget, consectetur nulla. Cras ut turpis ullamcorper, pharetra mi interdum, varius velit. Donec sagittis urna et dolor fringilla, fringilla hendrerit sapien vulputate. Nulla vel commodo leo. Ut sit amet eleifend nisl, vitae dictum tortor. Praesent ac vestibulum erat. Sed nec ligula vitae dui ornare vulputate. Vestibulum ante sem, elementum nec vestibulum in, pretium vitae arcu. Aenean ultricies commodo bibendum. Proin tempus, erat eget euismod luctus, lorem sapien laoreet ipsum, ut scelerisque ante mi non erat. Integer efficitur semper massa.</p>\n\n<p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eget feugiat felis. Donec aliquam odio arcu, ac sollicitudin nisi volutpat vitae. Nulla facilisi. Nam ex leo, molestie nec augue id, rutrum cursus enim. Nullam tempus iaculis velit. Praesent feugiat velit faucibus magna tristique sollicitudin. Mauris eu lectus velit. Phasellus sagittis diam velit, a hendrerit risus euismod at. Nullam at dignissim massa, vitae facilisis eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In gravida sagittis hendrerit. Cras id arcu ornare sem feugiat malesuada quis auctor orci. Curabitur euismod finibus sagittis.\n</p>', 'Samsung Galaxy-A3.png', 2900000, 6, 'on'),
(7, 1, 'Samsung Galaxy A8', 'Layar 5.7\", 32GB Memori <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis aliquam sagittis. Aliquam tristique neque elit, at ullamcorper ante sollicitudin quis. Fusce dictum sollicitudin aliquam. Aenean ut mi pretium, porta leo eget, consectetur nulla. Cras ut turpis ullamcorper, pharetra mi interdum, varius velit. Donec sagittis urna et dolor fringilla, fringilla hendrerit sapien vulputate. Nulla vel commodo leo. Ut sit amet eleifend nisl, vitae dictum tortor. Praesent ac vestibulum erat. Sed nec ligula vitae dui ornare vulputate. Vestibulum ante sem, elementum nec vestibulum in, pretium vitae arcu. Aenean ultricies commodo bibendum. Proin tempus, erat eget euismod luctus, lorem sapien laoreet ipsum, ut scelerisque ante mi non erat. Integer efficitur semper massa.</p>\n\n<p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eget feugiat felis. Donec aliquam odio arcu, ac sollicitudin nisi volutpat vitae. Nulla facilisi. Nam ex leo, molestie nec augue id, rutrum cursus enim. Nullam tempus iaculis velit. Praesent feugiat velit faucibus magna tristique sollicitudin. Mauris eu lectus velit. Phasellus sagittis diam velit, a hendrerit risus euismod at. Nullam at dignissim massa, vitae facilisis eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In gravida sagittis hendrerit. Cras id arcu ornare sem feugiat malesuada quis auctor orci. Curabitur euismod finibus sagittis.\n</p>', 'samsung-galaxy-A8.png', 6134000, 5, 'on'),
(8, 1, 'Asus Zenfone C ZC451CG', 'Layar 4.5\", 8GB Memori <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis aliquam sagittis. Aliquam tristique neque elit, at ullamcorper ante sollicitudin quis. Fusce dictum sollicitudin aliquam. Aenean ut mi pretium, porta leo eget, consectetur nulla. Cras ut turpis ullamcorper, pharetra mi interdum, varius velit. Donec sagittis urna et dolor fringilla, fringilla hendrerit sapien vulputate. Nulla vel commodo leo. Ut sit amet eleifend nisl, vitae dictum tortor. Praesent ac vestibulum erat. Sed nec ligula vitae dui ornare vulputate. Vestibulum ante sem, elementum nec vestibulum in, pretium vitae arcu. Aenean ultricies commodo bibendum. Proin tempus, erat eget euismod luctus, lorem sapien laoreet ipsum, ut scelerisque ante mi non erat. Integer efficitur semper massa.</p>\n\n<p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eget feugiat felis. Donec aliquam odio arcu, ac sollicitudin nisi volutpat vitae. Nulla facilisi. Nam ex leo, molestie nec augue id, rutrum cursus enim. Nullam tempus iaculis velit. Praesent feugiat velit faucibus magna tristique sollicitudin. Mauris eu lectus velit. Phasellus sagittis diam velit, a hendrerit risus euismod at. Nullam at dignissim massa, vitae facilisis eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In gravida sagittis hendrerit. Cras id arcu ornare sem feugiat malesuada quis auctor orci. Curabitur euismod finibus sagittis.\n</p>', 'asus-zenfone.png', 1325000, 3, 'on'),
(9, 3, 'Nikon D5200 Lensa Kit 18-55mm', 'Layar 3\", 24.1 MP <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis aliquam sagittis. Aliquam tristique neque elit, at ullamcorper ante sollicitudin quis. Fusce dictum sollicitudin aliquam. Aenean ut mi pretium, porta leo eget, consectetur nulla. Cras ut turpis ullamcorper, pharetra mi interdum, varius velit. Donec sagittis urna et dolor fringilla, fringilla hendrerit sapien vulputate. Nulla vel commodo leo. Ut sit amet eleifend nisl, vitae dictum tortor. Praesent ac vestibulum erat. Sed nec ligula vitae dui ornare vulputate. Vestibulum ante sem, elementum nec vestibulum in, pretium vitae arcu. Aenean ultricies commodo bibendum. Proin tempus, erat eget euismod luctus, lorem sapien laoreet ipsum, ut scelerisque ante mi non erat. Integer efficitur semper massa.</p>\n\n<p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eget feugiat felis. Donec aliquam odio arcu, ac sollicitudin nisi volutpat vitae. Nulla facilisi. Nam ex leo, molestie nec augue id, rutrum cursus enim. Nullam tempus iaculis velit. Praesent feugiat velit faucibus magna tristique sollicitudin. Mauris eu lectus velit. Phasellus sagittis diam velit, a hendrerit risus euismod at. Nullam at dignissim massa, vitae facilisis eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In gravida sagittis hendrerit. Cras id arcu ornare sem feugiat malesuada quis auctor orci. Curabitur euismod finibus sagittis.\n</p>', 'nikon-d5200.png', 6000000, 10, 'on'),
(10, 3, 'Nikon D3200 Lensa Kit VR II 18-55mm', 'Layar 3\", 24.1 MP <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis aliquam sagittis. Aliquam tristique neque elit, at ullamcorper ante sollicitudin quis. Fusce dictum sollicitudin aliquam. Aenean ut mi pretium, porta leo eget, consectetur nulla. Cras ut turpis ullamcorper, pharetra mi interdum, varius velit. Donec sagittis urna et dolor fringilla, fringilla hendrerit sapien vulputate. Nulla vel commodo leo. Ut sit amet eleifend nisl, vitae dictum tortor. Praesent ac vestibulum erat. Sed nec ligula vitae dui ornare vulputate. Vestibulum ante sem, elementum nec vestibulum in, pretium vitae arcu. Aenean ultricies commodo bibendum. Proin tempus, erat eget euismod luctus, lorem sapien laoreet ipsum, ut scelerisque ante mi non erat. Integer efficitur semper massa.</p>\n\n<p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eget feugiat felis. Donec aliquam odio arcu, ac sollicitudin nisi volutpat vitae. Nulla facilisi. Nam ex leo, molestie nec augue id, rutrum cursus enim. Nullam tempus iaculis velit. Praesent feugiat velit faucibus magna tristique sollicitudin. Mauris eu lectus velit. Phasellus sagittis diam velit, a hendrerit risus euismod at. Nullam at dignissim massa, vitae facilisis eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In gravida sagittis hendrerit. Cras id arcu ornare sem feugiat malesuada quis auctor orci. Curabitur euismod finibus sagittis.\n</p>', 'nikon-d3200.png', 4800000, 4, 'on'),
(13, 2, 'LG 32\" LED TV - 32LF550A', 'Layar 32\", Triple XD Engine <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis aliquam sagittis. Aliquam tristique neque elit, at ullamcorper ante sollicitudin quis. Fusce dictum sollicitudin aliquam. Aenean ut mi pretium, porta leo eget, consectetur nulla. Cras ut turpis ullamcorper, pharetra mi interdum, varius velit. Donec sagittis urna et dolor fringilla, fringilla hendrerit sapien vulputate. Nulla vel commodo leo. Ut sit amet eleifend nisl, vitae dictum tortor. Praesent ac vestibulum erat. Sed nec ligula vitae dui ornare vulputate. Vestibulum ante sem, elementum nec vestibulum in, pretium vitae arcu. Aenean ultricies commodo bibendum. Proin tempus, erat eget euismod luctus, lorem sapien laoreet ipsum, ut scelerisque ante mi non erat. Integer efficitur semper massa.</p>\n\n<p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eget feugiat felis. Donec aliquam odio arcu, ac sollicitudin nisi volutpat vitae. Nulla facilisi. Nam ex leo, molestie nec augue id, rutrum cursus enim. Nullam tempus iaculis velit. Praesent feugiat velit faucibus magna tristique sollicitudin. Mauris eu lectus velit. Phasellus sagittis diam velit, a hendrerit risus euismod at. Nullam at dignissim massa, vitae facilisis eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In gravida sagittis hendrerit. Cras id arcu ornare sem feugiat malesuada quis auctor orci. Curabitur euismod finibus sagittis.\n</p>', 'lg-32-led-tv-32LF550A.png', 2700000, 6, 'on'),
(14, 2, 'LG LED TV 32\" - 32LF520A', 'Layar 32\" <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis aliquam sagittis. Aliquam tristique neque elit, at ullamcorper ante sollicitudin quis. Fusce dictum sollicitudin aliquam. Aenean ut mi pretium, porta leo eget, consectetur nulla. Cras ut turpis ullamcorper, pharetra mi interdum, varius velit. Donec sagittis urna et dolor fringilla, fringilla hendrerit sapien vulputate. Nulla vel commodo leo. Ut sit amet eleifend nisl, vitae dictum tortor. Praesent ac vestibulum erat. Sed nec ligula vitae dui ornare vulputate. Vestibulum ante sem, elementum nec vestibulum in, pretium vitae arcu. Aenean ultricies commodo bibendum. Proin tempus, erat eget euismod luctus, lorem sapien laoreet ipsum, ut scelerisque ante mi non erat. Integer efficitur semper massa.</p>\n\n<p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eget feugiat felis. Donec aliquam odio arcu, ac sollicitudin nisi volutpat vitae. Nulla facilisi. Nam ex leo, molestie nec augue id, rutrum cursus enim. Nullam tempus iaculis velit. Praesent feugiat velit faucibus magna tristique sollicitudin. Mauris eu lectus velit. Phasellus sagittis diam velit, a hendrerit risus euismod at. Nullam at dignissim massa, vitae facilisis eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In gravida sagittis hendrerit. Cras id arcu ornare sem feugiat malesuada quis auctor orci. Curabitur euismod finibus sagittis.\n</p>', 'lg-led-tv32-32LF520A.png', 2750000, 3, 'on'),
(15, 2, 'Sharp 32\" LED LC-32LE265i', 'Layar 32\" <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis aliquam sagittis. Aliquam tristique neque elit, at ullamcorper ante sollicitudin quis. Fusce dictum sollicitudin aliquam. Aenean ut mi pretium, porta leo eget, consectetur nulla. Cras ut turpis ullamcorper, pharetra mi interdum, varius velit. Donec sagittis urna et dolor fringilla, fringilla hendrerit sapien vulputate. Nulla vel commodo leo. Ut sit amet eleifend nisl, vitae dictum tortor. Praesent ac vestibulum erat. Sed nec ligula vitae dui ornare vulputate. Vestibulum ante sem, elementum nec vestibulum in, pretium vitae arcu. Aenean ultricies commodo bibendum. Proin tempus, erat eget euismod luctus, lorem sapien laoreet ipsum, ut scelerisque ante mi non erat. Integer efficitur semper massa.</p>\n\n<p>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eget feugiat felis. Donec aliquam odio arcu, ac sollicitudin nisi volutpat vitae. Nulla facilisi. Nam ex leo, molestie nec augue id, rutrum cursus enim. Nullam tempus iaculis velit. Praesent feugiat velit faucibus magna tristique sollicitudin. Mauris eu lectus velit. Phasellus sagittis diam velit, a hendrerit risus euismod at. Nullam at dignissim massa, vitae facilisis eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. In gravida sagittis hendrerit. Cras id arcu ornare sem feugiat malesuada quis auctor orci. Curabitur euismod finibus sagittis.\n</p>', 'sharp-32-led-32LE265i.png', 2750000, 10, 'on'),
(16, 1, 'dasdas', '<p>das</p>', '', 3, 2, 'off');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(10) NOT NULL,
  `kategori` varchar(150) NOT NULL,
  `status` enum('on','off') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori`, `status`) VALUES
(1, 'Coffee', 'on'),
(2, 'Non-Coffee', 'on'),
(3, 'Dessert', 'on'),
(4, 'Happy Hour', 'on');

-- --------------------------------------------------------

--
-- Table structure for table `konfirmasi_pembayaran`
--

CREATE TABLE `konfirmasi_pembayaran` (
  `konfirmasi_id` int(10) NOT NULL,
  `pesanan_id` int(10) NOT NULL,
  `nomor_rekening` varchar(20) NOT NULL,
  `nama_account` varchar(150) NOT NULL,
  `tanggal_transfer` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `kota_id` int(10) NOT NULL,
  `kota` varchar(150) NOT NULL,
  `tarif` int(10) NOT NULL,
  `status` enum('on','off') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`kota_id`, `kota`, `tarif`, `status`) VALUES
(1, 'Jakarta', 6000, 'on'),
(2, 'Bandung', 8000, 'on'),
(3, 'Surabaya', 11000, 'on'),
(4, 'Semarang', 9000, 'on');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `pesanan_id` int(10) NOT NULL,
  `kota_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `nama_penerima` varchar(150) NOT NULL,
  `nomor_telepon` varchar(15) NOT NULL,
  `alamat` varchar(300) NOT NULL,
  `tanggal_pemesanan` datetime NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pesanan_detail`
--

CREATE TABLE `pesanan_detail` (
  `pesanan_id` int(10) NOT NULL,
  `barang_id` int(10) NOT NULL,
  `quantity` tinyint(2) NOT NULL,
  `harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) NOT NULL,
  `level` varchar(30) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `email` varchar(160) NOT NULL,
  `alamat` varchar(400) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `password` varchar(300) NOT NULL,
  `status` enum('on','off') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `level`, `nama`, `email`, `alamat`, `phone`, `password`, `status`) VALUES
(1, 'superadmin', 'Aqmal Idris Zarkasih', 'aqmal@estassy.com', 'Jl. Aku', '0813456789', '202cb962ac59075b964b07152d234b70', 'on'),
(8, 'customer', 'Habib Septrian Priyanto', 'habib@estassy.com', 'Jl. Oke', '082122232425', '202cb962ac59075b964b07152d234b70', 'on');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`barang_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `konfirmasi_pembayaran`
--
ALTER TABLE `konfirmasi_pembayaran`
  ADD PRIMARY KEY (`konfirmasi_id`),
  ADD KEY `pesanan_id` (`pesanan_id`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`kota_id`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`pesanan_id`),
  ADD KEY `kota_id` (`kota_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pesanan_detail`
--
ALTER TABLE `pesanan_detail`
  ADD KEY `pesanan_id` (`pesanan_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `banner_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `barang_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `konfirmasi_pembayaran`
--
ALTER TABLE `konfirmasi_pembayaran`
  MODIFY `konfirmasi_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
  MODIFY `kota_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `pesanan_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `konfirmasi_pembayaran`
--
ALTER TABLE `konfirmasi_pembayaran`
  ADD CONSTRAINT `konfirmasi_pembayaran_ibfk_1` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanan` (`pesanan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`kota_id`) REFERENCES `kota` (`kota_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pesanan_detail`
--
ALTER TABLE `pesanan_detail`
  ADD CONSTRAINT `pesanan_detail_ibfk_1` FOREIGN KEY (`pesanan_id`) REFERENCES `pesanan` (`pesanan_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pesanan_detail_ibfk_2` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`barang_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `news`
--
CREATE DATABASE IF NOT EXISTS `news` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `news`;

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `AdminUserName` varchar(255) NOT NULL,
  `AdminPassword` varchar(255) NOT NULL,
  `AdminEmailId` varchar(255) NOT NULL,
  `Is_Active` int(11) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `AdminUserName`, `AdminPassword`, `AdminEmailId`, `Is_Active`, `CreationDate`, `UpdationDate`) VALUES
(1, 'admin', '$2y$12$i4LMfeFPQpGSNPTaccIkKuwxAkJ4PhBr3JND7FpXwWFjRvchQn17C', 'noidatut@gmail.com', 1, '2019-05-27 17:51:00', '2019-05-30 18:21:07');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(200) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Description`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(2, 'Indonesia', 'Indonesia News', '2018-06-06 10:28:09', '2021-11-02 09:24:22', 1),
(3, 'Sports', 'Related to sports news', '2018-06-06 10:35:09', '2018-06-14 11:11:55', 1),
(5, 'Entertainment', 'Entertainment related  News', '2018-06-14 05:32:58', '2018-06-14 05:33:41', 1),
(6, 'Politics', 'Politics', '2018-06-22 15:46:09', '0000-00-00 00:00:00', 1),
(7, 'Business', 'Business', '2018-06-22 15:46:22', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblcomments`
--

CREATE TABLE `tblcomments` (
  `id` int(11) NOT NULL,
  `postId` char(11) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `comment` mediumtext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcomments`
--

INSERT INTO `tblcomments` (`id`, `postId`, `name`, `email`, `comment`, `postingDate`, `status`) VALUES
(1, '12', 'Anuj', 'anuj@gmail.com', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.', '2018-11-21 11:06:22', 1),
(2, '12', 'Test user', 'test@gmail.com', 'This is sample text for testing.', '2018-11-21 11:25:56', 1),
(3, '7', 'ABC', 'abc@test.com', 'This is sample text for testing.', '2018-11-21 11:27:06', 1),
(4, '11', 'Aadarsh Malviya', 'aadarshmalviya@gmail.com', 'test', '2019-06-18 20:27:28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(200) DEFAULT NULL,
  `PageTitle` mediumtext DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `PageTitle`, `Description`, `PostingDate`, `UpdationDate`) VALUES
(1, 'aboutus', 'About News Portal', '<font color=\"#7b8898\" face=\"Mercury SSm A, Mercury SSm B, Georgia, Times, Times New Roman, Microsoft YaHei New, Microsoft Yahei, å¾®è½¯é›…é»‘, å®‹ä½“, SimSun, STXihei, åŽæ–‡ç»†é»‘, serif\"><span style=\"font-size: 26px;\">Dr. Tutorial Noidatut ( www.noidatut.com ) is a free E – Learning Platform build up in a view to Learn and share. We believe that the more we share the more we learn . We the team of Dr. Tutorial NoidaTut are here with bag full of Class notes, lab manuals , tutorials with videos and full source code, e books and documents which you can access free of cost. We would also like to mention that we have questions and answers of different subjects in forum view where you can read the answers and comment your answers as well. .\r\n\r\nIf you wish to contact us or locate us Please find us here on google maps. We would request you to write the reviews on google to help us reach different people. </span></font><br>', '2018-06-30 18:01:03', '2019-06-26 06:38:54'),
(2, 'contactus', 'Contact Details', '<p><br></p><p><b>Address :&nbsp; </b>New Delhi India</p><p><b>Phone Number : </b>+91 -01234567890</p><p><b>Email -id : </b>phpgurukulofficial@gmail.com</p>', '2018-06-30 18:01:36', '2018-06-30 19:23:25');

-- --------------------------------------------------------

--
-- Table structure for table `tblposts`
--

CREATE TABLE `tblposts` (
  `id` int(11) NOT NULL,
  `PostTitle` longtext DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `SubCategoryId` int(11) DEFAULT NULL,
  `PostDetails` longtext CHARACTER SET utf8 DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL,
  `PostUrl` mediumtext DEFAULT NULL,
  `PostImage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblposts`
--

INSERT INTO `tblposts` (`id`, `PostTitle`, `CategoryId`, `SubCategoryId`, `PostDetails`, `PostingDate`, `UpdationDate`, `Is_Active`, `PostUrl`, `PostImage`) VALUES
(7, 'Jasprit Bumrah ruled out of England T20I series due to injury', 3, 4, '<p style=\"margin-bottom: 15px; padding: 0px; font-size: 16px; font-family: PTSans, sans-serif;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">The Indian Cricket Team has received a huge blow right ahead of the commencement of the much-awaited series against England. Star speedster Jasprit Bumrah has been ruled out of the forthcoming 3-match T20I series as he suffered an injury in his left thumb.</span></p><p style=\"margin-bottom: 15px; padding: 0px; font-size: 16px; font-family: PTSans, sans-serif;\">The 24-year-old pacer picked up a niggle during India’s first T20I match against Ireland played on June 27 at the Malahide cricket ground in Dublin. As per the reports, he is likely to be available for the ODI series against England scheduled to start from July 12.</p><p style=\"margin-bottom: 15px; padding: 0px; font-size: 16px; font-family: PTSans, sans-serif;\">In the first, Bumrah exhibited a phenomenal performance with the ball. In his quota of four overs, he conceded 19 runs and picked 2 wickets at an economy rate of 4.75.</p><p style=\"margin-bottom: 15px; padding: 0px; font-size: 16px; font-family: PTSans, sans-serif;\">Post his injury, he arrived at team’s optional training session on Thursday but didn’t train. Later, he was rested in the second face-off along with MS Dhoni, Shikhar Dhawan and Bhuvneshwar Kumar.</p><p style=\"margin-bottom: 15px; padding: 0px; font-size: 16px; font-family: PTSans, sans-serif;\">As of now, no replacement has been announced. However, Umesh Yadav may be be given chance in the team in Bumrah’s absence.</p><p style=\"padding: 0px; font-size: 16px; font-family: PTSans, sans-serif;\">The first T20I match between India and England will be played at Old Trafford, Manchester on July 3.</p>', '2018-06-30 18:49:23', '2018-08-28 15:57:32', 1, 'Jasprit-Bumrah-ruled-out-of-England-T20I-series-due-to-injury', '6d08a26c92cf30db69197a1fb7230626.jpg'),
(10, 'Tata Steel, Thyssenkrupp Finalise Landmark Steel Deal', 7, 9, '<h1 style=\"box-sizing: inherit; margin-top: 0px; padding: 0px; font-family: Roboto, sans-serif; font-size: 38px; line-height: normal; letter-spacing: -0.5px; color: rgb(51, 51, 51);\"><span itemprop=\"headline\" style=\"box-sizing: inherit;\">Tata Steel, Thyssenkrupp Finalise Landmark Steel Deal</span>Tata Steel, Thyssenkrupp Finalise Landmark Steel DealTata Steel, Thyssenkrupp Finalise Landmark Steel DealTata Steel, Thyssenkrupp Finalise Landmark Steel DealTata Steel, Thyssenkrupp Finalise Landmark Steel Deal</h1>', '2018-06-30 19:08:56', '2018-08-28 15:59:59', 1, 'Tata-Steel,-Thyssenkrupp-Finalise-Landmark-Steel-Deal', '505e59c459d38ce4e740e3c9f5c6caf7.jpg'),
(11, 'UNs Jean Pierre Lacroix thanks India for contribution to peacekeeping', 6, 8, '<p>UNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeepingUNs Jean Pierre Lacroix thanks India for contribution to peacekeeping<br></p>', '2018-06-30 19:10:36', '2018-08-28 16:01:35', 1, 'UNs-Jean-Pierre-Lacroix-thanks-India-for-contribution-to-peacekeeping', '27095ab35ac9b89abb8f32ad3adef56a.jpg'),
(12, 'Shah holds meeting with NE states leaders in Manipur', 6, 7, '<p><span style=\"color: rgb(25, 25, 25); font-family: &quot;Noto Serif&quot;; font-size: 16px;\">New Delhi: BJP president Amit Shah today held meetings with his party leaders who are in-charge of 11 Lok Sabha seats spread across seven northeast states as part of a drive to ensure that it wins the maximum number of these constituencies in the general election next year.</span><br style=\"box-sizing: inherit; color: rgb(25, 25, 25); font-family: &quot;Noto Serif&quot;; font-size: 16px;\"><br style=\"box-sizing: inherit; color: rgb(25, 25, 25); font-family: &quot;Noto Serif&quot;; font-size: 16px;\"><webviewcontentdata style=\"box-sizing: inherit; color: rgb(25, 25, 25); font-family: &quot;Noto Serif&quot;; font-size: 16px;\">Shah held separate meetings with Lok Sabha toli (group) of Arunachal Pradesh, Tripura, Meghalaya, Mizoram, Nagaland, Sikkim and Manipur in Manipur, the partys media head Anil Baluni said.<br style=\"box-sizing: inherit;\"><br style=\"box-sizing: inherit;\">Baluni said that Shah was in West Bengal for two days before he arrived in Manipur. The BJP chief would reach Odisha tomorrow.</webviewcontentdata><br></p>', '2018-06-30 19:11:44', '2018-08-28 16:01:43', 1, 'Shah-holds-meeting-with-NE-states-leaders-in-Manipur', '7fdc1a630c238af0815181f9faa190f5.jpg'),
(13, 'Beats Fit Pro review: All the perks of AirPods with a more comfortable design', 5, 3, '<p>Thanks to some early hints in iOS 15.1, Beats’ latest earbuds are hardly a surprise. Today the company officially debuted its latest model: the $200 Beats Fit Pro. With a similar design to the Studio Buds that arrived earlier this year, this new pair offers a…<a href=\"https://www.engadget.com/beats-fit-pro-review-140004462.html\" style=\"background-color: rgb(255, 255, 255);\">engadget</a><br></p>', '2021-11-02 10:05:30', '2021-11-02 10:07:02', 1, 'Beats-Fit-Pro-review:-All-the-perks-of-AirPods-with-a-more-comfortable-design', 'd6746fc0196dac3ccb51878f3db993c5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubcategory`
--

CREATE TABLE `tblsubcategory` (
  `SubCategoryId` int(11) NOT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `Subcategory` varchar(255) DEFAULT NULL,
  `SubCatDescription` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsubcategory`
--

INSERT INTO `tblsubcategory` (`SubCategoryId`, `CategoryId`, `Subcategory`, `SubCatDescription`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(3, 5, 'Indonesia', 'Indonesia Cinema', '2018-06-22 15:45:38', '2021-11-02 10:01:31', 1),
(4, 3, 'Cricket', 'Cricket\r\n\r\n', '2018-06-30 09:00:43', '0000-00-00 00:00:00', 1),
(5, 3, 'Football', 'Football', '2018-06-30 09:00:58', '0000-00-00 00:00:00', 1),
(6, 5, 'Television', 'TeleVision', '2018-06-30 18:59:22', '0000-00-00 00:00:00', 1),
(7, 6, 'National', 'National', '2018-06-30 19:04:29', '0000-00-00 00:00:00', 1),
(8, 6, 'International', 'International', '2018-06-30 19:04:43', '0000-00-00 00:00:00', 1),
(9, 7, 'Indonesia', 'Indonesia', '2018-06-30 19:08:42', '2021-11-02 10:01:55', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomments`
--
ALTER TABLE `tblcomments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblposts`
--
ALTER TABLE `tblposts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  ADD PRIMARY KEY (`SubCategoryId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblcomments`
--
ALTER TABLE `tblcomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblposts`
--
ALTER TABLE `tblposts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  MODIFY `SubCategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Database: `newsportal`
--
CREATE DATABASE IF NOT EXISTS `newsportal` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `newsportal`;

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `id` int(11) NOT NULL,
  `AdminUserName` varchar(255) NOT NULL,
  `AdminPassword` varchar(255) NOT NULL,
  `AdminEmailId` varchar(255) NOT NULL,
  `Is_Active` int(11) NOT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`id`, `AdminUserName`, `AdminPassword`, `AdminEmailId`, `Is_Active`, `CreationDate`, `UpdationDate`) VALUES
(1, 'admin', '$2y$12$i4LMfeFPQpGSNPTaccIkKuwxAkJ4PhBr3JND7FpXwWFjRvchQn17C', 'phpgurukulofficial@gmail.com', 1, '2018-05-27 17:51:00', '2018-10-24 18:21:07');

-- --------------------------------------------------------

--
-- Table structure for table `tblcategory`
--

CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(200) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcategory`
--

INSERT INTO `tblcategory` (`id`, `CategoryName`, `Description`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(2, 'Indonesia', 'Indonesia News', '2018-06-06 10:28:09', '2018-06-30 18:41:07', 1),
(3, 'Sports', 'Related to sports news', '2018-06-06 10:35:09', '2018-06-14 11:11:55', 1),
(5, 'Entertainment', 'Entertainment related  News', '2018-06-14 05:32:58', '2018-06-14 05:33:41', 1),
(6, 'Politics', 'Politics', '2018-06-22 15:46:09', '0000-00-00 00:00:00', 1),
(7, 'Business', 'Business', '2018-06-22 15:46:22', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblcomments`
--

CREATE TABLE `tblcomments` (
  `id` int(11) NOT NULL,
  `postId` char(11) DEFAULT NULL,
  `name` varchar(120) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `comment` mediumtext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcomments`
--

INSERT INTO `tblcomments` (`id`, `postId`, `name`, `email`, `comment`, `postingDate`, `status`) VALUES
(1, '12', 'Anuj', 'anuj@gmail.com', 'Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.', '2018-11-21 11:06:22', 0),
(2, '12', 'Test user', 'test@gmail.com', 'This is sample text for testing.', '2018-11-21 11:25:56', 1),
(3, '7', 'ABC', 'abc@test.com', 'This is sample text for testing.', '2018-11-21 11:27:06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(200) DEFAULT NULL,
  `PageTitle` mediumtext DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `PageTitle`, `Description`, `PostingDate`, `UpdationDate`) VALUES
(1, 'aboutus', 'About News Portal', '<font color=\"#7b8898\" face=\"Mercury SSm A, Mercury SSm B, Georgia, Times, Times New Roman, Microsoft YaHei New, Microsoft Yahei, å¾®è½¯é›…é»‘, å®‹ä½“, SimSun, STXihei, åŽæ–‡ç»†é»‘, serif\"><span style=\"font-size: 26px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</span></font><br>', '2018-06-30 18:01:03', '2018-06-30 19:19:51'),
(2, 'contactus', 'Contact Details', '<p><br></p><p><b>Address :&nbsp; </b>Indonesia</p><p><b>Phone Number : </b>+91 -01234567890</p><p><b>Email -id : </b>phpgurukulofficial@gmail.com</p>', '2018-06-30 18:01:36', '2018-06-30 19:23:25');

-- --------------------------------------------------------

--
-- Table structure for table `tblposts`
--

CREATE TABLE `tblposts` (
  `id` int(11) NOT NULL,
  `PostTitle` longtext DEFAULT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `SubCategoryId` int(11) DEFAULT NULL,
  `PostDetails` longtext CHARACTER SET utf8 DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `Is_Active` int(1) DEFAULT NULL,
  `PostUrl` mediumtext DEFAULT NULL,
  `PostImage` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblposts`
--

INSERT INTO `tblposts` (`id`, `PostTitle`, `CategoryId`, `SubCategoryId`, `PostDetails`, `PostingDate`, `UpdationDate`, `Is_Active`, `PostUrl`, `PostImage`) VALUES
(7, 'Jasprit Bumrah ruled out of England T20I series due to injury', 3, 4, '<p style=\"margin-bottom: 15px; padding: 0px; font-size: 16px; font-family: PTSans, sans-serif;\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\">The Indonesian Cricket Team has received a huge blow right ahead of the commencement of the much-awaited series against England. Star speedster Jasprit Bumrah has been ruled out of the forthcoming 3-match T20I series as he suffered an injury in his left thumb.</span></p><p style=\"margin-bottom: 15px; padding: 0px; font-size: 16px; font-family: PTSans, sans-serif;\">The 24-year-old pacer picked up a niggle during Indonesia’s first T20I match against Ireland played on June 27 at the Malahide cricket ground in Dublin. As per the reports, he is likely to be available for the ODI series against England scheduled to start from July 12.</p><p style=\"margin-bottom: 15px; padding: 0px; font-size: 16px; font-family: PTSans, sans-serif;\">In the first, Bumrah exhibited a phenomenal performance with the ball. In his quota of four overs, he conceded 19 runs and picked 2 wickets at an economy rate of 4.75.</p><p style=\"margin-bottom: 15px; padding: 0px; font-size: 16px; font-family: PTSans, sans-serif;\">Post his injury, he arrived at team’s optional training session on Thursday but didn’t train. Later, he was rested in the second face-off along with MS Dhoni, Shikhar Dhawan and Bhuvneshwar Kumar.</p><p style=\"margin-bottom: 15px; padding: 0px; font-size: 16px; font-family: PTSans, sans-serif;\">As of now, no replacement has been announced. However, Umesh Yadav may be be given chance in the team in Bumrah’s absence.</p><p style=\"padding: 0px; font-size: 16px; font-family: PTSans, sans-serif;\">The first T20I match between Indonesia and England will be played at Old Trafford, Manchester on July 3.</p>', '2018-06-30 18:49:23', '2018-08-28 15:57:32', 1, 'Jasprit-Bumrah-ruled-out-of-England-T20I-series-due-to-injury', '6d08a26c92cf30db69197a1fb7230626.jpg'),
(10, 'Tata Steel, Thyssenkrupp Finalise Landmark Steel Deal', 7, 9, '<h1 style=\"box-sizing: inherit; margin-top: 0px; padding: 0px; font-family: Roboto, sans-serif; font-size: 38px; line-height: normal; letter-spacing: -0.5px; color: rgb(51, 51, 51);\"><span itemprop=\"headline\" style=\"box-sizing: inherit;\">Tata Steel, Thyssenkrupp Finalise Landmark Steel Deal</span>Tata Steel, Thyssenkrupp Finalise Landmark Steel DealTata Steel, Thyssenkrupp Finalise Landmark Steel DealTata Steel, Thyssenkrupp Finalise Landmark Steel DealTata Steel, Thyssenkrupp Finalise Landmark Steel Deal</h1>', '2018-06-30 19:08:56', '2018-08-28 15:59:59', 1, 'Tata-Steel,-Thyssenkrupp-Finalise-Landmark-Steel-Deal', '505e59c459d38ce4e740e3c9f5c6caf7.jpg'),
(11, 'UNs Jean Pierre Lacroix thanks Indonesia for contribution to peacekeeping', 6, 8, '<p>UNs Jean Pierre Lacroix thanks Indonesia for contribution to peacekeepingUNs Jean Pierre Lacroix thanks Indonesia for contribution to peacekeepingUNs Jean Pierre Lacroix thanks Indonesia for contribution to peacekeepingUNs Jean Pierre Lacroix thanks Indonesia for contribution to peacekeepingUNs Jean Pierre Lacroix thanks Indonesia for contribution to peacekeepingUNs Jean Pierre Lacroix thanks Indonesia for contribution to peacekeepingUNs Jean Pierre Lacroix thanks Indonesia for contribution to peacekeepingUNs Jean Pierre Lacroix thanks Indonesia for contribution to peacekeepingUNs Jean Pierre Lacroix thanks Indonesia for contribution to peacekeepingUNs Jean Pierre Lacroix thanks Indonesia for contribution to peacekeepingUNs Jean Pierre Lacroix thanks Indonesia for contribution to peacekeepingUNs Jean Pierre Lacroix thanks Indonesia for contribution to peacekeepingUNs Jean Pierre Lacroix thanks Indonesia for contribution to peacekeepingUNs Jean Pierre Lacroix thanks Indonesia for contribution to peacekeepingUNs Jean Pierre Lacroix thanks Indonesia for contribution to peacekeepingUNs Jean Pierre Lacroix thanks Indonesia for contribution to peacekeepingUNs Jean Pierre Lacroix thanks Indonesia for contribution to peacekeepingUNs Jean Pierre Lacroix thanks Indonesia for contribution to peacekeepingUNs Jean Pierre Lacroix thanks Indonesia for contribution to peacekeeping<br></p>', '2018-06-30 19:10:36', '2018-08-28 16:01:35', 1, 'UNs-Jean-Pierre-Lacroix-thanks-Indonesia-for-contribution-to-peacekeeping', '27095ab35ac9b89abb8f32ad3adef56a.jpg'),
(12, 'Shah holds meeting with NE states leaders in Manipur', 6, 7, '<p><span style=\"color: rgb(25, 25, 25); font-family: &quot;Noto Serif&quot;; font-size: 16px;\">New Delhi: BJP president Amit Shah today held meetings with his party leaders who are in-charge of 11 Lok Sabha seats spread across seven northeast states as part of a drive to ensure that it wins the maximum number of these constituencies in the general election next year.</span><br style=\"box-sizing: inherit; color: rgb(25, 25, 25); font-family: &quot;Noto Serif&quot;; font-size: 16px;\"><br style=\"box-sizing: inherit; color: rgb(25, 25, 25); font-family: &quot;Noto Serif&quot;; font-size: 16px;\"><webviewcontentdata style=\"box-sizing: inherit; color: rgb(25, 25, 25); font-family: &quot;Noto Serif&quot;; font-size: 16px;\">Shah held separate meetings with Lok Sabha toli (group) of Arunachal Pradesh, Tripura, Meghalaya, Mizoram, Nagaland, Sikkim and Manipur in Manipur, the partys media head Anil Baluni said.<br style=\"box-sizing: inherit;\"><br style=\"box-sizing: inherit;\">Baluni said that Shah was in West Bengal for two days before he arrived in Manipur. The BJP chief would reach Odisha tomorrow.</webviewcontentdata><br></p>', '2018-06-30 19:11:44', '2018-08-28 16:01:43', 1, 'Shah-holds-meeting-with-NE-states-leaders-in-Manipur', '7fdc1a630c238af0815181f9faa190f5.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubcategory`
--

CREATE TABLE `tblsubcategory` (
  `SubCategoryId` int(11) NOT NULL,
  `CategoryId` int(11) DEFAULT NULL,
  `Subcategory` varchar(255) DEFAULT NULL,
  `SubCatDescription` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL,
  `Is_Active` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsubcategory`
--

INSERT INTO `tblsubcategory` (`SubCategoryId`, `CategoryId`, `Subcategory`, `SubCatDescription`, `PostingDate`, `UpdationDate`, `Is_Active`) VALUES
(3, 5, 'Indonesian Cinema', 'Indonesian Cinema', '2018-06-22 15:45:38', '0000-00-00 00:00:00', 1),
(4, 3, 'Cricket', 'Cricket\r\n\r\n', '2018-06-30 09:00:43', '0000-00-00 00:00:00', 1),
(5, 3, 'Football', 'Football', '2018-06-30 09:00:58', '0000-00-00 00:00:00', 1),
(6, 5, 'Television', 'TeleVision', '2018-06-30 18:59:22', '0000-00-00 00:00:00', 1),
(7, 6, 'National', 'National', '2018-06-30 19:04:29', '0000-00-00 00:00:00', 1),
(8, 6, 'International', 'International', '2018-06-30 19:04:43', '0000-00-00 00:00:00', 1),
(9, 7, 'Indonesia', 'Indonesia', '2018-06-30 19:08:42', '0000-00-00 00:00:00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomments`
--
ALTER TABLE `tblcomments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblposts`
--
ALTER TABLE `tblposts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  ADD PRIMARY KEY (`SubCategoryId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblcomments`
--
ALTER TABLE `tblcomments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblposts`
--
ALTER TABLE `tblposts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblsubcategory`
--
ALTER TABLE `tblsubcategory`
  MODIFY `SubCategoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"relation_lines\":\"true\",\"snap_to_grid\":\"off\",\"angular_direct\":\"direct\",\"full_screen\":\"off\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"estassy\",\"table\":\"user\"},{\"db\":\"kelompok3\",\"table\":\"user\"},{\"db\":\"kelompok3\",\"table\":\"barang\"},{\"db\":\"travelers\",\"table\":\"users\"},{\"db\":\"estassy\",\"table\":\"menu\"},{\"db\":\"estassy\",\"table\":\"konfirmasi_pembayaran\"},{\"db\":\"estassy\",\"table\":\"kategori\"},{\"db\":\"estassy\",\"table\":\"banner\"},{\"db\":\"kelompok3\",\"table\":\"users\"},{\"db\":\"kelompok3\",\"table\":\"download\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'estassy', 'menu', '[]', '2021-11-20 07:20:43');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2022-01-03 04:47:34', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":199}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `travelers`
--
CREATE DATABASE IF NOT EXISTS `travelers` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `travelers`;

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
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

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

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Aqmal Idris', 'aqmal.travelers@gmail.com', NULL, '$2y$10$ZqIq1voGk5E3sRiSjwa8W.Tqg4bJoTuX51cKmXC2aV/xUJpnlNNye', 'Gi7WfLiMzy8sbAPViVnIbLyF9Yvt3i2DrJw67nDjFU6trq9qUNO0zvGjrzL9', '2021-11-19 00:11:22', '2021-11-19 00:11:22');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `uts_aqmal`
--
CREATE DATABASE IF NOT EXISTS `uts_aqmal` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `uts_aqmal`;

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id` int(10) NOT NULL,
  `id_karyawan` int(10) NOT NULL,
  `apakah_hadir` enum('Hadir','Tidak Hadir','Izin','Sakit') NOT NULL,
  `keterangan` text NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`id`, `id_karyawan`, `apakah_hadir`, `keterangan`, `waktu`) VALUES
(4, 203, 'Hadir', '', '2019-06-03 06:35:10'),
(5, 203, 'Izin', 'Harus mengurus surat-surat motor', '2019-06-04 06:35:10'),
(6, 203, 'Hadir', '', '2019-06-05 06:35:10'),
(7, 203, 'Hadir', '', '2019-06-06 06:35:10'),
(8, 203, 'Hadir', '', '2019-06-07 06:35:10'),
(11, 203, 'Hadir', '', '2019-06-10 06:35:10'),
(12, 203, 'Hadir', '', '2019-06-11 06:35:10'),
(13, 203, 'Hadir', '', '2019-06-12 06:35:10'),
(14, 203, 'Hadir', '', '2019-06-13 06:35:10'),
(17, 203, 'Sakit', '', '2019-06-16 06:35:10'),
(18, 203, 'Sakit', '', '2019-06-17 06:35:10'),
(19, 203, 'Hadir', '', '2019-06-18 06:35:10'),
(20, 203, 'Hadir', '', '2019-06-19 06:35:10'),
(21, 203, 'Hadir', '', '2019-06-20 06:35:10'),
(22, 203, 'Hadir', '', '2019-06-21 06:35:10'),
(25, 203, 'Hadir', '', '2019-06-24 06:35:10'),
(26, 203, 'Hadir', '', '2019-06-25 06:35:10'),
(27, 203, 'Hadir', '', '2019-06-26 06:35:10'),
(28, 203, 'Hadir', '', '2019-06-27 06:35:10'),
(29, 203, 'Hadir', '', '2019-06-28 06:35:10');

-- --------------------------------------------------------

--
-- Table structure for table `departemen`
--

CREATE TABLE `departemen` (
  `id` int(10) NOT NULL,
  `nama_departemen` varchar(250) NOT NULL,
  `dibuat` date NOT NULL,
  `diganti` date NOT NULL,
  `status` enum('aktif','tidak aktif','hapus') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departemen`
--

INSERT INTO `departemen` (`id`, `nama_departemen`, `dibuat`, `diganti`, `status`) VALUES
(1, 'Belum di ketahui', '0000-00-00', '0000-00-00', 'aktif'),
(2, 'Keuangan', '2019-06-22', '2019-06-22', 'aktif'),
(3, 'It', '2019-06-22', '2019-06-22', 'aktif'),
(4, 'Design', '2019-06-22', '2019-06-30', 'aktif'),
(5, 'Marketing', '2019-06-28', '2019-06-28', 'aktif'),
(6, 'Research and Development', '2019-06-29', '2019-06-29', 'aktif'),
(7, 'Keamanan', '2019-06-30', '2019-06-30', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id` int(11) NOT NULL,
  `id_departemen` int(10) NOT NULL DEFAULT 0,
  `id_posisi` int(10) NOT NULL DEFAULT 0,
  `nama_depan` varchar(25) NOT NULL,
  `nama_belakang` varchar(25) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(250) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `dob` date NOT NULL,
  `jenis_kelamin` enum('Pria','Wanita') NOT NULL,
  `nomor_telepon` varchar(15) NOT NULL,
  `nomor_hp` varchar(15) NOT NULL,
  `mulai_kerja` date NOT NULL,
  `dibuat` datetime NOT NULL,
  `diganti` datetime NOT NULL,
  `status` enum('karyawan aktif','interview','tidak di terima','menolak kerja','berhenti kerja','di berhentikan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id`, `id_departemen`, `id_posisi`, `nama_depan`, `nama_belakang`, `email`, `password`, `alamat`, `dob`, `jenis_kelamin`, `nomor_telepon`, `nomor_hp`, `mulai_kerja`, `dibuat`, `diganti`, `status`) VALUES
(1, 1, 1, 'Jed', 'Satterfield', 'lavonne57@feil.edu.hk', '2j4gbuNy\\1|Q2s7WyKV', '89 Ang Lat Chong Tsuen\nSak Hang\nHong Kong', '1919-10-04', 'Wanita', '93574236', '59096948', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(2, 1, 1, 'Jettie', 'Johnson', 'grace35@gmail.com', 'PlkHO_^Ne', '30 Uk Yin Lane\nWong Shap\nNew Territories', '1952-10-13', 'Wanita', '21154550', '66233058', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(3, 1, 1, 'Jewel', 'Dach', 'medhurst.jevon@yahoo.com', 'B6M<E+=c+/', 'Block 32, Mo Niu Court\nYung Kwong Lut\nNew Territories', '1987-07-10', 'Wanita', '66241420', '26690926', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(4, 1, 1, 'Una', 'Wilderman', 'yoshiko.shanahan@klein.edu.hk', 'N<TpU<pK', '58 Nui Kon Yeuk\nWak Pam\nHong Kong', '1946-05-29', 'Pria', '56506233', '69161560', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(5, 1, 1, 'Davonte', 'Rolfson', 'wilderman.rubie@reilly.com', 'ZEyjNinvOT', '28 Tan Niu Ngat West Circuit\nChoi Lan\nNew Territories', '1987-07-10', 'Pria', '64756319', '91729536', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(6, 1, 1, 'Nolan', 'Smitham', 'metz.dee@gmail.com', '\\<3y/.gs', 'Block 54, Ni Lik Estate\nShuen Fe\nNew Territories', '1934-06-14', 'Wanita', '68188741', '91564484', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(7, 1, 1, 'Cletus', 'Muller', 'mcglynn.aaliyah@hotmail.com.hk', 'U9OJYuwIEyXT\\&}Ld', '19 Ne Pou San Tsuen\nShang Tsong Tseung\nNew Territories', '1937-03-04', 'Pria', '35092074', '58919537', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(8, 1, 1, 'Hester', 'Waelchi', 'jude50@kautzer.com', 'jF&~4G^', '77 Yat Han Road West\nTam Shung Hou\nHong Kong', '1920-01-04', 'Wanita', '69016431', '56422780', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(9, 1, 1, 'Angelita', 'Roberts', 'kyra24@borer.com.hk', 'v>F?fr65S^', '65 Mui She Lane\nStanley\nKowloon', '1953-01-21', 'Wanita', '66939579', '50257325', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(10, 1, 1, 'Tillman', 'Schaefer', 'felicity47@prosacco.org.hk', 'a8~3FY', '30 Shui Street\nLei Tsip Shue\nKowloon', '1977-01-23', 'Pria', '58377156', '21148566', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(11, 1, 1, 'Triston', 'West', 'kozey.clovis@dach.com.hk', 'pMm/BW=$}', 'Block 74, Hui Ang Tok Estate\nLe Po\nHong Kong', '1980-07-28', 'Pria', '61003635', '93017983', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(12, 1, 1, 'Ansley', 'O\'Kon', 'smitham.marlee@thompson.edu.hk', '#o=.)uOxpm9e[+)$N', '78 Cho Koi\nTsung Ha\nNew Territories', '1987-07-10', 'Pria', '61363721', '32407439', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(13, 1, 1, 'Holly', 'Krajcik', 'aubrey.jacobson@swaniawski.biz', 'Nd~:N&j\'N0uK', 'Block 53, Tai To Tsui Estate\nWing Shung Wat\nKowloon', '1987-07-10', 'Pria', '26088845', '31077045', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(14, 1, 1, 'Salma', 'Bernhard', 'shyanne.armstrong@yahoo.com', '1[XD]6C=po', '67 Pak Road\nTsuk Tik\nNew Territories', '1975-03-16', 'Wanita', '25670867', '36764277', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(15, 1, 1, 'Adam', 'Heaney', 'brekke.chelsea@hotmail.com.hk', 'wl22}^oM.;\"S/K', '33 Seuk Luen\nHoi Sut\nNew Territories', '1945-04-11', 'Pria', '94559366', '94846727', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(16, 1, 1, 'Josiah', 'Prosacco', 'fmante@nikolaus.biz', ']z\'i#kWsPf^eM<bc..rN', '79 Aberdeen New Village\nTin Wak\nHong Kong', '1947-04-21', 'Pria', '36452613', '66288971', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(17, 1, 1, 'Sylvia', 'Heaney', 'fschmitt@hotmail.com.hk', 'yzecFgPw:]]eQQV', 'Block 12, Hok Mo Tiu Estate\nChou Siu\nKowloon', '1973-05-17', 'Wanita', '68772872', '61981943', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(18, 1, 1, 'Garland', 'Schaden', 'jenkins.vida@gmail.com', 'Rl\\{l+7k', '30 Puk Yuet Long Tsuen\nNi Siu\nNew Territories', '1987-07-10', 'Pria', '68257319', '61732115', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(19, 1, 1, 'Marshall', 'Crona', 'von.ona@gmail.com', 'a<Dxc\\b', '67 Hot Chue Street South\nTin Chi\nHong Kong', '1985-10-22', 'Wanita', '58035883', '65648163', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(20, 1, 1, 'Jovani', 'Marvin', 'haley.leslie@franecki.info', 'x;Yq%=Dv>{i0HOe@CM', '74 Ching Ko Kwik Path North\nAberdeen\nKowloon', '1987-07-10', 'Pria', '28505835', '69232481', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(21, 1, 1, 'Dawson', 'Stark', 'leo.goyette@koepp.idv.hk', 'fy;0C.g[E:w', 'Block 73, Lam Yam Shat Estate\nNgau Fu\nHong Kong', '1970-12-20', 'Wanita', '32399298', '95430255', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(22, 1, 1, 'Carolina', 'Kuvalis', 'schroeder.arnaldo@terry.com', 'K;Yt7}>}|I', '73 Pin Ngan\nTseng Sheng\nHong Kong', '1987-07-10', 'Wanita', '36040696', '20810800', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(23, 1, 1, 'Julianne', 'Donnelly', 'yoberbrunner@yahoo.com.hk', 'dT\\hS8mKP', '71 Hot Nung Wai\nTuen Tiu Ei\nNew Territories', '1973-01-29', 'Wanita', '52124563', '59112360', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(24, 1, 1, 'Randi', 'Collier', 'marilie45@mckenzie.com.hk', 'amj4Ia}B0!x]@W,', 'Block 46, Nai Lip Estate\nYeng Nou\nNew Territories', '1920-09-26', 'Wanita', '69619954', '58481823', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(25, 1, 1, 'Korbin', 'West', 'natalie70@gmail.com', 'i<P5m@U~GQzA', 'Block 22, Hon Yit Estate\nKwai Wat Yak\nHong Kong', '1987-07-10', 'Wanita', '66532322', '58002996', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(26, 1, 1, 'Archibald', 'Ryan', 'wade.cassin@hackett.com', '20xY@jRzV!', '10 Sei Uk Heng\nStanley\nNew Territories', '1987-07-10', 'Pria', '68939110', '68911327', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(27, 1, 1, 'Judy', 'Rogahn', 'dare.luis@gmail.com', '&)%W#wc(n63{zRW``', '63 Shuk Shue Street\nSau Tap Shek\nKowloon', '1986-12-20', 'Wanita', '66826735', '22795516', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(28, 1, 1, 'Dylan', 'Stamm', 'fannie57@leffler.info', '\\p7:vvb_IeV#', '16 Chut Tou Hui Street\nUng Kuen\nNew Territories', '1933-11-10', 'Pria', '65909671', '30870205', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(29, 1, 1, 'Salma', 'Johns', 'cindy.franecki@howell.info', 'vOIm+cL\']-', 'Block 67, Shut Pat Court\nFu Fung\nHong Kong', '1923-08-01', 'Wanita', '30752350', '61390031', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(30, 1, 1, 'Zoie', 'Bogisich', 'gregg.walker@bode.org', '<fe-saB)z<^-bY1FP/', '89 Hang Tik South Street\nMou Kwo Tak\nNew Territories', '1987-07-10', 'Pria', '36154663', '64253646', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(31, 1, 1, 'Jon', 'Kozey', 'omer33@predovic.info', 'mzg`VvP', 'Block 56, Seung Fuk Yuen Court\nTsiu Chong Oi\nNew Territories', '1987-07-10', 'Pria', '34756865', '55014817', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(32, 1, 1, 'Kathryne', 'Gibson', 'wellington07@hotmail.com.hk', 'r/_B*@YRwgxc7', 'Block 88, Shei E Court\nHung Muk\nKowloon', '1981-03-18', 'Wanita', '94417293', '39429695', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(33, 1, 1, 'Llewellyn', 'Bergstrom', 'oda.hansen@yahoo.com', 'Y=9*#LI>^WT39#jB_', '42 Yip Lik Tam Street North\nOu Wok Yeung\nNew Territories', '1957-06-26', 'Wanita', '30764869', '52979299', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(34, 1, 1, 'Marcel', 'Lynch', 'macejkovic.jevon@yahoo.com.hk', '3,&d[lV\"9|yx9CYP', 'Block 28, Suk Ngak Court\nStanley\nNew Territories', '1954-02-22', 'Wanita', '60516252', '50050074', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(35, 1, 1, 'Thad', 'Thiel', 'carroll.jaquan@schmeler.net', ')imLfz=o$Hwd?&<', 'Block 25, Lak Nam Yung Estate\nFang Mau Shap\nHong Kong', '1987-07-10', 'Wanita', '33541043', '53429026', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(36, 1, 1, 'Emily', 'Gibson', 'qpredovic@hotmail.com.hk', '-Xmv45\"#*[7TpRYz9[*i', '65 Tsong Fe Sue Street\nVictoria\nKowloon', '1959-05-30', 'Wanita', '34372894', '55886429', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(37, 1, 1, 'Isabell', 'Koelpin', 'mcclure.oceane@gmail.com', 'VPGqWW', 'Block 51, Ok Suen Court\nTsit Pung Sok\nNew Territories', '1987-07-10', 'Pria', '99393830', '25491880', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(38, 1, 1, 'Matt', 'Harris', 'okilback@rolfson.com', 'Tg-bcB<m@@1L;^', '55 Pak Yung Nan Village\nTeuk Ngai\nHong Kong', '1987-07-10', 'Wanita', '94289135', '58783487', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(39, 1, 1, 'Kennedi', 'Simonis', 'abotsford@bergstrom.com.hk', 'Gr0vKry/N\'hg[-pi', '17 Cheuk Pam San Tsuen\nWang Him Nam\nHong Kong', '1986-06-19', 'Pria', '27232306', '95197989', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(40, 1, 1, 'Harmony', 'Dietrich', 'guy.klein@bins.biz', 'K-LO9;#&xfo-hcqem', 'Block 95, Yik Tsui Estate\nStanley\nKowloon', '1971-07-20', 'Wanita', '23992733', '20659867', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(41, 1, 1, 'Ephraim', 'Stanton', 'sage.skiles@gmail.com', 'r%Eh$~%YE', '94 Hek Tuen Pin\nLap Keu Ngam\nHong Kong', '1919-11-12', 'Pria', '96568598', '35755190', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(42, 1, 1, 'Monte', 'Wilderman', 'bogan.rod@hotmail.com', ';~a\"Podln)+Z>*O8', '60 Sik Yan New Village\nShoi Mik Ngang\nHong Kong', '1987-07-10', 'Wanita', '66320479', '32556422', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(43, 1, 1, 'Marianna', 'Hamill', 'okuneva.andres@bradtke.org.hk', '!EbWLTCJ:@~aXJ$q0', '31 Tok Yip New Village\nFa So\nHong Kong', '1943-03-06', 'Pria', '39866364', '58593130', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(44, 1, 1, 'Queenie', 'Kohler', 'isac93@hotmail.com.hk', '_>ZcQJA\'!0', 'Block 95, Pik Chang Lip Estate\nPong Ya\nHong Kong', '1968-02-14', 'Wanita', '98354481', '69171383', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(45, 1, 1, 'Solon', 'Wiza', 'feil.wilhelm@glover.com.hk', 'gt{GyH?K&', '56 Hung Tsun Avenue South\nSuen Nui\nHong Kong', '1932-12-10', 'Wanita', '36677870', '65251209', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(46, 1, 1, 'Candace', 'Ankunding', 'heather45@greenholt.com.hk', '~X\\u!Z]m0o*>', '55 Tonkin Path\nChui Yit\nNew Territories', '1955-12-13', 'Pria', '55562852', '92140896', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(47, 1, 1, 'Adell', 'Kessler', 'gail.dickens@welch.com.hk', 'c&l876Y\\f/p(mCBm4?', '30 Nap Road\nStanley\nKowloon', '1987-07-10', 'Wanita', '94141857', '39036325', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(48, 1, 1, 'Winona', 'Hane', 'dgrady@hotmail.com.hk', 'M!9hE<gyU?(j', '27 Kwan Kok Seung Wai\nFuk Shuen\nNew Territories', '1956-12-01', 'Pria', '94143230', '62418863', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(49, 1, 1, 'Roman', 'Stamm', 'clement10@hackett.idv.hk', 'e{;vY0mG]k', '58 Chui Hik\nChin E Tse\nNew Territories', '1940-11-26', 'Pria', '31675222', '21386483', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(50, 1, 1, 'Tanner', 'Fahey', 'berniece.hauck@kautzer.edu.hk', 'To4Q5kQc&12$w`;N0N', '80 Mui Tsuk Street\nSong Shau Ping\nHong Kong', '1949-09-18', 'Pria', '52372798', '95499184', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(51, 1, 1, 'Kari', 'Torp', 'jsmith@gmail.com', 'sveQ6/Y%56~SyY', '65 Tsai Sa\nTin Mak\nKowloon', '1931-02-10', 'Pria', '54475839', '92382428', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(52, 1, 1, 'Jalon', 'Powlowski', 'gust42@walker.biz', 'uN?PU8d', '62 Chip Ma\nCho To Kwok\nKowloon', '1982-12-28', 'Wanita', '97628492', '98134542', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(53, 1, 1, 'Rita', 'Bartell', 'ahalvorson@mcdermott.com.hk', 'A[3;*.\'9', '45 Leung Yung Te\nKei Kam\nNew Territories', '1987-07-10', 'Wanita', '20264285', '92933110', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(54, 1, 1, 'Coy', 'Greenholt', 'lubowitz.augustus@leffler.org', 'd^n$th@d|WWiZ4', '29 Ngat Tuen Street West\nKai Ping\nHong Kong', '1987-07-10', 'Pria', '91830586', '90668442', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(55, 1, 1, 'Vincent', 'Pollich', 'jerod.bartoletti@hotmail.com', 'mW)Q)6?*O9rK8`X(', 'Block 58, Pei Chat Estate\nOng O\nKowloon', '1987-07-10', 'Pria', '61344174', '68345212', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(56, 1, 1, 'Alek', 'Stokes', 'zdietrich@yahoo.com', 'yJ\\U-UlM5-L{OFbR%tp', '62 Shanghai Road West\nYun Man\nKowloon', '1962-02-02', 'Pria', '31824014', '99317787', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(57, 1, 1, 'Hosea', 'Feil', 'tbartoletti@hotmail.com', 'QBTcK\"l1?/bIOb/@%2=', 'Block 98, Sik Kot Nat Estate\nStanley\nHong Kong', '1980-05-02', 'Wanita', '20333223', '37375942', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(58, 1, 1, 'Novella', 'Wolf', 'andy53@yahoo.com', 'Sjo+91\'S6`|/K&s2?', '48 Ne Kin Nap Tsuen\nPan Tong Luen\nHong Kong', '1987-02-13', 'Pria', '94878684', '55965667', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(59, 1, 1, 'Keon', 'Becker', 'erna88@hotmail.com.hk', 'I@,k7C(I56m|edh>p,8', '81 Hing Shek South Road\nVictoria\nKowloon', '1928-10-13', 'Pria', '69032865', '24254729', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(60, 1, 1, 'Zula', 'Stehr', 'ziemann.drew@yahoo.com.hk', 's\\uS|=9u,VXNvVuO$`2', '59 Sham Keu Soi Road\nAt Sin\nKowloon', '1987-07-10', 'Wanita', '92238250', '53061747', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(61, 1, 1, 'Katelyn', 'Gislason', 'zosinski@yahoo.com', 'qi(=f4', '66 Hot Shan Shang Village\nSau Pik Shui\nKowloon', '1987-07-10', 'Wanita', '92894690', '52803050', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(62, 1, 1, 'Ezequiel', 'Mann', 'rippin.keely@hotmail.com', 'emxw\'W&|5(7', 'Block 58, Ying Nang Court\nSung Chip\nHong Kong', '1987-07-10', 'Wanita', '60566882', '56477176', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(63, 1, 1, 'Ellis', 'Schuppe', 'ssimonis@tromp.idv.hk', '=\"a_a/)%-o#__?X{a&1o', 'Block 80, Nei Kai Court\nTa Ham Lun\nHong Kong', '1987-07-10', 'Pria', '90386386', '52663384', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(64, 1, 1, 'Jaylin', 'Gutmann', 'jbartell@greenfelder.org.hk', '\\|ny\\cz/7OWzG=7', 'Block 63, Tim Shoi Chok Court\nHik Nat\nNew Territories', '1987-07-10', 'Pria', '65190775', '96662774', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(65, 1, 1, 'Kendall', 'Crooks', 'wilber61@hotmail.com', 'LkL=nq', 'Block 55, Ng Hip Kap Estate\nFut Pok Tin\nHong Kong', '1954-03-02', 'Wanita', '37456543', '32580905', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(66, 1, 1, 'Kelley', 'Oberbrunner', 'abeer@goodwin.net', 'Ef{#t`1G.a1xv8', '69 Noi Yai New Village\nHuet Ng Sai\nKowloon', '1987-07-10', 'Pria', '95210253', '35224375', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(67, 1, 1, 'Ciara', 'Mills', 'ybins@hermann.com', '|Q@<D=(k<', '90 Mik Kwat New Village\nHong Yuen\nNew Territories', '1972-06-09', 'Pria', '67943981', '68722350', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(68, 1, 1, 'Destin', 'Legros', 'zvon@gmail.com', 'Q1IM9&3.s', 'Block 83, Tsun Yue Tsap Court\nLim Wak Shiu\nHong Kong', '1957-11-15', 'Wanita', '56356145', '65618254', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(69, 1, 1, 'Kailee', 'Hegmann', 'breanna.koelpin@cruickshank.com.hk', 'u\\oAuvT7AI8iZ([\"', '14 Mau Shok Wai\nTsin Mo\nNew Territories', '1987-07-10', 'Pria', '59912579', '53611664', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(70, 1, 1, 'Kasey', 'Kertzmann', 'van.larkin@koss.com.hk', 'b%7])M', '86 Tai Che Ung Tsuen\nNe Neung Tin\nKowloon', '1987-07-10', 'Pria', '91921371', '93088542', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(71, 1, 1, 'Martina', 'Rath', 'earnestine97@jenkins.org', 'vzuc@75$gGF%x1unqD\"', '47 Sue Wut\nLung Tung\nHong Kong', '1987-07-10', 'Pria', '63079750', '31920487', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(72, 1, 1, 'Alan', 'Schoen', 'kuhlman.javier@strosin.com', 'cI(F4Jbmz&|}=', '49 Kei Che Ping San Tsuen\nTsue Tuk Tso\nNew Territories', '1987-07-10', 'Pria', '25523909', '28870375', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(73, 1, 1, 'Afton', 'Rippin', 'brekke.jedediah@sauer.edu.hk', 'Yn.=@x', '82 Fang Chak Tuet Road South\nNong Wo Nat\nNew Territories', '1979-03-25', 'Pria', '94162642', '66481534', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(74, 1, 1, 'Jayme', 'Pacocha', 'prohaska.amie@rodriguez.com.hk', '22ySa6Vzd@', 'Block 97, Tsuk Teng Leuk Court\nSiu Wai Ei\nNew Territories', '1987-07-10', 'Wanita', '91676612', '90942307', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(75, 1, 1, 'Maverick', 'Goldner', 'padams@kulas.com.hk', '|i-ZZUD7.', '63 Ok Niu Kek Wai\nHek Chui\nKowloon', '1987-07-10', 'Wanita', '30106585', '97298911', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(76, 1, 1, 'Darby', 'Dach', 'kristoffer.farrell@lebsack.com', 'C\"9sB7WAF|,ObF0r@}p6', '62 Tseng Shong Wat Square East\nTim Nam Lek\nNew Territories', '1938-10-26', 'Wanita', '67389849', '35845181', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(77, 1, 1, 'Noah', 'Ledner', 'blair.ortiz@predovic.org', 'T4kSID(TIb:I^Ua,TSY', '83 Ou Tsong North Avenue\nKwak Min\nKowloon', '1932-04-07', 'Wanita', '26806671', '27225236', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(78, 1, 1, 'Sandrine', 'Kulas', 'augustus.koepp@kirlin.com.hk', 'hg\\gzZY;/lirQ}C', 'Block 94, Ye Mut Shap Court\nChou Toi Ngong\nKowloon', '1962-07-31', 'Wanita', '98389407', '39949652', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(79, 1, 1, 'Leone', 'Dare', 'itzel.breitenberg@yahoo.com', ',iiI;3c)xC_gI', '40 Yuet Chat New Village\nVictoria\nHong Kong', '1987-07-10', 'Pria', '20558081', '93298192', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(80, 1, 1, 'Elian', 'Hintz', 'wolff.alison@bahringer.org.hk', '<Ju2HE(', '39 Ya Pan Mau Road\nAberdeen\nHong Kong', '1987-07-10', 'Pria', '60624861', '92006240', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(81, 1, 1, 'Tiana', 'Terry', 'tohara@gmail.com', 'zLQMSS9-M>r', '13 Fo Fui Nga San Tsuen\nStanley\nNew Territories', '1987-07-10', 'Pria', '54919825', '27941460', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(82, 1, 1, 'Meggie', 'Champlin', 'bechtelar.clare@hotmail.com.hk', 'Cyw8hWJ1tCLh6n#DsDA<', '72 Chun Luen Ma Circuit South\nFe Tong\nKowloon', '1940-10-11', 'Wanita', '31951059', '95506921', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(83, 1, 1, 'Bernita', 'Luettgen', 'fritsch.nona@hotmail.com', 'n:9CYN`L.nvHCj~', '15 Canton Street\nPei Mak Lan\nNew Territories', '1977-03-01', 'Pria', '63254805', '65112616', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(84, 1, 1, 'Stephan', 'Paucek', 'qtowne@hotmail.com.hk', 'v~=(yP/BNDLy&', '60 Wang Kwik Tsuen\nHip Chung\nNew Territories', '1987-07-10', 'Pria', '97573384', '95159424', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(85, 1, 1, 'Manley', 'Larson', 'adriana79@kuhn.com', '0ei:H)RXG', '99 Wut Kwok New Village\nShik Chok Pit\nNew Territories', '1966-02-19', 'Pria', '96045606', '57881377', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(86, 1, 1, 'King', 'Heidenreich', 'pbreitenberg@hotmail.com.hk', 'al!n]o)jM]{F,^', '46 Shung Huk Yi Lane\nTui Chi Tsiu\nHong Kong', '1987-07-10', 'Pria', '68533679', '53926112', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(87, 1, 1, 'Meaghan', 'Torphy', 'pkertzmann@yahoo.com', 'E6qJsd&$`~', '66 Nathan Road\nYung Ma\nNew Territories', '1960-11-19', 'Pria', '52023605', '26353510', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(88, 1, 1, 'Edmund', 'McDermott', 'tmiller@kuhlman.biz', '=tvS}h!c&>x+', '97 Nai Hap New Village\nTsan Fut\nNew Territories', '1924-12-04', 'Wanita', '62912713', '21734823', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(89, 1, 1, 'Darian', 'Gleason', 'chase.osinski@tremblay.net', '~BzrLV?sd,$CVP', '22 Nanking Road West\nYap Ngap\nHong Kong', '1959-05-24', 'Pria', '37951216', '36825291', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(90, 1, 1, 'Liliane', 'Ruecker', 'hhaag@heaney.net', '9s:05G._U+}W/>#', 'Block 75, Pa Tit Lam Estate\nSam Ngou Hin\nHong Kong', '1922-11-19', 'Wanita', '53606192', '38482308', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(91, 1, 1, 'Wilmer', 'Langworth', 'ezra.satterfield@ondricka.com.hk', 'z&RJ[#(', '63 Mo Mok Path\nAberdeen\nHong Kong', '1987-07-10', 'Pria', '38389342', '27152483', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(92, 1, 1, 'Aubree', 'Bode', 'ubaldo.haag@hotmail.com', 'Gtm<2`ShKPD7x', '92 She Yam Tsat Road\nMui Kuet Kwing\nNew Territories', '1978-08-29', 'Pria', '38470496', '59313118', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(93, 1, 1, 'Quincy', 'Predovic', 'schultz.cecilia@hotmail.com', 'Nq{_@.=R_lF$A*Q', 'Block 92, Hung Shoi Court\nNa Sam Tso\nKowloon', '1963-07-21', 'Pria', '26807437', '38051471', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(94, 1, 1, 'Cecilia', 'Bernier', 'schamberger.mya@morar.com', '^oN?K,', '76 Ung Niu Kai Avenue North\nOi Shan\nKowloon', '1987-07-10', 'Wanita', '33925398', '20748979', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(95, 1, 1, 'Madeline', 'Schultz', 'cgerhold@hotmail.com.hk', 'N#C._P|1dl|A}[qv.a;1', '48 Hip Puk Path\nTang Mang Ngak\nKowloon', '1987-07-10', 'Wanita', '61482055', '62519931', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(96, 1, 1, 'Dewayne', 'Bartoletti', 'auer.harmon@hotmail.com', 'MhCRyO<9(k', '42 Wa Tsit Wang\nAberdeen\nHong Kong', '1953-05-14', 'Wanita', '20449262', '63713522', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(97, 1, 1, 'Jordane', 'Marks', 'bergnaum.maximillian@gerhold.org.hk', '\"<VC!KUI}S~[', '78 Yui Sun Lane West\nSok Nap\nKowloon', '1987-07-10', 'Wanita', '93376080', '95193155', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(98, 1, 1, 'Aric', 'Nolan', 'wilber28@hotmail.com.hk', '\"ch@h+?B\"[', '72 King\'s Road South\nAberdeen\nNew Territories', '1956-06-12', 'Pria', '58691182', '98834734', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(99, 1, 1, 'Alvis', 'Dare', 'dankunding@homenick.com', ',v%L6!-k:', '63 Huk Sam Mou Path\nShek Wik Shun\nHong Kong', '1961-09-21', 'Wanita', '67548294', '21410267', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(100, 1, 1, 'Baylee', 'Purdy', 'meta91@satterfield.com.hk', 'y{jmv\'h5mzbBfB', '94 Po Ak Circuit\nKiu Wong\nNew Territories', '1986-11-29', 'Pria', '65719295', '55101166', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(101, 1, 1, 'Tara', 'Powlowski', 'wbernhard@tromp.net', 'QPE$<Kq~', '93 Shanghai Street\nMai Lip\nKowloon', '1987-07-10', 'Pria', '51123828', '67781072', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(102, 1, 1, 'Mason', 'Beer', 'dhill@gmail.com', '\")|U%>(9MWZm/JJy9K_2', '12 Shanghai Avenue\nKwo Nuk\nHong Kong', '1971-06-09', 'Wanita', '94186561', '97468444', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(103, 1, 1, 'Cathy', 'Bergnaum', 'alockman@braun.biz', 'p&;cc#KymB#Y!9m2(iH|', '88 Tseung Road\nAberdeen\nNew Territories', '1987-07-10', 'Wanita', '24022856', '50273389', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(104, 1, 1, 'Nash', 'Grady', 'atowne@gmail.com', 'OdXCka7[cN}', 'Block 62, Kwo Ngai Estate\nChi Hou\nNew Territories', '1987-07-10', 'Wanita', '99442554', '58991276', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(105, 1, 1, 'Ebba', 'Satterfield', 'zkohler@gibson.com', 'dbH)1V(=dC', '29 Peking Street West\nHek Kwo\nHong Kong', '1967-06-06', 'Pria', '25875326', '39394383', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(106, 1, 1, 'Lorenzo', 'Nicolas', 'joberbrunner@yahoo.com', 'E?PZ73eEtU=<', '26 At Fuk Nei Tsuen\nNgam Shung Fau\nKowloon', '1932-03-11', 'Wanita', '24264235', '64220234', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(107, 1, 1, 'Nicolette', 'Hills', 'tremayne60@hotmail.com.hk', '{~9QPQj\'ml4Q', 'Block 52, Chiu Yung Fai Court\nAt Tsui\nKowloon', '1987-07-10', 'Pria', '96539385', '90502562', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(108, 1, 1, 'Lilly', 'Bahringer', 'ylang@wiza.com.hk', 'Zj^S@Lb!AU]p{17W^', 'Block 68, Na Shok Kui Estate\nHui Kun\nHong Kong', '1977-07-29', 'Pria', '96445242', '34483109', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(109, 1, 1, 'Giovanni', 'Flatley', 'igutkowski@gmail.com', 'F]/c598E0PDEN4`JX\'', '47 Koi Shak New Village\nHot Ya\nHong Kong', '1947-08-01', 'Pria', '28545992', '28152109', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(110, 1, 1, 'Theron', 'Williamson', 'guy.kessler@hotmail.com', '%9|$s\'6p', 'Block 96, Ship Tsit Court\nStanley\nNew Territories', '1945-02-20', 'Wanita', '68714412', '52565482', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(111, 1, 1, 'Garrett', 'Stokes', 'heller.drake@gmail.com', 'QZ5i%:KJ', '10 Sue Sung Tsa Path\nWo Pok\nNew Territories', '1955-04-24', 'Wanita', '22994348', '20992921', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(112, 1, 1, 'Willie', 'Bahringer', 'keebler.princess@beatty.biz', '5h/fmo\"%<CTO=O', '98 Pui Yai Kwai\nChe Tsung\nKowloon', '1983-06-03', 'Wanita', '28261198', '52706504', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(113, 1, 1, 'Durward', 'Kiehn', 'itzel03@keebler.com.hk', ']1YEX`e|L~Ic]xb-1i', 'Block 45, Tan Lan Estate\nNou Mi\nNew Territories', '1942-05-08', 'Wanita', '51780429', '59124345', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(114, 1, 1, 'Verda', 'Fahey', 'nicolas.pink@hotmail.com.hk', 'PhfF@Y<H', 'Block 22, Huet Tam Sat Court\nCham Kun\nHong Kong', '1987-07-10', 'Wanita', '22748271', '91901090', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(115, 1, 1, 'Weston', 'Abshire', 'bryon32@bergstrom.com', 'o$RP<L[X6$iIF\'ff)t', '52 Ke Pit Shung San Tsuen\nNou Fe Him\nNew Territories', '1935-02-14', 'Pria', '24581622', '26050187', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(116, 1, 1, 'Kaley', 'Mante', 'kuhlman.shane@macejkovic.idv.hk', 'MT|zq8M>fbv\"s1?', '89 Nim Hiu Village\nOu Mau Kwing\nNew Territories', '1968-07-23', 'Pria', '28517271', '32726191', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(117, 1, 1, 'Cory', 'Murphy', 'ekuvalis@heidenreich.com.hk', 'T6W>z.*', 'Block 48, Wak Soi Estate\nVictoria\nHong Kong', '1934-03-16', 'Wanita', '23781246', '57628621', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(118, 1, 1, 'Turner', 'Spinka', 'gladys.mann@hotmail.com.hk', 'U\'i1gcO}DN\"\'dz+9uJb', 'Block 86, Suen Tseung Ying Estate\nLip Ming Song\nHong Kong', '1987-07-10', 'Wanita', '58459633', '31420426', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(119, 1, 1, 'Aron', 'Purdy', 'eabernathy@yahoo.com.hk', 'ByQU?!shI\\6Gy%~G', '67 Tek Sik Tsuen\nKeuk Sak Kwok\nKowloon', '1987-07-10', 'Pria', '31207813', '66651212', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(120, 1, 1, 'Raymundo', 'Ferry', 'ncartwright@gmail.com', 'P}+MFTHxJ$', 'Block 81, Ship Tik Estate\nNgau Pe Suk\nHong Kong', '1987-07-10', 'Pria', '27066543', '91021624', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(121, 1, 1, 'Cielo', 'Emmerich', 'josh.murray@feest.biz', 'BMvuQN&({2EJg4<T9/>=', '43 Yeuk Luen Tik Path\nHot Tsam\nNew Territories', '1980-01-06', 'Wanita', '62975549', '96079214', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(122, 1, 1, 'Eunice', 'Koch', 'miracle.murray@hotmail.com', '#K59p}#`mHOCv', '65 Yeuk Shing Cheuk\nNat Lik Wu\nNew Territories', '1987-07-10', 'Pria', '33229337', '54529971', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(123, 1, 1, 'Krystina', 'McDermott', 'bettie14@hotmail.com.hk', '3QxLI,~h5^eJPF3L*W`', '91 So Po Yau Street\nAm Keung\nHong Kong', '1987-07-10', 'Wanita', '24054530', '60848347', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(124, 1, 3, 'Abby', 'Gibson', 'ryder24@hotmail.com.hkx', ',~@\"FvIKCpX', '40 Kut LipSam ', '1953-05-19', 'Pria', '94617345', '94441432', '0000-00-00', '2019-06-22 08:00:59', '2019-06-29 16:18:06', 'interview'),
(125, 1, 1, 'Litzy', 'Altenwerth', 'nklein@gmail.com', '^EMis:~O:K', '64 Sip Au New Village\nHui Yai Tsin\nKowloon', '1987-07-10', 'Wanita', '96670444', '25196070', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(126, 1, 1, 'Brett', 'Dare', 'pollich.maureen@hotmail.com', 'ch6#Nd', '77 Song Mong Street\nChui Nip\nHong Kong', '1943-07-03', 'Pria', '53906273', '26332232', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(127, 1, 1, 'Frank', 'Lockman', 'morgan52@cremin.com.hk', '\"^qET=)o', '17 Kam Chuk Ku Tsuen\nTak Chui Ho\nNew Territories', '1965-12-26', 'Pria', '35440446', '26319479', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(128, 1, 1, 'Isac', 'Kulas', 'raphaelle.block@gmail.com', 'j,-*mg#kLeI_', '42 Wan Tsai Wai\nTseng Hou Lang\nHong Kong', '1934-12-02', 'Pria', '91603226', '51026194', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(129, 1, 1, 'Monte', 'Green', 'yhermann@considine.idv.hk', '2i}U\\w82A[5Q', 'Block 21, Au Shou Tong Court\nYuk Tseung\nNew Territories', '1928-07-06', 'Wanita', '33778559', '99724693', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(130, 1, 1, 'Omer', 'Cronin', 'rutherford.dawn@yahoo.com.hk', 't+z\\e(|${#*7_I3\\BQ6g', '14 Lok Me New Village\nCheuk Nin\nNew Territories', '1955-03-08', 'Wanita', '22049144', '67863123', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(131, 1, 1, 'Addie', 'Schumm', 'bednar.julius@yahoo.com', 'ks\\|pG+b[', '16 Wa Pung Tsa Village\nSip Pau\nKowloon', '1987-07-10', 'Wanita', '56050916', '69386193', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(132, 1, 1, 'Kurtis', 'Pollich', 'herman07@abernathy.org', 'SlL-7KAvO\"w{', '72 Nok Nuk Shoi\nSuet Oi\nNew Territories', '1987-07-10', 'Pria', '65251950', '21631504', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(133, 1, 1, 'Amely', 'Reynolds', 'kkuphal@barton.com.hk', '8CWcON', '99 Liu Luen Road\nPiu Kin\nHong Kong', '1987-07-10', 'Pria', '99332495', '98028518', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(134, 1, 1, 'Ransom', 'Wilderman', 'janie.bahringer@jakubowski.com', 'G2Cnb{w&kRfjhi2', 'Block 60, Tsau Yau Court\nUng Kin Cheung\nKowloon', '1987-07-10', 'Wanita', '26761111', '90389985', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(135, 1, 1, 'Mellie', 'Wintheiser', 'barrows.cory@hotmail.com', '#K/P2m?.I\"', '36 Chung Chak Wai\nAberdeen\nNew Territories', '1987-07-10', 'Wanita', '96750198', '60436159', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(136, 1, 1, 'Sanford', 'Roberts', 'jaiden.berge@yahoo.com', '`h;PsOYJV8>|::', '18 La Am Wai\nMai Hek\nKowloon', '1987-07-10', 'Pria', '61380423', '61644589', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(137, 1, 1, 'Richard', 'Towne', 'eturcotte@hotmail.com.hk', '1bnu!T]aR!Csni{Er4', '24 Ping Shing Tsiu Avenue\nAberdeen\nKowloon', '1987-07-10', 'Wanita', '39683445', '32663695', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(138, 1, 1, 'Thurman', 'Nienow', 'selmer08@hotmail.com', 'dzig0$^P.>]', 'Block 51, Hon Him At Estate\nKong Ung Shei\nHong Kong', '1950-02-24', 'Wanita', '37352525', '34073556', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(139, 1, 1, 'Kara', 'Emard', 'treva61@mueller.com', '[gw=e7q0\\4A', '96 Salisbury Road\nNim Tseung Shai\nHong Kong', '1987-07-10', 'Pria', '96712889', '23905077', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(140, 1, 1, 'Maximo', 'Balistreri', 'okeefe.daniela@corkery.net', 'so%1yC4ycD/ZC%x&=z2', '61 Pe Fu Street\nSam Tai\nNew Territories', '1982-11-15', 'Pria', '31093907', '32746933', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(141, 1, 1, 'Julia', 'Lowe', 'saige60@greenfelder.com.hk', ']MBmvYx', '16 Ham Tsek\nChuet Huet Ung\nNew Territories', '1967-11-13', 'Pria', '37885481', '34231701', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(142, 1, 1, 'Marjorie', 'Yundt', 'yhane@gmail.com', ']v7t:t!`i4K', '98 Ho La West Street\nLuet Tsung\nHong Kong', '1987-07-10', 'Wanita', '63320918', '31682063', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(143, 1, 1, 'Brain', 'Lang', 'rspencer@hotmail.com.hk', '&3]M8=N9zd<Z0', '48 Chai Nik Street\nWang Kat\nNew Territories', '1941-12-05', 'Wanita', '34324002', '96568177', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(144, 1, 1, 'Dianna', 'Lemke', 'hillary.walsh@pollich.com.hk', '$`Y[>Fc{Du]o<TV)`<V', '55 Sak Shap Shun Street\nLun Chong\nKowloon', '1969-01-22', 'Wanita', '53240337', '34160446', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(145, 1, 1, 'Aubrey', 'Romaguera', 'glover.kobe@huels.com.hk', '4|&g^#_4\"g;j0NhR', '44 Ngau Shang O Wai\nStanley\nHong Kong', '1987-07-10', 'Wanita', '65370715', '61491788', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(146, 1, 1, 'Kaylie', 'Yost', 'bconroy@koss.net', 'LBu\":R7405)bu+v3Q', 'Block 36, Koi Yeng Kam Court\nTong Pau\nKowloon', '1968-01-30', 'Wanita', '20979152', '92327823', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(147, 1, 1, 'Laney', 'Mitchell', 'hickle.heidi@lockman.com', '5%7FfBZ+?&B=Dtw@,e', '18 Lou Nui Lau North Road\nFe Sang Hiu\nHong Kong', '1987-01-16', 'Pria', '69927377', '27366870', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(148, 1, 1, 'London', 'Deckow', 'welch.enola@yahoo.com', '6qQQO,=?5J[', 'Block 57, Tsuet Mui Estate\nOn Sai\nNew Territories', '1925-02-19', 'Wanita', '51657302', '50408657', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(149, 1, 1, 'Alysson', 'Stroman', 'clotilde.rath@yahoo.com', 'o8=~2%E^IS#', '11 Soi Shung Choi Street East\nKim So\nHong Kong', '1948-05-28', 'Pria', '95091621', '69008613', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(150, 1, 1, 'Samantha', 'Gorczany', 'kacie.morissette@gmail.com', '/GX+B,Z94{0:ct', '56 Fan Road\nNam Luk\nKowloon', '1987-07-10', 'Wanita', '30681995', '30832124', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(151, 1, 1, 'Hyman', 'Stokes', 'oren49@yahoo.com', 'mY1{p<\"2n', 'Block 94, Tsuet Kang Lak Estate\nSai Sam Fong\nKowloon', '1951-12-27', 'Wanita', '67618507', '61385931', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(152, 1, 1, 'Zane', 'Predovic', 'skiles.bud@cruickshank.edu.hk', 'NHm%z.)', '92 Poi Yuet Ting Road South\nSong Nip Sou\nNew Territories', '1925-12-10', 'Wanita', '91758304', '92247167', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(153, 1, 1, 'Prudence', 'Hills', 'kiehn.skye@hyatt.biz', 'Cj$U?;2^-*l!^X^O', '98 Yat Cha Ngong Square\nAberdeen\nHong Kong', '1974-02-17', 'Pria', '37339432', '23700468', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(154, 1, 1, 'Devon', 'Cassin', 'mtreutel@hotmail.com.hk', ',3zgJXn', 'Block 18, Shung Pat Kai Court\nLou Fung Kwong\nNew Territories', '1987-07-10', 'Pria', '99750818', '64627522', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(155, 1, 1, 'Rahsaan', 'Volkman', 'white.anita@hotmail.com', 'b1wE.5s21q&&', '24 Keu Huen\nMak Kut\nKowloon', '1987-07-10', 'Wanita', '29051441', '36866273', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(156, 1, 1, 'Vickie', 'Ward', 'bette.cronin@yahoo.com', 'X=}CEZ9To$5', 'Block 35, Nuk Yip Ching Estate\nStanley\nNew Territories', '1975-09-16', 'Pria', '65990353', '52615562', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(157, 1, 1, 'Gloria', 'Ondricka', 'dolores44@hickle.biz', '>%%C_v', '49 Nanking Road\nNip Fut Liu\nKowloon', '1987-07-10', 'Pria', '53021148', '64899611', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(158, 1, 1, 'Amani', 'Zulauf', 'king71@hotmail.com.hk', '#/xW+)#\"40`=}A', 'Block 23, Tsiu Mik Estate\nShin O\nHong Kong', '1942-07-26', 'Wanita', '23942442', '95896448', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(159, 1, 1, 'Arthur', 'Thiel', 'alessandro20@pfeffer.com.hk', '\'O6G;`gcbwV', '40 Sik Na Tut Avenue South\nKot Kik Tuk\nNew Territories', '1954-04-30', 'Wanita', '93859125', '53898047', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(160, 1, 1, 'Christian', 'Miller', 'gcassin@yahoo.com.hk', '(M#fqKE7f+2;_PM?', '40 Loi Shong New Village\nHai Koi\nNew Territories', '1933-05-12', 'Wanita', '26136649', '59396589', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(161, 1, 1, 'Jaida', 'Kilback', 'zakary.ondricka@hotmail.com', 'NdAS]>DuTtw', '88 Choi Shat\nVictoria\nKowloon', '1987-07-10', 'Wanita', '51441610', '36763997', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(162, 1, 1, 'Jonas', 'McLaughlin', 'clinton.smitham@yahoo.com.hk', 'K%tVhgv)', '59 Kip Tsau Avenue North\nShim Oi\nHong Kong', '1950-01-15', 'Pria', '31347892', '25430697', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(163, 1, 1, 'Harry', 'Hackett', 'colleen.mueller@hotmail.com', 'K<ncN\\XTyc#Y', 'Block 30, Mou Tik Estate\nChim Ei Nam\nNew Territories', '1978-07-01', 'Pria', '92034923', '31946111', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(164, 1, 1, 'Gillian', 'Cassin', 'nsawayn@gmail.com', ',tmV`W', 'Block 96, Tak Yik Estate\nTek Nip\nHong Kong', '1923-09-21', 'Wanita', '38596277', '90498066', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(165, 1, 1, 'Maximillia', 'Mills', 'maxie05@yahoo.com', 'sLNCv1sX\\$X{1V', '99 Lut Sak Ngai Avenue\nAk Nin\nHong Kong', '1936-12-24', 'Wanita', '30244336', '60035830', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(166, 1, 1, 'Tressa', 'Abshire', 'effertz.terrence@yahoo.com', 'Nz|h,sV<]29Sc&/w+#k', 'Block 44, Tap Nung Wak Estate\nOu Sha\nKowloon', '1987-07-10', 'Wanita', '97158119', '22020459', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(167, 1, 1, 'Thomas', 'Jakubowski', 'alisa.barton@yahoo.com', '=W\'CgF\\uH$iVFO,mkWYd', '11 Cho E Tut\nYip Fuk Kek\nNew Territories', '1925-10-13', 'Wanita', '53468464', '29900184', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(168, 1, 1, 'Rosemary', 'Christiansen', 'conroy.elenora@hotmail.com', '7DVOU).}', '50 Lin Lei Village\nHuk Huk\nHong Kong', '1987-07-10', 'Wanita', '39415056', '61933496', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(169, 1, 1, 'Nina', 'Parisian', 'isabell.ferry@yahoo.com.hk', 'ZanYb<B={CGg\"CkU', '39 Yin Lik Tsing Circuit\nYing Heung Mo\nHong Kong', '1987-07-10', 'Wanita', '29695854', '96066705', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(170, 1, 1, 'Elisabeth', 'Haley', 'orn.kali@yahoo.com', 'Cq/wg%/', '93 Cham Lak Avenue\nStanley\nNew Territories', '1987-07-10', 'Pria', '38244296', '61062242', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(171, 1, 1, 'Dusty', 'Metz', 'legros.michele@yahoo.com', '56y\'rzN\'+{T', '25 Siu Circuit\nHim Ap Kon\nHong Kong', '1987-07-10', 'Pria', '25040605', '56365728', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(172, 1, 1, 'Bertha', 'Fritsch', 'vena38@yahoo.com', 'd<$)lt%dZ8<yBE{', '93 Ap Hin\nLut Seuk\nNew Territories', '1921-01-29', 'Wanita', '61983217', '21473058', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(173, 1, 1, 'Braulio', 'Connelly', 'jody07@friesen.edu.hk', 'cbeY*S\\3N', '94 Pong Au Tsim North Path\nFo Toi Pang\nKowloon', '1932-08-10', 'Wanita', '30981533', '59096383', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(174, 1, 1, 'Cara', 'Witting', 'amalia01@yahoo.com.hk', 'kBg&poEk*<Jbjg`I', 'Block 33, Fun Tsap Kap Estate\nMut Hou\nHong Kong', '1974-11-16', 'Wanita', '34624844', '20163376', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(175, 1, 1, 'Elmo', 'Williamson', 'kuhic.karina@hotmail.com.hk', '(nR|7R7\'L94(Y%', '86 Nan Ngong Sap Square\nYeng Niu Ha\nKowloon', '1987-07-10', 'Wanita', '95480789', '90896951', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(176, 1, 1, 'Frederik', 'Feeney', 'murray.cortez@hotmail.com', 'e`RzOrl8S/\\TX(kd20', 'Block 50, Fang So Estate\nHiu Sai\nHong Kong', '1987-07-10', 'Wanita', '91098735', '25430030', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(177, 1, 1, 'Nella', 'Bayer', 'effertz.anissa@hotmail.com', 'e#ua9ihu-,U^!', '95 Shuen Yi Tsau San Tsuen\nVictoria\nHong Kong', '1987-07-10', 'Wanita', '57196396', '37074893', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(178, 1, 1, 'Vella', 'Wiegand', 'hmclaughlin@hoppe.org', 'J(&t{Z<v^', '49 Yeuk Kim Ngou\nPong Tsuen\nHong Kong', '1979-03-05', 'Wanita', '90525938', '63731739', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(179, 1, 1, 'Leta', 'Lowe', 'kuhlman.bethel@reichert.edu.hk', '~mCR,uht', '16 Stanley New Village\nLong Yan Tsau\nNew Territories', '1924-04-30', 'Pria', '51293362', '28053848', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(180, 1, 1, 'Lori', 'Koch', 'donna26@hotmail.com', '&5,o}|9SgGYD)(2Bu:2', '19 Kok Man Lane\nPiu Fai\nHong Kong', '1921-09-01', 'Pria', '58962988', '57208258', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(181, 1, 1, 'Furman', 'Schmeler', 'beier.angie@yahoo.com.hk', 'E>L!qE~', '60 Hek Mong Fo Wai\nPut Tsat\nKowloon', '1948-01-13', 'Pria', '96825548', '93976714', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(182, 1, 1, 'Freeman', 'McGlynn', 'bechtelar.annabel@hotmail.com', 'lcC0\\.rrr/P^KO<&d{', '67 Poi Sa Chok New Village\nSeng Sheuk\nNew Territories', '1943-03-29', 'Pria', '22134146', '92754194', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(183, 1, 1, 'Brooke', 'Spinka', 'lera.kris@eichmann.com', '?3_#gXX`\'>\"eUM?wCsy', '18 Chuen Cheng Village\nYau Tak Fat\nNew Territories', '1927-11-11', 'Wanita', '25260948', '21245543', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(184, 1, 1, 'Alberto', 'Raynor', 'karianne08@sauer.com.hk', '@Y7WMh&n|', 'Block 18, Sat Ei Sip Estate\nNg Choi Wik\nHong Kong', '1987-07-10', 'Wanita', '65182273', '20842393', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(185, 1, 1, 'Jaunita', 'Conroy', 'bruen.philip@christiansen.com', '>>=!x5|,FdW=>eq9\'~;', '86 Kang Tit East Avenue\nNgan Luen\nNew Territories', '1920-05-10', 'Pria', '51828453', '53191720', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(186, 1, 1, 'Ben', 'Bayer', 'mills.maya@hotmail.com.hk', '*].*d0', 'Block 23, Tsz Po La Court\nSan Heu\nHong Kong', '1943-08-05', 'Pria', '62613688', '63843523', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(187, 1, 1, 'Walter', 'Mertz', 'glen21@langworth.com', '1Yxb(`X\",@XaA@qM$b,{', '79 Shau Kut Wok New Village\nKek Yan\nKowloon', '1987-07-10', 'Pria', '91506982', '93027764', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(188, 1, 1, 'Arvilla', 'Kilback', 'fhills@conn.com', '<S;]t*zO2>|aV7sf', '96 Ham Kuet Tsuen Street East\nStanley\nHong Kong', '1980-04-24', 'Wanita', '54843122', '38357976', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(189, 1, 1, 'Monroe', 'O\'Keefe', 'schowalter.kade@hotmail.com.hk', 'aoX9+#1>S)>]x', '79 Tse Kiu Fan Road\nTan Chung\nNew Territories', '1937-07-02', 'Wanita', '32397155', '62646610', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(190, 1, 1, 'Barney', 'Swaniawski', 'lehner.bradford@gmail.com', 'D3iE1fg:?nYl=)#sp+', '66 Tsam Ta\nYap Tuk Chak\nKowloon', '1987-07-10', 'Pria', '94920473', '24722350', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(191, 1, 1, 'Thora', 'Little', 'chadd53@yahoo.com', 'DMX?gf0JM6}4\"w', '65 Tam Fang Avenue\nFui Ang\nKowloon', '1958-03-28', 'Wanita', '28294839', '94261213', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(192, 1, 1, 'Augustus', 'Hackett', 'porter.price@kuphal.edu.hk', ')6VN`BXIg\\ESl7mi', '95 Hui Nai North Path\nKuen Lim Shai\nHong Kong', '1948-10-31', 'Pria', '28804444', '61460031', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(193, 1, 1, 'Mustafa', 'Bednar', 'zerdman@hotmail.com', ']si}yN>x(dL^L;);', '16 Ei Ko Village\nHit Lap\nHong Kong', '1978-10-27', 'Wanita', '52368318', '53962662', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(194, 1, 1, 'Pablo', 'Cruickshank', 'rmurray@hotmail.com.hk', '54:p,$oe!@\\-9~6ka', 'Block 74, Shap Lap Shang Court\nLou Sui At\nNew Territories', '1987-07-10', 'Wanita', '67934341', '51523091', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(195, 1, 1, 'Shirley', 'Bernier', 'iva04@yahoo.com.hk', 'nHR*[E4e_d(6', 'Block 10, Yeung Wat Meng Estate\nTsue Yi\nKowloon', '1987-07-10', 'Pria', '25364624', '67211647', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(196, 1, 1, 'Ruth', 'Abernathy', 'corwin.ena@sawayn.edu.hk', 'Uyr\'(JM8', '87 Sun Neung Tsok Tsuen\nFai Ha Lai\nNew Territories', '1987-07-10', 'Pria', '61404899', '68416354', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'karyawan aktif'),
(197, 1, 1, 'Jacky', 'Hyatt', 'vbecker@batz.com.hk', '67xUjq-x?l,O#I/<Wc', 'Block 66, Ship Pong Estate\nCham Neung\nKowloon', '1973-09-21', 'Pria', '98542530', '90592625', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(198, 1, 1, 'Bernard', 'Rau', 'trudie.glover@ward.com.hk', 'y\'h3>{=>28rre', '63 Yeuk Fun\nKin Nui\nKowloon', '1987-07-10', 'Wanita', '66303391', '65617380', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(199, 1, 1, 'Ashley', 'Bahringer', 'aryan@dare.net', '@@<TJ\\', '11 Tang Loi Lane\nSuet Leung\nKowloon', '1986-04-05', 'Wanita', '54713433', '95907364', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'interview'),
(200, 1, 1, 'Lauretta', 'Rogahn', 'breichert@yahoo.com.hk', '~FRkgo`0', '63 Kwong Ngoi Ho Village\nTsung Tei\nKowloon', '1955-02-11', 'Wanita', '28243860', '27824781', '0000-00-00', '2019-06-22 08:00:59', '2019-06-22 08:00:59', 'karyawan aktif'),
(203, 2, 2, 'Adam', 'Alfiansyah', 'www@wegodev.com', '$2y$10$SXa2eUzSF8hglqC6Z41eJO4qH9S8CNMKCmPmal1GO1yf0GooNnZbG', 'ooo', '1990-06-17', 'Pria', '9999', '88888', '0000-00-00', '2019-06-22 14:45:36', '2019-06-30 07:06:45', 'karyawan aktif');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `tipe` varchar(100) NOT NULL,
  `nama_kategori` varchar(300) NOT NULL,
  `keterangan` text NOT NULL,
  `dibuat` datetime NOT NULL,
  `diganti` datetime NOT NULL,
  `status` enum('aktif','tidak aktif','hapus') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `tipe`, `nama_kategori`, `keterangan`, `dibuat`, `diganti`, `status`) VALUES
(1, 'gjt', 'Gaji', '', '2019-06-29 16:58:52', '2019-06-29 17:11:56', 'aktif'),
(2, 'gjt', 'Uang Makan', 'Uang makan karyawan', '2019-06-29 17:12:29', '2019-06-29 17:12:29', 'aktif'),
(3, 'gjt', 'THR', 'THR untuk karyawan', '2019-06-29 17:13:02', '2019-06-29 17:13:02', 'aktif'),
(4, 'gjt', 'Uang Bensin', 'Uang bensin karyawan yang dijalan seperti kurir', '2019-06-29 17:13:55', '2019-06-29 17:13:55', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `posisi`
--

CREATE TABLE `posisi` (
  `id` int(10) NOT NULL,
  `nama_posisi` varchar(150) NOT NULL,
  `dibuat` date NOT NULL,
  `diganti` date NOT NULL,
  `status` enum('aktif','tidak aktif','hapus') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posisi`
--

INSERT INTO `posisi` (`id`, `nama_posisi`, `dibuat`, `diganti`, `status`) VALUES
(1, 'Belum di ketahui', '2019-06-21', '2019-06-29', 'aktif'),
(2, 'Staff', '2019-06-22', '2019-06-22', 'aktif'),
(3, 'Manager', '2019-06-22', '2019-06-22', 'aktif'),
(4, 'Supervisor', '2019-06-28', '2019-06-28', 'hapus'),
(5, 'Direktur', '2019-06-29', '2019-06-30', 'aktif'),
(6, 'CEO', '2019-06-30', '2019-06-30', 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `tunjangan`
--

CREATE TABLE `tunjangan` (
  `id` int(10) NOT NULL,
  `id_karyawan` int(10) NOT NULL,
  `id_kategori` int(10) NOT NULL,
  `nominal` int(10) NOT NULL,
  `status` enum('aktif','tidak aktif','hapus') NOT NULL,
  `dibuat` datetime NOT NULL,
  `diganti` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tunjangan`
--

INSERT INTO `tunjangan` (`id`, `id_karyawan`, `id_kategori`, `nominal`, `status`, `dibuat`, `diganti`) VALUES
(1, 203, 1, 1600000, 'aktif', '2019-06-30 05:30:17', '2019-06-30 05:30:17'),
(2, 9, 1, 1300000, 'tidak aktif', '2019-06-30 05:32:22', '2019-06-30 05:32:22'),
(3, 203, 3, 1500000, 'aktif', '2019-06-30 05:33:01', '2019-06-30 05:33:01'),
(4, 9, 3, 3500000, 'aktif', '2019-06-30 06:52:48', '2019-06-30 06:52:48'),
(5, 203, 2, 20000, 'aktif', '2019-06-30 06:31:42', '2019-06-30 06:31:42'),
(6, 37, 1, 90000, 'tidak aktif', '2019-06-30 06:56:16', '2019-06-30 06:56:16'),
(7, 128, 2, 20000, 'aktif', '2019-06-30 11:01:04', '2019-06-30 11:01:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departemen`
--
ALTER TABLE `departemen`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posisi`
--
ALTER TABLE `posisi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tunjangan`
--
ALTER TABLE `tunjangan`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `departemen`
--
ALTER TABLE `departemen`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posisi`
--
ALTER TABLE `posisi`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tunjangan`
--
ALTER TABLE `tunjangan`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
