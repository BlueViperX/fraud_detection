-- Calculate the toatl number of 

SELECT 
    COUNT(*) AS total_transactions,
    SUM(isFraud) AS tota_fraud,
    COUNT(*) - SUM(isFraud) AS total_legit,
    ROUND(AVG(isFraud) * 100, 2) AS fraud_pct
FROM 
    transactions;



SELECT 
    COUNT(*) AS n,
    ROUND(MIN(TransactionAmt),2) AS min_amt,
    ROUND(MAX(TransactionAmt),2) AS max_amt,
    ROUND(AVG(TransactionAmt),2) AS mean_amt,
    ROUND(STDDEV(TransactionAmt),2) AS std_dev 
FROM 
    transactions;



    --- Comparing the amoung of Fraud vs Legit transactions;

    SELECT 
    CASE 
        WHEN isFraud = 1 THEN 'Fraudulent'
        WHEN isFraud = 0 THEN 'Legitimate'
        ELSE 'Unknown' 
    END AS transaction_status,
    COUNT(*) AS n,
    ROUND(MIN(TransactionAmt), 2) AS min_amt,
    ROUND(MAX(TransactionAmt), 2) AS max_amt,
    ROUND(AVG(TransactionAmt), 2) AS mean_amt,
    ROUND(STDDEV(TransactionAmt), 2) AS std_dev
FROM 
    transactions
GROUP BY 
    isFraud;
