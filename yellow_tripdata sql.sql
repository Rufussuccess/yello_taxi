-----Question 1

select "avg_trip_distance", "day_name", "tpep_dropoff_datetime"
from
(select avg("trip_distance") as "avg_trip_distance", "tpep_dropoff_datetime", "day_name"
from
(select "trip_distance", "tpep_dropoff_datetime", to_char(tpep_dropoff_datetime, 'Day') as "day_name"
from "yellow_tripdata_2016") as "days"
group by "tpep_dropoff_datetime", "day_name"
 order by "avg_trip_distance" desc) as tab
  where "day_name" like '%tur%'
  order by 1 desc;

-----Question 2
select avg(fare_amount) as "avg_fare_amount_per_trip", "day_name", "tpep_dropoff_datetime"  
from
(select "fare_amount", "day_name", "tpep_dropoff_datetime"
from
(select "fare_amount", "tpep_dropoff_datetime", to_char(tpep_dropoff_datetime, 'Day') as "day_name"
from "yellow_tripdata_2016") as nt
where "day_name" like '%tur%') as nt2
group by 2, 3
order by 1 desc;

OR

select avg(fare_amount) as "avg_fare_amount_per_trip", "day_name"
from
(select "fare_amount", "day_name"
from
(select "fare_amount", "tpep_dropoff_datetime", to_char(tpep_dropoff_datetime, 'Day') as "day_name"
from "yellow_tripdata_2016") as nt
where "day_name" like '%tur%') as nt2
group by 2
order by 1


-----Question 3
select avg(duration) as avg_duration, day_name
from
(select ("tpep_dropoff_datetime"-"tpep_pickup_datetime")
as duration,
to_char("tpep_dropoff_datetime", 'day') as day_name
from"yellow_tripdata_2016" ) as c
where day_name like '%sat%'
group by 2;
  

-----Question 4
select avg(trip_distance) as "avg_trip_distance", "day_name"
from
(select "trip_distance", "tpep_dropoff_datetime", to_char(tpep_dropoff_datetime, 'day') as "day_name"
from "yellow_tripdata_2016") as b1
where "day_name" like '%und%'
group by 2
order by 1;

-----Question 5
select avg(fare_amount) as "avg_fare_amt","trip_distance", "tpep_dropoff_datetime", "day_name"
from
(select "fare_amount", "tpep_dropoff_datetime", "trip_distance", to_char("tpep_dropoff_datetime", 'day') as "day_name"
 from  "yellow_tripdata_2016") as td
where "day_name" like '%un%'
 group by 2, 3, 4
 order by 2 desc;

-----Question 6
select avg(duration) as avg_duration, day_name
from
(select ("tpep_dropoff_datetime"-"tpep_pickup_datetime")
as duration,
to_char("tpep_dropoff_datetime", 'day') as day_name
from yellow_tripdata_2016) as c
where day_name like '%sun%'
group by 2;
