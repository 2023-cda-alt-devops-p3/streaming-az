### REQUETE SQL :

```sql 

SELECT title_movie, publish_date_movie
FROM movie
ORDER BY publish_date_movie DESC;

``` 


```sql 

SELECT firstname_actor, lastname_actor, 
    TIMESTAMPDIFF(YEAR, BOD_actor, CURDATE()) AS age
FROM actor
WHERE TIMESTAMPDIFF(YEAR, BOD_actor, CURDATE()) > 30
ORDER BY lastname_actor, firstname_actor;

```



```sql 

SELECT a.firstname_actor, a.lastname_actor
FROM actor AS a
JOIN role AS r ON a.id_actor = r.id_actor
JOIN movie AS m ON r.id_movie = m.id_movie
WHERE m.title_movie = 'Avatar';

 ```

```sql 
 
 SELECT DISTINCT m.title_movie
FROM movie AS m
JOIN role AS r ON m.id_movie = r.id_movie
JOIN actor AS a ON r.id_actor = a.id_actor
WHERE a.firstname_actor = 'Brad' AND a.lastname_actor = 'Pitt';
 
 
 ```

```sql

INSERT INTO movie (title_movie, duration_movie, publish_date_movie, filmmaker_movie, id_filmmaker)
VALUES ('New Movie Title', 120, '2023-10-15', 'Director Name', 1);

 
 ```



```sql
 
INSERT INTO actor (firstname_actor, lastname_actor, BOD_actor)
VALUES ('New First Name', 'New Last Name', 'YYYY-MM-DD');

 
 ```


```sql

UPDATE movie
SET
    title_movie = 'New Movie Title',
    duration_movie = 130,
    publish_date_movie = '2023-10-20',
    filmmaker_movie = 'New Director Name'
WHERE title_movie = 'X movie';


 ```

```sql
 
DELETE FROM actor
WHERE id_actor = X;

 
 ```


```sql
 
SELECT firstname_actor, lastname_actor
FROM actor
ORDER BY id_actor DESC
LIMIT 3;

 ```


 ### Procédure stocké :
```sql

 DELIMITER //

CREATE PROCEDURE GetMoviesByFilmmaker(IN filmmakerName VARCHAR(100))
BEGIN
    SELECT title_movie
    FROM movie
    WHERE filmmaker_movie = filmmakerName;
END;
//

DELIMITER ;
```

- L'appel :
```sql
CALL GetMoviesByFilmmaker('Director Name');

```

### Trigger :

- Création de la table archive : 

```sql
CREATE TABLE user_archive (
    id_user_archive INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT,
    change_date TIMESTAMP,
    old_firstname VARCHAR(100),
    old_lastname VARCHAR(100),
    old_role VARCHAR(50),
    old_email_address VARCHAR(100),
    new_firstname VARCHAR(100),
    new_lastname VARCHAR(100),
    new_role VARCHAR(50),
    new_email_address VARCHAR(100)
);

```

- Création du trigger :

```sql
DELIMITER //

CREATE TRIGGER user_archive_trigger
AFTER UPDATE ON user
FOR EACH ROW
BEGIN
    INSERT INTO user_archive (id_user, change_date, old_firstname, old_lastname, old_role, old_email_address, new_firstname, new_lastname, new_role, new_email_address)
    VALUES (
        OLD.id_user,
        NOW(),
        OLD.firstname_user,
        OLD.lastname_user,
        OLD.role_user,
        OLD.email_address_user,
        NEW.firstname_user,
        NEW.lastname_user,
        NEW.role_user,
        NEW.email_address_user
    );
END;
//

DELIMITER ;

```