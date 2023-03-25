DROP DATABASE IF EXISTS estate;
CREATE DATABASE estate;

DROP TABLE IF EXISTS estate.estate;

CREATE TABLE estate.estate
(
    id          INTEGER             NOT NULL PRIMARY KEY,
    name        VARCHAR(64)         NOT NULL,
    description VARCHAR(4096)       NOT NULL,
    thumbnail   VARCHAR(128)        NOT NULL,
    address     VARCHAR(128)        NOT NULL,
    latitude    DOUBLE PRECISION    NOT NULL,
    longitude   DOUBLE PRECISION    NOT NULL,
    rent        INTEGER             NOT NULL,
    door_height INTEGER             NOT NULL,
    door_width  INTEGER             NOT NULL,
    features    VARCHAR(64)         NOT NULL,
    popularity  INTEGER             NOT NULL,
    coordinate  POINT AS (ST_PointFromText(CONCAT('POINT(', latitude, ' ', longitude, ')'), 4326)) STORED NOT NULL,
    negative_popularity INTEGER AS (popularity * -1) NOT NULL,
    INDEX  rent_index (rent, id),
    SPATIAL INDEX coordinate_index (coordinate),
    INDEX neg_popularity_id_index (negative_popularity, id)
);
