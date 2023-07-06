--- correct resoving: 
SELECT client.name, COUNT(project.id)
FROM project
JOIN client ON client.id = project.client_id
GROUP BY project.client_id
HAVING COUNT(project.id) IN (
    SELECT COUNT(id)
    FROM project
    GROUP BY client_id
    ORDER BY COUNT(id) DESC
    LIMIT 1
);



--- TEMPORARY!!!!
SELECT client_id, COUNT(id)
    FROM project
    GROUP BY client_id
    HAVING COUNT (id) IN (
        SELECT COUNT (id)
        FROM project
        GROUP BY client_id
        ORDER BY COUNT (id) DESC
        LIMIT 1
    ); -- gives a client_IDs? who has highest number of projects + with number of project;

