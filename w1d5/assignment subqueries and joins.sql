-- select h.hotelNo, hotelName, roomNo,price from hotel h inner join room r
-- on h.hotelNo = r.hotelNo
-- where hotelname = "hilton"

-- select * from booking b inner join guest g 
-- on b.guestNo = g.guestNo inner join hotel h
-- on h.hotelNo = b.hotelNo 
-- where h.city = "greenbelt" 

-- select r.roomNo,h.hotelNo, r.type, r.price, h.hotelName, h.city, g.guestName, b.guestNo from room r inner join hotel h
-- on h.hotelNo = r.hotelNo inner join booking b
-- on r.roomNo=b.roomNo inner join guest g
-- on b.guestNo=g.guestNo

-- where hotelName = "hilton"

-- select sum(price) from booking b inner join hotel h
-- on b.hotelNo=h.hotelNo inner join room r
-- on b.roomNo=r.roomNo
-- where h.hotelName = "hilton"
-- group by type;

-- select * from booking b inner join hotel h
-- on b.hotelNo=h.hotelNo inner join room r
-- on b.roomNo=r.roomNo
-- where h.hotelName = "hilton";

-- select sum(price) from booking b inner join hotel h
-- on b.hotelNo=h.hotelNo inner join room r
-- on b.roomNo = r.roomNo
-- where r.hotelNo = (
-- select hotelNo from hotel
-- where hotelName= "hilton"
-- ) and h.hotelname = "hilton"

--  insert into room
--  value("R005", "H001", "double", 370);

-- select * from room r inner join hotel h
-- on r.hotelNo=h.hotelNo
-- where roomNo not in (
-- select roomNo from booking
-- )  and h.hotelname = "hilton"

-- select sum(price) from room r inner join hotel h
-- on r.hotelNo=h.hotelNo
-- where roomNo not in(
-- select roomNo from booking 
-- ) and h.hotelName="hilton"
