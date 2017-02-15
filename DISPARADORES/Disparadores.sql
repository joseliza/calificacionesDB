-- CREAMOS UN DISPARADOR QUE SE ENCARGA DE ASOCIAR A UN ALUMNO A CADA
-- UNO DE LOS CRITERIOS DE EVALUACI�N DE UNA ACTIVIDAD
CREATE OR REPLACE TRIGGER PON_AL_ACT
AFTER INSERT ON ACT_CE
FOR EACH ROW
DECLARE
  CURSOR CUR_ALUMNOS IS SELECT A.DNI, M.MODU FROM ALUMNO A, MATRICULA M
  WHERE A.DNI=M.ALU;
BEGIN
  FOR V_ALU IN CUR_ALUMNOS LOOP
    IF V_ALU.MODU = :NEW.MODU THEN
      INSERT INTO AL_ACT (ALU,ACT,UD,MODU,CE,RA) VALUES
      (V_ALU.DNI, :NEW.ACT, :NEW.UD, :NEW.MODU, :NEW.CE, :NEW.RA);
    END IF;
  END LOOP;
END;
/

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

--1. Crear un procedimiento llamado PON_AL_PRU que se encargue de a�adir una prueba (con todos
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
