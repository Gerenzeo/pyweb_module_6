SELECT d.name, (t.first_name || ' ' || t.last_name) AS full_name, d.teacher_id FROM disciplines d
JOIN teachers t ON t.id = d.teacher_id 
ORDER BY d.teacher_id