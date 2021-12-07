use optica;
-- monturas vendidas por un empleado en especifico
select e.id_empleado, e.nombre, e.apellido, v.id_gafa, m.tipo_montura
from empleados e
join ventas v
on e.id_empleado = v.id_empleado
join gafas g
on g.id_gafa = v.id_gafa
join monturas m 
on m.id_montura = g.id_montura
where v.fecha between 2021/01/01 and v.fecha <= 2021/12/31
and v.id_empleado = 1;