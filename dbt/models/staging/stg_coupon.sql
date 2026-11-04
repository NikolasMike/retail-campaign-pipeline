select
    cast(coupon_upc as bigint) as coupon_upc,
    cast(product_id as integer) as product_id,
    cast(campaign as integer) as campaign_id
from {{ source('raw', 'coupon') }}
