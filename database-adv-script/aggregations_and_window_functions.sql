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
    CASE 
        WHEN total_bookings > 10 THEN 
            ROW_NUMBER() OVER (ORDER BY total_bookings DESC) -- Use ROW_NUMBER if total bookings exceed 10
        ELSE 
            RANK() OVER (ORDER BY total_bookings DESC) -- Use RANK otherwise
    END AS rank
FROM 
    PropertyBookings;
