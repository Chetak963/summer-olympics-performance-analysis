USE OlympicsAnalysis;
GO

-- 1. Total Medals by Sport
SELECT
    Sport,
    COUNT(*) AS Total_Medals
FROM dbo.Olympics
GROUP BY Sport
ORDER BY Total_Medals DESC;


-- 2. Medals by Sport and Medal Type
SELECT
    Sport,
    SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold,
    SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver,
    SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze,
    COUNT(*) AS Total_Medals
FROM dbo.Olympics
GROUP BY Sport
ORDER BY Total_Medals DESC;


-- 3. Top 15 Sports by Total Medals
SELECT TOP 15
    Sport,
    COUNT(*) AS Total_Medals
FROM dbo.Olympics
GROUP BY Sport
ORDER BY Total_Medals DESC;


-- 4. Total Medals by Discipline
SELECT
    Discipline,
    COUNT(*) AS Total_Medals
FROM dbo.Olympics
GROUP BY Discipline
ORDER BY Total_Medals DESC;


-- 5. Country-Sport Medal Performance
SELECT
    Country,
    Sport,
    COUNT(*) AS Total_Medals
FROM dbo.Olympics
GROUP BY Country, Sport
ORDER BY Country, Total_Medals DESC;


-- 6. Top Country-Sport Combinations
SELECT TOP 20
    Country,
    Sport,
    COUNT(*) AS Total_Medals
FROM dbo.Olympics
GROUP BY Country, Sport
ORDER BY Total_Medals DESC;


-- 7. Strongest Sport for Each Country
WITH CountrySport AS
(
    SELECT
        Country,
        Sport,
        COUNT(*) AS Total_Medals
    FROM dbo.Olympics
    GROUP BY Country, Sport
),
RankedSports AS
(
    SELECT
        Country,
        Sport,
        Total_Medals,
        RANK() OVER (
            PARTITION BY Country
            ORDER BY Total_Medals DESC
        ) AS Sport_Rank
    FROM CountrySport
)
SELECT
    Country,
    Sport,
    Total_Medals
FROM RankedSports
WHERE Sport_Rank = 1
ORDER BY Total_Medals DESC;