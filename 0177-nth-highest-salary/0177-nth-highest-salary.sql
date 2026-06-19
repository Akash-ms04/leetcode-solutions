CREATE OR REPLACE FUNCTION NthHighestSalary(N INT)
RETURNS TABLE (Salary INT) AS $$
BEGIN
    RETURN QUERY
    SELECT (
        SELECT t.salary
        FROM (
            SELECT e.salary,
                   DENSE_RANK() OVER (ORDER BY e.salary DESC) AS rnk
            FROM Employee e
        ) t
        WHERE t.rnk = N
        LIMIT 1
    ) AS Salary;
END;
$$ LANGUAGE plpgsql;