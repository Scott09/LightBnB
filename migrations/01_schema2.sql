DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS properties CASCADE;
DROP TABLE IF EXISTS reservations CASCADE;
DROP TABLE IF EXISTS property_reviews CASCADE;


CREATE TABLE users(
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  email VARCHAR(255),
  password VARCHAR(255)
);

CREATE TABLE properties (
  id SERIAL PRIMARY KEY NOT NULL,
  owner_id INTEGER REFERENCES users(id),
  title VARCHAR(255),
  description VARCHAR(65000),
  cost_per_night VARCHAR(255),
  thumbnail_photo_url VARCHAR(65000),
  cover_photo_url VARCHAR(65000),
  parking_spaces INTEGER,
  number_of_bathrooms INTEGER,
  number_of_bedrooms VARCHAR(255),
  country VARCHAR(255),
  street VARCHAR(255),
  city VARCHAR(255),
  province VARCHAR(255),
  post_code VARCHAR(255),
  active BOOLEAN
);

CREATE TABLE reservations (
  id SERIAL PRIMARY KEY NOT NULL,
  guest_id INTEGER REFERENCES users(id),
  property_id INTEGER REFERENCES properties(id),
  start_date VARCHAR(255),
  end_date VARCHAR(255)
);

CREATE TABLE property_reviews(
  id SERIAL PRIMARY KEY NOT NULL,
  reservation_id INTEGER REFERENCES reservations(id),
  property_id INTEGER REFERENCES properties(id),
  guest_id INTEGER REFERENCES users(id),
  rating INTEGER,
  message VARCHAR(255)
);