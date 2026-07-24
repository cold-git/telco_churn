# Project Title
Telco Customer Churn Analysis

## Project Overview
This project explores a telecommunications customer churn dataset using SQL to uncover patterns in customer behavior, service adoption, customer value, revenue generation, and churn.

My objective is to generate data-driven insights, and visuals powered by PowerBI, that can help the company improve customer retention, strengthen revenue performance, and support strategic decision-making.

## Business Problem
Over time, customer churn has remained one of the most significant challenges facing telecommunications companies. Businesses are losing valuable customers, reducing recurring revenue, and increasing customer acquisition costs, all due to poor evaluation of customers’ satisfaction.

Acquiring new customers is even more expensive than retaining existing ones, making customer retention essential for sustaining long-term profitability.
It is therefore, important for businesses to tackle hurdles faced by their customers, so as to reduce customer attrition and satisfy consumers, but how is that even possible when the businesses don’t have a clear understanding of the factors that drive customer churn?

The telecommunications company represented in this dataset lacks clear visibility into the behaviors associated with customer churn. It is therefore necessary to identify the customer segments most likely to leave, determine how factors such as contract type, tenure, internet service, pricing, and value-added services influence churn, and assess the financial impact of customer attrition.

This analysis addresses these challenges by exploring customer behavior and revenue patterns using SQL-based exploratory data analysis. The insights generated provided evidence-based recommendations to support customer retention strategies, improve service offerings, and protect long-term revenue.

## Dataset Overview

The dataset used in this project is the IBM Telco Customer Churn dataset, which contains information on 7,032 customer records after data cleaning. It includes customer demographics, subscription details, billing information, service usage, contract characteristics, and churn status.

The primary objective of the dataset is to support the analysis of customer behavior and identify factors associated with customer churn. Each record represents an individual customer and includes attributes that describe their relationship with the company.

The dataset consists of the following categories of information:
•	Customer Information: Customer ID, tenure, and Senior Citizen status. 
•	Services Subscribed: Internet Service, Online Security, Online Backup, Device Protection, Tech Support, and Streaming TV. 
•	Account Information: Contract type, Payment Method, Monthly Charges, and Total Charges. 
•	Target Variable: Churn, indicating whether a customer remained with the company or discontinued its services. 

Before analysis, the dataset was cleaned to improve data quality.

## Data Cleaning Process

The cleaning process involved handling missing values, correcting inconsistent data entries, standardizing categorical values, and removing duplicate records. These preprocessing steps ensured the dataset was suitable for reliable exploratory data analysis.

## Tools Used

- SQL
- PowerBI

## Key Findings

1.	Customer churn remains a significant business challenge.
2.	Month-to-month customers are the most vulnerable to churn.
3.	Customer churn is concentrated during the early stages of the customer lifecycle.
4.	Fiber optic customers represent the company's most valuable users yet highest-risk customer segment, generating the highest total revenue while also recording the highest churn rate (41.89%).
5.	Higher monthly charges are associated with increased churn.
6.	Value-added services appear to support customer retention.
7.	Electronic check customers contribute the largest volume of customer churn.
8.	Customer retention directly influences long-term revenue.

## Final Recommendations

1.	Reduce churn among month-to-month customers by introducing incentives to migrate to one- and two-year contracts. 
2.	Prioritize retention of fiber optic customers through improvements in service quality and proactive customer support. 
3.	Promote value-added services (Online Security, Online Backup, Device Protection, Tech Support, and Streaming TV), as customers subscribing to these services consistently demonstrate lower churn.

### P.S
Please view the attached PDF document for the full report.

## Dashboard Preview

<img width="1465" height="726" alt="Screenshot 2026-07-24 225444" src="https://github.com/user-attachments/assets/69aeabf8-c484-426f-a8d3-36f804498a1e" />
<img width="1462" height="718" alt="Screenshot 2026-07-24 225536" src="https://github.com/user-attachments/assets/bedf1935-d9a2-4d7c-a627-69a5899ead68" />
<img width="1445" height="646" alt="Screenshot 2026-07-24 225621" src="https://github.com/user-attachments/assets/7813f668-15b1-44c0-a202-f44ec8ac15bc" />

### Note: 
This 3-pages visuals support drill-down for more detailed analysis when viewed in Power BI.
