/*
. Get the corresponding skill and skill type for each job posting in q1
. Includes those without any skills, too
. Why? Look at the skills and the type for each job in the first quarter
  that has a salary > $70,000
*/

WITH jobs_q1 AS (
    SELECT
        job_id,
        salary_year_avg
    FROM job_postings_fact
    WHERE salary_year_avg > 70000
      AND job_posted_date >= DATE '2023-01-01'
      AND job_posted_date <  DATE '2023-04-01'
)

-- Jobs con skills
SELECT
    j.job_id,
    s.skills,
    s.type,
    j.salary_year_avg
FROM jobs_q1 AS j
JOIN skills_job_dim AS sj
    ON j.job_id = sj.job_id
JOIN skills_dim AS s
    ON sj.skill_id = s.skill_id

UNION ALL

-- Jobs sin skills
SELECT
    j.job_id,
    NULL AS skills,
    NULL AS type,
    j.salary_year_avg
FROM jobs_q1 AS j
WHERE NOT EXISTS (
    SELECT 1
    FROM skills_job_dim AS sj
    WHERE sj.job_id = j.job_id
);