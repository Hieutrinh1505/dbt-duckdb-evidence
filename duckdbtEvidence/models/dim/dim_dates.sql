WITH raw_date as 
(
    {{ dbt_date.get_base_dates(n_dateparts=365*3, datepart="day") }}
)

select date_day,
       {{ dbt_date.day_name('date_day', short=true) }} as day_name,
       {{ dbt_date.month_name('date_day') }} as month_short_name,
       Month(date_day) as month_num,
       Year(date_day) as year_num
from raw_date
