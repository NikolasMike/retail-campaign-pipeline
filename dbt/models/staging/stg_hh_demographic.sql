select
    cast(household_key as integer) as household_id,
    age_desc as age_group,
    marital_status_code,
    income_desc as income_group,
    homeowner_desc as homeowner_status,
    hh_comp_desc as household_composition,
    household_size_desc as household_size,
    kid_category_desc as kid_category
from {{ source('raw', 'hh_demographic') }}
