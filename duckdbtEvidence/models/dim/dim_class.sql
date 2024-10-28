WITH dim_class as 
(
    select distinct nibrs_class,nibrs_description
    from {{ref('raw_crime')}}
) 

select * from dim_class