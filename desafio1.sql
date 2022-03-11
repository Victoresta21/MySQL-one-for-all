DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.Subscription(
Subscription_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Subscription VARCHAR(50) NOT NULL,
Price DECIMAL(3,2)
) engine = InnoDB;
INSERT INTO SpotifyClone.Subscription (Subscription, Price)
VALUES
  ('Gratuito', 0.00 ),
  ('Universitário', 5.99 ),
  ('Pessoal','6.99'),
  ('Familiar', 7.99);

CREATE TABLE SpotifyClone.Artist(
Artist_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Artist_Name VARCHAR(50) NOT NULL
) engine = InnoDB;
INSERT INTO SpotifyClone.Artist (Artist_Name)
VALUES 
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon'),
  ('Tyler Isle'),
  ('Fog');

CREATE TABLE SpotifyClone.`User`(
User_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
User_Name VARCHAR(100) NOT NULL,
User_Age INT NOT NULL,
User_Subscription_Date DATE NOT NULL,
Subscription_ID INT NOT NULL,
FOREIGN KEY(Subscription_ID) REFERENCES Subscription (Subscription_ID)
) engine = InnoDB;

INSERT INTO SpotifyClone.`User` (User_Name, User_Age, User_Subscription_Date, Subscription_ID)
VALUES 
  ('Thati', 23, '2019-10-20' ,1),
  ('Cintia', 35, '2017-12-30' ,4),
  ('Bill', 20, '2019-06-05' ,2),
  ('Roger', 45, '2020-05-13' ,3),
  ('Norman', 58, '2017-02-17' ,3),
  ('Patrick', 33, '2017-01-06' ,4),
  ('Vivian', 26, '2018-01-05' ,2),
  ('Carol', 19, '2018-02-14' ,2),
  ('Angelina', 42, '2018-04-29' ,4),
  ('Paul', 45, '2017-01-17' ,4);
  
CREATE TABLE SpotifyClone.Album(
Album_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Album_Name VARCHAR(100) NOT NULL,
Artist_ID INT NOT NULL,
Release_Year YEAR NOT NULL,
FOREIGN KEY(Artist_ID) REFERENCES Artist (Artist_ID)
) engine = InnoDB;

INSERT INTO SpotifyClone.Album (Album_Name, Artist_ID, Release_Year)
VALUES
  ('Envious', 1, '1990'),
  ('Exuberant', 1, '1993'),
  ('Hallowed Steam', 2, '1995'),
  ('Incandescent', 3, '1998'),
  ('Temporary Culture', 4, '2001'),
  ('Library of liberty', 4, '2003'),
  ('Chained Down', 5, '2007'),
  ('Cabinet of fools', 5, '2012'),
  ('No guarantees', 5, '2015'),
  ('Apparatus', 6, '2015');
  
CREATE TABLE SpotifyClone.Song(
Song_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Song_Name VARCHAR(100) NOT NULL,
Song_Length INT NOT NULL,
Album_ID INT NOT NULL,
Artist_ID INT NOT NULL,
FOREIGN KEY(Album_ID) REFERENCES Album (Album_ID),
FOREIGN KEY(Artist_ID) REFERENCES Artist (Artist_ID)
) engine = InnoDB;

INSERT INTO SpotifyClone.Song (Song_Name, Song_Length, Album_ID, Artist_ID)
VALUES
  ("Baby", 136, 10, 6),
  ("Celebration Of More", 146, 4, 3),
  ("Dance With Her Own", 116, 1, 1),
  ("Diamond Power", 241, 4, 3),
  ("Fantasy For Me", 100, 4, 3),
  ("Finding My Traditions", 179, 7, 5),
  ("Hard And Time", 135, 7, 5),
  ("He Heard You're Bad For Me", 154, 8, 5),
  ("He Hopes We Can't Stay", 210, 8, 5),
  ("He's Trouble", 138, 9, 5),
  ("He's Walking Away", 159, 9, 5),
  ("History Of My Roses", 222, 6, 4),
  ("Home Forever", 231, 4, 3),
  ("Honey, I'm A Lone Wolf", 150, 7, 5),
  ("Honey, So Do I", 207, 3, 2),
  ("Honey", 79, 10, 6),
  ("I Heard I Want To Bo Alone", 120, 9, 5),
  ("I Know I Know", 117, 8, 5),
  ("I Ride Alone", 151, 9, 5),
  ("Let's Be Silly", 132, 4, 3),
  ("Magic Circus", 105, 3, 2),
  ("Need Of The Evening", 190, 6, 4),
  ("Reflections Of Magic", 163, 1, 1),
  ("Rock His Everything", 223, 4, 3),
  ("She Knows", 244, 3, 2),
  ("She Thinks I Wont Stay Tonight", 166, 8, 5),
  ("Sweetie, Let's Go Wild", 139, 3, 2),
  ("Thang Of Thunder", 240, 5, 4),
  ("Time Fireworks", 152, 2, 1),
  ("Troubles Of My Inner Fire", 203, 2, 1),
  ("Walking And Game", 123, 6, 4),
  ("Walking And Man", 229, 7, 5),
  ("Without My Love", 111, 6, 4),
  ("Without My Streets", 176, 5, 4),
  ("Words Of Her Life", 185, 5, 4),
  ("Wouldn't It Be Nice", 213, 10, 6),
  ("You Cheated On Me", 95, 10, 6),
  ("You Make Me Feel So..", 83, 10, 6),
  ("Young And Father", 197, 6, 4),
  ("Soul For Us", 200, 1, 1);
  
