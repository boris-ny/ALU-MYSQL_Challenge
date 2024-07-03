--20. Create a trigger to log any updates made to project records in a separate table for auditing purposes
CREATE TABLE IF NOT EXISTS project_audit (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    old_project_name VARCHAR(255),
    new_project_name VARCHAR(255),
    old_requirements TEXT,
    new_requirements TEXT,
    old_deadline DATE,
    new_deadline DATE,
    old_client_id INT,
    new_client_id INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$

CREATE TRIGGER trg_project_update
AFTER UPDATE ON project
FOR EACH ROW
BEGIN
    INSERT INTO project_audit (
        project_id, 
        old_project_name, new_project_name,
        old_requirements, new_requirements,
        old_deadline, new_deadline,
        old_client_id, new_client_id
       
    ) VALUES (
        OLD.project_id, 
        OLD.project_name, NEW.project_name,
        OLD.requirements, NEW.requirements,
        OLD.deadline, NEW.deadline,
        OLD.client_id, NEW.client_id
     
    );
END$$

DELIMITER;