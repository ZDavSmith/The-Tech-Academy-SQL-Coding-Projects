USE TechLibrary
Go
CREATE PROCEDURE Tech_Academy_Library
AS
BEGIN

CREATE DATABASE Tech_Academy_Library


CREATE TABLE tbl_Library_Branch (
BranchID INT PRIMARY KEY NOT NULL IDENTITY(1, 1),
BranchName VARCHAR(50) NOT NULL,
Address VARCHAR(50) NOT NULL
);

SELECT * FROM tbl_Library_Branch

/* CARDNUMBERS START AT 300 */
CREATE TABLE tbl_Borrower (
CardNo INT PRIMARY KEY NOT NULL IDENTITY (300, 1),
Name VARCHAR(50) NOT NULL,
Address VARCHAR(50) NOT NULL,
Phone VARCHAR(12) NOT NULL,
);

SELECT * FROM tbl_Borrower


CREATE TABLE tbl_Publisher (
PublisherName VARCHAR(20) PRIMARY KEY NOT NULL,
Address VARCHAR(50) NOT NULL,
Phone VARCHAR(12) NOT NULL,
);

/* BOOK IDs START AT 5000 */
CREATE TABLE tbl_Books (
BookID INT PRIMARY KEY NOT NULL IDENTITY (5000,1),
Title VARCHAR (30) NOT NULL,
PublisherName VARCHAR(20) NOT NULL CONSTRAINT fk_PublisherNAME FOREIGN KEY REFERENCES tbl_Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE,
);


CREATE TABLE tbl_Book_Copies (
BookID INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES tbl_Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
BranchID INT NOT NULL CONSTRAINT fk_BranchID2 FOREIGN KEY REFERENCES tbl_Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
Number_Of_Copies INT NOT NULL
);

SELECT * FROM tbl_Book_Copies




CREATE TABLE tbl_Book_Loans (
BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES tbl_Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES tbl_Library_Branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES tbl_Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
DateOut DATE NOT NULL,
DateDue DATE NOT NULL
);

SELECT * FROM tbl_Book_Loans




CREATE TABLE tbl_Book_Authors (
BookID INT NOT NULL CONSTRAINT fk_BookID3 FOREIGN KEY REFERENCES tbl_Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
AuthorName VARCHAR(40) NOT NULL
);

/* ==================
DATA FOR THE TABLES 
=====================*/

INSERT INTO tbl_Library_Branch 
(BranchName, Address)
VALUES
('Sharpstown', '672 Johnstown Lane'),
('Central', '9231 BooksForLife Ave.'),
('Middle', '903 LavenderTown Rd.'),
('Brockgym', '9032 Clarksburg Ave.')
;

SELECT * FROM tbl_Library_Branch

INSERT INTO tbl_Publisher
(PublisherName, Address, Phone)
VALUES
('We Publish Books','432 Jamestown Ave','3932349021'),
('Scary Publishers','893 Haunted Lane','4320949302'),
('Publish Inc.','2313 Wall St.','8932900009'),
('Life Publishers','89 Lavenshire Rd.','3871234213'),
('DeadWeight Pub.','792 Road Rd.','3213213213'),
('DontBlameUs Pub.','892 All the Blame Ave.','9013214321'),
('CaveALife.Inc','892 Blame of All Rd.','9031234443'),
('Queen Publish','091 Lavishville St.','89035482054'),
('RefusetoPublish','999 Denial Lane','4821235412'),
('NoRefundsPublisher','234 David Rd.','8888888880')
;

SELECT * FROM tbl_Publisher

