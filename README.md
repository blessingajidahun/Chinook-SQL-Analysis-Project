# Chinook-SQL-Analysis-Project
### Advanced SQL Data Analysis on Customer Behavior & Music Sales
## Project Overview
This project explores a digital music store database (Chinook) using advanced SQL techniques to extract business insights about customer behavior, genre popularity, artist performance, and revenue distribution across countries.
The objective of this project was not just to write queries — but to demonstrate strong analytical thinking, clean query structure, and real-world business interpretation of data.
## Data Cleaning & Preparation (Power Query – Excel)
Before importing the dataset into SQL, I performed structured data cleaning using Power Query in Excel.

### Key Cleaning Actions:

Removed duplicate records

Handled null and missing values

Standardized column formats and data types

Ensured consistent country and genre naming

Validated primary/foreign key integrity

Fixed character encoding issues (standardized to UTF-8 to prevent SQL import errors)

Exported optimized CSV files for relational database ingestion

### Why This Matters
 Real-world datasets are rarely clean.
Encoding mismatches and inconsistent formatting can cause:

- SQL import failures

- Incorrect aggregations

- Corrupted text data

- Faulty joins

By resolving these issues before analysis, I ensured:

✔ Accurate revenue calculations
✔ Reliable joins across tables
✔ Correct country-level grouping
✔ Clean analytical outputs

## Business Questions Solved
1.  Who writes the most Rock songs?
  
- Identified the artist with the highest number of Rock tracks.

- Used multi-table joins and aggregation.

2.  Who listens to Rock music?
  
- Retrieved Rock listeners with customer details.

- Excluded “Rock & Roll” using precise filtering.

- Eliminated duplicates using DISTINCT.

3.  Who spent the most on the top Rock artist?

- Used a subquery to dynamically identify the top artist.

- Calculated total spending using UnitPrice × Quantity.

- Applied ranking logic to determine the highest spender.

4.  What is the most popular genre per country?

- Calculated genre purchase counts per country.

- Used window functions (RANK() OVER PARTITION BY) to determine top genre.

- Handled potential ties correctly.

5.  Which tracks are longer than average?

- Used subqueries with aggregate functions (AVG()).

- Compared individual records to dataset-level statistics.

6.  Who is the highest spending customer in each country?
  
- Calculated total customer revenue per country.

- Applied window functions for per-country ranking.

- Identified top spenders using advanced SQL logic.
- Technical Skills Demonstrated
## 🔹 Data Preparation

- Power Query (Excel)

- Data transformation

- Encoding standardization (UTF-8)

- Data validation & relational consistency checks

- Structured export for SQL ingestion

## 🔹 SQL & Analytical Techniques

- Complex multi-table JOINs

- Aggregate functions (SUM, COUNT, AVG)

- Subqueries (dynamic filtering)

- Common Table Expressions (CTEs)

- Window functions (RANK(), ROW_NUMBER(), PARTITION BY)

- Revenue calculations using quantity logic

- Per-group ranking analysis

- Business-driven filtering & aggregation

 ##  Business Intelligence Capabilities Shown

### This project demonstrates my ability to:

- Translate business questions into structured SQL logic

- Handle real-world data issues before analysis

- Perform country-level and customer-level revenue analysis

- Identify performance drivers (genre, artist, region)

- Write scalable and dynamic queries

- Produce analysis that supports decision-making

## 📂 Tools & Technologies

- Power Query (Excel)

- SQL (MySQL / SQLite syntax compatible)

- Relational database modeling principles

## This project reflects my readiness for:

- Data Analyst roles

- Business Intelligence roles

- Junior SQL Developer roles

- Analytics-focused graduate programs

I am actively seeking opportunities where I can apply structured data analysis and business insight generation to solve real-world problems.
