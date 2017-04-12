--airlines, airports, cities, flights, itineraries, states, tickets, users

-- Find the most popular travel destination for users who live in California.
SELECT f.destination_id
  FROM flights f
  JOIN tickets t ON (f.id = t.flight_id)
  JOIN itineraries i ON (t.itinerary_id = i.id)
  JOIN users u ON (i.user_id = u.id)
  JOIN states s ON (u.state_id = s.id)
WHERE s.name = 'California';

-- How many flights have round trips possible? In other words, we want the count of all airports where there exists a flight FROM that airport and a later flight TO that airport.
-- Find the cheapest flight that was taken by a user who only had one itinerary.
-- Find the average cost of a flight itinerary for users in each state in 2012.
-- Bonus: You're a tourist. It's May 6, 2013. Book the cheapest set of flights over the next six weeks that connect Oregon, Pennsylvania and Arkansas, but do not take any flights over 400 miles in distance. Note: This can be ~50 lines long but doesn't require any subqueries.


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