INSERT INTO tbl_Books
(Title, PublisherName)
VALUES
('The Lost Tribe', 'We Publish Books'),
('It', 'Scary Publishers'), 
('Misery', 'Publish Inc.'),
('The Lightning Thief','Publish Inc.'),
('The Sea of Monsters','Publish Inc.'),
('Living Life','Life Publishers'),
('Life of the Dead','DeadWeight Pub.'),
('How to Trian Your Spouse','DontBlameUs Pub.'),
('Hair Gel for the Cave Man','CaveALife.Inc'),
('The Book','We Publish Books'),
('The Book 2','We Publish Books'),
('The Book 3 - The Final Chapter','We Publish Books'),
('Kings','Queen Publish'),
('Queens','Queen Publish'),
('Publishers for the UnPublished','RefusetoPublish'),
('Borrow Me','NoRefundsPublisher'),
('How to Save Money','NoRefundsPublisher'),
('Guitars and Solos','Scary Publishers'),
('The Even More Lost Tribe','We Publish Books'),
('Running out of Ideas','CaveALife.Inc')
;


SELECT * FROM tbl_Books


INSERT INTO tbl_Book_Authors
(BookID, AuthorName)
VALUES
(5001,'Mark Lee'),
(5002,'Stephen King'),
(5003,'Stephen King'),
(5004,'Rick Riordan'),
(5005,'Rick Riordan'),
(5006,'Samuel Jane'),
(5007,'Jenn Maze'),
(5008,'Larry Kuz'),
(5009,'Samuel Jane'),
(5010,'Dennis Kade'),
(5011,'Dennis Kade'),
(5012,'Dennis Kade'),
(5013,'Jordan Smith'),
(5014,'Jordan Smith'),
(5015,'Dale Johnson'),
(5016,'Eric Weaver'),
(5017,'Eric Weaver'),
(5018,'Stephen James'),
(5019,'Dennis Kade'),
(5020,'Jules Lek')
;

SELECT * FROM tbl_Book_Authors


INSERT INTO tbl_Book_Copies 
(BookID, BranchID, Number_Of_Copies)
VALUES
(5001, 1, 4),
(5001, 4, 3),
(5001, 2, 2),
(5002, 1, 3),
(5002, 2, 4),
(5002, 3, 4),
(5003, 1, 2),
(5003, 2, 3),
(5003, 3, 5),
(5004, 2, 3),
(5004, 4, 2),
(5005, 3, 4),
(5006, 2, 2), 
(5007, 1, 3),
(5007, 2, 4),
(5007, 4, 2),
(5008, 3, 4),
(5008, 4, 3),
(5009, 1, 3),
(5009, 2, 2),
(5009, 4, 4),
(5010, 1, 2),
(5010, 2, 4),
(5010, 3, 3),
(5010, 4, 10),
(5011, 1, 2),
(5012, 3, 3),
(5012, 1, 5),
(5013, 1, 3),
(5013, 2, 4),
(5013, 3, 2),
(5013, 4, 6),
(5014, 1, 3),
(5014, 3, 2),
(5014, 2, 5),
(5014, 4, 2),
(5015, 1, 3),
(5015, 2, 3),
(5015, 3, 3),
(5015, 4, 3),
(5016, 1, 2),
(5016, 2, 2),
(5016, 3, 2),
(5016, 4, 2),
(5017, 1, 5),
(5017, 2, 4),
(5017, 3, 3),
(5017, 4, 2),
(5018, 2, 4),
(5019, 1, 2),
(5019, 4, 2),
(5019, 3, 5)
;

SELECT * FROM tbl_Book_Copies

