-- TODO: add a comment section with the names of the team members of the project (limited to 2). You are allowed to work solo as well. 
-- Erik Sundblad Project 2 SQL submission 

-- TODOd: create the cms database
CREATE DATABASE cms;

-- TODOd: "open" the database for use
\c cms

-- TODO: (optional) drop all table
DROP TABLE IF EXISTS Provider;
DROP TABLE IF EXISTS ProviderState;
DROP TABLE IF EXISTS ProviderZip;
DROP TABLE IF EXISTS RUCA;
DROP TABLE IF EXISTS ProviderDiagnosIs;
DROP TABLE IF EXISTS Diagnosis;
DROP TABLE IF EXISTS DiagnosisStats;



-- TODO: create all tables (with primary keys, NULL constraints, and foreign keys)
CREATE TABLE Provider(
    Rndrng_CCN INT NOT NULL,
    Rndrng_Prvdr_Org_Name VARCHAR(200),
    Rndrng_Prvdr_St VARCHAR(100),
    Rndrng_Prvdr_City VARCHAR(100),
    PRIMARY KEY (Rndrng_CCN)
);

CREATE TABLE ProviderState(
    Rndrng_CCN INT PRIMARY KEY,
    Rndrng_Prvdr_State_abrvtn CHAR(2),
    Rndrng_Prvdr_State_FIPS INT,
    FOREIGN KEY (Rndrng_CCN) REFERENCES Provider (Rndrng_CCN)
);

CREATE TABLE RUCA(
    Rndrng_Prvdr_RUCA FLOAT PRIMARY KEY,
    Rndrng_Prvdr_RUCA_Desc VARCHAR(300)
);

CREATE TABLE ProviderZip(
    Rndrng_CCN INT,
    Rndrng_zip5 INT,
    Rndrng_Prvdr_RUCA FLOAT,
    PRIMARY KEY (Rndrng_CCN),
    FOREIGN KEY (Rndrng_CCN) REFERENCES Provider (Rndrng_CCN),
    FOREIGN KEY (Rndrng_Prvdr_RUCA) REFERENCES RUCA (Rndrng_Prvdr_RUCA)
);

CREATE TABLE Diagnosis(
    DRG_Cd INT PRIMARY KEY,
    DRG_Desc VARCHAR(300)
);

CREATE TABLE ProviderDiagnosis(
    Rndrng_CCN INT,
    DRG_Cd INT,
    PRIMARY KEY (Rndrng_CCN, DRG_Cd),
    FOREIGN KEY (DRG_Cd) REFERENCES Diagnosis (DRG_Cd),
    FOREIGN KEY (Rndrng_CCN) REFERENCES Provider (Rndrng_CCN)
);

CREATE TABLE DiagnosisStats(
    DRG_Cd INT PRIMARY KEY,
    Tot_Dschrgs INT,
    Avg_Submtd_Cvrd_Chrg FLOAT,
    Avg_Tot_Pymt_Amt FLOAT,
    Avg_Mdcr_pymt_Amt FLOAT,
    FOREIGN KEY (DRG_Cd) REFERENCES Diagnosis (DRG_Cd)
);
-- TODO: create users
CREATE USER "cms_admin" PASSWORD 'CMS355!';
CREATE USER "cms" PASSWORD 'CMS472!';

-- TODO: grant access to users
GRANT SELECT ON ALL TABLES IN SCHEMA public TO "cms";
GRANT ALL ON ALL TABLES IN SCHEMA public TO "cms_admin";

-- TODO: answer all queries

