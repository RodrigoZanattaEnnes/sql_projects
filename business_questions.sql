--Question: Which clients have made a reservation?

SELECT DISTINCT 
c.client_id
, c.first_name
, c.last_name
, c.email
FROM 
travel_world.client c
JOIN 
travel_world.reservation r
ON c.client_id = r.client_id;
WHERE LOWER (r.status) = 'confirmed' ;

--Question: What are the reservations made in the last month?

SELECT 
r.reservation_id
, c.first_name
, c.last_name
, p.package_name
, r.reservation_date
, r.status
FROM
travel_world.reservation r
JOIN 
travel_world.client c 
ON 
r.client_id = c.client_id
JOIN 
travel_world.travel_package p 
ON r.package_id = p.package_id
WHERE
 r.reservation_date >= CURRENT_DATE - interval '185 days'
and
	lower(r.status) = 'confirmed'
ORDER BY  r.reservation_date DESC ;

--Question: What is the total revenue generated from reservations?

SELECT SUM(p.price) AS total_revenue
FROM travel_world.reservation r
JOIN travel_world.travel_package p
 ON r.package_id = p.package_id
WHERE r.status = 'confirmed';

--Question: What are the average ratings of all travel packages?

SELECT 
p.package_name 
,AVG(h.rating) AS average_rating
FROM 
travel_world.travel_package p
JOIN 
travel_world.hotel h 
ON p.package_id = h.hotel_id
GROUP BY p.package_name;

--Question: Which is the most popular travel package?

SELECT
 p.package_name
 , COUNT(r.reservation_id) AS reservation_count
FROM
 travel_world.reservation r
JOIN
 travel_world.travel_package p 
 ON r.package_id = p.package_id
GROUP BY
 p.package_name
ORDER BY
 reservation_count DESC
LIMIT 1;

--Question: What are the details of all hotels including their location and rating?

SELECT 
hotel
,location
,rating
from
travel_world.hotel;

--Question: Which clients have not made any reservations?

SELECT
	c.client_id
	, c.first_name
	, c.last_name
	, c.email
FROM 
	travel_world.client c
LEFT JOIN
	travel_world.reservation r 
    ON c.client_id = r.client_id
WHERE
	r.client_id IS NULL;


--Question: How many reservations have been made for each travel package?

SELECT 
	p.package_name
	, COUNT(r.reservation_id) AS reservation_count
FROM
	travel_world.reservation r
JOIN
	travel_world.travel_package p 
    ON r.package_id = p.package_id
GROUP BY p.package_name;

--Question: What are the details of all reservations including client and package information?

SELECT
	r.reservation_id
	, c.first_name
	, c.last_name
	, p.package_name
	, r.reservation_date
	, r.status
FROM 
	travel_world.reservation r
JOIN 
	travel_world.client c 
    ON r.client_id = c.client_id
JOIN
	travel_world.travel_package p
     ON r.package_id = p.package_id;


--Question: How many clients are there from each city?

select 
	a.city,
	COUNT(c.client_id) AS client_count
from
	travel_world.address a
join
	travel_world.client c 
	on cast(a.client_id as int ) = c.client_id
group by a.city
	;



