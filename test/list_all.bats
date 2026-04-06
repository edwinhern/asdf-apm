#!/usr/bin/env bats

setup() {
  load "$(dirname "$BATS_TEST_FILENAME")/test_helper"
}

@test "list-all returns at least one version" {
  run bash "${PLUGIN_DIR}/bin/list-all"
  [ "$status" -eq 0 ]
  [ -n "$output" ]
}

@test "list-all output is space-separated" {
  run bash "${PLUGIN_DIR}/bin/list-all"
  [ "$status" -eq 0 ]
  # Output should contain spaces (multiple versions)
  [[ "$output" == *" "* ]]
}

@test "list-all versions are sorted" {
  run bash "${PLUGIN_DIR}/bin/list-all"
  [ "$status" -eq 0 ]
  sorted=$(echo "$output" | tr ' ' '\n' | sort -V | tr '\n' ' ')
  [ "$output " = "$sorted" ]
}
