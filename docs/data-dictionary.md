# Data dictionary

Source: dunnhumby, The Complete Journey (Kaggle), ODbL. 8 CSV files, ~800 MB.
Row counts exclude the header. Grains are inferred from column names and will be verified with tests.

| File | One row is... | Rows | Columns |
|---|---|---|---|
| campaign_desc | one campaign | 30 | DESCRIPTION, CAMPAIGN, START_DAY, END_DAY |
| campaign_table | one household enrolled in one campaign | 7,208 | DESCRIPTION, household_key, CAMPAIGN |
| causal_data | one product in one store in one week | 36,786,524 | PRODUCT_ID, STORE_ID, WEEK_NO, display, mailer |
| coupon | one coupon for one product in one campaign | 124,548 | COUPON_UPC, PRODUCT_ID, CAMPAIGN |
| coupon_redempt | one coupon redeemed by one household on one day | 2,318 | household_key, DAY, COUPON_UPC, CAMPAIGN |
| hh_demographic | one household with demographics | 801 | AGE_DESC, MARITAL_STATUS_CODE, INCOME_DESC, HOMEOWNER_DESC, HH_COMP_DESC, HOUSEHOLD_SIZE_DESC, KID_CATEGORY_DESC, household_key |
| product | one product | 92,353 | PRODUCT_ID, MANUFACTURER, DEPARTMENT, BRAND, COMMODITY_DESC, SUB_COMMODITY_DESC, CURR_SIZE_OF_PRODUCT |
| transaction_data | one product line within one basket | 2,595,732 | household_key, BASKET_ID, DAY, PRODUCT_ID, QUANTITY, SALES_VALUE, STORE_ID, RETAIL_DISC, TRANS_TIME, WEEK_NO, COUPON_DISC, COUPON_MATCH_DISC |

## Known quirks

- Time is a day number (DAY), not a calendar date. A date dimension will need an arbitrary anchor date.
- hh_demographic covers about 800 households, far fewer than appear in transaction_data (to be measured).
- coupon_redempt has few rows (2,318) across 30 campaigns, so redemption rates must be read with care.
- Column naming is inconsistent (household_key is lowercase, most others uppercase). Staging will standardize to snake_case.