-- Switch to master and check if the database exists
USE master;
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'PoePart1')
BEGIN
    ALTER DATABASE PoePart1 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE PoePart1;
END
GO

-- Create the new database
CREATE DATABASE PoePart1;
GO

-- Set context to the new database
USE PoePart1;
GO

-- Table: Venue
CREATE TABLE Venue (
    VenueID INT PRIMARY KEY IDENTITY(1,1),
    VenueName VARCHAR(100) NOT NULL,
    Location VARCHAR(255) NOT NULL,
    Capacity INT NOT NULL
);
GO

-- Table: [Event] (use square brackets to avoid reserved keyword issue)
CREATE TABLE [Event] (
    EventID INT PRIMARY KEY IDENTITY(1,1),
    EventName VARCHAR(100) NOT NULL,
    EventDate DATE NOT NULL,
    Description TEXT
);
GO

-- Table: Booking
CREATE TABLE Booking (
    BookingID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    SecondName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    MobileNumber VARCHAR(20) NOT NULL,
    PaymentDetails VARCHAR(255) NOT NULL,
    EventID INT FOREIGN KEY REFERENCES [Event](EventID),
    VenueID INT FOREIGN KEY REFERENCES Venue(VenueID)
);
GO

-- Table: Home (contact details)
CREATE TABLE Home (
    HomeID INT PRIMARY KEY IDENTITY(1,1),
    PhoneNumber1 VARCHAR(20) NOT NULL,
    PhoneNumber2 VARCHAR(20),
    Email VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL
);
GO

-- Table: Privacy (site privacy policy content)
CREATE TABLE Privacy (
    PrivacyID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(100) NOT NULL,
    PolicyText TEXT NOT NULL,
    LastUpdated DATE NOT NULL
);
GO

-- Insert sample data into Home
INSERT INTO Home (PhoneNumber1, PhoneNumber2, Email, Address)
VALUES ('+27 5543 1256', '+27 3456 7890', 'easeVenue@gmail.com', '772 Bodenstein, Boksburg, Gauteng');
GO

-- Insert sample data into Privacy
INSERT INTO Privacy (Title, PolicyText, LastUpdated)
VALUES (
    'Privacy Policy',
    'We respect your privacy. All user data is stored securely and will not be shared with third parties without consent.',
    '2025-01-15'
);
GO

-- Insert sample venues
INSERT INTO Venue (VenueName, Location, Capacity)
VALUES 
('Grand Hall', 'Pretoria', 250),
('Sunset Arena', 'Johannesburg', 500),
('Ocean View Venue', 'Cape Town', 300);
GO

-- Insert sample events
INSERT INTO [Event] (EventName, EventDate, Description)
VALUES 
('Music Festival', '2025-06-15', 'A full-day outdoor music experience.'),
('Tech Conference', '2025-07-22', 'Annual gathering of tech innovators.'),
('Wedding Expo', '2025-08-05', 'Showcasing the latest in wedding trends.');
GO

-- Insert sample bookings
INSERT INTO Booking (FirstName, SecondName, Email, MobileNumber, PaymentDetails, EventID, VenueID)
VALUES 
('Alice', 'Nkosi', 'alice.nkosi@example.com', '+27 7654 3210', 'Paid via credit card', 1, 1),
('Brian', 'Mokoena', 'brian.mokoena@example.com', '+27 8123 4567', 'Paid via EFT', 2, 2),
('Thandi', 'Dlamini', 'thandi.dlamini@example.com', '+27 7987 6543', 'Paid via PayPal', 3, 3);
GO

-- View inserted data
SELECT * FROM Home;
SELECT * FROM Privacy;
SELECT * FROM Venue;
SELECT * FROM [Event];
SELECT * FROM Booking;
GO
