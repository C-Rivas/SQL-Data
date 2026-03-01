/*
Find job postings from the first quarter that have a salary greater than $70K
- Combine job posting tables from the first quarter of 2023 (Jan-Mar)
- Gets job postings with an average yearly salary > $70,000
*/

-- MY VERISON (IT IS WRONG CAUSE I DO NOT FILTER PER TABLE
--             AND THE VALUES GONNA GET DUPLICATED)

WITH job_Q1 AS (
    SELECT
        job_title_short,
        job_location,
        job_via,
        job_posted_date::DATE,
        salary_year_avg
    FROM
        job_postings_fact AS jpf
    WHERE
        salary_year_avg > 70000 
        AND job_posted_date >= '2023-01-01'
        AND job_posted_date < '2023-04-01'
        AND job_title_short = 'Data Analyst'
)

SELECT *
FROM job_Q1

UNION
SELECT
    job_title_short,
    job_location,
    job_via,
    job_posted_date::DATE,
    salary_year_avg
FROM
    january_jobs
UNION
SELECT
    job_title_short,
    job_location,
    job_via,
    job_posted_date::DATE,
    salary_year_avg
FROM
    february_jobs
UNION
SELECT
    job_title_short,
    job_location,
    job_via,
    job_posted_date::DATE,
    salary_year_avg
FROM
    march_jobs

-- CORRECT VERSION

SELECT
    job_title_short,
    job_location,
    job_via,
    job_posted_date::DATE,
    salary_year_avg

FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS job_first_quarter
WHERE
    salary_year_avg > 70000
    AND job_title_short = 'Data Analyst'
ORDER BY
    salary_year_avg DESC;