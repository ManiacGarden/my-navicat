drop table if exists admin;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `nickname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
INSERT INTO `admin`(`id`, `username`, `password`, `nickname`) VALUES (1, 'admin', 'adminads', 'admin');
INSERT INTO `admin`(`id`, `username`, `password`, `nickname`) VALUES (2, 'yo', 'yo', 'yo');
INSERT INTO `admin`(`id`, `username`, `password`, `nickname`) VALUES (3, '24601@qq.com', '24601@qq.comA', '24601');
INSERT INTO `admin`(`id`, `username`, `password`, `nickname`) VALUES (4, '343423423@qq.com', '24601@qq.comA', '24601');
INSERT INTO `admin`(`id`, `username`, `password`, `nickname`) VALUES (5, '24602@Qq.com', '24602@Qq.com', 's234fdfd');
INSERT INTO `admin`(`id`, `username`, `password`, `nickname`) VALUES (6, '1423432@Qq.com', '24601@Qq.com', '324fd');

show create table admin;