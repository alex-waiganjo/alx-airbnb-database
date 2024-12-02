-- Inrer Join
SELECT 
    b.booking_id,
    CONCAT(u.first_name, ' ', u.last_name) AS user_name,
    u.email AS user_email,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM 
    Booking b
INNER JOIN 
    User u ON b.user_id = u.user_id;
    
-- Left Join
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at AS review_date
FROM 
    Property p
LEFT JOIN 
    Review r ON p.property_id = r.property_id
ORDER BY 
    r.rating DESC, 
    p.name ASC;

-- Outter Join
SELECT
    User.user_id AS user_id,
    CONCAT(User.first_name, ' ', User.last_name) AS user_name,
    User.email AS user_email,
    Booking.booking_id AS booking_id,
    Booking.property_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    Booking.status
FROM
    User
FULL OUTER JOIN
    Booking  ON User.user_id = Booking.user_id;