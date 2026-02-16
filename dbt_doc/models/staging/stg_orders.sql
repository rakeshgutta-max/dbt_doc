-- Model Name   : stg_orders
-- Purpose      : The purpose of this SQL model, named "stg_orders", is to select and rename specific columns from the "raw_orders" table, transforming the data for clarity and better understanding.
-- Source Models: raw_orders
with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ ref('raw_orders') }}

),
renamed as (

    select
        id as order_id,
        user_id as customer_id, --purpose is to rename user_id to customer_id for clarity
        order_date,
        status

    from source

)

select * from renamed