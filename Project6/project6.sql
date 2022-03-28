/*
 *  project6.sql
 *  author: Ally Smith
 */
/* BE SURE TO EXECUTE
 `SET search_path TO cksmith;`
 BEFORE RUNNING THIS SCRIPT */
DROP TABLE reviewer,
business,
chain,
menu,
reviews,
business_type CASCADE;

/* -------- TODO: --------
 - add `views` derived value to `reviewer`
 */
/* -------- STEP 1 -------- */
CREATE TABLE reviewer (
    screen_name text NOT NULL,
    indentity_provider text NOT NULL,
    PRIMARY KEY (screen_name, indentity_provider)
);

CREATE TABLE business (
    id serial NOT NULL,
    name text,
    street_address text,
    city text,
    state char(2),
    zip text,
    PRIMARY KEY (id)
);

CREATE TABLE chain (
    name text NOT NULL,
    city text,
    state char(2),
    PRIMARY KEY (name)
);

/* -------- STEP 2 -------- */
CREATE TABLE menu (
    business_id int NOT NULL,
    label text NOT NULL,
    url text,
    PRIMARY KEY (business_id, label),
    FOREIGN KEY (business_id) REFERENCES business(id)
);

-- skipped step 3, no 1:1 relationships
;

/* -------- STEP 4 -------- */
ALTER TABLE
    business
ADD
    chain_name text NOT NULL;

ALTER TABLE
    business
ADD
    FOREIGN KEY (chain_name) REFERENCES chain(name);

/* -------- STEP 5 -------- */
CREATE TABLE reviews (
    reviewer_name text NOT NULL,
    reviewer_provider text NOT NULL,
    business_id int NOT NULL,
    PRIMARY KEY (reviewer_name, reviewer_provider, business_id),
    FOREIGN KEY (reviewer_name, reviewer_provider) REFERENCES reviewer(screen_name, indentity_provider),
    FOREIGN KEY (business_id) REFERENCES business(id),
    -- relationship attributes
    views int,
    rating int CHECK (
        rating >= 0
        AND rating <= 5
    ),
    review_date date,
    comments text
);

/* -------- STEP 6 -------- */
CREATE TABLE business_type (
    business_id int NOT NULL,
    type text NOT NULL,
    PRIMARY KEY (business_id, type),
    FOREIGN KEY (business_id) REFERENCES business(id)
);

CREATE VIEW reviewer_view AS 
SELECT
    reviewer.screen_name, reviewer.indentity_provider, views.sum
FROM
    (
        SELECT
            reviewer_name, reviewer_provider,
            SUM(views)
        FROM
            reviews
        GROUP BY
            (reviewer_name, reviewer_provider)
    ) as views
    LEFT JOIN reviewer ON views.reviewer_name = reviewer.screen_name
    AND views.reviewer_provider = reviewer.indentity_provider;