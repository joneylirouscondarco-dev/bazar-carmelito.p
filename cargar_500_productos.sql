-- =========================================================
-- PASO 11
-- CARGA AUTOMATICA DE 500 PRODUCTOS
-- BAZAR CARMELITO
-- =========================================================

PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;


-- =========================================================
-- LIMPIAR SOLO LOS PRODUCTOS DE PRUEBA MASIVOS SI EXISTEN
-- NO BORRA LOS P001-P005
-- =========================================================

DELETE FROM producto
WHERE id_producto LIKE 'P1%'
   OR id_producto LIKE 'P2%'
   OR id_producto LIKE 'P3%'
   OR id_producto LIKE 'P4%'
   OR id_producto LIKE 'P5%';


-- =========================================================
-- GENERAR PRODUCTOS DEL 006 AL 500
-- =========================================================

WITH RECURSIVE numeros(n) AS (

    SELECT 6

    UNION ALL

    SELECT n + 1
    FROM numeros
    WHERE n < 500
)

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

SELECT

    'P' || printf('%03d', n),

    CASE
        WHEN n % 2 = 0
        THEN 'PAP-' || printf('%04d', n)
        ELSE 'JUG-' || printf('%04d', n)
    END,

    '789' || printf('%010d', n),

    CASE

        WHEN n % 10 = 0
        THEN 'Cuaderno escolar modelo ' || n

        WHEN n % 10 = 1
        THEN 'Boligrafo modelo ' || n

        WHEN n % 10 = 2
        THEN 'Lapiz modelo ' || n

        WHEN n % 10 = 3
        THEN 'Borrador modelo ' || n

        WHEN n % 10 = 4
        THEN 'Regla modelo ' || n

        WHEN n % 10 = 5
        THEN 'Marcador modelo ' || n

        WHEN n % 10 = 6
        THEN 'Rompecabezas modelo ' || n

        WHEN n % 10 = 7
        THEN 'Pelota modelo ' || n

        WHEN n % 10 = 8
        THEN 'Muñeco modelo ' || n

        ELSE 'Juego educativo modelo ' || n

    END,

    'Producto generado para pruebas del sistema',

    CASE
        WHEN n % 2 = 0
        THEN 'CAT001'
        ELSE 'CAT002'
    END,

    CASE
        WHEN n % 3 = 0
        THEN 'PRE002'
        WHEN n % 5 = 0
        THEN 'PRE003'
        ELSE 'PRE001'
    END,

    CASE
        WHEN n % 3 = 0
        THEN 'MAR001'
        WHEN n % 3 = 1
        THEN 'MAR002'
        ELSE 'MAR003'
    END,

    1,

    '2026-08-01 09:00:00',

    '2026-08-01 09:00:00'

FROM numeros;


COMMIT;
-- =========================================================
-- CREAR INVENTARIO PARA LOS PRODUCTOS 006 AL 500
-- =========================================================

BEGIN TRANSACTION;

INSERT INTO inventario (
    id_inventario,
    id_producto,
    stock_actual,
    stock_minimo,
    stock_maximo,
    ultima_actualizacion
)

SELECT

    'INV' || printf('%03d',
        CAST(SUBSTR(id_producto, 2) AS INTEGER)
    ),

    id_producto,

    CASE
        WHEN CAST(SUBSTR(id_producto, 2) AS INTEGER) % 5 = 0
        THEN 20

        WHEN CAST(SUBSTR(id_producto, 2) AS INTEGER) % 5 = 1
        THEN 30

        WHEN CAST(SUBSTR(id_producto, 2) AS INTEGER) % 5 = 2
        THEN 40

        WHEN CAST(SUBSTR(id_producto, 2) AS INTEGER) % 5 = 3
        THEN 50

        ELSE 60
    END,

    10,

    100,

    '2026-08-01 09:30:00'

FROM producto

WHERE CAST(SUBSTR(id_producto, 2) AS INTEGER) BETWEEN 6 AND 500

AND NOT EXISTS (

    SELECT 1
    FROM inventario i
    WHERE i.id_producto = producto.id_producto
);

COMMIT;