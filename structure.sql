-- phpMyAdmin SQL Dump
-- version 5.0.0-dev
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 16, 2018 at 10:45 PM
-- Server version: 10.3.9-MariaDB-log
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gaokao`
--

-- --------------------------------------------------------

--
-- Table structure for table `dypbk`
--

CREATE TABLE `dypbk` (
  `serial_num` int(11) NOT NULL COMMENT '序号',
  `school_id` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '院校代号',
  `school_name` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '院校名称',
  `school_plan` int(11) NOT NULL COMMENT '院校计划',
  `cate_field` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '专业类别',
  `cate_id` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '专业代号',
  `cate_name` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '专业名称',
  `cate_plan` int(11) NOT NULL COMMENT '专业计划数',
  `constitution` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '招生章程',
  `province` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所在省',
  `ranking` int(11) NOT NULL COMMENT '全国热度排名',
  `f985` int(1) NOT NULL DEFAULT 0 COMMENT '985高校',
  `f211` int(1) NOT NULL DEFAULT 0 COMMENT '211高校',
  `membership` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '隶属于',
  `guanwang` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '官网',
  `shoufei` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收费',
  `jianjie` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '简介',
  `chafen` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '查分 URL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tqbk`
--

CREATE TABLE `tqbk` (
  `serial_num` int(11) NOT NULL COMMENT '序号',
  `school_id` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '院校代号',
  `school_name` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '院校名称',
  `school_plan` int(11) NOT NULL COMMENT '院校计划',
  `cate_field` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '专业类别',
  `cate_id` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '专业代号',
  `cate_name` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '专业名称',
  `cate_plan` int(11) NOT NULL COMMENT '专业计划数',
  `constitution` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '招生章程',
  `province` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所在省',
  `ranking` int(11) NOT NULL COMMENT '全国热度排名',
  `f985` int(1) NOT NULL DEFAULT 0 COMMENT '985高校',
  `f211` int(1) NOT NULL DEFAULT 0 COMMENT '211高校',
  `membership` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '隶属于',
  `guanwang` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '官网',
  `shoufei` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收费',
  `jianjie` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '简介',
  `chafen` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '查分 URL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `w_depbk`
--

CREATE TABLE `w_depbk` (
  `serial_num` int(11) NOT NULL COMMENT '序号',
  `school_id` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '院校代号',
  `school_name` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '院校名称',
  `school_plan` int(11) NOT NULL COMMENT '院校计划',
  `cate_field` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '专业类别',
  `cate_id` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '专业代号',
  `cate_name` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '专业名称',
  `cate_plan` int(11) NOT NULL COMMENT '专业计划数',
  `constitution` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '招生章程',
  `province` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所在省',
  `ranking` int(11) NOT NULL COMMENT '全国热度排名',
  `f985` int(1) NOT NULL DEFAULT 0 COMMENT '985高校',
  `f211` int(1) NOT NULL DEFAULT 0 COMMENT '211高校',
  `membership` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '隶属于',
  `guanwang` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '官网',
  `shoufei` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收费',
  `jianjie` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '简介',
  `chafen` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '查分 URL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `w_dypbk`
--

CREATE TABLE `w_dypbk` (
  `serial_num` int(11) NOT NULL COMMENT '序号',
  `school_id` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '院校代号',
  `school_name` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '院校名称',
  `school_plan` int(11) NOT NULL COMMENT '院校计划',
  `cate_field` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '专业类别',
  `cate_id` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '专业代号',
  `cate_name` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '专业名称',
  `cate_plan` int(11) NOT NULL COMMENT '专业计划数',
  `constitution` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '招生章程',
  `province` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所在省',
  `ranking` int(11) NOT NULL COMMENT '全国热度排名',
  `f985` int(1) NOT NULL DEFAULT 0 COMMENT '985高校',
  `f211` int(1) NOT NULL DEFAULT 0 COMMENT '211高校',
  `membership` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '隶属于',
  `guanwang` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '官网',
  `shoufei` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收费',
  `jianjie` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '简介',
  `chafen` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '查分 URL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `w_tqbk`
--

CREATE TABLE `w_tqbk` (
  `serial_num` int(11) NOT NULL COMMENT '序号',
  `school_id` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '院校代号',
  `school_name` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '院校名称',
  `school_plan` int(11) NOT NULL COMMENT '院校计划',
  `cate_field` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '专业类别',
  `cate_id` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '专业代号',
  `cate_name` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '专业名称',
  `cate_plan` int(11) NOT NULL COMMENT '专业计划数',
  `constitution` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '招生章程',
  `province` tinytext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '所在省',
  `ranking` int(11) NOT NULL COMMENT '全国热度排名',
  `f985` int(1) NOT NULL DEFAULT 0 COMMENT '985高校',
  `f211` int(1) NOT NULL DEFAULT 0 COMMENT '211高校',
  `membership` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '隶属于',
  `guanwang` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '官网',
  `shoufei` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '收费',
  `jianjie` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '简介',
  `chafen` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '查分 URL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dypbk`
--
ALTER TABLE `dypbk`
  ADD PRIMARY KEY (`serial_num`);

--
-- Indexes for table `tqbk`
--
ALTER TABLE `tqbk`
  ADD PRIMARY KEY (`serial_num`);

--
-- Indexes for table `w_depbk`
--
ALTER TABLE `w_depbk`
  ADD PRIMARY KEY (`serial_num`);

--
-- Indexes for table `w_dypbk`
--
ALTER TABLE `w_dypbk`
  ADD PRIMARY KEY (`serial_num`);

--
-- Indexes for table `w_tqbk`
--
ALTER TABLE `w_tqbk`
  ADD PRIMARY KEY (`serial_num`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dypbk`
--
ALTER TABLE `dypbk`
  MODIFY `serial_num` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号';

--
-- AUTO_INCREMENT for table `tqbk`
--
ALTER TABLE `tqbk`
  MODIFY `serial_num` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号';

--
-- AUTO_INCREMENT for table `w_depbk`
--
ALTER TABLE `w_depbk`
  MODIFY `serial_num` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号';

--
-- AUTO_INCREMENT for table `w_dypbk`
--
ALTER TABLE `w_dypbk`
  MODIFY `serial_num` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号';

--
-- AUTO_INCREMENT for table `w_tqbk`
--
ALTER TABLE `w_tqbk`
  MODIFY `serial_num` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
