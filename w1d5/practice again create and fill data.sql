create database hotel_management_system;

create table hotel(
hotel_no int not null auto_increment,
hotel_name varchar(25),
city varchar(25),
primary key (hotel_no)
);

select *from hotel;

insert into hotel (hotel_no, hotel_name, city)
values
(default, "Sheraton", "Chicago"),
(default, "Marriot", "Los Angeles"),
(default, "Trump", "DC"),
(default, "Hilton", "New York");

create table guest (
guest_no int not null auto_increment,
guest_name varchar(25),
guest_address varchar(25),
primary key(guest_no) 
);



insert into guest (guest_no, guest_name, guest_address)
values
(default, "Mintes", "Greenbelt"),
(default, "Amani", "Fairfield"),
(default, "Robbie", "DC"),
(default, "Jossy", "Phoenix"),
(default, "Amen", "Radford");

select * from guest;

create table room (
room_no varchar(25) not null ,
hotel_no int,
room_type varchar(25),
price int,
primary key(room_no, hotel_no),
foreign key(hotel_no) references hotel(hotel_no)
);

insert into room (hotel_no,room_no, room_type, price )
values
(1, "r001", "single", 100),
(1, "r002", "double", 200),
(1, "r003", "family", 300),

(2, "r001", "single", 150),
(2, "r002", "double", 250),
(2, "r003", "family", 350),
(2, "r004", "family", 350),

(3, "r001", "single", 120),
(3, "r002", "double", 220),
(3, "r003", "family", 320),

(4, "r001", "single", 180),
(4, "r002", "double", 280),
(4, "r003", "family", 380),
(4, "r004", "family", 480);

select * from room;

create table booking (
hotel_no int,
guest_no int,
room_no varchar(25),
date_from date,
date_to date,
primary key(hotel_no, guest_no, room_no),
foreign key(hotel_no) references hotel(hotel_no),
foreign key(guest_no) references guest(guest_no),
foreign key (room_no) references room(room_no)
);

insert into booking (hotel_no,guest_no, room_no, date_from, date_to)
values
(3, 2, "r001", "2021-06-10","2021-06-15"),
(2, 5, "r001", "2021-07-10","2021-07-15"),
(4, 1, "r002", "2021-08-20","2021-08-25"),
(2, 4, "r003", "2021-04-10","2021-04-13"),
(4, 3, "r004", "2021-05-09","2021-05-10"),

(1, 2, "r003", "2021-05-10","2021-05-15");
select * from booking;