INSERT INTO tbl_Book_Loans
(BookID, BranchID, CardNo, DateOut, DateDue)
VALUES
('5001','1','300','2019-08-04','2019-09-04'), 
('5001','1','302','2019-07-12','2019-08-12'),
('5001','2','303','2019-08-04','2019-09-04'),
('5001','4','304','2019-07-12','2019-08-12'),
('5002','2','303','2019-08-04','2019-09-04'),
('5002','2','305','2019-08-04','2019-09-04'),
('5002','2','306','2019-07-22','2019-08-22'),
('5002','2','308','2019-08-01','2019-09-01'),
('5003','1','307','2019-08-04','2019-09-04'),
('5003','1','310','2019-08-04','2019-09-04'),
('5003','3','311','2019-08-04','2019-09-04'),
('5003','3','309','2019-08-04','2019-09-04'),
('5019','1','300','2019-07-13','2019-08-13'),
('5017','1','300','2019-07-29','2019-08-29'),
('5014','1','300','2019-07-26','2019-08-26'),
('5015','1','300','2019-07-23','2019-08-23'),
('5017','1','300','2019-07-04','2019-08-04'),
('5012','1','300','2019-07-15','2019-08-15'),
('5005','3','300','2019-08-03','2019-09-03'),
('5007','1','307','2019-07-22','2019-08-22'),
('5007','4','304','2019-07-12','2019-08-12'),
('5007','2','306','2019-07-13','2019-08-13'),
('5007','4','302','2019-07-22','2019-08-22'),
('5007','4','303','2019-07-12','2019-08-12'),
('5008','3','305','2019-07-07','2019-08-07'),
('5014','2','306','2019-07-22','2019-08-22'),
('5014','3','309','2019-07-07','2019-08-07'),
('5014','1','307','2019-07-15','2019-08-15'),
('5017','2','312','2019-07-07','2019-08-07'),
('5008','4','312','2019-07-12','2019-08-12'),
('5016','2','312','2019-07-13','2019-08-13'),
('5011','1','306','2019-07-07','2019-08-07'),
('5013','1','307','2019-07-12','2019-08-12'),
('5012','3','312','2019-07-15','2019-08-15'),
('5008','4','304','2019-07-07','2019-08-07'),
('5011','3','301','2019-07-12','2019-08-12'),
('5008','3','303','2019-06-01','2019-07-01'),
('5009','4','311','2019-07-22','2019-08-22'),
('5016','2','311','2019-07-15','2019-08-15'),
('5009','4','304','2019-08-01','2019-09-01'),
('5016','3','309','2019-07-26','2019-08-26'),
('5017','1','311','2019-07-22','2019-08-22'),
('5008','3','309','2019-07-12','2019-08-12'),
('5009','4','305','2019-08-03','2019-09-03'),
('5009','2','306','2019-07-12','2019-08-12'),
('5013','4','304','2019-08-03','2019-09-03'),
('5016','1','307','2019-07-15','2019-08-15'),
('5017','3','309','2019-08-03','2019-09-03'),
('5019','1','305','2019-08-01','2019-09-01'),
('5019','4','304','2019-07-12','2019-08-12'),
('5010','4','303','2019-07-12','2019-08-12'),
('5010','4','302','2019-07-26','2019-08-26'),
('5010','4','308','2019-07-15','2019-08-15'),
('5010','4','309','2019-07-13','2019-08-13'),
('5010','4','300','2019-07-26','2019-08-26'),
('5010','4','310','2019-07-15','2019-08-15'),
('5010','4','304','2019-08-03','2019-09-03'),
('5010','4','311','2019-07-22','2019-08-22'),
('5010','4','307','2019-07-07','2019-08-07'),
('5010','4','306','2019-07-15','2019-08-15'),
('5010','2','305','2019-07-22','2019-08-22'), 
('5017','1','304','2019-07-05','2019-08-05')
;

SELECT * FROM tbl_Book_Loans

INSERT INTO tbl_Borrower
(Name, Address, Phone)
VALUES
('James Haven', '432 Johnstown Rd.', '4890234091'), 
('Jimmy Haven','433 Jamestown Rd.','3829280912'),
('John Haven', '431 Jimstown Rd.', '9430193290'),
('Jeff Stevens', '99 UltraBall Lane', '9012348952'),
('Loui Loi', '32 Loi Loui Rd.', '9021234592'),
('Jessie Ray', '489 Sawyers Ave.', '8900989083'),
('Steve John','123 Forest Ave.','3899823476'),
('Carrie Louis','8920 Storm Drive','3217839021'),
('Jason Kim','702 Audio Rd.','4839200192'),
('Terry Evans','710 Dillsburg St.','4213213214'),
('Bob Ross','610 StoneCold Lane','7109348902'),
('Julia Storm','82 Huffington St.','7829046781'),
('Andrea Heff','813 SumneyTown Pike','4389020000'),
('Tori Style','308 Dragon St.','3213214390'), 
('Jane Lek', '839 Mud Ave.', '1233333321')
;

