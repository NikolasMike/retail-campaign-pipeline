select
    cast(product_id as integer) as product_id,
    cast(store_id as integer) as store_id,
    cast(week_no as integer) as week_number,
    display as display_code,
    mailer as mailer_code
from {{ source('raw', 'causal_data') }}
