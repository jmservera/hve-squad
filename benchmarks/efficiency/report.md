# Efficiency benchmark

**Status: regression** (exit 3). Observations, not quality approval.

Independent three-sample series; no pairing or statistical-significance claim. Process wall time excludes offline setup and report generation.
Integrity and reviewed workflow/controller provenance are not authenticated model-execution attestation.
- baseCommit: 71a5623f5872a80902d01c8a69acd2387b18df53
- headCommit: 969780d62a3c4a2047bb60b0251c2bb044753197
- mergeBase: 71a5623f5872a80902d01c8a69acd2387b18df53
- policyHash: adb40d1667d07d653c2875ab18854b88f18ec13278e2338d80d8292e9b4b718c
- base seriesId: run-20261019-222802-3624af24
- base sha256: 7cad1c77998fe3cf22b723742485eade434b587eafe3153fde963e48a1bbc4ed
- base sourceHash: c69a057c35921bd53843bf407f9e135c30f655b6d301c69b9d5fa939b05a3e98
- base measuredRevision: e42002bfd51f79bb2e17d974d13b1fb66bc4099b
- base protocol: {&quot;cliVersion&quot;:&quot;1.0.101-0&quot;,&quot;continuations&quot;:1000,&quot;disabledMcpServersHash&quot;:&quot;e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855&quot;,&quot;evaluationPolicy&quot;:&quot;baseline-observation-v1&quot;,&quot;exerciseHash&quot;:&quot;3b16c298fa8cad268555b087aadd409031e2adf9cf174b0e9f89ea38e9aefc20&quot;,&quot;graderHash&quot;:&quot;bd92e8ab81dcc667bc5eacdf1b3e4b6a83a404f6be9e418cb529fdba5dafa8f7&quot;,&quot;hostProfile&quot;:&quot;native-cli-references&quot;,&quot;installHash&quot;:&quot;ad2de4db2641d40c9baa51ae0d5e9c6f9fcb63ee5bf84b4aa644ee683a265e63&quot;,&quot;maxCredits&quot;:1000.0,&quot;model&quot;:&quot;claude-sonnet-5.5&quot;,&quot;parserHash&quot;:&quot;fa3aa1d09976a5a8c68862b439d3d5bf633b2d0024ec5594525bdc05cab4314c&quot;,&quot;powershell&quot;:&quot;7.6.7&quot;,&quot;preparationHash&quot;:&quot;d83bd90ffab57be4b79c8fa904c6a88588210423d11d9854fa01616ac9f5848c&quot;,&quot;recoveryPolicy&quot;:&quot;baseline-observation-v1&quot;,&quot;roleModelPolicyHash&quot;:&quot;2e4a47e7cbed5326653750e88eba035d9b2a7b8c9f09b47a15a9a3818bb3f76c&quot;,&quot;rubric&quot;:&quot;requirements-quality-v1&quot;,&quot;scenarioHash&quot;:&quot;4946fca0eeab4ca66c030a378cda3dcbbc9b720dbaeb729546480e92e4c7787d&quot;,&quot;schema&quot;:&quot;squad-efficiency-v1&quot;,&quot;verifierHash&quot;:&quot;4cd521dced1ebd72a14148800cc8841488dfeec1f21b9b66a655363a10e46834&quot;}
- head seriesId: run-20261020-scribe-succinct
- head sha256: ab5033c5f0b159fe5f4e980783cb0577005c0cc45ba1fcc0244036e184d3e965
- head sourceHash: 117a702258c1d39489c024d3ec3c2187dbce8f55fc96d961767d4cf30eb5c834
- head measuredRevision: c1b1f58f59ac1688c1558fa7b4dade7b47fae3bc
- head protocol: {&quot;cliVersion&quot;:&quot;1.0.101-0&quot;,&quot;continuations&quot;:1000,&quot;disabledMcpServersHash&quot;:&quot;e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855&quot;,&quot;evaluationPolicy&quot;:&quot;baseline-observation-v1&quot;,&quot;exerciseHash&quot;:&quot;3b16c298fa8cad268555b087aadd409031e2adf9cf174b0e9f89ea38e9aefc20&quot;,&quot;graderHash&quot;:&quot;bd92e8ab81dcc667bc5eacdf1b3e4b6a83a404f6be9e418cb529fdba5dafa8f7&quot;,&quot;hostProfile&quot;:&quot;native-cli-references&quot;,&quot;installHash&quot;:&quot;ad2de4db2641d40c9baa51ae0d5e9c6f9fcb63ee5bf84b4aa644ee683a265e63&quot;,&quot;maxCredits&quot;:1000.0,&quot;model&quot;:&quot;claude-sonnet-5.5&quot;,&quot;parserHash&quot;:&quot;fa3aa1d09976a5a8c68862b439d3d5bf633b2d0024ec5594525bdc05cab4314c&quot;,&quot;powershell&quot;:&quot;7.6.7&quot;,&quot;preparationHash&quot;:&quot;d83bd90ffab57be4b79c8fa904c6a88588210423d11d9854fa01616ac9f5848c&quot;,&quot;recoveryPolicy&quot;:&quot;baseline-observation-v1&quot;,&quot;roleModelPolicyHash&quot;:&quot;2e4a47e7cbed5326653750e88eba035d9b2a7b8c9f09b47a15a9a3818bb3f76c&quot;,&quot;rubric&quot;:&quot;requirements-quality-v1&quot;,&quot;scenarioHash&quot;:&quot;4946fca0eeab4ca66c030a378cda3dcbbc9b720dbaeb729546480e92e4c7787d&quot;,&quot;schema&quot;:&quot;squad-efficiency-v1&quot;,&quot;verifierHash&quot;:&quot;4cd521dced1ebd72a14148800cc8841488dfeec1f21b9b66a655363a10e46834&quot;}

