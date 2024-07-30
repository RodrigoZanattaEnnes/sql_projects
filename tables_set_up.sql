CREATE TABLE testing.client (
    client_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(20)
);

CREATE TABLE testing.travel_package (
    package_id SERIAL PRIMARY KEY,
    package_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    duration_days INT NOT NULL
);



CREATE TABLE testing.hotel (
    hotel_id SERIAL PRIMARY KEY,
    hotel_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    rating INT CHECK (rating >= 1 AND rating <= 5)
);




CREATE TABLE testing.reservation (
    reservation_id SERIAL PRIMARY KEY,
    client_id INT NOT NULL,
    package_id INT NOT NULL,
    reservation_date DATE NOT NULL,
    status VARCHAR(50)
	);
    