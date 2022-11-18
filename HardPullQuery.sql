USE MusicService


/*������� ���(OUTER JOIN) ������ � �� ������������ ��������*/
SELECT Groups.Title, Albums.Title, Sertifications.Title
FROM Groups
LEFT JOIN Groups_Albums ON Groups_Albums.Group_id = Groups.Id
LEFT JOIN Albums ON Groups_Albums.Album_id = Albums.Id
LEFT JOIN Albums_Sertifications ON Albums_Sertifications.Album_id = Albums.Id
LEFT JOIN Sertifications ON Albums_Sertifications.Sertification_id = Sertifications.Id


/*������� ���� �������� � �� ������������ �����*/
SELECT Artists.Name, Artists.Alias, Songs.Title, Sertifications.Title
FROM Artists
LEFT JOIN Artists_Songs ON Artists_Songs.Artist_id = Artists.Id
LEFT JOIN Songs ON Artists_Songs.Song_id = Songs.Id
LEFT JOIN Songs_Sertifications ON Songs_Sertifications.Song_id = Songs.Id
LEFT JOIN Sertifications ON Songs_Sertifications.Sertification_id = Sertifications.Id


/*������� ���� �������� � �� ������� � ���������������� �������*/
SELECT Artists.Name, Artists.Alias, Songs.Title, Genres.Title
FROM Artists 
JOIN Artists_Songs ON Artists.Id = Artists_Songs.Artist_id
JOIN Songs ON Songs.Id = Artists_Songs.Song_id
JOIN Songs_Genres ON Songs_Genres.Song_id = Songs.Id
JOIN Genres ON Songs_Genres.Genre_id = Genres.Id


/*������� ���� ����� � �� ������� � ���������������� �������*/
SELECT Groups.Title, Songs.Title, Genres.Title
FROM Groups
JOIN Groups_Songs ON Groups_Songs.Group_id = Groups.Id
JOIN Songs ON Songs.Id = Groups_Songs.Song_id
JOIN Songs_Genres ON Songs_Genres.Song_id = Songs.Id
JOIN Genres ON Songs_Genres.Genre_id = Genres.Id


/*������� ���� �������� � ����� (���� ����)*/
SELECT Artists.Name, Artists.Alias, Songs.Title
FROM Artists
LEFT JOIN Artists_Songs ON Artists_Songs.Artist_id = Artists.Id
LEFT JOIN Songs ON Artists_Songs.Song_id = Songs.Id


/*������ CROSS JOIN*/
SELECT *
FROM Artists
CROSS JOIN Songs


/*������� �������� �� ���������� ����� � ������� ���-�� �����*/
SELECT Artists.Name, Artists.Alias, COUNT(Songs.Id) AS CountOfSongs 
FROM Artists
LEFT JOIN Artists_Songs ON Artists_Songs.Artist_id = Artists.Id
LEFT JOIN Songs ON Artists_Songs.Song_id = Songs.Id
GROUP BY Artists.Name, Artists.Alias
HAVING COUNT(Songs.Id) >= 1
ORDER BY CountOfSongs DESC


/*������� �������� �� ���������� �������� � ������� ���-�� ��������*/
SELECT Artists.Name, Artists.Alias, COUNT(Albums.Id) AS CountOfAlbums
FROM Artists
LEFT JOIN Artists_Albums ON Artists_Albums.Artist_id = Artists.Id
LEFT JOIN Albums ON Artists_Albums.Album_id = Albums.Id
GROUP BY Artists.Name, Artists.Alias
ORDER BY CountOfAlbums DESC


/*������� ������ �� ���������� ����� � ������� ���-�� �����*/
SELECT Groups.Title, COUNT(Songs.Title) AS CountOfSongs
FROM Groups
LEFT JOIN Groups_Songs ON Groups_Songs.Group_id = Groups.Id
LEFT JOIN Songs ON Groups_Songs.Song_id = Songs.Id
GROUP BY Groups.Title
ORDER BY CountOfSongs DESC


/*������� ������ �� ���������� �������� � ������� ���-�� ��������*/
SELECT Groups.Title, COUNT(Albums.Title) AS CountOfAlbums
FROM Groups
LEFT JOIN Groups_Albums ON Groups_Albums.Group_id = Groups.Id
LEFT JOIN Albums ON Groups_Albums.Album_id = Albums.Id
GROUP BY Groups.Title
HAVING COUNT(Albums.Id) >= 1
ORDER BY CountOfAlbums DESC


/*������� ���-�� ������������ ��� ������ ����� (���� ����)*/
SELECT Songs.Title, COUNT(Sertifications.Id) AS CountOfSertificate
FROM Songs
LEFT JOIN Songs_Sertifications ON Songs.Id = Songs_Sertifications.Song_id
LEFT JOIN Sertifications ON Sertifications.Id = Songs_Sertifications.Sertification_id
GROUP BY Songs.Title
ORDER BY CountOfSertificate DESC


SELECT *
FROM Roles
UNION ALL
SELECT *
FROM Permission

