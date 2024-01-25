#Display all available tables in the Sakila database.

USE sakila;

SHOW TABLES;

#Retrieve all the data from the tables actor, film and customer.
SELECT * FROM actor;

SELECT * FROM film;

SELECT * FROM customer;

#Retrieve the following columns from their respective tables:
#3.1 Titles of all films from the film table
SELECT title FROM film;

#3.2 List of languages used in films, with the column aliased as language from the language table
SELECT name FROM language AS language;
#English, Italian, Japanese, Mandarin, French, German

#3.3 List of first names of all employees from the staff table
SELECT first_name FROM staff;
#Mike, Jon

#Retrieve unique release years.
SELECT DISTINCT release_year FROM film;
#1

#Counting records for database insights:
#5.1 Determine the number of stores that the company has.
SELECT DISTINCT store_id FROM store;
#2

#5.2 Determine the number of employees that the company has.
SELECT DISTINCT staff_id FROM staff;
#2

#5.3 Determine how many films are available for rent and how many have been rented.
SELECT COUNT(rental_id) as films_rented
FROM rental
WHERE return_date IS NULL;
#returns 183

SELECT COUNT(return_date) as films_returned
FROM rental
WHERE return_date IS NOT NULL;
#returns 15861

#films available for rent: 15861-183 = 15678

#5.4 Determine the number of distinct last names of the actors in the database.
SELECT count(DISTINCT last_name) from actor;
#121 distinct last names

#Retrieve the 10 longest films.
SELECT length from film
ORDER BY length DESC
LIMIT 10;

#Use filtering techniques in order to:
#7.1 Retrieve all actors with the first name "SCARLETT".

SELECT first_name FROM actor
WHERE first_name = "SCARLETT";
#2