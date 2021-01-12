USE Hotel;

-- Query 1: Write a query that returns a list of reservations that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.
SELECT Guest.`Name`,Reservation.RoomNumber,Reservation.StartDate,Reservation.EndDate FROM Reservation 
INNER JOIN Guest ON Guest.GuestID=Reservation.GuestID
WHERE (EndDate>'2023-06-30' AND EndDate<'2023-08-01'); -- rewrite to use BETWEEN?

-- 'Rachelle Magaram','205','2023-06-28','2023-07-02'
-- 'Walter Holaway','204','2023-07-13','2023-07-14'
-- 'Wilfred Vise','401','2023-07-18','2023-07-21'
-- 'Bettyann Seery','303','2023-07-28','2023-07-29'

-- Query 2: Write a query that returns a list of all reservations for rooms with a jacuzzi, displaying the guest's name, the room number, and the dates of the reservation.
SELECT Guest.`Name`,Reservation.RoomNumber,Reservation.StartDate,Reservation.EndDate FROM Reservation
INNER JOIN Guest ON Guest.GuestID=Reservation.GuestID
INNER JOIN Room ON Room.RoomNumber=Reservation.RoomNumber
WHERE Room.AmenityID=1 OR Room.AmenityID=3;

-- 'Karie Yang','201','2023-03-06','2023-03-07'
-- 'Bettyann Seery','203','2023-02-05','2023-02-10'
-- 'Karie Yang','203','2023-09-13','2023-09-15'
-- 'Walter Holaway','301','2023-04-09','2023-04-13'
-- 'Mack Simmer','301','2023-11-22','2023-11-25'
-- 'Bettyann Seery','303','2023-07-28','2023-07-29'
-- 'Rachelle Magaram','205','2023-06-28','2023-07-02'
-- 'Wilfred Vise','207','2023-04-23','2023-04-24'
-- 'Duane Cullison','305','2023-02-22','2023-02-24'
-- 'Bettyann Seery','305','2023-08-30','2023-09-01'
-- 'Rachelle Magaram','307','2023-03-17','2023-03-20'

-- Query 3: Write a query that returns all the rooms reserved for a specific guest, including the guest's name, the room(s) reserved, the starting date of the reservation, and how many people were included in the reservation. (Choose a guest's name from the existing data.)
Select @people:=Adults+Children FROM Reservation; -- Results omitted from comments, was list of sums of adults+children.
SELECT Guest.`Name`,Reservation.RoomNumber,Reservation.StartDate,@people FROM Reservation
INNER JOIN Guest ON Guest.GuestID=Reservation.GuestID
WHERE Guest.`Name`='Rachelle Magaram';

-- 'Rachelle Magaram','307','2023-03-17','2'
-- 'Rachelle Magaram','205','2023-06-28','2'

-- Query 4: Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. The results should include all rooms, whether or not there is a reservation associated with the room.
SELECT Reservation.RoomNumber,Reservation.ReservationID,
((Room.BasePrice+Amenity.ExtraCost+Room.ExtraPersonCost)*DATEDIFF(EndDate,StartDate)) AS totalcost FROM Reservation
RIGHT JOIN Room ON Room.RoomNumber=Reservation.RoomNumber
INNER JOIN Amenity ON Room.AmenityID=Amenity.AmenityID; -- missed 2 rooms without reservations
-- RIGHT OUTER JOIN?
 
-- '201','4','234.99'
-- '203','2','1174.95'
-- '203','21','469.98'
-- '301','9','939.96'
-- '301','24','704.97'
-- '303','18','234.99'
-- '202','7','369.98'
-- '204','16','184.99'
-- '302','6','924.95'
-- '302','25','739.96'
-- '304','14','184.99'
-- '205','15','799.96'
-- '207','10','199.99'
-- '305','3','399.98'
-- '305','19','399.98'
-- '307','5','599.97'
-- '206','12','599.96'
-- '206','23','449.97'
-- '208','13','599.96'
-- '208','20','149.99'
-- NULL,NULL,NULL
-- '308','1','299.98'
-- '401','11','1259.97'
-- '401','17','1259.97'
-- '401','22','1259.97'
-- NULL,NULL,NULL


-- Query 5: Write a query that returns all the rooms accommodating at least three guests and that are reserved on any date in April 2023.
SELECT Reservation.RoomNumber FROM Reservation
WHERE (Reservation.StartDate>'2023-03-31' AND Reservation.EndDate<'2023-05-01')AND (Reservation.Adults+Reservation.Children)>2;
-- Nothing returned.

-- Query 6: Write a query that returns a list of all guest names and the number of reservations per guest, sorted starting with the guest with the most reservations and then by the guest's last name.
SELECT Guest.`Name`, COUNT(r.ReservationID) FROM Reservation r
 INNER JOIN Guest ON Guest.GuestID=r.GuestID
 GROUP BY Guest.`Name`
 ORDER BY COUNT(r.ReservationID) DESC, SUBSTRING(`Name`, LOCATE(' ',`Name`)+1) ASC;

-- 'Mack Simmer','4'
-- 'Bettyann Seery','3'
-- 'Duane Cullison','2'
-- 'Walter Holaway','2'
-- 'Aurore Lipton','2'
-- 'Rachelle Magaram','2'
-- 'Maritza Tilton','2'
-- 'Joleen Tison','2'
-- 'Wilfred Vise','2'
-- 'Karie Yang','2'
-- 'Zachery Luechtefeld','1'

-- Query 7: Write a query that displays the name, address, and phone number of a guest based on their phone number. (Choose a phone number from the existing data.)
SELECT `Name`,Address,PhoneNumber FROM Guest WHERE PhoneNumber='(216) 406-6742';
-- Rachelle Magaram,'25280 Penshurst Dr.','(216) 406-6742'
