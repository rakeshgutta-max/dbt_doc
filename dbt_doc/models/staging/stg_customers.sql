-- Purpose      : The purpose of the "stg_customers" model is to transform raw customer data from the "raw_customers" source model into a more structured format, specifically by renaming and selecting relevant columns for further analysis.
-- Model Name   : stg_customers
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