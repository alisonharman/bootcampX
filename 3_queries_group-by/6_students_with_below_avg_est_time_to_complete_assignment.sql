SELECT students.name as student, avg(assignment_submissions.duration) as avg_assignment_duration, avg(assignments.duration) as avg_est_duration 
FROM assignments
  JOIN assignment_submissions ON assignments.id = assignment_id
  JOIN students ON student_id = students.id
WHERE end_date IS NULL
GROUP BY student 
HAVING avg(assignment_submissions.duration) <  avg(assignments.duration)
ORDER BY avg_assignment_duration;