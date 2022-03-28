/* This script inserts data into the tables to test relationships */
-- generate chains
INSERT INTO
    chain (name, city, state)
VALUES
    ('Subway', 'Upland', 'CA');

INSERT INTO
    chain (name, city, state)
VALUES
    ('McDonalds', 'Chicago', 'IL');

-- add businesses
INSERT INTO
    business (
        chain_name,
        name,
        street_address,
        city,
        state,
        zip
    )
VALUES
    (
        'McDonalds',
        'Golden McDonalds',
        '17500 S Golden Rd',
        'Golden',
        'CO',
        '80401'
    );

INSERT INTO
    business (
        chain_name,
        name,
        street_address,
        city,
        state,
        zip
    )
VALUES
    (
        'Subway',
        'Golden Subway',
        '16950 W Colfax Ave',
        'Golden',
        'CO',
        '80401'
    );

-- add a menu to McDonalds
INSERT INTO
    menu (business_id, label, url)
VALUES
    (
        1,
        'Breakfast',
        'https://www.mcdonalds.com/us/en-us/full-menu/breakfast.html'
    );

-- create reviewer
INSERT INTO reviewer (screen_name, indentity_provider)
VALUES  ('Paul', 'Facebook');

-- add a review to each business
INSERT INTO reviews (reviewer_name, reviewer_provider, business_id, views)
VALUES ('Paul', 'Facebook', 1, 11);

INSERT INTO reviews (reviewer_name, reviewer_provider, business_id, views)
VALUES ('Paul', 'Facebook', 2, 15);