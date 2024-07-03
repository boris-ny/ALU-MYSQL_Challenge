--9. Combine a list of projects with deadlines before December 1st and another list with "Management" in the project name
SELECT *
FROM project
WHERE
    deadline < '2024-12-01'
UNION
SELECT *
FROM project
WHERE
    project_name LIKE '%Management%';