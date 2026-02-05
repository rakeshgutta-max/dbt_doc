-- Model Name   : stg_payments
-- Purpose      : The purpose of the dbt model "stg_payments" is to transform raw payment data by renaming columns, converting the amount from cents to dollars, and providing a clean, organized dataset for further analysis and modeling.
-- Source Models: raw_payments
with source as (
    
    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ ref('raw_payments') }}

),

renamed as (

    select
        id as payment_id,
        order_id,
        payment_method,

        -- `amount` is currently stored in cents, so we convert it to dollars
        amount / 100 as amount

    from source

)

select * from renamed