#!/usr/bin/env bats

setup() {
  load "$(dirname "$BATS_TEST_FILENAME")/test_helper"
}

@test "latest-stable returns a version string" {
  run bash "${PLUGIN_DIR}/bin/latest-stable"
  [ "$status" -eq 0 ]
  [ -n "$output" ]
}

@test "latest-stable version matches semver pattern" {
  run bash "${PLUGIN_DIR}/bin/latest-stable"
  [ "$status" -eq 0 ]
  [[ "$output" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]
}
