use pizzeria;
-- bebidas vendidas en una localidad
select bp.id_bebida, bp.nombre, t.id_localidad, loc.nombre, p.cantidad_bebida
from bebida_producto bp
join pedidos p
on p.id_bebida = bp.id_bebida or p.id_bebida_2 = bp.id_bebida
join tiendas t
on t.id_tienda = p.id_tienda
join localidades loc
on loc.id_localidad = t.id_localidad
where t.id_localidad = 2;
