-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: holiyey
-- ------------------------------------------------------
-- Server version	8.0.27-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `akun`
--

DROP TABLE IF EXISTS `akun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `akun` (
  `akun_id` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `sandi` varchar(100) DEFAULT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `nomor_hp` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`akun_id`),
  UNIQUE KEY `akun_id` (`akun_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `akun`
--

LOCK TABLES `akun` WRITE;
/*!40000 ALTER TABLE `akun` DISABLE KEYS */;
INSERT INTO `akun` VALUES ('1127ce912b474add84bb5885c8b45f7b','akun2@gmail.com','akun123','holiyey','08982723181'),('2d9a89852b614e668e8bbda946826fc2','akun4@gmail.com','akun123','akun4','0812312381329'),('7bea161e36f6451d9abca0cc4878e8a4','asdasd','123','asdasd','asdasd'),('920523b2ba0043f4b770997e029f8b79','akun7@gmail.com','akun123','akun7','012381391239'),('akun123akun123','holiyey@gmail.com','holiyey123','holiyey freetual','08988211559'),('bf986c71ed1f426780183bbd771e5db3','nabila@uwuw.com','nabila123','Nabila Uwuw','08272848219'),('db419884ee4f4602ad0a5111d0be8023','akun3@gmail.com','akun123','akun3','081293913'),('f48b76ff7d464658a58017c3d8388454','akun1@gmail.com','akun123','akun1','08988217342'),('f7c14ea9168d40b9b05412d237646df9','akun5@gmail.com','akun123','akun5','091283183212'),('fa3d85853e6e4f8fa0b0af9253aecbac','akun6@gmail.com','akun123','akun6','091231939');
/*!40000 ALTER TABLE `akun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paket_travelagent`
--

DROP TABLE IF EXISTS `paket_travelagent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paket_travelagent` (
  `paket_travelagent_id` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  `harga` varchar(255) DEFAULT NULL,
  `travelagent_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`paket_travelagent_id`),
  UNIQUE KEY `paket_travelagent_id` (`paket_travelagent_id`),
  KEY `travelagent_id` (`travelagent_id`),
  CONSTRAINT `paket_travelagent_ibfk_1` FOREIGN KEY (`travelagent_id`) REFERENCES `travelagents` (`travelagent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paket_travelagent`
--

LOCK TABLES `paket_travelagent` WRITE;
/*!40000 ALTER TABLE `paket_travelagent` DISABLE KEYS */;
INSERT INTO `paket_travelagent` VALUES ('naw78xj73n292j','Bromo Trip','Trip Menginap, Lalu lanjut menaiki bromo, ke wisata di sekelilingnya','Lumajang, Jawa Timur','450.000','as7d5asd7as7as8a'),('pbme730f9m9x8vj','Bali Trip','Trip Menginap, Lalu lanjut wisata pantai, ke wisata di sekelilingnya','Denpasar, Bali','520.000','as7d5asd7as7as8a'),('sdhas72j472mf0','Yogyakarta Trip','Trip Menginap, Lalu lanjut wisata malioboro, ke wisata di sekelilingnya','Yogyakarta, Daerah Istimewa Yogyakarta','430.000','as7d5asd7as7as8a');
/*!40000 ALTER TABLE `paket_travelagent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pemesanan`
--

DROP TABLE IF EXISTS `pemesanan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pemesanan` (
  `pemesanan_id` varchar(255) NOT NULL,
  `nama_lengkap` varchar(255) DEFAULT NULL,
  `nomor_handphone` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nama_travelagent` varchar(255) DEFAULT NULL,
  `nama_paket` varchar(255) DEFAULT NULL,
  `keterangan_paket` varchar(255) DEFAULT NULL,
  `lokasi_paket` varchar(255) DEFAULT NULL,
  `harga_paket` varchar(255) DEFAULT NULL,
  `paket_travelagent_id` varchar(255) DEFAULT NULL,
  `travelagent_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pemesanan_id`),
  UNIQUE KEY `pemesanan_id` (`pemesanan_id`),
  KEY `travelagent_id` (`travelagent_id`),
  KEY `paket_travelagent_id` (`paket_travelagent_id`),
  CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`travelagent_id`) REFERENCES `travelagents` (`travelagent_id`),
  CONSTRAINT `pemesanan_ibfk_2` FOREIGN KEY (`paket_travelagent_id`) REFERENCES `paket_travelagent` (`paket_travelagent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pemesanan`
--

LOCK TABLES `pemesanan` WRITE;
/*!40000 ALTER TABLE `pemesanan` DISABLE KEYS */;
INSERT INTO `pemesanan` VALUES ('090e2abb5577466aa1c5c456da6164e1','aziz','01239191293','aksdakdjakdj','asdasdadsd','Jaya Travel','Bromo Trip','Trip Menginap, Lalu lanjut menaiki bromo, ke wisata di sekelilingnya','Lumajang, Jawa Timur','450.000','naw78xj73n292j','as7d5asd7as7as8a'),('3b9add48127f449da190fdb7a6470a9d','adasdad','1923891832','aksdakdjaskj','askjakdsj@gmail,com','Jaya Travel','Bromo Trip','Trip Menginap, Lalu lanjut menaiki bromo, ke wisata di sekelilingnya','Lumajang, Jawa Timur','450.000','naw78xj73n292j','as7d5asd7as7as8a'),('6c3c0ea91d6b4fd8bdd1be3080a4da89','Angga Jiyan fajar','08988211668','Ketapang 1A Rt.45 Rw.03 Suko, Sukodono, Sidoarjo','anggajiyanfajar@gmail.com','Jaya Travel','Bali Trip','Jelajah Keliling Bali','Bali, Indonesia','555.000','pbme730f9m9x8vj','as7d5asd7as7as8a'),('7721d67cc1c3484581fe74f88f8e75c1','Angga Jiyan Fajar','08988211668','Ketapang 1A Rt.45 Rw.03 Suko, Sukodono, Sidoarjo','anggajiyanfajar@gmial.com','Jaya Travel','Bali Trip','Jelajah Keliling Bali','Bali, Indonesia','555.000','pbme730f9m9x8vj','as7d5asd7as7as8a'),('7c7e9130348f41929b496acf3c52a67c','nabila','1923891328123','asdhaskdh','kajskjasdjkadjka','Jaya Travel','Bromo Trip','Trip Menginap, Lalu lanjut menaiki bromo, ke wisata di sekelilingnya','Lumajang, Jawa Timur','450.000','naw78xj73n292j','as7d5asd7as7as8a'),('8463deffe0164bb2be2ab10189b91c50','adasdad','1923891832','aksdakdjaskj','askjakdsj@gmail,com','Jaya Travel','Bromo Trip','Trip Menginap, Lalu lanjut menaiki bromo, ke wisata di sekelilingnya','Lumajang, Jawa Timur','450.000','naw78xj73n292j','as7d5asd7as7as8a'),('8e706e1ea28840f8a30e740647bfdd10','Angga Jiyan fajar','08988211668','Ketapang 1A Rt.45 Rw.03 Suko, Sukodono, Sidoarjo','anggajiyanfajar@gmail.com','Jaya Travel','Bali Trip','Jelajah Keliling Bali','Bali, Indonesia','555.000','pbme730f9m9x8vj','as7d5asd7as7as8a'),('a54e5292546943a9b5e42720900d5616','asdad','sdfsdf','aDADS','Aadsadadad','Jaya Travel','Bromo Trip','Trip Menginap, Lalu lanjut menaiki bromo, ke wisata di sekelilingnya','Lumajang, Jawa Timur','450.000','naw78xj73n292j','as7d5asd7as7as8a'),('d72d4ed9b6ce4901a56a14fc243e72c9','Doni Dono','08927329192','Yogyakarta, Jawa Tengah','dono@gmail.com','Jaya Travel','Bromo Trip','Trip Menginap, Lalu lanjut menaiki bromo, ke wisata di sekelilingnya','Lumajang, Jawa Timur','450.000','naw78xj73n292j','as7d5asd7as7as8a'),('dd9c8fb00f20455588a6fbc66fce67b0','jojo','01283018321','askdakdsjk','aksdjakdjajkds','Jaya Travel','Bromo Trip','Trip Menginap, Lalu lanjut menaiki bromo, ke wisata di sekelilingnya','Lumajang, Jawa Timur','450.000','naw78xj73n292j','as7d5asd7as7as8a'),('f0cad732ac1e4267a6b0bdf5aafee881','jojo','01283018321','askdakdsjk','aksdjakdjajkds','Jaya Travel','Bromo Trip','Trip Menginap, Lalu lanjut menaiki bromo, ke wisata di sekelilingnya','Lumajang, Jawa Timur','450.000','naw78xj73n292j','as7d5asd7as7as8a'),('f416dfb5091442ecba0e08e1c2d48057','Mbak Meli','081923913881','Surabaya, Indonesia','mellinda13b@gmail.com','Jaya Travel','Yogyakarta Trip','Trip Menginap, Lalu lanjut wisata malioboro, ke wisata di sekelilingnya','Yogyakarta, Daerah Istimewa Yogyakarta','430.000','sdhas72j472mf0','as7d5asd7as7as8a'),('f5ff664ffc1d475ab6a7ec5e6cbdf24f','Angga Jiyan fajar','08988211668','Ketapang 1A Rt.45 Rw.03 Suko, Sukodono, Sidoarjo','anggajiyanfajar@gmail.com','Jaya Travel','Bali Trip','Jelajah Keliling Bali','Bali, Indonesia','555.000','pbme730f9m9x8vj','as7d5asd7as7as8a');
/*!40000 ALTER TABLE `pemesanan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelagents`
--

DROP TABLE IF EXISTS `travelagents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travelagents` (
  `travelagent_id` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `lokasi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`travelagent_id`),
  UNIQUE KEY `travelagent_id` (`travelagent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelagents`
--

LOCK TABLES `travelagents` WRITE;
/*!40000 ALTER TABLE `travelagents` DISABLE KEYS */;
INSERT INTO `travelagents` VALUES ('as7d5asd7as7as8a','Jaya Travel','Surabaya, Indonesia'),('asjfasf7asfaj2','Rudi Travel','Yogyakarta, Indonesia'),('nbmeo7vm4739fs','Lancar Travel','Sidoarjo, Indonesia');
/*!40000 ALTER TABLE `travelagents` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-15 20:49:00
