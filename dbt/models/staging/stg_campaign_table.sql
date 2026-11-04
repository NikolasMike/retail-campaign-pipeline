select
    cast(household_key as integer) as household_id,
    cast(campaign as integer) as campaign_id,
    description as campaign_type
from {{ source('raw', 'campaign_table') }}
