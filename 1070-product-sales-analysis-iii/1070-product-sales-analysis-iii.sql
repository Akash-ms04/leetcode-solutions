# Write your MySQL query statement below
select s.product_id, s.year as first_year, s.quantity, s.price
from Sales s
join ( select
        product_id,
        MIN(year) as first_year
    from Sales
    group by product_id
) fy
on s.product_id = fy.product_id
and s.year = fy.first_year;
