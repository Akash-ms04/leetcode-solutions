-- Write your PostgreSQL query statement below
select e.name
from employee e
join employee r
on e.id = r.managerId
group by e.id, e.name
having count(*) >=5;