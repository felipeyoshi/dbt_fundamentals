{{ config(materialized='table', sort='DATE_DAY') }}

{{ dbt_utils.date_spine(
    datepart="day",
    start_date="cast('2022-01-01' as date)",
    end_date="cast('2022-12-31' as date)"
   )
}}