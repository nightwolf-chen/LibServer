
create table `message`(
    
    messageid int primary key auto_increment,
    senderid varchar(255) not null ,
    reciever varchar(255) not null ,
    content text not null ,
    messagetime timestamp default CURRENT_TIMESTAMP  
) ;
