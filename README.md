# EOIR Immigration Court Analytics
![Dashboard Preview](\dashboard_viz\dashboard_preview.png)


End-to-end data analytics pipeline built on 12.5M+ records from the Executive Office for Immigration Review. The project attempts to mirror a professional data stack and focuses on metrics relevant to legal case processing and document pipeline analysis.

---

## Stack

| Layer | Tool | Production Equivalent |
|---|---|---|
| Storage | PostgreSQL (local) | Snowflake / BigQuery |
| Transformation | dbt Core | dbt Cloud |
| Visualization | Tableau Public | Tableau / Looker |
| Version Control | GitHub | GitHub |

---

## Dataset

**Source:** [EOIR Case Data](https://www.justice.gov/eoir/foia-library-0)
**Size:** 12.5M+ case records  
**Origin:** U.S. Department of Justice, Executive Office for Immigration Review  

The dataset covers immigration court cases across the U.S. including case filings, court proceedings, charges, appeals, attorney assignments, and court decisions, and more.

---

## Project Structure

```
eoir_dbt
├── models
│   ├── staging             # Clean, renamed, type-cast views on raw tables
│   │   ├── cases.sql
│   │   ├── proceedings.sql
│   │   ├── appeals.sql
│   │   ├── reps_assigned.sql
│   │   ├── proceed_charges.sql
│   │   ├── court_appln.sql
│   │   ├── case_phistory.sql
│   │   ├── case_identifier.sql
│   │   └── lookups          # Reference/lookup table staging models
│   └── marts
│       └── analytics      
│           ├── cities.sql
│           ├── judges.sql
│           ├── nationalities.sql
│           ├── fact_cases.sql
│           ├── fact_proceedings.sql
│           └── fact_appeals.sql
├── macros
│   ├── nullif_blank.sql      # Trims and nulls empty strings
│   └── generate_schema_name.sql
└── SQL
    └── Tables # Work for cleaning data
    └── Query # For future work
└── Python # Scripts to clean data and upload to database

```

---

## Data Model

```
a_tblcase (idncase)
    ├── b_tblproceeding (idncase)
    │       └── b_tblproceedcharges (idnproceeding)
    │       └── tbl_court_appln (idnproceeding)
    ├── tblappeal (idncase)
    ├── tbl_repsassigned (idncase)
    ├── a_tblcaseidentifier (idncase)
    └── tbl_casepriorityhistory (idncase)
```

---

## Raw Data Challenges

The source data required significant cleaning before analysis:

- All columns loaded as `varchar` due to export inconsistencies (i.e. empty strings, invalid formats)
- Mixed date formats: `YYYY-MM-DD`, `YYYY-MM-DD HH:MM:SS.mmm`, `M/YYYY`
- Wrong dates: 1900-era dates
- Blank strings alongside true nulls
- Invalid values in typed columns (i.e. city code in timestamp fields)
- Legacy fields with mixed codes
- 134K cases in `fact_cases` with no matching proceeding
- `lpr_raw` and `zbond_mrg_flag_raw` remains as varchar until further investigation once these deferred fields are needed to determine key metrics.

All cleaning logic is encoded in dbt staging models and raw tables are never modified.

---

## Dashboard Metrics

Built in Tableau Public, focused on metrics relevant to legal case processing:

- **Case volume over time** - filings by year, court location, and nationality
- **Decision outcomes** - granted, denied, withdrawn by case type and judge
- **Processing time** - days from case filing to completion
- **Representation rates** - represented vs. pro se, and correlation with outcomes
- **Appeal rates** - how often decisions are appealed and BIA outcomes

[View on Tableau Public](https://public.tableau.com/app/profile/daeseong.kim5228/viz/visualization_17786303636520/EOIRAnalytics?publish=yes)

---

## Setup

### Prerequisites
- Python 3.10
- PostgreSQL 18
- dbt Core with dbt-postgres adapter

### Installation

```bash
# Clone the repo
git clone https://github.com/daeseong/eoir-analytics.git
cd eoir-analytics

# Create and activate virtual environment
python -m venv venv
venv\Scripts\activate

# Install dbt
pip install dbt-postgres
```

### Configure database connection

Create `~/.dbt/profiles.yml`:

```yaml
eoir_dbt:
  target: dev
  outputs:
    dev:
      type: postgres
      host: localhost
      port: 5432
      user: <your_pg_user>
      password: <your_pg_password>
      dbname: eoir_raw
      schema: eoir
      threads: 4
```

### Run dbt

```bash
dbt debug         # test connection
dbt run           # build all models
dbt test          # run data tests
```

---

## Key Design Decisions

**All columns loaded as varchar in raw layer** — type casting happens exclusively in dbt staging models. This avoids load failures from inconsistent source data and keeps the raw layer as true copy of source data.

**Staging models as views** - staging models are views so they require no additional storage.

**Mart models as tables** - fact and dimension models are materialized as tables for Tableau.

**Invalid data handling** - Majority of tables have invalid rows where the data type is incorrect. During EDA, we found that this is an insignificant amount to affect our analysis (< 0.01%)

**Birthdate storage** - Split as month (int) and year (int) since source data stored only as `MM/YYYY`. 