SELECT * FROM tbl_Borrower
END
/* =============================
END INSERT LIBRARY DATA
BEGIN REQUESTED QUERIES
===============================*/


/* QUERY ONE */
CREATE PROCEDURE QUERY_ONE
AS 
BEGIN
SELECT a1.BranchName, a3.Number_Of_Copies, a3.BookID, a2.Title 
FROM
tbl_Library_Branch a1
INNER JOIN tbl_Book_Copies a3 ON a3.BranchID = a1.BranchID
INNER JOIN tbl_Books a2 ON a2.BookID = a3.BookID
WHERE
Title = 'The Lost Tribe' AND BranchName =  'Sharpstown'
;
END
/*QUERY TWO */
CREATE PROCEDURE QUERY_TWO
AS 
BEGIN
SELECT a1.BranchName, a3.Number_Of_Copies, a3.BookID, a2.Title
FROM
tbl_Library_Branch a1
INNER JOIN tbl_Book_Copies a3 ON a3.BranchID = a1.BranchID
INNER JOIN tbl_Books a2 ON a2.BookID = a3.BookID
WHERE
Title = 'The Lost Tribe'
;
END
/*QUERY THREE */
CREATE PROCEDURE QUERY_THREE
AS 
BEGIN
SELECT a1.Name, a1.CardNo, a2.BookID
FROM
tbl_Borrower a1
FULL OUTER JOIN tbl_Book_Loans a2 ON a2.CardNo = a1.CardNo
WHERE BookID IS NULL;
END
/*QUERY FOUR */

CREATE PROCEDURE QUERY_FOUR
AS 
BEGIN
SELECT a4.Name, a4.Address, a1.BranchName, a3.Title, a2.DateOut, a2.DateDue
FROM
tbl_Library_Branch a1
INNER JOIN tbl_Book_Loans a2 ON a2.BranchID = a1.BranchID
INNER JOIN tbl_Books a3 ON a3.BookID = a2.BookID
INNER JOIN tbl_Borrower a4 ON a4.CardNo = a2.CardNo
WHERE BranchName =  'Sharpstown' AND DATEDIFF(day, a2.DateDue, GETDATE()) = 0
;
END
/* QUERY FIVE */
CREATE PROCEDURE QUERY_FIVE
AS 
BEGIN
SELECT a1.BranchName, COUNT(BookID) AS 'Number Of Books Out'
FROM 
tbl_Library_Branch a1
INNER JOIN tbl_Book_Loans a2 ON a2.BranchID = a1.BranchID
GROUP BY BranchName;
END
/*QUERY SIX */
CREATE PROCEDURE QUERY_SIX
AS 
BEGIN
SELECT a1.Name, a1.Address, COUNT(a2.BookId) AS 'Number of Books Out'
FROM 
tbl_Book_Loans a2
INNER JOIN tbl_Borrower a1 ON a1.CardNo = a2.CardNo
GROUP BY a1.Name, a1.Address
HAVING COUNT(a2.BookID) >= 5
;
END
/*QUERY SEVEN */
CREATE PROCEDURE QUERY_SEVEN
AS 
BEGIN
SELECT a4.AuthorName, a3.Title, a1.BranchName, a2.Number_Of_Copies
FROM 
tbl_Library_Branch a1
INNER JOIN tbl_Book_Copies a2 ON a2.BranchID = a1.BranchID
INNER JOIN tbl_Books a3 ON a3.BookID = a2.BookID
INNER JOIN tbl_Book_Authors a4 ON a4.BookID = a3.BookID
WHERE a1.BranchName = 'Central' AND a4.AuthorName = 'Stephen King'
;
END