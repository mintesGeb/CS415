select * from hotel h inner join room r
on h.hotel_no=r.hotel_no
where h.hotel_name = "hilton";

select b.guest_no, g.guest_name from booking b inner join hotel h
on h.hotel_no=b.hotel_no inner join guest g
on b.guest_no=g.guest_no
where h.hotel_name="hilton";

select * from room r inner join hotel h
on r.hotel_no = h.hotel_no inner join booking b
on r.room_no=b.room_no and r.hotel_no = b.hotel_no inner join guest g
on b.guest_no=g.guest_no
where h.hotel_name = "hilton";

select sum(r.price) from booking b inner join hotel h
on h.hotel_no=b.hotel_no inner join room r
on r.room_no = b.room_no and r.hotel_no=b.hotel_no
where h.hotel_name="hilton";


select * from room where room_no not in 
(select b.room_no from booking b inner join hotel h
on h.hotel_no = b.hotel_no
where h.hotel_name ="hilton") and hotel_no = (select hotel_no from hotel where hotel_name="hilton");

select count(room_no), hotel_no from room 
group by hotel_no;

select * from hotel;

select r.hotel_no, h.hotel_name, count(room_no) from room r inner join hotel h
on r.hotel_no=h.hotel_no
where h.city = "DC"
group by r.hotel_no;

select hotel_no, y/30 from 
(select b.hotel_no, count(b.room_no) as y from booking b
group by b.hotel_no) as sub;

 
select hotel_no, count(room_no)/30 from booking
group by hotel_no;

(select room_no,max(common_booked_type) from
(select room_no,(count(room_no)) as common_booked_type from booking
group by room_no) as sub);

select * from room;

select r.hotel_no, sum(r.price) from room r left join booking b
on r.hotel_no=b.hotel_no and r.room_no=b.room_no
where b.room_no is null
group by r.hotel_no
