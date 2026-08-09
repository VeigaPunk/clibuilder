# R2 Reviewer — Titanium Host / clibuilder factual audit

**Role:** gx-reviewer-r2  
**Date:** 2026-08-09  
**WD:** `/home/vgpnk1337/Projects/clibuilder`  
**Evidence:** file reads + live smoke + HTTP probes of brew formula / releases + local binary

## Axes

| Axis | Question |
| --- | --- |
| **install_truth** | Does primary brew path deliver what the site claims? |
| **version_fidelity** | Monorepo pin vs formula vs GitHub Release vs local binary |
| **concurrency** | 64 titanium · 16 host · 64 sekhmet stated correctly? |
| **identity** | No false “official OpenAI”; binary names; product brand |
| **config_path** | CODEX_HOME install line runnable by cold traffic? |

## Canonical sources (ground truth)

| Source | Path / URL | What it proves |
| --- | --- | --- |
| codex-titanium README | `~/Projects/codex-titanium/README.md` | brew `VeigaPunk/tap/codex-titanium`; symlink; monorepo pin `0.147.0-alpha.11+titanium.1`; config install line; independent fork |
| titanium preset | `~/Projects/codex-titanium/titanium/config.toml` | `approval_policy=never`, `sandbox_mode=danger-full-access`, `[features.multi_agent_v2] max_concurrent_threads_per_session = 64` |
| TITANIUM-HOST | `~/Projects/ds4cc-marketplace/docs/TITANIUM-HOST.md` | resolve `CODEX_BIN` → `codex-titanium` → `codex`; brew + config one-liners; sekhmet via xbrd-spark cargo install |
| Homebrew formula (live) | `https://raw.githubusercontent.com/VeigaPunk/homebrew-tap/master/Formula/codex-titanium.rb` | version **`0.146.0-alpha.10.1+titanium.1`**; Linux x86_64 only; `bin.install "codex" => "codex-titanium"` + symlink `codex` |
| GitHub latest release | `VeigaPunk/codex-titanium/releases/latest` | tag **`v0.146.0-alpha.10.1-titanium.1`** only (no 0.147 release published) |
| Local binary | `~/.local/bin/codex-titanium` | `codex-cli 0.147.0-alpha.11+titanium.1`; `codex` → `codex-titanium` symlink |

## Smoke

```text
bash scripts/smoke.sh
→ OK: required files present
→ OK: required family needles in index.html
→ OK: README brand lock
→ WARN: python3 blocked for http.server (non-fatal)
→ SMOKE PASS  exit=0
```

(Re-run after reviewer HTML patches — still green.)

---

## State

### Bugs (production-relevant)

- **obs: brew/primary install does not ship the site’s 0.147 monorepo pin** — `index.html` hero + what section document `0.147.0-alpha.11+titanium.1` while **primary** path `brew install VeigaPunk/tap/codex-titanium` installs formula **`0.146.0-alpha.10.1+titanium.1`**, matching GitHub `releases/latest` (no 0.147 asset). Cold traffic on the install hub will get a different binary than the hero advertises. — severity: **blocker** [certain]  
  - Evidence: formula `version "0.146.0-alpha.10.1+titanium.1"`; API latest tag `v0.146.0-alpha.10.1-titanium.1`; monorepo README + local binary on 0.147.  
  - **Mitigation applied (HTML):** hero/what/install/verify now state monorepo pin vs “brew formula / GitHub Releases can lag”; still keep `0.147` + `titanium.1` needles for smoke.  
  - **Remaining:** formula + public release must bump to 0.147 **or** site must stop implying 0.147 is what brew installs (smoke currently **requires** `"0.147"` in HTML — CI locks the monorepo story). README still does not mention brew lag.  
  - Out-of-repo fix: update `VeigaPunk/homebrew-tap` Formula + cut GitHub Release for 0.147.

- **obs: config install one-liner is cwd-relative and fails from a cold shell** — `install -Dm600 titanium/config.toml "${CODEX_HOME:-$HOME/.codex}/config.toml"` requires **codex-titanium monorepo root after clone**; brew install alone does **not** place `titanium/config.toml` on disk. Same line appears in upstream README/TITANIUM-HOST, but this hub is the public install surface — footgun for paste-runners. — severity: **high** [certain]  
  - **Mitigation applied (HTML):** label now says “run from codex-titanium monorepo root after clone”.  
  - README still omits cwd caveat.

- **obs: L3 “worker host is Titanium” overstated absolute** — TITANIUM-HOST resolve is `CODEX_BIN` → `codex-titanium` → stock `codex`. Absolute “worker host is Titanium” is false if only stock OpenAI `codex` is on PATH. — severity: **medium** [certain]  
  - **Mitigation applied (HTML):** stack metric now requires `CODEX_BIN=codex-titanium` and mentions fall-through.

