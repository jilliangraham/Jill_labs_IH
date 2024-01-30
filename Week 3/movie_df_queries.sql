#Business Framing: the assumption is that new movie producers like to pander to audience preferences, 
#so we should determine for our clients producer clients which genres yield the highest ratings. 

#we can see how ratings relate to gross profit. 

#if we have more time, we can also look at the average budget to gross profit 
#to ultimately suggest to clients how much they should spend on which genre to yield the highest profit margin.

#hypotheses:
#Ratings are a predictor of gross profit
#Drama yields higher gross profits than comedy
#Budgets are directly correlated with gross profit

#Which genre has the highest average rating?

USE movie_df;

#find the number of movies per genre
SELECT genre, COUNT(genre) AS number_of_movies_in_genre
FROM movie_df
GROUP BY genre;

#find the average rating of movies per genre
SELECT genre, COUNT(genre) AS number_of_movies_in_genre, AVG(score)
FROM movie_df
GROUP BY genre
ORDER BY AVG(score) DESC;

#Just making sure that the weighted average correlates to the average, given that there is a large variance of number of movies per genre
SELECT genre, COUNT(*) AS number_of_movies, AVG(score) AS average_rating, (AVG(score) / MAX(AVG(score)) OVER ()) * 100 AS normalized_weighted_rating
FROM movie_df
GROUP BY genre
ORDER BY normalized_weighted_rating DESC;

#Adventure is the most highly rated genre

#Find how ratings relate to gross profit. 

SELECT genre, AVG(score) AS average_rating, AVG(gross) AS gross_average
FROM movie_df
GROUP BY genre
ORDER BY gross_average DESC;

#interesting. Though Adventure scores the highest ratings, it is behind Action, Drama, and Comedy in terms of gross.

#Let's check for gross profit after it's been adjusted for inflation
SELECT genre, AVG(score) AS average_rating, AVG(inflation_adjusted_gross) AS adjusted_gross_average
FROM movie_df
GROUP BY genre
ORDER BY adjusted_gross_average DESC;

#Interesting. Though Adventure scored first in terms of rating and fourth in terms of gross profit, 
#Adventure scored second when the gross profit was adjusted for inflation. 
#I'm not quite sure what this means, so let's look how the popularity of different genres over the years by using rating as a proxy

#...

#Let's look at budgets, and how they affected profits. We will drop the adjusted_gross_profit since we don't have inflation adjusted budgets
SELECT genre, AVG(budget) AS budget_average, AVG(gross) AS gross_average
FROM movie_df
GROUP BY genre
ORDER BY budget_average DESC;

SELECT genre, AVG(budget) AS budget_average, AVG(gross) AS gross_average
FROM movie_df
GROUP BY genre
ORDER BY gross_average DESC;