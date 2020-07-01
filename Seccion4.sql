-- ASSESSMENT TEST 1 - 1: customer ids de clientes que gastaron al menos 110 con staff 2
/* SELECT customer_id,SUM(amount) FROM payment WHERE staff_id=2
	GROUP BY customer_id HAVING SUM(amount)>=110;
	*/
-- ASSESSMENT TEST 1 - 2: ¿Cuántas pelis empiezan con J?
-- SELECT COUNT(title) FROM film WHERE title LIKE 'J%';
-- ASSESSMENT TEST 1 - 3: ¿Qué cliente tiene el último id, cuyo nombre empieza con E y un address_id menor a 500?
SELECT first_name,last_name FROM customer WHERE first_name ILIKE 'e%' AND address_id < 500
	ORDER BY customer_id DESC LIMIT 1;
	
