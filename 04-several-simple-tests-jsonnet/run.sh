#!/bin/bash

# rm -f nginx-high-rate-of-5xx.json
# jsonnet  nginx-high-rate-of-5xx.jsonnet > nginx-high-rate-of-5xx.json

promtool test rules /tests/nginx-high-rate-of-5xx.json
