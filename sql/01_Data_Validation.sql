USE OlympicsAnalysis;
GO

-- 1. Total number of records
SELECT COUNT(*) AS TotalRows
FROM dbo.Olympics;


-- 2. Check for duplicate records
SELECT
    City,
    Year,
    Sport,
    Discipline,
    Event,
    Athlete,
    Gender,
    Country_Code,
    Country,
    Event_gender,
    Medal,
    COUNT(*) AS DuplicateCount
FROM dbo.Olympics
GROUP BY
    City,
    Year,
    Sport,
    Discipline,
    Event,
    Athlete,
    Gender,
    Country_Code,
    Country,
    Event_gender,
    Medal
HAVING COUNT(*) > 1;


-- 3. Olympic years
SELECT DISTINCT Year
FROM dbo.Olympics
ORDER BY Year;


-- 4. Number of countries
SELECT COUNT(DISTINCT Country) AS TotalCountries
FROM dbo.Olympics;


-- 5. Number of sports
SELECT COUNT(DISTINCT Sport) AS TotalSports
FROM dbo.Olympics;


-- 6. Number of disciplines
SELECT COUNT(DISTINCT Discipline) AS TotalDisciplines
FROM dbo.Olympics;


-- 7. Number of events
SELECT COUNT(DISTINCT Event) AS TotalEvents
FROM dbo.Olympics;


-- 8. Medal types
SELECT
    Medal,
    COUNT(*) AS MedalCount
FROM dbo.Olympics
GROUP BY Medal
ORDER BY MedalCount DESC;


-- 9. Gender distribution
SELECT
    Gender,
    COUNT(*) AS MedalCount
FROM dbo.Olympics
GROUP BY Gender
ORDER BY MedalCount DESC;


-- 10. Check for NULL values
SELECT
    SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) AS Null_City,
    SUM(CASE WHEN Year IS NULL THEN 1 ELSE 0 END) AS Null_Year,
    SUM(CASE WHEN Sport IS NULL THEN 1 ELSE 0 END) AS Null_Sport,
    SUM(CASE WHEN Discipline IS NULL THEN 1 ELSE 0 END) AS Null_Discipline,
    SUM(CASE WHEN Event IS NULL THEN 1 ELSE 0 END) AS Null_Event,
    SUM(CASE WHEN Athlete IS NULL THEN 1 ELSE 0 END) AS Null_Athlete,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Null_Gender,
    SUM(CASE WHEN Country_Code IS NULL THEN 1 ELSE 0 END) AS Null_Country_Code,
    SUM(CASE WHEN Country IS NULL THEN 1 ELSE 0 END) AS Null_Country,
    SUM(CASE WHEN Event_gender IS NULL THEN 1 ELSE 0 END) AS Null_Event_Gender,
    SUM(CASE WHEN Medal IS NULL THEN 1 ELSE 0 END) AS Null_Medal
FROM dbo.Olympics;