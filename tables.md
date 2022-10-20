# Описание сущностей
(имя поля, тип, ограничения, связь с другими сущностями)

## Аккаунт (Account)
|Имя поля|Тип|Ограничения|Описание|
|:-----:|:--:|:---------:|:------:|
|id|INT|PK, NOT NULL, AUTO INCREMENT, UNIQUE|Первичный ключ|
|email|VARCHAR(100)|NOT NULL, UNIQUE|Первичный ключ|
|password|VARCHAR(30)|NOT NULL|Пароль аккаунта|
|role_id|INT|FK, NOT NULL|Внешний ключ на роль пользователя|

## Посетитель (Visitor)
|Имя поля|Тип|Ограничения|Описание|
|:-----:|:--:|:---------:|:------:|
|id|PK|AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|name|VARCHAR(200)|NOT NULL|ФИО Посетителя|
|nickname|VARCHAR(20)|NOT NULL, UNIQUE|Псевдоним|
|date_of_birth|DATE|NOT NULL|Дата рождения|
|account_id|INT|FK, NOT NULL|Внешний ключ на аккаунт|

## Артист (Artist)
|Имя поля|Тип|Ограничения|Описание|
|:-----:|:--:|:---------:|:------:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|name|VARCHAR(200)|NOT NULL|ФИО Артиста|
|alias|VARCHAR(100)|NULL|Псевдоним артиста|
|date_of_birth|DATE|NOT NULL|Дата рождения|
|account_id|INT|FK, NOT NULL|Внешний ключ на аккаунт|

## Группа (Group)
|Имя поля|Тип|Ограничения|Описание|
|:-----:|:--:|:---------:|:------:|
|id|PK|AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|title|VARCHAR(100)|NOT NULL|Название группы|
|founding_date|DATE|NOT NULL|Дата основания|
|number_of_artists|INT|NOT NULL|Количество артистов в группе|
|account_id|INT|FK, NOT NULL|Внешний ключ на аккаунт|

## Песня (Single Song)
|Имя поля|Тип|Ограничения|Описание|
|:------:|:-:|:---------:|:------:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|title|VARCHAR(100)|NOT NULL|Название песни|
|date_of_writing|DATE|NOT NULL|Дата записи песни|

## Администратор (Admin)
|Имя поля|Тип|Ограничения|Описание|
|:-----:|:--:|:---------:|:------:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|name|VARCHAR(200)|NOT NULL|Имя|
|nickname|VARCHAR(20)|NOT NULL|Ник админа|
|date_of_birth|DATE|NOT NULL|Дата рождения
|account_id|INT|FK, NOT NULL|Внешний ключ на аккаунт|
|log_id|INT|FK, NOT NULL|Внешний ключ на логи|

## Альбом (Album)
|Имя поля|Тип|Ограничения|Описание|
|:------:|:-:|:---------:|:------:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|title|VARCHAR(100)|NOT NULL|Название альбома|
|date_of_writing|DATE|NOT NULL|Дата записи альбома|

## Жанр (Genre)
|Имя поля|Тип|Ограничения|Описание|
|:------:|:-:|:---------:|:------:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|title|VARCHAR(100)|NOT NULL|Название жанра|


## Сертификация (Sertification)
|Имя поля|Тип|Ограничения|Описание|
|:------:|:-:|:---------:|:------:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|title|VARCHAR(100)|NOT NULL|Тип|
|number_of_sales|INT|NOT NULL|Число продаж для соответствия категории|

## Роли (Roles)
|Имя Поля | Тип | Ограничения | Описание |
|:---:|:---:|:---:|:---:|
| id | INT | PK, AUTO INCREMENT, NOT NULL, UNIQUE | Первичный ключ |
| title | VARCHAR(50) | NOT NULL | Название роли |

## Права (Permissions)
|Имя поля|Тип|Ограничения|Описание|
|:------:|:-:|:---------:|:------:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|title|VARCHAR(50)|NOT NULL|Название роли|

