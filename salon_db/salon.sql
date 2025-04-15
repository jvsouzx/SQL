
DROP DATABASE IF EXISTS salon;
CREATE DATABASE salon;

\c salon

CREATE TABLE customers (
  customer_id SERIAL PRIMARY KEY,
  phone VARCHAR(20) UNIQUE,
  name VARCHAR(40)
);

CREATE TABLE services (
  service_id SERIAL PRIMARY KEY,
  name VARCHAR(40)
);

CREATE TABLE appointments (
  appointment_id SERIAL PRIMARY KEY,
  time VARCHAR(20),
  service_id INT,
  customer_id INT, 
  FOREIGN KEY (service_id) REFERENCES services(service_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO services(name) VALUES 
  ('cut'),
  ('color'),
  ('perm'),
  ('style'),
  ('trim');

SELECT * FROM services;