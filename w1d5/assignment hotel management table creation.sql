/*
create table Hotel (
hotelNo varchar(25) not null,
hotelName varchar(25),
city varchar(25),
primary key (hotelNo)
);

create table room (
roomNo varchar(25) not null ,
hotelNo varchar(25),
type varchar(25),
price int,
primary key (roomNo),
primary key(hotelNo),
constraint fk_r_h foreign key (hotelNo) references Hotel(hotelNo)
);

create table Guest (
guestNo varchar(25) not null ,
guestName varchar(25),
guestAddress varchar(25),
primary key(guestNo) 
);

create table Booking (
hotelNo varchar(25) not null,
guestNo varchar(25) not null,
dateFrom date not null,
dateTo date not null ,
roomNo varchar(25),
primary key(hotelNo,guestNo,dateFrom),
constraint fk_b_h foreign key(hotelNo) references Hotel(hotelNo),
constraint fk_b_g foreign key (guestNo) references Guest(guestNo),
constraint fk_b_r foreign key (roomNo) references Room(roomNo)
) 
*/