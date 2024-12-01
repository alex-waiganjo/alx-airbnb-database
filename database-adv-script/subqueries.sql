--Get all properties with AVG rating > 4
SELECT 
    id, 
    name 
FROM 
    properties 
WHERE 
    id IN (
        SELECT 
            property_id 
        FROM 
            reviews 
        GROUP BY 
            property_id 
        HAVING 
            AVG(rating) > 4.0
    );

--Get users with > 3 bookings
SELECT 
    id, 
    name 
FROM 
    users 
WHERE 
    (
        SELECT 
            COUNT(*) 
        FROM 
            bookings 
        WHERE 
            bookings.user_id = users.id
    ) > 3;