load("//tools:prometheus.bzl", "prometheus_alert_rules_test")

prometheus_alert_rules_test(
    name = "test_rules",
    srcs = [
        "tests.yml",
    ],
    rules = ["alerts.yml"],
)
