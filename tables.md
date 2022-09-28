# Описание сущностей
(имя поля, тип, ограничения, связь с другими сущностями)

## Аккаунт (Account)
|Имя поля|Тип|Ограничения|Описание|
|:-----:|:--:|:---------:|:------:|
|email|PK|NOT NULL, UNIQUE|Первичный ключ|
|password|VARCHAR(30)|NOT NULL|Пароль аккаунта|

## Посетитель (Visitor)
|Имя поля|Тип|Ограничения|Описание|
|:-----:|:--:|:---------:|:------:|
|id|PK|AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|name|VARCHAR(200)|NOT NULL|ФИО Посетителя|
|nickname|VARCHAR(20)|NOT NULL, UNIQUE|Псевдоним|
|date_of_birth|DATE|NOT NULL|Дата рождения|
|account|FK|NOT NULL|Внешний ключ на аккаунт|

## Артист (Artist)
|Имя поля|Тип|Ограничения|Описание|
|:-----:|:--:|:---------:|:------:|
|id|PK|AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|name|VARCHAR(200)|NOT NULL|ФИО Артиста|
|alias|VARCHAR(100)|NULL|Псевдоним артиста|
|date_of_birth|DATE|NOT NULL|Дата рождения|
|single_song|FK|NULL|Внешний ключ на сингл Артиста|
|album|FK|NULL|Внешний ключ на альбом Артиста|
|account|FK|NOT NULL|Внешний ключ на аккаунт|

## Группа (Group)
|Имя поля|Тип|Ограничения|Описание|
|:-----:|:--:|:---------:|:------:|
|id|PK|AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|title|VARCHAR(100)|NOT NULL|Название группы|
|founding_date|DATE|NOT NULL|Дата основания|
|artist|FK|NOT NULL|Внешний ключ на члена группы|
|number_of_artists|INT|NOT NULL|Количество артистов в группе|
|album|FK|NULL|Внешний ключ на альбом Группы|
|single_song|FK|NULL|Внешний ключ на сингл Группы|
|account|FK|NOT NULL|Внешний ключ на аккаунт|

## Администратор (Admin)
|Имя поля|Тип|Ограничения|Описание|
|:-----:|:--:|:---------:|:------:|
|id|PK|AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
name|VARCHAR(200)|NOT NULL|Имя|
nickname|VARCHAR(20)|NOT NULL|Ник админа|
date_of_birth|DATE|NOT NULL|Дата рождения
|account|FK|NOT NULL|Внешний ключ на аккаунт|

## Альбом (Album)
|Имя поля|Тип|Ограничения|Описание|
|:------:|:-:|:---------:|:------:|
|id|PK|AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|title|VARCHAR(100)|NOT NULL|Название альбома|
|date_of_writing|DATE|NOT NULL|Дата записи альбома|
|sertification|FK|NULL|внешний ключ на Сертификацию|
|song|FK|NOT NULL|Внешний ключ на Песню из Альбома|
|genre|FK|NOT NULL|Внешний ключ на Жанр альбома|

## Песня (Single Song)
|Имя поля|Тип|Ограничения|Описание|
|:------:|:-:|:---------:|:------:|
|id|PK|AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|title|VARCHAR(100)|NOT NULL|Название песни|
|date_of_writing|DATE|NOT NULL|Дата записи песни|
|sertification|FK|NULL|Внешний ключ на сертификацию песни|
|genre|FK|NOT NULL|Внешний ключ на Жанр песни|

## Жанр (Genre)
|Имя поля|Тип|Ограничения|Описание|
|:------:|:-:|:---------:|:------:|
|id|PK|AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|title|VARCHAR(100)|NOT NULL|Название жанра|


## Сертификация (Sertification)
|Имя поля|Тип|Ограничения|Описание|
|:------:|:-:|:---------:|:------:|
|id|PK|AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|type|FK|NOT NULL|Категория сертификации|

## Категория сертификации (Sertification Category)
|Имя поля|Тип|Ограничения|Описание|
|:------:|:-:|:---------:|:------:|
|id|PK|AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|title|VARCHAR(100)|NOT NULL|Тип|
|number_of_sales|INT|NOT NULL|Число продаж для соответствия категории|

## Роли (Roles)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | PK | auto increment; not null; unique | первичный ключ |
| name | VARCHAR(50) | not null | название роли |
| permission | VARCHAR(128) | not null | право пользователя |

## Логи (Logs)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | pk | auto increment; not null; unique | первичный ключ |
| user | fk | not null | внешний ключ на пользователя |
| type | VARCHAR(50) | not null | тип лога(CREATE/UPDATE/DELETE) |
| representation | VARCHAR(255) | not null | строковое представление изменённого кортежа |