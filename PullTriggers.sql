USE MusicService
GO

/*Триггеры для Логирования*/
CREATE TRIGGER Account_INSERT
ON Accounts
AFTER INSERT
AS 
	INSERT INTO Logs(Entity_Id, Representation)
	SELECT inserted.Id, 'Добавлен Аккаунт: ' + inserted.Email + ' Роль: ' + Roles.Title
	FROM inserted, Roles, Accounts
	WHERE Roles.Id = Accounts.Role_id

GO


CREATE TRIGGER Account_DELETE
ON Accounts
AFTER DELETE
AS
	INSERT Logs(Entity_Id, Representation)
	SELECT deleted.Id, 'Удален Аккаунт: ' + deleted.Email + 'Роль: ' + Roles.Title
	FROM deleted, Roles, Accounts
	WHERE Roles.Id  = Accounts.Role_id

GO
CREATE TRIGGER Album_INSERT
ON Albums
AFTER INSERT
AS 
	INSERT Logs(Entity_Id, Representation)
	SELECT inserted.Id, 'Добавлен Альбом: ' + inserted.Title 
	FROM inserted

GO
CREATE TRIGGER Album_DELETE
ON Albums
AFTER DELETE
AS 
	INSERT Logs(Entity_Id, Representation)
	SELECT deleted.Id, 'Удален Альбом: ' + deleted.Title
	FROM deleted

GO
CREATE TRIGGER Songs_INSERT
ON Songs
AFTER INSERT
AS 
	INSERT Logs(Entity_Id, Representation)
	SELECT inserted.Id, 'Добавлена Песня: ' + inserted.Title
	FROM inserted

GO
CREATE TRIGGER Songs_DELETE
ON Songs
AFTER DELETE
AS 
	INSERT Logs(Entity_Id, Representation)
	SELECT deleted.Id, 'Удалена Песня: ' + deleted.Title
	FROM deleted

DROP TRIGGER Songs_DELETE

GO
CREATE TRIGGER Genres_INSERT
ON Genres
AFTER INSERT
AS 
	INSERT Logs(Entity_Id, Representation)
	SELECT inserted.Id, 'Добавлен Жанр: ' + inserted.Title 
	FROM inserted

GO
CREATE TRIGGER Genres_DELETE
ON Genres
AFTER DELETE
AS 
	INSERT Logs(Entity_Id, Representation)
	SELECT deleted.Id, 'Удален Жанр: ' + deleted.Title 
	FROM deleted

GO
INSERT INTO Songs(Title, Date_of_writing) VALUES ('Song', '2020-01-01')

DELETE Songs WHERE Title = 'Song'

SELECT * FROM Songs

SELECT * fROM Logs

SELECT * FROM Albums

EXEC AddAlbum 'Album', '2022-01-01'