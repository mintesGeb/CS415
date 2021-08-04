-- simple queries
select * from hotel;

select * from hotel
where city = "DC";

select * from guest
where guest_address ="DC"
order by guest_name desc;

select * from room 
where (room_type  ="luxury" or room_type = "family") and price >350;

select * from booking where date_to is null;

-- aggregate

select count(*) as no_of_hotels from hotel;

select avg(price) as average_price_of_room from room;

select sum(price) from room
where room_type = "double";

select count(*) as bookin_in_auguest from booking
where (date_from between "2021-08-01" and "2021-08-31")or (date_to between "2021-08-01" and "2021-08-31");

-- subqueries and joins

select h.hotel_name, r.room_no, r.room_type,r.price from hotel h inner join room r
on h.hotel_no = r.hotel_no
where h.hotel_name="Hilton";

select g.guest_name, h.hotel_name, h.city, b.date_from, b.date_to from booking b inner join hotel h
on b.hotel_no=h.hotel_no inner join guest g
on b.guest_no= g.guest_no
where h.hotel_name="hilton";


select r.room_no,r.hotel_no,r.room_type,r.price from booking b inner join hotel h
on b.hotel_no=h.hotel_no inner join guest g
on b.guest_no=g.guest_no inner join room r
on b.hotel_no=r.hotel_no and b.room_no=r.room_no
where (h.hotel_name="hilton");

select sum(r.price) from booking b inner join hotel h
on b.hotel_no= h.hotel_no inner join  room r
on b.room_no = r.room_no and b.hotel_no = r.hotel_no
where hotel_name ="hilton";


select * from room where room_no not in(
select b.room_no from booking b inner join hotel h
on b.hotel_no= h.hotel_no
where h.hotel_name = "Sheraton"
);

select hotel_no, count(room_no) from room
group by hotel_no;

select r.hotel_no, count(r.room_no) from room r inner join hotel h
on r.hotel_no=h.hotel_no
where h.city = "DC"
group by r.hotel_no;

select hotel_no, y/30
from (select hotel_no, count(hotel_no) as y from booking
group by hotel_no) as sub;

select hotel_no, y/30
From(select hotel_no, count(hotel_no) as y from booking 
group by hotel_no) as sub;

select * from room r inner join
(select hotel_no, room_no from booking ) z
on r.room_no = z.room_no and r.hotel_no=z.hotel_no;


select * from room r where r.room_no not in
(select hotel_no from booking b where r.room_no = b.room_no and r.hotel_no=b.hotel_no)
group by hotel_no