/*
 *  project2.sql
 *  author: Ally Smith
 */

SET
    search_path TO project2;

/* What is Radia Perlman known for? */
SELECT
    known_for
FROM
    pioneers
WHERE
    last = 'Perlman'
    and first = 'Radia';

/* Where did Alan Turing attend University, and what was the highest degree he
 obtained? */
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

/* Which pioneers did not obtain a college degree, and what were their birth/
 death dates? */
SELECT
    first,
    last,
    birth,
    death
FROM
    pioneers
WHERE
    degree IS NULL;

/* What are the names of all pioneers who attended the University of
 Pennsylvania, given as "firstname lastname," without extra spaces? There should
 only be one column in the result, not two. Order by last name. */
SELECT
    CONCAT(first, ' ', last) as fullname
FROM
    pioneers
WHERE
    school = 'University of Pennsylvania'
ORDER BY
    last;

/* Which pioneer's last name started with 'I' whose first name did not start
 with 'K' and what were they known for? */
SELECT
    first,
    last,
    known_for
FROM
    pioneers
WHERE
    last LIKE 'I%'
    and first NOT LIKE 'K%';

/* Give the names and locations (city, country) of all schools outside the US,
 sorted by country descending. */
SELECT
    name,
    city,
    country
FROM
    schools
WHERE
    country NOT LIKE 'US'
ORDER BY
    country DESC;

/* Which pioneers are known for contributions to the programming language Lisp
 (the string "Lisp" will occur in the "known_for" column), when were they born,
 and where did they attend school? Sort by school and then birth year. */
SELECT
    first,
    last,
    birth,
    school
FROM
    pioneers
WHERE
    known_for LIKE '%Lisp%'
ORDER BY
    school,
    birth;

/* Give names for Princeton University alumni, sorted by first name, then by
 last name. */
SELECT
    first,
    last
FROM
    pioneers
WHERE
    school = 'Princeton University'
ORDER BY
    first,
    last;

/* In what city and country did John Conway attend school? */
SELECT
    schools.city,
    schools.country
FROM
    schools,
    pioneers
WHERE
    pioneers.school = schools.name
    AND pioneers.first = 'John'
    AND pioneers.last = 'Conway';

/* What are the names of every pioneer that attended a university outside of
 the US, and what was the name of the University they attended? */
SELECT
    pioneers.first,
    pioneers.last,
    pioneers.school
FROM
    schools,
    pioneers
WHERE
    pioneers.school = schools.name
    AND schools.country != 'US';

/* What is the name, birth year, and school of the pioneer who attended school
 in Prague? */
SELECT
    pioneers.first,
    pioneers.last,
    pioneers.birth,
    pioneers.school
FROM
    pioneers,
    schools
WHERE
    pioneers.school = schools.name
    AND schools.city = 'Prague';