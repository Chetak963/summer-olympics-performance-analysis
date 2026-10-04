# Summer Olympics Performance Analysis

## Project Overview

This project analyzes Summer Olympic medal performance from 1976 to 2008 using Python, SQL Server, and Power BI.

The analysis focuses on medal trends over time, country performance, sports performance, medal distribution, and changes in country performance across Olympic Games.

The project follows an end-to-end data analytics workflow:

Raw Data → Python EDA & Cleaning → SQL Server Analysis → Power BI Dashboard

---

## Dataset

The dataset contains Summer Olympic medal records from 1976 to 2008.

### Dataset Columns

- City
- Year
- Sport
- Discipline
- Event
- Athlete
- Gender
- Country_Code
- Country
- Event_gender
- Medal

### Dataset Size

- Original records: 15,433
- Records after cleaning: 15,315
- Olympic years: 1976–2008
- Countries: 127
- Sports: 28
- Disciplines: 41
- Events: 293

---

## Objectives

The main objectives of this project are:

- Analyze overall Olympic medal trends over time
- Identify countries with the highest medal counts
- Analyze gold, silver, and bronze medal distributions
- Identify the most successful sports
- Analyze country performance across Olympic years
- Compare country performance across different sports
- Analyze medal growth between earlier and later Olympic periods
- Build an interactive Power BI dashboard

---

## Tools & Technologies

- **Python**
  - Pandas
  - NumPy
  - Matplotlib
  - Seaborn
  - Jupyter Notebook

- **SQL Server**
  - Aggregations
  - GROUP BY
  - CASE statements
  - CTEs
  - Window functions
  - LAG
  - RANK
  - SQL Views

- **Power BI**
  - Interactive dashboard
  - Cards
  - Line charts
  - Bar charts
  - Donut chart
  - Matrix
  - Slicers
  - Data modeling
  - DAX measures

- **Git & GitHub**
  - Version control
  - Project documentation

---

## Project Workflow

```text
Raw CSV Dataset
       ↓
Python
       ↓
Data Cleaning & EDA
       ↓
Cleaned CSV
       ↓
SQL Server
       ↓
SQL Analysis & Dashboard Views
       ↓
Power BI
       ↓
Interactive Dashboard
       ↓
GitHub