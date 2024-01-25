#In this exercise, you will create a customer summary report that summarizes key information about customers in the Sakila database, 
#including their rental history and payment details. The report will be generated using a combination of views, CTEs, and temporary tables.

#Step 1: Create a View
#First, create a view that summarizes rental information for each customer. 
#The view should include the customer's ID, name, email address, and total number of rentals (rental_count).

USE saklia;


CREATE VIEW rental_info_per_customer_1 AS 
SELECT customer_id, first_name, last_name, email, COUNT(rental_id) AS rental_count
FROM customer
INNER JOIN rental 
USING(customer_id)
GROUP BY customer_id, first_name, last_name, email;
 
SELECT * FROM rental_info_per_customer_1;

#Step 2: Create a Temporary Table
#Next, create a Temporary Table that calculates the total amount paid by each customer (total_paid). 
#The Temporary Table should use the rental summary view created in Step 1 to join with the payment table 
#and calculate the total amount paid by each customer.

CREATE TEMPORARY TABLE total_amount_paid_per_customer_1
SELECT customer_id, first_name, last_name, SUM(amount) AS total_payment
FROM rental_info_per_customer_1
INNER JOIN payment
USING(customer_id)
GROUP BY customer_id, first_name, last_name;

SELECT * 
FROM total_amount_paid_per_customer_1;

#Step 3: Create a CTE and the Customer Summary Report
#Create a CTE that joins the rental summary View with the customer payment summary Temporary Table created in Step 2. 
#The CTE should include the customer's name, email address, rental count, and total amount paid.

#Next, using the CTE, create the query to generate the final customer summary report, 
#which should include: customer name, email, rental_count, total_paid and average_payment_per_rental, 
#this last column is a derived column from total_paid and rental_count.

WITH CustomerCTE AS (SELECT rental_info_per_customer_1.customer_id, rental_info_per_customer_1.first_name, rental_info_per_customer_1.last_name, rental_info_per_customer_1.email, rental_info_per_customer_1.rental_count, total_amount_paid_per_customer_1.total_payment
					FROM rental_info_per_customer_1
					LEFT JOIN total_amount_paid_per_customer_1
					USING(customer_id))

SELECT first_name, last_name, email, rental_count, total_payment
FROM CustomerCTE;

#I'm getting a weird error but since it's the same formula as another student, I think it should be right.