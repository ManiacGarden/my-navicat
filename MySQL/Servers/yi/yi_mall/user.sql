drop table if exists `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `recipient` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
insert into `user` values (null, "admin", "admin", "admin", "admin", "admin", "11111111111");
insert into `user` values (null, "42@42.com", "answer", "4242424242424", "dude", "here", "1113333111");
insert into `user` values (null, "4242sdfds@ss.com", "opp", "4242424242424", "buddy", "there", "11111113511");
show create table admin;