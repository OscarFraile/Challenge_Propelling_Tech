with source_orders as (
    select * from {{ source('raw_tpch', 'orders') }}
),

renamed as (
    select
        o_orderkey as order_id,
        o_custkey as customer_id,
        o_orderstatus as status_code,
        o_totalprice as total_amount, 
        o_orderdate as order_date
    from source_orders
)

select * from renamed