-- 17. Create a function to calculate the number of days a project is overdue
DELIMITER $$

CREATE FUNCTION days_overdue(project_id INT) 
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE deadline DATE;
    DECLARE overdue_days INT;

    -- Get the project deadline
    SELECT p.deadline INTO deadline
    FROM project p
    WHERE p.project_id = project_id;

    -- Calculate the number of days overdue
    SET overdue_days = DATEDIFF(CURRENT_DATE, deadline);
    
    -- If the project is not overdue, return 0
    IF overdue_days < 0 THEN
        SET overdue_days = 0;
    END IF;

    RETURN overdue_days;
END$$

DELIMITER;

-- Usage
SELECT days_overdue (1) AS overdue_days;