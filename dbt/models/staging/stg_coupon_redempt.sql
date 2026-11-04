select
    cast(household_key as integer) as household_id,
    cast(day as integer) as day_number,
    cast(coupon_upc as bigint) as coupon_upc,
    cast(campaign as integer) as campaign_id
from {{ source('raw', 'coupon_redempt') }}
