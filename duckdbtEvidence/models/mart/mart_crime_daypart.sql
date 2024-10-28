WITH mart_daypart as 
(
    SELECT date_occur,
           day_part,
           crime_class,
           zipcode,
           longitude,
           latitude,
           address_occur,
           sum(crime_count) as crime_count
    FROM {{ref('fact_crime')}}
    GROUP BY ALL
)

SELECT a.date_occur,
       c.day_name,
       c.month_short_name,
       a.day_part,
       b.nibrs_description as crime_description,
       a.zipcode,
       d.area, 
       address_occur,
       longitude,
       latitude,
       crime_count
FROM mart_daypart a 
JOIN {{ref('dim_class')}} b ON a.crime_class = b.nibrs_class
JOIN {{ref('dim_dates')}} c ON a.date_occur = c.date_day
JOIN {{ref('dim_zip')}} d ON a.zipcode = d.zipcode