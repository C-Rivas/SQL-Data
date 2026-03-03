/*
    HERE ARE TWO VERSIONS WITH THE SAME OUTCOME,
    THE SHORTER VERSION IS MORE "CLEAN" AND HAS AN EASIEST APPROACH
    THE LONGER VERSION IS ONE THAT WE CREATE ON 'CTE PRACTICE PROBLEM'
    IS ALWAYS GONNA BE BETTER TO HAVE SHORT VERSIONS OF THE QUERIES
    WHEN WE ARE USING  BIG DATASETS OR DATABASES
*/

-- SHORTER VERSION
SELECT
    skills,
    COUNT(sj.job_id) AS demand_count
FROM job_postings_fact AS jpf
INNER JOIN
    skills_job_dim AS sj
    ON jpf.job_id = sj.job_id
INNER JOIN
    skills_dim AS s
    ON sj.skill_id = s.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
GROUP BY
    skills
ORDER BY
    demand_count DESC
LIMIT 5

-- LONGER VERSION

WITH remote_job_skills AS (
SELECT
    skill_id,
    COUNT (*) AS skill_count
FROM
    skills_job_dim AS skills_to_job

INNER JOIN 
    job_postings_fact AS job_postings 
    ON job_postings.job_id = skills_to_job.job_id
WHERE
    job_postings.job_work_from_home = TRUE AND
    job_postings.job_title_short = 'Data Analyst'
GROUP BY
    skill_id
)

SELECT
    skills.skill_id,
    skills AS skill_name,
    skill_count
FROM remote_job_skills

INNER JOIN 
    skills_dim AS skills 
    ON skills.skill_id = remote_job_skills.skill_id
ORDER BY
    skill_count DESC
LIMIT 5;