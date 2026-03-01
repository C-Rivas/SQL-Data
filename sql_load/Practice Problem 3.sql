/*Write a query to find companies (include company name)
  that have posted jobs offering health insurance,
  where these postings were made in the second quarter of 2023.
  Use date extraction to filter by quarter.
*/

SELECT
        companies.name,
        job_posting.job_health_insurance,
        job_posting.job_posted_date AS date_posted

FROM
        job_postings_fact as job_posting

LEFT JOIN 
        company_dim as companies
        ON job_posting.company_id = companies.company_id

WHERE
        job_health_insurance = TRUE
        AND job_posted_date >= '2023-04-01'
        AND job_posted_date < '2023-07-01'

ORDER BY
        job_posted_date ASC;

