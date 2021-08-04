/*insert into booking
values
("H001","G001", "2021-05-05","2021-05-10", "R002" ),
("H002","G002", "2021-04-05","2021-04-10", "R001" ),
("H001","G003", "2021-05-05","2021-05-09", "R001" ),
("H003","G002", "2021-03-05","2021-03-10", "R002" ),
("H002","G003", "2021-06-05","2021-06-10", "R002" ),
("H003","G001", "2021-07-05","2021-07-09", "R001" )

*/

-- insert into guest 
-- values
-- ("G004", "aman", "DC");

-- insert into room 
-- values
-- ("R004", "H001", "family", 600)

-- select * from room
-- where (type="family" or type ="basic") and price <700
-- order by price asc 


-- select count(*) from hotel
-- select avg(price) from room
  
--   select count(*), sum(price) from room
--   where type ="luxury"

-- select count(hotelNo) from booking
-- where dateFrom between "2021-05-01" and "2021-05-31"