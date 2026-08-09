# Plan — Titanium CLI Builder website + local repo (`clibuilder`)
**Session:** 1 | **Dispatched by:** xbgst | **Date:** 2026-08-09

## Phase 0 — State map

- **Exists:**
  - **WD:** `/home/vgpnk1337/Projects/clibuilder` — empty (only this plan under `.xbgst/`). No git, no site, no package yet.
  - **Product CLI:** `/home/vgpnk1337/Projects/codex-titanium` → `VeigaPunk/codex-titanium`
    - Fork of OpenAI Codex CLI base `0.147.0-alpha.11` published as `0.147.0-alpha.11+titanium.1`
    - Local binary: `codex-cli 0.147.0-alpha.11+titanium.1` at `~/.local/bin/codex-titanium` (`codex` symlink)
    - Preset: `titanium/config.toml` — Godspeed, `approval_policy=never`, `sandbox_mode=danger-full-access`, multi_agent_v2 **64**, DS4CC marketplace plugins, memories/browser/MCP lanes off
    - Install path (Linux x86_64): `brew install VeigaPunk/tap/codex-titanium`
    - Browser toolchain pin: `titanium/package.json` → agent-browser 0.32.2 (Puppeteer/Musketeer/Almanacker/kimiraikkoner via CDP :9222)
    - Prior xbgst work: `.xbgst/plan-titanium-vs-alpha.md` + **decision SLIM** (2026-08-06) — keep product identity + config; stop full excision rebase as strategy
  - **Sister public sites (patterns):**
    - `xbgst-site` — dual surface: static root hub (GitHub Pages) + Vite/TanStack Start/React 19/Tailwind v4 (Vercel Nitro); `dev` on `0.0.0.0:8080`; live `veigapunk.github.io/xbgst-site`
    - `cc4cc-site` — GH Pages + CNAME `cc4ds.ds4cc.com`
    - `plazir-15-site` — static + smoke scripts + dual-remote deploy pattern
    - `omegag-site` — static Pages mirror of product `website/`
  - **Related “builder” products (do not conflate):**
    - `grok-build-config-builder` — **Agent Config Builders Titanium v2.0.0** (interactive TOML builders for Grok/Codex Titanium/OpenCode); hub + product routes; Pages + Vercel product domains (e.g. `codex-titanium-config.vercel.app`)
    - `ds4cc-marketplace` Pages — **primary Grok Builder install UX** + `docs/TITANIUM-HOST.md` (host binary resolve, brew, sekhmet L3)
    - `grok-marketplace` — ships `xbgst-stack` + livepatch; points Grok install UX at ds4cc-marketplace site
  - **Stack concurrency SSoT (operator rules):** host Grok subagents **16**; L3 sekhmet **64** via Titanium-backed `sekhmet`/`xbrd-spark`

- **Missing:**
  - Dedicated **Titanium CLI Builder** product site + git repo under `clibuilder` (name/IA/domain TBD at M01–M02 but WD is locked)
  - Public single-pane install/onboard story that is *CLI-first* (not marketplace catalog, not config-field editor)
  - Cross-links from xbgst-site / ds4cc TITANIUM-HOST into this surface (outbound only after site skeleton)
  - CI smoke, CNAME/domain decision, release badge wiring to brew/GitHub releases
  - Legal/disclaimer copy alignment (independent fork, not official OpenAI)

- **Risk:**
  - **Name collision:** “CLI Builder” vs existing **Grok Builder** (ds4cc) vs **Config Builder** (grok-build-config-builder) vs package builder scripts inside codex-rs — product language must disambiguate in hero + nav
  - **Scope creep into codex-titanium monorepo:** this WD is a *website host repo*, not a second copy of the Rust fork
  - **SLIM decision drift:** site must not re-market a 44k-line excision fork as the core value; sell **hardened host + Godspeed/64 + brew path + L3 substrate**
  - **Deploy ambiguity:** Pages-only (xbgst/plazir style) vs dual Pages+Vercel (xbgst/config-builder) — pick one primary before capacity work
  - **Brew formula not in this tree:** install docs depend on external `VeigaPunk/tap`; link rot if formula/version diverges
  - **Secrets:** never ship op reveals / ChatGPT session material; install docs only

