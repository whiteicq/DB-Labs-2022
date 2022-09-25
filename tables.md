# Описание сущностей
(имя поля, тип, ограничения, связь с другими сущностями)

## Аккаунт посетителя (Visitor Account)
|Имя поля|Тип|Ограничения|Описание|
|:-----:|:--:|:---------:|:------:|
|id|PK|AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|name|VARCHAR(200)|NOT NULL|ФИО Посетителя|
|nickname|VARCHAR(20)|NOT NULL, UNIQUE|Псевдоним|
|date_of_birth|DATE|NOT NULL|Дата рождения|
|email|VARCHAR(100)|NOT NULL|Почта Посетителя|
|password|VARCHAR(30)|NOT NULL|Пароль Посетителя|

## Аккаунт артиста (Artist Account)
|Имя поля|Тип|Ограничения|Описание|
|:-----:|:--:|:---------:|:------:|
|id|PK|AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|name|VARCHAR(200)|NOT NULL|ФИО Артиста|
|alias|VARCHAR(100)|NOT NULL|Псевдоним артиста|
|date_of_birth|DATE|NOT NULL|Дата рождения|
|email|VARCHAR(100)|NOT NULL|Почта Артиста|
|password|VARCHAR(30)|NOT NULL|Пароль Артиста|
|single_song|FK|NULL|Внешний ключ на сингл Артиста|
|album|FK|NULL|Внешний ключ на альбом Артиста|

## Аккаунт группы (Group Account)
|Имя поля|Тип|Ограничения|Описание|
|:-----:|:--:|:---------:|:------:|
|id|PK|AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|title|VARCHAR(100)|NOT NULL|Название группы|
|founding_date|DATE|NOT NULL|Дата основания|
|artist|FK|NOT NULL|Внешний ключ на члена группы|
|number_of_artists|INT|NOT NULL|Количество артистов в группе|
|email|VARCHAR(100)|NOT NULL|Почта Группы|
|password|VARCHAR(30)|NOT NULL|Пароль Группы|
|album|FK|NULL|Внешний ключ на альбом Группы|
|single_song|FK|NULL|Внешний ключ на сингл Группы|

## Альбом (Album)
|Имя поля|Тип|Ограничения|Описание|
|:------:|:-:|:---------:|:------:|
|id|PK|AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|title|VARCHAR(100)|NOT NULL|Название альбома|
|author|FK|NOT NULL|Внешний ключ на артиста-автора альбома|
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
|author|FK|NOT NULL|Внешний ключ на артиста-автора песни|
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

## Категория сертификации (Certification Category)
|Имя поля|Тип|Ограничения|Описание|
|:------:|:-:|:---------:|:------:|
|id|PK|AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|title|VARCHAR(100)|NOT NULL|Тип|
|number_of_sales|FLOAT|NOT NULL|Число продаж для соответствия категории|

## Роли (Roles)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | PK | AUTO INCREMENT, NOT NULL, UNIQUE | первичный ключ |
| name | VARCHAR(50) |  NOT NULL | название роли |
| permission | VARCHAR(128) | NOT NULL | право пользователя |

## Логи (Logs)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | PK | AUTO INCREMENT, NOT NULL, UNIQUE | первичный ключ |
| user | FK | NOT NULL | внешний ключ на пользователя |
| type | VARCHAR(50) | NOT NULL | тип лога(CREATE/UPDATE/DELETE) |
| representation | VARCHAR(255) | NOT NULL | строковое представление изменённого кортежа |
