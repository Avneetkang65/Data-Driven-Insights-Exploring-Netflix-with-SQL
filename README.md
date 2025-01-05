# Data-Driven Insights: Exploring Netflix with SQL

This project leverages SQL to analyze the Netflix dataset and extract meaningful insights about movies and TV shows available on the platform. The analysis includes data exploration, identifying patterns, and generating actionable insights.

## Table of Contents
- [Overview](#overview)
- [Dataset Description](#dataset-description)
- [Queries and Insights](#queries-and-insights)
  - [List All Shows Released in a Specific Year](#list-all-shows-released-in-a-specific-year)
  - [Find Movies or TV Shows by a Specific Director](#find-movies-or-tv-shows-by-a-specific-director)
  - [Retrieve Movies with Specific Rating](#retrieve-movies-with-specific-rating)
  - [Count Movies and TV Shows](#count-movies-and-tv-shows)
  - [Top Countries with Most Content](#top-countries-with-most-content)
  - [Recent Additions to Netflix](#recent-additions-to-netflix)
  - [Shows in Multiple Categories](#shows-in-multiple-categories)
  - [Longest Movies and TV Shows](#longest-movies-and-tv-shows)
  - [Directors with Most Movies](#directors-with-most-movies)
- [How to Run](#how-to-run)
- [Conclusion](#conclusion)

## Overview
The project focuses on uncovering trends and valuable information from Netflix's dataset using SQL. By running a series of queries, we analyze:

- Trends in content release over the years.
- Country-wise content distribution.
- Popular directors and genres.
- Longest movies and TV shows.

## Dataset Description
The dataset (`dbo.netflix_titles`) contains the following key columns:

- `type`: Movie or TV Show.
- `title`: Title of the show.
- `director`: Director of the show.
- `release_year`: Year the show was released.
- `rating`: Audience rating.
- `country`: Country of origin.
- `listed_in`: Genres/categories.
- `date_added`: Date when the content was added to Netflix.
- `duration`: Duration of movies (in minutes) or number of seasons for TV shows.

## Queries and Insights

### List All Shows Released in a Specific Year
```sql
SELECT title, release_year
FROM dbo.netflix_titles
WHERE release_year = '2020';
```
**Insight:** Displays all shows that premiered in 2020.

### Find Movies or TV Shows by a Specific Director
```sql
SELECT type, director, title
FROM dbo.netflix_titles
WHERE director LIKE '%russo';
```
**Insight:** Lists movies or TV shows directed by individuals like the Russo Brothers.

### Retrieve Movies with Specific Rating
```sql
SELECT *
FROM dbo.netflix_titles
WHERE type = 'Movie' AND rating = 'PG-13';
```
**Insight:** Filters for PG-13 movies to identify family-friendly content.

### Count Movies and TV Shows
```sql
SELECT type, COUNT(*) AS total
FROM dbo.netflix_titles
GROUP BY type;
```
**Insight:** Provides the total count of movies and TV shows in the dataset.

### Top Countries with Most Content
```sql
SELECT TOP 10 country, COUNT(*) AS total_shows
FROM dbo.netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total_shows DESC;
```
**Insight:** Highlights the countries producing the highest number of shows.

### Recent Additions to Netflix
```sql
SELECT TOP 5 type, title, date_added
FROM dbo.netflix_titles
ORDER BY date_added DESC;
```
**Insight:** Shows the most recent content added to Netflix.

### Shows in Multiple Categories
```sql
SELECT *
FROM dbo.netflix_titles
WHERE listed_in LIKE '%crime%' AND listed_in LIKE '%comedies%';
```
**Insight:** Identifies shows that fall under multiple genres, such as crime and comedy.

### Longest Movies and TV Shows

#### Movies
```sql
SELECT TOP 10 type, title, release_year, duration
FROM dbo.netflix_titles
WHERE type = 'Movie' 
  AND CAST(LEFT(duration, CHARINDEX(' ', duration) - 1) AS INT) > 100
ORDER BY duration DESC;
```

#### TV Shows
```sql
SELECT TOP 10 type, title, duration, release_year
FROM dbo.netflix_titles
WHERE type = 'TV Show'
  AND duration LIKE '%Season%'
ORDER BY CAST(LEFT(duration, CHARINDEX(' ', duration) - 1) AS INT) DESC;
```
**Insight:** Finds the longest movies and TV shows based on duration or seasons.

### Directors with Most Movies
```sql
SELECT TOP 10 director, COUNT(type) AS total_movies
FROM dbo.netflix_titles
WHERE director IS NOT NULL 
GROUP BY director
ORDER BY total_movies DESC;
```
**Insight:** Lists the directors with the most movies in the dataset.

## How to Run
1. Import the Netflix dataset into your SQL database.
2. Open your SQL query editor.
3. Execute the provided SQL queries to extract insights.

## Conclusion
This project demonstrates the power of SQL in deriving valuable insights from large datasets. The analysis uncovers trends and details that can be useful for content creators, marketers, and viewers alike. Feel free to extend the queries for deeper analysis!
