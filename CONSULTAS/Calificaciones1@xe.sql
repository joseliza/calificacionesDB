SELECT * FROM ACTIVIDAD WHERE MODU='0372' AND UD='05';
INSERT INTO ACTIVIDAD VALUES (5, '04', '0377', 'EJERCICIO DE DISPARADORES II',
'22/02/2017', null, '04');
UPDATE ACTIVIDAD A SET A.FECHA_FIN = (SELECT AA.FECHA_INI FROM ACTIVIDAD AA WHERE A.DESC_ACT=AA.DESC_ACT);
WHERE DESC_ACT='EJERCICIO DE DISPARADORES';
UPDATE ACTIVIDAD SET FECHA_INI = NULL WHERE RA='04' AND UD='05' AND MODU='0372';
COMMIT;
DELETE FROM ACT_CE WHERE ACT=1 AND MODU='0377' AND UD='04' AND RA='04';
INSERT INTO ACT_CE VALUES(5, 'H', '0377', 10, '04', '04');

