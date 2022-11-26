with 

source as (

    select * from {{ source('stripe', 'payment') }}

),

transformed as (

  select

    id,
    orderid as order_id,
    paymentmethod as payment_method,
    status as payment_status,
    {{ cents_to_dollars('amount') }} as payment_amount,
    created as payment_created_at,
    _batched_at

  from source

)

select * from transformed

{{ limit_data_in_dev('payment_created_at', 10000) }}