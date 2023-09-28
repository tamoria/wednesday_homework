
-- Question 1: List all customers who live in Texas (use JOINs).

select district, address_id
from address
where district = 'Texas';

	-- address_id's from Texas: 10, 122, 310, 405, 567

select district, first_name, last_name, address.address_id
from address
inner join customer
on address.address_id = customer.address_id;

	-- Answer: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, and Ian Still

-- Question 2: Get all payments above $6.99 with the Customer's Full Name.

select amount, customer_id 
from payment
where amount > 6.99;

	-- customer_id's with payment above $6.99: 1, 341, 342, 343, 467, 567

select amount, first_name, last_name, payment.customer_id
from payment
inner join customer
on payment.customer_id = customer.customer_id;

	-- Answer: Mary Smith ($980), Alberto Henning ($74.94), Alvin Deloach ($33.44), Douglas Graf ($919.67), 
	-- Harold Martino ($81.99), Peter Menard ($149.99, $152.99, 146.99, $147.99, $150.99, $145.99, $151.99, $154.99)

-- Question 3: Show all customers names who have made payments over $175(use subqueries).

select *
from customer
where customer_id in (
	select customer_id
	from payment
	where amount > 175
);

	-- Answer: Mary Smith and Douglas Graf

-- Question 4: List all customers that live in Nepal (use the city table).

select *
from country
where country_id in (
	select country_id 
	from city
	where country = 'Nepal'
);

	-- Country_id in Nepal: 66

select *
from address
where city_id in (
	select city_id 
	from city 
	where country_id = 66
);

	-- address_id in Nepal: 326

select * 
from customer
where address_id in (
	select address_id 
	from address
	where address_id = 326	
);

	-- Answer: Kevin Schuler

-- Question 5: Which staff member had the most transactions?

select count(payment_id), payment.staff_id
from payment
inner join staff
on payment.staff_id = staff.staff_id
group by payment.staff_id

	-- staff_id 2 had more transactions.

select first_name, last_name, staff_id
from staff
where staff_id = 2;

	Answer: Jon Stephens had the most transactions. 
	
-- Question 6: How many movies of each rating are there?
select count(film), rating
from film
group by rating;

	-- Answer: 
	-- 209	NC-17
	-- 178	G
	-- 224	PG-13
	-- 194	PG
	-- 196	R

-- Question 7: Show all customers who have made a single payment above $6.99 (Use Subqueries).

select *
from customer
where customer_id in (
	select customer_id 
	from payment
	where amount > 6.99
);

select *
from customer
where customer_id in (
	select customer_id 
	from payment
	group by customer_id
	having count(amount) >= 2 and sum(amount) > 6.99
);

	-- Answer: Alberto Henning, Alvin Deloach, Douglas Graf, Harold Martino 

-- Question 8: How many free rentals did our store give away?

select amount, rental_id
from payment
where amount = 0;

	-- Answer: No rentals were given away.








