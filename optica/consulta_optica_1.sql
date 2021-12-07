use optica;

-- facturas del cliente 1, en un periodo de igual o mayor al 2021/12/01
select c.nombre, c.apellido, v.fecha, v.id_empleado, v.id_gafa, g.precio
from clientes c
join ventas v
on c.id_cliente = v.id_cliente 
join gafas g
on v.id_gafa = g.id_gafa
where v.fecha >= 2021/12/01
and c.id_cliente = 1;





