-- =====================================================
-- Query: top_five_products_each_category
-- Description: Finds the top 5 products from each category
-- based on highest total sales. The output is sorted by
-- category ascending and sales descending within each category.
-- =====================================================


WITH top_sales_per_category AS
(
    SELECT
        p.category AS category,
        p.product_name AS product_name,
        ROUND(CAST(SUM(o.sales) AS numeric), 2) AS product_total_sales,
        ROUND(CAST(SUM(o.profit) AS numeric), 2) AS product_total_profit
    FROM orders AS o
    JOIN products AS p
        ON o.product_id = p.product_id
    GROUP BY p.category, p.product_name
),
rankings AS 
(
    SELECT
        category,
        product_name,
        product_total_sales,
        product_total_profit,
        ROW_NUMBER() OVER(PARTITION BY category ORDER BY product_total_sales DESC) AS product_rank
    FROM top_sales_per_category
)
SELECT *
FROM rankings
WHERE product_rank <= 5
ORDER BY category ASC, product_total_sales DESC;


-- =====================================================
-- Query: impute_missing_values
-- Description: Calculates missing quantity values for orders
-- by estimating unit price for each product considering
-- discount, market, and region. The output includes
-- calculated_quantity rounded to zero decimals.
-- =====================================================


WITH unit_price AS
(
    SELECT
        product_id,
        discount,
        market,
        region,
        AVG(sales / quantity) AS avg_unit_price
    FROM orders
    WHERE quantity IS NOT NULL
    GROUP BY product_id, discount, market, region
)
SELECT
    o.product_id,
    o.discount,
    o.market,
    o.region,
    o.sales,
    o.quantity,
    CASE
        WHEN o.quantity IS NULL THEN ROUND(o.sales / u.avg_unit_price)
    END AS calculated_quantity
FROM orders AS o
LEFT JOIN unit_price AS u 
    ON u.product_id = o.product_id
    AND u.discount = o.discount
    AND u.market = o.market
    AND u.region = o.region
WHERE o.quantity IS NULL;
