-- Inner Join
-- Getting dept_no, emp_no and the dept_name from the dept_manager_dup and the department_dup Tables using Inner Join.

-- let 
-- dept_manager_dup = m
-- deoartment_dup = d

SELECT 
    m.dept_no,
    m.emp_no,
    d.dept_name
FROM
    dept_manager_dup m
JOIN
    department_dup d 
    ON m.dept_no = d.dept_no
GROUP BY m.emp_no, -- This will remove the duplicate in the dataset
		 m.dept_no,
         d.dept_name
ORDER BY m.dept_no;

-- List containing all managers emloyee numebr, first name, last name, department number and hire date

-- Let dept_manager table = dm
-- employees table = em
SELECT 
    dm.emp_no,
    em.first_name,
    em.last_name,
    dm.dept_no,
    em.hire_date
FROM
    dept_manager dm
        INNER JOIN
    employees em ON dm.emp_no = em.emp_no
ORDER BY dm.emp_no;


-- Left Join
-- Getting dept_no, emp_no and the dept_name from the dept_manager_dup and the department_dup Tables using Inner Join.

-- let 
-- dept_manager_dup = m
-- deoartment_dup = d

SELECT 
    m.dept_no,
    m.emp_no,
    d.dept_name
FROM
    dept_manager_dup m
Left JOIN
    department_dup d 
    ON m.dept_no = d.dept_no
GROUP BY m.emp_no, -- This will remove the duplicate in the dataset
		 m.dept_no,
         d.dept_name
ORDER BY m.dept_no;

-- Getting emp_no, first_name, last_name, dept_no and from_date from the dept_manager and the employees Tables using Left Join.

-- let 
-- dept_manager = dm
-- employees = em

SELECT 
    em.emp_no,
    em.first_name,
    em.last_name,
    dm.dept_no,
    dm.from_date
FROM
    employees em
        LEFT JOIN
    dept_manager dm ON em.emp_no = dm.emp_no
WHERE
    em.last_name = 'Markovitch'
ORDER BY dm.dept_no DESC , em.emp_no;

-- Right Join
-- Getting dept_no, emp_no and the dept_name from the dept_manager_dup and the department_dup Tables using Right Join.

-- let 
-- dept_manager_dup = m
-- deoartment_dup = d

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        RIGHT JOIN
    department_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no , m.dept_no , d.dept_name
ORDER BY m.dept_no;

-- Using the Where clause with Join

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m,
    department_dup d
WHERE
    m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- A list containing information about all managers emp_no, first_name, last_name, dept_no, hire_date, using the old synthax
SELECT 
    dm.emp_no,
    em.first_name,
    em.last_name,
    dm.dept_no,
    em.hire_date
FROM
    dept_manager dm,
    employees em
WHERE
    dm.emp_no = em.emp_no
ORDER BY em.hire_date;

-- Using a where clause to define another condition in a query
-- employees emp_no, first_name, last_name, with salary > 145000
SELECT 
    e.emp_no, e.first_name, e.last_name, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > 145000
ORDER BY s.salary;

-- first_name, last_name, hire_date, job_title. first name and last name = Margareta Markovitch
SELECT 
    e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    e.first_name = 'Margareta'
        AND e.last_name = 'Markovitch';


-- CROSS JOIN
SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;


SELECT 
    dm.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
    d.dept_no = 'd009'
ORDER BY d.dept_name;

SELECT 
    e.*, d.*
FROM
    employees e
        CROSS JOIN
    departments d
WHERE
    e.emp_no < 10011
ORDER BY e.emp_no , d.dept_name;

-- Finding the average salaries of men and women in the company
SELECT 
    ROUND(AVG(s.salary), 2) AS Average_Salary, e.gender
FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no
GROUP BY e.gender;

-- Join more than two tables together
-- extract the first, last name of all managers, hire date, from date and dept name

SELECT 
    e.first_name,
    e.last_name,
    e.emp_no,
    e.hire_date,
    dm.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        JOIN
    departments d ON dm.dept_no = d.dept_no;
    
-- Finding average salary of each department.
SELECT 
    d.dept_name, ROUND(AVG(s.salary), 2) AS Average_Salary
FROM
    departments d
        JOIN
    dept_manager dm ON d.dept_no = dm.dept_no
        JOIN
    salaries s ON dm.emp_no = s.emp_no
GROUP BY d.dept_name;

-- How many male and female managers do we have in the employees database.
SELECT 
    COUNT(dm.emp_no), e.gender
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY e.gender;