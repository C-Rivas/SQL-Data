SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
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
