-- Users Table
CREATE TABLE Users (
userID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
first varchar(255) NOT NULL,
last varchar(255) NOT NULL,
email varchar(255) NOT NULL,
location varchar(255),
picture varbinary(8000)
);

-- Experts Table
CREATE TABLE Experts (
expertID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
tagName varchar(255) NOT NULL,
tagDescription varchar(255) NOT NULL
);

-- Care Table
CREATE TABLE Care (
careID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
water varchar(255) NOT NULL,
light time NOT NULL,
temperature int NOT NULL,
humidity varchar(255),
fertilizer varchar(255),
soil varchar(255)
);

-- Plants Table
CREATE TABLE Plants (
plantID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
commonName varchar(255) NOT NULL,
scienceName varchar(255),
type varchar(255),
color varchar(255),
variegated boolean,
petSafe boolean,
maxSize varchar(255),
picture varbinary(8000),
careID int,
FOREIGN KEY (careID) REFERENCES Care(careID)
);

-- Guides Table
CREATE TABLE Guides (
guideID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
title varchar(255) NOT NULL,
video varchar(255),
description text(255) NOT NULL,
plantID int,
userID int NOT NULL,
FOREIGN KEY (plantID) REFERENCES Plants(plantID),
FOREIGN KEY (userID) REFERENCES Users(userID)
);

-- PlantsOwned Table
CREATE TABLE PlantsOwned (
userID int NOT NULL,
plantID int NOT NULL,
FOREIGN KEY (userID) REFERENCES Users(userID),
FOREIGN KEY (plantID) REFERENCES Plants(plantID)
);

-- UserExpert Table
CREATE TABLE UserExpert (
userID int NOT NULL,
expertID int NOT NULL,
FOREIGN KEY (userID) REFERENCES Users (userID),
FOREIGN KEY (expertID) REFERENCES Experts (expertID)
);