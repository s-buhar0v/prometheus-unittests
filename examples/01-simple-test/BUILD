load("@io_bazel_rules_prometheus//prometheus:defs.bzl", "promtool_unit_test")

promtool_unit_test(
    name = "test_rules",
    srcs = [
        "tests.yml",
    ],
    rules = ["rules.yml"],
)
