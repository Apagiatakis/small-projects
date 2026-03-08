#Salary analysis
#highest paid employee
SELECT 
em.first_name,
em.last_name,
em.employee_id,
MAX(salary) AS highest_paid
FROM employees as em
GROUP BY  employee_id,first_name,last_name  
ORDER BY highest_paid DESC
LIMIT 1  
;

#AVERAGE SALARY PER DEPARTMENT
SELECT 
department,
ROUND(AVG(salary)) AS average_salary
FROM employees
GROUP BY department
ORDER BY department DESC
;

#Employees with 100k+ salary will get a 0.03%  cut,those with 60k or less get a 15% raise and others get a 5% raise
SELECT
   first_name,
   last_name,
   salary,
   CASE 
       WHEN salary >100000 THEN  salary - (salary * 0.03)
       WHEN salary <=60000 THEN  salary * 1.15 
       ELSE salary + (salary *0.05)
	END AS new_salary
FROM employees
;
#Employee age distribution
SELECT
 CASE 
   WHEN age < 30 THEN "Under 30"
   WHEN age BETWEEN 30 AND 39 THEN "30"
   WHEN age BETWEEN 40 AND 49 THEN "40"
   ELSE "50+"
END AS age_category,
COUNT(*) AS total_employees
FROM employees as em 
GROUP BY age_category;

#Remote vs onsite  comparison
SELECT  remote_status,COUNT(*)
FROM employees
GROUP BY remote_status
ORDER BY remote_status;

#RANKING EMPLOYEES BASED ON performance_rating based on the department
SELECT
first_name,
last_name,
performance_rating,
department,
RANK() OVER(
        PARTITION BY  department 
        ORDER BY  performance_rating DESC
        ) AS department_number
FROM employees;

#Employees working on projects
SELECT
em.first_name,
em.last_name,
em.department,
pr.project_name
FROM employees AS em
JOIN projects AS pr
ON em.employee_id = pr.employee_id
;

#Total project budget by department
SELECT
em.department,
SUM(project_budget) AS total_project_budget
FROM employees AS em 
JOIN projects as pr
ON em.employee_id = pr.employee_id
GROUP BY department 
ORDER BY total_project_budget DESC
;

#ranking projects by budget
SELECT
pr.project_name,
pr.project_budget,
pr.project_status,
em.department,
  DENSE_RANK() OVER (ORDER BY pr.project_budget DESC)  AS budget_rank
FROM projects AS pr
JOIN employees AS em
ON pr.employee_id = em.employee_id
ORDER BY budget_rank
;

#Completed  projects
SELECT
    e.department,
    COUNT(*) AS completed_projects
FROM employees e
JOIN projects p
ON e.employee_id = p.employee_id
WHERE p.project_status = 'Completed'
GROUP BY e.department
;
#Employees Without Projects
SELECT
em.first_name,
em.last_name,
em.department
FROM employees AS em
LEFT JOIN projects AS pr
ON em.employee_id = pr.employee_id 
WHERE pr.project_id IS NULL 
;
#Average Performance Score by Department
SELECT
em.department,
ROUND(AVG(performance_score)) AS avg_score
FROM employees AS em
JOIN performance_reviews AS prv
ON em.employee_id = prv.employee_id
GROUP BY department
ORDER BY  avg_score
;
#Total bonuses paid by department
SELECT
em.department,
SUM(bonus) AS sum_bonus
FROM employees AS em 
JOIN performance_reviews AS prv
ON em.employee_id = prv.employee_id
GROUP BY department
ORDER BY sum_bonus DESC
;
#Ranking employees by performance
SELECT
em.first_name,
em.department,
prv.performance_score,
RANK()
 OVER(ORDER BY prv.performance_score DESC) as performance_rank
FROM employees AS em
JOIN performance_reviews AS prv
ON em.employee_id = prv.employee_id
;
#Average salary by performance score
SELECT
prv.performance_score,
ROUND(AVG(em.salary)) AS avg_salary
FROM employees em
JOIN performance_reviews prv
ON em.employee_id = prv.employee_id
GROUP BY prv.performance_score
ORDER BY prv.performance_score DESC
;