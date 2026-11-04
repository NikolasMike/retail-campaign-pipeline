select
    cast(product_id as integer) as product_id,
    cast(manufacturer as integer) as manufacturer_id,
    department,
    brand,
    commodity_desc as commodity,
    sub_commodity_desc as sub_commodity,
    curr_size_of_product as package_size
from {{ source('raw', 'product') }}
