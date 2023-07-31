SELECT s.id, (s.first_name || ' ' || s.last_name) as full_name, g.name as [group], gr.grade, d.name as discipline FROM students s 
JOIN [groups] g ON g.id = s.group_id
JOIN grades gr ON gr.student_id = s.id 
JOIN disciplines d ON d.id = gr.discipline_id 
WHERE g.id = 1 AND d.id = 1
ORDER BY full_name