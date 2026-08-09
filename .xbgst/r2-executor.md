# Executor evidence — R2 Titanium Host

**Role:** gx-executor-r2  
**Date:** 2026-08-09  
**WD:** `/home/vgpnk1337/Projects/clibuilder`  
**Git commit:** not performed (judge owns ship)  
**Remote:** not created

## Axes

| Axis | Move |
| --- | --- |
| Brand clarity | H1/title/meta → **Titanium Host**; subtitle install hub / CLI host surface; disambiguate not Grok Builder / not Config Builder; keep `clibuilder` repo name |
| Risk honesty | Config section is **risk ladder**, not hero brag for never + danger-full-access |
| Smoke stability | Family needles (codex-titanium, brew, titanium.1, 0.147, independent fork, 64, URLs) not single brittle triple-only |
| Ecosystem (M05) | Related: codex-titanium, ds4cc.com + TITANIUM-HOST, veigapunk.github.io/xbgst-site, xbrd-spark, config-builder, homebrew-tap |
| CI (M06) | `.github/workflows/smoke.yml` → `bash scripts/smoke.sh` on push/PR |

## Files touched

| Path | Change |
| --- | --- |
| `index.html` | Titanium Host brand; risk ladder config; related URLs; muted version pin |
| `README.md` | Same brand + risk language + related links |
| `scripts/smoke.sh` | Family needles + workflow file gate + README brand |
| `.github/workflows/smoke.yml` | **new** content-smoke job |
| `.xbgst/r2-executor.md` | this evidence |

## Smoke (after)

```text
OK: required files present
OK: required family needles in index.html
OK: README brand lock
WARN: python3 blocked/unavailable for http.server — skip HTTP (content checks pass)
SMOKE PASS
exit=0
```

## Family needles asserted

- `brew install VeigaPunk/tap/codex-titanium`, `codex-titanium`, `Titanium Host`
- `titanium.1`, `0.147`, `64`
- `not an official OpenAI`, `independent fork`
- `danger-full-access`, `approval_policy`, `never` (under risk ladder, not hero CTA)
- `risk ladder`, `multi_agent`
- `github.com/VeigaPunk/codex-titanium`, `homebrew-tap`
- `veigapunk.github.io/xbgst-site`, `ds4cc.com`, `TITANIUM-HOST`, `xbrd-spark`, `grok-build-config-builder`
- Disambiguation: Not Grok Builder / Config Builder

## Status

R2 judge-approved edits → **done** (no commit, no remote).
