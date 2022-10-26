USE MusicService

INSERT INTO Roles (Title) VALUES ('Admin')
INSERT INTO Roles (Title) VALUES ('Visitor')
INSERT INTO Roles (Title) VALUES ('Artist')
INSERT INTO Roles (Title) VALUES ('Group')

INSERT INTO Permission (Title) VALUES ('View group/artist account')
INSERT INTO Permission (Title) VALUES ('Add group/artist account')
INSERT INTO Permission (Title) VALUES ('Remove group/artist account')
INSERT INTO Permission (Title) VALUES ('Add album')
INSERT INTO Permission (Title) VALUES ('Remove album')
INSERT INTO Permission (Title) VALUES ('Add song')
INSERT INTO Permission (Title) VALUES ('Remove song')
INSERT INTO Permission (Title) VALUES ('Add sertification')
INSERT INTO Permission (Title) VALUES  ('Remove sertification')
INSERT INTO Permission (Title) VALUES ('See logs')

INSERT INTO Roles_Permissions (Role_id, Permission_id) SELECT 1, Id FROM Permission
INSERT INTO Roles_Permissions (Role_id, Permission_id) VALUES (2, 1)
INSERT INTO Roles_Permissions (Role_id, Permission_id) SELECT 3, Id FROM Permission
WHERE Title IN (
	'View group/artist account',
	'Add group/artist account',
	'Remove group/artist account',
	'Add album',
	'Remove album',
	'Add song',
	'Remove song'
	)
INSERT INTO Roles_Permissions (Role_id, Permission_id) SELECT 4, Id FROM Permission
WHERE Title IN (
	'View group/artist account',
	'Add group/artist account',
	'Remove group/artist account',
	'Add album',
	'Remove album',
	'Add song',
	'Remove song'
	)

INSERT INTO Accounts (Email, Password, Role_id) VALUES ('glen228@gmail.com', 'dmkpdsf', 1) /*admin*/
INSERT INTO Accounts (Email, Password, Role_id) VALUES ('just_human@gmail.com', 'woqwmkwqrk', 2)
INSERT INTO Accounts (Email, Password, Role_id) VALUES ('Gleb@gmail.com', 'dfefoq', 2)
INSERT INTO Accounts (Email, Password, Role_id) VALUES ('artist@mail.ru', 'gbkmob', 3)
INSERT INTO Accounts (Email, Password, Role_id) VALUES ('eagle@gmail.com', 'jbskjdfcn', 3)
INSERT INTO Accounts (Email, Password, Role_id) VALUES ('rapgroup@mail.ru', 'jqwkmqrw', 4)

INSERT INTO Visitors (Name, Nickname, Date_of_birth, Account_id) VALUES ('Ivan Ivanov', 'Vanya228', '1999-10-14', 2)
INSERT INTO Visitors (Name, Nickname, Date_of_birth, Account_id) VALUES ('Gleb Glebov', 'Glebchik', '2000-07-29', 3)

INSERT INTO Artists (Name, Alias, Date_of_birth, Account_id) VALUES ('Michael Noir', 'MC Bullet Proof', '1998-06-05', 4)
INSERT INTO Artists (Name, Alias, Date_of_birth, Account_id) VALUES ('Mick Ward', 'DJ Eagle', '1990-05-03', 5)

INSERT INTO Groups (Title, Founding_date, Number_of_artist, Account_id) VALUES ('Wet Desert', '2020-01-01', 2, 6)

/*Missing related_acc*/

INSERT INTO Songs (Title, Date_of_writing) VALUES ('Dead Cops', '2021-10-23')
INSERT INTO Songs (Title, Date_of_writing) VALUES ('Alcohol & Drugs', '2021-10-27')
INSERT INTO Songs (Title, Date_of_writing) VALUES ('Flowers', '2021-11-01')
INSERT INTO Songs (Title, Date_of_writing) VALUES ('Easy HighGround', '2019-10-17')
INSERT INTO Songs (Title, Date_of_writing) VALUES ('Pain Remains', '2022-10-04')

INSERT INTO Albums (Title, Date_of_writing) VALUES ('Bloody Murder', '2022-11-11')
INSERT INTO Albums (Title, Date_of_writing) VALUES ('MVP', '2022-12-10')
INSERT INTO Albums (Title, Date_of_writing) VALUES ('Reign of Darkness', '2022-12-14')

INSERT INTO Genres (Title) VALUES ('Rap')
INSERT INTO Genres (Title) VALUES ('Trap')

INSERT INTO Sertifications (Title, Number_of_sales) VALUES ('Gold', 500000)
INSERT INTO Sertifications (Title, Number_of_sales) VALUES ('Platinum', 1000000)
INSERT INTO Sertifications (Title, Number_of_sales) VALUES ('Diamond', 10000000)

/*missing Logs*/

INSERT INTO Artists_Songs (Artist_id, Song_id) VALUES (1, 1)
INSERT INTO Artists_Songs (Artist_id, Song_id) VALUES (1, 2)
INSERT INTO Artists_Songs (Artist_id, Song_id) VALUES (2, 3)

INSERT INTO Groups_Songs (Group_id, Song_id) VALUES (1, 4)
INSERT INTO Groups_Songs (Group_id, Song_id) VALUES (1, 5)

INSERT INTO Albums_Genres (Album_id, Genre_id) VALUES (1, 1)
INSERT INTO Albums_Genres (Album_id, Genre_id) VALUES (1, 2)
INSERT INTO Albums_Genres (Album_id, Genre_id) VALUES (2, 1)
INSERT INTO Albums_Genres (Album_id, Genre_id) VALUES (3, 2)

INSERT INTO Songs_Genres (Song_id, Genre_id) VALUES (1, 1)
INSERT INTO Songs_Genres (Song_id, Genre_id) VALUES (2, 1)
INSERT INTO Songs_Genres (Song_id, Genre_id) VALUES (3, 2)
INSERT INTO Songs_Genres (Song_id, Genre_id) VALUES (4, 1)
INSERT INTO Songs_Genres (Song_id, Genre_id) VALUES (5, 1)
INSERT INTO Songs_Genres (Song_id, Genre_id) VALUES (5, 2)

INSERT INTO Artists_Albums (Artist_id, Album_id) VALUES (1, 2)
INSERT INTO Artists_Albums (Artist_id, Album_id) VALUES (1, 1)
INSERT INTO Artists_Albums (Artist_id, Album_id) VALUES (2, 1)

INSERT INTO Groups_Albums (Group_id, Album_id) VALUES (1, 3)

INSERT INTO Groups_Artists (Group_id, Artist_id) VALUES (1, 1)
INSERT INTO Groups_Artists (Group_id, Artist_id) VALUES (1, 2)

INSERT INTO Albums_Sertifications (Album_id, Sertification_id) VALUES (1, null)

INSERT INTO Songs_Sertifications (Song_id, Sertification_id) VALUES (5, 2)
INSERT INTO Songs_Sertifications (Song_id, Sertification_id) VALUES (5, 1)