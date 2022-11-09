USE MusicService;

SELECT * FROM Roles

SELECT * FROM Permission

SELECT * FROM Accounts

SELECT * FROM Visitors

SELECT * FROM Artists

SELECT * FROM Groups

SELECT * FROM Songs

SELECT * FROM Albums

SELECT * FROM Genres

SELECT * FROM Sertifications


/*Вывести все песни жанра Рэп*/
SELECT Songs.*, Genres.Title
FROM Songs, Songs_Genres, Genres
WHERE Songs.Id = Songs_Genres.Song_id 
AND Songs_Genres.Genre_id = Genres.Id 
AND Genres.Title = 'Rap'
	
/*Вывести все песни каждого артиста (через join)*/
SELECT Artists.Id, Artists.Name, Artists.Alias, Songs.Title
FROM Artists
JOIN Artists_Songs ON Artists_Songs.Artist_id = Artists.Id
JOIN Songs ON Songs.Id = Artists_Songs.Song_id

/*Вывести все альбомы каждого артиста (через join)*/
SELECT Artists.Id, Artists.Name, Artists.Alias, Albums.Title 
FROM Artists
JOIN Artists_Albums ON Artists_Albums.Artist_id = Artists.Id
JOIN Albums ON Artists_Albums.Album_id = Albums.Id

/*Вывести все песни кончающиеся на 's'*/
SELECT * 
FROM Songs
WHERE Songs.Title LIKE '%s'

/*Вывести жанры каждого альбома*/
SELECT Albums.*, Genres.Title FROM Albums, Albums_Genres, Genres
WHERE Albums.Id = Albums_Genres.Album_id 
AND Albums_Genres.Genre_id = Genres.Id

/*Вывести все роли и их соответствующие права*/
SELECT Roles.Title, Permission.Title FROM Roles, Roles_Permissions, Permission
WHERE Roles_Permissions.Role_id = Roles.Id 
AND Roles_Permissions.Permission_id = Permission.Id

