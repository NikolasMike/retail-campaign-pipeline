select
    cast(household_key as integer) as household_id,
    cast(basket_id as bigint) as basket_id,
    cast(day as integer) as day_number,
    cast(week_no as integer) as week_number,
    cast(trans_time as integer) as transaction_time_hhmm,
    cast(product_id as integer) as product_id,
    cast(store_id as integer) as store_id,
    cast(quantity as integer) as quantity,
    cast(sales_value as decimal(10, 2)) as sales_value,
    cast(retail_disc as decimal(10, 2)) as retail_discount,
    cast(coupon_disc as decimal(10, 2)) as coupon_discount,
    cast(coupon_match_disc as decimal(10, 2)) as coupon_match_discount
from {{ source('raw', 'transaction_data') }}
