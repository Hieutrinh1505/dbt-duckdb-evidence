WITH raw_crime as 
(
    SELECT incident as incident,
           RMSOccurrenceDate as date_occur,
           RMSOccurrenceHour as time_occur,
           NIBRSClass as nibrs_class,
           NIBRSDescription as nibrs_description,
           OffenseCount as offense_count,
           Beat as beat,
           Premise as premise,
           StreetNo as street_number,
           Streetname as street_name,
           StreetType as street_type,
           Suffix as suffix,
           City as city,
           ifnull(try_cast(ZIPCode as int),0) as zipcode,
           MapLongitude as longitude,
           MapLatitude as latitude
    from st_read('https://www.houstontx.gov/police/cs/xls/NIBRSPublicView2024.xlsx')
)

select *
from raw_crime