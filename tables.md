# Описание сущностей
(имя поля, тип, ограничения, связь с другими сущностями)

## Аккаунт (Account)
|Имя поля|Тип|Ограничения|Описание|
|:-----:|:--:|:---------:|:------:|
|email|VARCHAR(100)|PK, NOT NULL, UNIQUE|Первичный ключ|
|password|VARCHAR(30)|NOT NULL|Пароль аккаунта|

## Посетитель (Visitor)
|Имя поля|Тип|Ограничения|Описание|
|:-----:|:--:|:---------:|:------:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|name|VARCHAR(200)|NOT NULL|ФИО Посетителя|
|nickname|VARCHAR(20)|NOT NULL, UNIQUE|Псевдоним|
|date_of_birth|DATE|NOT NULL|Дата рождения|
|account|VARCHAR(100)|FK, NOT NULL|Внешний ключ на аккаунт|

## Артист (Artist)
|Имя поля|Тип|Ограничения|Описание|
|:-----:|:--:|:---------:|:------:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|name|VARCHAR(200)|NOT NULL|ФИО Артиста|
|alias|VARCHAR(100)|NULL|Псевдоним артиста|
|date_of_birth|DATE|NOT NULL|Дата рождения|
|single_song|INT|FK, NULL|Внешний ключ на сингл Артиста|
|album|INT|FK, NULL|Внешний ключ на альбом Артиста|
|account|VARCHAR(100)|FK, NOT NULL|Внешний ключ на аккаунт|

## Группа (Group)
|Имя поля|Тип|Ограничения|Описание|
|:-----:|:--:|:---------:|:------:|
|id|PK|AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|title|VARCHAR(100)|NOT NULL|Название группы|
|founding_date|DATE|NOT NULL|Дата основания|
|artist|INT|FK, NOT NULL|Внешний ключ на члена группы|
|number_of_artists|INT|NOT NULL|Количество артистов в группе|
|album|INT|FK, NULL|Внешний ключ на альбом Группы|
|single_song|INT|FK, NULL|Внешний ключ на сингл Группы|
|account|VARCHAR(100)|FK, NOT NULL|Внешний ключ на аккаунт|

## Администратор (Admin)
|Имя поля|Тип|Ограничения|Описание|
|:-----:|:--:|:---------:|:------:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
name|VARCHAR(200)|NOT NULL|Имя|
nickname|VARCHAR(20)|NOT NULL|Ник админа|
date_of_birth|DATE|NOT NULL|Дата рождения
|account|VARCHAR(100)|FK, NOT NULL|Внешний ключ на аккаунт|

## Альбом (Album)
|Имя поля|Тип|Ограничения|Описание|
|:------:|:-:|:---------:|:------:|
|id|PK|AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|title|VARCHAR(100)|NOT NULL|Название альбома|
|date_of_writing|DATE|NOT NULL|Дата записи альбома|
|sertification|INT|FK, NULL|внешний ключ на Сертификацию|
|song|INT|FK, NOT NULL|Внешний ключ на Песню из Альбома|
|genre|INT|FK, NOT NULL|Внешний ключ на Жанр альбома|

## Песня (Single Song)
|Имя поля|Тип|Ограничения|Описание|
|:------:|:-:|:---------:|:------:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|title|VARCHAR(100)|NOT NULL|Название песни|
|date_of_writing|DATE|NOT NULL|Дата записи песни|
|sertification|INT|FK, NULL|Внешний ключ на сертификацию песни|
|genre|INT|FK, NOT NULL|Внешний ключ на Жанр песни|

## Жанр (Genre)
|Имя поля|Тип|Ограничения|Описание|
|:------:|:-:|:---------:|:------:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|title|VARCHAR(100)|NOT NULL|Название жанра|


## Сертификация (Sertification)
|Имя поля|Тип|Ограничения|Описание|
|:------:|:-:|:---------:|:------:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|type|INT|FK, NOT NULL|Категория сертификации|

## Категория сертификации (Sertification Category)
|Имя поля|Тип|Ограничения|Описание|
|:------:|:-:|:---------:|:------:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|title|VARCHAR(100)|NOT NULL|Тип|
|number_of_sales|INT|NOT NULL|Число продаж для соответствия категории|

## Роли (Roles)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | INT | PK, AUTO INCREMENT, NOT NULL, UNIQUE | первичный ключ |
| name | VARCHAR(50) | NOT NULL | название роли |
| permission | VARCHAR(128) | NOT NULL | право пользователя |

## Логи (Logs)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | INT | PK, AUTO INCREMENT, NOT NULL, UNIQUE | первичный ключ |
| user | VARCHAR(100) | FK, NOT NULL | внешний ключ на Аккаунт |
| type | VARCHAR(50) | NOT NULL | тип лога(CREATE/UPDATE/DELETE) |
| representation | VARCHAR(255) | NOT NULL | строковое представление изменённого кортежа |
