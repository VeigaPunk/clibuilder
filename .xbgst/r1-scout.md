# Scout r1 — sister site patterns for Titanium CLI Builder static hub

**Role:** gx-scout-r1  
**Date:** 2026-08-09  
**Axes:** static IA fitness · peer link accuracy · CSS minimal-copy · smoke reproducibility · anti-collision product naming  

---

## State

- obs: xbgst-site ships a **polished static hub** at repo root (`index.html` + `style.css`) for GitHub Pages; separately has React/TanStack under `src/` for Vercel. [certain] — source: `/home/vgpnk1337/Projects/xbgst-site/README.md`, `index.html`, `style.css`, `vercel.json` — axis: IA / deploy
- obs: plazir-15-site is the **best smoke + pure-static template** (file gate, content needles, asset refs, local http.server, optional `SMOKE_LIVE=1`). [certain] — source: `/home/vgpnk1337/Projects/plazir-15-site/scripts/smoke.sh`, `README.md` — axis: smoke
- obs: cc4cc-site is **minimal dark waitlist SPA-in-one-file** (inline CSS, no build); domain pattern CNAME `cc4ds.ds4cc.com`. [certain] — source: `/home/vgpnk1337/Projects/cc4cc-site/index.html`, `README.md` — axis: minimal CSS / domain
- obs: Codex Titanium product facts: fork of Codex `0.147.0-alpha.11` as `0.147.0-alpha.11+titanium.1`; brew `VeigaPunk/tap/codex-titanium`; preset `titanium/config.toml` (Godspeed, never/danger-full-access, multi_agent_v2 **64**, no MCP/browser/memories); independent fork disclaimer. [certain] — source: `/home/vgpnk1337/Projects/codex-titanium/README.md`, `titanium/config.toml` — axis: product copy
- obs: DS4CC documents Titanium as **host binary not plugin**; resolve `CODEX_BIN` → `codex-titanium` → `codex`; sekhmet via xbrd-spark cargo install. [certain] — source: `/home/vgpnk1337/Projects/ds4cc-marketplace/docs/TITANIUM-HOST.md`, `README.md` — axis: install IA
- obs: xbgst-site has **no smoke.sh** (unlike plazir). [certain] — source: grep under xbgst-site — axis: smoke
- gap: public GitHub repo URL for clibuilder not yet created (WD empty). — affects: live Pages URL final path

---

## 1. Recommended static IA sections (v0)

Mirror **xbgst-site section grammar** (nav anchors + hero pill + CTA row + repo grid) with **Titanium CLI product content** from plan + TITANIUM-HOST + codex-titanium README.

| Section id | Label | Purpose | Content seeds (evidence) |
| --- | --- | --- | --- |
| `#top` | brand | sticky nav | Brand: **Titanium CLI** / “CLI Builder” only if disambiguated vs Config Builder |
| hero | — | version pin + primary install CTA | `brew install VeigaPunk/tap/codex-titanium`; version `0.147.0-alpha.11+titanium.1` (`codex-titanium/README.md`) |
| `#what` | What | is / is not | Independent Codex fork; Apache-2.0; **not** official OpenAI; host binary not marketplace plugin (`TITANIUM-HOST.md`, README disclaimer) |
| `#install` | Install | matrix | brew Linux x86_64; cargo build `codex-rs`; resolve order `CODEX_BIN` → `codex-titanium` → `codex` |
| `#config` | Config | one-liner preset | `install -Dm600 titanium/config.toml "${CODEX_HOME:-$HOME/.codex}/config.toml"`; Godspeed axes; deep TOML editor → Config Builder (outbound) |
| `#stack` | Stack | concurrency planes | Titanium multi_agent_v2 **64**; Grok host specialists **16**; sekhmet L3 **64** jobs (`titanium/config.toml`, xbgst-site concurrency section) |
| `#no-mcp` | Policy | hardened defaults | MCP/apps/memories/browser-use **hard-off** on Titanium; agent-browser CDP plugins for UI adapters; Exa praise lives on ds4cc not here |
| `#verify` | Verify | post-install | `codex-titanium --version`; PATH; optional sekhmet install |
| `#related` | Related | sister surfaces | table of peer URLs below |
| footer | — | license + disclaimer | independent fork; Apache-2.0 notice |

**Optional (plazir-grade polish only if capacity):** skip-link, OG meta, `robots.txt`, `404.html`, `sitemap.xml` — plazir has all; xbgst static hub does not need SW/json-ld for a CLI product hub.

---

## 2. Exact peer URLs / links to use

### Live hubs

