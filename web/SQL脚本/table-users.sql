
create table `users`(
    `userid` int primary key auto_increment ,
    `username` varchar(225) unique not null,
    `password` varchar(225) not null
);

