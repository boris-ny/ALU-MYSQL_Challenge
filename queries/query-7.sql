--7. Find all clients with projects having a deadline after October 31st, 2024.
SELECT client_name
FROM client
WHERE
    client_id IN (
        SELECT client_id
        FROM project
        WHERE
            deadline > '2024-10-31'
    );