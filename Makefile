PY ?= python3
PROJECT ?= my-gcp-project
DATASET ?= ga4_synth
EVENTS ?= 50000000
USERS ?= 2000000
DAYS ?= 90

.PHONY: setup test lint generate load reference assertions benchmark report

setup:
	$(PY) -m pip install -r requirements.txt

lint:
	$(PY) tools/lint_lookml.py

test: lint
	$(PY) -m unittest discover -s tests -v

generate:
	$(PY) tools/generate_ga4_data.py --events $(EVENTS) --users $(USERS) --days $(DAYS) --out data/ga4

load:
	$(PY) tools/load_to_bigquery.py --project $(PROJECT) --dataset $(DATASET) --data-dir data/ga4

reference:
	$(PY) tools/reference_metrics.py data/ga4 --out data/reference.json

# Usage: make assertions SESSIONS=proj.looker_scratch.LR_xxx_sessions EVENTS_T=proj.looker_scratch.LR_xxx_events_enriched
assertions:
	$(PY) tools/run_assertions.py --project $(PROJECT) --sessions-table $(SESSIONS) \
	  --events-table $(EVENTS_T) --raw-events $(PROJECT).$(DATASET).events_* --reference data/reference.json

benchmark:
	$(PY) tools/benchmark.py run --project $(PROJECT) --raw-events "$(PROJECT).$(DATASET).events_*" \
	  --sessions-table $(SESSIONS) --repeats 5 --label $(LABEL)

report:
	$(PY) tools/benchmark.py report benchmarks/results/$(LABEL).json
