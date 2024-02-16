USE employees;
# Using the WHERE clause and AND to select data
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';
    
# Using the WHERE clause and OR to select data
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' OR first_name = 'Elvis';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' OR first_name = 'Aruna';
    
# Using the WHERE clause and AND and OR to select data - Always use () to seperate the different operatiors.

# 1
SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis'
        AND (gender = 'M' 
        OR gender = 'F');
        
# 2
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');
        
# Using the WHERE clause and IN and NOT IN to select data with more than 2 conditions.

#1
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');

#2
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');

#3
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');

#4
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');
    
# Using the WHERE clause, LIKE and NOT LIKE to select data

#1 - All Employees who's first name starts with MARK
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');

#2 - Retrieve a list of employees hired in th year 2000
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('2000%');
    
#3 - All Employees with a 5 character employee number starting with 1000
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');

#4 - List of all employees who's first name contain Jack
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Jack%');

#5 - List of all employees who's first name does not contain Jack
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Jack%');
    
# Using the WHERE clause, BETWEEN NOT BETWEEN, AND to select data

#1 - Employees with salary between  66,000 - 70,000
SELECT 
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;
    
#2 - Employees whose employee number is not between 10004 and 10012
SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN 10004 AND 10012;
    
#3 - Names of all department with numbers between d003 and d006
SELECT 
    *
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006'
ORDER BY dept_no;

# Using the WHERE clause, NULL and NOT NULL to select data

#1 - Department whose department number value is not null.
SELECT 
    *
FROM
    departments
WHERE
    dept_no IS NOT NULL;