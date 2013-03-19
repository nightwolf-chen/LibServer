CREATE TABLE `friend` (
  `userid` varchar(255) NOT NULL,
  `fuserid` varchar(255) NOT NULL,
  `closeness` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`,`fuserid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
