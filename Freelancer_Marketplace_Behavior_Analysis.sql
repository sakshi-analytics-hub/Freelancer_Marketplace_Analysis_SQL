CREATE DATABASE freelancer_marketplace_final;
USE freelancer_marketplace_final;

-- Users
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    country VARCHAR(50),
    user_type VARCHAR(20),
    join_date DATE
);

-- Freelancer Profiles (IMPORTANT: no duplicate error)
CREATE TABLE Freelancer_Profiles (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    freelancer_id INT,
    skills VARCHAR(255),
    experience_level VARCHAR(20),
    hourly_rate DECIMAL(10,2),
    rating DECIMAL(2,1),
    FOREIGN KEY (freelancer_id) REFERENCES Users(user_id)
);

-- Projects
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    client_id INT,
    title VARCHAR(255),
    category VARCHAR(100),
    budget DECIMAL(10,2),
    posted_date DATE,
    deadline DATE,
    FOREIGN KEY (client_id) REFERENCES Users(user_id)
);

-- Bids
CREATE TABLE Bids (
    bid_id INT PRIMARY KEY,
    project_id INT,
    freelancer_id INT,
    bid_amount DECIMAL(10,2),
    bid_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (freelancer_id) REFERENCES Users(user_id)
);

-- Contracts
CREATE TABLE Contracts (
    contract_id INT PRIMARY KEY,
    project_id INT,
    freelancer_id INT,
    start_date DATE,
    end_date DATE,
    final_amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    FOREIGN KEY (freelancer_id) REFERENCES Users(user_id)
);

-- Reviews
CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    contract_id INT,
    rating DECIMAL(2,1),
    review_text VARCHAR(255),
    review_date DATE,
    FOREIGN KEY (contract_id) REFERENCES Contracts(contract_id)
);

SHOW CREATE TABLE Users;
desc Users;
desc Freelancer_Profiles;
desc Projects;
desc Bids;
desc Contracts;
desc Reviews;
 
select * from Users;
  
select * from Freelancer_Profiles;

select * from Projects;

select * from Bids;

select * from  Contracts;

select * from  Reviews;
 
-- Q1: List all freelancers on the platform
SELECT * FROM Users
WHERE user_type = 'Freelancer';

-- Q2: List all clients on the platform
SELECT * FROM Users
WHERE user_type = 'Client';

-- Q3: Count the number of projects posted by each client
SELECT client_id, COUNT(*) AS total_projects
FROM Projects
GROUP BY client_id;

-- Q4: Find the highest bid amount for each project
SELECT project_id, MAX(bid_amount) AS highest_bid
FROM Bids
GROUP BY project_id;

-- Q5: Calculate the average hourly rate of all freelancers
SELECT AVG(hourly_rate) AS avg_hourly_rate
FROM Freelancer_Profiles;

-- Q6: Find average rating of each freelancer based on reviews
SELECT c.freelancer_id, AVG(r.rating) AS avg_rating
FROM Reviews r
JOIN Contracts c ON r.contract_id = c.contract_id
GROUP BY c.freelancer_id;

-- Q7: Find the average bid amount for each project
SELECT project_id, AVG(bid_amount) AS avg_bid
FROM Bids
GROUP BY project_id;

-- Q8.Which freelancers have not been awarded any contract yet?
SELECT u.user_id, u.name
FROM Users u
LEFT JOIN Contracts c ON u.user_id = c.freelancer_id
WHERE u.user_type = 'Freelancer' AND c.contract_id IS NULL;

-- Q9.Which clients have posted the most projects?
SELECT client_id, COUNT(*) AS total_projects
FROM Projects
GROUP BY client_id
ORDER BY total_projects DESC
LIMIT 5;

-- Q10.What is the average bid amount submitted by each freelancer?
SELECT freelancer_id, AVG(bid_amount) AS avg_bid
FROM Bids
GROUP BY freelancer_id;

-- Q11.Which freelancers have the highest average rating?
SELECT c.freelancer_id, AVG(r.rating) AS avg_rating
FROM Reviews r
JOIN Contracts c ON r.contract_id = c.contract_id
GROUP BY c.freelancer_id
ORDER BY avg_rating DESC
LIMIT 5;

-- Q12.How many freelancers belong to each experience level?
SELECT experience_level, COUNT(*) AS total_freelancers
FROM Freelancer_Profiles
GROUP BY experience_level;

-- Q13.How many bids has each freelancer submitted in the last 30 days?
SELECT freelancer_id, COUNT(*) AS bids_last_month
FROM Bids
WHERE bid_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
GROUP BY freelancer_id;

-- Q14.Which freelancers have listed the highest number of skills?
SELECT freelancer_id, LENGTH(skills) - LENGTH(REPLACE(skills, ',', '')) + 1 AS skill_count
FROM Freelancer_Profiles
ORDER BY skill_count DESC
LIMIT 5;



