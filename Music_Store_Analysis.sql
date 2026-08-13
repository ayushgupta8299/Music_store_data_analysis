/*Q.1 We want to assign an senior employee to lead that project. Who is the senior most employee based on job title?*/

SELECT title,first_name, last_name FROM employee
ORDER BY levels DESC
LIMIT 1;
 --------------------------------------------------------------------------------------------------------------------------
/*Q.2 Which country have the most invoices? */

SELECT billing_country, count(*) AS most_invoices FROM music_database.invoice
group by billing_country
order by most_invoices desc
LIMIT 1;
 --------------------------------------------------------------------------------------------------------------------------
/* Q.3 What are top 3 values of total invoice? */

SELECT customer_id, invoice_id, total FROM music_database.invoice
ORDER BY total DESC
LIMIT 3;
 --------------------------------------------------------------------------------------------------------------------------

 --------------------------------------------------------------------------------------------------------------------------
/* 	Q.4 We would like to throw a promotional Music Festival in the city we made the most money. Which city has the best customers? */

SELECT billing_city, SUM(total) AS highest_amount FROM music_database.invoice
GROUP BY billing_city
ORDER BY highest_amount desc
LIMIT 1;
 --------------------------------------------------------------------------------------------------------------------------
/* Q.5 Who is the best customer? The customer who has spent the most money will be declared the best customer. */

SELECT customer.first_name, invoice.customer_id, SUM(invoice.total) AS spent_highest_amount  FROM music_database.customer 
inner join music_database.invoice on customer.customer_id = invoice.customer_id
GROUP BY invoice.customer_id, customer.first_name
ORDER BY spent_highest_amount DESC
LIMIT 1;

 --------------------------------------------------------------------------------------------------------------------------
/* Q.6 Details of customers who listens Rock music. */

SELECT DISTINCT customer.first_name, first_name, last_name FROM customer
INNER JOIN invoice on customer.customer_id = invoice.customer_id
INNER JOIN invoice_line on invoice.invoice_id = invoice_line.invoice_id
INNER JOIN track on invoice_line.track_id = track.track_id
WHERE track.genre_id = 1;
 --------------------------------------------------------------------------------------------------------------------------
/*Q.7 Let's invite the artists who have written the most rock music in our dataset.*/

SELECT artist.name AS artist_name, COUNT(genre.name) AS most_rock_music FROM track
inner join genre on track.genre_id = genre.genre_id
inner join album on track.album_id = album.album_id
inner join artist on album.artist_id = artist.artist_id
WHERE genre.name = 'Rock'
GROUP BY artist_name
ORDER BY most_rock_music DESC
LIMIT 3;
 --------------------------------------------------------------------------------------------------------------------------
/* Q.8 We want to find out the most popular music Genre for each country*/

WITH popular_genre AS 
(
SELECT COUNT(invoice_line.quantity) AS purchases, customer.country, genre.name as Genre_name, genre.genre_id, 
ROW_NUMBER() OVER(PARTITION BY customer.country ORDER BY COUNT(invoice_line.quantity) DESC) AS RowNo 
    FROM invoice_line 
	JOIN invoice ON invoice.invoice_id = invoice_line.invoice_id
	JOIN customer ON customer.customer_id = invoice.customer_id
	JOIN track ON track.track_id = invoice_line.track_id
	JOIN genre ON genre.genre_id = track.genre_id
	GROUP BY 2,3,4
	ORDER BY 2 ASC, 1 DESC
)
SELECT * FROM popular_genre WHERE RowNo <= 1;

 --------------------------------------------------------------------------------------------------------------------------
/*Q.9 We want to give gifts to top customer so Determine which customer has spent the most on music for each country.*/

WITH Customter_with_country AS (
		SELECT customer.customer_id,first_name,last_name,billing_country,SUM(total) AS total_spending,
		ROW_NUMBER() OVER(PARTITION BY billing_country ORDER BY SUM(total) DESC) AS RowNo 
		FROM invoice
		JOIN customer ON customer.customer_id = invoice.customer_id
		GROUP BY 1,2,3,4
		ORDER BY 4 ASC,5 DESC)
SELECT * FROM Customter_with_country WHERE RowNo <= 1 order by total_spending desc