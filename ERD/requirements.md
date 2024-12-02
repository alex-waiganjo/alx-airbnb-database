# Airbnb Clone ERD Diagram

## Entities and attributes
 - ### Users
   - user_id, (Primary Key), Uuid
   - first_name, Not Null
   - last_name, Not Null
   - email, Unique, Not Null
   - password_hash, Not Null
   - phone_number, Not Null
   - role Enum(Guest,Host,Admin), Not Null
   - created_at, Timestamp

 - ### Property
   - property_id, (Primary Key), Uuid
   - host_id, FK(User)
   - name, Varchar, Not Null
   - description, Text, Not Null
   - location,Varchar, Not null
   - price, Decimal, Not Null
   - created_at, Timestamp
   - updated_at, Timestamp

 - ### Booking
   - booking_id, (Primary Key), Uuid
   - property_id, FK(Property)
   - user_id, FK(User)
   - start_date, Date, Not Null
   - end_date, Date, Not Null
   - total_price, Decimal, Not Null
   - status, Enum(Pending, Confirmed, Cancelled)
   - created_at, Timestamp

 - ### Payment
   - payment_id, (Primary Key), Uuid
   - booking_id, FK(Booking)
   - amount, Decimal
   - payment_date, Timestamp
   - payment_method, Enum(Credit Card, Paypal, Stripe)

 - ### Review
   - review_id, (Primary Key), Uuid
   - property_id, FK(Property)
   - user_id, FK(User)
   - rating, Int, checkrating>=1 and rating<=5
   - comment, Text
   - created_at, Timestamp
   
 - ### Message
   - message_id, (Primary Key), Uuid
   - sender_id, FK(User)
   - recipient_id, FK(User)
   - message_body, Text, Not Null
   - sent_at, Timestamp

# Relationships between entities

### User and Property
A User (as a host) can have multiple Properties.
Property has a host_id that references User(user_id).
### User and Booking
A User (as a guest) can make multiple Bookings.
Booking has a user_id that references User(user_id).
### Property and Booking
A Property can have multiple Bookings.
Booking has a property_id that references Property(property_id).
### Booking and Payment
A Booking can have one Payment.
Payment has a booking_id that references Booking(booking_id).
### User and Review
A User can leave multiple Reviews for different Properties.
Review has a user_id that references User(user_id).
### Property and Review
A Property can have multiple Reviews.
Review has a property_id that references Property(property_id).
### User and Message
A User can send many Messages.
Message has a sender_id that references User(user_id).
### Recipient and Message
A User can receive many Messages.
Message has a recipient_id that references User(user_id).