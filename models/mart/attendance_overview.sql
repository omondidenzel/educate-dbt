
with attendance_summary as (
    select youth_id
      , count(*) as total_sessions
      , sum(case when attended = 1 then 1 else 0 end) as attended_sessions
      , round(sum(case when attended = 1 then 1 else 0 end) * 100.0 / count(*), 2) as attendance_percentage
    from {{ ref('stg_attendance') }}
    group by youth_id
),
dropout as (
    select youth_id
      , case 
        when (total_sessions - attended_sessions) > 10  then 'High' else 'Low'
    end as dropout_risk
    from attendance_summary
)
select distinct a.youth_id
  , a.total_sessions
  , a.attended_sessions
  , a.attendance_percentage
  , d.dropout_risk
  , y."User Type" as user_type
  , y.gender_pull as gender
  , y.training_schedule
  , v.county_pull
  , v.ward
  , v.training_venue
from attendance_summary a
join {{ ref('stg_youth') }} y on a.youth_id = y.youth_id 
left join dropout d on a.youth_id = d.youth_id
left join {{ ref('stg_venues') }} v on y.venue_id = v.venue_id
order by 1
