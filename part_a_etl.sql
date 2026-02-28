CREATE TABLE cleaned_interviews AS
SELECT DISTINCT interview_id, app_id, interview_date, outcome
FROM raw_interviews;

SELECT i.interview_id, i.app_id, i.interview_date, a.applied_date
FROM cleaned_interviews i
JOIN raw_applications a ON i.app_id = a.app_id
WHERE i.interview_date < a.applied_date;

CREATE TABLE dm_hiring_process AS
SELECT
    a.app_id,
    c.full_name,
    c.source,
    a.applied_date,
    a.decision_date,
    EXTRACT(DAY FROM (a.decision_date - a.applied_date)) AS time_to_decision,
    SUM(CASE WHEN i.outcome = 'Passed' THEN 1 ELSE 0 END) AS passed_interviews
FROM raw_candidates c
JOIN raw_applications a ON c.candidate_id = a.candidate_id
LEFT JOIN cleaned_interviews i ON a.app_id = i.app_id
GROUP BY a.app_id, c.full_name, c.source, a.applied_date, a.decision_date;
