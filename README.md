# Prometheus rules unit testing

![CI](https://github.com/s-buhar0v/prometheus-unittests/workflows/CI/badge.svg)

## Overview

Prometheus unit testing rules (via `bazel` and `jsonnet`) evolution. Every folder has a sample and BUILD file to run

Folders:

- `examples/00-jsonnet` - simple jsonnet hello world example
- `examples/01-simple-test` - default unit test
- `examples/02-several-simple-tests` - several default unit tests
- `examples/03-several-simple-tests-jsonnet` - several unit test cases in Jsonnet
- `examples/04-several-simple-tests-mutliple-files` - test suite of multiple unit test cases in Jsonnet

## Requirements for local running

- [bazel](https://bazel.build/)

## How-to

To run specific test in the directory

```bash
bazel test //examples/01-simple-test:<test_name>
```

To run all tests in the directory

```bash
bazel test //examples/01-simple-test:all
```

To run all tests

```bash
bazel test //examples/...
```

## Useful links

- [Prometheus unit testing docs](https://prometheus.io/docs/prometheus/latest/configuration/unit_testing_rules/)
- [Unit testing alerts with Prometheus - Robust perception](https://www.robustperception.io/unit-testing-alerts-with-prometheus)
- [Testing Prometheus alerts - zerokspot](https://zerokspot.com/weblog/2019/11/25/testing-prometheus-alerts/)
