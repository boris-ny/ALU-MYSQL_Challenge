--6 Find the total number of employees working on each project.
SELECT project_id, COUNT(employee_id)
FROM team_members
GROUP BY
    project_id;