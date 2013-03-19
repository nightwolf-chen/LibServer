
create table `post`(
    
    postid int primary key auto_increment,
    post_userid varchar(255) not null,
    post_time timestamp default current_timestamp,
    content text not null,
    showname boolean default false 

) ;