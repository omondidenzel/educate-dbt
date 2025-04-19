
select youth_id
    , session as session_type
    , sum (case when attended = 1 then 1 else 0 end) as attended_sessions
    , count(*) as total_sessions
from {{ref('stg_attendance')}}
group by 1, 2
order by 1 asc
