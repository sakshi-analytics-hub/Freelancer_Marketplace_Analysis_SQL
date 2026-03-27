# Freelancer Marketplace Behavior Analysis

## Introduction
This project analyzes the behavior of users on a freelancer marketplace platform.  
It focuses on how clients post projects, how freelancers bid, and how contracts and reviews are generated.  
The goal is to understand patterns in hiring, pricing, and freelancer performance using SQL-based data analysis.

## Objective
- Analyze freelancer and client interactions.  
- Study bidding patterns and project trends.  
- Evaluate freelancer performance using ratings.  
- Identify factors affecting project completion and success.

## Tools Used
- MySQL Workbench  
- SQL (Structured Query Language)  
- Microsoft Excel (for dataset creation and preprocessing)

## Database Design

### 1. Users
- **Purpose:** Stores all users (clients & freelancers)  
- **Fields:** `user_id` (PK), `name`, `email`, `country`, `user_type`, `join_date`  

### 2. Freelancer_Profiles
- **Purpose:** Freelancer-specific info  
- **Fields:** `profile_id` (PK), `freelancer_id` (FK → Users), `skills`, `experience_level`, `hourly_rate`  

### 3. Projects
- **Purpose:** Client projects  
- **Fields:** `project_id` (PK), `client_id` (FK → Users), `title`, `description`, `budget`, `status`, `post_date`, `deadline`  

### 4. Bids
- **Purpose:** Freelancer proposals for projects  
- **Fields:** `bid_id` (PK), `project_id` (FK → Projects), `freelancer_id` (FK → Users), `bid_amount`, `proposal_text`, `bid_date`  

### 5. Contracts
- **Purpose:** Accepted bid agreements  
- **Fields:** `contract_id` (PK), `project_id` (FK → Projects), `freelancer_id` (FK → Users), `client_id` (FK → Users), `start_date`, `end_date`, `payment_status`, `contract_amount`  

### 6. Reviews
- **Purpose:** Client feedback for freelancer  
- **Fields:** `review_id` (PK), `contract_id` (FK → Contracts), `rating`, `comments`, `review_date`  

### Relationships
- Users → Freelancer_Profiles (1:1)  
- Users → Projects (1:M)  
- Projects → Bids (1:M)  
- Projects + Users → Contracts (1:1)  
- Contracts → Reviews (1:1)  

## Dataset Description
The dataset contains information about users, freelancers, projects, bids, contracts, and reviews.  
It tracks user details, project postings, freelancer proposals, contract agreements, and client feedback.  
This data can be used to analyze skills, budgets, bidding trends, and project outcomes, as well as freelancer performance and client satisfaction.  
It is useful for studying marketplace dynamics and making data-driven decisions to improve platform efficiency.

## SQL Queries & Insights
Some example queries included in this project:  
1. **List all freelancers** – Identify all registered freelancers.  
2. **List all clients** – Track active clients posting projects.  
3. **Count of projects per client** – Find most active clients.  
4. **Highest bid per project** – Analyze budget competitiveness.  
5. **Average hourly rate of freelancers** – Benchmark pricing.  
6. **Average rating per freelancer** – Evaluate performance based on feedback.  
7. **Projects with average bid amount** – Understand pricing trends.  
8. **Freelancers without contracts** – Identify underutilized freelancers.  
9. **Top clients by number of projects** – Target high-engagement clients.  
10. **Average bid amount per freelancer** – Evaluate fair bidding patterns.  
11. **Top-rated freelancers** – Highlight best-performing freelancers.  
12. **Freelancer distribution by experience level** – Analyze skill levels on the platform.  
13. **Freelancer activity in last 30 days** – Identify recent engagement.  
14. **Freelancers with most skills listed** – Highlight versatile freelancers.

## Key Insights
- Most active freelancers have diverse skills and moderate hourly rates.  
- Projects with clear budgets and deadlines attract more bids.  
- Higher-rated freelancers win contracts more frequently.  

## Conclusion
The platform enables efficient matching between clients and freelancers.  
Analyzing bids, contracts, and reviews helps understand trends, performance, and user behavior for better decision-making.

## Future Scope
- Implement AI-based project–freelancer recommendation system.  
- Predict project success and freelancer performance using analytics.  
- Introduce dynamic pricing and skill-based matchmaking.  
- Expand reporting dashboards for clients and freelancers.

## Created By
Sakshi Runghe
