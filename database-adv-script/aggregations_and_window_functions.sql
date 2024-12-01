-- Get total bookings by each user
SELECT 
    user_id, 
    COUNT(*) AS total_bookings
FROM 
    bookings
GROUP BY 
    user_id;

-- Ranking by total bookings
SELECT 
    property_id, 
    COUNT(*) AS total_bookings, 
    RANK() OVER (ORDER BY COUNT(*) DESC) AS rank
FROM 
    bookings
GROUP BY 
    property_id
ORDER BY 
    rank;