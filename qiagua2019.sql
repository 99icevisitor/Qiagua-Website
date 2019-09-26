-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: qiagua
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alb`
--

DROP TABLE IF EXISTS `alb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alb` (
  `ALB_ID` int(8) NOT NULL AUTO_INCREMENT,
  `USER_AUTHOR` int(8) NOT NULL,
  `ALB_TIME` date DEFAULT NULL,
  `ALB_NAME` varchar(200) NOT NULL,
  `ALB_DES` varchar(300) NOT NULL,
  `alb_sum` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ALB_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10022 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alb`
--

LOCK TABLES `alb` WRITE;
/*!40000 ALTER TABLE `alb` DISABLE KEYS */;
INSERT INTO `alb` VALUES (10001,0,'2019-08-30','系统图库','存放系统图片及用例图片',0),(10002,11,'2019-09-01','校园生活','记录我的大学生活',7),(10003,12,'2019-09-04','日常打脸','记录我的沙雕日常2333',3),(10004,11,'2019-09-05','PPT样图','就一些可能用到的小图片，可爱风居多',5),(10005,1,'2019-09-01','默认专辑','默认专辑',10),(10006,2,'2019-09-01','默认专辑','默认专辑',0),(10007,11,'2019-09-01','默认专辑','默认专辑',0),(10008,12,'2019-09-01','默认专辑','默认专辑',0),(10009,13,'2019-09-01','默认专辑','默认专辑',0),(10010,14,'2019-09-01','默认专辑','默认专辑',0),(10011,15,'2019-09-01','默认专辑','默认专辑',0),(10012,16,'2019-09-03','默认专辑','默认专辑',0),(10013,17,'2019-09-03','默认专辑','默认专辑',0),(10014,18,'2019-09-09','默认专辑','默认专辑',0),(10015,19,'2019-09-11','默认专辑','默认专辑',0),(10016,19,'2019-09-11','默认专辑','默认专辑',0),(10017,1,'2019-09-11','恰瓜专辑','这是我的第二个恰瓜专辑',1),(10018,1,'2019-09-12','恰瓜2专辑','这是我的第2个恰瓜专辑',1),(10019,19,'2019-09-15','小瓜','小瓜小瓜，不掉头发！',2),(10020,20,'2019-09-16','默认专辑','默认专辑',0),(10021,20,'2019-09-16','默认专辑','默认专辑',0);
/*!40000 ALTER TABLE `alb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alb_label`
--

DROP TABLE IF EXISTS `alb_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alb_label` (
  `ALB_ID` int(10) NOT NULL,
  `LABEL_1` int(1) DEFAULT '0',
  `LABEL_2` int(1) DEFAULT '0',
  `LABEL_3` int(1) DEFAULT '0',
  `LABEL_4` int(1) DEFAULT '0',
  `LABEL_5` int(1) DEFAULT '0',
  `LABEL_6` int(1) DEFAULT '0',
  `LABEL_7` int(1) DEFAULT '0',
  `LABEL_8` int(1) DEFAULT '0',
  PRIMARY KEY (`ALB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alb_label`
--

LOCK TABLES `alb_label` WRITE;
/*!40000 ALTER TABLE `alb_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `alb_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `art`
--

DROP TABLE IF EXISTS `art`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `art` (
  `ART_ID` int(8) NOT NULL AUTO_INCREMENT,
  `ART_AUTHOR` int(8) NOT NULL,
  `ART_TITLE` varchar(100) NOT NULL,
  `ART_TIME` date NOT NULL,
  `art_pic_url` varchar(100) DEFAULT NULL,
  `art_content` text NOT NULL,
  `ART_STATE` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ART_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art`
--

LOCK TABLES `art` WRITE;
/*!40000 ALTER TABLE `art` DISABLE KEYS */;
INSERT INTO `art` VALUES (1,0,'测试文章1','2019-09-10','upload/1568036646365.schulz_flower.jpg','<p><br></p><p>dddddddddddddddd<img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOYAAADmCAMAAAD2tAmJAAABS2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4KPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMxNDIgNzkuMTYwOTI0LCAyMDE3LzA3LzEzLTAxOjA2OjM5ICAgICAgICAiPgogPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4KICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIi8+CiA8L3JkZjpSREY+CjwveDp4bXBtZXRhPgo8P3hwYWNrZXQgZW5kPSJyIj8+nhxg7wAAAARnQU1BAACxjwv8YQUAAAABc1JHQgCuzhzpAAADAFBMVEUAAAB9dzarsbI2QEMiKi6PhTAnMDQlLjAmLjI3QUQfJywhKiyrsbaflUOAfVmLhVGVl4MsNDZBRDfLvVOam3xubEN4dD7Xx1W8tXCTjEqYj0jKwGiRhjTHu13BuGeDfTpgYUazr31fXDaur7C4snh7dDGEfkivrYbSw1FkZUi3tJKqr68mKiu0sYXCtVBNUEumoWWwpEiUk3abll+nnUm6rU2hn3vJwHSGhGG0rGiPjGVxcEyxtbaPilWhoZCamnmYklJ5fHEHCQsGCAoAAAAJCAsJCgsBAgT87o7875QICAkGBggCBAb64kL87YgKCw387Yv98q387IL88Jv64j/87YX875b87pH640X64Tv99Ln88J354Tf98qf////99b764Tn88Jn88J8CBgj987AkLzD99LT88ab88aH88aQGCgr76nj640r64Tz54DX99bv89Lz64j765VT65lj999ImMTL76nO7v7/78ar763/76GX65E365FH++Nb76Gn77pUiLC/99sT98qr76W3787f67pz77IYgJCX7518wNDT99Lf65lz752L763wNDxH77ZI5SVH875g5Skz787r79sH++M776XAsNTr998n99sFKS03887P77pj46X7230L33z4uNjxvb0z5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\" style=\"max-width: 100%;\"></p>',0),(3,1,'测试文章1','2019-09-12',NULL,'<p>请输入正文(图片不超过2张)......</p><p>少时诵诗书所所所所所所所所所所所</p><p><br></p>',0),(4,1,'我的文章','2019-09-12',NULL,'<p>请输入正文(图片不超过2张)......</p><p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p><p><br></p>',0),(6,1,'测试文章7','2019-09-11',NULL,'<p>请输入正文(图片不超过2张)......</p><p>阿萨德</p>',0),(7,1,'测试文章8','2019-09-11',NULL,'<p>请输入正文(图片不超过2张)......</p><p>是是是</p>',0),(8,1,'测试文章9','2019-09-11',NULL,'<p>请输入正文(图片不超过2张)......</p><p>aaaa</p>',0),(9,1,'测试文章10','2019-09-11',NULL,'<p><span style=\"font-weight: bold;\">人生到处知何似，应似飞鸿踏雪泥。</span></p><p><span style=\"font-weight: bold;\"></span>这是<span style=\"text-decoration-line: line-through;\">测试文章10</span><br></p><p>好了，一切有我呢<span style=\"text-decoration-line: line-through;\"><br></span></p><p><br></p>',0),(10,1,'测试文章11','2019-09-15',NULL,'<p>请输入正文(图片不超过2张)......</p><p><br></p>',0),(11,1,'测试文章15','2019-09-11',NULL,'<p>搜索</p><p><br></p>',0),(12,1,'测试文章16','2019-09-11',NULL,'<p>请输入正沙雕</p><p><br></p>',0),(13,1,'测试文章17','2019-09-11',NULL,'<p>菜单时深V地方</p><p><br></p>',0),(25,12,'我的文章','2019-09-11',NULL,'<p>这是我的第一篇文章<img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/3c/pcmoren_wu_org.png\" alt=\"[污]\" data-w-e=\"1\"></p><p><br></p>',0),(26,1,'测试文章20','2019-09-12',NULL,'<p><span style=\"font-weight: bold;\">“赢，我陪你君临天下;你输，我陪你东山再起。“</span>看到这句话时，一瞬间想到了我的那些好友。想着这十多年彼此的默默陪伴、默默付出。觉得以往的回忆呀，就因为这句话，踏着时光的步伐，缓缓而来。</p><p>以前的我，真的算是那种丢在人海里，就瞬间找不到的人，平凡无奇的不会有人多关注一眼。自己呢，并没有因为这些就想去做什么来改变。偶尔，甚至觉得这样挺好，省去了那些多余的客套、虚假，与不舒适。我呀，就是这样一个人，除了亲人，有没有谁都无所谓，也不在乎他人对我的看法。偶然的孤独，也会用<a href=\"https://www.duanwenxue.com/\">日记</a>将它赶跑。</p><p>我在这样的日子里，自得其乐。不期盼着什么改变，可我那几个朋友呀，就这样突然，又冒失的闯进了我的<a href=\"https://www.duanwenxue.com/jingdian/shenghuo/\">生活</a>。说冒失，是因为当时的她们对我来说真的是完全没必要的存在，我真的不需要她们陪着我，也不想对她们说多余的话。可她们呀，对我说着什么，我身上有种特殊的气质，和别人不一样。我听着，只觉好笑，不过却也懒得多说，反正只要不理她们就好了。</p><p>我以为她们的知难而退，却在我这变成了迎难而上。每天。看着她们跑到我身边，叽叽喳喳，说着校园内大家都所熟知我却不在乎的八卦，校外新开的小吃店，一脸兴奋。我在旁边听着，觉着烦了，就自己快步走开，不管她们反应如何。也常常无视她们约我出去的信息，拒绝给她们一点多了解我的机会。</p><p>想想当时的自己，如果有人说我无情商，没感情的话。估计没有一个人不赞同吧，包括她们。可就是这样的她们啊，在那段时光里，从未放弃，一直试图走进我的生活，温暖我的世界。</p><p>十多年过去，跌跌撞撞，坎坎坷坷，她们却一直陪着我。欢呼我的成功，悲伤我的<a href=\"https://www.duanwenxue.com/diary/nanguo/\">难过</a>，安慰我的失败。</p><p>如果有人问我，对我最重要的是什么。以前的我只会说亲人吧，而现在，还有她们。不过，应该没有人会问我吧。不过这也无所谓啦，有她们在，胜过太多。</p><p>在她们陪着我的漫长时光里，除了行动，我从未有任何多余的表示<a href=\"https://www.duanwenxue.com/qinggan/\">情感</a>的话语，可在看到这句话时，好想对她们也说一句“你赢，我陪你君临天下;你输，我陪你东山再起。”</p><p><br></p>',0),(28,1,'二月兰花~~','2019-09-15',NULL,'<p><span style=\"font-weight: bold;\">在乍暖还寒的时候，众香国里的百花大都刚发芽，可二月兰却在春寒料峭中露出了笑脸。在我心目中二月兰是我的报春花。</span></p><p>二月兰生命力顽强，不论是在在墙角、石缝，甚至不毛之地都能生长。他们从一朵朵生长到一簇簇从一簇簇长到一片片。他们有的小巧玲珑、有的含苞欲放、还有的只有一片嫩绿的小芽。</p><p>过一段时间二月兰便会漫山遍野的竞相开放，它们的花香和土香结合在了一起，成为了大自然的气息。二月兰到每一个各个地方去报春“俏也不争春，只把春来报”这句话对于我来讲给二月兰是再好不过的了。二月兰还有一个称号，那便是“平民花后”因为二月兰是兰花中最平凡的一种，算是兰花中的“平民”了但是他的自强不息、坚强、自力更生让人称赞不绝。“我相信我就是我，我相信明天，我相信我伸手就能碰到天”因为他十分顽强就连刮风下雨也亭亭玉立，所以我觉得用这句歌词来形容二月兰的自立自强是很完美的。闻到二月兰的清香后人们便心旷神怡，心中所有的烦恼都跑到九霄云外去了。</p><p>二月兰虽不是非常高贵、好看的花，但它们团结在一起，不论风吹雨打它们都依然坚持挺立着。如果人人都能团结友爱、自强自立的话，那这个世界便会强大起来。</p><p><br></p>',0);
/*!40000 ALTER TABLE `art` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `art_label`
--

DROP TABLE IF EXISTS `art_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `art_label` (
  `ART_ID` int(10) NOT NULL,
  `LABEL_1` int(1) DEFAULT '0',
  `LABEL_2` int(1) DEFAULT '0',
  `LABEL_3` int(1) DEFAULT '0',
  `LABEL_4` int(1) DEFAULT '0',
  `LABEL_5` int(1) DEFAULT '0',
  `LABEL_6` int(1) DEFAULT '0',
  `LABEL_7` int(1) DEFAULT '0',
  `LABEL_8` int(1) DEFAULT '0',
  PRIMARY KEY (`ART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `art_label`
--

LOCK TABLES `art_label` WRITE;
/*!40000 ALTER TABLE `art_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `art_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection`
--

DROP TABLE IF EXISTS `collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `collection` (
  `fans_id` int(8) NOT NULL,
  `svhc_id` int(8) NOT NULL,
  `svhc_time` date NOT NULL,
  PRIMARY KEY (`fans_id`,`svhc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection`
--

LOCK TABLES `collection` WRITE;
/*!40000 ALTER TABLE `collection` DISABLE KEYS */;
INSERT INTO `collection` VALUES (1,25,'2019-09-12'),(11,10003,'2019-09-10');
/*!40000 ALTER TABLE `collection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `SOURCE_ID` int(8) NOT NULL,
  `COMMENT_ID` int(8) NOT NULL DEFAULT '0',
  `USER_ID` int(8) NOT NULL,
  `comment` varchar(100) NOT NULL DEFAULT '该评论已被删除',
  `COM_TIME` datetime NOT NULL,
  PRIMARY KEY (`COMMENT_ID`,`SOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (100026,1,1,'OK','2019-09-15 12:19:22'),(100031,1,1,'','2019-09-15 10:51:38'),(100032,1,1,'sssssss','2019-09-15 11:02:16'),(100038,1,1,'大家好，请多多支持！','2019-09-15 12:34:23'),(100039,1,11,'大大的喜欢！','2019-09-12 12:34:56'),(100031,2,1,'','2019-09-15 10:51:38'),(100032,2,1,'sssssss1111','2019-09-15 11:04:03'),(100038,2,11,'是太太！awsl安详去世！','2019-09-15 12:36:23'),(100031,3,1,'okkkkkkkkk!','2019-09-15 10:57:27'),(100038,3,1,'hhh,大家喜欢就好','2019-09-15 07:37:36'),(100031,4,1,'ssssssssss','2019-09-15 10:58:43'),(100038,4,1,'南理工牛逼！','2019-09-15 11:48:00'),(100031,5,1,'MG','2019-09-15 11:00:41'),(100038,5,19,'二月兰学名诸葛菜~','2019-09-15 11:50:03'),(100031,6,1,'OMG','2019-09-15 11:01:32'),(100038,6,19,'南理工真滴牛逼！','2019-09-15 11:55:18'),(100031,7,1,'没毛病','2019-09-15 11:07:16'),(100031,8,1,'噢噢噢噢','2019-09-15 11:09:12'),(100031,9,1,'上面这些都是测试','2019-09-15 12:25:39'),(100031,10,1,'额鹅鹅鹅','2019-09-15 12:30:54'),(100031,11,1,'maybe','2019-09-15 12:35:04'),(100031,12,1,'okkkk','2019-09-15 05:49:11'),(100031,13,1,'','2019-09-15 05:52:34'),(100031,14,1,'mmm ','2019-09-15 05:55:50'),(100031,15,1,'三生三世','2019-09-15 06:09:23');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `login` (
  `USER_NAME` varchar(30) NOT NULL,
  `user_id` int(8) NOT NULL AUTO_INCREMENT,
  `PWD` varchar(32) NOT NULL,
  `LAST_TIME` date DEFAULT NULL,
  `STATE` varchar(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES ('111111',1,'admin','2019-01-01','已实名'),('盖伦127',11,'127','2019-09-05','已实名'),('阡陌',12,'qianmo','2019-09-05','已实名'),('a',13,'1','2019-09-07','已实名'),('盖伦211',14,'211','2019-09-07','已实名'),('盖伦123',15,'123456','2019-09-08','未实名'),('我不是',16,'123456','2019-09-09','未实名'),('药神',17,'wbsysh','2019-09-09','未实名'),('UK',18,'uk123abc','2019-09-09','未实名'),('恰瓜',19,'qiagua','2019-09-11','未实名'),('二月兰小花',20,'eylxh1','2019-09-16','未实名');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `message` (
  `MESSAGE_ID` int(10) NOT NULL AUTO_INCREMENT,
  `SEND_ID` int(8) NOT NULL,
  `RESV_ID` int(8) NOT NULL,
  `SEND_TIME` datetime NOT NULL,
  `CONTENT` varchar(1000) NOT NULL,
  `AREAD` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`MESSAGE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,1,11,'2019-09-09 00:00:00','欢迎加入恰瓜！',0),(2,1,12,'2019-09-09 00:00:00','欢迎加入恰瓜！',0),(3,1,13,'2019-09-09 12:30:23','欢迎加入恰瓜！',0),(4,1,12,'2019-09-15 12:33:45','你好，听说你是管理员？',0);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pic`
--

DROP TABLE IF EXISTS `pic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pic` (
  `PIC_ID` int(8) NOT NULL AUTO_INCREMENT,
  `user_id` int(8) NOT NULL,
  `PIC_ADDR` varchar(1000) NOT NULL,
  `PIC_TIME` date NOT NULL,
  `PIC_ALBID` int(8) NOT NULL,
  `from_id` int(8) NOT NULL DEFAULT '0',
  `PIC_DES` varchar(100) NOT NULL,
  PRIMARY KEY (`PIC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=100043 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pic`
--

LOCK TABLES `pic` WRITE;
/*!40000 ALTER TABLE `pic` DISABLE KEYS */;
INSERT INTO `pic` VALUES (100001,0,'images/main/name.png','2019-08-30',10001,0,''),(100002,0,'images/main/head.jpg','2019-08-30',10001,0,''),(100003,0,'images/main/hot-fire.png','2019-08-30',10001,0,''),(100004,0,'images/follow/埋酱.jpeg','2019-09-07',10001,0,''),(100005,0,'images/user/专辑表情包/动态1.jpg','2019-09-07',10001,0,''),(100006,0,'images/user/专辑表情包/动态2.jpg','2019-09-07',10001,0,''),(100007,11,'upload/user/11/alb_10002/20190901010001.png','2019-09-01',10002,0,''),(100008,11,'upload/user/11/alb_10002/20190901020002.png','2019-09-01',10002,0,''),(100009,11,'upload/user/11/alb_10002/20190908123226.png','2019-09-08',10002,0,''),(100010,11,'upload/user/11/alb_10002/20190908123301.png','2019-09-08',10002,0,''),(100011,11,'upload/user/11/alb_10002/20190908123340.png','2019-09-08',10002,0,''),(100012,11,'upload/user/11/alb_10002/20190908123346.png','2019-09-08',10002,0,''),(100013,11,'upload/user/11/alb_10002/20190908123403.png','2019-09-08',10002,0,''),(100014,12,'upload/user/12/alb_10002/20190908123356.png','2019-09-08',10003,0,''),(100015,12,'upload/user/12/alb_10003/20190908123434.png','2019-09-08',10003,0,''),(100016,11,'upload/user/11/alb_10003/20190908123302.png','2019-09-08',10004,0,''),(100017,11,'upload/user/11/alb_10004/20190908123401.png','2019-09-08',10004,0,''),(100018,11,'upload/user/11/alb_10004/20190908123423.png','2019-09-08',10004,0,''),(100019,11,'upload/user/11/alb_10004/20190908123445.png','2019-09-08',10004,0,''),(100020,11,'upload/user/11/alb_10004/20190908123458.png','2019-09-08',10004,0,''),(100023,1,'upload/user/1/alb_10005/20190910051649.png','2019-09-10',10005,0,''),(100026,1,'upload/user/1/alb_10005/20190911122931.png','2019-09-11',10005,0,''),(100027,1,'upload/user/1/alb_10005/20190911025336.png','2019-09-11',10005,0,''),(100030,12,'upload/user/12/alb_10003/20190911081410.png','2019-09-11',10003,0,''),(100031,1,'upload/user/1/alb_10005/20190911081735.jpg','2019-09-11',10005,0,''),(100032,1,'upload/user/1/alb_10005/20190911081759.png','2019-09-11',10005,0,''),(100033,1,'upload/user/1/alb_10005/20190911092031.png','2019-09-11',10005,0,''),(100034,1,'upload/user/1/alb_10005/20190912122121.jpg','2019-09-12',10005,0,''),(100035,1,'upload/user/1/alb_10005/20190910051649.jpg','2019-09-10',10005,11,''),(100036,1,'upload/user/1/alb_10005/20190910051117.jpg','2019-09-10',10005,0,''),(100038,1,'upload/user/1/alb_10017/20190912054934.jpg','2019-09-12',10017,0,'二月兰花'),(100039,1,'upload/user/1/alb_10018/20190912063808.jpg','2019-09-12',10018,0,'一些小图标'),(100040,1,'upload/user/1/alb_10005/20190912090136.jpg','2019-09-12',10005,0,'二月兰花'),(100041,19,'upload/user/19/alb_10019/20190915115307.png','2019-09-15',10019,0,'小瓜图片'),(100042,19,'upload/user/19/alb_10019/20190915115621.jpg','2019-09-15',10019,0,'二月兰花');
/*!40000 ALTER TABLE `pic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pic_label`
--

DROP TABLE IF EXISTS `pic_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pic_label` (
  `PIC_ID` int(10) NOT NULL,
  `LABEL_1` int(1) DEFAULT '0',
  `LABEL_2` int(1) DEFAULT '0',
  `LABEL_3` int(1) DEFAULT '0',
  `LABEL_4` int(1) DEFAULT '0',
  `LABEL_5` int(1) DEFAULT '0',
  `LABEL_6` int(1) DEFAULT '0',
  `LABEL_7` int(1) DEFAULT '0',
  `LABEL_8` int(1) DEFAULT '0',
  PRIMARY KEY (`PIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pic_label`
--

LOCK TABLES `pic_label` WRITE;
/*!40000 ALTER TABLE `pic_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `pic_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `praise`
--

DROP TABLE IF EXISTS `praise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `praise` (
  `SOURCE_ID` int(8) NOT NULL,
  `USER_ID` int(8) NOT NULL,
  `ISPRAISED` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SOURCE_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `praise`
--

LOCK TABLES `praise` WRITE;
/*!40000 ALTER TABLE `praise` DISABLE KEYS */;
INSERT INTO `praise` VALUES (25,12,1),(10005,1,1),(100007,1,1),(100026,1,1),(100034,1,0),(100038,1,1),(100038,19,0);
/*!40000 ALTER TABLE `praise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `reply` (
  `SOURCE_ID` int(8) NOT NULL,
  `COMMENT_ID` int(8) NOT NULL,
  `REPLY_ID` int(8) NOT NULL,
  `to_id` int(8) NOT NULL,
  PRIMARY KEY (`SOURCE_ID`,`COMMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (100038,2,11,1);
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schv`
--

DROP TABLE IF EXISTS `schv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `schv` (
  `FAN_ID` int(8) NOT NULL,
  `IDOL_ID` int(8) NOT NULL,
  `FAN_TIME` date NOT NULL,
  PRIMARY KEY (`FAN_ID`,`IDOL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schv`
--

LOCK TABLES `schv` WRITE;
/*!40000 ALTER TABLE `schv` DISABLE KEYS */;
INSERT INTO `schv` VALUES (1,11,'2019-09-09'),(1,12,'2019-09-13'),(1,20,'2019-09-16'),(12,1,'2019-09-09');
/*!40000 ALTER TABLE `schv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `user_id` int(8) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(30) NOT NULL,
  `PWD` varchar(32) NOT NULL,
  `EMAIL` varchar(100) NOT NULL,
  `MOBILE` varchar(11) NOT NULL,
  `SMRZ` varchar(2) DEFAULT '0',
  `SID` varchar(80) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `SENDER` varchar(2) DEFAULT NULL,
  `RTIME` date DEFAULT NULL,
  `USER_IMG` varchar(100) NOT NULL DEFAULT 'images/main/head.jpg',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'111111','admin','1106910397@qq.com','18362993928','1','123456789112345678','张三','f',NULL,'upload/20180531153913.jpeg'),(2,'OKAYas','12','122@123.com','13734932483','0','342456198102236785','李四','m',NULL,'images/main/head.jpg'),(11,'盖伦127','127','127@123.com','13734932427','1','342456198102236785','盖伦','m',NULL,'images/main/head.jpg'),(12,'阡陌','qianmo','QIANMO@163.com','13212345678','1','123437199911034504','阡陌','f',NULL,'images/main/head.jpg'),(13,'a','1','17@qq.com','13874429386','1','232537199010263306','康纳','f',NULL,'images/main/head.jpg'),(14,'盖伦211','211','211@gailun.com','13734932211','1','273437199011034504','老司机','f',NULL,'images/main/head.jpg'),(15,'盖伦123','123456','123@123.com','13734932123','0',NULL,NULL,NULL,NULL,'images/main/head.jpg'),(16,'我不是','123456','189@qq.com','13734932189','0',NULL,NULL,NULL,NULL,'images/main/head.jpg'),(17,'药神','wbsysh','188@222.com','13734932188','0',NULL,NULL,NULL,NULL,'images/main/head.jpg'),(18,'UK','uk123abc','uk@deu.com','13734932499','0',NULL,NULL,NULL,NULL,'images/main/head.jpg'),(19,'恰瓜','qiagua','qiagua@163.com','13456789245','0',NULL,'李白','m',NULL,'images/main/head.jpg'),(20,'二月兰小花','eylxh1','123@njust.edu.cn','13734922123','0',NULL,NULL,'f',NULL,'images/main/head.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_inf`
--

DROP TABLE IF EXISTS `user_inf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_inf` (
  `USER_ID` int(8) NOT NULL,
  `CITY` varchar(100) DEFAULT NULL,
  `PROFILE` varchar(100) DEFAULT NULL,
  `BG_IMG` varchar(100) NOT NULL DEFAULT 'images/user/1.PNG',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_inf`
--

LOCK TABLES `user_inf` WRITE;
/*!40000 ALTER TABLE `user_inf` DISABLE KEYS */;
INSERT INTO `user_inf` VALUES (1,'11','本来是admin，后来一度在admin1与admin之间反复横跳2333','upload/20170827091456.png'),(2,'南京','','images/user/1.PNG'),(12,'南京','一度反复横跳~~~~~','images/user/1.PNG'),(14,NULL,NULL,'images/user/1.PNG'),(15,'南京','一度反复横跳','upload/20190823194849.jpeg'),(19,'南京市','大褂小瓜','images/user/1.PNG'),(20,'南京市','南理工小号','images/user/1.PNG');
/*!40000 ALTER TABLE `user_inf` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-16  2:57:03
