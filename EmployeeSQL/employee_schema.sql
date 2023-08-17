CREATE TABLE title(
	title_id VARCHAR(10) NOT NULL PRIMARY KEY,
	title VARCHAR(30) NOT NULL
);

CREATE TABLE employee(
	emp_no INTEGER NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(10),
	FOREIGN KEY (emp_title_id) REFERENCES title(title_id),
	birth_date VARCHAR(10),
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	sex VARCHAR(1),
	hire_date VARCHAR(10)
);

CREATE TABLE salary(
	emp_no INTEGER NOT NULL PRIMARY KEY,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	salary INTEGER NOT NULL
);

CREATE TABLE department(
	dept_no VARCHAR(10) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE dept_managers(
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE dept_emp_junction(
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);