SELECT s.id, (s.first_name || ' ' || s.last_name) as student_full_name, d.name as discipline, (t.last_name || " " || t.last_name) as teacher_full_name
FROM grades g
JOIN disciplines d ON d.id = g.discipline_id
JOIN teachers t ON t.id = d.teacher_id
JOIN students s ON s.id = g.student_id
WHERE s.id = 4