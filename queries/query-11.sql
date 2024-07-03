--11. Create a view to simplify retrieving client contact
CREATE VIEW ClientContact AS
SELECT
    client_id,
    client_name,
    contact_name
FROM client;