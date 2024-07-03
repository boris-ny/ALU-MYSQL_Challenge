--22.Create a view to display project details along with the total number of team members assigned
CREATE VIEW Project_Details_With_Team_Members AS
SELECT
    p.project_id,
    p.project_name,
    p.requirements,
    p.deadline,
    p.client_id,
    c.client_name,
    COUNT(tm.employee_id) AS total_team_members
FROM
    project p
    JOIN client c ON p.client_id = c.client_id
    LEFT JOIN team_members tm ON p.project_id = tm.project_id
GROUP BY
    p.project_id,
    p.project_name,
    p.requirements,
    p.deadline,
    p.client_id,
    c.client_name;

SELECT * FROM Project_Details_With_Team_Members;