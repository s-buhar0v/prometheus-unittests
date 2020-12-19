load("@io_bazel_rules_prometheus//prometheus:prometheus.bzl", "promtool_unit_test")

promtool_unit_test(
    name = "test_rules",
    srcs = [
        "tests.yml",
    ],
    rules = ["rules.yml"],
    tags = ["manual"],
)

promtool_unit_test(
    name = "test_rules1",
    srcs = [
        "tests1.yml",
    ],
    rules = ["rules1.yml"],
)

test_suite(
    name = "all_tests",
    tests = [
        ":test_rules",
        ":test_rules1",
    ],
)