## Product map

### Website (pages, IA, audience, deploy target)

**Working title:** Titanium CLI Builder  
**Audience:** operators who want a Godspeed-default Codex host for multi-agent + sekhmet L3 (not upstream stock defaults).  
**Job-to-be-done:** one place to understand → install → configure → verify → fan-out to L3/xbgst.

| Route / section | Purpose | Overfit content (v0) |
| --- | --- | --- |
| `/` hero | One-line product + version pin + primary CTA | `brew install VeigaPunk/tap/codex-titanium` + version `0.147.0-alpha.11+titanium.1` |
| `#what` | What Titanium is / is not | Fork of Codex CLI; independent; Apache-2.0; not OpenAI official |
| `#install` | Install matrix | brew (Linux x86_64), cargo build from `codex-rs`, binary PATH resolve order |
| `#config` | Preset + SLIM posture | copy/link `titanium/config.toml` install one-liner; link Config Builder for deep edit |
| `#stack` | Concurrency planes | Titanium multi_agent_v2 **64**; Grok host **16**; sekhmet L3 **64** jobs |
| `#no-mcp` | Policy | Titanium = no MCP zoo; Exa praise lives elsewhere (ds4cc `exa.html`) |
| `#verify` | Post-install gates | `codex-titanium --version`; features/multi_agent; PATH order from TITANIUM-HOST |
| `#related` | Sister surfaces | codex-titanium repo, ds4cc marketplace, xbgst-site, config-builder, xbrd-spark |
| Footer | License + disclaimer | Apache-2.0 notice; independent fork |

**Recommended stack for v0 (least disruption, proven in-family):**
1. **Skeleton:** static hub at repo root (`index.html` + `style.css`) — GH Pages works immediately (xbgst-site / plazir pattern).
2. **Optional capacity later:** `src/` TanStack Start + Tailwind if interactive install chooser or version API needed (clone xbgst-site / config-builder).
3. **Local host:** `python3 -m http.server 8765` or `npm run dev` once package exists; bind `0.0.0.0` only if intentional.

**Deploy target (default recommendation):** GitHub Pages project site `veigapunk.github.io/clibuilder` (or renamed remote). Custom domain optional later (pattern: cc4cc CNAME). Vercel only if React app lands.

### Repo (layout, languages, CI, local host)

**Repo root = this WD** — site SSoT. **Does not vendor** `codex-titanium` source.

```
clibuilder/
  .xbgst/                 # plans, gates, evidence (this plan)
  index.html              # v0 hub
  style.css
  robots.txt
  README.md               # local + deploy + product one-pager
  assets/                 # logos/svg only
  scripts/
    smoke.sh              # file + content + local HTTP (plazir-style)
  .github/workflows/
    smoke.yml             # CI on push/PR
  # optional later:
  package.json            # if adopting Vite/TanStack
  src/
  vercel.json
  CNAME
```

**Languages:** HTML/CSS (+ optional TS/React). Prefer **no Python** in product path. Any smoke helpers: bash; future tooling: Rust if non-trivial.

**Local host (v0 gate):**
```bash
cd /home/vgpnk1337/Projects/clibuilder
python3 -m http.server 8765 --bind 127.0.0.1
# open http://127.0.0.1:8765/
```

**CI:** content smoke (required strings: brew formula, version family, not-OpenAI disclaimer, link to `VeigaPunk/codex-titanium`).

### Relationships (codex-titanium, brew, xbgst, marketplace)

```
                    [clibuilder site]  ←—— this repo (public IA + install UX)
                           |
           +---------------+---------------+
           |               |               |
           v               v               v
   codex-titanium      VeigaPunk/tap    ds4cc-marketplace
   (Rust CLI SSoT)     (brew formula)   (Grok Builder site +
   config preset                         TITANIUM-HOST docs +
   binary product)                       sekhmet plugin docs)
           |                                  |
           +-------- sekhmet/xbrd-spark <-----+
                     (L3 pure-exec, CODEX_BIN
                      → codex-titanium)
           |
           +-------- grok-marketplace / xbgst-site
                     (Grok host orch; not Titanium binary)

   grok-build-config-builder  —— sibling —— deep TOML UI for
   (Codex Titanium config)                   titanium-shaped configs
```

