--counting employees
SELECT COUNT(*) AS total_employees
FROM employees;

--viewing employee data
SELECT *
FROM employees
LIMIT 10;


--counting employees by dept
SELECT
    department_id,
    COUNT(*) AS employee_count
FROM employees
GROUP BY department_id
ORDER BY employee_count DESC;


--Calculating the average employee salary
SELECT
    ROUND(AVG(annual_salary), 2) AS average_salary
FROM employees;


--comparing average salaries by dept
SELECT
    department_id,
    COUNT(*) AS employee_count,
    ROUND(AVG(annual_salary), 2) AS average_salary
FROM employees
GROUP BY department_id
ORDER BY average_salary DESC;


--finding missing salary information
SELECT
    employee_id,
    first_name,
    last_name,
    department_id,
    annual_salary
FROM employees
WHERE annual_salary IS NULL;



--creating a salary summary report
SELECT
    COUNT(*) AS total_employees,
    COUNT(annual_salary) AS employees_with_salary,
    COUNT(*) - COUNT(annual_salary) AS missing_salaries,
    ROUND(AVG(annual_salary), 2) AS average_salary,
    MIN(annual_salary) AS lowest_salary,
    MAX(annual_salary) AS highest_salary
FROM employees;



--employees hired by year
SELECT
    EXTRACT(YEAR FROM hire_date) AS hire_year,
    COUNT(*) AS employees_hired
FROM employees
GROUP BY EXTRACT(YEAR FROM hire_date)
ORDER BY hire_year;



-- Monthly Hiring Trends
SELECT
    DATE_TRUNC('month', hire_date)::DATE AS hire_month,
    COUNT(*) AS employees_hired
FROM employees
GROUP BY DATE_TRUNC('month', hire_date)
ORDER BY hire_month;



-- Most employees in department hired Since 2025
SELECT
    department_id,
    COUNT(*) AS employees_hired
FROM employees
WHERE hire_date >= '2025-01-01'
GROUP BY department_id
ORDER BY employees_hired DESC;



-- Top 5 Hiring Months
SELECT
    DATE_TRUNC('month', hire_date)::DATE AS hire_month,
    COUNT(*) AS employees_hired
FROM employees
GROUP BY DATE_TRUNC('month', hire_date)
ORDER BY employees_hired DESC
LIMIT 5;



-- Employee Status Breakdown
SELECT
    employment_status,
    COUNT(*) AS employee_count
FROM employees
GROUP BY employment_status
ORDER BY employee_count DESC;



-- Active Employee Percentage
SELECT
    COUNT(*) AS total_records,
    COUNT(*) FILTER (
        WHERE employment_status = 'Active'
    ) AS active_employees,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE employment_status = 'Active'
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS active_percentage
FROM employees;


-- 12. Terminated Employee Percentage by Department
SELECT
    department_id,
    COUNT(*) AS total_records,
    COUNT(*) FILTER (
        WHERE employment_status = 'Terminated'
    ) AS terminated_employees,
    ROUND(
        100.0 * COUNT(*) FILTER (
            WHERE employment_status = 'Terminated'
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS terminated_percentage
FROM employees
GROUP BY department_id
ORDER BY terminated_percentage DESC;



-- Missing Department IDs
SELECT
    COUNT(*) AS missing_department_ids
FROM employees
WHERE department_id IS NULL
   OR TRIM(department_id) = '';


-- creating departments table
CREATE TABLE departments (
    department_id VARCHAR(20) PRIMARY KEY,
    department_name VARCHAR(100)
);



-- 15. Insert Department Names
INSERT INTO departments (
    department_id,
    department_name
)
VALUES
    ('D001', 'Human Resources'),
    ('D002', 'Finance'),
    ('D003', 'Information Technology'),
    ('D004', 'Marketing'),
    ('D005', 'Operations'),
    ('D006', 'Sales');


SELECT *
FROM departments;



-- 16. Joining Employees with Departments
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    d.department_name,
    e.annual_salary
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id
LIMIT 10;



-- 17. Calculating Average Salary by Department Name
SELECT
    COALESCE(
        d.department_name,
        'Unknown Department'
    ) AS department,
    COUNT(*) AS employee_count,
    ROUND(AVG(e.annual_salary), 2) AS average_salary
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY average_salary DESC;


-- 18. Create Employee Analytics View

CREATE OR REPLACE VIEW vw_employee_analytics AS
SELECT
    e.employee_id,
    e.first_name,
    e.last_name,
    COALESCE(
        d.department_name,
        'Unknown Department'
    ) AS department_name,
    e.job_title,
    e.hire_date,
    EXTRACT(YEAR FROM e.hire_date)::INTEGER AS hire_year,
    e.employment_status,
    e.employment_type,
    e.annual_salary,
    e.manager_id,
    e.work_location
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id;



-- 19. Verify Employee Analytics View

SELECT COUNT(*) AS total_employees
FROM vw_employee_analytics;



-- 20. Preview Tableau Data

SELECT *
FROM vw_employee_analytics;



-- 21. Verify Unique Employee IDs

SELECT
    employee_id,
    COUNT(*) AS duplicate_count
FROM vw_employee_analytics
GROUP BY employee_id
HAVING COUNT(*) > 1;
