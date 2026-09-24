-- 1. Create the database (if not already created by the ENV variable)
CREATE DATABASE IF NOT EXISTS ecomdb;

-- 2. Tell MySQL to use this database
USE ecomdb;

-- 3. Create a sample table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(50) NOT NULL
);

-- 4. Insert some sample data
INSERT INTO users (name, role) VALUES 
('Upendra', 'DevOps Engineer'),
('Jansi', 'Developer'),
('Swiggy', 'Customer');
