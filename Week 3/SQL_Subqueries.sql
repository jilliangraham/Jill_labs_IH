#Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.

SELECT COUNT(inventory_id)
FROM inventory
WHERE film_id = (SELECT film_id
					FROM film
					WHERE title = "Hunchback Impossible");

#List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT title
FROM film 
WHERE length > (SELECT AVG(length) 
				FROM film);

#Use a subquery to display all actors who appear in the film "Alone Trip".
SELECT first_name, last_name
FROM actor
WHERE actor_id IN (SELECT actor_id
					FROM film_actor
					WHERE film_id = (SELECT film_id
										FROM film
										WHERE title = "Alone Trip"));
                                        
#Sales have been lagging among young families, and you want to target family movies for a promotion. 
#Identify all movies categorized as family films.

SELECT title
FROM film
WHERE film_id IN (SELECT film_id
					FROM film_category
					WHERE category_id = (SELECT category_id
											FROM category
											WHERE name = (SELECT name
															FROM category
															WHERE name = "Family")));
                                                            


#Retrieve the name and email of customers from Canada using both subqueries and joins. 
#To use joins, you will need to identify the relevant tables and their primary and foreign keys.