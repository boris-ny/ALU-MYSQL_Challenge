--14.Create a view to show project names and client contact information for projects with a deadline in November 2024.
CREATE OR REPLACE VIEW Project_Client_November AS
SELECT project.project_name, project.deadline, client.contact_name, client.client_name
FROM project
    JOIN client ON project.client_id = client.client_id
WHERE
    deadline BETWEEN '2024-11-01' AND '2024-11-30';