SELECT
    ProductCD,
    card6,

    COUNT(*) AS total_transactions,

    SUM(isFraud) AS fraud_count,

    ROUND(AVG(isFraud) * 100, 2) AS fraud_rate_pct

FROM transactions

WHERE ProductCD IS NOT NULL
AND card6 IS NOT NULL

GROUP BY ProductCD, card6

HAVING COUNT(*) >= 1000

ORDER BY fraud_rate_pct DESC

LIMIT 10;