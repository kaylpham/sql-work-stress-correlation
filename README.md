# IS 545 Group Project: Remote Work Data Analysis

## Overview

This project analyzes employee workplace data to explore patterns related to **remote, hybrid, and onsite work**. Using SQL, we examined employee demographics, work arrangements, experience, stress, sleep quality, job satisfaction, productivity, virtual meetings, and work-life balance.

The goal of the analysis was to organize the dataset into meaningful categories and identify patterns across different workplace environments and industries.

## Data Cleaning

Before conducting the analysis, the dataset was cleaned in Excel because the original data was provided in CSV format.

The cleaning process included:

* Removing participants whose years of experience exceeded their age
* Removing responses containing NULL values

## Dataset

The analysis uses a table named:

```sql
new_project_data
```

Key variables analyzed throughout the project include:

* `Employee_ID`
* `Gender`
* `Age`
* `Industry`
* `Region`
* `Work_Location`
* `Job_Role`
* `Years_of_Experience`
* `Sleep_Quality`
* `Hours_Worked_Per_Week`
* `Stress_Level`
* `Satisfaction_with_Remote_Work`
* `Productivity_Change`
* `Number_of_Virtual_Meetings`
* `Work_Life_Balance_Rating`

## Analysis

### 1. Employee Count

Determined the total number of employees represented in the dataset.

### 2. Gender Classification

Examined the number of employees by gender.

### 3. Age Classification

Grouped employees into five-year age ranges to make demographic patterns easier to analyze.

### 4. Industry Analysis

Identified the industries represented in the dataset and counted employees within each industry.

### 5. Geographic Distribution

Examined the number of employees by region.

### 6. Work Location

Compared the number of employees working:

* Remotely
* Hybrid
* Onsite

### 7. Experience by Gender and Job Role

Analyzed years of experience across job roles and genders, including:

* Number of respondents
* Average experience
* Minimum experience
* Maximum experience

The analysis focused on employees in the **IT, consulting, and finance** industries.

### 8. Sleep Quality by Work Location

Compared sleep quality among remote, hybrid, and onsite employees.

Sleep quality was categorized as:

* Good
* Average
* Poor

### 9. Hours Worked and Stress

Grouped weekly working hours into ranges and compared them with reported stress levels.

### 10. Additional Sleep Analysis

Additional sleep-related data was organized in Excel by work location and according to the project's presentation requirements.

### 11. Average Stress Score by Industry

Converted qualitative stress levels into numerical scores:

| Stress Level | Score |
| ------------ | ----: |
| Low          |     1 |
| Medium       |     2 |
| High         |     3 |

The average stress score was then calculated for employees in the finance, IT, and consulting industries.

### 12. Remote Work Satisfaction

Examined satisfaction among remote workers using three categories:

* Satisfied
* Unsatisfied
* Neutral

### 13. Remote Work Satisfaction by Industry

Compared remote-work satisfaction across:

* IT
* Consulting
* Finance

This allowed satisfaction patterns to be examined within individual industries.

### 14. Remote Work Productivity

Analyzed how remote employees reported changes in productivity:

* Increased
* Decreased
* No change

### 15. Remote Work Productivity by Industry

Compared reported productivity changes among remote workers across IT, consulting, and finance.

### 16. Virtual Meetings and Stress

Grouped the number of virtual meetings per week into ranges and examined the relationship between meeting frequency and stress level.

The meeting ranges were:

* 0–4
* 4–8
* 8–12
* 12–16

The resulting data was used to create a heatmap for presentation.

### 17. Work Location and Work-Life Balance

Examined work-life balance ratings within each work location and calculated the percentage distribution of ratings within each location.

The analysis was limited to employees in the finance, IT, and consulting industries.

## SQL Techniques Used

This project demonstrates several SQL concepts, including:

* `SELECT`
* `COUNT()`
* `DISTINCT`
* `CASE`
* `WHEN`
* `GROUP BY`
* `ORDER BY`
* `WHERE`
* `IN`
* `BETWEEN`
* `AVG()`
* `MIN()`
* `MAX()`
* `ROUND()`
* Common Table Expressions (`WITH`)
* Conditional aggregation
* Window functions
* Percentage calculations

## Project Structure

```text
IS-545-SQL-Project/
│
├── README.md
├── SQL/
│   └── analysis.sql
│
└── Data/
    └── new_project_data.csv
```

## Key Questions

The analysis was designed around several questions about workplace environments, including:

1. Who is represented in the dataset?
2. How are employees distributed across industries and locations?
3. How does work location relate to sleep quality?
4. How do working hours relate to stress?
5. How does stress vary across industries?
6. How satisfied are employees with remote work?
7. How does remote-work satisfaction differ by industry?
8. How does productivity change among remote workers?
9. How does productivity differ across industries?
10. Is there a relationship between virtual meeting frequency and stress?
11. How does work location relate to work-life balance?

## Tools

* **SQL** for data analysis and querying
* **Excel** for initial data cleaning and additional organization
* **Canva** for visualizing the virtual meeting and stress analysis

## Course

**IS 545 — Group Project**

This project demonstrates the use of SQL to transform employee workplace data into structured analyses that can be used to explore patterns in remote, hybrid, and onsite work.
