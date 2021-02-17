#!/bin/sh

test_description="Tests performance of writing the index"

. ./perf-lib.sh

test_perf_large_repo

test_expect_success "setup repo" '
	nr_files=3000000
'

count=3
test_perf "write_locked_index $count times ($nr_files files)" "
	test-tool write-cache $count
"

test_done
