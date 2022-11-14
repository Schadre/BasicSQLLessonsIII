-- Inner join on the Actor and film_actor table 
SELECT actor.actor_id, first_name, last_name, film_id 
FROM film_actor 
INNER JOIN actor 
ON actor.actor_id = film_actor.actor_id; 

-- Left join on the actor and film_actor table 
SELECT actor.actor_id, first_name, last_name, film_id
FROM film_actor 
LEFT JOIN actor
ON actor.actor_id = film_actor.actor_id;

-- Join that will produce information about a customer
-- From the country of Angola
SELECT customer.first_name, customer.last_name, customer.email, country
FROM customer 
FULL JOIN address 
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country 
ON city.country_id = country.country_id
WHERE country = 'Angola';

-- SubQuery Examples

-- Two queries split apart
-- Find a customer_id that has an amount greater than 175 in total payments
SELECT customer_id
FROM payment 
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC; 

-- Subquery to find the customer_id that has an amount greater than 175 in total payments
SELECT store_id, first_name, last_name
FROM customer 
WHERE customer_id IN (
	SELECT customer_id
	FROM payment 
	GROUP BY customer_id 
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
)
GROUP BY store_id, first_name, last_name
LIMIT 5;

-- Find customers in Angola who have a sum amount of purchases > 175
SELECT customer.first_name, customer.last_name, customer.email, country
FROM customer 
INNER JOIN address
ON customer.address_id = address.address_id 
INNER JOIN city 
ON address.city_id = city.city_id 
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Angola' AND customer_id IN (
	SELECT customer_id 
	FROM payment 
	GROUP BY customer_id 
	HAVING SUM(amount) < 175
	ORDER BY SUM(amount) DESC
);


-- Basic subquery
SELECT * 
FROM customer 
WHERE customer_id IN (
	SELECT customer_id 
	FROM payment 
	GROUP BY customer_id 
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);

-- Basic subquery
-- Find all films with a language of English
SELECT *
FROM film
WHERE language_id IN (
	SELECT language_id 
	FROM LANGUAGE
	WHERE NAME = 'English'
);

SELECT 
	CASE 
		WHEN film_id = 1 THEN 'Film ID One!'
		ELSE 'Not film ID One!'
	END 
AS as_film_one
FROM film;

	END
	