Reasons: quality-businessClarity, quality-traceability, quality-risksAndDecisions, quality-total, failed-tools-sum, outcome-build/developer, outcome-build/reviewOutcome, outcome-requirements/reviewOutcome, outcome-requirements/tester, outcome-stage/build, outcome-workflow, outcome-workflow/developer, outcome-workflow/reviewOutcome

10% request/input-token improvement screen: False. This is separate from non-regression and strict promotion.

## Combined-resource screening deltas

| Metric | Median absolute change | Change % (positive is worse) |
|---|---|---|
| credits | 9.215487 | 3.679313564 |
| requests | -5 | -2.941176471 |
| inputTokens | -926200 | -7.605796698 |
| outputTokens | -1990 | -0.90756931 |
| toolCalls | -7 | -2.5 |
| measuredProcessWallSeconds | 15.475 | 1.45227437 |

## workflow resources

| Metric | Base median [min, max]; samples; sum | Head median [min, max]; samples; sum |
|---|---|---|
| credits | 246.3776325 [238.062016, 264.5186265]; 246.3776325, 238.062016, 264.5186265; 748.958275 | 255.8083695 [235.3468345, 258.553469]; 258.553469, 235.3468345, 255.8083695; 749.708673 |
| requests | 169 [157, 174]; 169, 157, 174; 500 | 164 [148, 175]; 164, 148, 175; 487 |
| inputTokens | 12162359 [10832024, 12538300]; 12162359, 10832024, 12538300; 35532683 | 11234445 [10808108, 12857127]; 11234445, 10808108, 12857127; 34899680 |
| outputTokens | 218485 [196121, 226181]; 218485, 196121, 226181; 640787 | 216349 [179459, 239459]; 216349, 179459, 239459; 635267 |
| toolCalls | 280 [250, 290]; 280, 250, 290; 820 | 273 [244, 298]; 273, 244, 298; 815 |
| failedTools | 4 [2, 4]; 4, 2, 4; 10 | 5 [3, 7]; 3, 5, 7; 15 |
| measuredProcessWallSeconds | 1052.312 [1022.545, 1104.376]; 1104.376, 1022.545, 1052.312; 3179.233 | 1067.22 [984.646, 1157.69]; 1067.22, 984.646, 1157.69; 3209.556 |
| cacheReadTokens | 11070529 [9917117, 11391609]; 11070529, 9917117, 11391609; 32379255 | 10163184 [9863536, 11800880]; 10163184, 9863536, 11800880; 31827600 |
| cacheWriteTokens | 1077421 [901508, 1131865]; 1077421, 901508, 1131865; 3110794 | 1041317 [931941, 1057253]; 1057253, 931941, 1041317; 3030511 |
| eventElapsedMs | 1048733 [1019216, 1100228]; 1100228, 1019216, 1048733; 3168177 | 1063445 [981099, 1153951]; 1063445, 981099, 1153951; 3198495 |

## judge resources

