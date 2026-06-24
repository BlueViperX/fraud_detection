SELECT
    HOUR(TransactionDT) AS hour,
    COUNT(*) AS total_transactions,
    SUM(isFraud) AS fraud_count,
    ROUND(AVG(isFraud) * 100, 2) AS fraud_rate_pct
FROM transactions
GROUP BY hour
ORDER BY hour;


SELECT
    FLOOR(TransactionDT / 3600) % 24 AS hour,
    COUNT(*) AS total_transactions,
    SUM(isFraud) AS fraud_count,
    ROUND(AVG(isFraud) * 100, 2) AS fraud_rate_pct
FROM transactions
GROUP BY FLOOR(TransactionDT / 3600) % 24
ORDER BY hour;


# Fraud rate by clock

SELECT
    CASE
        WHEN hour = 0 THEN '12:00 AM'
        WHEN hour < 12 THEN CONCAT(hour, ':00 AM')
        WHEN hour = 12 THEN '12:00 PM'
        ELSE CONCAT(hour - 12, ':00 PM')
    END AS clock_time,

    COUNT(*) AS total_transactions,
    SUM(isFraud) AS fraud_count,
    ROUND(AVG(isFraud) * 100, 2) AS fraud_rate_pct

FROM (
    SELECT
        FLOOR(TransactionDT / 3600) % 24 AS hour,
        isFraud
    FROM transactions
) t

GROUP BY hour
ORDER BY hour;





 # FRAUD RATE BY DAY

SELECT
    day_num,
    COUNT(*) AS total_transactions,
    SUM(isFraud) AS fraud_count,
    ROUND(AVG(isFraud) * 100, 2) AS fraud_rate_pct

FROM (
    SELECT
        FLOOR(TransactionDT / 86400) AS day_num,
        isFraud
    FROM transactions
) t

GROUP BY day_num
ORDER BY day_num;



#If your smallest TransactionDT value is already greater than 86400, then Day 1 never appears

SELECT
MIN(TransactionDT) AS min_time,
MAX(TransactionDT) AS max_time
FROM transactions;


# That means your dataset starts at the beginning of Day 2, not Day 1. 
# To force the first available day to show as Day 1, shift the values using the minimum

SELECT
    FLOOR((TransactionDT - (SELECT MIN(TransactionDT) FROM transactions)) / 86400) + 1 AS day_num,
    COUNT(*) AS total_transactions,
    SUM(isFraud) AS fraud_count,
    ROUND(AVG(isFraud) * 100, 2) AS fraud_rate_pct

FROM transactions

GROUP BY day_num
ORDER BY day_num;





# FRAUD RATE BY WEEK

SELECT
    week_num,
    COUNT(*) AS total_transactions,
    SUM(isFraud) AS fraud_count,
    ROUND(AVG(isFraud) * 100, 2) AS fraud_rate_pct

FROM (
    SELECT
        FLOOR(
            (TransactionDT - (SELECT MIN(TransactionDT) FROM transactions))
            / (86400 * 7)
        ) + 1 AS week_num,
        isFraud
    FROM transactions
) t

GROUP BY week_num
ORDER BY week_num;



# FRAUD RATE BY MONTH 

SELECT
    month_num,
    COUNT(*) AS total_transactions,
    SUM(isFraud) AS fraud_count,
    ROUND(AVG(isFraud) * 100, 2) AS fraud_rate_pct

FROM (
    SELECT
        FLOOR(
            (TransactionDT - (SELECT MIN(TransactionDT) FROM transactions))
            / (86400 * 30)
        ) + 1 AS month_num,
        isFraud
    FROM transactions
) t

GROUP BY month_num
ORDER BY month_num;