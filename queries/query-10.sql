--10. Display a message indicating if a project is overdue (deadline passed).
SELECT
    project_name,
    deadline,
    CASE
        WHEN deadline < CURRENT_DATE THEN 'Overdue'
        ELSE 'Not overdue'
    END AS status
FROM project;