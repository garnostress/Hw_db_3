create table if not exists artists (
	id serial primary key,
	name varchar(40) not null,
	alias varchar(40) not null unique
);

create table if not exists albums (
	id serial primary key,
	title varchar(40) not null,
	annum integer check(annum>0) not null,
	artist_id integer references artists(id) 
);

create table if not exists tracks (
	id serial primary key,
	name varchar(40) not null,
	duration varchar(5) not null,
	tracks_id integer references albums(id)
);