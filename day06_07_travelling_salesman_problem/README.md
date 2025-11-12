# SQL basics - days 06, 07

## _Traveling Salesman Problem_

Resume: Today you will implementing a quick solution on SQL to achieve results of Traveling Salesman Problem.

## Contents

1. [Exercise 00 — Classical TSP](#exercise-00--classical-tsp)
2. [Exercise 01 — Opposite TSP](#exercise-01--opposite-tsp)

## Rules of the day

- Please make sure you have your own database and access for it on your PostgreSQL cluster. 
- All tasks contain a list of Allowed and Denied sections with listed database options, database types, SQL constructions etc. Please have a look at this section before you start.

<br>

## Exercise 00 — Classical TSP

| Exercise 00: Classical TSP ||
|-|-|
| Solution file | `ex00.sql` |
| **Allowed** ||
| Language | ANSI SQL |
| SQL Syntax Pattern | Recursive Query |

![T00_02](misc/images/T00_02.png)

Take a look at the Graph on the left. 
There are 4 cities (a, b, c and d) and arcs between them with costs (or taxes). Actually, the cost is (a,b) = (b,a).

Please create a table with named nodes using structure {point1, point2, cost} and fill data based on a picture (remember there are direct and reverse paths between 2 nodes).
Please write a SQL statement that returns all tours (aka paths) with minimum travel cost if we start from city "a".
Remember, you need to find the cheapest way to visit all cities and return to your starting point. For example, the tour looks like a -> b -> c -> d -> a.

Below is an example of the output data. Please sort the data by total_cost and then by tour.

| total_cost | tour |
| ------ | ------ |
| 80 | {a,b,d,c,a} |
| ... | ... |

<br>

## Exercise 01 — Opposite TSP

| Exercise 01: Opposite TSP ||
|-|-|
| Solution file | `ex01.sql` |
| **Allowed** ||
| Language | ANSI SQL |
| SQL Syntax Pattern | Recursive Query |

Please add a way to see additional rows with the most expensive cost to the SQL from the previous exercise. Take a look at the sample data below. Please sort the data by total_cost and then by trip.

| total_cost | tour |
| ------ | ------ |
| 80 | {a,b,d,c,a} |
| ... | ... |
| 95 | {a,d,c,b,a} |


