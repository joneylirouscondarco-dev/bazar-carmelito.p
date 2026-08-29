-- =========================================================
-- DATOS INICIALES
-- BAZAR CARMELITO
-- =========================================================

PRAGMA foreign_keys = ON;

-- =========================================================
-- 1. NEGOCIO
-- =========================================================

INSERT INTO negocio (
    id_negocio,
    nombre,
    nit,
    telefono,
    email,
    direccion,
    ciudad,
    pais,
    fecha_registro,
    estado
)
VALUES (
    'NEG001',
    'Bazar Carmelito',
    '123456789',
    '72012345',
    'bazarcarmelito@gmail.com',
    'Av. Principal Nro. 125',
    'La Paz',
    'Bolivia',
    '2026-08-01',
    1
);


-- =========================================================
-- 2. CATEGORIAS
-- =========================================================

INSERT INTO categoria (
    id_categoria,
    nombre,
    descripcion,
    id_categoria_padre,
    estado
)
VALUES
(
    'CAT001',
    'Papeleria',
    'Material escolar y de escritorio',
    NULL,
    1
),
(
    'CAT002',
    'Juguetes',
    'Juguetes y productos recreativos',
    NULL,
    1
);


-- =========================================================
-- 3. PRESENTACIONES
-- =========================================================

INSERT INTO presentacion (
    id_presentacion,
    nombre,
    descripcion,
    estado
)
VALUES
(
    'PRE001',
    'Unidad',
    'Producto vendido individualmente',
    1
),
(
    'PRE002',
    'Paquete',
    'Producto vendido por paquete',
    1
),
(
    'PRE003',
    'Caja',
    'Producto vendido por caja',
    1
);


-- =========================================================
-- 4. MARCAS
-- =========================================================

INSERT INTO marca (
    id_marca,
    nombre,
    descripcion,
    estado
)
VALUES
(
    'MAR001',
    'Faber-Castell',
    'Marca de articulos escolares',
    1
),
(
    'MAR002',
    'Artesco',
    'Marca de utiles escolares y oficina',
    1
),
(
    'MAR003',
    'Generico',
    'Productos sin una marca especifica',
    1
);


-- =========================================================
-- 5. ROL
-- =========================================================

INSERT INTO rol (
    id_rol,
    nombre,
    descripcion,
    estado
)
VALUES
(
    'ROL001',
    'Administrador',
    'Acceso completo al sistema',
    1
);


-- =========================================================
-- 6. USUARIO
-- =========================================================

INSERT INTO usuario (
    id_usuario,
    nombres,
    apellidos,
    nombre_usuario,
    email,
    password_hash,
    id_rol,
    fecha_registro,
    ultimo_acceso,
    estado
)
VALUES
(
    'U001',
    'Carlos',
    'Mendoza',
    'cmendoza',
    'carlos@bazar.com',
    'hash_prueba_001',
    'ROL001',
    '2026-08-01 08:00:00',
    NULL,
    1
);


-- =========================================================
-- 7. PROVEEDORES
-- =========================================================

INSERT INTO proveedor (
    id_proveedor,
    nombre,
    nombre_contacto,
    telefono,
    email,
    direccion,
    nit,
    fecha_registro,
    estado
)
VALUES
(
    'PR001',
    'Distribuidora Escolar La Paz',
    'Juan Perez',
    '72098765',
    'ventas@distribuidora.com',
    'Calle Comercio 250',
    '456789012',
    '2026-08-01',
    1
),
(
    'PR002',
    'Importadora Juguetes Bolivia',
    'Ana Flores',
    '76543211',
    'ventas@juguetesbolivia.com',
    'Av. Central 450',
    '789456123',
    '2026-08-01',
    1
);


-- =========================================================
-- 8. PRODUCTOS
-- =========================================================

