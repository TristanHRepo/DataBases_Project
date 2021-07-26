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

-- Users Table
CREATE TABLE Users (
userID int NOT NULL AUTO_INCREMENT PRIMARY KEY,
first varchar(255) NOT NULL,
last varchar(255) NOT NULL,
email varchar(255) NOT NULL,
location varchar(255),
picture varbinary(8000));

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


-- Care Insertions
INSERT INTO Care
VALUES (1, "Once a week", "06:00:00", 75, "high", "10-10-10 N, P, K", "Well draining, not acidic");

INSERT INTO Care
VALUES (2, "Every 2 weeks", "06:00:00", 70, "low", "15-15-15 N, P, K", "Quick draining");

INSERT INTO Care
VALUES (3, "Every 1 to 2 weeks", "05:00:00", 80, "high", "10-10-10 N, P, K", "Slightly acidic");

INSERT INTO Care
VALUES (4, "Every 3 weeks", "06:00:00", 75, "low", "10-10-10 N, P, K", "Quick draining");

INSERT INTO Care
VALUES (5, "Once a month", "06:00:00", 80, "low", "5-10-10 N, P, K", "Quick draining");

INSERT INTO Care
VALUES (6, "Every 1 to 2 weeks", "08:00:00", 80, "high", "20-20-20 N, P, K", "Well draining, nutrient dense");

INSERT INTO Care
VALUES (7, "Every 3 to 4 days", "08:00:00", 80, "medium", "10-5-5 N, P, K", "Nutrient dense, include loam");

INSERT INTO Care
VALUES (8, "Every 1 to 2 weeks", "06:00:00", 80, "low", "10-10-10 N, P, K", "Quick draining");

INSERT INTO Care
VALUES (9, "Submerge in water 30 minutes once a week", "08:00:00", 80, "high", "17-8-22 N, P, K", "No soil");


-- Plant Insertions

-- Ficus Tineke
INSERT INTO Plants (plantID, commonName, scienceName, type, color, variegated, petSafe, maxSize, careID)
VALUES (1, "Ficus Tineke", "Ficus elastica", "Foliage", "Green and White", TRUE, FALSE, "8 feet indoors", 1);

-- Burgundy Rubber Tree
INSERT INTO Plants (plantID, commonName, scienceName, type, color, variegated, petSafe, maxSize, careID)
VALUES (2, "Burgundy Rubber Tree", "Ficus elastica", "Foliage", "Dark Green", FALSE, FALSE, "6 feet indoors", 1);

-- Jade
INSERT INTO Plants (plantID, commonName, scienceName, type, color, variegated, petSafe, maxSize, careID)
VALUES (3, "Ogre Ear Jade", "Crassula Ovata", "Succulent", "Green", FALSE, FALSE, "5 feet indoors", 2);

-- String of Buttons
INSERT INTO Plants (plantID, commonName, scienceName, type, color, variegated, petSafe, maxSize, careID)
VALUES (4, "String of Buttons", "Crassula Perforata", "Succulent", "Green", FALSE, TRUE, "18 inches indoors", 2);

-- Prayer Plant
INSERT INTO Plants (plantID, commonName, scienceName, type, color, variegated, petSafe, maxSize, careID)
VALUES (5, "Red Maranta Prayer Plant", "Marantha Erythroneura", "Foliage", "Green and Red", FALSE, TRUE, "12 inches indoors", 3);

-- Neon Pothos
INSERT INTO Plants (plantID, commonName, scienceName, type, color, variegated, petSafe, maxSize, careID)
VALUES (6, "Neon Pothos", "Epipremnum aureum", "Foliage", "Neon Green", FALSE, FALSE, "10 feet long indoors", 3);

-- String of Pearls
INSERT INTO Plants (plantID, commonName, scienceName, type, color, variegated, petSafe, maxSize, careID)
VALUES (7, "String of Pearls", "Senecio rowleyanus", "Succulent", "Green", FALSE, FALSE, "6 feet long indoors", 4);

-- Burros Tail
INSERT INTO Plants (plantID, commonName, scienceName, type, color, variegated, petSafe, maxSize, careID)
VALUES (8, "Burros Tail", "Sedum morganianum", "Succulent", "Light Green-Blue", FALSE, TRUE, "6 feet long indoors", 4);

-- Crested Cactus
INSERT INTO Plants (plantID, commonName, scienceName, type, color, variegated, petSafe, maxSize, careID)
VALUES (9, "Crested Mexican Fence Post", "Pachycereus marginatus f. cristata", "Cactus", "Dark Green", FALSE, TRUE, "7 feet tall", 5);

-- Monstera Deliciosa
INSERT INTO Plants (plantID, commonName, scienceName, type, color, variegated, petSafe, maxSize, careID)
VALUES (10, "Swiss Cheese Plant", "Monstera Deliciosa", "Foliage", "Dark Green", FALSE, FALSE, "15 feet tall indoors", 6);

-- Wandering Jew
INSERT INTO Plants (plantID, commonName, scienceName, type, color, variegated, petSafe, maxSize, careID)
VALUES (11, "Wandering Jew Plant", "Tradescantia zebrina", "Foliage", "Dark Green, Silver, and Purple", FALSE, FALSE, "12 inches tall, 24 inches wide indoors", 7);