-- a) List all diagnostic names in alphabetical order.   
SELECT DRG_Desc FROM Diagnosis ORDER BY DRG_Desc;
-- b) List the names and correspondent states (including Washington D.C.) of all of the providers in alphabetical order (state first, provider name next, no repetition).   
SELECT DISTINCT A.Rndrng_Prvdr_State_abrvtn, B.Rndrng_Prvdr_Org_Name FROM ProviderState A INNER JOIN Provider B on A.Rndrng_CCN = B.Rndrng_CCN ORDER BY B.Rndrng_Prvdr_Org_Name;
-- c) List the total number of providers.  
SELECT COUNT(*) as Providers FROM Provider;
-- d) List the total number of providers per state (including Washington D.C.) in alphabetical order (also printing out the state). 
SELECT Rndrng_Prvdr_State_abrvtn, COUNT(*) AS Providers FROM ProviderState GROUP BY Rndrng_Prvdr_State_abrvtn ORDER BY Rndrng_Prvdr_State_abrvtn;
-- e) List the providers names in Denver (CO) or in Lakewood (CO) in alphabetical order
SELECT Rndrng_Prvdr_Org_Name, Rndrng_Prvdr_City FROM Provider WHERE Rndrng_Prvdr_City = 'Lakewood' OR Rndrng_Prvdr_City = 'Denver' ORDER BY Rndrng_Prvdr_Org_Name;  
-- f) List the number of providers per RUCA code (showing the code and description)
SELECT COUNT(A.Rndrng_Prvdr_RUCA), B.Rndrng_Prvdr_RUCA, B.Rndrng_Prvdr_RUCA_Desc FROM ProviderZip A INNER JOIN RUCA B ON A.Rndrng_Prvdr_RUCA = B.Rndrng_Prvdr_RUCA GROUP BY B.Rndrng_Prvdr_RUCA;
-- g) Show the DRG description for code 308
SELECT DRG_Desc FROM Diagnosis WHERE DRG_Cd = 308;
-- h) List the top 10 providers (with their correspondent state) that charged (as described in Avg_Submtd_Cvrd_Chrg) the most for the DRG code 308. Output should display the provider name, their city, state, and the average charged amount in descending order.  
SELECT A.Rndrng_Prvdr_Org_Name, A.Rndrng_Prvdr_City, B.Rndrng_Prvdr_State_abrvtn, C.Avg_Submtd_Cvrd_Chrg FROM Provider A INNER JOIN ProviderState B ON A.Rndrng_CCN = B.Rndrng_CCN INNER JOIN ProviderDiagnosis D ON A.Rndrng_CCN = D.Rndrng_CCN INNER JOIN DiagnosisStats C ON D.DRG_Cd = C.DRG_Cd WHERE D.DRG_Cd = 308 ORDER BY C.Avg_Submtd_Cvrd_Chrg DESC LIMIT 10;
-- i) List the average charges (as described in Avg_Submtd_Cvrd_Chrg) of all providers per state for the DRG code 308. Output should display the state and the average charged amount per state in descending order (of the charged amount) using only two decimals.   
SELECT A.Rndrng_Prvdr_State_abrvtn, ROUND(cast(AVG(C.Avg_Submtd_Cvrd_Chrg) AS NUMERIC), 2) FROM ProviderState A INNER JOIN ProviderDiagnosis B ON A.Rndrng_CCN = B.Rndrng_CCN INNER JOIN DiagnosisStats C ON B.DRG_Cd = C.DRG_Cd Where B.DRG_Cd = 308 GROUP BY A.Rndrng_Prvdr_State_abrvtn ORDER BY ROUND DESC;
-- j) Which provider and clinical condition pair had the highest difference between the amount charged (as described in Avg_Submtd_Cvrd_Chrg) and the amount covered by Medicare only (as described in Avg_Mdcr_Pymt_Amt)?  
SELECT A.Rndrng_Prvdr_Org_Name, E.DRG_Desc, (C.Avg_Submtd_Cvrd_Chrg - C.Avg_Mdcr_Pymt_Amt) AS DIF FROM Provider A INNER JOIN ProviderDiagnosis B ON A.Rndrng_CCN = B.Rndrng_CCN INNER JOIN Diagnosis E ON B.DRG_Cd = E.DRG_Cd INNER JOIN DiagnosisStats C ON B.DRG_Cd = C.DRG_Cd ORDER BY DIF DESC LIMIT 1;
-- TODO (optional) - BONUS POINTS: prove that you didn't do the normalization only using your "guts" but also what you learned in class; show all 2NF or 3NF violations and normalization steps in detail and you will get up to +10 points.
