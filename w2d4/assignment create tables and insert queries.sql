create table book (
book_id varchar(25) not null ,
title varchar(25),
publisher_name varchar(25),
primary key (book_id)

);

create table book_authors(
book_id varchar(25),
author_name varchar(25),
foreign key(book_id) references book(book_id),
primary key(book_id, author_name)
);
create table publisher(
name varchar(25) not null,
address varchar(25),
phone varchar(25),
primary key(name)
);

alter table book
add foreign key (publisher_name) references publisher(name);

create table book_copies(
book_id varchar(25) not null,
branch_id varchar(25) not null,
no_of_copies int,
foreign key (branch_id) references library_branch(branch_id),
primary key(book_id, branch_id)
);

create table library_branch(
branch_id varchar(25) not null,
branch_name varchar(25),
address varchar(25),
primary key(branch_id)
);

create table book_loans(
book_id varchar(25),
branch_id varchar(25),
card_no int,
date_out date,
due_date date,
primary key(book_id, branch_id, card_no),
foreign key(book_id)references book(book_id),
foreign key(branch_id) references library_branch(branch_id),
foreign key(card_no) references borrower(card_no)
);

create table borrower(
card_no int not null auto_increment,
name varchar(25),
address varchar(25),
phone varchar(25),
primary key(card_no)
);

select * from borrower;
insert into book (book_id, title, publisher_name)
values
("b001","knowing God","lito"),
("b002","Loving God","miter"),
("b003","Godly Life","sest"),
("b004","Real discipleship","ketol");

insert into publisher(name, address, phone)
values
("lito","California", "222"),
("miter","Chickago", "555"),
("sest","Boston", "999"),
("ketol","DC", "468");

insert into book_authors(book_id, author_name)
values
("b001","J.I Packer"),
("b002","John Piper"),
("b003","Boenhoefer"),
("b004","Ravi Zach");

insert into library_branch(branch_id, branch_name, address)
values
("br01","Montgomery Library", "Silver Spring"),
("br02","Price George Library", "Greenbelt");

insert into borrower(card_no, name, address, phone)
values
(1, "mintes","greenbelt", "1234"),
(2, "amani","DC", "5678"),
(3, "jos","colombia", "5025"),
(4, "nati","Alexandria", "9028");

insert into book_copies ( book_id, branch_id, no_of_copies)values
("b001","br01",2),
("b002","br02",1),
("b003","br01",1),
("b004","br02",3);

insert into book_loans( book_id, branch_id,card_no, date_out, due_date)values
("b001","br01", 1, "2021-05-10", "2021-06-10"),
("b002","br02", 1, "2021-06-05", "2021-0-05"),
("b003","br01", 1, "2021-07-01", "2021-08-01"),
("b004","br02", 1, "2021-06-15", "2021-07-15");

