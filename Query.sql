USE MusicService

CREATE TABLE Roles
(
	Id INT PRIMARY KEY IDENTITY,
	Title VARCHAR(100) NOT NULL 
)

CREATE TABLE Permission
(
	Id INT PRIMARY KEY IDENTITY,
	Title VARCHAR(50) NOT NULL
)

CREATE TABLE Roles_Permissions
(
	Id INT PRIMARY KEY IDENTITY,
	Role_id INT NOT NULL,
	Permission_id INT NOT NULL
	FOREIGN KEY (Role_id) REFERENCES Roles(Id) ON DELETE CASCADE,
	FOREIGN KEY (Permission_id) REFERENCES Permission(Id) ON DELETE CASCADE
)

CREATE TABLE Accounts
(
	Id INT PRIMARY KEY IDENTITY,
	Email VARCHAR(100) NOT NULL UNIQUE,
	Password VARCHAR(30) NOT NULL,
	Role_id INT NOT NULL 
	FOREIGN KEY (Role_id) REFERENCES Roles(Id) ON DELETE CASCADE
)

CREATE TABLE Visitors
(
	Id INT PRIMARY KEY IDENTITY,
	Name VARCHAR(200) NOT NULL,
	Nickname VARCHAR(20) NOT NULL UNIQUE,
	Date_of_birth DATE NOT NULL,
	Account_id INT NOT NULL
	FOREIGN KEY (Account_id) REFERENCES Accounts(Id) ON DELETE CASCADE
)

CREATE TABLE Artists
(
	Id INT PRIMARY KEY IDENTITY,
	Name VARCHAR(200) NOT NULL,
	Alias VARCHAR(100) NULL,
	Date_of_birth DATE NOT NULL,
	Account_id INT NOT NULL
)

CREATE TABLE Groups
(
	Id INT PRIMARY KEY IDENTITY,
	Title VARCHAR(100) NOT NULL,
	Founding_date DATE NOT NULL,
	Number_of_artist INT NOT NULL,
	Account_id INT NOT NULL
)

CREATE TABLE Related_accounts
(
	Id INT PRIMARY KEY IDENTITY,
	Account_id INT NOT NULL UNIQUE,
	Artist_id INT UNIQUE, 
	Group_id INT UNIQUE,
	FOREIGN KEY (Artist_id) REFERENCES Artists(Id) ON DELETE CASCADE,
	FOREIGN KEY (Group_id) REFERENCES Groups(Id) ON DELETE CASCADE,
	FOREIGN KEY (Account_id) REFERENCES Accounts(Id) ON DELETE CASCADE,
)

CREATE TABLE Songs
(
	Id INT PRIMARY KEY IDENTITY,
	Title VARCHAR(100) NOT NULL,
	Date_of_writing DATE NOT NULL
)

CREATE TABLE Albums
(
	Id INT PRIMARY KEY IDENTITY,
	Title VARCHAR(100) NOT NULL,
	Date_of_writing DATE NOT NULL
)

CREATE TABLE Genres
(
	Id INT PRIMARY KEY IDENTITY,
	Title VARCHAR(100) NOT NULL
)

CREATE TABLE Sertifications
(
	Id INT PRIMARY KEY IDENTITY,
	Title VARCHAR(100) NOT NULL,
	Number_of_sales INT NOT NULL CHECK(Number_of_sales >= 0)
)

CREATE TABLE Logs
(
	Id INT PRIMARY KEY IDENTITY,
	Type VARCHAR(100) NOT NULL,
	Representation VARCHAR(255) NOT NULL,
	Date_of_create DATE NOT NULL,
	Account_id INT NOT NULL,
	FOREIGN KEY (Account_id) REFERENCES Accounts(Id)
)

CREATE TABLE Artists_Songs
(
	Id INT PRIMARY KEY IDENTITY,
	Artist_id INT NOT NULL,
	Song_id INT NOT NULL,
	FOREIGN KEY (Artist_id) REFERENCES Artists(Id) ON DELETE CASCADE,
	FOREIGN KEY (Song_id) REFERENCES Songs(Id) ON DELETE CASCADE
)

CREATE TABLE Groups_Songs
(
	Id INT PRIMARY KEY IDENTITY,
	Group_id INT NOT NULL,
	Song_id INT NOT NULL,
	FOREIGN KEY (Group_id) REFERENCES Groups(Id) ON DELETE CASCADE,
	FOREIGN KEY (Song_id) REFERENCES Songs(Id) ON DELETE CASCADE
)

CREATE TABLE Albums_Genres
(
	Id INT PRIMARY KEY IDENTITY,
	Album_id INT NOT NULL,
	Genre_id INT NOT NULL,
	FOREIGN KEY (Album_id) REFERENCES Albums(Id) ON DELETE CASCADE,
	FOREIGN KEY (Genre_id) REFERENCES Genres(Id) ON DELETE CASCADE
)

CREATE TABLE Songs_Genres
(
	Id INT PRIMARY KEY IDENTITY,
	Song_id INT NOT NULL,
	Genre_id INT NOT NULL,
	FOREIGN KEY (Song_id) REFERENCES Songs(Id) ON DELETE CASCADE,
	FOREIGN KEY (Genre_id) REFERENCES Genres(Id) ON DELETE CASCADE
)

CREATE TABLE Artists_Albums
(
	Id INT PRIMARY KEY IDENTITY,
	Artist_id INT NOT NULL,
	Album_id INT NOT NULL,
	FOREIGN KEY (Artist_id) REFERENCES Artists(Id) ON DELETE CASCADE,
	FOREIGN KEY (Album_id) REFERENCES Albums(Id) ON DELETE CASCADE
)

CREATE TABLE Groups_Albums
(
	Id INT PRIMARY KEY IDENTITY,
	Group_id INT NOT NULL,
	Album_id INT NOT NULL,
	FOREIGN KEY (Group_id) REFERENCES Groups(Id) ON DELETE CASCADE,
	FOREIGN KEY (Album_id) REFERENCES Albums(Id) ON DELETE CASCADE
)

CREATE TABLE Groups_Artists
(
	Id INT PRIMARY KEY IDENTITY,
	Group_id INT NOT NULL,
	Artist_id INT NOT NULL,
	FOREIGN KEY (Group_id) REFERENCES Groups(Id) ON DELETE CASCADE,
	FOREIGN KEY (Artist_id) REFERENCES Artists(Id) ON DELETE CASCADE
)

CREATE TABLE Albums_Sertifications
(
	Id INT PRIMARY KEY IDENTITY,
	Album_id INT NOT NULL,
	Sertification_id INT NOT NULL,
	FOREIGN KEY (Album_id) REFERENCES Albums(Id) ON DELETE CASCADE,
	FOREIGN KEY (Sertification_id) REFERENCES Sertifications(Id) ON DELETE CASCADE
)

CREATE TABLE Songs_Sertifications
(
	Id INT PRIMARY KEY IDENTITY,
	Song_id INT NOT NULL,
	Sertification_id INT NOT NULL,
	FOREIGN KEY (Song_id) REFERENCES Songs(Id) ON DELETE CASCADE,
	FOREIGN KEY (Sertification_id) REFERENCES Sertifications(Id) ON DELETE CASCADE
)