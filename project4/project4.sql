/*
 *  project4.sql
 *  author: Ally Smith
 */
--------------------------------------------
-- Statistics, aggregation, and grouping
--------------------------------------------
-- Question 1
SELECT
    COUNT(id)
FROM
    pioneers
WHERE
    school_id IN (
        SELECT
            id
        FROM
            schools
        WHERE
            name = 'Stanford University'
    );

-- Question 2
SELECT
    MIN(birth)
FROM
    pioneers;

-- Question 3
SELECT
    COUNT(id)
FROM
    pioneers
WHERE
    degree IS NULL;

-- Question 4
SELECT
    COUNT(id)
FROM
    pioneers
WHERE
    LENGTH(first) = LENGTH(last);

-- Question 5
SELECT
    degree,
    count(*)
FROM
    pioneers
GROUP BY
    degree
ORDER BY
    COUNT(degree) DESC;

-- Question 6
SELECT
    *
FROM
    (
        SELECT
            country,
            COUNT(id)
        FROM
            schools
        GROUP BY
            country
    ) as school_counts
WHERE
    count > 2
ORDER BY
    count DESC;

-- Question 7
SELECT
    AVG(pioneers_yearslived.years)
FROM
    (
        SELECT
            *,
            (death - birth) as years
        FROM
            pioneers
    ) as pioneers_yearslived;

-- Question 8
SELECT
    *
FROM
    (
        SELECT
            birth,
            COUNT(id)
        FROM
            pioneers
        GROUP BY
            birth
    ) as pioneers_by_birthyear
WHERE
    count = 5
ORDER BY
    count DESC;

--------------------------------------------
-- Subqueries and/or complex joins
--------------------------------------------
-- Question 9
SELECT
    MAX(count)
FROM
    (
        SELECT
            pioneer_id,
            COUNT(*)
        FROM
            pioneers_awards_xref
        GROUP BY
            pioneer_id
    ) as pioneers_award_counts;

-- Question 10
SELECT
    MAX(birth)
FROM
    pioneers;

-- Question 11
SELECT
    awarded_by,
    name
FROM
    awards
WHERE
    id IN (
        SELECT
            award_id
        FROM
            (
                SELECT
                    id
                FROM
                    pioneers
                WHERE
                    first = 'Donald'
                    AND last = 'Knuth'
            ) AS id,
            pioneers_awards_xref
        WHERE
            id.id = pioneers_awards_xref.pioneer_id
    );

-- Question 12
SELECT
    first,
    last
FROM
    pioneers
WHERE
    id IN (
        SELECT
            pioneer_id
        FROM
            pioneers_awards_xref
        WHERE
            award_id IN (
                SELECT
                    id
                FROM
                    awards
                WHERE
                    name = 'Presidential Medal of Freedom'
            )
    );

-- Question 13
SELECT
    *
FROM
    pioneers
WHERE
    first = 'Lynn'
    AND last = 'Conway';