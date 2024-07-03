--23.Create a view to show overdue projects with the number of days overdue
CREATE VIEW Overdue_Projects AS
SELECT p.project_id, p.project_name, p.requirements, p.deadline, p.client_id, c.client_name, DATEDIFF(CURRENT_DATE, p.deadline) AS days_overdue
FROM project p
    JOIN client c ON p.client_id = c.client_id
WHERE
    p.deadline < CURRENT_DATE;

SELECT * FROM Overdue_Projects;