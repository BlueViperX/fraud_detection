SELECT
COUNT(*) AS total_transactions,
COUNT(i.TransactionID) AS identity_present,
COUNT(*) - COUNT(i.TransactionID) AS identity_missing,
ROUND(
        COUNT(i.TransactionID) * 100.0 / COUNT(*),
        2
) AS identity_coverage_pct,

ROUND(
(COUNT(*) - COUNT(i.TransactionID)) * 100.0 / COUNT(*),
2
) AS identity_missing_pct

FROM transactions t
LEFT JOIN identity i
ON t.TransactionID = i.TransactionID;






SELECT
    CASE
        WHEN i.TransactionID IS NULL
            THEN 'No identity'
        ELSE 'Has identity'
    END AS group_label,

    COUNT(*) AS total_transactions,

    SUM(t.isFraud) AS fraud_count,

    ROUND(AVG(t.isFraud) * 100, 2) AS fraud_rate_pct

FROM transactions t

LEFT JOIN identity i
ON t.TransactionID = i.TransactionID

GROUP BY group_label

ORDER BY fraud_rate_pct DESC;





SELECT
    i.DeviceType,

    COUNT(*) AS total_transactions,

    SUM(t.isFraud) AS fraud_count,

    ROUND(AVG(t.isFraud) * 100, 2) AS fraud_rate_pct

FROM transactions t

INNER JOIN identity i
ON t.TransactionID = i.TransactionID

WHERE i.DeviceType IS NOT NULL

GROUP BY i.DeviceType

ORDER BY fraud_rate_pct DESC;