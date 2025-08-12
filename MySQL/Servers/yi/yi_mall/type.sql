drop table if exists type;
CREATE TABLE `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO `yi_mall`.`type`(`id`, `name`) VALUES (1, '吃的');
INSERT INTO `yi_mall`.`type`(`id`, `name`) VALUES (2, '穿的');
INSERT INTO `yi_mall`.`type`(`id`, `name`) VALUES (3, '玩的');

show create table type;