| Surface | URL | Evidence |
| --- | --- | --- |
| xbgst hub (Pages) | https://veigapunk.github.io/xbgst-site/ | `xbgst-site/README.md` |
| xbgst source | https://github.com/VeigaPunk/xbgst-site | same |
| ds4cc product / marketplace | https://ds4cc.com | xbgst `index.html` CTA; ds4cc README |
| ds4cc MCP (do **not** market as Titanium default) | https://app.ds4cc.com/mcp | ds4cc README — cite only as marketplace app, not Titanium policy |
| Exa praise (off-product) | https://ds4cc.com/exa.html | ds4cc README MCP stance |
| Bloat / anti-patterns surface | https://ds4cc.com/bloat.html | ds4cc README |
| Plazir fan site (pattern only, not product peer) | https://veigapunk.github.io/ | plazir README |
| CC4DS waitlist | https://cc4ds.ds4cc.com (CNAME in `cc4cc-site`) | `cc4cc-site/README.md` |
| Telegram dark path (CC4 only) | https://t.me/cc4ds | cc4cc `index.html` — **do not** put on Titanium hub |

### Product / install repos

| Link | URL | Evidence |
| --- | --- | --- |
| Codex Titanium (product) | https://github.com/VeigaPunk/codex-titanium | plan + local tree |
| Brew formula (install SSoT) | `brew install VeigaPunk/tap/codex-titanium` | codex-titanium README; TITANIUM-HOST |
| DS4CC marketplace repo | https://github.com/VeigaPunk/ds4cc-marketplace | xbgst repos grid; ds4cc README |
| TITANIUM-HOST doc (in marketplace) | repo path `docs/TITANIUM-HOST.md` / site prose | marketplace |
| sekhmet / L3 substrate | https://github.com/VeigaPunk/xbrd-spark | xbgst repos; TITANIUM-HOST cargo install line |
| sekhmet L3 evidence pack | https://github.com/VeigaPunk/sekhmet-l3 | xbgst `index.html` |
| Grok host surface | https://github.com/VeigaPunk/xbrd-grok | xbgst repos |
| Grok marketplace (xbgst-stack install) | https://github.com/VeigaPunk/grok-marketplace | xbgst repos |
| Livepatch | https://github.com/VeigaPunk/grok-build-livepatch | xbgst repos |
| tmux-orch | https://github.com/VeigaPunk/tmux-orch | xbgst repos |
| agent-browser (CDP adapters) | https://github.com/vercel-labs/agent-browser | codex-titanium README |
| the-kimiraikkoner (product spelling) | https://github.com/VeigaPunk/the-kimiraikkoner | codex-titanium README — plugin id `the-kimiraikoner@ds4cc`; binary `kimiraikkoner` |
| Org | https://github.com/VeigaPunk | xbgst CTA |

### Expected self-host (after ship)

| Link | URL (recommended) | Pattern |
| --- | --- | --- |
| This hub Pages | https://veigapunk.github.io/clibuilder/ | xbgst project-Pages path |
| This hub source | https://github.com/VeigaPunk/clibuilder | unverified until remote exists |

### Config Builder (disambiguation outbound)

- Plan names **grok-build-config-builder** / Agent Config Builders Titanium; product domain example `codex-titanium-config.vercel.app` — link as **Config Builder**, not “CLI Builder”. [moderate] — source: `clibuilder/.xbgst/plan-phase0-titanium-cli-builder.md` (local plan; verify live URL before hard-coding)

---

## 3. Visual / minimal CSS pattern to copy

### Default recommendation: **dark hub (xbgst-site static)**

Copy structure and tokens from:

- `/home/vgpnk1337/Projects/xbgst-site/style.css` — `:root` tokens  
- `/home/vgpnk1337/Projects/xbgst-site/index.html` — section markup + tiny inline nav JS  

**Tokens to reuse (dark zinc + blue accent):**

```css
--bg: #09090b;
--bg-elevated: #111114;
--bg-subtle: #18181c;
--fg: #f4f4f5;
--fg-muted: #a1a1aa;
--fg-subtle: #71717a;
--border: #27272a;
--accent: #93c5fd;
--accent-dim: #3b82f6;
--success: #4ade80;
--font: "Space Grotesk", …;
--mono: "IBM Plex Mono", …;
```

**Patterns that improve clarity with low cost:**

| Pattern | Where | Why |
| --- | --- | --- |
| sticky nav + mobile toggle | xbgst `index.html` | proven |
| hero grid + radial accent | xbgst `.hero-grid`, `::before` | product “CLI tool” feel |
| status-pill + mono date/version | xbgst hero | pin titanium version |
| `btn-primary` (fg on bg) / `btn-secondary` / `btn-text` | xbgst | install / docs / related CTAs |
| `.pipeline` 01–04 steps | xbgst `#stack` | install → config → verify → L3 |
| `.compare` dual metric cards | xbgst `#concurrency` | 64 vs 16 planes |
| `.repo-grid` + `.tag` | xbgst `#repos` | related surfaces |
| `max-width: 64rem` `.wrap` | xbgst | readable hub |
| vercel.json security headers only | xbgst `vercel.json` | if Vercel ever used: `cleanUrls`, nosniff, referrer-policy |

