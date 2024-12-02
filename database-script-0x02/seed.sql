-- Insert 3 Records into the Users table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    ('1e3f1d22-01fb-11ee-be56-0242ac120002', 'John', 'Doe', 'john.doe@example.com', 'hashed_password1', '1234567890', 'guest'),
    ('2b7f6d45-01fb-11ee-be56-0242ac120002', 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password2', '9876543210', 'host'),
    ('4c6d8a78-01fb-11ee-be56-0242ac120002', 'Admin', 'User', 'admin@example.com', 'hashed_password3', NULL, 'admin');


-- Insert 2 Records into the Property Table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
    ('10a12b34-01fb-11ee-be56-0242ac120002', '2b7f6d45-01fb-11ee-be56-0242ac120002', 'Cozy Cottage', 'A small, cozy cottage in the countryside.', 'Rural Area, Country', 120.00),
    ('23c34d56-01fb-11ee-be56-0242ac120002', '2b7f6d45-01fb-11ee-be56-0242ac120002', 'Beachfront Villa', 'Luxury villa with a private beach.', 'Oceanfront, Country', 450.00);


-- Insert 2 records into the Booking Table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
    ('301d4e89-01fb-11ee-be56-0242ac120002', '10a12b34-01fb-11ee-be56-0242ac120002', '1e3f1d22-01fb-11ee-be56-0242ac120002', '2024-12-01', '2024-12-07', 720.00, 'confirmed'),
    ('40f56a12-01fb-11ee-be56-0242ac120002', '23c34d56-01fb-11ee-be56-0242ac120002', '1e3f1d22-01fb-11ee-be56-0242ac120002', '2024-12-15', '2024-12-20', 2250.00, 'pending');


-- Insert 2 Records into the Payment Table
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
    ('509ab112-01fb-11ee-be56-0242ac120002', '301d4e89-01fb-11ee-be56-0242ac120002', 720.00, 'credit_card'),
    ('60db7812-01fb-11ee-be56-0242ac120002', '40f56a12-01fb-11ee-be56-0242ac120002', 2250.00, 'paypal');


-- Insert 2 Records into the Reviews Table
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
    ('709cd112-01fb-11ee-be56-0242ac120002', '10a12b34-01fb-11ee-be56-0242ac120002', '1e3f1d22-01fb-11ee-be56-0242ac120002', 5, 'The cottage was perfect for a quiet getaway.'),
    ('809ed312-01fb-11ee-be56-0242ac120002', '23c34d56-01fb-11ee-be56-0242ac120002', '1e3f1d22-01fb-11ee-be56-0242ac120002', 4, 'Beautiful villa with amazing views.');


-- Insert 2 Records into the Message Table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
    ('90a5e312-01fb-11ee-be56-0242ac120002', '1e3f1d22-01fb-11ee-be56-0242ac120002', '2b7f6d45-01fb-11ee-be56-0242ac120002', 'Hi, is the cottage available during Christmas?'),
    ('a0b1f612-01fb-11ee-be56-0242ac120002', '2b7f6d45-01fb-11ee-be56-0242ac120002', '1e3f1d22-01fb-11ee-be56-0242ac120002', 'Yes, it is available.');
