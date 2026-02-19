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

Identified top spenders using advanced SQL logic.
