SELECT P_emaildomain, COUNT(*) AS total_transactions, SUM(isFraud) AS fraud_count, ROUND(AVG(isFraud) * 100, 2) AS fraud_rate_pct FROM transactions
WHERE P_emaildomain IS NOT NULL
GROUP BY P_emaildomain
HAVING COUNT(*) >= 1000
ORDER BY fraud_rate_pct DESC;


SELECT R_emaildomain,
COUNT(*) AS total_transactions,
SUM(isFraud) AS fraud_count,
ROUND(AVG(isFraud) * 100, 2) AS fraud_rate_pct
FROM transactions
WHERE R_emaildomain IS NOT NULL
GROUP BY R_emaildomain
HAVING COUNT(*) >= 1000
ORDER BY fraud_rate_pct DESC;


SELECT
    CASE
        WHEN R_emaildomain IS NULL THEN 'No receiver'
        ELSE 'Has receiver'
    END AS receiver_status,

    COUNT(*) AS total_transactions,
    SUM(isFraud) AS fraud_count,
    ROUND(AVG(isFraud) * 100, 2) AS fraud_rate_pct

FROM transactions
GROUP BY receiver_status
ORDER BY fraud_rate_pct DESC;