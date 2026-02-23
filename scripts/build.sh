#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(cd -- "${SCRIPT_DIR}/.." && pwd)"

case "$(uname -s)" in
Linux) OS="linux" ;;
Darwin) OS="darwin" ;;
*)
  echo "Unsupported OS: $(uname -s)" >&2
  exit 1
  ;;
esac

case "$(uname -m)" in
x86_64 | amd64) ARCH="amd64" ;;
aarch64 | arm64) ARCH="arm64" ;;
*)
  echo "Unsupported architecture: $(uname -m)" >&2
  exit 1
  ;;
esac

BIN="${ROOT_DIR}/ra2fnt/ra2fnt-${OS}-${ARCH}"

if [[ ! -x "${BIN}" ]]; then
  echo "ra2fnt binary not found or not executable: ${BIN}" >&2
  exit 1
fi

"${BIN}" create -in "${ROOT_DIR}/src" -out "${ROOT_DIR}/game.fnt"
