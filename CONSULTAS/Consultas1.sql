--INSERTAMOS PARA UNA ACTIVIDAD, UN 0 EN TODAS LAS NOTAS
--PODR�A CONSTRUIRSE UN CURSOR DE TAL FORMA QUE CADA VEZ QUE SE A�ADE A ACT_CE
--UN CE Y SU PUNTUACI�N M�XIMA, A CADA ALUMNO MATRICULADO SE LE INSERTE UN CERO POR DEFECTO
INSERT INTO AL_ACT select DNI, ACT, UD, MATRICULA.MODU, CE, 0, RA FROM ALUMNO, MATRICULA, ACT_CE
WHERE ALUMNO.DNI=MATRICULA.ALU AND MATRICULA.MODU = ACT_CE.MODU
AND MATRICULA.MODU = '0227'
AND UD='05' AND RA='04' and act='02'
ORDER BY APELLIDOS, UD, ACT, CE;
--OTRO DISPARADOR NECESARIO ES QUE UN ALUMNO NO PUEDE TENER M�S NOTA EN UN CE
--QUE EL M�XIMO ESTABLECIDO PARA ESA ACTIVIDAD

--EXTRAEMOS DATOS DE LAS PRUEBAS
select prueba.desc_pru, ud, p.pru, p.modu, p.ra, ce.ce, 0 from prueba, prueba_ud_ce p, ce
where p.ra = ce.ra and p.modu=ce.modu and p.pru=prueba.pru;

--DEBER�AMOS TENER UNA COLUMNA PMAX PARA CADA CRITERIO DE EVALUACI�N. DEBER�A SER OTRA TABLA (CE, RA, MODU, PMAX)