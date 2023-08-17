SELECT emp.emp_no, emp.last_name, emp.first_name, emp.sex, salary.salary
FROM employee AS emp
JOIN salary ON
emp.emp_no = salary.emp_no;

SELECT first_name, last_name, hire_date
FROM employee
WHERE hire_date LIKE '%1986';

SELECT man.dept_no, dept.dept_name, man.emp_no, emp.last_name, emp.first_name
FROM dept_managers AS man
JOIN department AS dept ON
man.dept_no = dept.dept_no
JOIN employee AS emp ON
man.emp_no = emp.emp_no;

SELECT dej.dept_no, dej.emp_no, emp.last_name, emp.first_name, dept.dept_name
FROM dept_emp_junction AS dej 
JOIN employee AS emp ON
dej.emp_no = emp.emp_no
JOIN department AS dept ON
dej.dept_no = dept.dept_no;

SELECT first_name, last_name, sex
FROM employee
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT emp_no, last_name, first_name
FROM employee
WHERE emp_no IN(
	SELECT emp_no
	FROM dept_emp_junction
	WHERE dept_no IN(
		SELECT dept_no
		FROM department
		WHERE dept_name = 'Sales'
	)
);

SELECT emp.emp_no, last_name, first_name, dept_name
FROM employee AS emp
JOIN dept_emp_junction AS dej ON
emp.emp_no = dej.emp_no
JOIN department AS dept ON
dej.dept_no = dept.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

SELECT last_name, COUNT(last_name)
FROM employee
GROUP BY last_name
ORDER BY count DESC;