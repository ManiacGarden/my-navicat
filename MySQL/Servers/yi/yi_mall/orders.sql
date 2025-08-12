drop table if exists orders;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `receiver` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `goodsId` int(11) DEFAULT NULL,
  `specId` int(11) DEFAULT NULL,
  `goodsName` varchar(255) DEFAULT NULL,
  `specName` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `stateId` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  `hasComment` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8

insert into orders values(null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);