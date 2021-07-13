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




