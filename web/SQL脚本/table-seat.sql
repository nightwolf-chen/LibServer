create table `seat`(
     `seatid` int primary key auto_increment,
     `seatname` varchar(50) not null,
     `area` varchar(50) not null,
     `location` varchar(50) not null,
     `floor` smallint not null,
     `heat` int default 0 
) ;
