-- 16. Create a function to calculate the number of days remaining until a project deadline.
DELIMITER $$

CREATE FUNCTION days_until_deadline(project_id INT) 
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE deadline DATE;
    DECLARE days_remaining INT;
    
    -- Get the project deadline
    SELECT p.deadline INTO deadline
    FROM project p
    WHERE p.project_id = project_id;

    -- Calculate the number of days remaining
    SET days_remaining = DATEDIFF(deadline, CURRENT_DATE);
    
    RETURN days_remaining;
END$$

DELIMITER;
-- Usage
SELECT days_until_deadline (1) AS days_remaining;