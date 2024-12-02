-- Get total bookings by each user
SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    COUNT(Booking.booking_id) AS total_bookings
FROM 
    User
LEFT JOIN 
    Booking 
ON 
    User.user_id = Booking.user_id
GROUP BY 
    User.user_id, User.first_name, User.last_name
ORDER BY 
    total_bookings DESC;


-- Ranking by total bookings
WITH PropertyBookings AS (
    SELECT 
        Property.property_id,
        Property.name AS property_name,
        COUNT(Booking.booking_id) AS total_bookings
    FROM 
        Property
    LEFT JOIN 
        Booking 
    ON 
        Property.property_id = Booking.property_id
    GROUP BY 
        Property.property_id, Property.name
)
SELECT 
    property_id,
    property_name,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS rank
FROM 
    PropertyBookings;