-- Black Rose Aeonium
INSERT INTO Plants (plantID, commonName, scienceName, type, color, variegated, petSafe, maxSize, careID)
VALUES (12, "Black Rose Aeonium", "Aeonium arboreum Zwartkop", "Succulent", "Dark Red-Purple", FALSE, TRUE, "4 feet indoors", 2);

-- Pony Tail Palm
INSERT INTO Plants (plantID, commonName, scienceName, type, color, variegated, petSafe, maxSize, careID)
VALUES (13, "Pony Tail Palm", "Beaucarnea recurvata", "Palm", "Light Green", FALSE, TRUE, "4 feet indoors", 8);

-- Air Plant
INSERT INTO Plants (plantID, commonName, scienceName, type, color, variegated, petSafe, maxSize, careID)
VALUES (14, "Giant Air Plant", "Tillandsia xerographica", "Air Plant", "Light Green-Grey", FALSE, TRUE, "3 feet indoors", 9);

-- Money Tree
INSERT INTO Plants (plantID, commonName, scienceName, type, color, variegated, petSafe, maxSize, careID)
VALUES (15, "Money Tree", "Pachira aquatica", "Foliage", "Light Green", FALSE, TRUE, "6 feet indoors", 3);


-- Users Inserts


-- Rose Hoopla
INSERT INTO Users (first, last, email, location)
VALUES ("Rose", "Hoopla", "RoseyRose@gmail.com", "Nashville, TN");

-- Pepper Ridge
INSERT INTO Users (first, last, email, location)
VALUES ("Pepper", "Ridge", "PepperRidgeFarms@gmail.com", "Norwalk, CT");

-- Georgia Peach
INSERT INTO Users (first, last, email, location)
VALUES ("Georgia", "Peach", "PeachesAreYummy@gmail.com", "Atlanta, GA");

-- Lenny Pepperbottom
INSERT INTO Users (first, last, email, location)
VALUES ("Lenny", "Pepperbottom", "AspenTrees@gmail.com", "The Forest, USA");


-- Guides Inserts


-- Introduction to Neature 
INSERT INTO Guides (title, video, description, userID)
VALUES ("Introduction to Neature", "https://www.youtube.com/watch?v=Hm3JodBR-vs", "Hi, this is my introduction to what neature is", 4);

-- Hacks for Growing Plants
INSERT INTO Guides (title, video, description, userID)
VALUES ("18 Hacks to the Bets Plants Evar", "https://www.youtube.com/watch?v=_rAF-RWDJWI", "This has no clickbait whatso ever", 1);

-- Introduction to Neature 2
INSERT INTO Guides (title, video, description, userID)
VALUES ("Introduction to Neature 2", "https://www.youtube.com/watch?v=a_C18uAZHdo", "Hi, this is my second introduction to what neature is", 4);

-- Pony Tail Palm Guide
INSERT INTO Guides (title, video, description, plantID, userID)
VALUES ("How to Care for a Pony Tail Palm", "https://www.youtube.com/watch?v=kKwl0DI1MzA", "Pony Tail Palms are beutiful and I love them, here is how you care for them!", 13, 2);

-- Money Tree Guide (text only)
INSERT INTO Guides (title, description, plantID, userID)
VALUES ("Lenny's Guide to Making Money Trees", "Have you ever wanted to grow money? Well here is how you do it. 
1. Plant a Ben Frank. 
2. Water your Ben Frank with liquid gold
3. As it grow, trim off the 1 dollar bills, those are not very useful
4. Make sure you cover it, rain water is not good for Money Trees
5. Reap your Rewards", 15, 4);


-- Experts Inserts


-- Succulents
INSERT INTO Experts (tagName, TagDescription)
VALUES ("Expert of Succulents", "This is someone who has credentials and has proven themselves to have expertise in the field of succulents");

-- Cacti
INSERT INTO Experts (tagName, TagDescription)
VALUES ("Expert of Cacti", "This is someone who has credentials and has proven themselves to have expertise in the field of cacti");

-- Foliage
INSERT INTO Experts (tagName, TagDescription)
VALUES ("Expert of Foliage", "This is someone who has credentials and has proven themselves to have expertise in the field of foliage");

-- Palm
INSERT INTO Experts (tagName, TagDescription)
VALUES ("Expert of Palms", "This is someone who has credentials and has proven themselves to have expertise in the field of palms");

-- Superior Mastermind of Plants
INSERT INTO Experts (tagName, TagDescription)
VALUES ("Superior Mastermind of Plants", "There can only be one.");



-- UserExpert Inserts


-- Pepper Ridge expert in palms
INSERT INTO UserExpert (userID, expertID)
VALUES (2, 4);

-- Pepper Ridge expert in Succulents
INSERT INTO UserExpert (userID, expertID)
VALUES (2, 1);

-- Lenny Pepperbottom expert in Superior Mastermind of Plants
INSERT INTO UserExpert (userID, expertID)
VALUES (4, 5);



-- PlantsOwned Inserts


-- Pepper Ridge owns Pony Tail Palm
INSERT INTO PlantsOwned (userID, plantID)
VALUES (2, 13);

-- Pepper Ridge owns Black Rose Aeonium
INSERT INTO PlantsOwned (userID, plantID)
VALUES (2, 12);

-- Pepper Ridge owns Jade
INSERT INTO PlantsOwned (userID, plantID)
VALUES (2, 3);

-- Lenny Pepperbottom owns Money Tree
INSERT INTO PlantsOwned (userID, plantID)
VALUES (4, 15);