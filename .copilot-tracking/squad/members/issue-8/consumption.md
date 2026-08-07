---
description: "Squad consumption ledger: members, models, estimated tokens, cost, and AI credits"
---

# Squad Consumption Ledger (Run: issue-8)

## Attribution

| Role          | Member | Agent               | Model           | Model Source       | Priced As | Tier    |
| ------------- | ------ | -------------------- | --------------- | ------------------- | --------- | ------- |
| developer     |        | Squad Implementor    | claude-sonnet-5 | session-inherited    | claude-sonnet-5 | default |
| tester        |        | Squad Reviewer       | claude-sonnet-5 | session-inherited    | Claude Haiku 4.5 | fast    |
| orchestration |        | Coordinator + Scribe | claude-sonnet-5 | session-inherited    | claude-sonnet-5 | mixed   |

## Usage & Cost

| Role          | Turns | In Tokens | Cached  | Cache Wr | Out Tokens | Est. Cost (USD) | Est. Credits | Basis     |
| ------------- | ----- | --------- | ------- | -------- | ---------- | ---------------- | ------------ | --------- |
| developer     | 3     | 15,000    | 60,000  | 8,000    | 1,500      | 0.0850            | 8.50         | estimated |
| tester        | 1     | 4,000     | 15,000  | 2,000    | 400        | 0.0110            | 1.10         | estimated |
| orchestration | 2     | 8,000     | 20,000  | 5,000    | 1,000      | 0.0455            | 4.55         | estimated |
| **Total**     | **6** | **27,000** | **95,000** | **15,000** | **2,900** | **$0.1415**    | **14.15**    |           |

> Basis: estimated. No per-dispatch token telemetry exists; the runtime exposes only the per-user aggregate `ai_credits_used` via the Copilot usage-metrics REST API. `Model` is resolved per *Model Attribution* — `session-inherited` because no agent-pinned model or operator declaration overrode the session model. `Priced As` is the rate row used and differs from `Model` only for the `tester` row, which is priced at the `fast` tier's most expensive member per the tier-fallback rule. `Turns` is the estimated internal tool-loop turn count for the dispatch. The two tables share the same `Role` order so a row in one lines up with the same row in the other. Token rates and the dispatch-size estimator come from `consumption-rates.md` (observed 2026-08-07). Calibration factor 1.00 (0 reconciled runs — uncalibrated). 1 AI credit = $0.01 USD.

## Cost Comparison (illustrative)

This run consumed an estimated **$0.1415 (~14.15 AI credits)** across 2 specialized roles plus orchestration for a small, single-file Python example task. Reproducing the same outcome by manually prompting a single high-capability model across a few iterate-and-test turns is estimated at **$0.30 (~30.00 AI credits)**, a reduction of about 53%.

> Estimates only. Token rates change. See `consumption-rates.md` for current rates, the dispatch-size estimator, and the calibration methodology. Token counts and iteration counts are illustrative, not guarantees.
