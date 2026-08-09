# r1-connector — Titanium CLI Builder (clibuilder)

**Role:** connector | **Date:** 2026-08-09 | **Inputs:** plan-phase0, kimi-k3, codex-titanium README, xbgst-site, ds4cc TITANIUM-HOST, plazir-15-site pattern

# State
- inf: Empty WD + full Phase-0 plan; product SSoT is external brew/`codex-titanium`, not this tree. Sister pattern split is static-Pages-first (plazir/omegag) vs dual Pages+Nitro (xbgst/config-builder). Name collision with Grok Builder / Config Builder is the dominant IA risk. [strong] — axes: install_clarity product_disambiguation stack_fidelity maintenance_cost evidence_quality deploy_latency
- risk: If copy keeps "CLI Builder" bare, SEO/LLM conflates with ds4cc Grok Builder and config-builder; if site scaffolds Nitro early, deploy_latency and maintenance_cost regress with no install_clarity gain; if install wording drifts from TITANIUM-HOST, dual SSoT rot.

# Dissent
- Planner may keep working title "Titanium CLI Builder" for continuity with plan filename; connector drops "Builder" from public hero/nav (repo folder `clibuilder` stays).
- Capacity agents may push xbgst-style dual surface now; connector defers Vercel/Nitro until M02 evidence needs interactive install.
- Distiller may want long feature list from codex-titanium README (Delete-key, browser adapters); connector keeps v0 SLIM: host+64+brew+verify only; browser CDP detail stays on product README.

# Rationale
Strange angle: the **site’s zero-build static shape is product evidence of the SLIM decision** — selling hardened host + Godspeed/64, not a second monorepo. Install two-liner must be **byte-identical** to ds4cc `TITANIUM-HOST.md` so link/version smoke fails closed on drift. Disambiguation is one hero sentence + Host CLI language, not a glossary page.

---

## Accepted cross-axis moves (only)

1. **Public product name:** "Titanium CLI" / "Titanium Host" in hero + nav; never bare "Builder". Keep `clibuilder` as repo/WD only.
2. **Hero disambiguation (one sentence):** hardened Codex host binary — not Config Builder (TOML editor), not Grok Builder (ds4cc install UX).
3. **Hero CTA = identical two-liner** to ds4cc `docs/TITANIUM-HOST.md`:
   - `brew install VeigaPunk/tap/codex-titanium`
   - `install -Dm600 titanium/config.toml "${CODEX_HOME:-$HOME/.codex}/config.toml"`
4. **Version pin once:** `0.147.0-alpha.11+titanium.1` lives only in `index.html` (README points at it); smoke greps + optional `brew info` JSON check.
5. **IA sections (static SPA anchors):** `/` hero · `#what` · `#install` · `#config` · `#stack` · `#no-mcp` · `#verify` · `#related` · footer disclaimer (independent fork, Apache-2.0, not OpenAI).
6. **Stack table (sourced numbers only):** Titanium multi_agent_v2 **64** · Grok host **16** · sekhmet L3 **64** — each cell links codex-titanium preset / operator rules / TITANIUM-HOST or xbrd-spark.
7. **`#verify` one paste block:** `codex-titanium --version` expects pin + `CODEX_BIN` resolve order from TITANIUM-HOST; no prose between steps.
8. **`#config`:** preset one-liner + outbound link to Config Builder for deep edit; do not embed TOML editor.
9. **`#related` cards (role one-liners):** codex-titanium (source) · ds4cc marketplace (Grok Builder UX + host resolve) · xbgst-site (godspeed hub) · grok-build-config-builder (TOML builders) · xbrd-spark/sekhmet (L3).
10. **v0 stack shape:** root `index.html` + `style.css` + `robots.txt` + `scripts/smoke.sh` + `README.md` + `assets/` — **no** package.json/Nitro/Vercel in M01 (plazir/omegag fidelity to SLIM).
11. **Deploy:** Pages-first `main` / root → `veigapunk.github.io/clibuilder`; dual-remote optional later; CNAME/Vercel deferred M02.
12. **Smoke gate before inbound cross-links:** `scripts/smoke.sh` greps version pin, `curl -f` outbound sister URLs; pass on Pages URL before xbgst-site/ds4cc add reverse links (plan: outbound-only until skeleton live).
13. **Scope fence:** this repo is website host only — never vendor `codex-rs` / full codex-titanium tree.
14. **SLIM marketing fence:** sell hardened host + Godspeed/64 + brew + L3 substrate; do not re-market full excision rebase as value.
15. **Secrets fence:** install docs only; no op reveals / session material.
16. **First commit set:** `index.html` (plan section table) + `style.css` + `scripts/smoke.sh` + `README.md` (route table + last-verified smoke note).

# Axes check
| Axis | Move effect |
| --- | --- |
| install_clarity | Identical brew+config two-liner + verify block |
| product_disambiguation | Host CLI naming + hero negation + related cards |
| stack_fidelity | 64/16/64 table + SLIM static site + no-MCP + disclaimer |
| maintenance_cost | Zero framework; single version file; bash smoke |
| evidence_quality | Sourced stack claims; smoke as last-verified |
| deploy_latency | Pages root one-push; defer dual surface |

# Obs
- kimi-k3: OK (concrete moves; aligned with plan)
- Local: clibuilder only `.xbgst/`; codex-titanium README confirms brew + config + 64 + MCP-off
