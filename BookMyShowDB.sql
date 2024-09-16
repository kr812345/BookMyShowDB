-- Tables: user, movies, theatre, location, SEAT_Map, events, stream, sports, 
-- Offers, GiftCards, ListYourShow, Booking, payment 

-- BookMyShow Schema

CREATE DATABASE BookMyShowDB; 

USE BookMyShowDB;

CREATE TABLE Users (
    User_id INT PRIMARY KEY NOT NULL,
    Username VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    password VARCHAR(200),
    Contact_no VARCHAR(14),
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
 
CREATE TABLE Movies (
    Movie_id INT PRIMARY KEY NOT NULL,
    Movie_name VARCHAR(200) NOT NULL,
    Movie_genre VARCHAR(100) NOT NULL,
    Movie_synopsis VARCHAR(255) ,
    Movie_rating DECIMAL NOT NULL,
    Movie_review DECIMAL NOT NULL,
    Movie_language VARCHAR(100) NOT NULL,
    Movie_released_date DATE NOT NULL,
    Movie_time TIMESTAMP NOT NULL,
    Movie_comments VARCHAR(200),
    Movie_cast VARCHAR(255),
    Movie_crew VARCHAR(255)
);

CREATE TABLE Location (
	Location_id INT PRIMARY KEY NOT NULL,
    Building_name VARCHAR(200) NOT NULL,
    Pincode INT NOT NULL,
    Landmark VARCHAR(200) NOT NULL,
    city VARCHAR(200)
);

CREATE TABLE Theatre (
	Theatre_id INT PRIMARY KEY NOT NULL,
    Theatre_name VARCHAR(200) NOT NULL,
    Location_id INT NOT NULL,
    FOREIGN KEY (Location_id) REFERENCES Location(Location_id)
);



CREATE TABLE SeatMap (
	Seat_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Row_id INT NOT NULL,
    Column_id CHAR NOT NULL,
    Screen_id INT NOT NULL,
    FOREIGN KEY (Screen_id) REFERENCES Screen(Screen_id)
);

CREATE TABLE Screen (
	Screen_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Movie_id INT NOT NULL,
    Movie_name VARCHAR(200) NOT NULL,
    Start_time TIME NOT NULL,
    End_time TIME NOT NULL,
    FOREIGN KEY (Movie_id) REFERENCES Movies(Movie_id)
);

CREATE TABLE Event_ (
	Event_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Event_name VARCHAR(200) NOT NULL,
    Event_host VARCHAR(200) NOT NULL,
    Event_Artist VARCHAR(255),
    Event_Timing TIMESTAMP NOT NULL,
    Event_type VARCHAR(200),
    Event_desc VARCHAR(200),
    Event_language VARCHAR(200),
    Event_comments VARCHAR(200),
    Event_age_grp INT,
    Location_id INT NOT NULL,
    Event_charge DECIMAL NOT NULL,
	Ticket_id INT NOT NULL,
    TermNCondition VARCHAR(255),
	FOREIGN KEY (Location_id) REFERENCES Location(Location_id)
);

CREATE TABLE Stream_ (
	Stream_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Movie_id INT,
    FOREIGN KEY (Movie_id) REFERENCES Movies(Movie_id)
);

CREATE TABLE Sports (
	Sports_id INT PRIMARY KEY NOT NULL,
	Event_id INT NOT NULL,
    FOREIGN KEY (Event_id) REFERENCES Event_(Event_id)
);

CREATE TABLE Offer (
	Offer_id INT PRIMARY KEY AUTO_INCREMENT,
    Offer_code VARCHAR(50) UNIQUE NOT NULL,
    Description_ Text,
    Discount_amount DECIMAL(10,2),
    Start_date DATE NOT NULL,
    End_date DATE NOT NULL,
    Applicable_to VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);   

CREATE TABLE GiftCards (
	GiftCard_id INT AUTO_INCREMENT PRIMARY KEY,
    card_number VARCHAR(200),
    pin_code VARCHAR(10) NOT NULL,
    Balance DECIMAL(10,2) NOT NULL,
    Issued_to VARCHAR(100) NOT NULL,
    Issued_by VARCHAR(100) ,
    Issue_date DATE NOT NULL,
    Expiry_date DATE NOT NULL
);

CREATE TABLE ListYourShow (
	Show_id INT AUTO_INCREMENT PRIMARY KEY,
    Individual_name VARCHAR(100),
    PAN_Card_No INT,
    Individual_Address VARCHAR(200),
    Bank_detail_id INT,
    FOREIGN KEY (Bank_detail_id) REFERENCES Bank_detail(Bank_detail_id)
);

CREATE TABLE Bank_detail (
	Bank_detail_id INT AUTO_INCREMENT PRIMARY KEY,
    Bank_Name VARCHAR(255) NOT NULL,
    Bank_IFSC VARCHAR(9) NOT NULL,
    Beneficiary_Name VARCHAR(100) NOT NULL,
    Account_Type VARCHAR(50) NOT NULL,
    Account_no INT UNIQUE NOT NULL
);

CREATE TABLE Booking (
	Booking_id INT PRIMARY KEY NOT NULL,
    Ticket_id INT NOT NULL,
    Transaction_id INT NOT NULL,
	FOREIGN KEY (Ticket_id) REFERENCES Ticket(Ticket_id)
);

CREATE TABLE Ticket (
	Ticket_id INT PRIMARY KEY NOT NULL,
    Event_id INT,
	Fare DECIMAL NOT NULL,
    FOREIGN KEY (Event_id) REFERENCES Event_(Event_id)
);

INSERT INTO Users (User_id, Username, name, email, password, Contact_no)
VALUES 
(1, 'john_doe', 'John Doe', 'john@example.com', 'password123', '9876543210'),
(2, 'jane_smith', 'Jane Smith', 'jane@example.com', 'password456', '8765432109');

INSERT INTO Movies (Movie_id, Movie_name, Movie_genre, Movie_synopsis, Movie_rating, Movie_review, Movie_language, Movie_released_date, Movie_time, Movie_comments, Movie_cast, Movie_crew)
VALUES 
(1, 'Inception', 'Sci-Fi', 'A thief who steals corporate secrets...', 8.8, 9.0, 'English', '2010-07-16', '2024-09-15 19:00:00', 'Great movie!', 'Leonardo DiCaprio', 'Christopher Nolan');


INSERT INTO Location (Location_id, Building_name, Pincode, Landmark, city)
VALUES 
(1, 'Mall A', 560001, 'Near Metro Station', 'Bangalore'),
(2, 'Mall B', 110001, 'Near Park', 'Delhi');


INSERT INTO Theatre (Theatre_id, Theatre_name, Location_id)
VALUES 
(1, 'PVR Cinemas', 1),
(2, 'Cinepolis', 2);

INSERT INTO SeatMap (Seat_id, Row_id, Column_id, Screen_id)
VALUES 
(1, 1, 'A', 1),
(2, 1, 'B', 1);

INSERT INTO Screen (Screen_id, Movie_id, Movie_name, Start_time, End_time)
VALUES 
(1, 1, 'Inception', '19:00:00', '21:30:00');


INSERT INTO Event_ (Event_id, Event_name, Event_host, Event_Artist, Event_Timing, Event_type, Event_desc, Event_language, Event_comments, Event_age_grp, Location_id, Event_charge, Ticket_id, TermNCondition)
VALUES 
(1, 'Music Concert', 'John', 'Band XYZ', '2024-09-20 18:00:00', 'Concert', 'A live music event...', 'English', 'Exciting!', 18, 1, 500.00, 1, 'No refunds.');

INSERT INTO Stream_ (Stream_id, Movie_id)
VALUES 
(1, 1);

INSERT INTO Sports (Sports_id, Event_id)
VALUES 
(1, 1);

INSERT INTO Offer (Offer_id, Offer_code, Description_, Discount_amount, Start_date, End_date, Applicable_to)
VALUES 
(1, 'SAVE100', 'Flat Rs.100 off on tickets', 100.00, '2024-09-01', '2024-09-30', 'All');

INSERT INTO GiftCards (GiftCard_id, card_number, pin_code, Balance, Issued_to, Issued_by, Issue_date, Expiry_date)
VALUES 
(1, 'GC12345', '1234', 1000.00, 'John Doe', 'Jane Smith', '2024-09-01', '2025-09-01');

INSERT INTO ListYourShow (Show_id, Individual_name, PAN_Card_No, Individual_Address, Bank_detail_id)
VALUES 
(1, 'John Organizer', 123456789, '123 Street, City', 1);

INSERT INTO Bank_detail (Bank_detail_id, Bank_Name, Bank_IFSC, Beneficiary_Name, Account_Type, Account_no)
VALUES 
(1, 'HDFC Bank', 'HDFC0001234', 'John Doe', 'Savings', 9876543210);

INSERT INTO Booking (Booking_id, Ticket_id, Transaction_id)
VALUES 
(1, 1, 101);

INSERT INTO Ticket (Ticket_id, Event_id, Fare)
VALUES 
(1, 1, 500.00);

ALTER TABLE SeatMap ADD COLUMN Seat_status VARCHAR(10) DEFAULT 'vacant';

UPDATE SeatMap
SET Seat_status = 'Booked'
WHERE Seat_id = 2;

SELECT Seat_id, Row_id, Column_id
FROM SeatMap
WHERE Screen_id = 2
AND Seat_status = 'vacant';

describe SeatMap;

describe Movies;
