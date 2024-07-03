--19. Create a stored procedure to move completed projects (past deadlines) to an archive table
CREATE TABLE IF NOT EXISTS archived_projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255),
    requirements TEXT,
    deadline DATE,
    client_id INT,
    archived_date DATE
);

ALTER TABLE archived_projects
ADD CONSTRAINT fk_archiveclient FOREIGN KEY (client_id) REFERENCES client (client_id);

DELIMITER $$

CREATE PROCEDURE archive_completed_projects()
BEGIN
    -- Insert completed projects into the archive table
    INSERT INTO archived_projects (project_id, project_name, requirements, deadline, client_id, archived_date)
    SELECT project_id, project_name, requirements, deadline, client_id, CURRENT_DATE
    FROM project
    WHERE deadline < CURRENT_DATE;

    -- Delete the completed projects from the original table
    DELETE FROM project
    WHERE deadline < CURRENT_DATE;
END$$

DELIMITER;

-- Usage
CALL archive_completed_projects ();