DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    FOREIGN KEY (posts) REFERENCES post (id) ON DELETE SET NULL
);

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    name UNIQUE NOT NULL
);

CREATE TABLE user (
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    password TEXT,
    FOREIGN KEY (preferred_region) REFERENCES region (name) ON DELETE SET NULL
);

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT NOT NULL,
    FOREIGN KEY (user) REFERENCES user (username) ON DELETE CASCADE,
    location TEXT NOT NULL,
    FOREIGN KEY (region) REFERENCES region (name) ON DELETE CASCADE
);