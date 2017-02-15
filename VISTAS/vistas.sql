create view act_5_0372 as select apellidos, nombre, al_act.act, al_act.ce, puntos, pmax 
from al_act, alumno, act_ce 
where al_act.alu = alumno.dni
and act_ce.ce=al_act.ce
and act_ce.modu=al_act.modu
and act_ce.ra=al_act.ra
and act_ce.ud=al_act.ud
and act_ce.act=al_act.act
and al_act.ud='05' and al_act.modu='0372' and al_act.act=5;