| Peer | Role vs clibuilder |
| --- | --- |
| `codex-titanium` | **Binary + preset SSoT.** Site links out; never forks the monorepo here. |
| `VeigaPunk/tap` | Install primitive. Site copy must match formula name `codex-titanium`. |
| `ds4cc-marketplace` | Multi-CLI marketplace + host resolve docs. Site **specializes** Titanium CLI story; does not replace marketplace. |
| `grok-marketplace` / `xbgst-site` | Grok Build orchestration surface. Cross-link only. |
| `grok-build-config-builder` | Interactive config builder. CTA: “tune config” after install. |
| `xbrd-spark` | L3 swarm consuming Titanium as `CODEX_BIN`. Document in stack section. |

## WWKD

1. **What:** Stand up a dedicated public **Titanium CLI Builder** website repo at `clibuilder` that maps install → config → verify → L3, with local host + smoke gates. Success boundary: operator can open local hub, copy brew install, see correct version/product posture, and reach codex-titanium + related stack without confusing it with Grok Builder or Config Builder.
2. **Why:** Titanium product value is spread across README, brew tap, ds4cc TITANIUM-HOST, config-builder, and xbgst hub. Empty WD exists to **own** the CLI-first public surface. Evidence: binary on PATH, brew formula in docs, SLIM decision, sister site patterns ready to clone structure from.
3. **Assumptions/Risks:**
   - Assume product name “Titanium CLI Builder” is acceptable (judge may rename).
   - Assume v0 is **static-first** (not full TanStack clone).
   - Assume we do **not** reimplement config builder or marketplace catalogs here.
   - Risk: domain/repo rename (`clibuilder` vs `titanium-cli` vs `codex-titanium-site`).
   - Risk: version drift between site pin and brew artifact.
4. **How:** M01 lock naming/IA → M02 git+README skeleton → M03 static hub content → M04 smoke + local host → M05 cross-links + optional Pages wire → M06 (optional) React capacity only if static fails a named need.
5. **Escalation points:**
   - **Judge:** final product name + public GitHub repo name (`clibuilder` vs `titanium-cli-builder` vs `codex-titanium-site`).
   - **Judge:** primary deploy = Pages only vs dual Vercel.
   - **Judge:** custom domain (e.g. under ds4cc.com) vs github.io only.
   - **Judge:** whether site should pin exact titanium version or “latest release” language.
   - **Judge:** whether SLIM messaging is public or operator-only.

## Milestones

| # | Title | Gate command | Expected output | Executor |
|---|---|---|---|---|
| M01 | **Lock product language + IA** (disambiguate vs Grok Builder / Config Builder) | `test -f /home/vgpnk1337/Projects/clibuilder/.xbgst/plan-phase0-titanium-cli-builder.md && rg -n 'Product map|Titanium CLI Builder|grok-build-config-builder' /home/vgpnk1337/Projects/clibuilder/.xbgst/plan-phase0-titanium-cli-builder.md` | Plan present; IA table complete; name recommendation recorded | planner ✅ / judge lock |
| M02 | **Repo skeleton** — git init, README, `.gitignore`, `assets/`, `scripts/` stubs only (no full design system yet) | `cd /home/vgpnk1337/Projects/clibuilder && test -f README.md && test -d scripts` | README states product + local host + peers; dirs exist | executor |
| M03 | **Static hub v0** — `index.html` + `style.css` covering install/config/stack/verify/related | `cd /home/vgpnk1337/Projects/clibuilder && rg -n 'VeigaPunk/tap/codex-titanium|codex-titanium|multi_agent|not an official OpenAI' index.html` | Required install string + disclaimer + stack numbers present | executor |
| M04 | **Local host + smoke** — `scripts/smoke.sh` checks files + HTTP 200 | `cd /home/vgpnk1337/Projects/clibuilder && bash scripts/smoke.sh` | exit 0; prints OK for files + `http://127.0.0.1:8765/` | executor |
| M05 | **Wire peers** — outbound links only to codex-titanium, ds4cc TITANIUM-HOST / marketplace, xbgst-site, config-builder codex route, xbrd-spark | `rg -n 'github.com/VeigaPunk/codex-titanium|TITANIUM-HOST|xbgst-site|grok-build-config-builder|xbrd-spark' /home/vgpnk1337/Projects/clibuilder/index.html` | ≥4 peer URLs present | executor |
| M06 | **CI smoke workflow** — `.github/workflows/smoke.yml` runs `scripts/smoke.sh` | `test -f /home/vgpnk1337/Projects/clibuilder/.github/workflows/smoke.yml` | workflow file exists; local smoke still green | executor |
| M07 | **GitHub remote + Pages enable** (after judge name lock) | `git -C /home/vgpnk1337/Projects/clibuilder remote -v; curl -sI https://veigapunk.github.io/<repo>/ \| head -5` | remote SSH; Pages 200 or documented Settings gate | executor + operator PAT if Settings blocked |
| M08 | **Optional capacity** — TanStack only if M03–M05 prove need for interactive install matrix | `test ! -f package.json` **or** `npm run typecheck && npm run build` if adopted | Either static remains sole surface, or build green | executor (only if judge APPROVED) |

