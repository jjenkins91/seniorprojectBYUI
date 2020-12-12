CREATE TABLE customer_information (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL
);

CREATE TABLE customer_address (
	address_id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES customer_information (customer_id),
	address_street VARCHAR(80),
	address_city VARCHAR(80),
	address_state VARCHAR(80),
	address_zip_code INT
);

CREATE TABLE customer_payment_method (
	payment_id SERIAL PRIMARY KEY,
	customer_id INT REFERENCES customer_information (customer_id),
  card_type VARCHAR(80) NOT NULL,
  card_number INT NOT NULL,
  card_expiration_date INT NOT NULL,
  card_security_code INT NOT NULL
);

CREATE TABLE order (
  order_id SERIAL PRIMARY KEY,
  customer_id INT REFERENCES customer_information(customer_id),
  product_id INT REFERENCES product (product_id),
  address_id INT REFERENCES customer_address (address_id),
  product_quantity INT
);

CREATE TABLE product (
	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(80),
	product_type VARCHAR(80),
	product_remaining_quantity INT
);
