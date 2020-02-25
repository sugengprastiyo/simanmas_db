/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : masjid_db

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-02-25 20:38:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adzan
-- ----------------------------
DROP TABLE IF EXISTS `adzan`;
CREATE TABLE `adzan` (
  `nama` varchar(50) NOT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`nama`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for aktifitas
-- ----------------------------
DROP TABLE IF EXISTS `aktifitas`;
CREATE TABLE `aktifitas` (
  `id` int(100) NOT NULL,
  `user_id` int(100) DEFAULT NULL,
  `masjid_id` int(100) DEFAULT NULL,
  `nama` varchar(225) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_berakhir` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aktifitas_user` (`user_id`),
  KEY `aktifitas_masjid` (`masjid_id`),
  CONSTRAINT `aktifitas_masjid` FOREIGN KEY (`masjid_id`) REFERENCES `masjid` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `aktifitas_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for artikel
-- ----------------------------
DROP TABLE IF EXISTS `artikel`;
CREATE TABLE `artikel` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) DEFAULT NULL,
  `masjid_id` int(100) DEFAULT NULL,
  `title` varchar(225) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `dibuat_tanggal` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `artikel_user` (`user_id`),
  KEY `artikel_masjid` (`masjid_id`),
  CONSTRAINT `artikel_masjid` FOREIGN KEY (`masjid_id`) REFERENCES `masjid` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `artikel_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for dokumentasi
-- ----------------------------
DROP TABLE IF EXISTS `dokumentasi`;
CREATE TABLE `dokumentasi` (
  `id` int(100) NOT NULL,
  `masjid_id` int(100) DEFAULT NULL,
  `aktifitas_id` int(100) DEFAULT NULL,
  `content_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dok_masjid` (`masjid_id`),
  KEY `dok_aktifitas` (`aktifitas_id`),
  CONSTRAINT `dok_aktifitas` FOREIGN KEY (`aktifitas_id`) REFERENCES `aktifitas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dok_masjid` FOREIGN KEY (`masjid_id`) REFERENCES `masjid` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for masjid
-- ----------------------------
DROP TABLE IF EXISTS `masjid`;
CREATE TABLE `masjid` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `nama` varchar(225) NOT NULL,
  `alamat` varchar(225) DEFAULT NULL,
  `ketua` varchar(225) DEFAULT NULL,
  `dibangun` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for peminjaman
-- ----------------------------
DROP TABLE IF EXISTS `peminjaman`;
CREATE TABLE `peminjaman` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `user_id` int(100) DEFAULT NULL,
  `masjid_id` int(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `peminjaman_user` (`user_id`),
  KEY `peminjaman_masjid` (`masjid_id`),
  CONSTRAINT `peminjaman_masjid` FOREIGN KEY (`masjid_id`) REFERENCES `masjid` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `peminjaman_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `nama` varchar(225) DEFAULT NULL,
  `alamat` varchar(225) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `waktu_buat` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`,`username`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
