SELECT * FROM PortfolioProject.diabetes_data;

-- Create a subset table with 5000 records from the original dataset
CREATE TABLE diabetes_data_subset AS
SELECT *
FROM diabetes_data
LIMIT 5000;

-- Verify the total number of records in the subset table
SELECT COUNT(*) AS Total_Records FROM diabetes_data_subset;

-- Check for missing values in critical columns
SELECT 
  SUM(CASE WHEN BMI IS NULL THEN 1 ELSE 0 END) AS Missing_BMI,
  SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Missing_Age,
  SUM(CASE WHEN Diabetes_012 IS NULL THEN 1 ELSE 0 END) AS Missing_Diabetes
FROM diabetes_data_subset;


-- Compute descriptive statistics for BMI, Age, and Income
SELECT 
  MIN(BMI) AS Min_BMI,
  MAX(BMI) AS Max_BMI,
  AVG(BMI) AS Avg_BMI,
  MIN(Age) AS Min_Age,
  MAX(Age) AS Max_Age,
  AVG(Age) AS Avg_Age,
  MIN(Income) AS Min_Income,
  MAX(Income) AS Max_Income,
  AVG(Income) AS Avg_Income
FROM diabetes_data_subset;


-- Distribution of Diabetes status
SELECT 
  Diabetes_012, 
  COUNT(*) AS Count
FROM diabetes_data_subset
GROUP BY Diabetes_012;

-- Distribution of Smoker status
SELECT 
  Smoker, 
  COUNT(*) AS Count
FROM diabetes_data_subset
GROUP BY Smoker;


-- Distribution of Diabetes status
SELECT 
  Diabetes_012, 
  COUNT(*) AS Count
FROM diabetes_data_subset
GROUP BY Diabetes_012;

-- Distribution of Smoker status
SELECT 
  Smoker, 
  COUNT(*) AS Count
FROM diabetes_data_subset
GROUP BY Smoker;

-- Distribution of Physical Activity
SELECT 
  PhysActivity, 
  COUNT(*) AS Count
FROM diabetes_data_subset
GROUP BY PhysActivity;

-- Average BMI by Diabetes status
SELECT 
  AVG(BMI) AS Avg_BMI, 
  Diabetes_012
FROM diabetes_data_subset
GROUP BY Diabetes_012;

-- Average Age by Diabetes status, excluding NULL ages
SELECT 
  AVG(Age) AS Avg_Age, 
  Diabetes_012
FROM diabetes_data_subset
WHERE Age IS NOT NULL
GROUP BY Diabetes_012;

-- Review a sample of the data
SELECT * 
FROM diabetes_data_subset
LIMIT 10;

