USE OlympicsAnalysis;
GO

-- 1. Total medals by Olympic year
SELECT
    Year,
    COUNT(*) AS Total_Medals
FROM dbo.Olympics
GROUP BY Year
ORDER BY Year;


-- 2. Medal change compared with the previous Olympics
WITH YearlyMedals AS
(
    SELECT
        Year,
        COUNT(*) AS Total_Medals
    FROM dbo.Olympics
    GROUP BY Year
),
MedalTrend AS
(
    SELECT
        Year,
        Total_Medals,
        LAG(Total_Medals) OVER (
            ORDER BY Year
        ) AS Previous_Medals
    FROM YearlyMedals
)
SELECT
    Year,
    Total_Medals,
    Previous_Medals,
    Total_Medals - Previous_Medals AS Medal_Change
FROM MedalTrend
ORDER BY Year;


-- 3. Year-over-year medal change percentage
WITH YearlyMedals AS
(
    SELECT
        Year,
        COUNT(*) AS Total_Medals
    FROM dbo.Olympics
    GROUP BY Year
),
MedalTrend AS
(
    SELECT
        Year,
        Total_Medals,
        LAG(Total_Medals) OVER (
            ORDER BY Year
        ) AS Previous_Medals
    FROM YearlyMedals
)
SELECT
    Year,
    Total_Medals,
    Previous_Medals,
    Total_Medals - Previous_Medals AS Medal_Change,
    ROUND(
        (Total_Medals - Previous_Medals) * 100.0
        / NULLIF(Previous_Medals, 0),
        2
    ) AS Medal_Change_Percent
FROM MedalTrend
ORDER BY Year;


-- 4. Medal trend by gender
SELECT
    Year,
    Gender,
    COUNT(*) AS Total_Medals
FROM dbo.Olympics
GROUP BY Year, Gender
ORDER BY Year, Gender;


-- 5. Gold medal trend over time
SELECT
    Year,
    COUNT(*) AS Gold_Medals
FROM dbo.Olympics
WHERE Medal = 'Gold'
GROUP BY Year
ORDER BY Year;


-- 6. Top 10 countries by medal growth
WITH CountryPeriod AS
(
    SELECT
        Country,
        SUM(
            CASE
                WHEN Year BETWEEN 1976 AND 1992 THEN 1
                ELSE 0
            END
        ) AS Early_Medals,
        SUM(
            CASE
                WHEN Year BETWEEN 1996 AND 2008 THEN 1
                ELSE 0
            END
        ) AS Recent_Medals
    FROM dbo.Olympics
    GROUP BY Country
)
SELECT TOP 10
    Country,
    Early_Medals,
    Recent_Medals,
    Recent_Medals - Early_Medals AS Medal_Change
FROM CountryPeriod
WHERE Early_Medals > 0
ORDER BY Medal_Change DESC;