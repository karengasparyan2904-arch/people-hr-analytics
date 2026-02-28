# People & HR Analytics - Data Engineer Intern Task

This repository contains a beginner-friendly solution for the People & HR Analytics technical assessment. 

## Overview

The task was to process raw ATS data and create a data mart for hiring, then calculate advanced analytics like monthly active pipeline and cumulative hires by source.

## Part A: Data Cleaning & Modeling (ETL)

- Remove duplicates from `raw_interviews`.
- Check data quality (e.g., interview_date before applied_date).
- Create a data mart `dm_hiring_process` with:
  - Candidate name and source
  - Time-to-decision (days)
  - Total number of "Passed" interviews

SQL file: `part_a_etl.sql`

## Part B: Advanced Analytical SQL

- Monthly Active Pipeline: Count active applications for each month.
- Cumulative Hires by Source: Track how hires from each source grow month by month.

SQL file: `part_b_analytics.sql`

## How to Run

1. Open the `.sql` files in your SQL environment (PostgreSQL, BigQuery, Snowflake, etc.).
2. Execute `part_a_etl.sql` first to create the data mart.
3. Then execute `part_b_analytics.sql` to generate metrics.
4. All queries are beginner-friendly and easy to understand.

## Notes

- This solution is designed for **learning and demonstration** purposes.
- Data quality checks are simple but can be extended for real-world usage.
- The SQL can be adapted to different SQL dialects if needed.
