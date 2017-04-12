--airlines, airports, cities, flights, itineraries, states, tickets, users

-- Get a list of all users in California
SELECT u.username
  FROM users u
  JOIN states s ON (u.state_id = s.id)
WHERE s.name = 'California';

-- Get a list of all airports in Kadeton
SELECT a.long_name
  FROM airports a
  JOIN cities c ON (a.city_id = c.id)
WHERE c.name = 'Kadeton';

-- Get a list of all payment methods used on itineraries by the user with email address 'senger.krystel@marvin.io'
SELECT i.payment_method
  FROM itineraries i
  JOIN users u ON (i.user_id = u.id)
WHERE email = 'senger.krystel@marvin.io';

-- Get a list of prices of all flights whose origins are in Kochfurt Probably International Airport.
SELECT f.price
  FROM flights f
  JOIN airports a ON (f.origin_id = a.id)
WHERE a.long_name = 'Kochfurt Probably International Airport';


-- Find a list of all Airport names and codes which connect to the airport coded LYT.
SELECT DISTINCT a.long_name, a.code
  FROM airports a
  JOIN flights f ON (a.id=f.destination_id) OR (a.id=f.origin_id)
WHERE a.code = 'LYT';

-- Get a list of all airports visited by user Krystel Senger after January 1, 2012. (Hint, see if you can get a list of all ticket IDs first).
SELECT DISTINCT a.long_name
  FROM tickets t
  JOIN itineraries i ON (t.itinerary_id = i.id)
  JOIN users u ON (i.user_id = u.id)
  JOIN flights f ON (t.flight_id = f.id)
  JOIN airports a ON (f.origin_id = a.id) OR (f.destination_id = a.id)
WHERE f.departure_time > '2012-01-01' AND u.first_name = 'Krystel' AND u.last_name = 'Senger';
