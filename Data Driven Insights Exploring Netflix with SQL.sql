-- Data-Driven Insights: Exploring Netflix with SQL
-- Netflix DataBase

Select *
From Dbo.netflix_titles
 

-- List all shows released in a specific year:

Select title , release_year
from dbo.netflix_titles
Where release_year = '2020'

-- Find all movies or TV shows by a specific director:

Select type, director, title
from dbo.netflix_titles
Where director like '%russo'

-- Retrieve all records where the type is 'Movie' and the rating is 'PG-13':

Select *
from dbo.netflix_titles
Where type = 'Movie' and rating = 'PG-13'


-- Count the number of movies and TV shows available in the dataset:


Select Type, COUNT(*) as Total
from dbo.netflix_titles
Group by type


-- Find the country with the highest number of movies or TV shows:

Select top 10 country, count(*) as total_shows
from dbo.netflix_titles
Where country is not null
group by country
Order by total_shows desc


-- Find the top 5 most recent shows added to the platform:

Select top 5 type, title, date_added
from dbo.netflix_titles
order by date_added desc


-- List all shows that belong to multiple categories (e.g., Crime, Comedies):

Select * 
from dbo.netflix_titles
Where listed_in like '%crime%' and listed_in like '%comedies%'

-- Find the longest movie or TV show based on duration and Season:

SELECT top 10 type, title, release_year, duration
FROM dbo.netflix_titles
WHERE type = 'Movie' 
  AND CAST(LEFT(duration, CHARINDEX(' ', duration) - 1) AS INT) > 100
  order by duration desc

Select top 10 type, title, duration, release_year
from dbo.netflix_titles
Where type = 'TV Show'
  AND duration LIKE '%Season%'
  order by cast(LEFT(duration, CHARINDEX(' ', duration) - 1) AS INT) Desc;


-- Find the director with the most movies in the dataset:

Select top 10 director, COUNT(type) as total_movies
from dbo.netflix_titles
Where director is not null 
group by director
order by total_movies desc


