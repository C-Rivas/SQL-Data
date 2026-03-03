# 📊 Data Analyst Job Market Analysis (SQL Project)

## 🔎 Overview

This project analyzes the Data Analyst job market to identify:

- The highest-paying remote roles
- The most in-demand technical skills
- The highest-paying skills
- The optimal skills balancing demand and salary

The entire analysis was conducted using SQL in PostgreSQL, applying relational joins, aggregations, filtering logic, and CTE structuring.

---

## 🎯 Business Problem

Aspiring Data Analysts often lack clarity on which skills:

- Increase employability
- Command higher salaries
- Provide the best balance between demand and compensation

This project answers those questions using real job posting data.

---

## 🗄 Database Structure

The analysis is based on relational tables:

- `job_postings_fact`
- `company_dim`
- `skills_job_dim`
- `skills_dim`

These tables were joined to connect job postings with associated companies, salaries, and required skills.

---

## 🛠 Tools & Technologies

- SQL
- PostgreSQL
- Visual Studio Code
- GitHub
- Relational Data Modeling
- CTEs (Common Table Expressions)
- Aggregations & Filtering
- NULL Handling & Data Cleaning

---

## 📊 Analytical Approach

The analysis was structured into five stages:

1. Identify top-paying remote Data Analyst roles  
2. Extract skills required in premium roles  
3. Measure overall skill demand  
4. Calculate average salary per skill  
5. Combine demand and salary to determine optimal skills  

Each stage is documented in a separate SQL file.
---

### 2️⃣ Extract Skills from Top Paying Roles
Extracts skills associated with premium salary roles.  
🔗 [View Query](./project_sql/2_top_paying_job_skills.sql)


Used a CTE to:
- Isolate top 10 paying roles
- Join skills through bridge table
- Identify premium skill associations

---

### 3️⃣ Identify Most In-Demand Skills
Ranks skills by frequency across job postings.  
🔗 [View Query](./project_sql/3_top_demanded_skills.sql)

Grouped job postings by skill and counted frequency.

---

### 4️⃣ Identify Highest Paying Skills
Calculates average yearly salary per skill.  
🔗 [View Query](./project_sql/4_top_paying_skills.sql)

Calculated:
To determine average salary per skill.

---

### 5️⃣ Identify Optimal Skills (High Demand + High Salary)
Combines demand and salary metrics to identify high-value skills.  
🔗 [View Query](./project_sql/5_optimal_skills.sql)

Built two CTEs:
- Skills demand
- Average salary per skill

Joined both and filtered.

---

## 📈 Key Findings

- Identified Top 25 skills ranked by average salary
- Isolated high-demand skills appearing in more than 10 postings
- Determined optimal skills balancing employability and compensation
- Remote Data Analyst roles show significant salary variance depending on skill stack

---
## 📂 Project Structure


SQL-Data/project_sql/ 1_top_paying_jobs.sql/ 2_top_paying_job_skills.sql/ 3_top_demanded_skills.sql/ 4_top_paying_skills.sql/ 5_optimal_skills.sql

---


## 🚀 How to Run This Project

1. Load dataset into PostgreSQL
2. Ensure foreign key relationships are correctly established
3. Run queries in sequence
4. Analyze output tables

---

## 📌 What This Project Demonstrates

- Advanced SQL proficiency
- Relational joins across fact and dimension tables
- CTE structuring for complex queries
- Analytical thinking applied to labor market data
- Business-driven interpretation of technical data

---

## 🔮 Future Improvements

- Add salary distribution analysis (percentiles)
- Compare remote vs on-site roles
- Add time-based trend analysis
- Visualize results using Power BI or Tableau

---

## 👤 Author

Christopher Rivas  
Data Analyst  