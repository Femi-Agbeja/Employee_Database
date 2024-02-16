# Count Function

# Number of employee in the database.
SELECT 
    COUNT(emp_no)
FROM
    employees;
# Number of unique first names of employee in the database.
SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;

# Number of contract greater than or equals to 100000 in the salary table.
SELECT 
    COUNT(salary)
FROM
    salaries
WHERE
    salary >= 100000;

# Number of managers in the employee database.
SELECT 
    COUNT(*)
FROM
    dept_manager;

# Uisng Having
# 1. All employees whose average salary is higher than 120k PA

SELECT 
    AVG(salary), emp_no
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000;

#2. List containing the distict first names hired after 1999-01-01
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;

#3. Employees who have signed more than one contract after 2000-01-01
SELECT 
    emp_no, COUNT(emp_no) as countract_count
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(emp_no) > 1
ORDER BY COUNT(emp_no);

# Limiting a select statement
SELECT 
    *
FROM
    dept_emp
LIMIT 100;

# Number of department
SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;
    
# Total amound spent on salaries after 1997-01-01
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';

# Lowest employee number in the database
SELECT 
    MIN(emp_no)
FROM
    employees;

# Highest employee number in the database.
SELECT 
    MAX(emp_no)
FROM
    employees;
    
# Average annual salary paid to employees who started work after 1997-01-01
SELECT 
    ROUND(AVG(salary),2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';
