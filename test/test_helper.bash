#!/usr/bin/env bash

# Resolve the plugin directory (one level up from test/)
PLUGIN_DIR="$(cd "$(dirname "${BATS_TEST_FILENAME}")/.." && pwd)"
export PLUGIN_DIR
