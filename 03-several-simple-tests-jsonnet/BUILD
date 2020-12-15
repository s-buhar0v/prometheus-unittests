load("@io_bazel_rules_jsonnet//jsonnet:jsonnet.bzl", "jsonnet_library", "jsonnet_to_json", "jsonnet_to_json_test")
load("//tools:prometheus.bzl", "prometheus_alert_rules_test")

jsonnet_library(
    name = "unittest",
    srcs = ["unittest.libsonnet"],
)

jsonnet_to_json_test(
    name = "golden",
    src = "tests.jsonnet",
    golden = "tests.golden.json",
    imports = [":unittest"],
    deps = [":unittest"],
)

jsonnet_to_json(
    name = "tests",
    src = "tests.jsonnet",
    outs = ["tests.json"],
    imports = [":unittest"],
    deps = [":unittest"],
)

# output files are unsupported
# so it fails
# promtool also does not support yaml
# so we need to process json into yaml
# duh
prometheus_alert_rules_test(
    name = "test_rules",
    srcs = [
        ":tests",
    ],
    rules = ["rules.yml"],
    tags = ["manual"],
)
