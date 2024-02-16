# Creating a duplicate of the department table.

DROP TABLE IF EXISTS department_dup;
CREATE TABLE department_dup (
    dept_no CHAR(4) NULL,
    dept_name VARCHAR(40) NULL
);

INSERT INTO department_dup (
	dept_no,
    dept_name
) SELECT * FROM departments;

INSERT INTO department_dup (dept_name)
VALUE ('Public relations');

DELETE FROM department_dup 
WHERE
    dept_no = 'd002';

INSERT INTO department_dup(dept_no)  VALUES ('d010'), ('d011');

-- DELETE FROM department_dup 
-- WHERE
--     dept_name = 'Public elations';

SELECT 
    *
FROM
    department_dup;
    
# Creating a duplicate of the department manager table.

DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);

INSERT INTO dept_manager_dup
SELECT * FROM dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES 
(999904, '2017-01-01'),
(999905, '2017-01-01'),
(999906, '2017-01-01'),
(999907, '2017-01-01')
;

DELETE FROM dept_manager_dup 
WHERE
    dept_no = 'd001';

-- Inserting duplicate records

INSERT INTO dept_manager_dup
VALUES ('110228', 'd003', '1992-03-21', '9999-01-01');

INSERT INTO department_dup
VALUES ('d009', 'Customer Service');

-- Removing Duplicate from the tow tables
DELETE FROM dept_manager_dup 
WHERE
emp_no = '110228';

DELETE FROM department_dup
WHERE dept_no = 'd009';

-- Add back the initial records
INSERT INTO dept_manager_dup
VALUES ('110228', 'd003', '1992-03-21', '9999-01-01');

INSERT INTO department_dup
VALUES ('d009', 'Customer Service');
    
SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no ASC;

SELECT 
    *
FROM
    department_dup
ORDER BY dept_no ASC;