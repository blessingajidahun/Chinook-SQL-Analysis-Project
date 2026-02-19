# Chinook-SQL-Analysis-Project
### Advanced SQL Data Analysis on Customer Behavior & Music Sales
## Project Overview
This project explores a digital music store database (Chinook) using advanced SQL techniques to extract business insights about customer behavior, genre popularity, artist performance, and revenue distribution across countries.
The objective of this project was not just to write queries — but to demonstrate strong analytical thinking, clean query structure, and real-world business interpretation of data.
## Business Questions Solved
- Who writes the most Rock songs?
  
Identified the artist with the highest number of Rock tracks.

Used multi-table joins and aggregation.

- Who listens to Rock music?
  
Retrieved Rock listeners with customer details.

Excluded “Rock & Roll” using precise filtering.

Eliminated duplicates using DISTINCT.

- Who spent the most on the top Rock artist?

Used a subquery to dynamically identify the top artist.

Calculated total spending using UnitPrice × Quantity.

Applied ranking logic to determine the highest spender.

- What is the most popular genre per country?

Calculated genre purchase counts per country.

Used window functions (RANK() OVER PARTITION BY) to determine top genre.

Handled potential ties correctly.

- Which tracks are longer than average?

Used subqueries with aggregate functions (AVG()).

Compared individual records to dataset-level statistics.

- Who is the highest spending customer in each country?
  
Calculated total customer revenue per country.

Applied window functions for per-country ranking.

Identified top spenders using advanced SQL logic.
