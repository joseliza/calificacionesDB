SELECT ACT, RA, UD, MODU FROM ACT_CE WHERE UD='06' AND MODU='0227' ORDER BY ACT;
UPDATE ACT_CE SET UD='06' WHERE UD='06' AND ACT=6 AND MODU='0227';
COMMIT;
SELECT * FROM ACT_CE WHERE MODU=0227 AND UD=06 AND ACT=4;
INSERT INTO ACT_CE VALUES (4, 'D', '0227', 10, '06', '05');

