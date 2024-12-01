--INNER JOIN - Get all bookings and the users
SELECT 
    users.id AS user_id, 
    users.name AS user_name, 
    bookings.id AS booking_id, 
    bookings.date AS booking_date
FROM 
    users
INNER JOIN 
    bookings 
ON 
    users.id = bookings.user_id;

--LEFT JOIN - Get all properties, reviews
SELECT 
    properties.id AS property_id, 
    properties.name AS property_name, 
    reviews.id AS review_id, 
    reviews.rating AS review_rating
FROM 
    properties
LEFT JOIN 
    reviews 
ON 
    properties.id = reviews.property_id;

--FULL OUTER JOIN - Get all users, bookings
SELECT 
    users.id AS user_id, 
    users.name AS user_name, 
    bookings.id AS booking_id, 
    bookings.date AS booking_date
FROM 
    users
FULL OUTER JOIN 
    bookings 
ON 
    users.id = bookings.user_id;