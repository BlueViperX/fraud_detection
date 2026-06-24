# CATEGORICAL PATTERN 
# Finding out which card has more fraud detection

SELECT card4, COUNT(*) AS total_transactions, SUM(isFraud) AS fraud_count, ROUND(AVG(isFraud) * 100, 2) AS fraud_rate_pct FROM transactions
WHERE card4 IS NOT NULL
GROUP BY card4
ORDER BY fraud_rate_pct DESC;


SELECT card6, COUNT(*) AS total_transactions, SUM(isFraud) AS fraud_count, ROUND(AVG(isFraud) * 100, 2) AS fraud_rate_pct FROM transactions
WHERE card6 IS NOT NULL
GROUP BY card6
ORDER BY fraud_rate_pct DESC;


SELECT ProductCD, COUNT(*) AS total_transactions, SUM(isFraud) AS fraud_count, ROUND(AVG(isFraud) * 100, 2) AS fraud_rate_pct
FROM transactions
WHERE ProductCD IS NOT NULL
GROUP BY ProductCD
ORDER BY fraud_rate_pct DESC;