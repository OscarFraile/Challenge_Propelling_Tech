with source_customers as (
    select * from {{ source('raw_tpch', 'customer') }}
),

renamed as (
    select
        c_custkey as customer_id,
        c_name as customer_name,
        c_address as address,
        c_phone as phone_number,
        c_mktsegment as market_segment
    from source_customers
)

select * from renamed