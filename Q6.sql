Create database Movie;

USE Movie;

Create table Actor (
	Act_id int primary key,
	Act_Name varchar(100),
	Act_Gender varchar(10)
);

Create table Director (
	Dir_id int primary key,
	Dir_Name varchar(100),
	Dir_phone varchar(15)
);

Create table Movies (
	Mov_id int primary key,
	Mov_Title varchar(100),
	Mov_year int,
	Mov_lang varchar(20),
	Dir_id int,
	foreign key (Dir_id) references Director(Dir_id) 
);

Create table Movie_Cast (
	Act_id int,
	Mov_id int,
	Role varchar(100),
	primary key (Act_id,Mov_id),
	foreign key (Act_id) references Actor(Act_id),
	foreign key (Mov_id) references Movies(Mov_id)
);

Create table Rating (
	Mov_id int,
	Rev_stars decimal(2,1),
	primary key (Mov_id),
	foreign key (Mov_id) references Movies(Mov_id)
);


-- Inserting Actors
INSERT INTO Actor (Act_id, Act_Name, Act_Gender) VALUES
(1, 'Anthony Perkins', 'Male'),
(2, 'Janet Leigh', 'Female'),
(3, 'Tippi Hedren', 'Female'),
(4, 'Harrison Ford', 'Male'),
(5, 'Drew Barrymore', 'Female'),
(6, 'Meryl Streep', 'Female'),
(7, 'Robert De Niro', 'Male'),
(8, 'Leonardo DiCaprio', 'Male'),
(9, 'Natalie Portman', 'Female'),
(10, 'Tom Hanks', 'Male');

-- Inserting Directors
INSERT INTO Director (Dir_id, Dir_Name, Dir_phone) VALUES
(1, 'Alfred Hitchcock', '123-456-7890'),
(2, 'Steven Spielberg', '098-765-4321'),
(3, 'Martin Scorsese', '111-222-3333'),
(4, 'Christopher Nolan', '444-555-6666'),
(5, 'Quentin Tarantino', '777-888-9999'),
(6, 'James Cameron', '000-111-2222');

-- Inserting Movies
INSERT INTO Movies (Mov_id, Mov_Title, Mov_year, Mov_lang, Dir_id) VALUES
(1, 'Psycho', 1960, 'English', 1),
(2, 'The Birds', 1963, 'English', 1),
(3, 'Jaws', 1975, 'English', 2),
(4, 'E.T. the Extra-Terrestrial', 1982, 'English', 2),
(5, 'Jurassic Park', 1993, 'English', 2),
(6, 'Taxi Driver', 1976, 'English', 3),
(7, 'Inception', 2010, 'English', 4),
(8, 'Pulp Fiction', 1994, 'English', 5),
(9, 'Titanic', 1997, 'English', 6),
(10, 'The Dark Knight', 2008, 'English', 4),
(11, 'The Godfather', 1972, 'English', 3),
(12, 'Black Swan', 2010, 'English', 6);

-- Inserting Movie Cast
INSERT INTO Movie_Cast (Act_id, Mov_id, Role) VALUES
(1, 1, 'Norman Bates'),
(2, 1, 'Marion Crane'),
(3, 2, 'Melanie Daniels'),
(4, 3, 'Chief Brody'),
(5, 3, 'Alex Kintner'),
(6, 9, 'Rose DeWitt Bukater'),
(7, 11, 'Vito Corleone'),
(8, 10, 'Bruce Wayne'),
(9, 12, 'Nina Sayers'),
(10, 8, 'Vincent Vega');

-- Inserting Ratings
INSERT INTO Rating (Mov_id, Rev_stars) VALUES
(1, 8.5),
(2, 7.5),
(3, 9.0),
(4, 8.0),
(5, 9.5),
(6, 8.3),
(7, 8.8),
(8, 8.9),
(9, 9.0),
(10, 9.0),
(11, 9.2),
(12, 8.0);


-- Movie titles which are directed by Hitch Cock
SELECT Mov_Title
FROM Movies
JOIN Director ON Movies.Dir_id = Director.Dir_id
WHERE Director.Dir_Name = 'Alfred Hitchcock';
  

--Movies where one or more acted in two or more Movies
SELECT DISTINCT m.Mov_Title
FROM Movies m
JOIN Movie_Cast mc ON m.Mov_id = mc.Mov_id
WHERE mc.Act_id IN (
    SELECT Act_id
    FROM Movie_Cast
    GROUP BY Act_id
    HAVING COUNT(Mov_id) >= 2
);


-- actors who acted in a movie before 2000 or in a movie after 2015
SELECT DISTINCT a.Act_Name
FROM Actor a
JOIN Movie_Cast mc ON a.Act_id = mc.Act_id
JOIN Movies m ON mc.Mov_id = m.Mov_id
WHERE m.Mov_year < 2000 OR m.Mov_year > 2015;


--updating all the movies directed by steven spielberg to 5
UPDATE Rating r
JOIN Movies m ON r.Mov_id = m.Mov_id
JOIN Director d ON m.Dir_id = d.Dir_id
SET r.Rev_stars = 5
WHERE d.Dir_Name = 'Steven Spielberg';


--title of movies and number of stars for each movies that has atleast 
--one rating and the highest number of stars that movie recieved in a sorted order by title
SELECT m.Mov_Title, MAX(r.Rev_stars) AS Highest_Stars
FROM Movies m
JOIN Rating r ON m.Mov_id = r.Mov_id
GROUP BY m.Mov_Title
HAVING COUNT(r.Rev_stars) > 0
ORDER BY m.Mov_Title;
