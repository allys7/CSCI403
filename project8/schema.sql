/***********************************/
/* PROJECT PROGRAM SCHEMA CREATION */
/***********************************/
drop table if exists album cascade;
drop table if exists artist cascade;

create table artist (
	id serial PRIMARY KEY, 
	name text NOT NULL 
);

create table album (
	id serial PRIMARY KEY,
	artist_id integer REFERENCES artist(id),
	title text NOT NULL,
	year numeric(4)
);


/******************/
/* DATA MIGRATION */
/******************/

/* populate artist table */
insert into artist (name)
select distinct artist_name from project8;

/* populate album table */
insert into album (artist_id, title, year)
select distinct 
	a.id,
	p.album_title,
	p.album_year
from
	artist a,
	project8 p
where a.name = p.artist_name;


