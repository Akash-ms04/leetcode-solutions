# Write your MySQL query statement below
select employee_id, department_id
from (
    select
        employee_id,
        department_id,
        primary_flag,
        count(*) over (partition by employee_id) as dept_count
    from employee
) t
where primary_flag = 'Y'
   or dept_count = 1;