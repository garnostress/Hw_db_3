create table if not exists artists (
	id serial primary key,
	name varchar(40) not null,
	alias varchar(40) not null unique
);

create table if not exists albums (
	id serial primary key,
	title varchar(40) not null,
	annum integer check(annum>0) not null
);

create table if not exists tracks (
	id serial primary key,
	name varchar(40) not null,
	duration integer not null,
	tracks_id integer references albums(id)
);

create table if not exists genres (
	id SERIAL PRIMARY KEY,
    genre_name VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS artists_genre (
    id SERIAL PRIMARY KEY,
    artist_id INTEGER REFERENCES artists(id),
    genre_id INTEGER REFERENCES genres(id)
);

CREATE TABLE IF NOT EXISTS artists_albums (
    id SERIAL PRIMARY KEY,
    artist_id INTEGER REFERENCES artists(id),
    album_id INTEGER REFERENCES albums(id)
);

CREATE TABLE IF NOT EXISTS collections (
    id SERIAL PRIMARY KEY,
    collection_name VARCHAR(40) NOT NULL,
    collection_pub_date VARCHAR(4) NOT NULL
);

CREATE TABLE IF NOT EXISTS collection_tracks (
    id SERIAL PRIMARY KEY,
    track_id INTEGER REFERENCES tracks(id),
    collection_id INTEGER REFERENCES collections(id)
);
