WITH fact_crime as 
(
    SELECT date_occur,
           time_occur,
            CASE WHEN time_occur BETWEEN 0 and 5 THEN 'Midnight'
            WHEN time_occur BETWEEN 6 and 11 then 'Morning'
            WHEN time_occur BETWEEN 12 and 17 then 'Afternoon'
            ELSE 'Night' END AS day_part,
           nibrs_class as crime_class,
           offense_count,
           beat,
           premise,
           cast(street_number as varchar(10)) || ' ' || street_name || ' ' || street_type 
                                            || ',' || city || ',TX' || ' ' || cast(zipcode as varchar(6))  AS address_occur,
           zipcode,
           longitude,
           latitude,
           cast(1 as int) as crime_count
    FROM {{ref('raw_crime')}}
)

select *
from fact_crime