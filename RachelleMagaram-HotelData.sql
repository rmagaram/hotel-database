USE HOTEL;

INSERT INTO Amenity(AmenityID,HasMicrowave,HasRefrigator,HasOven,HasJacuzzi,ExtraCost,Display) VALUES
	(1,'Yes' ,'No','No','Yes',25,'Microwave, Jacuzzi'),
	(2, 'No', 'Yes', 'No', 'No', 0, 'Refrigerator'),
	(3, 'Yes','Yes','No','Yes',25, 'Microwave, Refrigerator, Jacuzzi'),
	(4, 'Yes','Yes','No', 'No', 0 , 'Microwave, Refrigerator'),
	(5, 'Yes', 'Yes', 'Yes', 'No', 0 , 'Microwave, Refrigerator, Oven');

INSERT INTO Guest(GuestID,`Name`,Address,City,State,ZipCode,PhoneNumber) VALUES
	(1, 'Rachelle Magaram','25280 Penshurst Dr.','Beachwood','OH','44122','(216) 406-6742'),
    (2, 'Mack Simmer', '379 Old Shore Street', 'Council Bluffs', 'IA', '51501', '(291) 553-0508'),
    (3, 'Bettyann Seery', '750 Wintergreen Dr.', 'Wasilla', 'AK', '99654', '(478) 277-9632'),
    (4, 'Duane Cullison', '9662 Foxrun Lane', 'Harlingen', 'TX', '78552', '(308) 494-0198'),
    (5, 'Karie Yang', '9378 W. Augusta Ave.', 'West Deptford', 'NJ', '08096', '(214) 730-0298'),
    (6, 'Aurore Lipton', '762 Wild Rose Street', 'Saginaw', 'MI', '48601', '(377) 507-0974'),
    (7, 'Zachery Luechtefeld', '7 Poplar Dr.', 'Arvada', 'CO', '80003', '(814) 485-2615'),
    (8, 'Jeremiah Pendergrass', '70 Oakwood St.', 'Zion', 'IL', '60099', '(279) 491-0960'),
    (9, 'Walter Holaway', '7556 Arrowhead St.', 'Cumberland', 'RI', '02864', '(446) 396-6785'),
    (10, 'Wilfred Vise', '77 West Surrey Street', 'Oswego', 'NY', '13126', '(834) 727-1001'),
    (11, 'Maritza Tilton', '939 Linda Rd.', 'Burke', 'VA', '22015', '(446) 351-6860'),
    (12, 'Joleen Tison', '87 Queen St.', 'Drexel Hill', 'PA', '19026', '(231) 893-2755');
    
INSERT INTO Room(RoomNumber,RoomType,AmenityID,ADAAccessible,MaxOccupancy,BasePrice,ExtraPersonCost) VALUES
-- for ADAAccessible: false is 0, true is 1
	(201,'Double',1,0,4,199.99,10),
    (202,'Double',2,1,4,174.99,10),
    (203,'Double',1,0,4,199.99,10),
    (204,'Double',2,1,4,174.99,10),
    (205,'Single',3,0,2,174.99,0),
    (206,'Single',4,1,2,149.99,0),
    (207,'Single',3,0,2,174.99,0),
    (208,'Single',4,1,2,149.99,0),
    (301,'Double',1,0,4,199.99,10),
    (302,'Double',2,1,4,174.99,10),
    (303,'Double',1,0,4,199.99,10),
    (304,'Double',2,1,4,174.99,10),
    (305,'Single',3,0,2,174.99,0),
    (306,'Single',4,1,2,149.99,0),
    (307,'Single',3,0,2,174.99,0),
    (308,'Single',4,1,2,149.99,0),
    (401,'Suite',5,1,8,399.99,20),
    (402,'Suite',5,1,8,399.99,20);
    
INSERT INTO Reservation(RoomNumber,GuestID,Adults,Children,StartDate,EndDate) VALUES
-- YYYY-MM-DD
-- in the future, insert every line individually
	(308,2,1,0,'2023-02-02','2023-02-04'),
    (203,3,2,1,'2023-02-05','2023-02-10'),
    (305,4,2,0,'2023-02-22','2023-02-24'),
    (201,5,2,2,'2023-03-06','2023-03-07'),
    (307,1,1,1,'2023-03-17','2023-03-20'),
    (302,6,3,0,'2023-03-18','2023-03-23'),
    (202,7,2,2,'2023-03-29','2023-03-31'),
    (304,8,2,0,'2023-03-31','2023-04-05'),
    (301,9,1,0,'2023-04-09','2023-04-13'),
    (207,10,1,1,'2023-04-23','2023-04-24'),
    (401,11,2,4,'2023-05-30','2023-06-02'),
    (206,12,2,0,'2023-06-10','2023-06-14'),
    (208,12,1,0,'2023-06-10','2023-06-14'),
    (304,6,3,0,'2023-06-17','2023-06-18'),
    (205,1,2,0,'2023-06-28','2023-07-02'),
    (204,9,3,1,'2023-07-13','2023-07-14'),
    (401,10,4,2,'2023-07-18','2023-07-21'),
    (303,3,2,1,'2023-07-28','2023-07-29'),
    (305,3,1,0,'2023-08-30','2023-09-01'),
    (208,2,2,0,'2023-09-16','2023-09-17'),
    (203,5,2,2,'2023-09-13','2023-09-15'),
    (401,4,2,2,'2023-11-22','2023-11-25'),
    (206,2,2,0,'2023-11-22','2023-11-25'),
    (301,2,2,0,'2023-11-22','2023-11-25'),
    (302,11,2,0,'2023-12-24','2023-12-28');
    
DELETE FROM Reservation WHERE GuestID=8;
DELETE FROM Guest WHERE GuestID=8;
