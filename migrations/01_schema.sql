CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name varchar(55),
  email varchar(55),
  password varchar(55)
);

CREATE TABLE properties (
  id SERIAL PRIMARY KEY, 
  owner_id int references users(id),
  title varchar(55),
  description varchar(255),
  thumbnail_photo_url varchar(255),
  cover_photo_url varchar(255),
  cost_per_night int,
  parking_spaces int,
  number_of_bathrooms int,
  number_of_bedrooms int,
  country varchar(50),
  street varchar(50),
  city varchar(50),
  province varchar(50),
  post_code varchar(15),
  active boolean
);

CREATE TABLE reservations (
  id SERIAL PRIMARY KEY,
  start_date TIMESTAMP,
  end_date DATE, 
  property_id int references properties(id),
  guest_id int references users(id)
);

CREATE TABLE property_reviews (
  id SERIAL PRIMARY KEY,
  guest_id int references users(id),
  reservation_id int references reservations(id),
  property_id int references properties(id),
  rating int,
  message varchar(255)
);