**Optional titanium accent tweak (do not invent brand system):** keep zinc base; optionally shift accent toward steel/slate (`#a1a1aa` / cool silver) if blue feels “Grok-only” — unverified brand preference.

### Do **not** default to plazir CSS

Plazir is **tropical teal/gold fan-art** (`--green-soft`, serif display, multi-orb hero). Wrong product signal for a hardened CLI host. Steal **smoke/a11y/deploy scripts**, not palette.

### Do **not** default to cc4cc for multi-section hub

cc4cc is single-column waitlist (`#07090c` + teal `#5eead4`, centered flex). Use only if landing collapses to one CTA; Titanium needs install matrix sections.

### Fonts

| Pattern | Choice | Note |
| --- | --- | --- |
| xbgst | Google Fonts Space Grotesk + IBM Plex Mono | fine for product hub |
| plazir | **system stacks only** (no fonts.googleapis) — smoke **fails** if CDN present | better for offline fan sites; optional for clibuilder |
| ds4cc | self-hosted JetBrainsMonoNL woff2 | marketplace identity; optional if aligning with ds4cc |

**Recommendation:** start xbgst-like with Google Fonts (fast ship) OR system + mono (plazir privacy). Avoid inventing a fourth font system.

### Light mode

**None of the sister product hubs use light as default.** Ship dark-only; no light theme work in v0.

---

## 4. Smoke script patterns (plazir primary; ds4cc secondary)

### Copy skeleton: plazir `scripts/smoke.sh`

Path: `/home/vgpnk1337/Projects/plazir-15-site/scripts/smoke.sh`

| Gate | Behavior | Adapt for clibuilder |
| --- | --- | --- |
| file gate | non-empty required paths | `index.html`, `style.css`, `README.md`, `robots.txt`, `scripts/smoke.sh` |
| content gate | fixed-string needles in HTML | e.g. `codex-titanium`, `VeigaPunk/tap/codex-titanium`, `0.147.0-alpha`, `not` + OpenAI/official disclaimer language, `Godspeed` or multi_agent **64**, link to `github.com/VeigaPunk/codex-titanium` |
| asset ref gate | parse `src`/`href`, ensure local paths exist | same python3 extractor |
| local HTTP | free port, `python3 -m http.server`, curl 200 | `/`, `/style.css` |
| `SMOKE_LIVE=1` | curl live Pages | `https://veigapunk.github.io/clibuilder/` once live |
| remote sync warn | optional dual remote | only if dual Pages deploy like plazir |

**Deploy pattern (optional):** `/home/vgpnk1337/Projects/plazir-15-site/scripts/deploy.sh` — main-only, push origin (+ pages-user if present). Titanium hub likely **single remote** project Pages unless user-site mirror chosen.

### xbgst

- No smoke script. Local dev is `npm run dev` for React app only.  
- For static hub: open root HTML or any static server.  
**Do not** require npm for v0 smoke.

### ds4cc

- `scripts/smoke-deployment.sh` / `.mjs` — **production MCP/app** health (challenge tokens). Wrong for static CLI hub.  
- `scripts/cli-parity-probe.sh` — host presence checks including `codex-titanium` on PATH. Useful as **optional** “operator verify” doc section, not site smoke.

### Local host (plan + plazir)

```bash
python3 -m http.server 8765 --bind 127.0.0.1
# or ephemeral port inside smoke.sh
```

---

## 5. What NOT to copy

| Anti-pattern | Source | Why |
| --- | --- | --- |
| **React / TanStack / Vite capacity as v0** | `xbgst-site/src/`, package.json, README dual surface | Plan: static first; React only if interactive install chooser needed. Doubles deploy surface and confuses GH Pages root. |
| **vercel.json-only deploy as primary** | xbgst | Primary should be Pages static root; Vercel optional later |
| **Plazir art direction** | plazir `styles.css` | Fan utopia, not CLI product |
| **Service worker / offline shell** | plazir `sw.js` | Overkill for install docs hub |
| **CC4 waitlist + Telegram CTA** | cc4cc-site | Different product (membership dark path) |
| **Marketplace plugin install as “install Titanium”** | ds4cc plugins | Titanium is **host binary**; plugins do not ship the CLI (`TITANIUM-HOST.md`) |
| **MCP zoo / app.ds4cc.com as Titanium feature** | ds4cc README | Titanium **hard-disables MCP**; L3 no-MCP policy |
| **Wrong product names** | plan + product-titanium.txt | Avoid: **Grok Builder** (ds4cc install UX), **Config Builder** / Agent Config Builders as this product, **CC4CC/CC4DS**, **Plazir-15**, stock **OpenAI Codex** branding as “official”, **KimiHikoner** / bare `kimi` for kimiraikkoner, **agent-wall** plugin, **Honcho** memory, **sekhmetalt** retired substrate |
| **Claim host concurrency 16 as Titanium default** | xbgst vs titanium config | Host **16** = Grok Build subagents; Titanium multi_agent_v2 = **64**. Label planes carefully (xbgst compare cards pattern). |
| **Full monorepo / Rust fork in clibuilder** | plan risk | Website host only — link to codex-titanium |
| **Upstream curl openai install as primary CTA** | codex-titanium README upstream section | That installs **stock** Codex; Titanium primary is brew tap / build from fork |
| **Secrets / challenge tokens in site smoke** | ds4cc smoke-deployment | Never |

