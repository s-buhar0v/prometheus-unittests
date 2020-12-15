"""Test rule that fails if a source file has too long lines."""

# bash_lib_runfiles = BashLibraryRunFileProvider()

def _prometheus_alert_rules_test_impl(ctx):
    """prometheus_alert_rules_test implementation: we spawn executor task from template and provide required tools"""

    # To ensure the files needed by the script are available, we put them in
    # the runfiles.
    cmd = "test rules"

    runfiles = ctx.runfiles(
        files = ctx.files.srcs + ctx.files.rules,
        transitive_files = depset(ctx.files._tool),
    )

    print(ctx.files.srcs[0].path)
    test = ctx.actions.declare_file(ctx.label.name + ".sh")

    ctx.actions.expand_template(
        template = ctx.file._template,
        output = test,
        is_executable = True,
        substitutions = {
            "%srcs%": " ".join([_file.path for _file in ctx.files.srcs]),
            "%tool_path%": "%s" % ctx.executable._tool.path,
            "%command%": cmd,
        },
    )
    return [DefaultInfo(runfiles = runfiles, executable = test)]

prometheus_alert_rules_test = rule(
    implementation = _prometheus_alert_rules_test_impl,
    test = True,
    attrs = {
        "_template": attr.label(
            default = Label("//tools:promtool.sh.tpl"),
            allow_single_file = True,
        ),
        "_tool": attr.label(
            default = Label("@prometheus_darwin//:promtool_bin"),
            allow_single_file = True,
            executable = True,
            cfg = "exec",
        ),
        "srcs": attr.label_list(mandatory = True, allow_files = True),
        "rules": attr.label_list(mandatory = True, allow_files = True),
    },
)

def _prometheus_config_test_impl(ctx):
    pass
