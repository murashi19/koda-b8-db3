SELECT m.name AS movie, CONCAT(d.first_name, ' ', d.last_name) AS director, mg.genre FROM movies m
JOIN movies_directors md ON m.id = md.movie_id
JOIN directors d ON md.director_id = d.id
JOIN movies_genres mg ON m.id = mg.movie_id
JOIN directors_genres dg ON dg.director_id = d.id AND dg.genre = mg.genre
LIMIT 50;

SELECT CONCAT(a.first_name, ' ', a.last_name) AS fullname,  a.gender,  m.name AS movie,  r.role FROM actors a
JOIN roles r ON a.id = r.actor_id
JOIN movies m ON r.movie_id = m.id
LIMIT 50;

