{
    testSuite(tests):: {
        [std.md5('%(name)s.' % t.name) + '.json']: {
            rule_files: [
                'rules.yml'
            ],
            evaluation_interval: '1m',
            tests: [t],
        },
        for t in tests
    } +
    {
        [std.md5('%(name)s.' % t.name) + '.info']: t.name
        for t in tests
    },

    testCase(name, inputSeriesInterval, inputSeries, expectedAlerts):: {
        name:: name,
        interval: inputSeriesInterval,
        input_series: inputSeries,
        alert_rule_test: expectedAlerts,
    },

    timeSeries(series, values):: {
        series: series,
        values: values,
    },

    expectedAlert(name, evalTime, metadata):: {
        alertname: name,
        eval_time: evalTime,
        exp_alerts: std.map(function(m) {
            exp_labels: m.labels,
            exp_annotations: m.annotations,
        }, metadata)
    },
}