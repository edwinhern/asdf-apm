#!/usr/bin/env bash

set -euo pipefail

TOOL_NAME="apm"
GH_REPO="microsoft/apm"
GH_API="https://api.github.com/repos/${GH_REPO}"

fail() {
  echo -e "asdf-${TOOL_NAME}: $*" >&2
  exit 1
}

get_platform() {
  local os arch

  case "$(uname)" in
    Linux) os="linux" ;;
    Darwin) os="darwin" ;;
    *) fail "Unsupported OS: $(uname). Only Linux and macOS are supported." ;;
  esac

  case "$(uname -m)" in
    x86_64) arch="x86_64" ;;
    arm64 | aarch64) arch="arm64" ;;
    *) fail "Unsupported architecture: $(uname -m)." ;;
  esac

  echo "${os}-${arch}"
}

get_download_url() {
  local version="$1"
  local platform
  platform="$(get_platform)"
  echo "https://github.com/${GH_REPO}/releases/download/v${version}/apm-${platform}.tar.gz"
}

get_checksum_url() {
  local version="$1"
  local platform
  platform="$(get_platform)"
  echo "https://github.com/${GH_REPO}/releases/download/v${version}/apm-${platform}.tar.gz.sha256"
}

list_all_versions() {
  local releases_url="${GH_API}/releases?per_page=100"
  local auth_header=""

  if [[ -n ${GITHUB_API_TOKEN:-} ]]; then
    auth_header="Authorization: token ${GITHUB_API_TOKEN}"
  fi

  local page=1
  local versions=""

  while true; do
    local page_url="${releases_url}&page=${page}"
    local response

    if [[ -n ${auth_header} ]]; then
      response=$(curl -fsSL -H "${auth_header}" "${page_url}" 2>/dev/null)
    else
      response=$(curl -fsSL "${page_url}" 2>/dev/null)
    fi

    local page_versions
    page_versions=$(echo "${response}" | grep -o '"tag_name": *"[^"]*"' | grep -o '"v[^"]*"' | tr -d '"v' || true)

    if [[ -z ${page_versions} ]]; then
      break
    fi

    versions="${versions} ${page_versions}"
    page=$((page + 1))
  done

  echo "${versions}" | tr ' ' '\n' | grep -v '^$' | sort -V | tr '\n' ' '
}

verify_checksum() {
  local file="$1"
  local checksum_file="$2"

  local expected actual
  expected=$(cut -d' ' -f1 <"${checksum_file}")

  if command -v sha256sum &>/dev/null; then
    actual=$(sha256sum "${file}" | cut -d' ' -f1)
  elif command -v shasum &>/dev/null; then
    actual=$(shasum -a 256 "${file}" | cut -d' ' -f1)
  else
    echo "asdf-${TOOL_NAME}: WARNING: No sha256sum or shasum found, skipping checksum verification." >&2
    return 0
  fi

  if [[ ${expected} != "${actual}" ]]; then
    fail "Checksum verification failed for ${file}. Expected: ${expected}, Got: ${actual}"
  fi
}

curl_download() {
  local url="$1"
  local dest="$2"
  local auth_header=""

  if [[ -n ${GITHUB_API_TOKEN:-} ]]; then
    auth_header="Authorization: token ${GITHUB_API_TOKEN}"
  fi

  if [[ -n ${auth_header} ]]; then
    curl -fsSL -H "${auth_header}" -o "${dest}" "${url}" ||
      fail "Failed to download ${url}"
  else
    curl -fsSL -o "${dest}" "${url}" ||
      fail "Failed to download ${url}"
  fi
}