## Dependencies

```
M01 (judge name/deploy lock) → M02 → M03 → M04 → M05 → M06 → M07
M08 optional after M05; blocked unless judge APPROVED capacity need
M01 ∥ can refine copy while M02 starts if name stays "Titanium CLI Builder" / repo `clibuilder`
```

**Parallel-safe after M02:** content (M03) and smoke script scaffolding (M04 script body) can draft in parallel if smoke tolerates missing strings until M03 lands.

## Suggested axes for judge (name only; judge will lock)

1. **install_clarity** — can a cold operator reach a working `codex-titanium` from the site alone?
2. **product_disambiguation** — zero confusion with Grok Builder / Config Builder / marketplace catalog
3. **stack_fidelity** — correct 64/16/64 concurrency story + SLIM-aligned messaging
4. **maintenance_cost** — static hub vs dual React deploy tax
5. **evidence_quality** — smoke gates + version pin + peer link integrity
6. **deploy_latency** — time from commit to public URL

## Out of scope (Phase 0 / v0)

- Rebuilding or vendoring `codex-titanium` Rust sources in this repo
- Shipping MCP servers or enabling MCP on Titanium
- Replacing ds4cc-marketplace or grok-build-config-builder
- Brew formula authoring (lives in tap)
- Full design system / brand campaign beyond functional hub
- Implementing site features during this plan phase (plan-only; scaffold `.xbgst/` only)

## Executor handoff notes

- **Cold start cwd:** `/home/vgpnk1337/Projects/clibuilder`
- **Copy sources (read-only):**
  - Product facts: `~/Projects/codex-titanium/README.md`, `titanium/config.toml`
  - Host resolve: `~/Projects/ds4cc-marketplace/docs/TITANIUM-HOST.md`
  - Site pattern: `~/Projects/xbgst-site/{index.html,style.css,README.md,package.json,vite.config.ts}`
  - Smoke pattern: `~/Projects/plazir-15-site/scripts/smoke.sh`
  - Config deep-link: `~/Projects/grok-build-config-builder/README.md` (Codex Titanium route)
- **Do not** invent brew install commands other than `brew install VeigaPunk/tap/codex-titanium` without re-reading codex-titanium README.
- **Godspeed ship:** after APPROVED milestones with no secrets, use milestone-ship / commit+push main per operator rules once remote exists.

## Status

- Phase 0 plan written: **2026-08-09**
- Implementation: **not started** (scaffold `.xbgst/` only)
- Marker if judge silent one cycle: `[planner-gate: advisory, risks-open]` — executors may proceed M02–M04 with working title **Titanium CLI Builder** and static-first deploy

evidence: `/home/vgpnk1337/Projects/clibuilder/.xbgst/plan-phase0-titanium-cli-builder.md`
