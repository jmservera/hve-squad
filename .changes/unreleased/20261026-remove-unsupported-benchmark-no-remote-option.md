---
bump: patch
type: Fixed
---

- **Live benchmarks passed obsolete Copilot CLI options.** Removed the remote-disable and remote-export-disable flags from workflow, compaction and judge invocations and prerequisite checks (`tests/tier2/live-benchmark/Invoke-EfficiencyExercise.ps1`, `tests/tier2/live-benchmark/EfficiencyBenchmark.psm1`).
