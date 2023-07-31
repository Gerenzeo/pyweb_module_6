SELECT s.group_id, g.name as Group_name, s.first_name || ' ' || s.last_name as full_name FROM [groups] g
JOIN students s ON s.group_id = g.id
WHERE g.id = 1