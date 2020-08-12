/* Mostra todos os filmes com os seguintes campos: Titulo, Gênero e o Ano que foi Lançado */
SELECT title as Título,
  firstName as Nome,
  lastName as Sobrome,
  label as Papel
FROM (
    (
      (
        casting
        INNER JOIN people on people.id = casting.people_id
      )
      INNER JOIN movies on movies.id = casting.movie_id
    )
    INNER JOIN role_types on role_types.id = casting.movie_role_id
  )
ORDER BY movies.id;