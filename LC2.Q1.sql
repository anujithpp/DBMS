CREATE DATABASE EVENTMANAGEMENT;

USE EVENTMANAGEMENT;

CREATE TABLE Event (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    `desc` TEXT,
    city VARCHAR(255)
);

CREATE TABLE Participant (
    player_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    event_id INT,
    gender ENUM('Male', 'Female', 'Other'),
    year INT,
    FOREIGN KEY (event_id) REFERENCES Event(event_id)
);

CREATE TABLE Prizes (
    prize_id INT AUTO_INCREMENT PRIMARY KEY,
    money INT NOT NULL,
    event_id INT,
    raank INT,
    year INT,
    FOREIGN KEY (event_id) REFERENCES Event(event_id)
);

CREATE TABLE Winners (
    prize_id INT,
    player_id INT,
    PRIMARY KEY (prize_id, player_id),
    FOREIGN KEY (prize_id) REFERENCES Prizes(prize_id),
    FOREIGN KEY (player_id) REFERENCES Participant(player_id)
);

DELIMITER //

CREATE TRIGGER after_event_insert
AFTER INSERT ON Event
FOR EACH ROW
BEGIN
    INSERT INTO Prizes (money, event_id, raank, year) VALUES (1500, NEW.event_id, 1, YEAR(CURDATE()));
    INSERT INTO Prizes (money, event_id, raank, year) VALUES (1000, NEW.event_id, 2, YEAR(CURDATE()));
    INSERT INTO Prizes (money, event_id, raank, year) VALUES (500, NEW.event_id, 3, YEAR(CURDATE()));
END;

//

DELIMITER ;


--insert this into event and trigger will be triggered and price table will automatically added
INSERT INTO Event (name, `desc`, city) VALUES ('Annual Sports Day', 'A day of various sports activities.', 'New York');

SELECT * FROM Prizes;  --when we show the table price it will be automatically updated
