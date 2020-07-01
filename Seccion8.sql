-- TIPOS DE DATOS:
/*
- Boolean
- Character
    - char, varchat, text
- Numeric
    - smallint, integer, bigint, decimal, numeric, real, double, smallserial, serial, bigserial, floating
- Temporal
    - date, time, timestamp, interval
*/
-- TIPOS NO TAN COMUNES:
/*
- UUID
- Array
- JSON
- Hstore key-value pair
- Especiales como:
    - Network address, geometric data
*/

-- CONSTRAINGS: dos tipos --> Column & Table Constraints
-- Column: info en una columna para que se apegue a ciertas condiciones.
-- Table: aplicadas a toda la tabla.
/*
Las más comunes:
- NOT NULL
- UNIQUE
- PRIMARY key
- FOREIGN key
- CHECK Constraint
- EXCLUSION Constraint

EJ: UNIQUE(lista_de_columnas)
PRIMARY KEY(lista_de_columnas)
*/

-- CREATE
/*
Sintaxis:
CREATE TABLE nombre_tabla (
  nombre_columna TYPE columna_constraint,
  nombre_columna TYPE columna_constraint,
  tabla_constraint tabla_constraint
) INHERITS existing_table_name;
*/