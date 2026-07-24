/*
===========================================
TELCO CUSTOMER CHURN ANALYSIS
Author: Abdulsamad I.
IDE: MySQL, SQL
===========================================
*/

/* ===============================
  PHASE 1: DATA CLEANING
================================== 
*/

SELECT * FROM churn;

# Checking for duplicates

SELECT customerID, COUNT(*) AS occurrences
FROM churn
GROUP BY customerID
HAVING COUNT(*) > 1;

SELECT * FROM churn
WHERE customerID = '3638-WEABW';

DESCRIBE churn;

# Temporarily adding an ID column to make each row distinguishable

ALTER TABLE churn
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY;

# verifying

SELECT * FROM churn
LIMIT 10;

# deleting the duplicates

DELETE c1
FROM churn c1
JOIN churn c2
ON c1.customerID = c2.customerID
WHERE c1.id > c2.id;

# verifying

SELECT customerID, COUNT(*)
FROM churn
GROUP BY customerID
HAVING COUNT(*) > 1;

-- Data Standardization

SELECT gender, TRIM(gender)
FROM churn;

UPDATE churn
SET gender = TRIM(gender);

# Renaming incorrect column names.

ALTER TABLE churn
RENAME COLUMN OnlineSercurity TO OnlineSecurity;

SELECT * FROM churn;

ALTER TABLE churn
RENAME COLUMN gender TO Gender;

ALTER TABLE churn
RENAME COLUMN tenure TO Tenure;

#Standardizing the data in the Gender column

SELECT DISTINCT Gender
FROM churn;

UPDATE churn
SET Gender = 'Male'
WHERE Gender = 'MALE';

UPDATE churn
SET Gender = 'Female'
WHERE Gender = 'FEMALE';

SELECT DISTINCT Gender
FROM churn;

# deleting the temporarily created ID column.

ALTER TABLE churn
DROP COLUMN id;

SELECT * FROM churn;


/* ==================================
   PHASE 2: EXPLORATORY DATA ANALYSIS
=====================================
*/


-- =========================
-- DATASET OVERVIEW
-- =========================

/* 1. Total number of customers */

SELECT COUNT(*) AS Total_customers
FROM churn;
								-- Dataset contains 7,032 customer records.



-- =========================
-- CUSTOMER PROFILE
-- =========================

/* 2. Customer adoption across Contract types*/

SELECT Contract, COUNT(*) AS Total_Customers
FROM churn
GROUP BY Contract
ORDER BY Total_Customers DESC;
								-- Month-to-month contracts represent the largest share of the customer base.

/* 3. Customer adoption across Internet Services */

SELECT InternetService, COUNT(*) AS Customers
FROM churn
GROUP BY InternetService;


/* 4. Customer adoption across Payment Methods*/

SELECT PaymentMethod, COUNT(*) AS Customers
FROM churn
GROUP BY PaymentMethod
ORDER BY Customers DESC;

/* 5. Customers by Tenure group*/

SELECT
CASE
WHEN tenure <=12 THEN '0-12 Months'
WHEN tenure <=24 THEN '13-24 Months'
WHEN tenure <=48 THEN '25-48 Months'
ELSE '49+ Months'
END AS Tenure_Group,
COUNT(*) AS Customers
FROM churn
GROUP BY Tenure_Group;



-- =========================
-- CUSTOMER VALUE
-- =========================

/* 6. Average Monthly Charges (Average Monthly Revenue by customer) */

SELECT ROUND(AVG(MonthlyCharges),2) AS 
Avg_Monthly_Charge
FROM churn;

/* 7. Average Monthly Charges by Contract */

SELECT Contract,
	ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charge
FROM churn
GROUP BY Contract;

/* 8. Average Monthly Charges by Internet Service */

SELECT InternetService,
    ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charge
FROM churn
GROUP BY InternetService;

/* 9. Average Monthly Charges by Churn*/

SELECT Churn, ROUND(AVG(MonthlyCharges),2) AS Avg_Monthly_Charge
FROM churn
GROUP BY Churn;

/* 10. Churn Rate by Monthly Charge Segment */					-- Which pricing segment has the highest churn rate?

SELECT
    CASE
        WHEN MonthlyCharges < 35 THEN 'Low ($0 - $34.99)'
        WHEN MonthlyCharges < 70 THEN 'Medium ($35 - $69.99)'
        ELSE 'High ($70+)'
    END AS Charge_Group,

    COUNT(*) AS Customers,

    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)
        *100.0 / COUNT(*),
        2
    ) AS Churn_Rate

