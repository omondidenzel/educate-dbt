select *
from {{ source('raw_data', 'Attendance') }}
