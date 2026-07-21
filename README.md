# acme-dbt — Acme's analytics project (Pumpkin's DBT_REPO)

dbt Core against Snowflake `ACME_DEV`. Raw → staging → marts for the orders
domain, schema tests, semantic models + the `total_revenue` metric, and the
`weekly_revenue_report` exposure. **Dev target only** — there is no prod
target in this project, by design.

```
models/
  sources.yml            ACME_DEV.RAW.{orders,customers} (seeded by acme-infra)
  staging/               stg_orders (owns cents→dollars), stg_customers + tests
  marts/                 fct_orders, dim_customers + tests
  semantic/              semantic model + total_revenue metric
  exposures.yml          weekly_revenue_report
```

## Running

`profiles.yml` is committed and fully env-templated — no credentials in git.
Set `SNOWFLAKE_ACCOUNT` / `SNOWFLAKE_USER` / `SNOWFLAKE_PASSWORD` (the
`SVC_DBT_RUNNER_DEV` service login, stored at AWS Secrets Manager
`acme/snowflake/dbt-runner-dev`), then:

```sh
pip install "dbt-snowflake~=1.9.0"
dbt build --target dev --profiles-dir .
```

CI runs exactly that on every PR. Branch protection: no direct pushes to
main, 1 human review, CODEOWNERS.
