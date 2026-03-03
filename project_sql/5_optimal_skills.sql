WITH skills_demand AS (
    SELECT
        s.skill_id,
        s.skills,
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
        s.skill_id
), average_salary AS (
    SELECT
        sj.skill_id,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact AS jpf
    INNER JOIN
        skills_job_dim AS sj
        ON jpf.job_id = sj.job_id
    INNER JOIN
        skills_dim AS s
        ON sj.skill_id = s.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_location = 'Anywhere'
    GROUP BY
        sj.skill_id
) 

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM
    skills_demand
INNER JOIN
    average_salary
    ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25