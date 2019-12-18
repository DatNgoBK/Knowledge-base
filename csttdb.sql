-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 07, 2018 at 06:33 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cstt`
--

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
`stt` int(11) NOT NULL,
  `number` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `groups` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `semester` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `keywords` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `pre_requests` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`stt`, `number`, `name`, `credit`, `groups`, `semester`, `keywords`, `pre_requests`) VALUES
(2, 'MI1110 228', 'Giải tích 1', 4, 'CORE', '01:02:03', 'logic:mathematics:algorithms:calculus ', 'MI1120 228'),
(3, 'MI1120 228', 'Giải tích II', 3, 'CORE', '01:02:03', 'logic:mathematics:algorithms:calculus ', 'MI1110 228'),
(4, 'MI1130 228', 'Giải tích III', 3, 'CORE', '01:02:03', 'logic:mathematics:algorithms:calculus ', 'MI1110 228'),
(5, 'MI1140 228', 'Đại số', 4, 'CORE', '01:02:03', 'logic:mathematics:algorithms:algebra', ''),
(6, 'PH1110 228', 'Vật lý I', 3, 'CORE', '01:02:03', 'logic:physics', ''),
(7, 'PH1120 228', 'Vật lý II', 3, 'CORE', '01:02:03', 'logic:physics', 'PH1110 228'),
(8, 'EM1010 228', 'Quản trị học đại cương', 2, 'CORE', '01:02:03', 'marketing', ''),
(9, 'IT1110 228', 'Tin học đại cương', 4, 'CORE', '01:02:03', 'logic:programming', ''),
(10, 'SSH1110 228', 'Những NL cơ bản của CN Mác-Lênin I', 2, 'CORE', '01:02:03', 'logic:', ''),
(11, 'SSH1120 228', 'Những NL cơ bản của CN Mác-Lênin II', 3, 'CORE', '01:02:03', 'logic:', 'SSH1110 228'),
(12, 'SSH1050 228', 'Tư tưởng Hồ Chí Minh', 2, 'CORE', '01:02:03', 'logic:', 'SSH1110 228:SSH1120 228'),
(13, 'SSH1130 228', 'Đường lối CM của Đảng CSVN', 3, 'CORE', '01:02:03', 'a', 'SSH1110 228:SSH1120 228'),
(14, 'SSH1170 228', 'Pháp luật đại cương', 2, 'CORE', '01:02:03', '', ''),
(15, 'PE1010 228', 'Giáo dục thể chất A', 0, 'CORE', '01:02:03', '', ''),
(16, 'PE1020 228', 'Giáo dục thể chất B', 0, 'CORE', '01:02:03', '', 'PE1010 228'),
(17, 'PE1030 228', 'Giáo dục thể chất C', 0, 'CORE', '01:02:03', '', 'PE1020 228'),
(18, 'PE201x 228', 'Giáo dục thể chất D', 0, 'CORE', '01:02:03', '', 'PE1030 228'),
(19, 'PE202x 228', 'Giáo dục thể chất E', 0, 'CORE', '01:02:03', '', 'PE201x 228'),
(20, 'MIL1110 228', 'Đường lối QS của Đảng', 0, 'CORE', '01:02:03', '', ''),
(21, 'MIL1120 228', 'Công tác QP-AN', 0, 'CORE', '01:02:03', '', 'MIL1120 228'),
(22, 'MIL1130 228', 'QS chung và kỹ chiến thuật bắn súng AK', 0, 'CORE', '01:02:03', '', 'MIL1120 228'),
(23, 'MI2020 228', 'Xác suất thống kê', 3, 'ELEC_CORE', '01:02:03', 'statistics:probability:logic', 'MI1110 228:MI1140 228'),
(24, 'PH1130 228', 'Vật lý III', 3, 'ELEC_CORE', '01:02:03', 'logic:physics', 'PH1120 228'),
(25, 'CH1010 228', 'Hóa đại cương', 3, 'ELEC_CORE', '01:02:03', 'chemistry', ''),
(26, 'ME2015 228', 'Đồ họa kỹ thuật cơ bản', 3, 'ELEC_CORE', '01:02:03', 'design', ''),
(27, 'ME2040 228', 'Cơ học kỹ thuật ', 3, 'ELEC_CORE', '01:02:03', 'design', ''),
(28, 'IT2000 228', 'Nhập môn Công nghệ thông tin và Truyền thông', 3, 'CORE_IT', '01:02:03', 'programming', ''),
(29, 'IT3010 228', 'Cấu trúc dữ liệu và giải thuật', 3, 'CORE_IT', '01:02:03', 'algorithms:data structures', ''),
(30, 'IT3020 228', 'Toán rời rạc', 3, 'CORE_IT', '01:02:03', 'algorithms:mathematicsprobability', ''),
(31, 'IT3030 228', 'Kiến trúc máy tính ', 3, 'CORE_IT', '01:02:03', 'hardware:operating systems', ''),
(32, 'IT3040 228', 'Kỹ thuật lập trình', 2, 'CORE_IT', '01:02:03', 'logic:programming', 'IT1110 228'),
(33, 'IT3070 228', 'Hệ điều hành', 3, 'CORE_IT', '01:02:03', 'operating systems:hardware', ''),
(34, 'IT3080 228', 'Mạng máy tính', 3, 'CORE_IT', '01:02:03', 'network', 'IT2000 228'),
(35, 'IT3090 228', 'Cơ sở dữ liệu', 3, 'CORE_IT', '01:02:03', 'databases:design', 'IT3010 228'),
(36, 'IT3100 228', 'Lập trình hướng đối tượng', 2, 'CORE_IT', '01:02:03', 'logic:programming:data structures:program design', 'IT3040 228'),
(37, 'IT3110 228', 'LINUX và phần mềm nguồn mở', 2, 'CORE_IT', '01:02:03', 'operating systems', ''),
(38, 'IT3120 228', 'Phân tích và thiết kế hệ thống thông tin', 2, 'CORE_IT', '01:02:03', 'design', 'IT3090 228:IT3100 228'),
(39, 'IT3910 228', 'Project I', 3, 'CORE_IT', '01:02:03', 'programming', ''),
(40, 'IT3920 228', 'Project II', 3, 'CORE_IT', '01:02:03', 'programming:design', 'IT3910 228'),
(41, 'IT4010 228', 'An toàn và bảo mật thông tin', 3, 'CORE_IT', '01:02:03', 'network:cryptography ', 'IT3020 228:IT3070 228'),
(42, 'IT4040 228', 'Trí tuệ nhân tạo', 3, 'CORE_IT', '01:02:03', 'artificial intelligenSE', 'IT3020 228:IT3010 228'),
(43, 'IT4080 228', 'Nhập môn công nghệ phần mềm', 2, 'CORE_IT', '01:02:03', 'design:programming:management', 'IT3010 228'),
(44, 'IT4020 228', 'Nhập môn lý thuyết tính toán', 3, 'CS', '01:02:03', 'mathematics', ''),
(45, 'IT4030 228', 'Nhập môn hệ quản trị cơ sở dữ liệu', 2, 'CS', '01:02:03', 'design:databases', 'IT3090 228'),
(46, 'IT4050 228', 'Thiết kế và phân tích thuật toán', 3, 'CS', '01:02:03', 'logic:algorithms:design', ''),
(47, 'IT4079 228', 'Ngôn ngữ và phương pháp dịch', 2, 'CS', '01:02:03', '', ''),
(48, 'IT4110 228', ' Tính toán khoa học', 3, 'CS', '01:02:03', 'mathematics', ''),
(49, 'IT4130 228', 'Lập trình song song', 2, 'CS', '01:02:03', 'programming', ''),
(50, 'IT4141 228', 'Các thuật toán cơ bản trong tính toán tiến hoá', 3, 'CS', '01:02:03', 'mathematics:algorithms', ''),
(51, 'IT4768 228', 'Nhập môn khai phá dữ liệu', 3, 'CS', '01:02:03', 'data structures', ''),
(52, 'IT4769 228', 'Tối ưu hoá tổ hợp', 3, 'CS', '01:02:03', 'mathematics', ''),
(53, 'IT4777 228', 'Hình học tính toán', 3, 'CS', '01:02:03', 'logic:mathematics', ''),
(54, 'IT4778 228', 'Lập trình hệ thống', 3, 'CS', '01:02:03', 'logic:', ''),
(55, 'IT4759 228', 'Tìm kiếm cục bộ dựa trên ràng buộc', 3, 'CS', '01:02:03', 'logic', ''),
(56, 'IT5210 228', 'Đồ án tốt nghiệp kỹ sư (KHMT)', 12, 'CS', '01:02:03', 'logic', ''),
(57, 'IT4772 228', 'Xử lý ngôn ngữ tự nhiên', 3, 'ELEC_CS', '01:02:03', 'logic:', ''),
(58, 'IT4758 228', 'Nhập môn học máy', 3, 'ELEC_CS', '01:02:03', 'logic:artificial intelligenSE', ''),
(59, 'IT4776 228', 'Cơ sở thuật toán của lý thuyết mã hoá', 3, 'ELEC_CS', '01:02:03', 'logic:', ''),
(60, 'IT4774 228', 'Nhập môn nén dữ liệu', 3, 'ELEC_CS', '01:02:03', '', ''),
(61, 'IT4310 228', 'Cơ sở dữ liệu nâng cao', 3, 'IS', '01:02:03', 'design:databases', 'IT3090 228'),
(62, 'IT4859 228', 'Thiết kế và quản trị cơ sở dữ liệu', 3, 'IS', '01:02:03', 'design:databases', 'IT3090 228'),
(63, 'IT4341 228', 'Hệ trợ giúp quyết định', 2, 'IS', '01:02:03', 'programming:artificial intelligenSE', 'IT3090 228'),
(64, 'IT4361 228', 'Hệ cơ sở tri thức', 2, 'IS', '01:02:03', 'programming:artificial intelligenSE', 'IT4040 228'),
(65, 'IT4371 228', 'Các hệ phân tán', 2, 'IS', '01:02:03', 'programming', 'IT3100 228'),
(66, 'IT4409 228', 'Công nghệ web và dịch vụ trực tuyến', 3, 'IS', '01:02:03', 'programming', 'IT3100 228'),
(67, 'IT4421 228', 'Đồ án: Các công nghệ xây dựng hệ thống thông tin', 3, 'IS', '01:02:03', 'design:programming', 'IT3920 228'),
(68, 'IT4865 228', 'Tính toán phân tán', 3, 'IS', '01:02:03', '', ''),
(69, 'IT4843 228', 'Tích hợp dữ liệu và XML', 3, 'IS', '01:02:03', 'data structures', ''),
(70, 'IT4851 228', 'Hệ cơ sở dữ liệu đa phương tiện', 3, 'IS', '01:02:03', 'data structures', ''),
(71, 'IT4853 228', 'Tìm kiếm thông tin và trình diễn thông tin', 3, 'IS', '01:02:03', 'data structures', ''),
(72, 'IT5230 228', 'Đồ án tốt nghiệp kỹ sư (HTTT)', 12, 'IS', '01:02:03', 'design', ''),
(73, 'IT4772 228', 'Xử lý ngôn ngữ tự nhiên', 3, 'ELEC_IS', '01:02:03', 'logic:', ''),
(74, 'IT4844 228', 'Xử lý thông tin mờ', 3, 'ELEC_IS', '01:02:03', 'logic:', ''),
(75, 'IT4856 228', 'Quản trị dự án', 2, 'ELEC_IS', '01:02:03', 'design:', ''),
(76, 'IT4866 228', 'Học máy', 2, 'ELEC_IS', '01:02:03', 'logic:mathematics', ''),
(77, 'IT4899 228', 'Hệ thống hướng tác tử', 2, 'ELEC_IS', '01:02:03', 'programming', ''),
(78, 'IT4440 228', 'Tương tác Người –Máy', 3, 'SE', '01:02:03', 'hardware', 'IT3120 228'),
(79, 'IT4460 228', 'Phân tích yêu cầu phần mềm', 2, 'SE', '01:02:03', 'programming:design', 'IT4080 228'),
(80, 'IT4480 228', 'Làm việc nhóm và kỹ năng giao tiếp', 2, 'SE', '01:02:03', 'management:design', ''),
(81, 'IT4490 228', 'Thiết kế và xây dựng phần mềm', 3, 'SE', '01:02:03', 'programming:design', 'IT4080 228'),
(82, 'IT4530 228', 'Kỹ năng lập báo cáo kỹ thuật và Dự án', 1, 'SE', '01:02:03', 'programming', 'IT4080 228'),
(83, 'IT4541 228', 'Quản lý dự án phần mềm', 2, 'SE', '01:02:03', 'management:programming', 'IT4080 228'),
(84, 'IT4551 228', 'Phát triển phần mềm chuyên nghiệp', 3, 'SE', '01:02:03', 'programming', ''),
(85, 'IT4520 228', 'Kinh tế Công nghệ phần mềm', 2, 'SE', '01:02:03', 'management', ''),
(86, 'IT4501 228', 'Đảm bảo chất lượng Phần mềm', 2, 'SE', '01:02:03', 'programming', ''),
(87, 'IT4470 228', 'Đồ họa và hiện thực ảo', 3, 'SE', '01:02:03', 'computer graphics', ''),
(88, 'IT4883 228', 'Kỹ năng lập báo cáo kỹ thuật và Dự án', 1, 'SE', '01:02:03', 'programming', ''),
(89, 'IT4541 228', 'Phát triển phần mềm phân tán', 3, 'SE', '01:02:03', 'programming', ''),
(90, 'IT4885 228', 'Mô hình và thuật toán Internet phổ biến', 3, 'SE', '01:02:03', 'network', ''),
(91, 'IT5240 228', 'Đồ án tốt nghiệp kỹ sư (KTPM)', 12, 'SE', '01:02:03', 'programming', ''),
(92, 'IT4892 228', 'Phương pháp và công cụ đánh giá phần mềm', 3, 'ELEC_SE', '01:02:03', 'programming', ''),
(93, 'IT4875 228', 'Xử lý ngôn ngữ tự nhiên', 2, 'ELEC_SE', '01:02:03', 'logic:programming', ''),
(94, 'IT4895 228', 'Công nghệ Web tiên tiến', 2, 'ELEC_SE', '01:02:03', 'programming', ''),
(95, 'IT4898 228', 'Multimedia, trò chơi và các hệ thống giải trí', 2, 'ELEC_SE', '01:02:03', '', ''),
(96, 'IT4899 228', 'Hệ thống hướng tác tử', 2, 'ELEC_SE', '01:02:03', '', ''),
(97, 'IT4876 228', 'Nhập môn chương trình dịch', 2, 'ELEC_SE', '01:02:03', '', ''),
(98, 'IT4886 228', 'Kỹ nghệ Phần mềm hướng dịch vụ ', 3, 'ELEC_SE', '01:02:03', 'programming', ''),
(99, 'IT4887 228', 'Mạng không dây và phát triển ứng dụng di động', 3, 'ELEC_SE', '01:02:03', 'network', ''),
(100, 'IT4888 228', 'Văn phong Kỹ thuật (Technical Writing)', 3, 'ELEC_SE', '01:02:03', '', ''),
(101, 'IT4882 228', 'Mật mã và Ứng dụng', 3, 'ELEC_SE', '01:02:03', 'cryptography ', ''),
(102, 'IT4160 228', 'Vi xử lý', 3, 'CE', '01:02:03', 'hardware', ''),
(103, 'IT4200 228', 'Kỹ thuật ghép nối máy tính', 3, 'CE', '01:02:03', 'hardware', ''),
(104, 'IT4150 228', 'Kỹ thuật mạng', 2, 'CE', '01:02:03', 'network', 'IT3080 228'),
(105, 'IT4251 228', 'Vi xử lý', 3, 'CE', '01:02:03', 'hardware', ''),
(106, 'IT4160 228', 'Thiết kế IC', 3, 'CE', '01:02:03', 'hardware', ''),
(107, 'IT4240 228', 'Quản trị dự án công nghệ thông tin', 2, 'CE', '01:02:03', 'management:design', ''),
(108, 'IT4210 228', 'Hệ nhúng', 3, 'CE', '01:02:03', 'hardware', 'IT4160 228'),
(109, 'IT4290 228', 'Xử lý tiếng nói', 2, 'CE', '01:02:03', 'hardware', ''),
(110, 'IT4797 228', 'Đồ án hệ nhúng', 3, 'CE', '01:02:03', 'programming', ''),
(111, 'IT4261 228', 'An ninh mạng', 2, 'CE', '01:02:03', 'cryptography ', ''),
(112, 'IT4271 228', 'Hệ thống máy tính công nghiệp', 3, 'CE', '01:02:03', '', ''),
(113, 'IT4099 228', 'Xử lý ảnh', 3, 'CE', '01:02:03', 'programming', ''),
(114, 'IT4786 228', 'Lập trình hệ thống', 3, 'CE', '01:02:03', 'programming', ''),
(115, 'IT4785 228', 'Phát triển ứng dụng cho thiết bị di động', 2, 'CE', '01:02:03', 'programming', ''),
(116, 'IT5220 228', 'Đồ án tốt nghiệp kỹ sư (KTMT)', 12, 'CE', '01:02:03', 'hardware', ''),
(117, 'IT4784 228', 'Công nghệ JAVA', 2, 'ELEC_CE', '01:02:03', 'programming', ''),
(118, 'IT4782 228', 'Công nghệ .NET', 2, 'ELEC_CE', '01:02:03', 'programming', ''),
(119, 'IT4802 228', 'Lập trình xử lý tín hiệu số', 2, 'ELEC_CE', '01:02:03', 'programming', ''),
(120, 'IT4804 228', 'Đa phương tiện', 2, 'ELEC_CE', '01:02:03', '', ''),
(121, 'IT4796 228', 'Phân tích và thiết kế hệ thống mạng', 2, 'ELEC_CE', '01:02:03', 'design', ''),
(122, 'IT4815 228', 'Quản trị mạng', 2, 'ELEC_CE', '01:02:03', 'network', ''),
(123, 'IT4230 228', 'Kỹ năng giao tiếp', 2, 'ELEC_CE', '01:02:03', 'communication', ''),
(124, 'IT4805 228', 'Mạng nơron và ứng dụng', 2, 'ELEC_CE', '01:02:03', 'network', ''),
(125, 'IT4590 228', 'Lý thuyết thông tin', 2, 'NC', '01:02:03', 'network', ''),
(126, 'IT4601 228', 'Thiết bị truyền thông và mạng', 3, 'NC', '01:02:03', 'network', ''),
(127, 'IT4610 228', 'Hệ phân tán', 2, 'NC', '01:02:03', 'programming', ''),
(128, 'IT4661 228', 'Quản trị dữ liệu phân tán', 2, 'NC', '01:02:03', 'management:', ''),
(129, 'IT4815 228', 'Quản trị mạng', 2, 'NC', '01:02:03', 'network:management', ''),
(130, 'IT4681 228', 'Truyền thông đa phương tiện', 3, 'NC', '01:02:03', 'network', ''),
(131, 'IT4260 228', 'An ninh mạng', 2, 'NC', '01:02:03', 'network', ''),
(132, 'IT4650 228', 'Thiết kế mạng Intranet', 2, 'NC', '01:02:03', 'network', ''),
(133, 'IT4560 228', 'Kỹ thuật truyền thông', 3, 'NC', '01:02:03', 'network', ''),
(134, 'IT4621 228', 'Xử lý dữ liệu đa phương tiện', 3, 'NC', '01:02:03', '', ''),
(135, 'IT4690 228', 'Mạng không dây và truyền thông di động', 2, 'NC', '01:02:03', 'network', ''),
(136, 'IT4670 228', 'Đánh giá hiệu năng mạng', 2, 'NC', '01:02:03', 'network', ''),
(137, 'IT4711 228', 'Đồ án môn học chuyên ngành TTM', 2, 'NC', '01:02:03', 'network', ''),
(138, 'IT5250 228', 'Đồ án tốt nghiệp kỹ sư (TTM)', 12, 'NC', '01:02:03', 'network', ''),
(139, 'IT4240 228', 'Quản trị dự án Công nghệ thông tin', 2, 'ELEC_NC', '01:02:03', 'management:', ''),
(140, 'IT4090 228', 'Xử lý ảnh', 2, 'ELEC_NC', '01:02:03', 'computer graphics', ''),
(141, 'IT4901 228', 'Xử lý tín hiệu ngẫu nhiên', 2, 'ELEC_NC', '01:02:03', 'network', ''),
(142, 'IT4921 228', 'Các giao thức định tuyến', 2, 'ELEC_NC', '01:02:03', 'network', ''),
(143, 'IT4700 228', 'Các hệ thống thông tin vệ tinh', 2, 'ELEC_NC', '01:02:03', 'network', ''),
(144, 'IT4924 228', 'Tính toán di động', 2, 'ELEC_NC', '01:02:03', 'programming', ''),
(145, 'IT4927 228', 'Web thế hệ mới', 2, 'ELEC_NC', '01:02:03', 'programming', '');

-- --------------------------------------------------------

--
-- Table structure for table `credit_filter`
--

CREATE TABLE IF NOT EXISTS `credit_filter` (
  `id` varchar(10) CHARACTER SET utf8 NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `mult` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `credit_filter`
--

INSERT INTO `credit_filter` (`id`, `name`, `mult`) VALUES
('CR001', 'core_score', 1),
('CR002', 'elective_score', 1),
('CR003', 'general_score', 1);

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE IF NOT EXISTS `grade` (
`no` int(11) NOT NULL,
  `student_id` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  `course_number` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `grade` varchar(1) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`no`, `student_id`, `course_number`, `grade`) VALUES
(1, '20150569', 'MI1110 228', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `grade_rule`
--

CREATE TABLE IF NOT EXISTS `grade_rule` (
  `id` varchar(10) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `cpa` double DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `mult` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `grade_rule`
--

INSERT INTO `grade_rule` (`id`, `cpa`, `level`, `mult`) VALUES
('GR001', 2.5, 4, 3),
('GR002', 2.5, 3, 0.6),
('GR003', 3, 4, 0.5);

-- --------------------------------------------------------

--
-- Table structure for table `keyword`
--

CREATE TABLE IF NOT EXISTS `keyword` (
  `keyword` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keyword`
