# Write your MySQL query statement below
select
    d1.visited_on,
    sum(d2.amount) as amount,
    round(avg(d2.amount), 2) as average_amount
from (
    select visited_on, sum(amount) as amount
    from customer
    group by visited_on
) d1
join (
    select visited_on, sum(amount) as amount
    from customer
    group by visited_on
) d2
on d2.visited_on between date_sub(d1.visited_on, interval 6 day)
                     and d1.visited_on
group by d1.visited_on
having count(d2.visited_on) = 7
order by d1.visited_on;