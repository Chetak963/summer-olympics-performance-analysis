USE OlympicsAnalysis;
GO

-- 1. Medal performance of each country by Olympic year
SELECT
    Country,
    Year,
    COUNT(*) AS Total_Medals
FROM dbo.Olympics
GROUP BY Country, Year
ORDER BY Country, Year;


-- 2. Medal change from the previous Olympic appearance
WITH CountryYearMedals AS
(
    SELECT
        Country,
        Year,
        COUNT(*) AS Total_Medals
    FROM dbo.Olympics
    GROUP BY Country, Year
),
MedalTrend AS
(
    SELECT
        Country,
        Year,
        Total_Medals,
        LAG(Total_Medals) OVER (
            PARTITION BY Country
            ORDER BY Year
        ) AS Previous_Medals
    FROM CountryYearMedals
)
SELECT
    Country,
    Year,
    Total_Medals,
    Previous_Medals,
    Total_Medals - Previous_Medals AS Medal_Change
FROM MedalTrend
ORDER BY Country, Year;


-- 3. Countries with the largest single-year improvement
WITH CountryYearMedals AS
(
    SELECT
        Country,
        Year,
        COUNT(*) AS Total_Medals
    FROM dbo.Olympics
    GROUP BY Country, Year
),
MedalTrend AS
(
    SELECT
        Country,
        Year,
        Total_Medals,
        LAG(Total_Medals) OVER (
            PARTITION BY Country
            ORDER BY Year
        ) AS Previous_Medals
    FROM CountryYearMedals
)
SELECT TOP 15
    Country,
    Year,
    Previous_Medals,
    Total_Medals,
    Total_Medals - Previous_Medals AS Medal_Change
FROM MedalTrend
WHERE Previous_Medals IS NOT NULL
ORDER BY Medal_Change DESC;


-- 4. Country performance ranking within each Olympic year
SELECT
    Year,
    Country,
    COUNT(*) AS Total_Medals,
    RANK() OVER (
        PARTITION BY Year
        ORDER BY COUNT(*) DESC
    ) AS Country_Rank
FROM dbo.Olympics
GROUP BY Year, Country
ORDER BY Year, Country_Rank;