CREATE TABLE SpotifyClone.`Following`(
User_ID INT NOT NULL,
Artist_ID INT NOT NULL,
CONSTRAINT PRIMARY KEY (User_ID, Artist_ID),
FOREIGN KEY(User_ID) REFERENCES `User` (User_ID),
FOREIGN KEY(Artist_ID) REFERENCES Artist (Artist_ID)
) engine = InnoDB;

INSERT INTO SpotifyClone.`Following` (User_ID, Artist_ID)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 3),
  (6, 1),
  (7, 2),
  (7, 5),
  (8, 1),
  (8, 5),
  (9, 6),
  (9, 4),
  (9, 3),
  (10, 2),
  (10, 6);
  
CREATE TABLE SpotifyClone.`History`(
User_ID INT NOT NULL,
Song_ID INT NOT NULL,
Reproduction_Timestamp TIMESTAMP NOT NULL,
CONSTRAINT PRIMARY KEY (User_ID, Song_ID),
FOREIGN KEY(User_ID) REFERENCES `User` (User_ID),
FOREIGN KEY(Song_ID) REFERENCES Song (Song_ID)
) engine = InnoDB;

INSERT INTO SpotifyClone.`History` (User_ID, Song_ID, Reproduction_Timestamp)
VALUES
  (1, 16, '2020-02-28 10:45:55'),
  (1, 32, '2020-05-02 05:30:35'),
  (1, 39, '2020-03-06 11:22:33'),
  (1, 4, '2020-08-05 08:05:17'),
  (1, 20, '2020-09-14 16:32:22'),
  (2, 17, '2020-01-02 07:40:33'),
  (2, 6, '2020-05-16 06:16:22'),
  (2, 33, '2020-10-09 12:27:48'),
  (2, 1, '2020-09-21 13:14:46'),
  (3, 21, '2020-11-13 16:55:13'),
  (3, 3, '2020-12-05 18:38:30'),
  (3, 7, '2020-07-30 10:00:00'),
  (4, 23, '2021-08-15 17:10:10'),
  (4, 19, '2021-07-10 15:20:30'),
  (4, 14, '2021-01-09 01:44:33'),
  (5, 15, '2020-07-03 19:33:28'),
  (5, 24, '2017-02-24 21:14:22'),
  (5, 4, '2020-08-06 15:23:43'),
  (5, 40, '2020-11-10 13:52:27'),
  (6, 36, '2019-02-07 20:33:48'),
  (6, 8, '2017-01-24 00:31:17'),
  (6, 9, '2017-10-12 12:35:20'),
  (6, 31, '2018-05-29 14:56:41'),
  (7, 29, '2018-05-09 22:30:49'),
  (7, 30, '2020-07-27 12:52:58'),
  (7, 2, '2018-01-16 18:40:43'),
  (8, 1, '2018-03-21 16:56:40'),
  (8, 38, '2020-10-18 13:38:05'),
  (8, 11, '2019-05-25 08:14:03'),
  (8, 10, '2021-08-15 21:37:09'),
  (9, 28, '2021-05-24 17:23:45'),
  (9, 35, '2018-12-07 22:48:52'),
  (9, 27, '2021-03-14 06:14:26'),
  (9, 25, '2020-04-01 03:36:00'),
  (10, 12, '2017-02-06 08:21:34'),
  (10, 33, '2017-12-04 05:33:43'),
  (10, 24, '2017-07-27 05:24:49'),
  (10, 13, '2017-12-25 01:03:57');