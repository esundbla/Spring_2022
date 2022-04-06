CREATE DATABASE sample; \c sample \timing DROP TABLE Sample; 

-- replace ? by 1, 2, 3, or 4 depending which file you want to
\COPY Sample (id, rnd) FROM 'C:\Users\13039\Desktop\Activity_12\sample\sample1.csv' DELIMITER ',' CSV HEADER;
\COPY Sample (id, rnd) FROM 'C:\Users\13039\Desktop\Activity_12\sample\sample2.csv' DELIMITER ',' CSV HEADER;
\COPY Sample (id, rnd) FROM 'C:\Users\13039\Desktop\Activity_12\sample\sample3.csv' DELIMITER ',' CSV HEADER;
\COPY Sample (id, rnd) FROM 'C:\Users\13039\Desktop\Activity_12\sample\sample4.csv' DELIMITER ',' CSV HEADER;


CREATE INDEX rnd ON Sample(rnd);

-- make sure you drop the index before timing a new sample
DROP INDEX rnd;

--after loading sample1.csv file: 
SELECT * FROM Sample WHERE rnd = 500;
--after loading sample2.csv file: 
SELECT * FROM Sample WHERE rnd = 50000;
--after loading sample3.csv file: 
SELECT * FROM Sample WHERE rnd = 500000;
--after loading sample4.csv file: 
SELECT * FROM Sample WHERE rnd = 5000000;
