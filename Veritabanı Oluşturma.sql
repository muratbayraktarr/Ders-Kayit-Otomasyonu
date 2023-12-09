-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:3306
-- Üretim Zamanı: 04 Ara 2023, 13:26:49
-- Sunucu sürümü: 8.0.33-0ubuntu0.22.04.2
-- PHP Sürümü: 8.1.2-1ubuntu2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `web_programlama1`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `courses`
--

CREATE TABLE `courses` (
  `course_id` int NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `capacity` int DEFAULT '0',
  `max_capacity` int NOT NULL,
  `department_id` int DEFAULT NULL,
  `instructor_id` int DEFAULT NULL,
  `day` varchar(50) DEFAULT NULL,
  `hours` varchar(20) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `class` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Tablo döküm verisi `courses`
--

INSERT INTO `courses` (`course_id`, `course_name`, `capacity`, `max_capacity`, `department_id`, `instructor_id`, `day`, `hours`, `level`, `class`) VALUES
(27, 'Veri Madenciliği', 2, 5, 1, 28, 'Pazartesi', '10:00-11:00', 3, 'A102'),
(28, 'Bilgisayar Ağları ve Ağ Programlama', 1, 4, 1, 29, 'Salı', '12:00-13:00', 3, 'A103'),
(29, 'Sistem Programlama', 1, 6, 1, 30, 'Çarşamba', '14:00-15:00', 3, 'C02'),
(30, 'Yazılım Proje Yönetimi', 1, 3, 1, 17, 'Perşembe', '16:00-17:00', 3, 'A101'),
(31, 'Seçmeli Ders I (YZL 3XX)', 1, 5, 1, 2, 'Cuma', '11:00-12:00', 3, 'A103'),
(32, 'Siber Güvenlik', 2, 5, 1, 17, 'Pazartesi', '14:00-15:00', 3, 'C09'),
(33, 'Makine Öğrenmesi ve Yapay Zeka', 1, 6, 1, 29, 'Salı', '15:00-16:00', 3, 'C09'),
(34, 'Yazılım Mühendisliği için Olasılık ve İstatistik', 1, 3, 1, 5, 'Çarşamba', '15:00-16:00', 3, 'A103');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `departments`
--

CREATE TABLE `departments` (
  `department_id` int NOT NULL,
  `department_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Tablo döküm verisi `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`) VALUES
(1, 'Yazılım Mühendisliği'),
(2, 'Endüstri Mühendisliği'),
(4, 'Makine Mühendisliği'),
(24, 'Elektrik ve Elektronik Mühendisliği');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `student_courses`
--

CREATE TABLE `student_courses` (
  `id` int NOT NULL,
  `student_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Tablo döküm verisi `student_courses`
--

INSERT INTO `student_courses` (`id`, `student_id`, `course_id`) VALUES
(11, 20, 27),
(12, 20, 28),
(13, 20, 29),
(14, 20, 30),
(15, 20, 31),
(16, 20, 32),
(17, 20, 33),
(19, 19, 27),
(20, 19, 32),
(21, 19, 34);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `department_id` int DEFAULT NULL,
  `level` int DEFAULT NULL,
  `datetime` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`user_id`, `name`, `username`, `password`, `role`, `department_id`, `level`, `datetime`) VALUES
(1, 'Murat Bayraktar', 'mazarat2002', '1', 'Admin', NULL, NULL, '2023-11-28 06:03:35'),
(2, 'Dilara Kanadasi', 'dilara', '1', 'Öğretmen', NULL, NULL, '2023-11-28 06:03:35'),
(5, 'Alperen Emir', 'alperen', '1', 'Öğretmen', NULL, NULL, '2023-11-28 20:13:10'),
(17, 'Beyza Soydaş', 'beyza', 'beyza', 'Öğretmen', NULL, NULL, '2023-12-02 11:25:43'),
(18, 'Tekin Mutlu', 'tekin', 'tekin', 'Admin', NULL, NULL, '2023-12-02 11:51:26'),
(19, 'Berke Demir', 'berke', '1', 'Öğrenci', 1, 3, '2023-12-02 12:05:42'),
(20, 'Ahmet Özsoy', 'ahmet', '1', 'Öğrenci', 1, 3, '2023-12-02 12:16:52'),
(21, 'Doğukan Şahin', 'dogukan', '1', 'Öğrenci', 1, 3, '2023-12-02 12:17:17'),
(22, 'Tarık Özdemir', 'tarık', '1', 'Öğrenci', 1, 3, '2023-12-02 12:18:03'),
(28, 'Ahmet Anıl Müngen', 'amungen', '1', 'Öğretmen', NULL, NULL, '2023-12-03 13:30:02'),
(29, 'Mustafa Sami Cücen', 'mcucen', '1', 'Öğretmen', NULL, NULL, '2023-12-03 13:30:20'),
(30, 'Aybüke Bozkurt', 'abozkurt', '1', 'Öğretmen', NULL, NULL, '2023-12-03 13:30:31');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `instructor_id` (`instructor_id`);

--
-- Tablo için indeksler `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Tablo için indeksler `student_courses`
--
ALTER TABLE `student_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `course_id` (`course_id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_users_department` (`department_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `courses`
--
ALTER TABLE `courses`
  MODIFY `course_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Tablo için AUTO_INCREMENT değeri `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Tablo için AUTO_INCREMENT değeri `student_courses`
--
ALTER TABLE `student_courses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  ADD CONSTRAINT `courses_ibfk_3` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`user_id`);

--
-- Tablo kısıtlamaları `student_courses`
--
ALTER TABLE `student_courses`
  ADD CONSTRAINT `student_courses_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `student_courses_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Tablo kısıtlamaları `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
