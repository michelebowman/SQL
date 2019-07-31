--Data Analysis
--List employee details
SELECT ph_emp.employee.emp_no, last_name, first_name, gender, salary
FROM ph_emp.employee INNER JOIN ph_emp.salary
   ON ph_emp.employee.emp_no = ph_emp.salary.emp_no;
 
--List employees hired in 1986 
SELECT ph_emp.employee.emp_no, last_name, first_name, gender, hire_date, salary
FROM ph_emp.employee INNER JOIN ph_emp.salary
   ON ph_emp.employee.emp_no = ph_emp.salary.emp_no
WHERE hire_date >= '1986-01-01' AND hire_date <= '1986-12-31'
ORDER BY hire_date ASC;

--List department manager information
SELECT ph_emp.depts.dept_no, ph_emp.depts.dept_name, ph_emp.dept_manager.emp_no,
       last_name, first_name, from_date, to_date
FROM ph_emp.depts INNER JOIN ph_emp.dept_manager
       ON ph_emp.depts.dept_no = ph_emp.dept_manager.dept_no
	   INNER JOIN ph_emp.employee
	   ON ph_emp.dept_manager.emp_no = ph_emp.employee.emp_no;
	   
--List employee department information
SELECT ph_emp.employee.emp_no, last_name, first_name, dept_name
FROM ph_emp.employee INNER JOIN ph_emp.dept_emp
     ON ph_emp.employee.emp_no = ph_emp.dept_emp.emp_no
	 INNER JOIN ph_emp.depts
	 ON ph_emp.depts.dept_no = ph_emp.dept_emp.dept_no;

--List employees with first name Hercules and starts with B last name
SELECT first_name, last_name
FROM ph_emp.employee
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--Sales dept employees
SELECT ph_emp.employee.emp_no, last_name, first_name, dept_name
FROM ph_emp.employee INNER JOIN ph_emp.dept_emp
     ON ph_emp.employee.emp_no = ph_emp.dept_emp.emp_no
	 INNER JOIN ph_emp.depts
	 ON ph_emp.depts.dept_no = ph_emp.dept_emp.dept_no
WHERE ph_emp.depts.dept_name = 'Sales';

--Sales and Development dept employees
SELECT ph_emp.employee.emp_no, last_name, first_name, dept_name
FROM ph_emp.employee INNER JOIN ph_emp.dept_emp
     ON ph_emp.employee.emp_no = ph_emp.dept_emp.emp_no
	 INNER JOIN ph_emp.depts
	 ON ph_emp.depts.dept_no = ph_emp.dept_emp.dept_no
WHERE ph_emp.depts.dept_name IN ('Sales', 'Development');

--Count emp last names 
SELECT last_name, COUNT(last_name) AS Frequency
FROM ph_emp.employee
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

