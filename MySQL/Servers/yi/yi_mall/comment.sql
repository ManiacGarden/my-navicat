drop table if exists `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `userNickname` varchar(255) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `goodsId` int(11) DEFAULT NULL,
  `specId` int(11) DEFAULT NULL,
  `specName` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
	`time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8