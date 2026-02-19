CREATE DATABASE Chinook

--1. Which country has the most invoice?
SELECT billingcountry, COUNT(total) as Invoice_by_country
FROM Invoice
GROUP BY billingcountry
ORDER BY Invoice_by_country DESC
--AnsWer is USA with 91 invoices

--2. What City has the best Customer?
SELECT  TOP 1 C.city, SUM(I.total) as totalinvoice
FROM Invoice as I
JOIN Customer as C
ON I.customerid = C.customerid
GROUP BY C.city
ORDER BY totalinvoice DESC
--Answer is Prague with 90.24 invoice

--3. Who is the best customer?
SELECT  TOP 1 C.firstname, C.lastname, C.city, SUM(I.total) as totalinvoice
FROM Invoice as I
JOIN Customer as C
ON I.customerid = C.customerid
GROUP BY C.city, C.firstname, C.lastname
ORDER BY totalinvoice DESC
--Answer is Helena Holi


--4. Use your query to return the email, first name, last name, 
--and Genre of all Rock Music listeners (Rock & Roll would be considered a different category for this exercise). 
--Return your list ordered alphabetically by email address starting with A.
SELECT DISTINCT c.Email, c.FirstName, c.LastName, g.Name AS Genre
FROM Customer c
JOIN Invoice i 
ON c.CustomerId = i.CustomerId
JOIN Invoice_Line il 
ON i.InvoiceId = il.InvoiceId
JOIN Track t 
ON il.TrackId = t.TrackId
JOIN Genre g 
ON t.GenreId = g.GenreId
WHERE g.Name = 'Rock'
ORDER BY c.Email ASC;

--5. Write a query that returns the name of artist and the number of ROCK songs they have written.
SELECT a.Name AS Artist_Name, COUNT(t.TrackId) AS Number_of_Rock_Songs
FROM Artist a
JOIN Album al 
    ON a.ArtistId = al.ArtistId
JOIN Track t 
    ON al.AlbumId = t.AlbumId
JOIN Genre g 
    ON t.GenreId = g.GenreId
WHERE g.Name = 'Rock'
GROUP BY a.Name
ORDER BY Number_of_Rock_Songs DESC;
--Answer is Lrd Zeppelin with 114 rock songs

--6. Find which artist has earned the most according to the InvoiceLines?
SELECT Ar.name AS Artist_name, SUM(Il.unitprice) AS Total_Invoiceline
FROM Invoice_Line Il
JOIN Track Tr
ON Il.trackid = Tr.trackid
JOIN Album Al
ON Tr.albumid = Al.albumid
JOIN Artist Ar
ON Al.artistid = Ar.artistid
GROUP BY Ar.name
ORDER BY Total_Invoiceline DESC
--Answer isIron Maiden 138.6

--7.	Find the customer who spent the most on the artist in Question 6
SELECT 
    c.FirstName,
    c.LastName,
    ar.Name AS Artist_Name,
    SUM(il.UnitPrice * il.Quantity) AS Total_Spent
FROM Customer c
JOIN Invoice i 
    ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il 
    ON i.InvoiceId = il.InvoiceId
JOIN Track t 
    ON il.TrackId = t.TrackId
JOIN Album al 
    ON t.AlbumId = al.AlbumId
JOIN Artist ar 
    ON al.ArtistId = ar.ArtistId
WHERE ar.Name = (
        SELECT ar2.Name
        FROM Artist ar2
        JOIN Album al2 ON ar2.ArtistId = al2.ArtistId
        JOIN Track t2 ON al2.AlbumId = t2.AlbumId
        JOIN Genre g ON t2.GenreId = g.GenreId
        WHERE g.Name = 'Rock'
        GROUP BY ar2.Name
        ORDER BY COUNT(t2.TrackId) DESC
)
GROUP BY c.FirstName, c.LastName, ar.Name
ORDER BY Total_Spent DESC


-- 8.find out the most popular music Genre for each country. 
--We determine the most popular genre as the genre with the highest amount of purchases on the invoice table
WITH CountryGenrePurchases AS (
    SELECT 
        c.Country,
        g.Name AS Genre,
        COUNT(il.Invoicelineid) AS Total_Purchases
    FROM Customer c
    JOIN Invoice i 
        ON c.CustomerId = i.CustomerId
    JOIN Invoice_Line il 
        ON i.InvoiceId = il.InvoiceId
    JOIN Track t 
        ON il.TrackId = t.TrackId
    JOIN Genre g 
        ON t.GenreId = g.GenreId
    GROUP BY c.Country, g.Name
),

RankedGenres AS (
    SELECT 
        Country,
        Genre,
        Total_Purchases,
        RANK() OVER (
            PARTITION BY Country 
            ORDER BY Total_Purchases DESC
        ) AS GenreRank
    FROM CountryGenrePurchases
)

SELECT 
    Country,
    Genre,
    Total_Purchases
FROM RankedGenres
WHERE GenreRank = 1
ORDER BY Country;

--9.Return all the track names that have a song length longer than the average song length.
SELECT 
    Name AS Track_Name,
    Milliseconds
FROM Track
WHERE Milliseconds > (
        SELECT AVG(Milliseconds)
        FROM Track
)
ORDER BY Milliseconds DESC;

-- 10.	Write a query that determines the customer that has spent the most on music for each country. 
--Write a query that returns the country along with the top customer and how much they spent.
WITH CustomerSpending AS (
    SELECT 
        c.Country,
        c.CustomerId,
        c.FirstName,
        c.LastName,
        SUM(il.UnitPrice * il.Quantity) AS Total_Spent
    FROM Customer c
    JOIN Invoice i 
        ON c.CustomerId = i.CustomerId
    JOIN Invoice_Line il 
        ON i.InvoiceId = il.InvoiceId
    GROUP BY 
        c.Country, 
        c.CustomerId, 
        c.FirstName, 
        c.LastName
),

RankedCustomers AS (
    SELECT 
        Country,
        FirstName,
        LastName,
        Total_Spent,
        RANK() OVER (
            PARTITION BY Country 
            ORDER BY Total_Spent DESC
        ) AS SpendingRank
    FROM CustomerSpending
)

SELECT 
    Country,
    FirstName,
    LastName,
    Total_Spent
FROM RankedCustomers
WHERE SpendingRank = 1
ORDER BY Total_Spent DESC;
