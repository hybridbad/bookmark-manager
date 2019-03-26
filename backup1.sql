
CREATE TABLE bookmarks (
    id integer NOT NULL,
    url character varying(60)
);

CREATE SEQUENCE public.bookmarks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

COPY public.bookmarks (id, url) FROM stdin;
1	http://makers.tech
2	http://www.google.com
4	http://www.twitter.com
5	http://www.pistonheads.com
6	http://www.bbc.co.uk
\.
