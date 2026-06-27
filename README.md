\# NYC Taxi Analytics — dbt + BigQuery + Looker Studio



\## Live Dashboard

\[View Dashboard →](https://datastudio.google.com/reporting/b26700e5-241b-48ea-a5e3-13ad55c8a543)



\## dbt Docs / Data Catalog

\[View Data Lineage \& Documentation →](https://ankit-dbt-docs.netlify.app/#!/overview)



\## Business Problem

Analyse 35M+ NYC taxi trips to surface pricing patterns, peak demand

windows, and tipping behaviour — enabling data-driven operational decisions.



\## Stack

| Layer        | Tool            | Purpose                        |

|--------------|-----------------|---------------------------------|

| Warehouse    | BigQuery        | Storage \& compute (free tier)  |

| Transform    | dbt Core        | Staging → Intermediate → Marts |

| Dashboard    | Looker Studio   | Live shareable visualisation   |

| Version ctrl | GitHub          | Public code repository         |



\## Architecture

raw.tlc\_yellow\_trips\_2022

&#x20;   └── stg\_taxi\_trips              — clean \& rename

&#x20;       └── int\_trips\_with\_duration — add duration, time buckets

&#x20;           └── fct\_trips           — final analytics table

&#x20;           └── dim\_payment\_type    — dimension table



\## Key Findings

\- 35.3M trips analysed across 2022

\- Peak fare hours: early morning (5–6 AM)

\- Overall tip rate: 21%

\- Top pickup zone: Zone 237



\## How to Run

&#x20;   pip install dbt-bigquery

&#x20;   dbt run

&#x20;   dbt test

&#x20;   dbt docs generate \&\& dbt docs serve



\## What I'd do with more time

\- Join a taxi zone lookup table for proper geo-mapping

\- Add incremental models for cost-efficient daily refresh

\- Build a Python anomaly detection layer on fare outliers

