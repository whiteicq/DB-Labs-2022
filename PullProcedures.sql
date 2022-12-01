Use MusicService
GO 

/*Procedures for INSERT each Entity*/

/*Писать процедуры для явных действий, а все неявные прописывать в триггерах?*/
GO
CREATE PROC AddAccount /*сперва вызывается процедура которая делает INSERT и вслед за ней срабатывает триггер*/
	@email VARCHAR(100),
	@password VARCHAR(30),
	@roleTitle VARCHAR(50) 
AS
	INSERT INTO Accounts(Email, Password, Role_id)
	VALUES (
			@email, 
			@password, 
			(SELECT Roles.Id FROM Roles WHERE Roles.Title = @roleTitle)
		   )  
GO

CREATE PROC AddVisitor
	/*для заполнения посетителя*/
	@name VARCHAR(200),
	@nickname VARCHAR(20),
	@dateBirth DATE,
	
	/*для заполнения аккаунта*/
	@email VARCHAR(100),
	@password VARCHAR(30),
	@roleTitle VARCHAR(50) 
AS

	EXEC AddAccount @email, @password, @roleTitle

	INSERT INTO Visitors(Name, Nickname, Date_of_birth, Account_id)
	VALUES (
		@name,
		@nickname,
		@dateBirth,
		(SELECT Id FROM Accounts WHERE Id = (SELECT MAX(Id) FROM Accounts))
		 /*добавлять последний Акк из таблицы аккаунтов(кот. появиться после AddAccount) [через цикл]*/
	)

GO

/*разобраться с related_account в триггерах*/
CREATE PROC AddArtist /*предусмотреть добавление артиста в группу*/ 
/*(мб все неявные действия, по типу добавления в промежуточные таблицы, положить на триггеры?)*/
	@name VARCHAR(200),
	@alias VARCHAR(100),
	@dateBirth DATE,

	/*для заполнения аккаунта*/
	@email VARCHAR(100),
	@password VARCHAR(30),
	@roleTitle VARCHAR(50) 
AS
	EXEC AddAccount @email, @password, @roleTitle

	INSERT INTO Artists(Name, Alias, Date_of_birth, Account_id)
	VALUES(
		@name, 
		@alias,
		@dateBirth,
		(SELECT Id FROM Accounts WHERE Id = (SELECT MAX(Id) FROM Accounts))
		)
GO

/*разобраться с related_account в триггерах*/
CREATE PROC AddGroup
	@title VARCHAR(100),
	@foundingDate DATE,
	@numberArtist INT,

	/*для заполнения аккаунта*/
	@email VARCHAR(100),
	@password VARCHAR(30),
	@roleTitle VARCHAR(50) 
AS
	EXEC AddAccount @email, @password, @roleTitle
	
	INSERT INTO Groups(Title, Founding_date, Number_of_artist, Account_id)
	VALUES(
		@title,
		@foundingDate, 
		@numberArtist,
		(SELECT Id FROM Accounts WHERE Id = (SELECT MAX(Id) FROM Accounts))		
		)
GO

CREATE PROC AddSong
	@title VARCHAR(100),
	@dateWriting DATE
AS
	INSERT INTO Songs(Title, Date_of_writing)
	VALUES (@title, @dateWriting)
GO

CREATE PROC AddGenre
	@title VARCHAR(100)
AS
	INSERT INTO Genres(Title) VALUES (@title)
GO

CREATE PROC AddAlbum
	@title VARCHAR(100), 
	@dateWriting DATE
AS
	INSERT INTO Albums(Title, Date_of_writing) VALUES (@title, @dateWriting)
GO










/*Процедуры для удаления ВСЕГО*/

/*
Получить последюю строку в таблице
SELECT * FROM TableName WHERE id=(SELECT max(id) FROM TableName);
*/

CREATE PROC RemoveAccount /*Все остальные живые сущности при удалении аккаунта каскадно удалятся*/
	@email VARCHAR(100)
AS
	DELETE Accounts
	WHERE Email = @email
GO

CREATE PROC RemoveSong
	@title VARCHAR(100)
AS
	DELETE Songs
	WHERE Title = @title
GO

CREATE PROC RemoveAlbum
	@title VARCHAR(100)
AS
	DELETE Albums
	WHERE Title = @title
GO

CREATE PROC RemoveGenre
	@title VARCHAR(100)
AS
	DELETE Genres
	WHERE Title = @title
GO
