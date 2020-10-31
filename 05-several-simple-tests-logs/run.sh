#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

BASE_DIR=$(cd $(dirname $0); pwd) # without ending
TEST_SUITES_BUILD_DIR="${BASE_DIR}/testsuites"

function clear() {
    rm -rf ${TEST_SUITES_BUILD_DIR}
    mkdir ${TEST_SUITES_BUILD_DIR}
}

function log_failed() {
    local message=${1}
    printf "${RED}${message}${NC}\n"
}

function log_info() {
    local message=${1}
    printf "${BLUE}${message}${NC}\n"
}

function log::success() {
    local message=${1}
    printf "${GREEN}${message}${NC}\n"
}

function test_suite::build() {
    local test_suites_build_dir=${1}
    local testsuite_path=${2}

    testsuite_file=$(basename ${testsuite_path})
    testsuite_name=${testsuite_file%.*}
    output_dir=${test_suites_build_dir}/${testsuite_name}

    mkdir ${output_dir}
    jsonnet -m ${output_dir} ${testsuite_path} > /dev/null
    cp 'rules.yml' ${output_dir}
}

function test_suite::lookup() {
    echo $(ls -1 ${BASE_DIR}/*.jsonnet)
}

function test_suite::run() {
    local test_suites_build_dir=${1}
    local testsuite_name=${2}

    test_files=$(ls -1 ${test_suites_build_dir}/${testsuite_name}/*.json)

    for t in ${test_files}; do
        test_file_name=$(basename ${t})
        test_md5=${test_file_name%.*}
        test_info_file="${test_suites_build_dir}/${testsuite_name}/${test_md5}.info"
        test_err_file="${test_suites_build_dir}/${testsuite_name}/${test_md5}.err"

        test_name=$(cat ${test_info_file})
        promtool test rules ${t} > /dev/null 2> ${test_err_file}

        if [[ $(cat ${test_err_file} | wc -l) -gt 0 ]]; then
            error=$(cat ${test_err_file})
            log_failed "[~]\t- ${test_name}"
            log_failed "\t ${error}"
        else
            log::success "[~]\t- ${test_name} - OK"
        fi
    done
}

clear

# lookup for all .jsonnet files
testsuites=$(test_suite::lookup)

# build all .jsonnet files => .json, .info
for t in $testsuites; do
    test_suite::build ${TEST_SUITES_BUILD_DIR} ${t}
done

# run tests
for t in $testsuites; do
    testsuite_file=$(basename $t)
    testsuite_name="${testsuite_file%.*}"

    log_info "[~] Test suite: ${testsuite_name}"

    test_suite::run ${TEST_SUITES_BUILD_DIR} ${testsuite_name}

    log_info "[.] Done"

done