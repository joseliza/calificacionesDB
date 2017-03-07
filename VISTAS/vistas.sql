create view act_5_0372 as select apellidos, nombre, al_act.act, al_act.ce, puntos, pmax 
from al_act, alumno, act_ce 
where al_act.alu = alumno.dni
and act_ce.ce=al_act.ce
and act_ce.modu=al_act.modu
and act_ce.ra=al_act.ra
and act_ce.ud=al_act.ud
and act_ce.act=al_act.act
and al_act.ud='05' and al_act.modu='0372' and al_act.act=5;

--PUNTOS JUGADOS EN EN MÓDULO XXXX, RA XX
CREATE OR REPLACE VIEW JUGADOS_0377_04 AS select ce.modu, ce.ra, ce.ce, ce.desc_ce, ce.pmax, sum(nvl(act_ce.pmax,0)) as jugados
from ce, act_ce
where ce.ce = act_ce.ce(+) and ce.ra=act_ce.ra(+) and ce.modu=act_ce.modu(+)
and ce.modu='0377' and ce.ra='04'
group by ce.modu, ce.ra, ce.ce, ce.desc_ce, ce.pmax
order by ce.ce;