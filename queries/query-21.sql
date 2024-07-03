-- 21. Create a trigger to ensure a team lead assigned to a project is a valid employee
DELIMITER $$

CREATE TRIGGER trg_team_lead_check
BEFORE INSERT ON team_members
FOR EACH ROW
BEGIN
    DECLARE is_valid_lead INT;
    
    -- Check if the team lead is a valid employee
    SELECT COUNT(*)
    INTO is_valid_lead
    FROM employees
    WHERE employee_id = NEW.employee_id;
    
    -- If the team lead is not a valid employee, raise an error
    IF is_valid_lead = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid team lead employee';
    END IF;
END$$

DELIMITER;