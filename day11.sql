CREATE TABLE user (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL CHECK(name != ''),
    email TEXT UNIQUE,
    age INTEGER CHECK(age >= 18),
    country TEXT DEFAULT 'Pakistan'
);

INSERT INTO user VALUES (1,"ali","xyz@gmail.com",18,""),(2,"sara","xyz1@gmail.com",20,"");

SELECT * FROM user;