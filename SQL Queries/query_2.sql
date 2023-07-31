SELECT d.name, (first_name || ' ' || last_name) as full_name, ROUND(AVG(grade), 2) AS average_grade
FROM grades g
JOIN students s ON s.id = g.student_id
JOIN disciplines d ON  d.id = g.discipline_id
WHERE d.id = 7
GROUP BY s.first_name, s.last_name
ORDER BY average_grade DESC
LIMIT 1;