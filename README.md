# WorkforceIQ | HR Workforce Analytics

A personal data analytics project exploring employee data, workforce trends, and HR reporting using Excel, PostgreSQL, SQL, and Tableau.

**[View My Tableau Dashboard](https://public.tableau.com/shared/KBWQRZYMB)**

## About the Project

I created WorkforceIQ to practice working with employee data and better understand how data analytics can be used in HR.

For this project, I worked with a fictional company called Nexa Solutions. I started with a synthetic employee dataset, cleaned and organized the records in Excel, imported the data into PostgreSQL, and used SQL to answer questions about the company's workforce.

After completing the SQL analysis, I built a Tableau dashboard to make the results easier to understand.

My goal was to gain hands-on experience with the kind of data cleaning, reporting, and analysis that HRIS and Data Analysts might work on.

## Tools I Used

- **Excel:** Cleaning employee records, identifying missing information, and preparing the data
- **PostgreSQL & pgAdmin 4:** Storing employee data and running SQL queries
- **SQL:** Analyzing salaries, employee statuses, departments, and hiring patterns
- **Tableau Public:** Creating charts and a workforce analytics dashboard
- **GitHub:** Organizing and sharing my project

## Cleaning the Data

I started with a dataset of 250 fictional employee records.

While preparing the data, I found duplicate employee IDs and missing information. I excluded four records associated with duplicate IDs, leaving 246 employee records for analysis.

Some of the data quality issues I identified included:

- 6 missing department assignments
- 3 missing salary values
- 18 missing manager IDs

I kept the missing values in the cleaned dataset instead of making up information to fill them in.

After cleaning the data, I exported it as a CSV file so I could import it into PostgreSQL.

## SQL Analysis

Once the employee data was in PostgreSQL, I wrote SQL queries to answer questions such as:

- How many employees are in each department?
- What is the average employee salary?
- Which departments have higher average salaries?
- How many employees were hired in each year?
- How many employees are active, terminated, or on leave?
- Where is employee information missing?

I also created a separate departments table and practiced using `LEFT JOIN` to connect employee records with department names.

Toward the end of the SQL portion, I created a view called `vw_employee_analytics` to organize the data for Tableau.

My SQL queries are saved in the `4 SQL_Analysis` folder.

## What I Found

Here are some of the results from my analysis:

| Metric | Result |
|---|---|
| Total employee records | 246 |
| Average annual salary | $59,565.64 |
| Largest department | Sales (52 employees) |
| Active employees | 202 |
| Terminated employees | 36 |
| Employees on leave | 8 |
| Employees with unknown departments | 6 |

I also looked at employees by hire year:

| Hire Year | Employee Records |
|---|---|
| 2024 | 86 |
| 2025 | 89 |
| 2026 | 71 |

One thing I noticed was that Sales had the highest employee count, while 2025 had the most employees represented by hire year.

I also found that some employee records were missing department assignments, which showed me why checking data quality is important before creating reports.

## Tableau Dashboard

After finishing my SQL analysis, I created a Tableau dashboard to display the main findings.

The dashboard includes:

1. Total Employees
2. Average Annual Salary
3. Department Headcount
4. Hiring Trends
5. Employment Status

I wanted the dashboard to be simple enough that someone could quickly understand the workforce without having to look through individual employee records.

**[Click here to view my WorkforceIQ dashboard](https://public.tableau.com/shared/KBWQRZYMB)**

## What I Learned

This project helped me become more comfortable working through a complete data analytics process, from preparing a dataset to presenting the results.

Some of the things I practiced were:

- Finding and handling data quality issues in Excel
- Importing CSV files into PostgreSQL
- Writing SQL queries using `GROUP BY`, `COUNT`, `AVG`, and `JOIN`
- Creating a SQL view for reporting
- Building charts and KPIs in Tableau
- Organizing project files and documentation in GitHub

One of the biggest learning experiences was getting the cleaned data into PostgreSQL. I ran into formatting issues during the CSV import and had to go back, check the file, and correct those problems before the import worked.

It helped me understand that data preparation is just as important as the analysis itself.

## Project Notes

This project uses fictional employee data created for learning and portfolio purposes.

The hiring charts show employees grouped by their hire year, rather than a complete record of historical hiring. I also did not calculate a formal turnover rate because the dataset does not include termination dates.

## Final Thoughts

WorkforceIQ gave me an opportunity to apply Excel, SQL, and Tableau together in one project instead of practicing each tool separately.

It also helped me explore my interest in HR systems, data reporting, and using data to support everyday business decisions.

I plan to continue improving my data analytics skills and building projects that connect technology with business operations.
