#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
python3 "$root/build/compile-cline-package.py" --check
python3 "$root/tests/cline-package/test_package.py"
python3 "$root/tests/cline-package/test_guides_bash.py"
python3 "$root/dist/execution-package-cline-vscode/tools/run_task.py" verify-ci
