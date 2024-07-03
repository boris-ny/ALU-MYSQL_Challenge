--24. Create a stored procedure to update project team members (remove existing, add new ones)
DELIMITER $$

CREATE PROCEDURE update_project_team (
    IN p_project_id INT,
    IN new_team_members JSON
)
BEGIN
    -- Remove existing team members
    DELETE FROM team_members
    WHERE project_id = p_project_id;

    -- Declare variables for iterating through the JSON array
    DECLARE i INT DEFAULT 0;
    DECLARE n INT;
    DECLARE member_id INT;
    DECLARE is_lead BOOLEAN;

    -- Get the count of new team members
    SET n = JSON_LENGTH(new_team_members);

    -- Loop through the JSON array to insert new team members
    WHILE i < n DO
        SET member_id = JSON_UNQUOTE(JSON_EXTRACT(new_team_members, CONCAT('$[', i, '].employee_id')));
        SET is_lead = JSON_UNQUOTE(JSON_EXTRACT(new_team_members, CONCAT('$[', i, '].is_lead')));

        INSERT INTO team_members (project_id, employee_id, is_lead)
        VALUES (p_project_id, member_id, is_lead);

        SET i = i + 1;
    END WHILE;
END$$

DELIMITER;