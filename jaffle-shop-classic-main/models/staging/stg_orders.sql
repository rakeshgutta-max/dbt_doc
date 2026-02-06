-- Model Name   : stg_orders
-- Purpose      : The purpose of the dbt model "stg_orders" is to transform raw order data by renaming and selecting relevant fields to create a clean, organized dataset for further analysis and business insights.
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