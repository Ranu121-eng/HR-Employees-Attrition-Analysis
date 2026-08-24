CREATE DATABASE HR_Analytics;
USE HR_Analytics;
SELECT * FROM hr_analytics_cleaned_dataset LIMIT 10;

-- Q.1. What is the overall employee attrition rate?
SELECT ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 / COUNT(*),2) AS Attrition_Rate
FROM hr_analytics_cleaned_dataset; 

-- Q.2. How many employees have left the organization?
SELECT COUNT(*) AS Employees_Left FROM hr_analytics_cleaned_dataset
WHERE Attrition = 'Yes';

-- Q.3. What percentage of employees are currently active?
SELECT ROUND( SUM(CASE WHEN Attrition = 'No' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS Active_Employee_Percentage
FROM hr_analytics_cleaned_dataset;

-- Q.4. Which department has the highest attrition?
SELECT Department, COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left, ROUND(
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 / COUNT(*),2) AS Attrition_Rate
FROM hr_analytics_cleaned_dataset GROUP BY Department
ORDER BY Attrition_Rate DESC
LIMIT 1;

-- Q.5. Which job roles have the highest attrition?
SELECT JobRole, COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left, ROUND(
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 / COUNT(*),2) AS Attrition_Rate
FROM hr_analytics_cleaned_dataset GROUP BY JobRole
ORDER BY Attrition_Rate DESC LIMIT 1;

-- Q.6. Does monthly income appear to be associated with attrition?
SELECT Attrition, COUNT(*) AS Employee_Count,
ROUND(AVG(MonthlyIncome), 2) AS Average_Monthly_Income
FROM hr_analytics_cleaned_dataset
GROUP BY Attrition;

-- Q.7. Does overtime affect attrition?
SELECT OverTime, COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left, ROUND(
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) AS Attrition_Rate
FROM hr_analytics_cleaned_dataset GROUP BY OverTime
ORDER BY Attrition_Rate DESC;

-- Q.8. Does job satisfaction relate to attrition?
SELECT JobSatisfaction, COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left, ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM hr_analytics_cleaned_dataset GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- Q.9. Does environment satisfaction relate to attrition?
SELECT EnvironmentSatisfaction, COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left, ROUND(
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM hr_analytics_cleaned_dataset GROUP BY EnvironmentSatisfaction
ORDER BY EnvironmentSatisfaction;

-- Q.10. Does work-life balance relate to attrition?
SELECT WorkLifeBalance, COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left, ROUND(
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM hr_analytics_cleaned_dataset GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

-- Q.11. Does attrition vary by years at company?
SELECT `Year Group`, COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left, ROUND(
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS Attrition_Rate
FROM hr_analytics_cleaned_dataset GROUP BY `Year Group`
ORDER BY Attrition_Rate DESC;

-- Q.12. Does age group show differences in attrition?
SELECT `Age Group`, COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left, ROUND(
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS Attrition_Rate
FROM hr_analytics_cleaned_dataset GROUP BY `Age Group`
ORDER BY Attrition_Rate DESC;

-- Q.13. Does marital status show differences in attrition?
SELECT MaritalStatus, COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left, ROUND(
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM hr_analytics_cleaned_dataset GROUP BY MaritalStatus
ORDER BY Attrition_Rate DESC;

-- Q.14. Does distance from home relate to attrition?
SELECT 
    CASE
        WHEN DistanceFromHome <= 5 THEN '0-5'
        WHEN DistanceFromHome <= 10 THEN '6-10'
        WHEN DistanceFromHome <= 20 THEN '11-20'
        ELSE '20+'
    END AS Distance_Group,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left, ROUND(
	SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Attrition_Rate
FROM hr_analytics_cleaned_dataset GROUP BY Distance_Group
ORDER BY Attrition_Rate DESC;