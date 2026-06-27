with source as (
    select * from {{ source('raw', 'tlc_yellow_trips_2022') }}
),

renamed as (
    select
        vendor_id,
        pickup_datetime,
        dropoff_datetime,
        passenger_count,
        trip_distance,
        payment_type,
        fare_amount,
        tip_amount,
        total_amount,
        pickup_location_id,
        dropoff_location_id
    from source
    where fare_amount  > 0
      and trip_distance > 0
      and total_amount  > 0
)

select * from renamed