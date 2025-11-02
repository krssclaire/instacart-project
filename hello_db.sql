CREATE TABLE test_table (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50)
);

INSERT INTO test_table (name)
VALUES ('K la studentessa spaziale'), ('Mission PostgreSQL');

SELECT * FROM test_table;