FROM churn
GROUP BY Charge_Group
ORDER BY Churn_Rate DESC;

/* 11. Average Total Charges by Contract */

SELECT Contract,
    ROUND(AVG(TotalCharges),2) AS Avg_Total_Charges
FROM churn
GROUP BY Contract;

/* 12. Top 10 Customers by Total Revenue */

SELECT customerID, MonthlyCharges, TotalCharges
FROM churn
ORDER BY TotalCharges DESC
LIMIT 10;
            
            
            
-- =========================
-- CHURN ANALYSIS
-- =========================

/* 13. Overall Churn rate */

SELECT Churn, COUNT(*) AS Customers,
ROUND(COUNT(*)*100/(SELECT COUNT(*) FROM churn),2) AS Percentage
FROM churn
GROUP BY Churn;
			-- Approximately 27% of customers have churned, indicating a notable customer attrition rate.
            
            
/* 14. Average Tenure by Churn*/

SELECT Churn, ROUND(AVG(tenure),2) AS Avg_Tenure
FROM churn
GROUP BY Churn;


/* 15. Churn Rate by Contract (Percentage) */		-- Which contract has the highest likelihood of churn?

SELECT Contract,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM churn
GROUP BY Contract; 								-- Month-to-month customers are nearly four times more likely to churn.


/* 16. Churn Rate by Internet Service (Percentage) */

SELECT InternetService,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Churn_Rate
FROM churn
GROUP BY InternetService;

/* 17. Churn Rate by Tenure Group */

SELECT
CASE
WHEN tenure <=12 THEN '0-12 Months'
WHEN tenure <=24 THEN '13-24 Months'
WHEN tenure <=48 THEN '25-48 Months'
ELSE '49+ Months'
END AS Tenure_Group,
ROUND(
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0
/
COUNT(*),
2
) AS Churn_Rate
FROM churn
GROUP BY Tenure_Group;

/* 18. Churn by Contract type (Count)*/

SELECT Contract, Churn, COUNT(*) AS Customers
FROM churn
GROUP BY Contract, Churn
ORDER BY Contract;


/* 19. Churn by Internet Service*/

SELECT InternetService, Churn, COUNT(*) AS Customers
FROM churn
GROUP BY InternetService, Churn;


/* 20. Churn by Payment Method*/

SELECT PaymentMethod, Churn, COUNT(*) AS Customers
FROM churn
GROUP BY PaymentMethod, Churn;


/* 21. Churn by OnlineSecurity*/

SELECT OnlineSecurity, Churn, COUNT(*) AS Customers
FROM churn
GROUP BY OnlineSecurity, Churn;


/* 22. Churn by OnlineBackup*/

SELECT OnlineBackup, Churn, COUNT(*) AS Customers
FROM churn
GROUP BY OnlineBackup, Churn
ORDER BY OnlineBackup;


/* 23. Churn by Device Protection */

SELECT DeviceProtection, Churn, COUNT(*) AS Customers
FROM churn
GROUP BY DeviceProtection, Churn
ORDER BY DeviceProtection;


/* 24. Churn by Tech Support */

SELECT TechSupport, Churn, COUNT(*) AS Customers
FROM churn
GROUP BY TechSupport, Churn
ORDER BY TechSupport;


/* 25. Churn by Streaming TV */

SELECT StreamingTV, Churn, COUNT(*) AS Customers
FROM churn
GROUP BY StreamingTV, Churn
ORDER BY StreamingTV;


-- =========================
-- REVENUE ANALYSIS
-- =========================

/* 26. Total Revenue by Internet Service */

SELECT InternetService,
    ROUND(SUM(TotalCharges),2) AS Revenue
FROM churn
GROUP BY InternetService
ORDER BY Revenue DESC;


/* 27. Total Revenue by Churn Status */

SELECT Churn,
    ROUND(SUM(TotalCharges),2) AS Revenue
FROM churn
GROUP BY Churn;


/* 28. Revenue Lost to Churn */

SELECT
ROUND(SUM(TotalCharges),2) AS Revenue_Lost
FROM churn
WHERE Churn = 'Yes';

/* 29. Revenue Share by Churn Status (%)*/

SELECT Churn, 
ROUND(
		SUM(TotalCharges) * 100.0 /
        (SELECT SUM(TotalCharges) FROM churn),
        2
    ) AS Revenue_Percentage
FROM churn
GROUP BY Churn;
