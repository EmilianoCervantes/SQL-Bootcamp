-- Aggregate Functions: tomar muchos valores y regresar una respuesta.
-- Ej: AVG() COUNT() MIN() MAX() SUM()
-- SELECT MIN(replacement_cost) FROM film;
-- SELECT MAX(replacement_cost), MIN(replacement_cost) FROM film;
-- SELECT AVG(replacement_cost) FROM film;
-- SELECT ROUND(AVG(replacement_cost), 3) FROM film;
-- SELECT SUM(replacement_cost) FROM film;

-- GROUP BY: agregar columnas por categoría. --> select * from ... where ... GROUP BY ...;
-- Lo incluido en el group by, debe ir en el SELECT:
-- Ej.: SELECT company, division FROM ... WHERE ... GROUP BY company, division
-- Excepto si se usa una función de agregación:
-- Ej2 : SELECT COUNT(id) FROM ... WHERE ... GROUP BY company, division
-- SELECT customer_id, SUM(amount) FROM payment GROUP BY customer_id ORDER BY SUM(amount) DESC;
/* SELECT staff_id,customer_id, SUM(amount) FROM payment
	GROUP BY staff_id,customer_id
	ORDER BY customer_id;
*/
/* SELECT DATE(payment_date),SUM(amount) FROM payment
	GROUP BY DATE(payment_date)
	ORDER BY SUM(amount) DESC;
*/
-- Challenge 1: 2 miembros del staff (ids 1&2). Darle el bono a quien manejó más pagos.
-- ¿Cuántos pagos manejó cada quien y quién se queda con el bono?
-- SELECT staff_id,COUNT(staff_id) FROM payment GROUP BY staff_id;
-- Challenge 2: ¿Cuál es el costo promedio de reemplazo por MPAA rating?
-- SELECT rating, AVG(replacement_cost) FROM film GROUP BY rating;
-- Challenge 3: Los customer_ids de los 5 clientes que más gastaron.
/* SELECT customer_id, SUM(amount) FROM payment
	GROUP BY customer_id ORDER BY SUM(amount) DESC LIMIT 5;
*/

-- HAVING: filtrar después de una agregación.
-- Porque WHERE se ejecuta antes de un order by
-- Porque las funcs de agregación se ejecutan hasta después de un order by
-- Una especia de WHERE después del order by
/* SELECT company, SUM(sales) FROM finance_table WHERE company != 'Google'
	GROUP BY company HAVING SUM(sales) > 1000; */
/* SELECT customer_id, SUM(amount) FROM payment
	WHERE customer_id NOT IN (184,87,477)
	GROUP BY customer_id HAVING SUM(amount) > 100;
	*/
/* SELECT store_id, COUNT(customer_id) FROM customer
	GROUP BY store_id HAVING COUNT(*) > 300;
	*/
-- Challenge 1: clientes que tienen 40 ó más transacciones. Obtener customer_ids
/* SELECT customer_id, COUNT(*) FROM payment
	GROUP BY customer_id HAVING COUNT(*) > 39;
	*/
-- Challenge 2: customer ids que han gastado más de 100 con el miemebro del staff 2.
SELECT customer_id,SUM(amount) FROM payment WHERE staff_id=2
	GROUP BY customer_id HAVING SUM(amount)>100;