---
bump: patch
type: Fixed
---

- **Live benchmarks passed an unsupported Copilot CLI option.** Removed the obsolete remote-disable flag from workflow, compaction and judge invocations and prerequisite checks while preserving remote-export protection (`tests/tier2/live-benchmark/Invoke-EfficiencyExercise.ps1`, `tests/tier2/live-benchmark/EfficiencyBenchmark.psm1`).
