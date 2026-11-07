# Web Analytics & Business Intelligence Platform

## Setup

Start with the [README](README.md) and [deployment guide](docs/DEPLOYMENT.md).

- `sessionlens`: core sessions, audience, retention, forecast and propensity analytics.
- `sessionlens_extended`: core explores plus growth analytics and an additional dashboard.
- `sessionlens_revenue`: optional revenue regression quality and feature importance.

Install test dependencies with `pip install -r requirements-growth-test.txt`, then run
`make test`. See [growth analytics](docs/extensions/GROWTH_ANALYTICS.md) for definitions
and [operations](docs/OPERATIONS.md) for monitoring, cost controls and recovery.
