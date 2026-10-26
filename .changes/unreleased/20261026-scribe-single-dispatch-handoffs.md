---
bump: patch
type: Fixed
---

- **Ordinary handoffs no longer need a model-generated payload file.** The existing writer accepts actual single-dispatch facts, derives the record envelope and active roles, and retains supplied consumption evidence or clearly estimated fallbacks. The same serialization, freshness, attribution, rollback and receipt checks remain in force; Scribe guidance preserves failure exits and prohibits refreshing stale evidence (`squad-src/.github/skills/squad/scripts/Write-SquadHandoff.ps1`, `squad-src/.github/skills/squad/references/economy-scribe.md`).
