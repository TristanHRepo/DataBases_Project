-- : character being used to denote the variables that will have data from the backend programming language

------------------------------

-- PLANT ENTITY QUERIES

-- (READ/SELECT) Get all Plants to populate on the plant page so users can browse plants
SELECT * FROM Plants;

-- (READ/SELECT) Get Plants that match results from search filter
SELECT * FROM Plants WHERE type = :plant_type_selected_from_radio_buttons AND commonName = :name_entered_in_search_bar OR scienceName = :name_entered_in_search_bar;

-- (CREATE/INSERT) Insert a new plant into the plants table using the form
INSERT INTO Plants 
VALUES (:commonName_from_form, 
:scienceName_from_form, 
:type_from_form,
:color_from_form,
:variegated_from_form,
:petSafe_from_form,
:maxSize_from_form);

------------------------------

-- CARE ENTITY QUERIES

-- (READ/SELECT) Get the Care requirements for the Plant that a user clicks on
SELECT * FROM Care WHERE careID = :selected_plant.careID;

-- (CREATE/INSERT) Insert new care requirements into Care table
INSERT INTO Care
VALUES (:water_from_form,
:light_from_form,
:temperature_from_form,
:humidity_from_form,
:fertilizer_from_form,
:soil_from_form);

------------------------------

-- USERS ENTITY QUERIES

--(READ/SELECT) Get the information about the current user and display it on page
SELECT * FROM Users WHERE userID = :logged_in_user;

--(CREATE/INSERT) Register as a new user inserts into the Users table
INSERT INTO Users (first, last, email, location)
VALUES (:fname_from_form, 
:lname_from_form, 
:email_from_form, 
:location_from_form);

--(UPDATE) Updates the users information
UPDATE Users SET first = :fname_from_form, last = :lname_from_form, email = :email_from_form, location = :location_from_form WHERE userID = :logged_in_user;

--(DELETE) Deletes a plant that the user owns from the PlantsOwned table
DELETE FROM PlantsOwned WHERE userID = :logged_in_user AND plantID = :plant_to_delete;

------------------------------

-- GUIDES ENTITY QUERIES

--(READ/SELECT) Get the Guides
SELECT * FROM Guides;

--(CREATE/INSERT) Insert a new guide into the Guides table
INSERT INTO Guides (title, video, description, userID)
VALUES (:title_from_form, :video_from_form, :description_from_form, :logged_in_user_id);

------------------------------

-- EXPERTS ENTITY QUERIES

-- (READ/SELECT) Display Expert tag on User Profile/Written Guides
SELECT tagName, tagDescription FROM Experts WHERE expertID = ?

--(CREATE/INSERT) Insert into the experts table
INSERT INTO Experts (tagName, tagDescription)
VALUES (:tag_name_from_form, :tag_description_from_form);
