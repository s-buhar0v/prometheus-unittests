load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "io_bazel_rules_jsonnet",
    sha256 = "7f51f859035cd98bcf4f70dedaeaca47fe9fbae6b199882c516d67df416505da",
    strip_prefix = "rules_jsonnet-0.3.0",
    urls = ["https://github.com/bazelbuild/rules_jsonnet/archive/0.3.0.tar.gz"],
)

load("@io_bazel_rules_jsonnet//jsonnet:jsonnet.bzl", "jsonnet_repositories")

jsonnet_repositories()

load("@jsonnet_go//bazel:repositories.bzl", "jsonnet_go_repositories")

jsonnet_go_repositories()

load("@jsonnet_go//bazel:deps.bzl", "jsonnet_go_dependencies")

jsonnet_go_dependencies()

http_archive(
    name = "io_bazel_rules_prometheus",
    sha256 = "c9980c638cba01015f31bc610788d5396b05b67c99c1f065fef17427cb8459fe",
    strip_prefix = "rules_prometheus-0.0.4",
    urls = ["https://github.com/5h4d0w4rt/rules_prometheus/archive/0.0.4.zip"],
)

load("@io_bazel_rules_prometheus//:deps.bzl", "prometheus_repositories")

prometheus_repositories()
