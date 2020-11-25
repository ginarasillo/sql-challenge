-- Get employee details and salary
select e.emp_no, e.last_name, e.first_name, e.gender, s.salary  
from public.employees e
LEFT JOIN public.salaries s ON s.emp_no = e.emp_no;


-- Get employees that were hired on 1986
select * 
from public.employees 
where hire_date >= '1986-01-01' and hire_date < '1987-01-01';

/*
List the manager of each department with the following information: 
department number, department name, the manager's employee number, 
last name, first name, and start and end employment dates.
*/
select d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
from department d
left join dept_manager dm ON dm.dept_no = d.dept_no
left join employees e ON e.emp_no = dm.emp_no;

/*
List the department of each employee with the following information:
employee number, last name, first name, and department name.
*/
select e.emp_no, e.last_name, e.first_name, d.dept_name
from public.employees e
left join public.dept_emp de ON de.emp_no = e.emp_no
left join public.department d ON d.dept_no = de.dept_no;

/*
List all employees whose first name is "Hercules" and last names begin with "B".
*/
select * 
from public.employees
where first_name = 'Hercules' and last_name like 'B%';

/*
List all employees in the Sales department, 
including their employee number, last name, first name, and department name.
*/
select e.emp_no, e.last_name, e.first_name, d.dept_name
from public.employees e
left join public.dept_emp de ON de.emp_no = e.emp_no
left join public.department d ON d.dept_no = de.dept_no
where d.dept_name = 'Sales';

/*
List all employees in the Sales and Development departments, 
including their employee number, last name, first name, and department name.
*/
select e.emp_no, e.last_name, e.first_name, d.dept_name
from public.employees e
left join public.dept_emp de ON de.emp_no = e.emp_no
left join public.department d ON d.dept_no = de.dept_no
where d.dept_name = 'Sales' or d.dept_name = 'Development';

/*
In descending order, list the frequency 
count of employee last names, i.e., how many employees share each last name.
*/
select last_name, count(1) frequency
from public.employees
group by last_name order by frequency desc;