/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.1.62-community : Database - bbs1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bbs1` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bbs1`;

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  `cont` text,
  `pdate` datetime DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `uid` (`uid`),
  KEY `eid` (`eid`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`eid`) REFERENCES `essay` (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`cid`,`uid`,`eid`,`cont`,`pdate`) values (1,8,2,'有道理有道理','2018-12-19 00:00:00'),(2,8,2,'有道理有道理','2018-12-19 00:00:00'),(3,8,6,'我jio的有丶道理','2018-12-19 00:00:00'),(4,8,7,'胡说八道','2018-12-19 00:00:00'),(5,7,7,'楼上有理','2018-12-19 00:00:00'),(6,7,7,'我收回','2018-12-19 00:00:00'),(7,7,3,'抢沙发','2018-12-19 00:00:00'),(8,1,5,'牛逼牛逼','2018-12-19 00:00:00'),(9,7,11,'hello','2018-12-21 00:00:00'),(10,1,3,'有上有道理','2019-03-08 00:00:00');

/*Table structure for table `essay` */

DROP TABLE IF EXISTS `essay`;

CREATE TABLE `essay` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `cont` text,
  `pdate` datetime DEFAULT NULL,
  `readnum` int(11) DEFAULT '0',
  PRIMARY KEY (`eid`),
  KEY `uid` (`uid`),
  CONSTRAINT `essay_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `essay` */

insert  into `essay`(`eid`,`uid`,`title`,`cont`,`pdate`,`readnum`) values (1,1,'获取Url绝对路径','function getUrlRelativePath()\r\n　　	{\r\n	　　　　var url = document.location.toString();\r\n		\r\n	　　　　var arrUrl = url.split(\"//\");\r\n\r\n	　　　　var start = arrUrl[1].indexOf(\"/\");\r\n	　　　　var relUrl = arrUrl[1].substring(start);//stop省略，截取从start开始到结尾的所有字符\r\n\r\n	　　　　if(relUrl.indexOf(\"?\") != -1){\r\n	　　　　　　relUrl = relUrl.split(\"?\")[0];\r\n	　　　　}\r\n	　　　　return relUrl;\r\n　　	}\r\n','2018-12-19 18:43:45',8),(2,7,'stringify函数','将现有的对象转换为JSON字符串, 则可以使用 JSON.stringify(obj)函数','2018-12-18 18:44:26',8),(3,1,'用R语言实现对不平衡数据的四种处理方法','在对不平衡的分类数据集进行建模时，机器学**算法可能并不稳定，其预测结果甚至可能是有偏的，而预测精度此时也变得带有误导性那么，这种结果是为何发生的呢？到底是什么因素影响了这些算法的表现？\r\n\r\n \r\n\r\n在不平衡的数据中，任一算法都没法从样本量少的类中获取足够的信息来进行精确预测因此，机器学**算法常常被要求应用在平衡数据集上那我们该如何处理不平衡数据集？本文会介绍一些相关方法，它们并不复杂只是技巧性比较强\r\n\r\n \r\n\r\n本文会介绍处理非平衡分类数据集的一些要点，并主要集中于非平衡二分类问题的处理一如既往，我会尽量精简地叙述，在文末我会演示如何用R中的ROSE包来解决实际问题\r\n','2019-02-01 18:45:31',8),(4,8,'什么是不平衡分类','不平衡分类是一种有监督学**，但它处理的对象中有一个类所占的比例远远大于其余类比起多分类，这一问题在二分类中更为常见（注：下文中占比较大的类称为大类，占比较小的类称为小类）\r\n\r\n不平衡一词指代数据中响应变量（被解释变量）的分布不均衡，如果一个数据集的响应变量在不同类上的分布差别较大我们就认为它不平衡\r\n\r\n举个例子，假设我们有一个观测数为100****00的数据集，它包含了哈佛大学申请人的信息众所周知，哈佛大学以极低的录取比例而闻名，那么这个数据集的响应变量（即：该申请人是否被录取，是为1，否为0）就很不平衡，大致98%的观测响应变量为0，只有2%的幸运儿被录取\r\n--------------------- \r\n作者：蔡军帅 \r\n来源：CSDN \r\n原文：https://blog.csdn.net/qq_40875849/article/details/85013973 \r\n版权声明：本文为博主原创文章，转载请附上博文链接！','2018-12-19 21:52:53',5),(5,8,'为什么大部分机器学**算法在不平衡数据集上表现不佳？','我觉得这是一个很有意思的问题，你不妨自己先动手试试，然后你就会了解把不平衡数据再结构化的重要性，至于如何再结构化，我会在操作部分中讲解\r\n\r\n下面是机器学**算法在不平衡数据上精度下降的原因：\r\n\r\n响应变量的分布不均匀使得算法精度下降，对于小类的预测精度会很低\r\n\r\n算法本身是精度驱动的，即该模型的目标是最小化总体误差，而小类对于总体误差的贡献很低\r\n\r\n算法本身假设数据集的类分布均衡，同时它们也可能假定不同类别的误差带来相同的损失（下文会详细叙述）\r\n','2018-12-19 17:53:31',9),(6,1,'PyTorch 1.0 正式版发布了','PyTorch 1.0 同时面向产品化 AI 和突破性研究的发展，「我们在 PyTorch1.0 发布前解决了几大问题，包括可重用、性能、编程语言和可扩展性。」Facebook 人工智能副总裁 Jerome Pesenti 曾在 PyTorch 开发者大会上表示。\r\n\r\n\r\n\r\n随着 PyTorch 生态系统及社区中有趣新项目及面向开发者的教育资源不断增加，今天 Facebook 在 NeurIPS 大会上发布了 PyTorch 1.0 稳定版。该版本具备生产导向的功能，同时还可以获得主流云平台的支持。\r\n\r\n\r\n\r\n现在，研究人员及工程师可以轻松利用这一开源深度学习框架的新功能，包括可在 eager execution 和 graph execution 模式之间无缝转换的混合前端、改进的分布式训练、用于高性能研究的纯 C++ 前端，以及与云平台的深度集成。','2018-12-19 00:00:00',3),(7,1,'程序员吐槽：在一个不到五千人的互联网小厂，年底裁员比京东更狠','一名程序员在某互联网公司工作，到年底却遇到了裁员，于是吐槽了一番：年底遇到了跟京东一样的待遇，裁员，在一个不到5000人的互联网小厂，不同的是，我们公司裁员的指标是20%比京东更狠。现在hr让我自动提离职申请，说这个月的考勤自由，有点焦虑，有点慌。各位大佬，遇到这种情况是怎么处理的呢？\r\n年底裁员是很多公司惯用的手法，正好省了一笔年终奖，可谓一举两得，但这种做法被员工所唾弃，因为有点卸磨杀驴的味道：把公司名露一下，大家骂一会，会帮你想办法的，这叫对症下药，每个公司的症状不一样，来，联系我，我给你介绍个项目，先了解一下云云','2018-12-19 00:00:00',5),(8,1,'32岁程序员面试，Leader称高龄直接送走，网友：价值观太扭曲','程序员是否吃“青春饭”这个问题想必大家都有讨论过，大多数人都觉得，程序员到了一定年龄就不能创造价值了，要么转到管理岗位要么就走人，这种想法我认为太过偏见，为什么一个人的能力和价值要用年龄来做判断依据？可能身体不会比年轻人好了，难道仅仅因为不能加班了吗？我想这种年龄淘汰制的企业发展一定不大，注重新人培养固然重要，但是没有几个“老东西”这个企业价值也会大大折扣\r\n事情发生在上个月，一名程序员网上发帖语言感觉很无奈，称：“昨天面试了一个32岁的大龄程序员，我给领导建议是T4，领导说那直接送走吧，好像看到了未来的我”，32岁在程序员中已经算是中年了，很多公司不敢要，很多因素，第一是怕养不起，第二是年龄问题怕不能做事了等，但是这样的公司真的能长久吗？大家都知道，所以说这位面试的程序员也在感叹，在这家公司呆下去是不是也会变成这样被赶走。\r\n--------------------- \r\n作者：web前端学习 \r\n来源：CSDN \r\n原文：https://blog.csdn.net/weixin_43245088/article/details/85014657 \r\n版权声明：本文为博主原创文章，转载请附上博文链接！\r\n--------------------- \r\n作者：web前端学习 \r\n来源：CSDN \r\n原文：https://blog.csdn.net/weixin_43245088/article/details/85014657 \r\n版权声明：本文为博主原创文章，转载请附上博文链接！','2018-12-19 00:00:00',4),(10,1,'程序员：女友学历比自己高，技术比自己强，过不下去了','对于这名程序员因为女友比自己优秀而感到深深的自卑，网友称：看了楼主的自述，确实是门不当户不对，不知道当初你们是靠什么走到一起的？要是你们两的性别对调一下，就蛮合适的。当然既然现在在一起了，就好好发展，现在想这些有什么用，是你的就是你的，不是你的你也强求不来。有网友打趣称：要是你有一千万，那这些就没关系。\r\n\r\n如果有正在学java的程序员，可来我们的java技术学习扣qun哦：72340,3928，小编花了近一个月整理了一份非常适合18年学习的java干货，加入就免费送java的视频教程噢！而且我每天晚上都会在里面直播讲Java知识，从零基础学习到有基础进阶，欢迎初学和进阶中的小伙伴。\r\n--------------------- \r\n作者：weixin_43030648 \r\n来源：CSDN \r\n原文：https://blog.csdn.net/weixin_43030648/article/details/85014635 \r\n版权声明：本文为博主原创文章，转载请附上博文链接！','2018-12-19 00:00:00',1),(11,1,'123','123','2018-12-21 00:00:00',2);

/*Table structure for table `friend` */

DROP TABLE IF EXISTS `friend`;

CREATE TABLE `friend` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `userAccount` varchar(50) DEFAULT NULL,
  `friendAccount` varbinary(50) DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `friend` */

insert  into `friend`(`fid`,`userAccount`,`friendAccount`) values (3,'test','test2'),(4,'test2','test'),(5,'test','xiaoming'),(6,'xiaoming','test'),(9,'admin','test'),(10,'test','admin'),(11,'hello','admin'),(12,'admin','hello'),(13,'hello','test'),(14,'test','hello'),(15,'testtwo','admin'),(16,'admin','testtwo');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) DEFAULT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `realname` varchar(50) DEFAULT NULL,
  `stuid` varchar(50) DEFAULT NULL,
  `img` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT '0',
  `port` varchar(50) DEFAULT '0',
  `state` varchar(2) DEFAULT '0',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`uid`,`uname`,`pwd`,`role`,`phone`,`realname`,`stuid`,`img`,`ip`,`port`,`state`) values (1,'admin','admin',0,'13333333334','李四','201507090392','05','0','0','0'),(7,'test','test',1,'13333333333','赵二','201603201246','02','0','0','0'),(8,'xiaoming','123456',0,'12546985461','王八','201362549562','07','0','0','0'),(9,'test2','test',1,'13201326548','张柳','203124651289','02','0','0','0'),(11,'hello','admin',0,'13625945876','孙悟空','201365214598','07','0','0','0'),(12,'testtwo','123',1,'15236485695','闺女就','201252365485','03','0','0','0'),(13,'test001','123',0,'13356698451','小明','201354652124','06','0','0','0');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
