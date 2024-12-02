# Objective: Identify and create indexes to improve query performance.

## Instructions:

- Identify high-usage columns in your User, Booking, and Property tables (e.g., columns used in WHERE, JOIN, ORDER BY clauses).

- Write SQL CREATE INDEX commands to create appropriate indexes for those columns and save them on database_index.sql

- Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE.


# 1. High Usage Columns
 - User Table:
   - email
   - user_id

- Property Table:
   - location
   - host_id

- Booking Table:
   - property_id and user_id
   - status

# 2. Index Creation
- Refer to database_index.sql

# 3. Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE
    - EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 5;