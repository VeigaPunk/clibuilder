# R3 Executor — hero/version honesty (brew ≠ monorepo tip)

**Role:** gx-executor-r3  
**Date:** 2026-08-09  
**WD:** `/home/vgpnk1337/Projects/clibuilder`  
**Commit:** none (task: no commit)

## Axes

| Axis | Move |
| --- | --- |
| **install_truth** | Hero no longer presents a single monorepo triple as the brew deliverable |
| **version_fidelity** | Dual story: monorepo tip vs published formula; verify with `--version` |
| **ci_honesty** | Smoke family needles only — dropped hard-require of exact `0.147` |

## Reviewer facts (inputs)

- Brew / latest release: `0.146.0-alpha.10.1+titanium.1`
- Monorepo tip / product pin: `0.147.0-alpha.11+titanium.1`

## Changes

### `index.html`

1. **Hero pill** — family first: `titanium.1 channel`; dual line  
   `Monorepo tip: 0.147.0-alpha.11+titanium.1 · Install via brew for the published formula artifact (verify with codex-titanium --version)`  
   Title: monorepo tip and brew formula can diverge.
2. **What / why** — monorepo tip vs brew formula (e.g. 0.146.*+titanium.1); do not treat monorepo tip as brew deliverable; trust `--version`.
3. **Verify** — titanium.1 channel; monorepo tip and brew can differ; trust CLI output.

### `scripts/smoke.sh`

- Require family: `titanium`, `titanium.1`, `codex-titanium`, brew formula string, independent/not official OpenAI, `64`, `codex-titanium --version`.
- **Removed** hard needle `"0.147"`.
- Added honesty gates: `titanium.1 channel` or brew lag/formula language; verify/trust `--version`.
- Optional informational check if `0.146`/`0.147` digits appear (neither required alone).

### `README.md`

- Version channel row: titanium.1 family; brew vs monorepo can diverge.
- Install prose: published formula artifact; example lag 0.146 vs 0.147; trust `--version`.
- Config one-liner: monorepo root after clone (brew does not place preset).
- Smoke section: family needles; exact triples not required.

## Evidence

### Smoke (after)

```text
$ bash scripts/smoke.sh
OK: required files present
OK: required family needles in index.html
OK: version digits present (0.146 and/or 0.147 family — informational)
OK: README brand lock
WARN: python3 blocked/unavailable for http.server — skip HTTP (content checks pass)
SMOKE PASS
exit=0
```

### Diff rationale

| File | Why |
| --- | --- |
| `index.html` | Blocker: single 0.147 pin as brew-facing hero was false vs formula 0.146 |
| `scripts/smoke.sh` | CI no longer freezes monorepo `0.147` as required truth |
| `README.md` | Align install hub docs with HTML honesty |

**Status:** done  
**Ship:** not requested (no commit).
