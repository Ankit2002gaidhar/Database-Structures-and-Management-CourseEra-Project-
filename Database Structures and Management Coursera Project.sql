-- Task 1: Filter data using the WHERE clause and logical operators.
-- Create an SQL statement to print all records from the Bookings table for the dates of the following bookings using the BETWEEN operator: 
-- 2021-11-11, 
-- 2021-11-12, 
-- and 2021-11-13. 

Select * from bookings where bookingdate between '2021-11-11' and '2021-11-13';

-- Task 2: Create a JOIN query.
-- Create a JOIN SQL statement on the Customers and Bookings tables. The statement must print the customers full names and related bookings IDs from the date 2021-11-11.  

Select customers.FullName,Bookings.BookingID 
from customers 
right join bookings
on customers.CustomerID=bookings.CustomerID
where BookingDate='2021-11-11';

-- Task 3: Create a GROUP BY query.
-- Create a SQl statement to print the bookings dates from Bookings table. The statement must show the total number of bookings placed on each of the printed dates using the GROUP BY BookingDate.

Select BookingDate, Count(BookingDate)
from Bookings 
Group By BookingDate;

-- Task 4:  Create a REPLACE statement.
-- Create a SQL REPLACE statement that updates the cost of the Kabsa course from $17.00 to $20.00. 

REPLACE INTO Courses (CourseName,Cost) Values ("Kabasa",20.00);

-- Task 5 solution:  Create constraints
-- Create a new table called "DeliveryAddress" in the Little Lemon database with the following columns and constraints:
-- ID: INT PRIMARY KEY
-- Address: VARCHAR(255) NOT NULL
-- Type: VARCHAR(100) NOT NULL DEFAULT "Private"
-- CustomerID: INT NOT NULL FOREIGN KEY referencing CustomerID in the Customers table

Create Table DeliveryAddress(
ID INT PRIMARY KEY,
Address VARCHAR(255) NOT NULL,
TYPE VARCHAR(100) NOT NULL DEFAULT "Private",
CustomerID INT NOT NULL,
FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)); 

-- Task 6: Create an ALTER TABLE statement
-- Create a SQL statement that adds a new column called 'Ingredients' to the Courses table.
-- Ingredients: VARCHAR(255)

Alter Table courses add column  Ingredients Varchar(255);

-- Task 7: Create a subquery
-- Create a SQL statement with a subquery that prints the full names of all customers who made bookings in the restaurant on the following date: 2021-11-11.

Select FullName 
from customers 
where
(Select CustomerID from Bookings 
Where Customers.CustomerID=Bookings.CustomerID and BookingDate="2021-11-11" ); 

-- Task 8: Create a virtual table
-- Create the "BookingsView" virtual table to print all bookings IDs, bookings dates and the number of guests for bookings made in the restaurant before 2021-11-13 and where the number of guests is larger than 3.

Create view BookingsView As
 Select BookingID,
 BookingDate,
 NumberOfGuests
 FROM BOOKINGS 
 WHERE NumberOfGuests>3 and BookingDate<"2021-11-13";
 
 -- Task 9: Task 9 solution: Create a stored procedure
-- Create a stored procedure called 'GetBookingsData'. The procedure must contain one date parameter called "InputDate". This parameter retrieves all data from the Bookings table based on the user input of the date.

Create PROCEDURE GetBookingsData(InputDate Date)
Select * from Bookings 
where BookingDate=InputDate;

Call GetBookingsData("2021-11-13");

-- Task 10: Use the String function
-- Create a SQL SELECT query using the appropriate MySQL string function to list "Booking Details" including booking ID, booking date and number of guests. The data must be listed in the same format as the following example:
-- ID: 10, Date: 2021-11-10, Number of guests: 5

Select concat("ID: ", BookingID,',Date: ', BookingDate,', Number of guests : ', NumberOfGuests) as "Booking Details" From Bookings;
