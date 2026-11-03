select
    cast(campaign as integer) as campaign_id,
    description as campaign_type,
    cast(start_day as integer) as start_day,
    cast(end_day as integer) as end_day
from {{ source('raw', 'campaign_desc') }}
