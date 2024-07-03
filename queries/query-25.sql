--25. Prevent the deletion of projects with assigned team members using a trigger
DELIMITER $$

CREATE TRIGGER prevent_project_deletion
BEFORE DELETE ON project
FOR EACH ROW
BEGIN
    DECLARE team_member_count INT;

    -- Count the number of team members assigned to the project
    SELECT COUNT(*)
    INTO team_member_count
    FROM team_members
    WHERE project_id = OLD.project_id;

    -- If there are any team members assigned, prevent the deletion
    IF team_member_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete project: Team members are still assigned to this project.';
    END IF;
END$$

DELIMITER;