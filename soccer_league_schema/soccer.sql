DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer

CREATE TABLE leagues (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL 
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    league_id INTEGER REFERENCES leagues (id) ON DELETE CASCADE
);

CREATE TABLE ranks (
    id SERIAL PRIMARY KEY,
    league_id INTEGER REFERENCES leagues (id) ON DELETE CASCADE,
    team_name TEXT REFERENCES teams (name) ON DELETE CASCADE,
    wins INTEGER,
    losses INTEGER
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team_name TEXT REFERENCES teams (name)
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team1 TEXT REFERENCES teams (name),
    team2 TEXT REFERENCES teams (name),
    referee_id INTEGER REFERENCES referees (id),
    date DATE NOT NULL,
    winner TEXT NOT NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players (id),
    match_id INTEGER REFERENCES matches (id),
    goal_time INTEGER NOT NULL
);