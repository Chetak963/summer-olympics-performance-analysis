USE OlympicsAnalysis;
GO

-- 1. Total Medals by Country
SELECT
    Country,
    COUNT(*) AS Total_Medals
FROM dbo.Olympics
GROUP BY Country
ORDER BY Total_Medals DESC;


-- 2. Gold, Silver and Bronze Medals by Country
SELECT
    Country,
    SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold_Medals,
    SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver_Medals,
    SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze_Medals,
    COUNT(*) AS Total_Medals
FROM dbo.Olympics
GROUP BY Country
ORDER BY Total_Medals DESC;


-- 3. Top 10 Countries by Gold Medals
SELECT TOP 10
    Country,
    COUNT(*) AS Gold_Medals
FROM dbo.Olympics
WHERE Medal = 'Gold'
GROUP BY Country
ORDER BY Gold_Medals DESC;


-- 4. Medal Distribution
SELECT
    Medal,
    COUNT(*) AS Medal_Count
FROM dbo.Olympics
GROUP BY Medal
ORDER BY Medal_Count DESC;


-- 5. Medals by Olympic Year
SELECT
    Year,
    COUNT(*) AS Total_Medals
FROM dbo.Olympics
GROUP BY Year
ORDER BY Year;


-- 6. Medals by Year and Medal Type
SELECT
    Year,
    SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold,
    SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver,
    SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze,
    COUNT(*) AS Total_Medals
FROM dbo.Olympics
GROUP BY Year
ORDER BY Year;


-- 7. Country Ranking by Total Medals
SELECT
    Country,
    COUNT(*) AS Total_Medals,
    RANK() OVER (
        ORDER BY COUNT(*) DESC
    ) AS Medal_Rank
FROM dbo.Olympics
GROUP BY Country
ORDER BY Medal_Rank;


-- 8. Country Medal Share
SELECT
    Country,
    COUNT(*) AS Total_Medals,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS Medal_Share_Percent
FROM dbo.Olympics
GROUP BY Country
ORDER BY Total_Medals DESC;