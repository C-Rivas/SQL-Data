WITH top_paying_jobs AS (
SELECT
    job_id,
    job_title,
    salary_year_avg,
    job_posted_date::DATE,
    companies.name AS company_name
FROM
    job_postings_fact AS jpf
LEFT JOIN company_dim AS companies
          ON jpf.company_id = companies.company_id
WHERE
    salary_year_avg IS NOT NULL
    AND job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
ORDER BY
    salary_year_avg DESC
LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN
    skills_job_dim AS sj
    ON top_paying_jobs.job_id = sj.job_id
INNER JOIN
    skills_dim AS s
    ON sj.skill_id = s.skill_id
ORDER BY
    salary_year_avg DESC