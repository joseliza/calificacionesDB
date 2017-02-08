CREATE TABLESPACE CALIFICACIONES1
DATAFILE
  'C:\ORACLEXE\EJEMPLOS\CALIFICACIONES1\CALIFICACIONES1-1.ORA' SIZE 1 M,
  'C:\ORACLEXE\EJEMPLOS\CALIFICACIONES1\CALIFICACIONES1-2.ORA' SIZE 500 K
DEFAULT STORAGE (INITIAL 10K NEXT 10K PCTINCREASE 25);

CREATE USER CALIFICACIONES1
IDENTIFIED BY CALIFICACIONES1
DEFAULT TABLESPACE CALIFICACIONES1
QUOTA UNLIMITED ON CALIFICACIONES1;

GRANT DBA TO CALIFICACIONES1;

CONN CALIFICACIONES1/calificaciones1;

alter user CALIFICACIONES1 IDENTIFIED BY calificaciones1;