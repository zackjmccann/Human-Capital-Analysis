CREATE TABLE departments (
	dept_no INT PRIMARY KEY,
	dept_name VARCHAR(30)
);
---------------------------
CREATE TABLE dept_emp (
	emp_no INT FOREIGN KEY REFERENCES employees(emp_no),
	dept_no INT FOREIGN KEY REFERENCES departments(dept_no),
	from_date INT FOREIGN KEY REFERENCES titles(from_date),
	to_date INT
);
---------------------------
CREATE TABLE dept_manager (
	dept_no INT FOREIGN KEY REFERENCES departments(dept_no),
	emp_no INT FOREIGN KEY REFERENCES employees(emp_no),
	from_date INT FOREIGN KEY REFERENCES titles(from_date),
	to_date INT
);
---------------------------
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	birth_date VARCHAR(30),
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	gender VARCHAR(30),
	hire_date INT FOREIGN KEY REFERENCES titles(from_date)
);
---------------------------
CREATE TABLE salaries (
	emp_no INT FOREIGN KEY REFERENCES employees(emp_no),
	salary INT,
	from_date INT FOREIGN KEY REFERENCES titles(from_date),
	to_date INT
);
---------------------------
CREATE TABLE titles (
	emp_no INT FOREIGN KEY REFERENCES employees(emp_no),
	title VARCHAR(30),
	from_date INT PRIMARY KEY,
	to_date INT
);
