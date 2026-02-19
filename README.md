# Challenge_Propelling_Tech
Modern Data Stack Challenge: Medallion Architecture con Snowflake &amp; dbt. Implementación de un pipeline de datos E2E transformando datos crudos (TPCH_SF1) en un modelo dimensional (Gold) mediante capas Bronze (Staging) y Silver (Intermediate).

# dbt-Snowflake: Medallion Architecture Challenge

Este proyecto implementa un pipeline de datos moderno utilizando la **Arquitectura Medallion** para procesar datos de pedidos y clientes. El objetivo es transformar datos crudos del dataset `TPCH_SF1` de Snowflake en una tabla de hechos (`fct_orders`) optimizada para análisis.

## Arquitectura del Proyecto

El proyecto sigue una estructura de capas para asegurar la calidad, trazabilidad y modularidad del dato:

* **01_bronze:** Limpieza técnica inicial y estandarización. Se renombran las columnas originales a nombres descriptivos y se asegura el tipado correcto.
    * *Modelos:* `stg_orders`, `stg_customers`.
* **02_silver:** Capa de integración donde se aplica la lógica de negocio. Se realiza el join entre pedidos y clientes para enriquecer la información.
    * *Modelo:* `int_orders_customers`.
* **03_gold:** Modelos dimensionales finales. En esta capa se materializan tablas físicas preparadas para el consumo en herramientas de BI.
    * *Modelo:* `fct_orders` (incluye categorización de valor de pedido).

## Stack Tecnológico

* **Motor de Datos:** Snowflake.
* **Transformación:** dbt Cloud 
* **Control de Versiones:** GitHub.
* **Dataset:** Snowflake Sample Data (`TPCH_SF1`).

## Instrucciones de Ejecución

1.  **Configuración:** Verificar la conexión entre dbt Cloud y la base de datos `DBT_PRACTICA` en Snowflake.
2.  **Ejecución de Modelos:**
    ```bash
    dbt run
    ```
3.  **Pruebas de Calidad (Tests):**
    ```bash
    dbt test
    ```

## Linaje de Datos
El proyecto ha sido diseñado para mantener un linaje claro desde las fuentes originales hasta la tabla de hechos final, permitiendo una auditoría sencilla de cualquier métrica de negocio.

## Autor
Oscar Fraile Proyecto desarrollado para el proceso de selección de Propelling Tech.