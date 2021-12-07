use pizzeria;
-- pedidos hechos por un empleado en especifico
select e.id_empleado, e.nombre, e.apellido, ed.id_pedido
from empleados e
join entrega_domicilio ed
on e.id_empleado = ed.id_empleado
where ed.id_empleado = 1;