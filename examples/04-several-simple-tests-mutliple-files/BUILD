load("@io_bazel_rules_jsonnet//jsonnet:jsonnet.bzl", "jsonnet_to_json")
load("@io_bazel_rules_prometheus//prometheus:defs.bzl", "promtool_unit_test")

jsonnet_to_json(
    name = "tests",
    src = "tests.jsonnet",
    outs = [
        "HighRateOf5xx_should_alert_on_5m_and_1h_high_error_rate.json",
        "HighRateOf5xx_should_not_alert_in_the_night.json",
        "HighRateOf5xx_should_not_alert_on_low_error_rate.json",
        "HighRateOf5xx_should_not_alert_on_low_error_rate_during_1_hour.json",
    ],
    imports = ["//unittestlib"],
    multiple_outputs = 1,
    tla_code_files = {
        ":testVariables.json": "vars",
    },
    deps = ["//unittestlib:lib"],
)

promtool_unit_test(
    name = "test_rules",
    srcs = [":tests"],
    rules = ["rules.yml"],
)

test_suite(
    name = "all_tests",
    tests = [":test_rules"],
)
