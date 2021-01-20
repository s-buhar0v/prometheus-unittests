load("@io_bazel_rules_jsonnet//jsonnet:jsonnet.bzl", "jsonnet_to_json")
load("@io_bazel_rules_prometheus//prometheus:defs.bzl", "promtool_unit_test")

jsonnet_to_json(
    name = "tests",
    src = "tests.jsonnet",
    outs = [
        "tests.json",
    ],
    imports = ["//unittestlib"],
    tla_code_files = {
        ":testVariables.json": "vars",
    },
    deps = ["//unittestlib:lib"],
)

promtool_unit_test(
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
