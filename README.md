# 🎵 Music Store Data Analysis — SQL

## 📌 Project Overview

This project focuses on analyzing a **Music Store relational database** using **SQL and MySQL** to answer real-world business questions and generate meaningful insights from transactional data.

The analysis covers customers, invoices, invoice line items, tracks, albums, artists, genres, and employees.

---

## 🎯 Business Objectives

The main objective of this project is to use SQL to answer business-related questions such as:

* Who is the senior-most employee?
* Which countries generate the most invoices?
* What are the top invoice amounts?
* Which city generates the highest revenue?
* Who is the best customer based on total spending?
* Which customers listen to Rock music?
* Which artists have the most Rock tracks?
* What is the most popular music genre in each country?
* Who is the highest-spending customer in each country?
* How much does each customer spend on different artists?

---

## 🗃️ Database Tables

The project uses a relational database containing tables such as:

* `customer`
* `invoice`
* `invoice_line`
* `track`
* `album`
* `artist`
* `genre`
* `employee`
* `media_type`
* `playlist`
* `playlist_track`

---

## 🛠️ Tools & Technologies

* **MySQL**
* **SQL**
* Relational Database

---

## 🧠 SQL Concepts Used

The project demonstrates the practical use of:

* `SELECT`
* `WHERE`
* `DISTINCT`
* `INNER JOIN`
* Multiple Table JOINs
* `GROUP BY`
* `ORDER BY`
* `LIMIT`
* Aggregate Functions

  * `SUM()`
  * `COUNT()`
* Subqueries
* Common Table Expressions (`CTE`)
* Window Functions
* `ROW_NUMBER()`
* `PARTITION BY`
* String Functions
* Business-oriented SQL analysis

---

## 🔍 Key Analysis

### 1. Best Customer

Identified the customer who spent the most money by joining the `customer` and `invoice` tables and calculating total spending using `SUM()`.

### 2. Rock Music Listeners

Identified customers who purchased/listened to Rock music by connecting:

`customer → invoice → invoice_line → track → genre`

and filtering the Rock genre.

### 3. Top Rock Artists

Analyzed Rock tracks and identified the top 10 artists based on the number of Rock songs in the dataset.

### 4. Popular Genre by Country

Used a **CTE and `ROW_NUMBER()` window function** to determine the most popular music genre for each country based on the number of purchases.

### 5. Top Customer by Country

Used `ROW_NUMBER()` with `PARTITION BY` to identify the highest-spending customer from each country.

### 6. Customer Spending by Artist

Used multiple tables:

`Invoice → Invoice Line → Track → Album → Artist → Customer`

to calculate how much each customer spent on an artist.

For product-level spending, the analysis uses:

`unit_price × quantity`

instead of relying only on the invoice-level total.

---

## 📊 Example SQL

```sql
SELECT 
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    SUM(invoice.total) AS total_spending
FROM customer
JOIN invoice
    ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total_spending DESC
LIMIT 1;
```

This query identifies the **highest-spending customer**.

---

## 📚 What I Learned

Through this project, I practiced how to:

* Work with relational databases
* Understand relationships between multiple tables
* Write complex SQL queries
* Perform multi-table JOINs
* Analyze transactional data
* Use aggregation for business analysis
* Use CTEs and window functions
* Convert business questions into SQL queries
* Extract actionable insights from raw data

---

## 🚀 Conclusion

This project demonstrates my ability to use **SQL for real-world data analysis**, work with relational databases, connect multiple tables, and solve business problems using structured queries.

**Skills demonstrated:**
`SQL` `MySQL` `Data Analysis` `Relational Database` `JOINs` `CTEs` `Window Functions` `Aggregation` `Business Analysis`
