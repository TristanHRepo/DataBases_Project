-- : character being used to denote the variables that will have data from the backend programming language

------------------------------

-- PLANT ENTITY QUERIES

-- (READ/SELECT) Get all Plants to populate on the plant page so users can browse plants
SELECT * FROM Plants;

-- (READ/SELECT) Get Plants that match results from search filter
SELECT * FROM Plants WHERE type = :plant_type_selected_from_radio_buttons AND commonName = :name_entered_in_search_bar
OR scienceName = :name_entered_in_search_bar;

-- (CREATE/INSERT) Insert a new plant into the plants table using the form
INSERT INTO Plants 
VALUES (:commonName_from_form, 
:scienceName_from_form, 
:type_from_form,
:color_from_form,
:variegated_from_form,
:petSafe_from_form,
:maxSize_from_form,
:careID_from_form);

-- (UPDATE) Update a plant entity
UPDATE `Plants` SET commonName = :commonName_from_form, scienceName = :scienceName_from_form, type = :type_from_form,
color = :color_from_form, variegated = :variegated_from_form, petSafe = :petSafe_from_form,
maxSize = :maxSize_from_form, careID = :careID_from_form WHERE plantID = :plantid_selected

-- (DELETE) Delete a plant entity from the table
DELETE FROM `Plants` WHERE plantID = :plantid_selected_from_table

-- (READ/SELECT) Gather all care plans for drop down menu
SELECT careID FROM `Care`

------------------------------

-- CARE ENTITY QUERIES

-- (READ/SELECT) Get the Care requirements for the Plant that a user clicks on
SELECT * FROM Care

-- (CREATE/INSERT) Insert new care requirements into Care table
INSERT INTO Care
VALUES (:water_from_form,
:light_from_form,
:temperature_from_form,
:humidity_from_form,
:fertilizer_from_form,
:soil_from_form);

-- (UPDATE) Update a plant entity
UPDATE `Care` SET water = :water_from_form, light = CAST(:light_from_form AS time),
temperature = CAST(:temperature_from_form AS int), humidity = :humidity_from_form, fertilizer = :fertilizer_from_form,
soil = :soil_from_form WHERE careID = careID_selected

-- (DELETE) Delete a plant entity from the table
DELETE FROM `Care` WHERE careID = :careID_from_form

------------------------------

-- USERS ENTITY QUERIES

--(READ/SELECT) Get the information about the current user and display it on page
SELECT * FROM Users

--(CREATE/INSERT) Register as a new user inserts into the Users table
INSERT INTO Users (first, last, email, location)
VALUES (:fname_from_form, 
:lname_from_form, 
:email_from_form, 
:location_from_form);

--(UPDATE) Updates the users information
UPDATE `Users` SET first = :fname_from_form, last = :lname_from_form, email = :email_from_form,
location = :location_from_form WHERE userID = :userid_selected

--(DELETE) Deletes a user from the database
DELETE FROM `Users` WHERE userID = :userid_selected

------------------------------

-- GUIDES ENTITY QUERIES

--(READ/SELECT) Get the Guides
SELECT * FROM Guides;

--(CREATE/INSERT) Insert a new guide into the Guides table
INSERT INTO Guides (title, video, description, plantID, userID)
VALUES (:title_from_form, :video_from_form, :description_from_form, :plantid_from_form, :user_id_from_form);

--(UPDATE) Updates the guides information
UPDATE `Guides` SET title = :title_from_form, video = :video_from_form, description = :description_from_form,
plantid = CAST(:plantid_from_form AS int), userid = CAST(:user_id_from_form AS int) WHERE guideID = :guideid_selected

--(DELETE) Deletes a guide from the database
DELETE FROM `Guides` WHERE guideID = :guideid_selected

-- (READ/SELECT) Gather all users for drop down menu
SELECT userID, first, last FROM `Users`

-- (READ/SELECT) Gather all plants for drop down menu
SELECT plantID, commonName FROM `Plants`

------------------------------

-- EXPERTS ENTITY QUERIES

-- (READ/SELECT) Display Expert tags
SELECT * FROM Experts

--(CREATE/INSERT) Insert into the experts table
INSERT INTO Experts (tagName, tagDescription)
VALUES (:tag_name_from_form, :tag_description_from_form);

--(UPDATE) Updates the expert information
UPDATE `Experts` SET tagName = :tag_name_from_form, tagDescription = :tag_description_from_form
WHERE expertID = :expertid_selected

--(DELETE) Deletes a type of expert fromt he database
DELETE FROM `Experts` WHERE expertID = :expertid_selected

------------------------------

-- PLANTSOWNED ENTITY QUERIES

--(READ/SELECT) Get the information about the current plants owned by users and display it on page
SELECT * FROM `PlantsOwned`;

--(CREATE/INSERT) Adds a plant to be owned by a user
INSERT INTO `PlantsOwned` (userID, plantID) VALUES (:userid_from_form, :plantid_from_form)

--(UPDATE) Updates the PlantsOwned information
UPDATE `PlantsOwned` SET userID = :userid_from_form, plantID = :plantid_from_form
WHERE userID = :userid_from_form AND plantID = :plantid_from_form

--(DELETE) Deletes a plant that the user owns from the PlantsOwned table
DELETE FROM `PlantsOwned` WHERE userID = :userid_from_form AND plantID = :plantid_from_form

-- (READ/SELECT) Gather all users for drop down menu
SELECT userID, first, last FROM `Users`

-- (READ/SELECT) Gather all plants for drop down menu
SELECT plantID, commonName FROM `Plants`

------------------------------

-- USEREXPERT ENTITY QUERIES

--(READ/SELECT) Get the information about the current users who are an expert ina  field and display it on page
SELECT * FROM `UserExpert`;

--(CREATE/INSERT) Adds a new expert tag for a user
INSERT INTO `UserExpert` (userID, expertID) VALUES (:userid_from_form, :expertid_from_form)

--(UPDATE) Updates the information for users expert status
UPDATE `UserExpert` SET userID = :userid_from_form, expertID = :expertid_from_form
WHERE userID = :userid_from_form AND expertID = :expertid_from_form

--(DELETE) Deletes a user with an expert tag
DELETE FROM `UserExpert` WHERE userID = :userid_from_form AND expertID = :expertid_from_form

-- (READ/SELECT) Gather all users for drop down menu
SELECT userID, first, last FROM `Users`

-- (READ/SELECT) Gather all experts for drop down menu
SELECT expertID, tagName FROM `Experts`