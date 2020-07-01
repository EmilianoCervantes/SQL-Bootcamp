-- SELECT
-- SELECT * FROM film;
-- Un par de columnas
-- SELECT title, description from film;
-- SELECT first_name, last_name, last_update FROM actor;
-- Challenge nombre completo e email de customers activos.
-- SELECT first_name, last_name, email FROM customer WHERE active=1;

-- DISTINCT: cosas únicas con base en la columna.
-- SELECT DISTINCT release_year FROM film; -- Los diferentes años, en este caso, todas las pelis fueron en 2006
-- SELECT DISTINCT (rental_rate) FROM film;
-- Challenge: saber los distintos movie ratings
-- SELECT DISTINCT rating FROM film;

-- COUNT: número de filas. Más útil cuando se junta con otros queries.
-- SELECT COUNT(amount) FROM payment;
-- SELECT COUNT(DISTINCT amount) FROM payment;
-- SELECT COUNT(DISTINCT rating) FROM film;

-- WHERE: condición de if --> Select ... from ... where ... ;
-- SELECT * FROM film WHERE length >= 117 AND rating != 'PG';
-- SELECT COUNT(title) FROM film WHERE replacement_cost > 19.99 AND rating = 'R';
-- Challenge 1: customer olvidó su billetera, obtener email de Nancy Thomas
-- SELECT email FROM customer WHERE first_name='Nancy' AND last_name='Thomas';
-- Challenge 2: cliente quiere saber acerca de la película Outlaw Hanky
-- SELECT description FROM film WHERE title='Outlaw Hanky';
-- Challenge 2: cliente va tarde para devolver una peli. Obtener el tel de la dirección 259 Ipoh Drive
-- SELECT phone from address WHERE address='259 Ipoh Drive';

-- ORDER BY: ordenar ASC o DESC --> Select ... from ... order by ... ;
-- SELECT * FROM customer ORDER BY store_id, first_name DESC;

-- LIMIT: núm máx de respuestas que quieres.
-- SELECT * FROM payment WHERE amount > 1 ORDER BY payment_date DESC LIMIT 20;
-- Challenge 1: reconocer los primeros 10 pagos, obtener ids
-- SELECT customer_id FROM payment ORDER BY payment_date ASC LIMIT 10;
-- Challenge 2: Un cliente quiere rentar un video. Titulos de los 5 más cortos.
-- SELECT title from film ORDER BY length ASC LIMIT 5;
-- Challenge 3: si un usuario puede ver cualquier peli de 50 min ó menos, ¿cuántas opciones tiene?
-- SELECT COUNT(title) FROM film WHERE length <= 50;

-- BETWEEN: valor BETWEEN low AND high, low & high se incluyen
-- valor NOT BETWEEN low AND high, low & high
-- date BETWEEN '2007-01-01' AND '2007-02-01'
-- SELECT * FROM payment WHERE amount BETWEEN 8 AND 9;
-- SELECT * FROM payment WHERE amount NOT BETWEEN 8 AND 9;
-- SELECT COUNT(amount) FROM payment WHERE amount BETWEEN 8 AND 9;
-- SELECT COUNT(amount) FROM payment WHERE amount NOT BETWEEN 8 AND 9;
-- SELECT * FROM payment WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';

-- IN: en vez de poner muchos "ORs" --> value IN (...opciones)
-- SELECT * FROM payment WHERE amount NOT IN (0.99, 1.98, 5.99);
-- SELECT * FROM customer WHERE first_name IN ('John', 'Jake', 'Julie');

-- LIKE: matches
-- % cualquier secuencia de caracteres --> WHERE name LIKE 'A%'
-- _ cualquier caracter --> WHERE title LIKE 'Mission Impossible _' donde _ es 1,2,3,4,...
-- WHERE name LIKE '_her%' --> Cheryl, Theresa, Sherri
-- ILIKE: si no me quiero preocupar por mayúsculas y minúsculas
-- SELECT * FROM customer WHERE first_name LIKE 'J%' ORDER BY first_name;
-- SELECT * FROM customer WHERE first_name LIKE 'j%'; --> No regresa nada
-- SELECT * FROM customer WHERE first_name ILIKE 'j%'; --> No le importa la minúscula
-- SELECT * FROM customer WHERE first_name NOT ILIKE '%a%';

-- CHALLENGES GENERALES 1: ¿Cuántas transacciones de pagos mayores a $5 hay?
-- SELECT COUNT(payment_id) FROM payment WHERE amount > 5;
-- CHALLENGES GENERALES 2: ¿Cuántos actores su primer nombre empieza con p?
-- SELECT COUNT(*) FROM actor WHERE first_name ILIKE 'p%';
-- CHALLENGES GENERALES 3: ¿Cuántos distritos únicos hay para nuestros customers?
-- SELECT COUNT(DISTINCT district) FROM address;
-- CHALLENGES GENERALES 4: tomar los nombres del anterior
-- SELECT DISTINCT district FROM address;
-- CHALLENGES GENERALES 5: ¿Cuántas pelis tienen rating R y reemplazo cuesta entre 5 y 15?
-- SELECT COUNT(*) FROM film WHERE rating='R' AND replacement_cost BETWEEN 5 AND 15;
-- CHALLENGES GENERALES 6: ¿Cuántas pelis contienen la palabra Truman?
SELECT COUNT(*) FROM film WHERE title LIKE '%Truman%';









