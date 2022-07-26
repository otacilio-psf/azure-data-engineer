-- Databricks notebook source
-- MAGIC %md # Objective
-- MAGIC 
-- MAGIC Make each type of join and check if the keys are null

-- COMMAND ----------

-- MAGIC %md ## INNER JOIN

-- COMMAND ----------

SELECT
  b.*,
  r.averageRating,
  r.numVotes
FROM imdb.title_basics b
INNER JOIN imdb.title_ratings r
  ON b.tconst = r.tconst

-- COMMAND ----------

SELECT 
  b.*,
  r.averageRating,
  r.numVotes
FROM imdb.title_basics b
INNER JOIN imdb.title_ratings r
  ON b.tconst = r.tconst
WHERE b.tconst IS NULL OR r.tconst IS NULL

-- COMMAND ----------

-- MAGIC %md ## LEFT JOIN

-- COMMAND ----------

SELECT
  b.*,
  r.averageRating,
  r.numVotes
FROM imdb.title_basics b
LEFT JOIN imdb.title_ratings r
  ON b.tconst = r.tconst

-- COMMAND ----------

SELECT
  b.*,
  r.averageRating,
  r.numVotes
FROM imdb.title_basics b
LEFT JOIN imdb.title_ratings r
  ON b.tconst = r.tconst
WHERE b.tconst IS NULL OR r.tconst IS NULL

-- COMMAND ----------

-- MAGIC %md ## RIGHT JOIN

-- COMMAND ----------

SELECT
  b.*,
  r.averageRating,
  r.numVotes
FROM imdb.title_basics b
RIGHT JOIN imdb.title_ratings r
  ON b.tconst = r.tconst

-- COMMAND ----------

SELECT
  b.*,
  r.averageRating,
  r.numVotes
FROM imdb.title_basics b
RIGHT JOIN imdb.title_ratings r
  ON b.tconst = r.tconst
WHERE b.tconst IS NULL OR r.tconst IS NULL

-- COMMAND ----------

-- MAGIC %md ## FULL JOIN

-- COMMAND ----------

SELECT
  b.*,
  r.averageRating,
  r.numVotes
FROM imdb.title_basics b
FULL JOIN imdb.title_ratings r
  ON b.tconst = r.tconst

-- COMMAND ----------

SELECT
  b.*,
  r.averageRating,
  r.numVotes
FROM imdb.title_basics b
FULL JOIN imdb.title_ratings r
  ON b.tconst = r.tconst
WHERE b.tconst IS NULL OR r.tconst IS NULL

-- COMMAND ----------

-- MAGIC %md ## Question 1 - Return the movies that had average rate more then 9 and number of votes bigger then 1000 in 2022 sorted by the higher rating

-- COMMAND ----------

SELECT
  b.*,
  r.averageRating,
  r.numVotes
FROM imdb.title_basics b
INNER JOIN imdb.title_ratings r
  ON b.tconst = r.tconst
WHERE 
  titleType = 'movie'
  AND startYear = 2022
  AND averageRating > 9
  AND numVotes > 1000
ORDER BY averageRating DESC

-- COMMAND ----------

-- MAGIC %md ## Question 2 - How many Action titles in 2021 had an average rate more then 7 by title types and start year

-- COMMAND ----------

SELECT
  titleType,
  startYear,
  COUNT(1) AS num_of_titles
FROM imdb.title_basics b
INNER JOIN imdb.title_ratings r
  ON b.tconst = r.tconst
WHERE 
  genres LIKE '%Action%'
  AND averageRating > 7
GROUP BY
  titleType,
  startYear
ORDER BY
  titleType,
  startYear
