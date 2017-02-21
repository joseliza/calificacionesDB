--1. Crear un procedimiento llamado PON_AL_ACT que se encargue de a�adir una actividad (con todos
--sus CE) a un alumno que se pase como par�metro (se pasar� el DNI). Una vez creado
--el disparador 1, todo alumno nuevo tendr� su correspondiente entrada en AL_ACT, as� que
--este procedimiento sirve para aquellos alumnos que ya estuviesen en la BD antes de crear el
--disparador.
CREATE OR REPLACE PROCEDURE PON_AL_ACT (V_DNI CHAR)
AS
  CURSOR CUR_ACT IS SELECT ACT, CE, ACT_CE.MODU, UD, RA FROM ACT_CE, MATRICULA M
  WHERE M.MODU = ACT_CE.MODU AND M.ALU = V_DNI;
BEGIN
  FOR V_ACT IN CUR_ACT LOOP
    INSERT INTO AL_ACT (ALU,ACT,UD,MODU,CE,RA) VALUES
      (V_DNI, V_ACT.ACT, V_ACT.UD, V_ACT.MODU, V_ACT.CE, V_ACT.RA);
  END LOOP;
END;
/

--2. Crear un procedimiento llamado PON_AL_PRU que se encargue de a�adir una prueba (con todos
--sus CE) a un alumno que se pase como par�metro (se pasar� el DNI).

CREATE OR REPLACE PROCEDURE PON_AL_PRU (V_DNI CHAR)
AS
  CURSOR CUR_PRU IS SELECT PRU, CE, PRU_UD_CE.MODU, UD, RA FROM PRU_UD_CE, MATRICULA M
  WHERE M.MODU = PRU_UD_CE.MODU AND M.ALU = V_DNI;
BEGIN
  FOR V_PRU IN CUR_PRU LOOP
    INSERT INTO AL_PRU (ALU,PRU,CE,RA,MODU) VALUES
      (V_DNI, V_PRU.PRU, V_PRU.CE, V_PRU.RA, V_PRU.MODU);
  END LOOP;
END;
/

--3. Crear un procedimiento llamado PUNTOS al que se le pase como par�metros MOD y UD y muestre los puntos totales obtenidos
--por el alumnado

CREATE OR REPLACE PROCEDURE PUNTOS (v_mod char, v_ud char, V_RA CHAR)
AS
  CURSOR C_PUNTOS_ACT IS SELECT DNI, NOMBRE, APELLIDOS, SUM(PUNTOS) AS PUNTOS FROM AL_ACT AA, ALUMNO A
	WHERE A.DNI=AA.ALU AND AA.MODU=V_MOD AND UD=V_UD
	GROUP BY NOMBRE, APELLIDOS, DNI
	ORDER BY APELLIDOS, NOMBRE
  CURSOR C_PUNTOS_PRU IS SELECT DNI, NOMBRE, APELLIDOS, SUM(PUNTOS) AS PUNTOS FROM AL_PRU AP, ALUMNO A
	WHERE A.DNI=AP.ALU
	AND AP.MODU=V_MOD AND RA=V_RA
	GROUP BY NOMBRE, APELLIDOS, DNI
	ORDER BY APELLIDOS, NOMBRE
BEGIN
  FOR V_ACT IN C_PUNTOS_ACT LOOP
  	FOR V_PRU IN C_PUNTOS_PRU LOOP
    	INSERT INTO TOTAL_PUNTOS VALUES (V_ACT.APELLIDOS ||' '|| V_ACT.APELLIDOS ||V_ACT.PUNTOS+V_PRU.PUNTOS ||' PUNTOS');
	END LOOP;
  END LOOP;
END;
/








