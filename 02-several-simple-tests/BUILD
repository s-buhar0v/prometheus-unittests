load("//tools:prometheus.bzl", "prometheus_alert_rules_test")

# file source code is incorrect so it fails
# to be fixed
prometheus_alert_rules_test(
    name = "test_rules",
    srcs = [
        "tests.yml",
    ],
    rules = ["rules.yml"],
    tags = ["manual"],
)

prometheus_alert_rules_test(
    name = "test_rules1",
    srcs = [
        "tests1.yml",
    ],
    rules = ["rules1.yml"],
)

test_suite(
    name = "all_tests",
    tests = [
        # ":test_rules", this guy does not work
        ":test_rules1",
    ],
)
