with attendance_summary as (
    select youth_id
      , count(*) as total_sessions
      , sum(case when attended = 1 then 1 else 0 end) as attended_sessions
    from {{ ref('stg_attendance') }}
    group by 1
)
select youth_id
  , total_sessions
  , attended_sessions
  , total_sessions - attended_sessions as missed_sessions
  , case 
    when (total_sessions - attended_sessions) > 10  then 'High' else 'Low'
  end as dropout_risk
from attendance_summary
order by 1 asc