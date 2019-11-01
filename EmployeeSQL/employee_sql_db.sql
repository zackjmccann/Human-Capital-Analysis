CREATE TABLE departments (
	dept_no VARCHAR(30) PRIMARY KEY,
	dept_name VARCHAR(30)
);
SELECT * FROM departments;
---------------------------
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	birth_date VARCHAR(30),
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	gender VARCHAR(30),
	hire_date TIMESTAMP
);
SELECT * FROM employees;
---------------------------
CREATE TABLE dept_manager (
	dept_no VARCHAR(30),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	from_date TIMESTAMP,
	to_date TIMESTAMP
);
SELECT * FROM dept_manager;
---------------------------
CREATE TABLE dept_emp (
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(30),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	from_date TIMESTAMP,
	to_date TIMESTAMP
);
SELECT * FROM dept_emp;
---------------------------
CREATE TABLE salaries (
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary INT,
	from_date TIMESTAMP,
	to_date TIMESTAMP
);
SELECT * FROM salaries;
---------------------------
CREATE TABLE titles (
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	title VARCHAR(30),
	from_date TIMESTAMP,
	to_date TIMESTAMP
);
SELECT * FROM titles;
---------------------------
DROP TABLE dept_emp;
DROP TABLE salaries;
DROP TABLE titles;
DROP TABLE dept_manager;
DROP TABLE departments;
DROP TABLE employees;
---------------------------

---------Analysis----------
--1--
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees as e
JOIN salaries as s ON e.emp_no=s.emp_no;

--2--
SELECT emp_no, first_name, last_name, hire_date::date FROM employees
WHERE EXTRACT(year FROM hire_date) = 1986;

--3--
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date::date, dm.to_date::date
FROM departments as d
JOIN dept_manager as dm ON d.dept_no=dm.dept_no
JOIN employees as e ON e.emp_no=dm.emp_no;

--4--
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
JOIN employees as e ON de.emp_no=e.emp_no
JOIN departments as d ON d.dept_no=de.dept_no;

--5--
SELECT first_name, last_name FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%';

--6--
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
JOIN employees as e ON de.emp_no=e.emp_no
JOIN departments as d ON d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales';

--7--
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
JOIN employees as e ON de.emp_no=e.emp_no
JOIN departments as d ON d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--8--









