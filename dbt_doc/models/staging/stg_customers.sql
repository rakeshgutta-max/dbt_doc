-- Model Name   : stg_customers
-- Purpose      : The purpose of this business model, stg_customers, is to extract and rename essential customer information from the raw_customers data for streamlined analysis and utilization in downstream operations.
-- Source Models: raw_customers
with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ ref('raw_customers') }}

),

renamed as (

    select
        id as customer_id,
        first_name,
        last_name

    from source

)

select * from renamed