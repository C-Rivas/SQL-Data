/*
Identify the top 5 skills that are most frequently mentioned in job postings.
Use a subquery to find the skill IDs with the highest counts in the skills_job_dim table
and then join this result with the skills_dim table to get the skill names.
*/
SELECT
    sd.skill_id,
    sd.skills,
    sub.skill_count
FROM
    (
        SELECT
            skill_id,
            COUNT(*) AS skill_count
        FROM
            skills_job_dim
        GROUP BY
            skill_id
        ORDER BY
            skill_count DESC
        LIMIT 5
    ) AS sub
LEFT JOIN
    skills_dim AS sd
    ON sd.skill_id = sub.skill_id;

/*
Subquery (sub)
* Cuenta cuántas veces aparece cada skill_id en skills_job_dim.
* Ordena por mayor frecuencia.
* Limita a los top 5.
JOIN
Une esos 5 skill_id con skills_dim para obtener el nombre de la habilidad.
*/