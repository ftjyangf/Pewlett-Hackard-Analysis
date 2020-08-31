-- deliverable 1
SELECT e.emp_no, e.first_name,e.last_name,
t.title,t.from_date,t.to_date
INTO retirement_titles
FROM employee as e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN ('1952-01-01') AND ('1955-12-31')
ORDER BY e.emp_no ASC

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title,
from_date,
to_date
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no,to_date DESC


SELECT COUNT(title),title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC

SELECT * FROM mentorship_eligibilty
ORDER BY emp_no DESC

---deliverable 2
SELECT DISTINCT ON (e.emp_no)e.emp_no,
e.first_name,e.last_name,e.birth_date,
de.from_date,de.to_date,
ti.title
INTO mentorship_eligibilty
FROM employee as e 
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN ('1965-01-01') AND ('1965-12-31'))
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no ASC

-- two table
-- answer the question of what is the number of mentors for each job title

SELECT COUNT(*),title
FROM mentorship_eligibilty
GROUP BY title
--answer the question of how many of people getting retirement age is still working 
--for each job title
SELECT COUNT(title),title
FROM unique_titles
WHERE to_date = '9999-01-01'
GROUP BY title
ORDER BY COUNT(title) DESC