{{
  config(
    materialized='table'
  )
}}

with orders_customers as (
    select * from {{ ref('int_orders_customers') }}
),

final as (
    select
        order_id,
        customer_id,
        customer_name,
        market_segment,
        order_date,
        status_code,
        total_amount,
        case 
            when total_amount > 150000 then 'High Value'
            else 'Standard'
        end as order_priority_type
    from orders_customers
)

select * from final