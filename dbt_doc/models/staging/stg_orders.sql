-- Purpose      : The purpose of the "stg_orders" model is to transform and clarify raw order data by renaming the "user_id" column to "customer_id" for better understanding, while maintaining the same information from the source model "raw_orders".
-- Model Name   : stg_orders
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