### Pass checks (no false claims found)

| Check | Result | Notes |
| --- | --- | --- |
| Brew formula path `VeigaPunk/tap/codex-titanium` | **pass** | Matches monorepo README, TITANIUM-HOST, live formula under `homebrew-tap/Formula/codex-titanium.rb` |
| Binary names `codex-titanium` + `codex` symlink | **pass** | Formula + local PATH + docs agree |
| Concurrency 64 / 16 / 64 | **pass** | multi_agent_v2 `max_concurrent_threads_per_session=64`; Grok host 16; sekhmet `-j 64` / `XBRD_SPARK_JOBS=64` |
| Not official OpenAI | **pass** | Disclaimer + “not an official OpenAI” + independent fork; disambiguates stock cask/npm |
| Config dest path `CODEX_HOME` / `~/.codex/config.toml` | **pass** | Matches README + TITANIUM-HOST |
| Brand “Titanium Host” (not Grok/Config Builder) | **pass** | Hero + README lock; smoke needles for both builders |

### Nits

- **nit:** Config card label `multi_agent_v2 threads` is informal; SSoT field is `max_concurrent_threads_per_session` under `[features.multi_agent_v2]`. Not false. — low  
- **nit:** Site never shows TITANIUM-HOST sekhmet install (`cargo install --git …/xbrd-spark`); only `sekhmet swarm -j 64`. Verify assumes sekhmet already present. — low/medium product gap  
- **nit:** Smoke freezes monorepo `"0.147"` string; when brew is correct and monorepo moves, smoke fails until HTML updated (or brew truth and monorepo diverge further). Prefer generated `version.json` or dual needles (brew pin + monorepo pin). — medium process  
- **nit:** README config block still lacks monorepo-root cwd note and brew lag note after HTML fixes. — low  
- **nit:** Local HTTP smoke always WARNs under xbgst python wall; content needles are the real gate. — low  
- **nit:** `robots.txt` is a web-standard exception to no-txt rules; not a product bug.

### HTML fixes applied by reviewer (critical/small)

1. Hero pill: monorepo pin title + “brew may lag” copy.  
2. What section: monorepo 0.147 vs brew/Release lag; trust `--version`.  
3. Install lede/matrix/config label: formula lag; monorepo cwd for preset.  
4. Stack L3: CODEX_BIN resolve + fall-through (not absolute “worker is Titanium”).  
5. Verify version hint: brew may report older titanium.1.  
6. Disclaimer punctuation: “fork — not an official…”.

Smoke re-run: **PASS**.

---

# Artifact: review

```markdown
scope: clibuilder static hub (index.html, README.md, scripts/smoke.sh, smoke.yml) vs codex-titanium README, titanium/config.toml, TITANIUM-HOST.md, live homebrew-tap formula, GitHub releases/latest, local codex-titanium binary
verdict: concerns
```

**Why not fail:** brew path, binary names, concurrency planes, OpenAI disclaimers, and CODEX_HOME dest path match SSoT. Smoke green after patches.

**Why not pass:** primary install vs hero version is a real production lie until formula/release catch 0.147 **or** copy/smoke stop treating monorepo pin as the brew deliverable. Config one-liner still easy to mis-run from README.

## Recommended next moves (executor / formula owner)

1. **Ship formula + GH release** for `0.147.0-alpha.11+titanium.1` (or whatever monorepo ships) so brew truth = hero.  
2. Or **dual-pin UI**: “Monorepo `0.147…` · Formula `0.146…`” with smoke checking both.  
3. README: monorepo-root note on config line; brew lag one-liner.  
4. Optional: link TITANIUM-HOST sekhmet install command in Verify.

## Return format (dispatcher)

```markdown
# State
- obs: brew formula + latest release are 0.146.0-alpha.10.1+titanium.1 while site monorepo pin is 0.147.0-alpha.11+titanium.1 — primary install does not match hero — severity: blocker [certain]
- obs: config install needs monorepo cwd; brew alone does not supply titanium/config.toml — severity: high [certain] (HTML label fixed; README still bare)
- obs: concurrency 64/16/64, brew path VeigaPunk/tap/codex-titanium, binary names, not-official-OpenAI — correct [certain]
- risk: smoke locks "0.147" forever while brew lags → green CI on false install story [moderate]

# Artifact: review
scope: clibuilder hub vs titanium README + TITANIUM-HOST + live formula/releases
verdict: concerns
```
