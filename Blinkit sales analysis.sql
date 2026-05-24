---creating cte to calculate the total rental count and total rental amount for each customer
With customer_totals AS (
     SELECT c.customer_id,c.first_name,c.last_name,
	 count(r.rental_id) AS rental_count,
	 SUM(p.amount) AS TOTAL_AMOUNT
FROM customer c
join rental r ON c.customer_id=r.customer_id
join payment p ON c.customer_id=p.customer_id AND p.rental_id=r.rental_id
GROUP BY c.customer_id,c.first_name,c.last_name 
)
select * from customer_totals
---use the ste to filter customers who have rented more than the average number of films
where rental_count>(select avg(rental_count) from customer_totals)
and total_amount<100;


