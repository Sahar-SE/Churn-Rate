SELECT COUNT(DISTINCT user_id) AS 'enrollments',
  COUNT(CASE
       	WHEN strftime("%m", cancel_date) = '03'
        THEN user_id
  END) AS 'march_cancellations',
 	ROUND(100.0 * COUNT(CASE
       	WHEN strftime("%m", cancel_date) = '03'
        THEN user_id
  END) / COUNT(DISTINCT user_id)) AS 'churn_rate'
FROM pro_users
WHERE signup_date < '2024-04-01'
	AND (
    (cancel_date IS NULL) OR
    (cancel_date > '2024-03-01')
  );