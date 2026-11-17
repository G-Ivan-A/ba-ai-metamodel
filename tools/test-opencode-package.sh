#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
python3 "$root/build/compile-opencode-package.py" --check
python3 "$root/tests/opencode-package/test_package.py"
python3 "$root/dist/execution-package-opencode/tools/run_task.py" verify-ci
