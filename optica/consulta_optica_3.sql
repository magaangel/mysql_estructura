use optica;
-- gafas que han sido vendidas y su proveedor
 select p.nombre, p.NIF, v.id_gafa, g.marca
 from proveedores p
 join gafas g
 on p.id_proveedor = g.id_proveedor
 join ventas v
 on g.id_gafa = v.id_gafa
 