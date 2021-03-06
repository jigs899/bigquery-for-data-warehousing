WITH numbers
AS (SELECT * FROM UNNEST(GENERATE_ARRAY(1, 100)) AS num)
SELECT num,
       AVG(num) OVER (ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) MovingAverage,
       SUM(num) OVER (ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) RunningTotal
FROM numbers
