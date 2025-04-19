-- {% snapshot attendance_snapshot %}

-- {{
--     config(
--         target_database='appdb',
--         target_schema='snapshots',
--         unique_key='youth_id',
--         strategy='timestamp',
--         updated_at='updated_at'
--     )
-- }}

-- select *
-- from {{ source('raw_data', 'Attendance') }}

-- {% endsnapshot %}