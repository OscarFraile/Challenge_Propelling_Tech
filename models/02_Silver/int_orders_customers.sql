with orders as (
    select * from {{ ref('stg_orders') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
),

final as (
    select
        o.order_id,
        o.customer_id,
        c.customer_name,
        o.total_amount,  
        o.order_date,
        o.status_code,
        c.market_segment
    from orders o
    left join customers c on o.customer_id = c.customer_id
)

select * from final