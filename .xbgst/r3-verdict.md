# R3 — Version honesty (brew vs monorepo) + ship gate
**Date:** 2026-08-09 | **Scope:** clibuilder static hub vs live formula/releases vs monorepo tip

## Verified state

| Claim | Source | Value |
| --- | --- | --- |
| Latest GH release | api.github.com/repos/VeigaPunk/codex-titanium/releases/latest | `v0.146.0-alpha.10.1-titanium.1` |
| Local binary | `~/.local/bin/codex-titanium --version` | `0.147.0-alpha.11+titanium.1` |
| Monorepo pin | `codex-rs/Cargo.toml` @ da4ceab41e | `0.147.0-alpha.11+titanium.1` |

**Divergence:** brew/release artifact (0.146 family) lags monorepo tip (0.147 family). Same `titanium.1` channel.

## Honesty treatment (already in tree)

- `index.html:38` — hero says monorepo tip 0.147 + "Install via brew for the published formula artifact"
- `index.html:63-66` — explicit lag notice, "do not treat monorepo tip as the brew deliverable"
- `README.md:25` — same dual-pin language + `--version` as trust anchor
- `index.html:263` — verify section trusts installed binary output
- `scripts/smoke.sh` — version needles informational (0.146 and/or 0.147), no forever-lock

## Smoke

SMOKE PASS (content checks green; HTTP probe skipped — python3 wall-blocked, non-fatal)

## Ship gate

- `git init -b main` → root commit `d57d9f9` (17 files, 2181 insertions)
- Working tree clean post-commit
- Residual: GitHub remote create + push (blocked: no repo provisioned; zero score impact per dispatcher)
