/*Write a query to count the number of job postings for each month in 2023,
  adjusting the job_posted_date to be in 'America/New_York' time zone
  before extracting (hint) the month.
  Assume the job_posted_date is stored in UTC.
  Group by and order by the month.
*/


SELECT
        COUNT(job_title_short) AS job_counting,
        EXTRACT(MONTH FROM job_posted_date
                AT TIME ZONE 'UTC'
                AT TIME ZONE 'America/New_York') AS month_date

FROM
        job_postings_fact

WHERE
        job_posted_date >= '2023-01-01' AND job_posted_date < '2024-01-01'

GROUP BY
        month_date

ORDER BY
        month_date;