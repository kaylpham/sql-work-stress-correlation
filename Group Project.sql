SELECT COUNT(*) AS total_count
FROM new_project_data;


SELECT gender, COUNT(Employee_ID)
FROM new_project_data
GROUP BY gender;


SELECT
    CASE
        WHEN age BETWEEN 20 AND 25 THEN '20-25'
        WHEN age BETWEEN 26 AND 30 THEN '26-30'
        WHEN age BETWEEN 31 AND 35 THEN '31-35'
        WHEN age BETWEEN 36 AND 40 THEN '36-40'
        WHEN age BETWEEN 41 AND 45 THEN '41-45'
        WHEN age BETWEEN 46 AND 50 THEN '46-50'
        WHEN age BETWEEN 51 AND 55 THEN '51-55'
        WHEN age > 55 THEN 'over 55'
        ELSE 'other'
    END AS age_group,
    COUNT(employee_id) AS number_of_people
FROM new_project_data
GROUP BY age_group
ORDER BY age_group ASC;


SELECT DISTINCT Industry, COUNT(Employee_ID)
FROM new_project_data
GROUP BY Industry;


SELECT DISTINCT region, COUNT(Employee_ID)
FROM new_project_data
GROUP BY region
ORDER BY region ASC;


SELECT DISTINCT Work_Location, COUNT(Employee_ID)
FROM new_project_data
GROUP BY Work_Location
ORDER BY Work_Location ASC;


SELECT
    Job_role,
    gender,
    COUNT(*) AS respondent_count,
    AVG(years_of_experience) AS avg_experience,
    MIN(years_of_experience) AS min_experience,
    MAX(years_of_experience) AS max_experience
FROM new_project_data
WHERE gender IN ('female', 'male', 'non-binary')
    AND industry IN ('it', 'consulting', 'finance')
GROUP BY job_role, gender
ORDER BY job_role, gender;


WITH AVEG AS (
    SELECT COUNT(employee_ID) AS AverageSleep
    FROM new_project_data
    WHERE work_location = 'remote'
        AND sleep_quality = 'average'
),
POOR AS (
    SELECT COUNT(employee_ID) AS PoorSleep
    FROM new_project_data
    WHERE work_location = 'remote'
        AND sleep_quality = 'poor'
),
GOOD AS (
    SELECT COUNT(employee_ID) AS GoodSleep
    FROM new_project_data
    WHERE work_location = 'remote'
        AND sleep_quality = 'good'
)
SELECT GoodSleep, AverageSleep, PoorSleep
FROM GOOD, AVEG, POOR;


WITH AVEG AS (
    SELECT COUNT(employee_ID) AS AverageSleep
    FROM new_project_data
    WHERE work_location = 'hybrid'
        AND sleep_quality = 'average'
),
POOR AS (
    SELECT COUNT(employee_ID) AS PoorSleep
    FROM new_project_data
    WHERE work_location = 'hybrid'
        AND sleep_quality = 'poor'
),
GOOD AS (
    SELECT COUNT(employee_ID) AS GoodSleep
    FROM new_project_data
    WHERE work_location = 'hybrid'
        AND sleep_quality = 'good'
)
SELECT GoodSleep, AverageSleep, PoorSleep
FROM GOOD, AVEG, POOR;


WITH AVEG AS (
    SELECT COUNT(employee_ID) AS AverageSleep
    FROM new_project_data
    WHERE work_location = 'onsite'
        AND sleep_quality = 'average'
),
POOR AS (
    SELECT COUNT(employee_ID) AS PoorSleep
    FROM new_project_data
    WHERE work_location = 'onsite'
        AND sleep_quality = 'poor'
),
GOOD AS (
    SELECT COUNT(employee_ID) AS GoodSleep
    FROM new_project_data
    WHERE work_location = 'onsite'
        AND sleep_quality = 'good'
)
SELECT GoodSleep, AverageSleep, PoorSleep
FROM GOOD, AVEG, POOR;


SELECT
    CASE
        WHEN hours_worked_per_week < 25 THEN '20-25'
        WHEN hours_worked_per_week < 30 THEN '25-30'
        WHEN hours_worked_per_week < 35 THEN '30-35'
        WHEN hours_worked_per_week < 40 THEN '35-40'
        WHEN hours_worked_per_week < 45 THEN '40-45'
        WHEN hours_worked_per_week < 50 THEN '45-50'
        WHEN hours_worked_per_week < 55 THEN '50-55'
        WHEN hours_worked_per_week <= 60 THEN '55-60'
        ELSE '60+'
    END AS work_hours_group,
    stress_level,
    COUNT(employee_id) AS number_of_people
FROM new_project_data
GROUP BY work_hours_group, stress_level
ORDER BY work_hours_group;


