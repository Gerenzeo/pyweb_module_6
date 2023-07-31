SELECT s.id, d.name as discipline, (s.first_name || " " || s.last_name) as full_name FROM grades g 
JOIN disciplines d ON d.id = g.discipline_id
JOIN students s ON s.id = g.student_id
WHERE s.id = 10