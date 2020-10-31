# Prometheus rules unit testing

## Overview

Prometheus rules unit tests wrapper (via `bash` and `jsonnet`) evolution. Every folder has a sample and `run.sh` scrpit

Folders:

- `00-jsonnet` - simple jsonnet example
- `01-simple-test` - default unit test
- `02-several-simple-tests` - several default unit tests
- `03-several-simple-tests-json` - several default unit tests in JSON
- `04-several-simple-tests-jsonnnet` - unit tests wrapped via `jsonnet`
- `05-several-simple-tests-logs` - unit tests wrapped via `jsonnet` with logs
- `06-several-simple-tests-stats-and-exit-code` - unit tests wrapped via `jsonnet` with logs, stats and correct exit code

## Requirements for local running

- [jsonnet](https://jsonnet.org)
- [promtool](https://prometheus.io/download/) - can be founded in prometheus archive

## Useful links

- [Prometheus unit testing docs](https://prometheus.io/docs/prometheus/latest/configuration/unit_testing_rules/)
- [Unit testing alerts with Prometheus - Robust perception](https://www.robustperception.io/unit-testing-alerts-with-prometheus)
- [Testing Prometheus alerts - zerokspot](https://zerokspot.com/weblog/2019/11/25/testing-prometheus-alerts/)
