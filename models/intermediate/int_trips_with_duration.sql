with trips as (
    select * from {{ ref('stg_taxi_trips') }}
),

with_duration as (
    select
        *,
        timestamp_diff(dropoff_datetime, pickup_datetime, MINUTE)
            as trip_duration_minutes,

        case
            when extract(hour from pickup_datetime) between 6  and 9  then 'Morning Rush'
            when extract(hour from pickup_datetime) between 10 and 15 then 'Midday'
            when extract(hour from pickup_datetime) between 16 and 19 then 'Evening Rush'
            when extract(hour from pickup_datetime) between 20 and 23 then 'Night'
            else 'Late Night'
        end as time_of_day,

        case
            when extract(dayofweek from pickup_datetime) in (1, 7) then 'Weekend'
            else 'Weekday'
        end as day_type,

        safe_divide(
            trip_distance,
            timestamp_diff(dropoff_datetime, pickup_datetime, MINUTE) / 60.0
        ) as avg_speed_mph

    from trips
)

select * from with_duration
where trip_duration_minutes between 1 and 180