INSERT INTO producto (
    id_producto,
    codigo,
    codigo_barras,
    nombre,
    descripcion,
    id_categoria,
    id_presentacion,
    id_marca,
    estado,
    fecha_registro,
    fecha_actualizacion
)
VALUES
(
    'P001',
    'PAP-0001',
    '7891234567890',
    'Cuaderno universitario 100 hojas',
    'Cuaderno universitario de 100 hojas cuadriculadas',
    'CAT001',
    'PRE001',
    'MAR003',
    1,
    '2026-08-01 09:00:00',
    '2026-08-01 09:00:00'
),
(
    'P002',
    'PAP-0002',
    '7891234567891',
    'Boligrafo azul',
    'Boligrafo de tinta azul',
    'CAT001',
    'PRE001',
    'MAR001',
    1,
    '2026-08-01 09:05:00',
    '2026-08-01 09:05:00'
),
(
    'P003',
    'PAP-0003',
    '7891234567892',
    'Lapiz negro',
    'Lapiz de grafito para escritura',
    'CAT001',
    'PRE001',
    'MAR001',
    1,
    '2026-08-01 09:10:00',
    '2026-08-01 09:10:00'
),
(
    'P004',
    'JUG-0001',
    '7891234567893',
    'Rompecabezas infantil',
    'Rompecabezas educativo para ninos',
    'CAT002',
    'PRE001',
    'MAR003',
    1,
    '2026-08-01 09:15:00',
    '2026-08-01 09:15:00'
),
(
    'P005',
    'JUG-0002',
    '7891234567894',
    'Pelota pequena',
    'Pelota recreativa infantil',
    'CAT002',
    'PRE001',
    'MAR003',
    1,
    '2026-08-01 09:20:00',
    '2026-08-01 09:20:00'
);


-- =========================================================
-- 9. RELACION PRODUCTO - PROVEEDOR
-- =========================================================

INSERT INTO producto_proveedor (
    id_producto_proveedor,
    id_producto,
    id_proveedor,
    codigo_proveedor,
    precio_referencia,
    tiempo_entrega_estimado,
    estado
)
VALUES
(
    'PPROV001',
    'P001',
    'PR001',
    'CUAD-100',
    10.00,
    3,
    1
),
(
    'PPROV002',
    'P002',
    'PR001',
    'BOL-AZUL',
    2.50,
    3,
    1
),
(
    'PPROV003',
    'P003',
    'PR001',
    'LAP-N',
    1.50,
    3,
    1
),
(
    'PPROV004',
    'P004',
    'PR002',
    'ROM-01',
    25.00,
    5,
    1
),
(
    'PPROV005',
    'P005',
    'PR002',
    'PEL-01',
    12.00,
    5,
    1
);
-- =========================================================
-- PASO 8
-- PRIMERA COMPRA E INVENTARIO INICIAL
-- =========================================================

PRAGMA foreign_keys = ON;

-- =========================================================
-- 10. REGISTRAR COMPRA
-- =========================================================

INSERT INTO compra (
    id_compra,
    id_proveedor,
    id_usuario,
    fecha_compra,
    numero_documento,
    subtotal,
    descuento_total,
    total,
    estado,
    observacion
)
VALUES
(
    'CO001',
    'PR001',
    'U001',
    '2026-08-01 10:00:00',
    'FAC-00125',
    910.00,
    0.00,
    910.00,
    'Completada',
    'Compra inicial de productos de papeleria'
);

INSERT INTO compra (
    id_compra,
    id_proveedor,
    id_usuario,
    fecha_compra,
    numero_documento,
    subtotal,
    descuento_total,
    total,
    estado,
    observacion
)
VALUES
(
    'CO002',
    'PR002',
    'U001',
    '2026-08-01 11:00:00',
    'FAC-00126',
    860.00,
    0.00,
    860.00,
    'Completada',
    'Compra inicial de juguetes'
);


-- =========================================================
-- 11. DETALLE DE COMPRA
-- =========================================================

-- Compra CO001 - Papeleria

INSERT INTO detalle_compra (
    id_detalle_compra,
    id_compra,
    id_producto,
    cantidad,
    precio_unitario,
    descuento,
    subtotal
)
VALUES
(
    'DC001',
    'CO001',
    'P001',
    50,
    10.00,
    0.00,
    500.00
);

INSERT INTO detalle_compra (
    id_detalle_compra,
    id_compra,
    id_producto,
    cantidad,
    precio_unitario,
    descuento,
    subtotal
)
VALUES
(
    'DC002',
    'CO001',
    'P002',
    100,
    2.50,
    0.00,
    250.00
);

INSERT INTO detalle_compra (
    id_detalle_compra,
    id_compra,
    id_producto,
    cantidad,
    precio_unitario,
    descuento,
    subtotal
)
VALUES
(
    'DC003',
    'CO001',
    'P003',
    80,
    2.00,
    0.00,
    160.00
);


-- Compra CO002 - Juguetes

INSERT INTO detalle_compra (
    id_detalle_compra,
    id_compra,
    id_producto,
    cantidad,
    precio_unitario,
    descuento,
    subtotal
)
VALUES
(
    'DC004',
    'CO002',
    'P004',
    20,
    25.00,
    0.00,
    500.00
);

