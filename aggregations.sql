--airlines, airports, cities, flights, itineraries, states, tickets, users

-- Find the top 5 most expensive flights that end in California.
SELECT f.price
  FROM flights f
  JOIN airports a ON (f.destination_id = a.id)
  JOIN states s ON (a.state_id = s.id)
WHERE s.name = 'California'
ORDER BY f.price DESC
LIMIT 5;

-- Find the shortest flight that username 'zora_johnson' took.
SELECT f.distance
  FROM flights f
  JOIN tickets t on (f.id = t.flight_id)
  JOIN itineraries i on (t.itinerary_id = i.id)
  JOIN users u on (i.user_id = u.id)
WHERE u.username = 'zora_johnson'
ORDER By f.distance
LIMIT 1;

-- Find the average flight distance for every city in California
SELECT AVG(f.distance)
  FROM flights f
  JOIN airports a ON (f.destination_id = a.id) OR (f.origin_id = a.id)
  JOIN states s ON (a.state_id = s.id)
WHERE s.name = 'California';

-- Find the 3 users who spent the most money on flights in 2013
SELECT u.username, SUM(f.price)
  FROM flights f
  JOIN tickets t ON (f.id = t.flight_id)
  JOIN itineraries i ON (t.itinerary_id = i.id)
  JOIN users u ON (i.user_id = u.id)
WHERE f.departure_time BETWEEN '2013-01-01' AND '2013-12-31'
GROUP BY u.username
ORDER BY SUM(f.price) DESC
LIMIT 3;

Validation:
-- SELECT f.price
--   FROM flights f
--   JOIN tickets t ON (f.id = t.flight_id)
--   JOIN itineraries i ON (t.itinerary_id = i.id)
--   JOIN users u ON (i.user_id = u.id)
-- WHERE f.departure_time BETWEEN '2013-01-01' AND '2013-12-31' AND u.username = 'esperanza';

-- Count all flights to or from the city of Smithshire that did not land in Delaware
SELECT COUNT(*) as "Number of Flights"
 FROM flights f
 JOIN airports a ON (f.destination_id = a.id) OR (f.origin_id = a.id)
 JOIN states s on (a.state_id = s.id)
 JOIN cities c on (a.city_id = c.id)
WHERE c.name = 'Smithshire';

-- Not sure how to fit in the NOT delaware part...

-- Return the range of lengths of flights in the system(the maximum, and the minimum).
SELECT MAX(arrival_time - departure_time) AS longest_duration,
  MIN(arrival_time - departure_time) AS shortest_duration
  FROM flights;


ITINERARIES
id             | 3527
user_id        | 2352
payment_method | VISA
created_at     | 2017-03-24 04:14:29.094758

FLIGHTS
id             | 54690
origin_id      | 11250
destination_id | 9165
departure_time | 2013-12-30 04:36:20.936456
arrival_time   | 2013-12-30 10:49:20.936456
price          | 538.99
created_at     | 2017-03-24 04:02:28.094489
updated_at     | 2017-03-24 04:02:28.094489
airline_id     | 99
distance       | 261

TICKETS
id           | 11844
itinerary_id | 3522
flight_id    | 65241

USERS
id         | 2353
city_id    | 30544
state_id   | 1265
username   | jeffrey_zemlak
first_name | Vicenta
last_name  | OHara
email      | vicenta.hara.o@vandervort.com
