# Titanium Host

Public **install hub** / CLI host surface for **Codex Titanium** (`codex-titanium`) — an independent source fork of OpenAI Codex CLI with Godspeed-oriented defaults, multi-agent v2 at **64** threads, and hard-disabled MCP / built-in browser / memories lanes.

| | |
| --- | --- |
| **Public name** | **Titanium Host** (alias: Titanium CLI) |
| **This repo** | Static website only (`clibuilder` on disk) — GitHub Pages ready |
| **Binary SSoT** | [VeigaPunk/codex-titanium](https://github.com/VeigaPunk/codex-titanium) — **not** vendored here |
| **Primary install** | `brew install VeigaPunk/tap/codex-titanium` (Linux x86_64) — published formula artifact |
| **Secondary** | Cargo build from `codex-rs` in the codex-titanium monorepo (monorepo tip / other platforms) |
| **Version channel** | **titanium.1** family — monorepo tip and brew formula can diverge; always `codex-titanium --version` |

**Not** Grok Builder, **not** Config Builder / [grok-build-config-builder](https://github.com/VeigaPunk/grok-build-config-builder), **not** an npm package builder.

Independent fork; **not an official OpenAI** distribution. Apache-2.0 upstream license preserved.

## Install

```sh
brew install VeigaPunk/tap/codex-titanium
codex-titanium --version
```

Formula installs `codex-titanium` and a `codex` symlink from the **published formula artifact** (see [VeigaPunk/tap](https://github.com/VeigaPunk/homebrew-tap)). That pin may lag monorepo tip (e.g. brew on a 0.146.*+titanium.1 release while monorepo documents 0.147.*+titanium.1). Trust `--version` on the installed binary, not a single site hero number.

Other platforms: build the Rust CLI from `codex-rs` with Cargo until native release artifacts exist.

Optional Titanium preset (unrestricted Godspeed / L3 default — **risk ladder**, not a brag). Run from the **codex-titanium monorepo root after clone** (brew alone does not place `titanium/config.toml` on disk):

```sh
install -Dm600 titanium/config.toml "${CODEX_HOME:-$HOME/.codex}/config.toml"
```

Default posture: `approval_policy = "never"`, `sandbox_mode = "danger-full-access"`, multi_agent_v2 **64**. Operators who need sandboxed execution or approval prompts must edit config (or use Config Builder).

## Stack fidelity

| Plane | Cap | Notes |
| --- | --- | --- |
| Titanium multi_agent_v2 | **64** | Inside `codex-titanium` / preset |
| Host Grok subagents | **16** | Grok Build host — not this binary |
| L3 sekhmet | **-j 64** | xbrd-spark; set `CODEX_BIN=codex-titanium` |

## Local host

```bash
cd /path/to/clibuilder
python3 -m http.server 8765 --bind 127.0.0.1
# open http://127.0.0.1:8765/
```

## Smoke

```bash
bash scripts/smoke.sh
```

CI: `.github/workflows/smoke.yml` runs the same script on push/PR.

Fails if required product **family** needles are missing from `index.html` (brew formula string, codex-titanium, titanium / titanium.1 channel, independent fork / not official OpenAI, 64, verify `--version`, related URLs, risk ladder language). Exact monorepo triples (`0.147` / `0.146`) are **not** required so CI does not force a false “brew == monorepo tip” claim.

## Related links

- [codex-titanium](https://github.com/VeigaPunk/codex-titanium) — CLI binary + `titanium/` preset
- [VeigaPunk/tap](https://github.com/VeigaPunk/homebrew-tap) — Homebrew formula
- [xbgst-site (Pages)](https://veigapunk.github.io/xbgst-site/) — Grok-native godspeed hub
- [ds4cc.com](https://ds4cc.com) / [ds4cc-marketplace](https://github.com/VeigaPunk/ds4cc-marketplace) — marketplace + TITANIUM-HOST docs
- [xbrd-spark](https://github.com/VeigaPunk/xbrd-spark) — sekhmet L3 substrate
- [grok-build-config-builder](https://github.com/VeigaPunk/grok-build-config-builder) — Config Builder (sibling)

## Disclaimer

This site and the Titanium CLI are **independent** of OpenAI. Not affiliated with or endorsed by OpenAI. Use at your own risk; default Godspeed preset skips approvals and uses full sandbox access unless you tighten config.
