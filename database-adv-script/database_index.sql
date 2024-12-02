-- User Table
CREATE INDEX index_user_email ON User(email); -- for quick lookup by email
CREATE INDEX index_user_id ON User(user_id); -- for JOINs

-- Booking Table
CREATE INDEX index_booking_property_id ON Booking(property_id); -- for JOINs with Property
CREATE INDEX index_booking_user_id ON Booking(user_id); -- for JOINs with User
CREATE INDEX index_booking_status ON Booking(status); -- for filtering by booking status

-- Property Table
CREATE INDEX index_property_location ON Property(location); -- for filtering by location
CREATE INDEX index_property_host_id ON Property(host_id); -- for JOINs with User


-- Measure performance
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 5;