INSERT INTO detalle_compra (
    id_detalle_compra,
    id_compra,
    id_producto,
    cantidad,
    precio_unitario,
    descuento,
    subtotal
)
VALUES
(
    'DC005',
    'CO002',
    'P005',
    30,
    12.00,
    0.00,
    360.00
);


-- =========================================================
-- 12. INVENTARIO INICIAL
-- =========================================================

INSERT INTO inventario (
    id_inventario,
    id_producto,
    stock_actual,
    stock_minimo,
    stock_maximo,
    ultima_actualizacion
)
VALUES
(
    'INV001',
    'P001',
    50,
    10,
    100,
    '2026-08-01 10:05:00'
),
(
    'INV002',
    'P002',
    100,
    20,
    200,
    '2026-08-01 10:05:00'
),
(
    'INV003',
    'P003',
    80,
    15,
    150,
    '2026-08-01 10:05:00'
),
(
    'INV004',
    'P004',
    20,
    5,
    50,
    '2026-08-01 11:05:00'
),
(
    'INV005',
    'P005',
    30,
    5,
    60,
    '2026-08-01 11:05:00'
);


-- =========================================================
-- 13. TIPOS DE MOVIMIENTO
-- =========================================================

INSERT INTO tipo_movimiento (
    id_tipo_movimiento,
    nombre,
    naturaleza,
    descripcion,
    estado
)
VALUES
(
    'TM001',
    'Compra',
    'ENTRADA',
    'Entrada de productos por compra',
    1
),
(
    'TM002',
    'Venta',
    'SALIDA',
    'Salida de productos por venta',
    1
);


-- =========================================================
-- 14. MOVIMIENTOS DE INVENTARIO
-- =========================================================

INSERT INTO movimiento_inventario (
    id_movimiento_inventario,
    id_producto,
    id_tipo_movimiento,
    cantidad,
    stock_anterior,
    stock_posterior,
    fecha_movimiento,
    id_usuario,
    id_venta,
    id_compra,
    observacion
)
VALUES
(
    'MI001',
    'P001',
    'TM001',
    50,
    0,
    50,
    '2026-08-01 10:05:00',
    'U001',
    NULL,
    'CO001',
    'Ingreso inicial por compra'
),
(
    'MI002',
    'P002',
    'TM001',
    100,
    0,
    100,
    '2026-08-01 10:05:00',
    'U001',
    NULL,
    'CO001',
    'Ingreso inicial por compra'
),
(
    'MI003',
    'P003',
    'TM001',
    80,
    0,
    80,
    '2026-08-01 10:05:00',
    'U001',
    NULL,
    'CO001',
    'Ingreso inicial por compra'
),
(
    'MI004',
    'P004',
    'TM001',
    20,
    0,
    20,
    '2026-08-01 11:05:00',
    'U001',
    NULL,
    'CO002',
    'Ingreso inicial por compra'
),
(
    'MI005',
    'P005',
    'TM001',
    30,
    0,
    30,
    '2026-08-01 11:05:00',
    'U001',
    NULL,
    'CO002',
    'Ingreso inicial por compra'
);
-- =========================================================
-- PASO 9
-- REGISTRO DE VENTAS Y SALIDAS DE INVENTARIO
-- =========================================================

PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;


-- =========================================================
-- VENTA 1
-- 05 DE AGOSTO
-- =========================================================

INSERT INTO venta (
    id_venta,
    numero_venta,
    fecha_venta,
    hora_venta,
    id_usuario,
    subtotal,
    descuento_total,
    total,
    estado,
    observacion
)
VALUES (
    'V001',
    'V-000001',
    '2026-08-05',
    '10:35:00',
    'U001',
    41.00,
    0.00,
    41.00,
    'Completada',
    'Venta de mostrador'
);


INSERT INTO detalle_venta (
    id_detalle_venta,
    id_venta,
    id_producto,
    cantidad,
    precio_unitario,
    descuento,
    subtotal
)
VALUES
(
    'DV001',
    'V001',
    'P001',
    2,
    15.00,
    0.00,
    30.00
),
(
    'DV002',
    'V001',
    'P002',
    2,
    5.50,
    0.00,
    11.00
);


-- Descontar inventario

UPDATE inventario
SET
    stock_actual = 48,
    ultima_actualizacion = '2026-08-05 10:36:00'
WHERE id_producto = 'P001';

UPDATE inventario
SET
    stock_actual = 98,
    ultima_actualizacion = '2026-08-05 10:36:00'
WHERE id_producto = 'P002';


-- Movimientos de salida

