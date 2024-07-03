--15. Create a view to display the total number of projects assigned to each employee.
CREATE OR REPLACE VIEW Employee_Project_Count AS
SELECT employees.employee_id, employees.employee_name, COUNT(team_members.project_id) AS projects_assigned
FROM employees
    JOIN team_members ON team_members.employee_id = employees.employee_id
GROUP BY
    employees.employee_id,
    employees.employee_name;