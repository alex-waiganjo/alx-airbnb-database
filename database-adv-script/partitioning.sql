-- Rename the existing Booking table
ALTER TABLE Booking RENAME TO Booking_old;

-- Create a new partitioned table
CREATE TABLE Booking (
    booking_id UUID NOT NULL,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (start_date);

--  Create partitions
CREATE TABLE Booking_2024 PARTITION OF Booking FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
CREATE TABLE Booking_2023 PARTITION OF Booking FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');
CREATE TABLE Booking_older PARTITION OF Booking FOR VALUES FROM ('1900-01-01') TO ('2023-01-01');

--  Migrate data from the old table to the new partitioned table
INSERT INTO Booking 
SELECT * FROM Booking_old;



-- Test Query Performance on the Partitioned Table

-- Query to fetch bookings within a specific date range
EXPLAIN ANALYZE
SELECT 
    booking_id, start_date, end_date, total_price, status
FROM 
    Booking
WHERE 
    start_date BETWEEN '2024-06-01' AND '2024-06-30';
