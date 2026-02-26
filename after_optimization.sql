-- after_optimization.sql
-- Week 8: Indexing + EXPLAIN QUERY PLAN (same queries as before_optimization.sql)

-- Indexes added (supports filter + join paths used in the queries)
CREATE INDEX IF NOT EXISTS idx_subject_race        ON Subject(Subject_Race);
CREATE INDEX IF NOT EXISTS idx_isub_subjectid      ON Instance_Subject(Subject_ID);

-- Q1 (SUBQUERY) + EXPLAIN (before vs after)

-- Q1 BEFORE
EXPLAIN QUERY PLAN
SELECT *
FROM Instance AS i
WHERE i.ID IN(
  SELECT i.ID
  FROM Instance_Subject AS isub
  JOIN Subject AS s
    ON isub.Subject_ID = s.Subject_ID
  WHERE s.Subject_Race = 'White'
)
ORDER BY i.Occurred_date_time;

-- SCAN i
-- The instance table is fully scanned, meaning all rows are read

-- CORRELATED LIST SUBQUERY 1
-- The subquery is correlated and executed for each row of Instance, increasing total execution time.

--SEARCH s USING INDEX idx_subject_race (Subject_Race=?)
--The Subject table uses the idx_subject_race index to filter efficiently by race.

--SEARCH isub USING COVERING INDEX idx_isub_subjectid (Subject_ID=?)
--Instance_Subject uses its index on Subject_ID for efficient lookup.

--USE TEMP B-TREE FOR ORDER BY
--SQLLite creates a temporary structure to sort results, adding additional processing overhead

-- Q1 AFTER
--rewritten to avoid correlated subqueries

EXPLAIN QUERY PLAN
SELECT i.*
FROM Instance AS i
WHERE i.ID IN(
  SELECT isub.ID
  FROM Instance_Subject AS isub
  JOIN Subject AS s
    ON isub.Subject_ID = s.Subject_ID
  WHERE s.Subject_Race = 'White'
)
ORDER BY i.Occurred_date_time;

--SEARCH i USING INDEX sqlite_autoindex_Instance_1 (ID=?)
--Before: Scan i (full table scan)
--After: Instance rows are looked up by the primary key index to avoid a full scan

--LIST SUBQUERY 1
--Before: Correlated list subquery (executed per Instance row)
--After: Subequery is not longer correlated; it is evaluated once to build a list of IDs.

--SEARCH s USING INDEX idx_subject_race (Subject_Race=?)
--Same as before.

--SEARCH isub USING INDEX idx_isub_subjectid (Subject_ID=?)
--Before: used a covering INDEX
--After: uses the index directly for Subject_ID lookups

--USE TEMP B-TREE FOR ORDER BY
--Same as before

-- Q2 (JOIN) + EXPLAIN

EXPLAIN QUERY PLAN
SELECT io.Officer_ID, i.Incident_Num, i.Incident_Type
FROM Instance_Officer AS io
JOIN Instance i
  ON io.ID = i.ID;
  
 --SCAN io
 -- SQLLite scans Instance_Officer, which is acceptable here becasue the query returns all officer-incident links
 --An index would not meaningfully reduce the work.
 
 --SEARCH i USING INDEX sqlite_autoindex_Instance_1 (ID=?)
 --For each io row, SQLite uses the primary-key index on Instance.ID to fetch matching incident data efficiently.
 
 --Why there is no need to optimize further:
 -- This query already uses an index for the join into Instance, and there is no correlated subquery, no filtering, no ORDER/GROUP BY.
 --Adding an index on Instance_Officer(ID) would not improve performance when all io rows my be read anyways.

-- Q3 (JOIN) + EXPLAIN

EXPLAIN QUERY PLAN
SELECT isu.Subject_ID, io.Officer_ID, io.ID
FROM Instance_Subject AS isu
JOIN Instance_Officer io
  ON isu.ID = io.ID;
  
-- SCAN isu
-- SQLite scans Instance_Subject. This is expected because the query retrieves all subject–incident relationships and does not include a WHERE filter that would allow row reduction through an index.

-- SEARCH io USING COVERING INDEX sqlite_autoindex_Instance_Officer_1 (ID=?)
-- SQLite uses the automatically created primary-key index on Instance_Officer to perform efficient lookups by ID. The "covering index" means all required columns are satisfied directly from the index without reading the full table.

-- Why we did not optimize further:
-- The join is already index-supported and there is no filtering, ordering, or aggregation that would benefit from additional indexes.
-- Since the query intentionally returns all rows, scanning Instance_Subject is appropriate and adding indexes would not significantly improve performance.