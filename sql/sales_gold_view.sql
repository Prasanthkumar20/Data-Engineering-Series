CREATE VIEW sales_gold AS
SELECT
    purchase_date,
    city,
    SUM(CAST(purchase_amount AS DECIMAL(18,2))) AS revenue,
    COUNT(*) AS total_orders,
    SUM(
        CASE
            WHEN CAST(is_black_friday AS INT) = 1
            THEN CAST(purchase_amount AS DECIMAL(18,2))
            ELSE 0
        END
    ) AS black_friday_revenue
FROM sales_silver
GROUP BY
    purchase_date,
    city;
