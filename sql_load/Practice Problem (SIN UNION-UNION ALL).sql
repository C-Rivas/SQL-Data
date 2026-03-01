/*
. Get the corresponding skill and skill type for each job posting in q1
. Includes those without any skills, too
. Why? Look at the skills and the type for each job in the first quarter
  that has a salary > $70,000
*/

WITH skill_with_job_id AS (
SELECT
    skill_for_job.job_id,
    skills.skills,
    skills.type
FROM
    skills_dim AS skills

LEFT JOIN
    skills_job_dim AS skill_for_job
    ON skill_for_job.skill_id = skills.skill_id
)

SELECT
    skill_with_job_id.skills,
    skill_with_job_id.type,
    job_posted.salary_year_avg
FROM
    skill_with_job_id

LEFT JOIN
    job_postings_fact AS job_posted
    ON job_posted.job_id = skill_with_job_id.job_id
WHERE
    job_posted.salary_year_avg >70000
    AND job_posted_date >= '2023-01-01'
    AND job_posted_date < '2023-04-01'

-- CHATGPT VERSION

WITH jobs_q1 AS (
    SELECT
        job_id,
        salary_year_avg
    FROM job_postings_fact
    WHERE salary_year_avg > 70000
      AND job_posted_date >= DATE '2023-01-01'
      AND job_posted_date <  DATE '2023-04-01'
)

SELECT
    j.job_id,
    s.skills,
    s.type,
    j.salary_year_avg
FROM jobs_q1 AS j
LEFT JOIN skills_job_dim AS sj
    ON j.job_id = sj.job_id
LEFT JOIN skills_dim AS s
    ON sj.skill_id = s.skill_id;
