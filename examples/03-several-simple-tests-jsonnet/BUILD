load("@io_bazel_rules_jsonnet//jsonnet:jsonnet.bzl", "jsonnet_library", "jsonnet_to_json", "jsonnet_to_json_test")
load("//tools:prometheus.bzl", "prometheus_test")

jsonnet_library(
    name = "unittest",
    srcs = ["unittest.libsonnet"],
)

jsonnet_to_json(
    name = "tests",
    src = "tests.jsonnet",
    outs = [
        "tests.json",
    ],
    imports = [":unittest"],
    tla_code_files = {
        ":testVariables.json": "vars",
    },
    deps = [":unittest"],
)

prometheus_test(
    name = "test_rules",
    srcs = [
        ":tests",
    ],
    rules = [":rules.yml"],
)

test_suite(
    name = "all_tests",
    tests = [
        ":test_rules",
    ],
)
