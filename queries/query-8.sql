--8.List employees who are not currently team leads on any project.
SELECT * FROM team_members WHERE is_lead = 0;