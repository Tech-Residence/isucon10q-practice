DROP DATABASE IF EXISTS chair;
CREATE DATABASE chair;

DROP TABLE IF EXISTS chair.chair;

CREATE TABLE chair.chair
(
    id          INTEGER         NOT NULL PRIMARY KEY,
    name        VARCHAR(64)     NOT NULL,
    description VARCHAR(4096)   NOT NULL,
    thumbnail   VARCHAR(128)    NOT NULL,
    price       INTEGER         NOT NULL,
    height      INTEGER         NOT NULL,
    width       INTEGER         NOT NULL,
    depth       INTEGER         NOT NULL,
    color       VARCHAR(64)     NOT NULL,
    features    VARCHAR(64)     NOT NULL,
    kind        VARCHAR(64)     NOT NULL,
    popularity  INTEGER         NOT NULL,
    stock       INTEGER         NOT NULL,
    negative_popularity INTEGER AS (popularity * -1) NOT NULL,
    INDEX price_index (price, id),
    INDEX color_index (color),
    INDEX kind_index (kind),
    INDEX neg_popularity_id_index (negative_popularity, id)
);
