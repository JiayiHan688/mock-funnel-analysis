-- Create user event table
CREATE TABLE user_events (
    user_id INT,
    event VARCHAR(50),
    event_time TIMESTAMP
);

-- Mock data
INSERT INTO user_events (user_id, event, event_time) VALUES
(1, 'visit_homepage', '2024-01-01 10:00:00'),
(1, 'sign_up', '2024-01-01 10:05:00'),
(1, 'trail_complete', '2024-01-01 10:10:00'),
(1, 'purchase', '2024-01-01 10:30:00'),

(2, 'visit_homepage', '2024-01-01 11:00:00'),
(2, 'sign_up', '2024-01-01 11:05:00'),

(3, 'visit_homepage', '2024-01-01 12:00:00'),

(4, 'visit_homepage', '2024-01-01 13:00:00'),
(4, 'sign_up', '2024-01-01 13:05:00'),
(4, 'trail_complete', '2024-01-01 13:20:00'),

(5, 'visit_homepage', '2024-01-01 14:00:00'),
(5, 'sign_up', '2024-01-01 14:05:00'),
(5, 'trail_complete', '2024-01-01 14:15:00'),
(5, 'purchase', '2024-01-01 14:35:00');
