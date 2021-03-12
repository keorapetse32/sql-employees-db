SELECT employees.first_name, employees.last_name,departments.dept_name,salaries.salary,titles.title,overhours.hours
FROM employees LEFT JOIN departments
ON employees.department = departments.dept_id
LEFT JOIN titles
ON employees.title = titles.title_id
LEFT JOIN salaries
ON employees.salary = salaries.salary_id
LEFT JOIN overhours
ON employees.overhour = overhours.overhour_id