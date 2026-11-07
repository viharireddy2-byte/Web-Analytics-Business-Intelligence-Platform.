# Changelog

## 0.2.0

- Added growth analytics model: ordered event/page funnels, custom goals, transitions,
  item analytics, parameters, user properties, session history and a dashboard.
- Added a separate optional revenue regression model.
- Refresh detection now includes writes to recent existing daily export tables.
- All CREATE MODEL scripts check ML_ENABLED before model creation. Disabled training
  returns an explicit error instead of scheduling a new training job.
- Benchmarks now verify result values, align session semantics and exact distinct
  counts, retain measured job evidence, and enforce per-query byte caps/timeouts.
- Added a read-only health check and a deployment/recovery runbook.
- Updated feature, setup, benchmark and validation documentation.

Existing model, explore and field names, source schema and analytics definitions
remain available. Refresh metadata requires the permissions documented in deployment.
The new training guard intentionally changes disabled training from a paused schedule
to an explicit failure on attempted model creation. Legacy benchmark reports require
a fresh equivalence-checked run.
