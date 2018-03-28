CREATE DATABASE lifebuoy;
\c lifebuoy
CREATE TABLE IF NOT EXISTS node(
    /*
        sigfox_id is length 16 to allow comfortable extensibility.
        I cannot find the max length for a sigfox ID.
    */
    node_id SERIAL PRIMARY KEY,
    sigfox_id VARCHAR(16) NOT NULL UNIQUE,
    active BOOLEAN
);

CREATE TABLE IF NOT EXISTS messages(
    message_id SERIAL,
    node_id INT NOT NULL,
    button_pressed BOOLEAN,
    temperature SMALLINT,
    vibration REAL
);

CREATE TABLE IF NOT EXISTS sensor(
    node_id INT NOT NULL UNIQUE,
    temperature_sensed BOOLEAN,
    vibration_sensed BOOLEAN
);

