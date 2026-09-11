-- H1: Trust & Reliability

-- Question 1: Do churned users experience longer delivery times?

-- SELECT
--     u.churned,
--     ROUND(AVG(o.delivery_time), 2) AS avg_delivery_time
-- FROM users u
-- JOIN orders o
--     ON u.user_id = o.user_id
-- GROUP BY u.churned;

-- Question 2: Do users with slower deliveries place fewer orders?
-- SELECT
--     CASE
--         WHEN delivery_time <= 20 THEN 'Fast'
--         ELSE 'Slow'
--     END AS delivery_segment,
--     ROUND(AVG(order_count), 2) AS avg_orders
-- FROM (
--     SELECT
--         o.user_id,
--         COUNT(o.order_id) AS order_count,
--         AVG(o.delivery_time) AS delivery_time
--     FROM orders o
--     GROUP BY o.user_id
-- ) t
-- GROUP BY delivery_segment;