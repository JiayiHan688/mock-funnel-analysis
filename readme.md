# Mock Funnel Analysis

This project simulates a user funnel analysis using SQL and Python.

## Funnel Stages
1. Visited Homepage
2. Signed Up
3. Got the free trail
4. Made First Purchase

## Purpose
This is a fictional dataset designed to demonstrate how to conduct funnel and timing analysis using SQL, and visualize the funnel using Python. The logic reflects a typical product analytics workflow.

## Files
- `mock_data.sql`: Sample event log data for 5 users
- `funnel_analysis.sql`: Calculates conversion rates and drop-off rates at each stage and calculates average time taken between each step
- `funnel_chart.py`: Python script to create a funnel chart

## Key Insights
- Highest drop-off was observed between "Trail" and "Purchased".
- Time-to-convert between stages varies widely across users.

## Tools Used
- SQL (CASE, CTE, aggregation)
- Python (matplotlib)