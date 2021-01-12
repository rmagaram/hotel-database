DROP DATABASE IF EXISTS Hotel;

CREATE DATABASE Hotel;

USE Hotel;

CREATE TABLE IF NOT EXISTS Amenity (
	AmenityID INT PRIMARY KEY NOT NULL auto_increment,
	HasMicrowave VARCHAR(3) NULL,
    HasRefrigator VARCHAR(3) NULL,
    HasOven VARCHAR(3) NULL,
    HasJacuzzi VARCHAR(3) NULL,
    ExtraCost INT,
    Display VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Guest(
	GuestID INT PRIMARY KEY NOT NULL auto_increment,
    `Name` VARCHAR(60) NOT NULL, -- why is ' ' not valid but ` ` is valid? | put in tick marks b/c it's weakly reserved word
    Address VARCHAR(40) NOT NULL,
    City VARCHAR(30) NOT NULL,
    State CHAR(2) NOT NULL,
    ZipCode INT NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL
);

CREATE TABLE IF NOT EXISTS Room(
	RoomNumber INT PRIMARY KEY NOT NULL,
    RoomType VARCHAR(20) NOT NULL,
    AmenityID INT NOT NULL,
    FOREIGN KEY fk_Amenity_Room(AmenityID) REFERENCES Amenity(AmenityID),
    ADAAccessible BOOLEAN NOT NULL,
    MaxOccupancy INT NOT NULL,
    BasePrice DECIMAL(5,2) NOT NULL,
    ExtraPersonCost INT NOT NULL
);

CREATE TABLE IF NOT EXISTS Reservation(
	ReservationID INT PRIMARY KEY NOT NULL auto_increment,
    RoomNumber INT NOT NULL,
    FOREIGN KEY Room(RoomNumber) REFERENCES Room(RoomNumber),
    GuestID INT NOT NULL,
    FOREIGN KEY Guest(GuestID) REFERENCES Guest(GuestID),
    Adults INT NOT NULL,
    Children INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL
);

