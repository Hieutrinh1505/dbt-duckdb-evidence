---
title: WELCOME TO MY APP - 2024 HOUSTON CRIME ANALYTICS
---

### Tech stack use: DBT + Duckdb + Evidence
[Dataset using for this project](https://www.houstontx.gov/police/cs/xls/NIBRSPublicView2024.xls)

[Github Link Coming soon!](https://github.com/Hieutrinh1505/dbt-duckdb-evidence)




```sql crime_byDate
  SELECT date_occur,
        sum(crime_count) as crime_count
from mart_crime_daypart
group by date_occur
```

# Line Chart: Crime by Date

<LineChart data={crime_byDate} 
x=date_occur 
y=crime_count
/>

```sql crime_byDaypart
  SELECT date_occur,
        day_part,
        sum(crime_count) as crime_count
from mart_crime_daypart
group by date_occur, 
        day_part
```
# Line Chart: Crime by Daypart
<LineChart data={crime_byDaypart} 
x=date_occur 
y=crime_count
series=day_part
/>


# Calendar Heatmap: Crime Frequency by Date
<!-- <Dropdown 
    data={$crime_byDaypart} 
    name=daypart 
    value=day_part 
    title="Select a Daypart" 
/> -->

<CalendarHeatmap 
    data={crime_byDaypart}
    date=date_occur
    value=crime_count
    title="Calendar Map"
    subtitle="Daily Crime Incident"
/>

```sql crime_area
select day_part,
       area,
       sum(crime_count) as crime_count
from mart_crime_daypart
group by day_part,
          area
```
# Bar Chart: Crime By Area
<BarChart 
    data={crime_area}
    x=area
    y=crime_count
    series=day_part
    swapXY=true
/>

```sql crime_dayofweek
select day_part,
       day_name,
       sum(crime_count) as crime_count
from mart_crime_daypart
group by day_part,
       day_name
```
# Heatmap: Crime By Day of Week
<Heatmap 
    data={crime_dayofweek} 
    x=day_name 
    y=day_part 
    value=crime_count 
    valueFmt=num0 
/>

<!-- -- ```sql crime_type
-- select distinct crime_description
-- from mart_crime_daypart
-- ``` -->

<!-- <Dropdown
    data={crime_type} 
    name=Crime_Type
    value=crime_description
    multiple=true
    title='Select a Crime Type'
    selectAllByDefault=true
/> -->

<!-- -- ```sql crime_filtered_type
-- select date_occur,
--        crime_description,
--        sum(crime_count) as crime_count
-- from mart_crime_daypart
-- where crime_description in '${inputs.Crime_Type.value}'
-- group by ALL
-- ```

-- # Line Chart: Crime by Type
-- <LineChart 
--     data={crime_filtered_type}
--     x=date_occur
--     y=crime_count 
--     series=crime_description
-- /> -->

```sql crime_byMap
select 
        address_occur,
        casT(longitude AS FLOAT) longitude,
        casT(latitude as float) latitude,
        sum(crime_count) as crime_count
from mart_crime_daypart
group by all 
```

# Map: Crime by Address
<PointMap 
    data={crime_byMap} 
    lat=latitude 
    long=longitude 
    value=crime_count 
    valueFmt=num0 
    pointName=address_occur 
    height=200
/>