--12. Create a view to show only ongoing projects (not yet completed).
CREATE VIEW OnGoingProjects AS
SELECT
    project_id,
    project_name,
    requirements,
    deadline,
    client_id
FROM project
WHERE
    deadline >= CURRENT_DATE;