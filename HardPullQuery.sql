USE MusicService


/*Вывести Артистов, у которых Песни с золотой Сертификацией*/



/*Вывести всех Артистов с их Песнями и соответствующими Жанрами (без join)*/
SELECT Artists.Id, Artists.Name, Artists.Alias, Artists	.Date_of_birth
FROM Artists, Artists_Songs, Songs
WHERE Artists.Id = Artists_Songs.Artist_id AND Songs.Id = Artists_Songs.Song_id


/*Вывести всех Артистов с их Песнями и соответствующими Жанрами (c join)*/
SELECT Artists.Name, Artists.Alias, Songs.Title, Genres.Title
FROM Artists 
JOIN Artists_Songs ON Artists.Id = Artists_Songs.Artist_id
JOIN Songs ON Songs.Id = Artists_Songs.Song_id
JOIN Songs_Genres ON Songs_Genres.Song_id = Songs.Id
JOIN Genres ON Songs_Genres.Genre_id = Genres.Id


/*Вывести всех Групп с их Песнями и соответствующими Жанрами*/
SELECT Groups.Title, Songs.Title, Genres.Title
FROM Groups
JOIN Groups_Songs ON Groups_Songs.Group_id = Groups.Id
JOIN Songs ON Songs.Id = Groups_Songs.Song_id
JOIN Songs_Genres ON Songs_Genres.Song_id = Songs.Id
JOIN Genres ON Songs_Genres.Genre_id = Genres.Id


/*Вывести всех артистов и общее количество (SUM) их песен (альбомов)*/



/*Вывести Артиста у которого больше всего песен (альбомов) и вывести кол-во Песен*/