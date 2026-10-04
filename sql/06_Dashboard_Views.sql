USE OlympicsAnalysis;
GO


-- 1. Overall KPI metrics
CREATE VIEW dbo.vw_Olympics_KPIs
AS
SELECT
    Year,
    COUNT(*) AS Total_Medals,
    SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold_Medals,
    SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver_Medals,
    SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze_Medals,
    COUNT(DISTINCT Country) AS Total_Countries,
    COUNT(DISTINCT Sport) AS Total_Sports
FROM dbo.Olympics
GROUP BY Year;
GO


-- 2. Medal trend by Olympic year
CREATE VIEW dbo.vw_Medal_Trend
AS
SELECT
    Year,
    COUNT(*) AS Total_Medals,
    SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold,
    SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver,
    SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze
FROM dbo.Olympics
GROUP BY Year;
GO


-- 3. Country medal performance
CREATE VIEW dbo.vw_Country_Performance
AS
SELECT
    Year,
    Country,
    SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold_Medals,
    SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver_Medals,
    SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze_Medals,
    COUNT(*) AS Total_Medals
FROM dbo.Olympics
GROUP BY Year, Country;
GO


-- 4. Sport medal performance
CREATE VIEW dbo.vw_Sport_Performance
AS
SELECT
    Year,
    Sport,
    SUM(CASE WHEN Medal = 'Gold' THEN 1 ELSE 0 END) AS Gold_Medals,
    SUM(CASE WHEN Medal = 'Silver' THEN 1 ELSE 0 END) AS Silver_Medals,
    SUM(CASE WHEN Medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze_Medals,
    COUNT(*) AS Total_Medals
FROM dbo.Olympics
GROUP BY Year, Sport;
GO


-- 5. Country performance by year
CREATE VIEW dbo.vw_Country_Year
AS
SELECT
    Country,
    Year,
    COUNT(*) AS Total_Medals
FROM dbo.Olympics
GROUP BY Country, Year;
GO


-- 6. Country performance by sport
CREATE VIEW dbo.vw_Country_Sport
AS
SELECT
    Year,
    Country,
    Sport,
    COUNT(*) AS Total_Medals
FROM dbo.Olympics
GROUP BY Year, Country, Sport;
GO


-- 7. Gender medal trend
CREATE VIEW dbo.vw_Gender_Trend
AS
SELECT
    Year,
    Gender,
    COUNT(*) AS Total_Medals
FROM dbo.Olympics
GROUP BY Year, Gender;
GO


-- 8. Medal distribution
CREATE VIEW dbo.vw_Medal_Distribution
AS
SELECT
    Year,
    Medal,
    COUNT(*) AS Medal_Count
FROM dbo.Olympics
GROUP BY Year, Medal;
GO

-- 9. Year dimension
CREATE VIEW dbo.vw_Dim_Year
AS
SELECT DISTINCT
    Year
FROM dbo.Olympics;
GO


-- 10. Country dimension
CREATE VIEW dbo.vw_Dim_Country
AS
SELECT DISTINCT
    Country
FROM dbo.Olympics;
GO