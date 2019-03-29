
CREATE TABLE bookmarks (
    id integer NOT NULL,
    url character varying(60),
    title character varying(60)
);


CREATE SEQUENCE bookmarks_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
