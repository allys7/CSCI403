/*
 *  project2.sql
 * 
 *  author: C. Painter-Wakefield (please replace with your name)
 *
 */
/* don't forget to set up your search path - in psql, do: */
set
    search_path to project2;

/* What is Radia Perlman known for? */
SELECT
    known_for
FROM
    pioneers
WHERE
    last = 'Perlman'
    and first = 'Radia';

/* Where did Alan Turing attend University, and what was the highest degree he obtained? */
SELECT
    school,
    degree
FROM
    pioneers
WHERE
    last = 'Turing'
    and first = 'Alan';

/* Which pioneers (first and last name) were born before 1700? */
SELECT
    first,
    last
FROM
    pioneers
WHERE
    birth < 1700;

/* Where is the school Ensimag located (city and country)? */
SELECT
    city,
    country
FROM
    schools
WHERE
    name = 'Ensimag';

/* How old was Benoit Mandelbrot when he died (give or take a year)? */
SELECT
    death - birth as age
FROM
    pioneers
WHERE
    first = 'Benoit'
    and last = 'Mandelbrot';

/* Which pioneers did not obtain a college degree, and what were their birth/death dates? */
SELECT
    first,
    last,
    degree
FROM
    pioneers
WHERE
    degree IS NULL;

/* What are the names of all pioneers who attended the University of Pennsylvania, given as
"firstname lastname," without extra spaces? There should only be one column in the result,
not two. Order by last name. */