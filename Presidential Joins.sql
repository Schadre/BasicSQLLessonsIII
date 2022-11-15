-- Customer Table for Presidents
CREATE TABLE customer_shay(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(200),
	address VARCHAR(150),
	city VARCHAR (150),
	customer_state VARCHAR(100),
	zipcode VARCHAR(50)
);

-- Orders table for Presidents
CREATE TABLE order_shay(
	order_id SERIAL	PRIMARY KEY,
	order_date DATE DEFAULT CURRENT_DATE,
	amount NUMERIC(5,2),
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

INSERT INTO customer_shay(
	customer_id,
	first_name,
	last_name,
	email,
	address,
	city,
	customer_state,
	zipcode
)
VALUES(
	1,
	'George',
	'Washington',
	'gwash@usa.gove',
	'3200 Mt Vernon Hwy',
	'Mt Vernon',
	'VA',
	'22121'
);

INSERT INTO customer_shay(
	customer_id,
	first_name,
	last_name,
	email,
	address,
	city,
	customer_state,
	zipcode
)
VALUES(
	2,
	'John',
	'Adams',
	'YaboiJohn@usa.gov',
	'1200 Hancock',
	'Quincy',
	'MA',
	'02169'
	
);

INSERT INTO customer_shay(
	customer_id,
	first_name,
	last_name,
	email,
	address,
	city,
	customer_state,
	zipcode
)
VALUES(
	3,
	'Thomas',
	'Jefferson',
	'TJeff@usa.gov',
	'931 Thomas Jefferson Parkway',
	'Charlottesville',
	'VA',
	'02168'
);

INSERT INTO customer_shay(
	customer_id,
	first_name,
	last_name,
	email,
	address,
	city,
	customer_state,
	zipcode
)
VALUES(
	4,
	'James',
	'Madison',
	'MadJames@usa.gov',
	'11350 Conway',
	'Orange',
	'VA',
	'02169'
);

INSERT INTO customer_shay(
	customer_id,
	first_name,
	last_name,
	email,
	address,
	city,
	customer_state,
	zipcode
)
VALUES(
	5,
	'James',
	'Monroe',
	'JMonroe@usa.gov',
	'2050 James Monroe Parkway',
	'Charlottesville',
	'VA',
	'021569298384'
);

-- Insert information into order_shay 
INSERT INTO order_shay(
	order_id,
	amount,
	customer_id
)
VALUES(
	1,
	234,
	56.1
);

INSERT INTO order_shay(
	order_id,
	amount,
	customer_id
)
VALUES(
	2,
	78.50,
	3
);

INSERT INTO order_shay(
	order_id,
	amount,
	customer_id
)
VALUES(
	3,
	124.00,
	2
);

INSERT INTO order_shay(
	order_id,
	amount,
	customer_id
)
VALUES(
	4,
	65.50,
	3
);

INSERT INTO order_shay(
	order_id,
	amount,
	customer_id
)
VALUES(
	5,
	55.50,
	NULL
);

-- Time to do some joins
SELECT first_name, last_name, order_date, amount
FROM customer_shay
INNER JOIN order_shay 
ON customer_shay.customer_id = order_shay.customer_id; 

-- Left join
SELECT first_name, last_name, order_date, amount
FROM customer_shay 
LEFT JOIN order_shay 
ON customer_shay.customer_id = order_shay.customer_id
WHERE order_date IS NOT NULL;

-- Right Join
SELECT first_name, last_name, order_date, amount
FROM customer_shay 
RIGHT JOIN order_shay 
ON customer_shay.customer_id = order_shay.customer_id;

-- Full Join
SELECT first_name, last_name, order_date, amount
FROM customer_shay 
FULL JOIN order_shay 
ON customer_shay.customer_id = order_shay.customer_id;

-- Customer_shay = Table A 
-- Order_shay = Table B 
