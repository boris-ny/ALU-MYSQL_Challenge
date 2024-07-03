--18. Create a stored procedure to add a new client and their first project in one call
DELIMITER $$

CREATE PROCEDURE add_client_project(
    IN client_name VARCHAR(255),
    IN contact_name VARCHAR(255),
    IN project_name VARCHAR(255),
    IN requirements TEXT,
    IN deadline DATE
)
BEGIN
    DECLARE client_id INT;
    DECLARE project_id INT;
    
    -- Add client
    INSERT INTO client (client_name, contact_name)
    VALUES (client_name, contact_name);
    
    -- Get the client_id of the newly added client
    SET client_id = LAST_INSERT_ID();
    
    -- Add project
    INSERT INTO project (project_name, requirements, deadline, client_id)
    VALUES (project_name, requirements, deadline, client_id);
    
    -- Get the project_id of the newly added project
    SET project_id = LAST_INSERT_ID();
    
    -- Return the project_id
    SELECT project_id, client_id,  project_name, client_name;
    
END$$

DELIMITER;

CALL add_client_project (
    'Boris Nyilindekwe', -- client_name
    'African Leadership University', -- contact_name
    'ALU Project', -- project_name
    'Complete all queries in the ALU project', -- requirements
    '2024-07-01' -- deadline
);