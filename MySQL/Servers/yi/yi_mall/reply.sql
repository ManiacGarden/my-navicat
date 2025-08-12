drop table if exists msg;
CREATE TABLE `msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `goodsId` int(11) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `replyContent` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `goodsName` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `msg`(`id`, `userId`, `goodsId`, `content`, `replyContent`, `state`, `createtime`, `goodsName`, `userName`) VALUES (4, 234, 2, '有什么吃的？', '来了你就知道了', 0, '2022-09-24 11:55:48', '保定神秘菜肴', '哈哈哈');
INSERT INTO `msg`(`id`, `userId`, `goodsId`, `content`, `replyContent`, `state`, `createtime`, `goodsName`, `userName`) VALUES (5, 235, 2, '为什么要2000这么贵？', NULL, NULL, '2022-09-26 11:57:01', '保定神秘菜肴', '什么');

show create table msg;