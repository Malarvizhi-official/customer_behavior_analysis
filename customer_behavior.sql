SELECT gender,
       SUM(`purchase amount`) AS revenue
FROM customer_behavior
GROUP BY gender;
SELECT customer_id,
       `purchase amount`
FROM customer_behavior
WHERE discount_applied = 'yes'
  AND `purchase amount` >= (
        SELECT AVG(`purchase amount`)
        FROM customer_behavior
      );
      SELECT item_purchased,
       ROUND(AVG(review_rating), 2) AS `Average Product Rating`
FROM customer_behavior
GROUP BY item_purchased
ORDER BY AVG(review_rating) DESC
LIMIT 5;
SELECT 
    subscription_status,
    COUNT(customer_id) AS total_customers,
    ROUND(AVG(`purchase amount`), 2) AS avg_spend,
    ROUND(SUM(`purchase amount`), 2) AS total_revenue
FROM customer_behavior
GROUP BY subscription_status
ORDER BY 
    total_revenue DESC,
    avg_spend DESC
SELECT 
    customer_segment,
    COUNT(*) AS `Number of customers`
FROM (
    SELECT 
        customer_id,
        previous_purchases,
        CASE
            WHEN previous_purchases = 1 THEN 'New'
            WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
            ELSE 'Loyal'
        END AS customer_segment
    FROM customer_behavior
) AS customer_type
GROUP BY customer_segment;
SELECT 
    customer_segment,
    COUNT(*) AS `Number of customers`
FROM (
    SELECT 
        customer_id,
        previous_purchases,
        CASE
            WHEN previous_purchases = 1 THEN 'New'
            WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
            ELSE 'Loyal'
        END AS customer_segment
    FROM customer_behavior
) AS customer_type
GROUP BY customer_segment;
select subscription_status,
count(customer_id) AS repeat_buyers
from customer_behavior
where previous_purchases>5
group by subscription_status;
SELECT age_group,
SUM('purchase amount') AS  total_revenue
from customer_behavior
group by age_group
order by total_revenue DESc;

CREATE USER 'pbi_user'@'localhost'
IDENTIFIED WITH mysql_native_password
BY 'Pbi@123';

GRANT ALL PRIVILEGES ON customer_behavior.* TO 'pbi_user'@'localhost';
FLUSH PRIVILEGES;








	

