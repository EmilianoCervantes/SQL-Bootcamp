-- AS: alias --> Select ... AS nuevo_nombre FROM table;
-- Se ejecuta hasta el final del query.
-- Por tanto, no se puede usar en el WHERE ni en HAVING.
-- SELECT amount AS precio FROM payment; -- Columna amount ahora se llama precio.
-- SELECT COUNT(*) as num_transacciones FROM payment;
/*
SELECT customer_id, SUM(amount) AS total_gastado
	FROM payment GROUP BY customer_id;
*/

-----------
-- JOINS --
-----------

-- INNER JOIN: resultado es la info que aparece en dos tablas.
-- Sintáxis: SELECT * FROM TablaA INNER JOIN TablaB ON TablaA.col_match = TablaB.col_match
-- Nota: las columnas del mismo nombre NO se eliminan, se duplican.
-- Para eñiminar las repetidas es así en el Select: TablaA.col_match ó TablaB.col_match
/*
SELECT id, Logins.name, log_id
	FROM Registrations INNER JOIN Logins ON Registrations.name = Logins.name
*/
-- SELECT payment_id, payment.customer_id, first_name FROM payment INNER JOIN customer ON payment.customer_id = customer.customer_id;

-- FULL OUTER JOIN: toma todo, no importa la presencia de los elementos en la otra tabla.
/* Nota: se pide todo, así que si no hay un match de TablaA.col_match ó del lado de TablaB.col_match,
	los campos de las columnas de la otra tabla respectivamente, quedarán como null.
*/
-- SELECT COUNT(*) FROM payment FULL OUTER JOIN customer ON payment.customer_id = customer.customer_id;

-- FULL OUTER JOIN + WHERE: es equivalente a un XOR, es decir, tomar los elementos únicos de cada tabla.
/*
SELECT * FROM TablaA FULL OUTER JOIN TablaB ON TablaA.col_match = TablaB.col_match
	WHERE TablaA.id IS NULL OR TableB.id IS null
*/
/*
SELECT COUNT(*) FROM payment FULL OUTER JOIN customer ON payment.customer_id = customer.customer_id
	WHERE payment.customer_id IS NULL OR customer.customer_id IS NULL;
*/

-- LEFT OUTER JOIN: todo lo de la izq del diagrama de venn - primera tabla
-- FROM primera LEFT OUTER JOIN segunda
/*
SELECT film.film_id, title, inventory_id FROM inventory
	LEFT OUTER JOIN film ON inventory.film_id = film.film_id;
*/ -- Listado de pelis en nuestro inventorio
/*
SELECT film.film_id, title, inventory_id, store_id FROM film
	LEFT OUTER JOIN inventory ON inventory.film_id = film.film_id
	WHERE inventory.film_id IS null;
*/ -- pelis que existen pero no están en nuestro inventorio

-- RIGHT OUTER JOIN: todo lo de la derecha del diagrama de venn
-- Igual que el LEFT, nada más que en vez de tomar todo hacia la primera, se toma a la segunda
/*
SELECT film.film_id, title, inventory_id FROM film
	RIGHT OUTER JOIN inventory ON inventory.film_id = film.film_id;
*/

-- UNION: combinar los resultados de más de un select
/* Sintaxis:
Select nombres_columnas FROM tabla1
UNION
Select nombres_columnas FROM tabla2;
*/

-- Challenges 1: debemos notificar a los clientes por correo que vivan en California.
/*
SELECT email,customer.address_id FROM customer
	LEFT OUTER JOIN address ON customer.address_id = address.address_id
	WHERE district ILIKE 'cali%';
*/
-- Challenges 2: Listado de todas las pelis en las que sale 'Nick Wahlberg'
-- OPCIÓN 1) Que fue la que yo hice
/*
SELECT title,film_actor.film_id,film_actor.actor_id,first_name,last_name FROM film
	LEFT OUTER JOIN film_actor
	ON film.film_id = film_actor.film_id
	LEFT OUTER JOIN actor
	ON film_actor.actor_id = actor.actor_id
	WHERE first_name='Nick' AND last_name='Wahlberg';
*/
-- OPCION 2) Con Sólo INNER JOIN y partiendo desde actor
/*
SELECT title,film_actor.film_id,film_actor.actor_id,first_name,last_name FROM actor
	INNER JOIN film_actor
	ON film_actor.actor_id = actor.actor_id
	INNER JOIN film
	ON film.film_id = film_actor.film_id
	WHERE first_name='Nick' AND last_name='Wahlberg';
*/
-- OPCIÓN 3) Yo la hice, RENOMBRANDO las tablas
SELECT title,fa.film_id,fa.actor_id,first_name,last_name FROM film f
	LEFT OUTER JOIN film_actor fa
	ON f.film_id = fa.film_id
	LEFT OUTER JOIN actor a
	ON fa.actor_id = a.actor_id
	WHERE first_name='Nick' AND last_name='Wahlberg';