| Metric | Base median [min, max]; samples; sum | Head median [min, max]; samples; sum |
|---|---|---|
| credits | 3.88293 [3.70718, 4.08993]; 4.08993, 3.88293, 3.70718; 11.68004 | 3.87468 [3.46943, 5.02371]; 5.02371, 3.46943, 3.87468; 12.36782 |
| requests | 1 [1, 1]; 1, 1, 1; 3 | 1 [1, 1]; 1, 1, 1; 3 |
| inputTokens | 13931 [13404, 15195]; 15195, 13931, 13404; 42530 | 13870 [12085, 16909]; 16909, 12085, 13870; 42864 |
| outputTokens | 847 [782, 891]; 782, 891, 847; 2520 | 928 [898, 939]; 928, 939, 898; 2765 |
| toolCalls | 0 [0, 0]; 0, 0, 0; 0 | 0 [0, 0]; 0, 0, 0; 0 |
| failedTools | 0 [0, 0]; 0, 0, 0; 0 | 0 [0, 0]; 0, 0, 0; 0 |
| measuredProcessWallSeconds | 13.195 [12.575, 13.258]; 12.575, 13.195, 13.258; 39.028 | 13.825 [12.919, 13.843]; 13.825, 12.919, 13.843; 40.587 |
| cacheReadTokens | 2028 [2028, 2028]; 2028, 2028, 2028; 6084 | 2028 [531, 2028]; 531, 2028, 2028; 4587 |
| cacheWriteTokens | 11821 [11294, 13085]; 13085, 11821, 11294; 36200 | 11760 [9975, 16296]; 16296, 9975, 11760; 38031 |
| eventElapsedMs | 10238 [9343, 10343]; 9343, 10238, 10343; 29924 | 10602 [9879, 10627]; 10627, 9879, 10602; 31108 |

## total resources

| Metric | Base median [min, max]; samples; sum | Head median [min, max]; samples; sum |
|---|---|---|
| credits | 250.4675625 [241.944946, 268.2258065]; 250.4675625, 241.944946, 268.2258065; 760.638315 | 259.6830495 [238.8162645, 263.577179]; 263.577179, 238.8162645, 259.6830495; 762.076493 |
| requests | 170 [158, 175]; 170, 158, 175; 503 | 165 [149, 176]; 165, 149, 176; 490 |
| inputTokens | 12177554 [10845955, 12551704]; 12177554, 10845955, 12551704; 35575213 | 11251354 [10820193, 12870997]; 11251354, 10820193, 12870997; 34942544 |
| outputTokens | 219267 [197012, 227028]; 219267, 197012, 227028; 643307 | 217277 [180398, 240357]; 217277, 180398, 240357; 638032 |
| toolCalls | 280 [250, 290]; 280, 250, 290; 820 | 273 [244, 298]; 273, 244, 298; 815 |
| failedTools | 4 [2, 4]; 4, 2, 4; 10 | 5 [3, 7]; 3, 5, 7; 15 |
| measuredProcessWallSeconds | 1065.57 [1035.74, 1116.951]; 1116.951, 1035.74, 1065.57; 3218.261 | 1081.045 [997.565, 1171.533]; 1081.045, 997.565, 1171.533; 3250.143 |
| cacheReadTokens | 11072557 [9919145, 11393637]; 11072557, 9919145, 11393637; 32385339 | 10163715 [9865564, 11802908]; 10163715, 9865564, 11802908; 31832187 |
| cacheWriteTokens | 1090506 [913329, 1143159]; 1090506, 913329, 1143159; 3146994 | 1053077 [941916, 1073549]; 1073549, 941916, 1053077; 3068542 |
| eventElapsedMs | 1059076 [1029454, 1109571]; 1109571, 1029454, 1059076; 3198101 | 1074072 [990978, 1164553]; 1074072, 990978, 1164553; 3229603 |

## Quality and reliability