WITH stress_score AS (
    SELECT
        industry,
        CASE
            WHEN stress_level = 'high' THEN 3
            WHEN stress_level = 'medium' THEN 2
            WHEN stress_level = 'low' THEN 1
        END AS stress_score
    FROM new_project_data
)
SELECT
    industry,
    ROUND(AVG(stress_score), 2) AS avg_stress_score,
    COUNT(*)
FROM stress_score
WHERE industry IN ('finance', 'it', 'consulting')
GROUP BY industry
ORDER BY avg_stress_score DESC;


WITH s1 AS (
    SELECT COUNT(Employee_ID) AS remote_satisfied
    FROM new_project_data
    WHERE Work_Location = 'remote'
        AND Satisfaction_with_Remote_Work = 'satisfied'
),
s2 AS (
    SELECT COUNT(Employee_ID) AS remote_unsatisfied
    FROM new_project_data
    WHERE Work_Location = 'remote'
        AND Satisfaction_with_Remote_Work = 'unsatisfied'
),
s3 AS (
    SELECT COUNT(Employee_ID) AS remote_neutral
    FROM new_project_data
    WHERE Work_Location = 'remote'
        AND Satisfaction_with_Remote_Work = 'neutral'
)
SELECT remote_satisfied, remote_unsatisfied, remote_neutral
FROM s1, s2, s3;


SELECT
    industry,
    COUNT(CASE
        WHEN Work_Location = 'remote'
            AND Satisfaction_with_Remote_Work = 'satisfied'
        THEN 1
    END) AS remote_satisfied,
    COUNT(CASE
        WHEN Work_Location = 'remote'
            AND Satisfaction_with_Remote_Work = 'unsatisfied'
        THEN 1
    END) AS remote_unsatisfied,
    COUNT(CASE
        WHEN Work_Location = 'remote'
            AND Satisfaction_with_Remote_Work = 'neutral'
        THEN 1
    END) AS remote_neutral
FROM new_project_data
WHERE Industry IN ('consulting', 'IT', 'finance')
GROUP BY Industry;


WITH s1 AS (
    SELECT COUNT(Employee_ID) AS remote_increase_prod
    FROM new_project_data
    WHERE Work_Location = 'remote'
        AND Productivity_Change = 'increase'
),
s2 AS (
    SELECT COUNT(Employee_ID) AS remote_decrease_prod
    FROM new_project_data
    WHERE Work_Location = 'remote'
        AND Productivity_Change = 'decrease'
),
s3 AS (
    SELECT COUNT(Employee_ID) AS remote_nochange_prod
    FROM new_project_data
    WHERE Work_Location = 'remote'
        AND Productivity_Change = 'no change'
)
SELECT
    remote_increase_prod,
    remote_decrease_prod,
    remote_nochange_prod
FROM s1, s2, s3;


SELECT
    industry,
    COUNT(CASE
        WHEN Work_Location = 'remote'
            AND Productivity_Change = 'increase'
        THEN 1
    END) AS remote_increase_prod,
    COUNT(CASE
        WHEN Work_Location = 'remote'
            AND Productivity_Change = 'decrease'
        THEN 1
    END) AS remote_decrease_prod,
    COUNT(CASE
        WHEN Work_Location = 'remote'
            AND Productivity_Change = 'no change'
        THEN 1
    END) AS remote_nochange_prod
FROM new_project_data
WHERE Industry IN ('consulting', 'it', 'finance')
GROUP BY Industry;


SELECT
    CASE
        WHEN Number_of_Virtual_Meetings >= 0
            AND Number_of_Virtual_Meetings < 4 THEN '0-4'
        WHEN Number_of_Virtual_Meetings >= 4
            AND Number_of_Virtual_Meetings < 8 THEN '4-8'
        WHEN Number_of_Virtual_Meetings >= 8
            AND Number_of_Virtual_Meetings < 12 THEN '8-12'
        WHEN Number_of_Virtual_Meetings >= 12
            AND Number_of_Virtual_Meetings < 16 THEN '12-16'
    END AS Meeting_Range,
    Stress_Level,
    COUNT(*) AS Employee_Count
FROM new_project_data
WHERE Stress_Level IS NOT NULL
GROUP BY Meeting_Range, Stress_Level
ORDER BY Meeting_Range, Stress_Level;


SELECT
    work_location,
    work_life_balance_rating,
    COUNT(*) AS employee_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY work_location),
        1
    ) AS percent_within_location
FROM new_project_data
WHERE work_location IS NOT NULL
    AND industry IN ('finance', 'it', 'consulting')
GROUP BY work_location, work_life_balance_rating
ORDER BY work_location, work_life_balance_rating;