-- Model Name   : stg_customers
-- Purpose      : The purpose of the dbt model "stg_customers" is to clean and transform raw customer data, extracting the customer ID, first name, and last name from the source, and presenting it in a structured format for further analysis.
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