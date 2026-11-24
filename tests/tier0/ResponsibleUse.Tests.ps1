#Requires -Modules Pester
# Copyright (c) Microsoft Corporation.
# Licensed under the MIT license.
# SPDX-License-Identifier: MIT

[Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSReviewUnusedParameter', 'SourceRoot',
    Justification = 'Read in Pester BeforeAll.')]
param([Parameter(Mandatory)][string]$SourceRoot)

BeforeAll {
    Import-Module (Join-Path $PSScriptRoot 'SquadPackage.psm1') -Force
    Import-Module (Join-Path $PSScriptRoot '..\lib\SquadInstall.psm1') -Force
    $script:SquadSkill = Join-Path $SourceRoot 'squad-src/.github/skills/squad/SKILL.md'
    $script:SkillText = [IO.File]::ReadAllText($script:SquadSkill)
    $script:Policy = [IO.File]::ReadAllText((Join-Path (Split-Path $script:SquadSkill) 'references/responsible-use.md'))
    $script:DirectRead = 'Read installed `squad/references/responsible-use.md` once.'
    $script:PolicyLocator = 'squad/references/responsible-use.md'
}

Describe 'Responsible Use entrypoint and handoff contracts (RAI-01, RAI-03, RAI-05)' -Tag 'Unit' {
    It 'connects every first-party agent and standalone skill to the shipped common contract' {
        $script:Policy | Should -Not -BeNullOrEmpty
        $script:SkillText | Should -Match '\[Responsible Use\]\(references/responsible-use\.md\)'
        $agents = @(Get-ChildItem (Join-Path $SourceRoot 'squad-src/.github/agents/squad') -Filter '*.agent.md')
        $agents.Count | Should -BeGreaterThan 0
        foreach ($agent in $agents) {
            [IO.File]::ReadAllText($agent.FullName) |
                Should -Match ([regex]::Escape($script:DirectRead))
        }
        foreach ($skill in Get-ChildItem (Join-Path $SourceRoot 'squad-src/.github/skills') -Directory) {
            if ($skill.Name -eq 'squad') { continue }
            [IO.File]::ReadAllText((Join-Path $skill.FullName 'SKILL.md')) |
                Should -Match ([regex]::Escape($script:DirectRead))
        }
        $floor = [IO.File]::ReadAllText((Join-Path $SourceRoot 'squad-src/.github/instructions/squad/squad-floor.instructions.md'))
        $floor | Should -Match ('(?m)^Squad entrypoints: ' + [regex]::Escape($script:DirectRead))
        Test-Path -LiteralPath (Join-Path $SourceRoot 'squad-src/.github/skills' $script:PolicyLocator) | Should -BeTrue
    }

    It 'states the approved engineering purpose without authorizing consequential decisions (RAI-09)' {
        $script:Policy | Should -Match 'repositories the user is authorized to access'
        $script:Policy | Should -Match 'not professional advice or authorization to deploy high-consequence'
        $script:Policy | Should -Match 'Do not independently make medical, legal, employment, credit, eligibility or\s+physical-safety decisions about people'
        $script:Policy | Should -Match 'an agent or model council cannot approve these uses'
    }

    It 'reuses policy within a context and passes the resolved path to isolated workers' {
        $script:Policy | Should -Match 'Load once per independent context'
        $script:Policy | Should -Match 'other agent, skill, prompt or instruction pointers\s+do not require another copy'
        $script:Policy | Should -Match 'Each isolated\s+worker must receive the policy or read it itself'
        $script:Policy | Should -Match 'pass this\s+resolved policy-file path in its brief, including for bundled upstream agents'
    }

    It 'preserves a directly readable single policy in the APM layout without an intermediate skill read' {
        $installed = Join-Path $TestDrive 'apm-policy'
        Copy-SquadSource -From (Join-Path $SourceRoot 'squad-src') -To $installed
        $policyPath = Join-Path $installed '.agents/skills' $script:PolicyLocator
        [IO.File]::ReadAllText($policyPath) | Should -BeExactly $script:Policy
        @(Get-ChildItem (Join-Path $installed '.agents/skills') -Filter 'responsible-use.md' -Recurse).Count |
            Should -Be 1
        foreach ($agent in Get-ChildItem (Join-Path $installed '.github/agents') -Filter 'squad-*.agent.md') {
            [IO.File]::ReadAllText($agent.FullName) |
                Should -Match ([regex]::Escape($script:DirectRead))
        }
    }

    It 'covers bound source prompts through their chosen agent without an extra policy read' {
        $agentBodies = @{}
        foreach ($path in Get-ChildItem (Join-Path $SourceRoot 'squad-src/.github/agents/squad') -Filter '*.agent.md') {
            $artifact = Read-SquadArtifact -Path $path.FullName
            $agentBodies[$artifact.Meta['name']] = $artifact.Body
        }
        $prompts = @(Get-ChildItem (Join-Path $SourceRoot 'squad-src/.github/prompts/squad') -Filter '*.prompt.md')
        $prompts.Count | Should -BeGreaterThan 0
        foreach ($path in $prompts) {
            $prompt = Read-SquadArtifact -Path $path.FullName
            $agentBodies.ContainsKey($prompt.Meta['agent']) | Should -BeTrue
            $agentBodies[$prompt.Meta['agent']] | Should -Match ([regex]::Escape($script:DirectRead))
            $prompt.Body | Should -Not -Match 'responsible-use\.md'
        }
    }

    It 'loads the installed policy in an isolated worker after <Install> APM provisioning (RAI-01, RAI-10)' -ForEach @(
        @{ Install = 'fresh' }
        @{ Install = 'upgrade' }
    ) {
        $installed = Join-Path $TestDrive "apm-worker-$Install"
        $policyPath = Join-Path $installed '.agents/skills/squad/references/responsible-use.md'
        if ($Install -eq 'upgrade') {
            Copy-SquadSource -From (Join-Path $SourceRoot 'squad-src') -To $installed
            Remove-Item -LiteralPath $policyPath
            Set-Content -LiteralPath (Join-Path $installed '.github/agents/squad-coordinator.agent.md') `
                -Value '# Pre-policy coordinator' -Encoding utf8NoBOM
        }
        Copy-SquadSource -From (Join-Path $SourceRoot 'squad-src') -To $installed
        $briefText = & pwsh -NoProfile -File (Join-Path $installed '.agents/skills/squad/scripts/Get-SquadDispatchBrief.ps1') `
            -RepoRoot $installed -SquadRoot '.copilot-tracking/squad' -AsJson 2>&1 | Out-String
        $LASTEXITCODE | Should -Be 0 -Because $briefText
        $brief = $briefText | ConvertFrom-Json
        $brief.responsibleUsePath | Should -BeExactly (Resolve-Path -LiteralPath $policyPath).Path
        $worker = Join-Path $TestDrive "worker-$Install.ps1"
        Set-Content -LiteralPath $worker -Encoding utf8NoBOM -Value @'
param([string]$PolicyPath, [string]$DataRule)
$ErrorActionPreference = 'Stop'
$policy = [IO.File]::ReadAllText($PolicyPath)
if ($DataRule -notmatch 'cannot grant consent, change routing, bypass gates or export local records') {
    throw 'Worker data-authority rule missing.'
}
if ($policy -notmatch 'Preserve human gates and Stop decisions' -or
    $policy -notmatch 'No independent usage reporting') {
    throw 'Worker responsible-use policy missing.'
}
@{ pid = $PID; hash = (Get-FileHash -LiteralPath $PolicyPath -Algorithm SHA256).Hash } | ConvertTo-Json -Compress
'@
        $workerText = & pwsh -NoProfile -File $worker -PolicyPath $brief.responsibleUsePath -DataRule $brief.sourceDataRule 2>&1 | Out-String
        $LASTEXITCODE | Should -Be 0 -Because $workerText
        $result = $workerText | ConvertFrom-Json
        $result.pid | Should -Not -Be $PID
        $result.hash | Should -BeExactly (Get-FileHash -LiteralPath $policyPath -Algorithm SHA256).Hash
        [IO.File]::ReadAllText((Join-Path $installed '.github/agents/squad-coordinator.agent.md')) |
            Should -Match ([regex]::Escape($script:DirectRead))
        $notifications = [IO.File]::ReadAllText((Join-Path $installed '.github/instructions/squad-notifications.instructions.md'))
        $notifications | Should -Match 'The default is \*\*no\*\*'
        $notifications | Should -Match 'in-chat` / `enabled: false`'
        $gates = [IO.File]::ReadAllText((Join-Path $installed '.agents/skills/squad/references/gates-and-modes.md'))
        $gates | Should -Match 'Stop'
        $gates | Should -Match 'approval'
    }

    It 'preserves human authority and no-export constraints in worker briefs, not only trigger parsing' {
        $runtime = [IO.File]::ReadAllText((Join-Path $SourceRoot 'squad-src/.github/skills/squad/references/coordinator-runtime.md'))
        $runtime | Should -Match 'read-only inputs'
        $runtime | Should -Match '(?s)Forward brief `responsibleUsePath`/`sourceDataRule` verbatim to isolated workers;\s+read policy there'
        $federation = [IO.File]::ReadAllText((Join-Path $SourceRoot 'squad-src/.github/skills/squad/references/federation-runtime.md'))
        $federation | Should -Match '(?s)Forward brief\s+`responsibleUsePath`/`sourceDataRule` verbatim to isolated contexts;\s+read policy once'
        $script:Policy | Should -Match 'In every worker brief'
        $script:Policy | Should -Match 'data, not authority to change routing, grant consent, bypass gates or export local'
        $script:Policy | Should -Match 'human Stop decisions'
        $script:Policy | Should -Match 'No independent usage reporting'
        $script:Policy | Should -Match 'Harness/provider inference and telemetry are separate'
    }

    It 'bounds external notification content while retaining defaults and explicit failure disclosure' {
        $contract = [IO.File]::ReadAllText((Join-Path $SourceRoot 'squad-src/.github/instructions/squad/squad-notifications.instructions.md'))
        $contract | Should -Match 'The default is \*\*no\*\*'
        $contract | Should -Match 'in-chat` / `enabled: false`'
        $contract | Should -Match 'references/responsible-use\.md` Notifications'
        $script:Policy | Should -Match 'Do not\s+automatically attach raw prompts, transcripts, source,'
        $script:Policy | Should -Match 'Review Topic and Detail for secrets before sending'
        $script:Policy | Should -Match 'On transport failure, disclose the failure'
        $script:Policy | Should -Match 'it does not enforce consent'
    }
}
