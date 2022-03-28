/*
 *  project3.sql
 *  author: Ally Smith
 */
SET
    search_path TO cksmith,
    project3;

-- removes pre-existing schedule table so the script may have a fresh start
DROP TABLE IF EXISTS schedule,
transcript;

---------------------------------------
-- STAGE 1
---------------------------------------
-- Step 1
CREATE TABLE schedule (
    term TEXT,
    course_id TEXT,
    section TEXT,
    title TEXT,
    instructor TEXT,
    days TEXT,
    begin_time TIME
);

-- Step 2
INSERT INTO
    schedule
VALUES
    (
        'Fall',
        'MATH201',
        'B',
        'PROBABILITY & STATISTICS',
        'Munson, Ashlyn',
        'TR',
        '11:00:00'
    );

INSERT INTO
    schedule
VALUES
    (
        'Fall',
        'CSCI262',
        'B',
        'DATA STRUCTURES',
        'Painter-Wakefield, Christopher',
        'MWF',
        '13:30:00'
    );

INSERT INTO
    schedule (
        term,
        course_id,
        section,
        title,
        days,
        begin_time
    )
VALUES
    (
        'Fall',
        'CSCI358',
        'A',
        'DISCRETE MATHEMATICS',
        'TR',
        '09:30:00'
    );

INSERT INTO
    schedule
VALUES
    (
        'Fall',
        'MATH225',
        'C',
        'DIFFERENTIAL EQUATIONS',
        'Strong, Scott',
        'MWF',
        '16:00:00'
    );

-- Step 3
UPDATE
    schedule
SET
    begin_time = '13:00:00'
WHERE
    course_id = 'CSCI262';

---------------------------------------
-- STAGE 2
---------------------------------------
-- Step 4
CREATE TABLE transcript (
    term TEXT,
    course_id TEXT,
    title TEXT,
    grade TEXT,
    credits NUMERIC(4, 2),
    quality_points NUMERIC(4, 2)
);

-- Step 5
INSERT INTO
    transcript
SELECT
    term,
    course_id,
    title
FROM
    schedule;

-- Step 6
UPDATE
    transcript
SET
    grade = 'A',
    credits = 3.0,
    quality_points = 12.0
WHERE
    course_id = 'MATH201';

UPDATE
    transcript
SET
    grade = 'B',
    credits = 3.0,
    quality_points = 9.0
WHERE
    course_id = 'CSCI262';

UPDATE
    transcript
SET
    grade = 'B',
    credits = 3.0,
    quality_points = 9.0
WHERE
    course_id = 'CSCI358';

UPDATE
    transcript
SET
    grade = 'A-',
    credits = 3.0,
    quality_points = 11.1
WHERE
    course_id = 'MATH225';

---------------------------------------
-- Stage 3
---------------------------------------
-- Step 8
DROP TABLE IF EXISTS schedule;

-- Step 9
CREATE TABLE schedule AS (
    SELECT
        *
    FROM
        project3.catalog
    WHERE
        crn in (12048, 11153, 12379, 10866, 10134, 12704)
);

DELETE FROM
    schedule
WHERE
    crn = 10866;