SELECT client.NAME, COUNT(*) AS PROJECT_COUNT
FROM project
JOIN client ON project.CLIENT_ID = client.ID
GROUP BY client.NAME
HAVING COUNT(*) = (
    SELECT MAX(PROJECT_COUNT)
    FROM (
        SELECT COUNT(*) AS PROJECT_COUNT
        FROM project
        GROUP BY CLIENT_ID
    ) AS max_projects
);