--

INSERT INTO `keyword` (`keyword`) VALUES
('algebra'),
('algorithms'),
('artificial intelligenSE'),
('calculus'),
('chemistry'),
('communication'),
('computer graphics'),
('cryptography '),
('data structures'),
('databases'),
('design'),
('hardware'),
('logic'),
('management'),
('marketing'),
('mathematics'),
('mathematicsprobability'),
('network'),
('operating systems'),
('physics'),
('probability'),
('program design'),
('programming'),
('statistics');

-- --------------------------------------------------------

--
-- Table structure for table `level_rule`
--

CREATE TABLE IF NOT EXISTS `level_rule` (
  `id` varchar(10) CHARACTER SET utf8 NOT NULL,
  `level` int(11) DEFAULT NULL,
  `test` tinyint(1) DEFAULT NULL,
  `mult` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level_rule`
--

INSERT INTO `level_rule` (`id`, `level`, `test`, `mult`) VALUES
('LV001', 1, 0, 1),
('LV002', 2, 0, 1),
('LV003', 3, 0, 1),
('LV004', 4, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `preference_filter`
--

CREATE TABLE IF NOT EXISTS `preference_filter` (
  `id` varchar(10) CHARACTER SET utf8 NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `mult` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `preference_filter`
--

INSERT INTO `preference_filter` (`id`, `name`, `mult`) VALUES
('PR001', 'match_score', 1),
('PR002', 'mismatch_score', 0.8);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` varchar(8) CHARACTER SET utf8 NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `specialization` varchar(10) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `specialization`) VALUES
('20150569', 'Mai Quốc Doanh', 'CS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
 ADD PRIMARY KEY (`stt`);

--
-- Indexes for table `credit_filter`
--
ALTER TABLE `credit_filter`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
 ADD PRIMARY KEY (`no`);

--
-- Indexes for table `grade_rule`
--
ALTER TABLE `grade_rule`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keyword`
--
ALTER TABLE `keyword`
 ADD PRIMARY KEY (`keyword`);

--
-- Indexes for table `level_rule`
--
ALTER TABLE `level_rule`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `preference_filter`
--
ALTER TABLE `preference_filter`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
MODIFY `stt` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=146;
--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
MODIFY `no` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
