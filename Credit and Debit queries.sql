USE practicedb2;

SELECT COUNT(*) 
FROM `copy of debit and credit banking_data_csv`;

SELECT SUM(Amount) AS total_credit_amount
FROM `copy of debit and credit banking_data_csv`
WHERE `Transaction Type` = 'Credit';

SELECT SUM(Amount) AS total_debit_amount
FROM `copy of debit and credit banking_data_csv`
WHERE `Transaction Type` = 'Debit';

SELECT 
    SUM(CASE WHEN `Transaction Type` = 'Credit' THEN Amount END) /
    SUM(CASE WHEN `Transaction Type` = 'Debit' THEN Amount END)
    AS credit_debit_ratio
FROM `copy of debit and credit banking_data_csv`;

SELECT 
    SUM(CASE WHEN `Transaction Type` = 'Credit' THEN Amount ELSE -Amount END)
    AS net_transaction_amount
FROM `copy of debit and credit banking_data_csv`;

SELECT 
    `Account Number`,
    COUNT(*) AS activity_ratio
FROM `copy of debit and credit banking_data_csv`
GROUP BY `Account Number`;

SELECT 
DATE(`Transaction Date`) AS day,
    COUNT(*) AS transactions_per_day
FROM `copy of debit and credit banking_data_csv`
GROUP BY day
ORDER BY day;

SELECT 
    YEARWEEK(`Transaction Date`) AS week,
    COUNT(*) AS transactions_per_week
FROM `copy of debit and credit banking_data_csv`
GROUP BY week
ORDER BY week;

SELECT 
    DATE_FORMAT(`Transaction Date`, '%Y-%m') AS month,
    COUNT(*) AS transactions_per_month
FROM `copy of debit and credit banking_data_csv`
GROUP BY month
ORDER BY month;

SELECT 
    Branch,
    SUM(Amount) AS total_transaction_amount
FROM `copy of debit and credit banking_data_csv`
GROUP BY Branch
ORDER BY total_transaction_amount DESC;














