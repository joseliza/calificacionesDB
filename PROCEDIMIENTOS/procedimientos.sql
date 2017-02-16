--1. Crear un procedimiento llamado PON_AL_ACT que se encargue de añadir una actividad (con todos
--sus CE) a un alumno que se pase como parámetro (se pasará el DNI). Una vez creado
--el disparador 1, todo alumno nuevo tendrá su correspondiente entrada en AL_ACT, así que
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

--2. Crear un procedimiento llamado PON_AL_PRU que se encargue de añadir una prueba (con todos
--sus CE) a un alumno que se pase como parámetro (se pasará el DNI).

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