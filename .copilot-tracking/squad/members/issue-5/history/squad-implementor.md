# Squad Implementor — issue-5

## 2026-08-07T13:23:17Z — Implement

Created `hello_world.py` at the repository root: a Python 3 script with a `main()` function guarded by `if __name__ == "__main__":` that prints `Hello, World!`. Verified locally with `python3 hello_world.py` (output: `Hello, World!`, exit code 0). Added change fragment `.changes/unreleased/20260807-python-hello-world-example.md` (type `Added`, bump `patch`) via `pwsh scripts/New-ChangeFragment.ps1`, per the repo convention that `CHANGELOG.md` and `apm.yml` `version:` are release outputs never edited directly.