---

## 6. Recommended copy-paste starter mapping

| Need | Copy from | Skip |
| --- | --- | --- |
| HTML IA + nav + hero + sections | `xbgst-site/index.html` | React components under `src/` |
| CSS tokens + buttons + grids | `xbgst-site/style.css` | plazir palette; ds4cc mono-only if not matching brand |
| smoke + CI idea | `plazir-15-site/scripts/smoke.sh` + `.github/workflows/smoke.yml` (if present) | ds4cc MCP smoke |
| security headers if Vercel | `xbgst-site/vercel.json` | full Nitro app |
| product facts | `codex-titanium/README.md`, `titanium/config.toml`, `ds4cc-marketplace/docs/TITANIUM-HOST.md` | upstream splash marketing as Titanium identity |
| domain pattern later | `cc4cc-site/CNAME` | waitlist form |

---

## Unknowns

- **clibuilder GitHub remote / final Pages path:** not created yet — affects live URLs in `#related` and smoke live base.
- **Config Builder canonical public URL:** plan cites `codex-titanium-config.vercel.app` — verify before footer hard-link.
- **Custom domain for Titanium CLI hub:** undecided; default project Pages until CNAME decision.
- **Whether to self-host fonts vs Google CDN:** product vs privacy tradeoff; plazir smoke bans Google Fonts; xbgst allows.

---

## Evidence index (local paths)

| Path | Role |
| --- | --- |
| `/home/vgpnk1337/Projects/xbgst-site/index.html` | Static IA, peer links, concurrency 16/64 |
| `/home/vgpnk1337/Projects/xbgst-site/style.css` | Dark hub CSS tokens |
| `/home/vgpnk1337/Projects/xbgst-site/README.md` | Pages + dual React surface warning |
| `/home/vgpnk1337/Projects/xbgst-site/vercel.json` | Minimal headers pattern |
| `/home/vgpnk1337/Projects/xbgst-site/src/data/repos.ts` | Repo link SSoT for React twin |
| `/home/vgpnk1337/Projects/cc4cc-site/index.html` | Minimal dark one-pager |
| `/home/vgpnk1337/Projects/cc4cc-site/README.md` | CNAME domain pattern |
| `/home/vgpnk1337/Projects/plazir-15-site/scripts/smoke.sh` | Smoke gates |
| `/home/vgpnk1337/Projects/plazir-15-site/scripts/deploy.sh` | Dual-remote deploy |
| `/home/vgpnk1337/Projects/plazir-15-site/styles.css` | Fan palette (do not copy for product) |
| `/home/vgpnk1337/Projects/plazir-15-site/README.md` | Live URLs + smoke usage |
| `/home/vgpnk1337/Projects/codex-titanium/README.md` | Product naming, brew, browser policy |
| `/home/vgpnk1337/Projects/codex-titanium/titanium/config.toml` | Godspeed + 64 threads + plugins |
| `/home/vgpnk1337/Projects/codex-titanium/product-titanium.txt` | Naming evidence pack |
| `/home/vgpnk1337/Projects/ds4cc-marketplace/docs/TITANIUM-HOST.md` | Host resolve order |
| `/home/vgpnk1337/Projects/ds4cc-marketplace/README.md` | Marketplace vs host binary, peer URLs |
| `/home/vgpnk1337/Projects/clibuilder/.xbgst/plan-phase0-titanium-cli-builder.md` | Phase-0 IA table alignment |

---

## Scout verdict (for dispatcher)

1. **Build v0 as xbgst-style static dark hub** (single `index.html` + `style.css`).  
2. **Smoke from plazir**, needles from Titanium product docs.  
3. **Peer links:** codex-titanium, ds4cc.com, xbgst-site Pages, xbrd-spark, brew tap; disambiguate Config Builder.  
4. **Do not** ship React capacity, plazir art, CC4 waitlist, MCP-as-feature, or wrong product names.
