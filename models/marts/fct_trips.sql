with trips as (
    select * from {{ ref('int_trips_with_duration') }}
)

select
    pickup_datetime,
    date(pickup_datetime)               as trip_date,
    extract(hour from pickup_datetime)  as pickup_hour,
    extract(dayofweek from pickup_datetime) as day_of_week,
    time_of_day,
    day_type,
    trip_distance,
    trip_duration_minutes,
    avg_speed_mph,
    passenger_count,
    fare_amount,
    tip_amount,
    total_amount,
    safe_divide(tip_amount, fare_amount)    as tip_percentage,
    safe_divide(fare_amount, trip_distance) as fare_per_mile,
    payment_type,
    pickup_location_id,
    dropoff_location_id,
    vendor_id

from trips