| Metric | Base | Head |
|---|---|---|
| quality/businessClarity | 18 [17, 18]; 17, 18, 18 | 17 [16, 17]; 16, 17, 17 |
| quality/scopeFidelity | 17 [17, 18]; 17, 18, 17 | 18 [16, 18]; 16, 18, 18 |
| quality/acceptanceCriteria | 17 [15, 18]; 15, 17, 18 | 17 [17, 17]; 17, 17, 17 |
| quality/traceability | 17 [15, 18]; 15, 18, 17 | 16 [16, 16]; 16, 16, 16 |
| quality/risksAndDecisions | 16 [14, 17]; 14, 17, 16 | 15 [14, 16]; 15, 14, 16 |
| quality/total | 86 [78, 88]; 78, 88, 86 | 82 [80, 84]; 80, 82, 84 |
| criticalHighFindings | 1 | 0 |
| build/consumption-rates.md | 3/3 | 3/3 |
| build/consumption.md | 3/3 | 3/3 |
| build/decisions.md | 3/3 | 3/3 |
| build/developer | 3/3 | 2/3 |
| build/dispatchEvidence | 3/3 | 3/3 |
| build/lead | 3/3 | 3/3 |
| build/researcher | 3/3 | 3/3 |
| build/reviewOutcome | 3/3 | 2/3 |
| build/routing.md | 3/3 | 3/3 |
| build/state.json | 3/3 | 3/3 |
| build/stateVerifier | 2/3 | 2/3 |
| build/team.md | 3/3 | 3/3 |
| build/tester | 3/3 | 3/3 |
| completed | 0/3 | 0/3 |
| functional | 2/3 | 3/3 |
| functional/add-unicode | 3/3 | 3/3 |
| functional/blank-title | 3/3 | 3/3 |
| functional/corrupt-store-preserved | 3/3 | 3/3 |
| functional/done-idempotent | 3/3 | 3/3 |
| functional/empty-list | 3/3 | 3/3 |
| functional/id-boundary-preserves-store | 2/3 | 3/3 |
| functional/invalid-action | 3/3 | 3/3 |
| functional/invalid-filter | 3/3 | 3/3 |
| functional/missing-title | 3/3 | 3/3 |
| functional/persistent-ordered-list | 3/3 | 3/3 |
| functional/status-filter | 3/3 | 3/3 |
| functional/unique-increasing-id | 3/3 | 3/3 |
| functional/unknown-id | 3/3 | 3/3 |
| init/consumption-rates.md | 3/3 | 3/3 |
| init/consumption.md | 3/3 | 3/3 |
| init/decisions.md | 3/3 | 3/3 |
| init/dispatchEvidence | 3/3 | 3/3 |
| init/routing.md | 3/3 | 3/3 |
| init/scribeHistory | 3/3 | 3/3 |
| init/state.json | 3/3 | 3/3 |
| init/stateVerifier | 2/3 | 3/3 |
| init/team.md | 3/3 | 3/3 |
| requirements/BRD Builder | 3/3 | 3/3 |
| requirements/BRD Quality Reviewer | 0/3 | 2/3 |
| requirements/brd.md | 3/3 | 3/3 |
| requirements/consumption-rates.md | 3/3 | 3/3 |
| requirements/consumption.md | 3/3 | 3/3 |
| requirements/decisions.md | 3/3 | 3/3 |
| requirements/dispatchEvidence | 3/3 | 3/3 |
| requirements/PRD Builder | 3/3 | 3/3 |
| requirements/PRD Quality Reviewer | 0/3 | 2/3 |
| requirements/prd.md | 3/3 | 3/3 |
| requirements/reviewOutcome | 2/3 | 0/3 |
| requirements/routing.md | 3/3 | 3/3 |
| requirements/scribeHistory | 3/3 | 3/3 |
| requirements/state.json | 3/3 | 3/3 |
| requirements/stateVerifier | 2/3 | 2/3 |
| requirements/team.md | 3/3 | 3/3 |
| requirements/tester | 3/3 | 2/3 |
| stage/build | 2/3 | 1/3 |
| stage/init | 2/3 | 3/3 |
| stage/requirements | 0/3 | 0/3 |
| workflow | 2/3 | 1/3 |
| workflow/consumption-rates.md | 3/3 | 3/3 |
| workflow/consumption.md | 3/3 | 3/3 |
| workflow/decisions.md | 3/3 | 3/3 |
| workflow/developer | 3/3 | 2/3 |
| workflow/dispatchEvidence | 3/3 | 3/3 |
| workflow/lead | 3/3 | 3/3 |
| workflow/researcher | 3/3 | 3/3 |
| workflow/reviewOutcome | 3/3 | 2/3 |
| workflow/routing.md | 3/3 | 3/3 |
| workflow/state.json | 3/3 | 3/3 |
| workflow/stateVerifier | 2/3 | 2/3 |
| workflow/team.md | 3/3 | 3/3 |
| workflow/tester | 3/3 | 3/3 |
| observed brd reviewer dispatch (not file-deliverable acceptance) | 3/3 | 3/3 |
| observed prd reviewer dispatch (not file-deliverable acceptance) | 3/3 | 3/3 |
