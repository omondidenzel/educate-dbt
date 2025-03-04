select *
from {{ source('raw_data', 'Venues') }}
