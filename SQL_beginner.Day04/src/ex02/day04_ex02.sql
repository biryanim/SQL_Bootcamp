CREATE VIEW v_generated_dates AS
SELECT gs::date as generated_date
FROM generate_series('2022-01-01', '2022-01-31', interval '1 day') as gs;

select count(*) =31 as check, min(generated_date) as check1, max(generated_date) as check2 from v_generated_dates;