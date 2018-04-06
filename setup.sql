CREATE DATABASE lifebuoy;

\c lifebuoy

CREATE TABLE IF NOT EXISTS location(
    location_id SERIAL PRIMARY KEY,
    location_name TEXT NOT NULL UNIQUE,
    location_type TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS buoy_location(
    location_id SERIAL,
    buoy_id SERIAL UNIQUE,
    latitude DOUBLE PRECISION NOT NULL,
    longitude DOUBLE PRECISION NOT NULL
);

CREATE TABLE IF NOT EXISTS buoy(
    buoy_id SERIAL PRIMARY KEY,
    at_location BOOLEAN NOT NULL,
    time_checked TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE IF NOT EXISTS node_buoy(
    node_id SERIAL UNIQUE,
    buoy_id SERIAL UNIQUE
);

CREATE TABLE IF NOT EXISTS node(
    node_id SERIAL PRIMARY KEY,
    sigfox_id TEXT NOT NULL UNIQUE,
    active BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS last_message(
    node_id SERIAL PRIMARY KEY UNIQUE,
    button_press BOOLEAN NOT NULL,
    temp_sensed BOOLEAN NOT NULL,
    vib_sensed BOOLEAN NOT NULL,
    temperature INT NOT NULL,
    vibration REAL NOT NULL,
    time_entered TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE IF NOT EXISTS moved_buoy(
    node_id SERIAL,
    buoy_id SERIAL NOT NULL,
    latititude DOUBLE PRECISION NOT NULL,
    longitude DOUBLE PRECISION NOT NULL,
    location_type TEXT NOT NULL,
    location_id SERIAL NOT NULL,
    temperature INT NOT NULL,
    vibration REAL NOT NULL,
    time_moved TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE IF NOT EXISTS message(
    node_id SERIAL NOT NULL,
    message_text TEXT NOT NULL,
    time_entered TIMESTAMP WITH TIME ZONE NOT NULL,
    time_sent TIMESTAMP WITH TIME ZONE NOT NULL
);

ALTER TABLE message
ADD UNIQUE (node_id, time_sent);