INSERT INTO movimiento_inventario (
    id_movimiento_inventario,
    id_producto,
    id_tipo_movimiento,
    cantidad,
    stock_anterior,
    stock_posterior,
    fecha_movimiento,
    id_usuario,
    id_venta,
    id_compra,
    observacion
)
VALUES
(
    'MI006',
    'P001',
    'TM002',
    2,
    50,
    48,
    '2026-08-05 10:36:00',
    'U001',
    'V001',
    NULL,
    'Salida por venta V-000001'
),
(
    'MI007',
    'P002',
    'TM002',
    2,
    100,
    98,
    '2026-08-05 10:36:00',
    'U001',
    'V001',
    NULL,
    'Salida por venta V-000001'
);


-- =========================================================
-- VENTA 2
-- 08 DE AGOSTO
-- =========================================================

INSERT INTO venta (
    id_venta,
    numero_venta,
    fecha_venta,
    hora_venta,
    id_usuario,
    subtotal,
    descuento_total,
    total,
    estado,
    observacion
)
VALUES (
    'V002',
    'V-000002',
    '2026-08-08',
    '15:20:00',
    'U001',
    105.00,
    0.00,
    105.00,
    'Completada',
    'Venta de mostrador'
);


INSERT INTO detalle_venta (
    id_detalle_venta,
    id_venta,
    id_producto,
    cantidad,
    precio_unitario,
    descuento,
    subtotal
)
VALUES
(
    'DV003',
    'V002',
    'P001',
    5,
    15.00,
    0.00,
    75.00
),
(
    'DV004',
    'V002',
    'P003',
    10,
    3.00,
    0.00,
    30.00
);


UPDATE inventario
SET
    stock_actual = 43,
    ultima_actualizacion = '2026-08-08 15:21:00'
WHERE id_producto = 'P001';

UPDATE inventario
SET
    stock_actual = 70,
    ultima_actualizacion = '2026-08-08 15:21:00'
WHERE id_producto = 'P003';


INSERT INTO movimiento_inventario (
    id_movimiento_inventario,
    id_producto,
    id_tipo_movimiento,
    cantidad,
    stock_anterior,
    stock_posterior,
    fecha_movimiento,
    id_usuario,
    id_venta,
    id_compra,
    observacion
)
VALUES
(
    'MI008',
    'P001',
    'TM002',
    5,
    48,
    43,
    '2026-08-08 15:21:00',
    'U001',
    'V002',
    NULL,
    'Salida por venta V-000002'
),
(
    'MI009',
    'P003',
    'TM002',
    10,
    80,
    70,
    '2026-08-08 15:21:00',
    'U001',
    'V002',
    NULL,
    'Salida por venta V-000002'
);


-- =========================================================
-- VENTA 3
-- 12 DE AGOSTO
-- =========================================================

INSERT INTO venta (
    id_venta,
    numero_venta,
    fecha_venta,
    hora_venta,
    id_usuario,
    subtotal,
    descuento_total,
    total,
    estado,
    observacion
)
VALUES (
    'V003',
    'V-000003',
    '2026-08-12',
    '11:10:00',
    'U001',
    154.50,
    0.00,
    154.50,
    'Completada',
    'Venta de mostrador'
);


INSERT INTO detalle_venta (
    id_detalle_venta,
    id_venta,
    id_producto,
    cantidad,
    precio_unitario,
    descuento,
    subtotal
)
VALUES
(
    'DV005',
    'V003',
    'P002',
    15,
    5.50,
    0.00,
    82.50
),
(
    'DV006',
    'V003',
    'P005',
    4,
    18.00,
    0.00,
    72.00
);


UPDATE inventario
SET
    stock_actual = 83,
    ultima_actualizacion = '2026-08-12 11:11:00'
WHERE id_producto = 'P002';

UPDATE inventario
SET
    stock_actual = 26,
    ultima_actualizacion = '2026-08-12 11:11:00'
WHERE id_producto = 'P005';


INSERT INTO movimiento_inventario (
    id_movimiento_inventario,
    id_producto,
    id_tipo_movimiento,
    cantidad,
    stock_anterior,
    stock_posterior,
    fecha_movimiento,
    id_usuario,
    id_venta,
    id_compra,
    observacion
)
VALUES
(
    'MI010',
    'P002',
    'TM002',
    15,
    98,
    83,
    '2026-08-12 11:11:00',
    'U001',
    'V003',
    NULL,
    'Salida por venta V-000003'
),
(
    'MI011',
    'P005',
    'TM002',
    4,
    30,
    26,
    '2026-08-12 11:11:00',
    'U001',
    'V003',
    NULL,
    'Salida por venta V-000003'
);


