local unitTest = import 'unittestlib/unittest.libsonnet';

function(vars)
  unitTest.testSuite(
    rulesFileName=vars.rulesFileName,

    testCases=[
      unitTest.testCase(
        name='HighRateOf5xx should alert on 5m and 1h high error rate',
        inputSeriesInterval='1m',
        inputSeries=[
          unitTest.timeSeries(
            series='slo_errors_per_request_by_service:ratio_rate:5m{host="example.com"}',
            values='0.50x10'
          ),
          unitTest.timeSeries(
            series='slo_errors_per_request_by_service:ratio_rate:1h{host="example.com"}',
            values='0.50x60'
          ),
          unitTest.timeSeries(
            series='datetime:is_day',
            values='1x10'
          ),
        ],
        expectedAlerts=[
          unitTest.expectedAlert(
            name='HighRateOf5xx',
            evalTime='1m',
            metadata=[
              {
                labels: {
                  severity: 'page',
                  host: 'example.com',
                },
                annotations: {
                  description: '0.50 5xx rate on example.com',
                },
              },
            ]
          ),
        ]
      ),

      unitTest.testCase(
        name='HighRateOf5xx should not alert in the night',
        inputSeriesInterval='1m',
        inputSeries=[
          unitTest.timeSeries(
            series='slo_errors_per_request_by_service:ratio_rate:5m{host="example.com"}',
            values='0.13x10'
          ),
          unitTest.timeSeries(
            series='slo_errors_per_request_by_service:ratio_rate:1h{host="example.com"}',
            values='0.51x60'
          ),
        ],
        expectedAlerts=[
          unitTest.expectedAlert(
            name='HighRateOf5xx',
            evalTime='1m',
            metadata=[]
          ),
        ]
      ),

      unitTest.testCase(
        name='HighRateOf5xx should not alert on low error rate',
        inputSeriesInterval='1m',
        inputSeries=[
          unitTest.timeSeries(
            series='slo_errors_per_request_by_service:ratio_rate:5m{host="example.com"}',
            values='0.123x10'
          ),
          unitTest.timeSeries(
            series='slo_errors_per_request_by_service:ratio_rate:1h{host="example.com"}',
            values='0.20x60'
          ),
        ],
        expectedAlerts=[
          unitTest.expectedAlert(
            name='HighRateOf5xx',
            evalTime='1m',
            metadata=[]
          ),
        ]
      ),

      unitTest.testCase(
        name='HighRateOf5xx should not alert on low error rate during 1 hour',
        inputSeriesInterval='1m',
        inputSeries=[
          unitTest.timeSeries(
            series='slo_errors_per_request_by_service:ratio_rate:5m{host="example.com"}',
            values='0.03x10'
          ),
          unitTest.timeSeries(
            series='slo_errors_per_request_by_service:ratio_rate:1h{host="example.com"}',
            values='0.51x60'
          ),
        ],
        expectedAlerts=[
          unitTest.expectedAlert(
            name='HighRateOf5xx',
            evalTime='1m',
            metadata=[]
          ),
        ]
      ),
    ]
  )
