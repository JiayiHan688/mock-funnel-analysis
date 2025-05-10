-- Convert user actions into stage flags
WITH funnel_steps AS (
    SELECT user_id,
        MAX(CASE WHEN event = 'visit_homepage' THEN 1 ELSE 0 END) AS visited,
        MAX(CASE WHEN event = 'sign_up' THEN 1 ELSE 0 END) AS signed_up,
        MAX(CASE WHEN event = 'trail_complete' THEN 1 ELSE 0 END) AS trail,
        MAX(CASE WHEN event = 'purchase' THEN 1 ELSE 0 END) AS purchased
    FROM user_events
    GROUP BY user_id
)

-- Calculate conversion and drop-off rates
SELECT
    SUM(visited) AS visited_count,
    SUM(signed_up) AS signed_up_count,
    ROUND(SUM(signed_up)*1.0 / NULLIF(SUM(visited), 0), 2) AS conv_visit_to_signup,
    ROUND(1 - SUM(signed_up)*1.0 / NULLIF(SUM(visited), 0), 2) AS drop_visit_to_signup,

    SUM(freetrail) AS freetrail_count,
    ROUND(SUM(freetrail)*1.0 / NULLIF(SUM(signed_up), 0), 2) AS conv_signup_to_trail,
    ROUND(1 - SUM(freetrail)*1.0 / NULLIF(SUM(signed_up), 0), 2) AS drop_signup_to_trail,

    SUM(purchased) AS purchase_count,
    ROUND(SUM(purchased)*1.0 / NULLIF(SUM(trail), 0), 2) AS conv_trail_to_purchase,
    ROUND(1 - SUM(purchased)*1.0 / NULLIF(SUM(trail), 0), 2) AS drop_trail_to_purchase
FROM funnel_steps;

-- Extract event timestamps for each user
WITH event_times AS (
    SELECT user_id,
        MAX(CASE WHEN event = 'visit_homepage' THEN event_time END) AS visit_time,
        MAX(CASE WHEN event = 'sign_up' THEN event_time END) AS sign_up_time,
        MAX(CASE WHEN event = 'trail_complete' THEN event_time END) AS trail_time,
        MAX(CASE WHEN event = 'purchase' THEN event_time END) AS purchase_time
    FROM user_events
    GROUP BY user_id
),

-- Calculate time differences in minutes
duration_calc AS (
    SELECT user_id,
        EXTRACT(EPOCH FROM (sign_up_time - visit_time)) / 60 AS visit_to_signup_mins,
        EXTRACT(EPOCH FROM (trail_time - sign_up_time)) / 60 AS signup_to_trail_mins,
        EXTRACT(EPOCH FROM (purchase_time - trail_time)) / 60 AS trail_to_purchase_mins
    FROM event_times
)

-- Compute averages
SELECT
    ROUND(AVG(visit_to_signup_mins), 1) AS avg_visit_to_signup,
    ROUND(AVG(signup_to_trail_mins), 1) AS avg_signup_to_trail,
    ROUND(AVG(trail_to_purchase_mins), 1) AS avg_trail_to_purchase
FROM duration_calc;