-- =========================================================
-- VENTA 4
-- 18 DE AGOSTO
-- =========================================================

INSERT INTO venta (
    id_venta,
    numero_venta,
    fecha_venta,
    hora_venta,
    id_usuario,
    subtotal,
    descuento_total,
    total,
    estado,
    observacion
)
VALUES (
    'V004',
    'V-000004',
    '2026-08-18',
    '16:00:00',
    'U001',
    156.00,
    0.00,
    156.00,
    'Completada',
    'Venta de mostrador'
);


INSERT INTO detalle_venta (
    id_detalle_venta,
    id_venta,
    id_producto,
    cantidad,
    precio_unitario,
    descuento,
    subtotal
)
VALUES
(
    'DV007',
    'V004',
    'P004',
    3,
    40.00,
    0.00,
    120.00
),
(
    'DV008',
    'V004',
    'P003',
    12,
    3.00,
    0.00,
    36.00
);


UPDATE inventario
SET
    stock_actual = 17,
    ultima_actualizacion = '2026-08-18 16:01:00'
WHERE id_producto = 'P004';

UPDATE inventario
SET
    stock_actual = 58,
    ultima_actualizacion = '2026-08-18 16:01:00'
WHERE id_producto = 'P003';


INSERT INTO movimiento_inventario (
    id_movimiento_inventario,
    id_producto,
    id_tipo_movimiento,
    cantidad,
    stock_anterior,
    stock_posterior,
    fecha_movimiento,
    id_usuario,
    id_venta,
    id_compra,
    observacion
)
VALUES
(
    'MI012',
    'P004',
    'TM002',
    3,
    20,
    17,
    '2026-08-18 16:01:00',
    'U001',
    'V004',
    NULL,
    'Salida por venta V-000004'
),
(
    'MI013',
    'P003',
    'TM002',
    12,
    70,
    58,
    '2026-08-18 16:01:00',
    'U001',
    'V004',
    NULL,
    'Salida por venta V-000004'
);


-- =========================================================
-- VENTA 5
-- 25 DE AGOSTO
-- =========================================================

INSERT INTO venta (
    id_venta,
    numero_venta,
    fecha_venta,
    hora_venta,
    id_usuario,
    subtotal,
    descuento_total,
    total,
    estado,
    observacion
)
VALUES (
    'V005',
    'V-000005',
    '2026-08-25',
    '14:30:00',
    'U001',
    338.00,
    0.00,
    338.00,
    'Completada',
    'Venta de mostrador'
);


INSERT INTO detalle_venta (
    id_detalle_venta,
    id_venta,
    id_producto,
    cantidad,
    precio_unitario,
    descuento,
    subtotal
)
VALUES
(
    'DV009',
    'V005',
    'P001',
    8,
    15.00,
    0.00,
    120.00
),
(
    'DV010',
    'V005',
    'P002',
    20,
    5.50,
    0.00,
    110.00
),
(
    'DV011',
    'V005',
    'P005',
    6,
    18.00,
    0.00,
    108.00
);


UPDATE inventario
SET
    stock_actual = 35,
    ultima_actualizacion = '2026-08-25 14:31:00'
WHERE id_producto = 'P001';

UPDATE inventario
SET
    stock_actual = 63,
    ultima_actualizacion = '2026-08-25 14:31:00'
WHERE id_producto = 'P002';

UPDATE inventario
SET
    stock_actual = 20,
    ultima_actualizacion = '2026-08-25 14:31:00'
WHERE id_producto = 'P005';


INSERT INTO movimiento_inventario (
    id_movimiento_inventario,
    id_producto,
    id_tipo_movimiento,
    cantidad,
    stock_anterior,
    stock_posterior,
    fecha_movimiento,
    id_usuario,
    id_venta,
    id_compra,
    observacion
)
VALUES
(
    'MI014',
    'P001',
    'TM002',
    8,
    43,
    35,
    '2026-08-25 14:31:00',
    'U001',
    'V005',
    NULL,
    'Salida por venta V-000005'
),
(
    'MI015',
    'P002',
    'TM002',
    20,
    83,
    63,
    '2026-08-25 14:31:00',
    'U001',
    'V005',
    NULL,
    'Salida por venta V-000005'
),
(
    'MI016',
    'P005',
    'TM002',
    6,
    26,
    20,
    '2026-08-25 14:31:00',
    'U001',
    'V005',
    NULL,
    'Salida por venta V-000005'
);

COMMIT;