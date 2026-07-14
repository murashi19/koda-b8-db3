-- 1
SELECT id, concat(first_name, ' ', last_name) as fullname, COUNT(DISTINCT mg.genre) as total_genre  FROM directors d
JOIN movies_directors md ON d.id = md.director_id
JOIN movies_genres mg ON mg.movie_id = md.movie_id
GROUP BY
d.id, d.first_name, d.last_name
ORDER BY total_genre DESC;

-- 2
SELECT concat(a.first_name, ' ', a.last_name) as fullname, COUNT(role) as total_roles  FROM actors a
JOIN roles r ON a.id = r.actor_id 
GROUP BY 
a.id, a.first_name, a.last_name
HAVING COUNT(role) > 5
ORDER BY total_roles DESC;

-- 3. 
WITH director_movies AS (
    SELECT id, concat(first_name, ' ', last_name) as fullname, COUNT(md.movie_id) as total_movies  FROM directors d
    JOIN movies_directors md ON d.id = md.director_id
    GROUP BY
    d.id, d.first_name, d.last_name
    ORDER BY total_movies
)SELECT * FROM director_movies WHERE total_movies  = (
    SELECT MAX(total_movies) FROM director_movies
);
-- atau
SELECT id, concat(first_name, ' ', last_name) as fullname, COUNT(DISTINCT md.movie_id) as total_movies  FROM directors d
JOIN movies_directors md ON d.id = md.director_id
GROUP BY
d.id, d.first_name, d.last_name
ORDER BY total_movies DESC LIMIT 1;

-- 4
SELECT year , COUNT(*) as total_movies FROM movies
GROUP BY year
ORDER BY total_movies DESC LIMIT 1;

-- 5
SELECT id, string_agg(name, ', ' ORDER BY mg.genre ) as genres FROM movies m
JOIN movies_genres mg ON m.id = mg.movie_id
GROUP BY m.id, m.name
ORDER BY m.name;



