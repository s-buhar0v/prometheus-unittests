load("@io_bazel_rules_jsonnet//jsonnet:jsonnet.bzl", "jsonnet_to_json", "jsonnet_to_json_test")

jsonnet_to_json(
    name = "main",
    src = "main.jsonnet",
    outs = ["main.json"],
)

jsonnet_to_json_test(
    name = "main_test",
    src = "main.jsonnet",
    golden = "main.golden.jsonnet",
)