## Роли и Права (Roles & Permissions)
|Имя поля|Тип|Ограничения|Описание|
|:------:|:-:|:---------:|:------:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE|Первичный ключ|
|role_id|INT|FK, NOT NULL|Внешний ключ на Роль|
|permission_id|INT|FK, NOT NULL|Внешний ключ на Право|

## Логи (Logs)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
| id | INT | AUTO INCREMENT, NOT NULL,  UNIQUE | Первичный ключ |
| account_id | INT | FK, NOT NULL | внешний ключ на Аккаунт |
| type | VARCHAR(50) | NOT NULL | тип лога(CREATE/UPDATE/DELETE) |
| representation | VARCHAR(255) | NOT NULL | строковое представление изменённого кортежа |
|date_of_create|DATE|NOT NULL|Дата создания|

## Артист и Песня (Artist & Song)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE| Первичный ключ|
|artist_id|INT|FK, NOT NULL|Внешний ключ на Артиста|
|song_id|INT|FK, NOT NULL|Внешний ключ на Песню|

## Группа и Песня (Group & Song)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE| Первичный ключ|
|group_id|INT|FK, NOT NULL|Внешний ключ на Группу|
|song_id|INT|FK, NOT NULL|Внешний ключ на Песню|

## Альбом и Жанр (Album & Genre)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE| Первичный ключ|
|album_id|INT|FK, NOT NULL|Внешний ключ на Альбом|
|genre_id|INT|FK, NOT NULL|Внешний ключ на Жанр|

## Песня и Жанр (Song & Genre)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE| Первичный ключ|
|song_id|INT|FK, NOT NULL|Внешний ключ на Песню|
|genre_id|INT|FK, NOT NULL|Внешний ключ на Жанр|

## Артист и Альбом (Artist & Album)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE| Первичный ключ|
|artist_id|INT|FK, NOT NULL|Внешний ключ на Артист|
|album_id|INT|FK, NOT NULL|Внешний ключ на Альбом|

## Группа и Альбом (Group & Album)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE| Первичный ключ|
|group_id|INT|FK, NOT NULL|Внешний ключ на Группу|
|album_id|INT|FK, NOT NULL|Внешний ключ на Альбом|

## Группа и Артист (Group & Artist)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE| Первичный ключ|
|group_id|INT|FK, NOT NULL|Внешний ключ на Группу|
|artist_id|INT|FK, NOT NULL|Внешний ключ на Артиста|

## Альбом и Сертификация (Album & Sertification)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE| Первичный ключ|
|album_id|INT|FK, NOT NULL|Внешний ключ на Альбома|
|sertification_id|INT|FK, NOT NULL|Внешний ключ на Сертификацию|

## Песня и Сертификация (Song & Sertification)
|имя поля | тип | ограничения | описание |
|:---:|:---:|:---:|:---:|
|id|INT|PK, AUTO INCREMENT, NOT NULL, UNIQUE| Первичный ключ|
|song_id|INT|FK, NOT NULL|Внешний ключ на Песню|
|sertification_id|INT|FK, NOT NULL|Внешний ключ на Сертификацию|


связи многие-ко многим для которых были созданы промежуточные таблицы:

1. у песни может быть много авторов. У артиста может быть много песен 
2. У песни может быть много авторов в качестве групп. У группы может быть много песен 
3. У альбома может быть много жанров. У одного жанра может быть много альбомов 
4. У артиста может быть много альбомов. У одного альбома может быть много авторов (артистов) 
5. У группы может быть много альбомов. У одного альбома может быть много групп (в качестве авторов) 
6. У песни может быть много жанров. У одного жанра может быть много песен 
7. У группы может быть много участников. У артиста может быть много групп 
8. У песни может быть много разных сертификаций. У одной сертификации может быть много песен 
9. У альбома может быть много разных сертификаций. У одной сертификации может быть много альбомов 