load("@io_bazel_rules_jsonnet//jsonnet:jsonnet.bzl", "jsonnet_library", "jsonnet_to_json", "jsonnet_to_json_test")

jsonnet_library(
    name = "unittest",
    srcs = ["unittest.libsonnet"],
)

jsonnet_to_json_test(
    name = "test",
    src = "nginx-high-rate-of-5xx.jsonnet",
    golden = "nginx-high-rate-of-5xx.golden.json",
    imports = [":unittest"],
    deps = [":unittest"],
)

jsonnet_to_json(
    name = "main",
    src = "nginx-high-rate-of-5xx.jsonnet",
    outs = ["main.json"],
    imports = [":unittest"],
    deps = [":unittest"],
)
