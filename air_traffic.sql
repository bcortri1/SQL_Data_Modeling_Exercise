-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic



CREATE TABLE passengers
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE airlines
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE locations
(
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL,
    country TEXT NOT NULL
);

CREATE TABLE flights
(
    id SERIAL PRIMARY KEY,
    departure_time TIMESTAMP NOT NULL,
    arrival_time TIMESTAMP NOT NULL,
    to_location_id REFERENCES locations (id),
    from_location_id REFERENCES locations (id),
    airline_id REFERENCES airline (id)
);

CREATE TABLE tickets
(
    id SERIAL PRIMARY KEY,
    seat TEXT NOT NULL,
    flight_id REFERENCES flights (id),
    passenger_id INTEGER REFERENCES passengers (id)
);


-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');


INSERT INTO passengers (first_name, last_name)
VALUES
('Jennifer','Finch'),
('Thadeus','Gathercoal'),
('Sonja','Pauley'),
('Jennifer','Finch'),
('Waneta','Skeleton'),
('Thadeus','Gathercoal'),
('Berkie','Wycliff'),
('Alvin','Leathes'),
('Berkie','Wycliff'),
('Cory','Squibbes');

INSERT INTO airlines (name)
VALUES
('United'),
('British Airways'),
('Delta'),
('TUI Fly Belgium'),
('Air China'),
('American Airlines'),
('Avianca Brasil');


INSERT INTO locations (city, country)
VALUES
('Washington DC','United States'),
('Tokyo','Japan'),
('Los Angles','United States'),
('Seattle','United States'),
('Paris','France'),
('Dubai','UAE'),
('New York','United States'),
('Cedar Rapids','United States'),
('Charlotte','United States'),
('Sao Paolo','Brazil'),
('London','United Kingdom'),
('Las Vegas','United States'),
('Mexico City','Mexico'),
('Casablanca','Morocco'),
('Beijing','China'),
('Chicago','United States'),
('New Orleans','United States'),
('Chile','Brazil');

INSERT INTO flights (departure_time, arrival_time, from_location_id, to_location_id, airline_id)
VALUES
('2018-04-08 09:00:00','2018-04-08 12:00:00',1,4,1),
('2018-12-19 12:45:00','2018-12-19 16:15:00',2,11,2),
('2018-01-02 07:00:00','2018-01-02 08:03:00',3,12,3),
('2018-04-15 16:50:00','2018-04-15 21:00:00',4,13,3),
('2018-08-01 18:30:00','2018-08-01 21:50:00',5,14,4),
('2018-10-31 01:15:00','2018-10-31 12:55:00',6,15,5),
('2019-02-06 06:00:00','2019-02-06 07:47:00',7,9,1),
('2018-12-22 14:42:00','2018-12-22 15:56:00',8,16,6),
('2019-02-06 16:28:00','2019-02-06 19:18:00',9,17,6),
('2019-01-20 19:30:00','2019-01-20 22:45:00',10,18,7);

INSERT INTO tickets (seat, flight_id, passenger_id)
VALUES
('33B',1,1),
('8A',2,2),
('12F',3,3),
('20A',4,4),
('23D',5,5),
('18C',6,6),
('9E',7,7),
('1A',8,8),
('32B',9,9),
('10D',10,10);
