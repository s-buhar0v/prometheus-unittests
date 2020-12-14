package(default_visibility = ["//visibility:public"])

exports_files(["deps.bzl"])

sh_binary(
    name = "promtool",
    srcs = ["promtool.sh"],
    data = select({
        "@bazel_tools//src/conditions:linux_x86_64": ["@prometheus_darwin//:promtool_bin"],
        "@bazel_tools//src/conditions:darwin": ["@prometheus_darwin//:promtool_bin"],
    }) + [],
    visibility = ["//visibility:public"],
    deps = ["@bazel_tools//tools/bash/runfiles"],
)
