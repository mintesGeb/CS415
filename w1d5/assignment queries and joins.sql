select * from hotel;
select * from hotel where city ="greenbelt";
select * from guest where guestaddress ="DC" order by guestname asc;
select * from room where (type = "double" or type ="queen") and price < 300;
select * from booking where dateTo is null;

select count(*) from hotel;
select avg(price) from room;
select sum(price) from room where type= "double";
select count(distinct guestNo) from booking where (dateFrom between "2021-08-01" and "2021-08-31") or (dateTo between "2021-08-01" and "2021-08-31") ;

select * from room where hotelNo in(
select hotelNo from hotel where hotelName="hilton"
);

select * from room r inner join hotel h 
on r.hotelNo = h.hotelNo
where h.hotelName = "hilton"
 order by type, price asc;
 
 select * from guest where guestNo in(
 select guestNo from booking where hotelNo in(
 select hotelNo from hotel where hotelName="hilton"
 )
 );
 
 select b.guestNo, g.guestName, h.hotelName,h.city from booking b inner join guest g
 on b.guestNo = g.guestNo inner join hotel h
 on b.hotelNo =h.hotelNo
 where h.hotelname ="hilton";
 
 
 select * from room where roomNo in(
 select roomNo from booking
 );
 
 select * from booking b inner join hotel h 
 on b.hotelNo = h.hotelno inner join room r
 on b.roomNo = r.roomNo
 where h.hotelName = "hilton" and h.city="greenbelt" and r.hotelno=(
 select hotelNo from hotel where hotelName = "hilton" and city="greenbelt"
 );
 
select * from room r inner join booking b 
 on r.roomNo=b.roomNo inner join hotel h
 on b.hotelNo = h.hotelNo inner join guest g
 on b.guestNo = g.guestNo
 where (h.hotelname = "hilton" and h.city="greenbelt")and 
 r.hotelNo in(select hotelNo from hotel where hotelname = "hilton" and city="greenbelt");

select * from room
order by hotelno;

select * from booking where roomNo not in (
select roomNo from room 
where hotelNo in(
select hotelNo from hotel where hotelName = "hilton" and city ="greenbelt"
)) and hotelNo in(
select hotelno from hotel where hotelName = "hilton" and city ="greenbelt"
);


select roomNo from room 
where hotelNo =(
select hotelNo from hotel where hotelname ="hilton" and city ="greenbelt"
) and roomno not in (
SELECT roomNo FROM booking where hotelNo in (
select hotelNo from hotel where hotelname ="hilton" and city ="greenbelt"
)
);

select sum(price) from room 
where hotelNo =(
select hotelNo from hotel where hotelname ="hilton" and city ="greenbelt"
) and roomno not in (
SELECT roomNo FROM booking where hotelNo in (
select hotelNo from hotel where hotelname ="hilton" and city ="greenbelt"
)
);

select count(roomNo) from hotel h inner join room r
on h.hotelNo=r.hotelNo
where h.city= "greenbelt"
group by h.hotelNo;

select * from booking