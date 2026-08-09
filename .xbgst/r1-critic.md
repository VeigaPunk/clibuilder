# R1 Critic — Titanium CLI Builder plan

**Role:** gx-critic-r1  
**Target:** `/home/vgpnk1337/Projects/clibuilder/.xbgst/plan-phase0-titanium-cli-builder.md`  
**Date:** 2026-08-09  
**Method:** ACH + key assumptions + devil’s advocacy + what-if (inline Heuer)

---

## Axes (named)

| Axis | Question |
| --- | --- |
| **identity** | Will cold traffic know this is not Grok Builder / Config Builder / package builders? |
| **scope** | Does the site stay a thin public IA, or become a second monorepo/docs brain? |
| **capacity** | Static vs React: when is interactive capacity justified? |
| **trust** | Does public hero of `approval_policy=never` + `danger-full-access` help or burn? |
| **fidelity** | Can version/brew/docs stay true without a pin pipeline? |
| **maintenance** | Deploy/tax vs install_clarity |

---

## Phase 1 — Approach map

**Problem claimed:** Titanium value is scattered (README, tap, TITANIUM-HOST, config-builder, xbgst hub). Empty `clibuilder` WD should own a **CLI-first** public install → config → verify → L3 story.

**Decisions (explicit or implicit):**

1. Working product name: **“Titanium CLI Builder”**
2. Repo WD: `clibuilder`; site SSoT separate from `codex-titanium` Rust tree
3. v0 = static `index.html` + GH Pages; React/TanStack deferred to M08 “if needed”
4. Hero sells brew + exact version pin `0.147.0-alpha.11+titanium.1`
5. Config section surfaces SLIM + `titanium/config.toml` posture (includes never / danger-full-access in product reality)
6. Sister products cross-linked, not absorbed
7. M01 name/deploy left partly open to judge; advisory gate allows M02–M04 on working title

**Rejected alternatives (implied):** single docs page inside codex-titanium; pure ds4cc marketplace expansion; Config Builder as primary install surface; dual Pages+Vercel from day one; “latest” without pin.

---

## ACH — Competing hypotheses

| ID | Hypothesis | Evidence for | Evidence against |
| --- | --- | --- | --- |
| H1 | Dedicated static site is the right product surface | Empty WD intentional; sister static patterns exist; job is install clarity not catalog | Install path already in brew + TITANIUM-HOST; may duplicate without owning formula |
| H2 | Name “CLI Builder” is a brand trap | Plan itself lists collision risk; “Builder” already = Config Builder + Grok Builder | “Builder” may mean “we assemble your host” in operator slang |
| H3 | Static-first is correct | Low tax; M08 gated; xbgst/plazir patterns | Optional React language still invites premature capacity copy-paste |
| H4 | Public never/danger-full-access messaging is load-bearing product truth | That *is* the Titanium preset value for operators | Unqualified public default reads as malware-class posture to auditors/OSS browsers |
| H5 | Exact version pin on hero is honest | Matches local binary today | High drift rate for alpha.N+titanium.M; smoke freezes wrong truth |
| H6 | Scope will stay out of monorepo | Explicit out-of-scope + “never vendor” | Copy sources list pulls README/config; executors fill gaps by inventing second docs SSoT |

**Working judgment:** H2 and H4 and H5 are the highest-severity approach risks. H1 is plausible if renamed and thinned. H3 is sound if M08 stays hard-blocked.

---

## Key assumptions under attack

1. **“CLI Builder” is acceptable product language** — Plan assumes judge may rename; still greenlights executors on that title. **Breaks:** first SEO/nav hit lands next to “Config Builder” and “Grok Builder.”
2. **Site can specialize Titanium without replacing TITANIUM-HOST** — Dual install docs → dual drift. **Breaks:** first formula rename or PATH order change.
3. **Hero exact pin improves install_clarity** — **Breaks:** brew ships `.titanium.2` while hero still says `.1`.
4. **Showing Godspeed defaults is marketing, not liability** — **Breaks:** casual clone of preset language without threat model → trust collapse / ToS confusion with OpenAI Codex.
5. **M08 “only if static fails a named need”** — **Breaks:** executor boredom + xbgst-site clone culture; package.json appears without a named failure mode.
6. **Advisory gate without judge name lock is fine** — **Breaks:** GH remote `clibuilder` + Pages path locks wrong brand for months.

---

## Devil’s advocacy (strongest case against current approach)

This is not a product; it is a **third README with a prettier URL**. The real install SSoT is brew + codex-titanium README + TITANIUM-HOST. A new repo named `clibuilder` selling “CLI Builder” **guarantees** confusion with Config Builder (already on Vercel as titanium config) and Grok Builder (marketplace install UX). Marketing the hardened host as `approval_policy=never` + `sandbox_mode=danger-full-access` on a public GH Pages hero is how you get the project written off as “yolo fork of Codex,” not “operator-grade 64-worker substrate.” Static-first is fine; the plan still **smuggles React capacity** as a milestone number, which is how every sister site grew a dual deploy tax. Exact version in the hero is a **time bomb** without a release-sync bot.

**Counter-proposal (steelman of alternatives):**

- **Rename product surface** to **Titanium Host** / **codex-titanium site** / **Titanium install hub** — drop “Builder” entirely.
- **Repo name** align with product: `codex-titanium-site` or `titanium-host` (judge lock *before* M02 remote).
- **Docs ownership:** site is a **thin funnel** (3 screens: install / verify / related). Deep PATH/resolve stays only in TITANIUM-HOST; site links, does not restate.
- **Security posture:** default public copy = “operator preset for isolated machines; full-auto is opt-in and documented”; never lead with danger-full-access. Link threat model / when-not-to-use.
- **Version:** hero says `brew install …` + “current formula tracks GitHub Releases”; pin lives in a generated `version.json` or badge from release API, smoke checks consistency against that file, not hard-coded prose in three places.
- **Capacity:** delete M08 from Phase 0 table; reopen only with a written need (install OS matrix interactive, release API widget) and judge APPROVED.

---

## Focus attacks

### 1) Name collisions (CLI Builder vs Grok Builder vs Config Builder)

```
CRITIQUE: "CLI Builder" is a collision product name, not a disambiguation strategy.
SEVERITY: RETHINK
CURRENT: Working title "Titanium CLI Builder"; disambiguation deferred to hero/nav copy and M01 judge.
ALTERNATIVE: Name the surface for the artifact users install — "Titanium Host" / "codex-titanium" install hub — reserve "Builder" for grok-build-config-builder only.
TRADE-OFF: Lose vague "builder" brand symmetry with config-builder; gain zero-collision IA and cleaner SEO.
FAILURE-MODE: Cross-links and Vercel domains already say "config builder"; operators arrive expecting TOML UI or Grok marketplace install.
CONFIDENCE: high
```

**Kill moves:** Ship public title/repo as `clibuilder` + “CLI Builder” without judge rename lock; use “Builder” in `<title>` and H1.  
**Keep moves:** Explicit peer table and “do not conflate” section in the plan; out-of-scope for reimplementing config-builder/marketplace.

### 2) Scope creep into codex-titanium monorepo

```
CRITIQUE: Plan forbids vendoring Rust but still sets up a second product-docs brain with copy sources that will drift from the monorepo README.
SEVERITY: CONSIDER
CURRENT: Site-only repo; links out; copy from README + titanium/config.toml + TITANIUM-HOST; milestones are HTML/smoke.
ALTERNATIVE: Single canonical INSTALL.md in codex-titanium + GH Pages from monorepo `website/` (omegag pattern) OR site that embeds only brew CTA + deep-links (no restated PATH matrix).
TRADE-OFF: Monorepo website couples release and docs (good for fidelity, bad for empty WD purpose). Thin funnel keeps WD useful but must refuse feature creep (changelogs, binary hosting, formula mirrors).
FAILURE-MODE: Executor "helpfully" pastes multi-agent docs, agent-browser pins, marketplace plugin lists → clibuilder becomes unofficial second monorepo docs tree.
CONFIDENCE: medium
```

**Kill moves:** Document brew formula internals, ship config full-text, host binaries, restate multi_agent implementation, clone xbgst dual-surface “because peers do.”  
**Keep moves:** Explicit “does not vendor codex-titanium”; out-of-scope brew authoring; peer role table; SLIM “do not re-market 44k excision.”

### 3) Static vs React premature capacity

```
CRITIQUE: M08 as a numbered milestone legitimizes capacity work before any static failure mode exists.
SEVERITY: CONSIDER
CURRENT: Static hub recommended; TanStack optional later; gate `test ! -f package.json` or build green.
ALTERNATIVE: Phase 0 ends at M07; capacity is a new phase plan with a named failed static job (e.g. multi-OS install chooser proven needed by support tickets).
TRADE-OFF: Slightly less “future-proof” language; much less dual-deploy and node toolchain tax.
FAILURE-MODE: package.json lands for a theme toggle or version fetch that a 10-line static badge would solve.
CONFIDENCE: high
```

**Kill moves:** Scaffold Vite/TanStack “for parity with xbgst-site”; Vercel before Pages proves need; dual surface in v0.  
**Keep moves:** Static-first default; local python http.server gate; M08 judge APPROVED language (strengthen: remove from default milestone path).

### 4) Messaging risk: approval_policy never / danger-full-access as default

```
CRITIQUE: Public product story that leads with never-approve + danger-full-access sells liability, not Godspeed.
SEVERITY: RETHINK
CURRENT: Product reality of titanium/config.toml is that posture; plan lists preset facts in Phase 0 state; config section “preset + SLIM”; audience = operators.
ALTERNATIVE: Public ladder — (1) what Titanium is, (2) install, (3) verify, (4) "operator profiles" with explicit risk labels; full-auto profile behind warning + when-to-use (dedicated machine, no untrusted repos, no production secrets without janitor). Link config-builder for profile selection rather than pasting danger mode as hero virtue.
TRADE-OFF: Slightly less "this is the default, deal with it" swagger; far better audit/trust and fewer drive-by clones of yolo config.
FAILURE-MODE: Screenshot of hero "danger-full-access" becomes the social object; independent-fork disclaimer cannot repair first impression.
CONFIDENCE: high
```

**Kill moves:** Hero bullet “defaults: approval never, danger-full-access”; uncritical paste of config.toml; framing full-auto as the only real Titanium.  
**Keep moves:** Audience scoped to operators; SLIM not re-selling excision; legal “not OpenAI official”; config deep-link to config-builder; judge gate on SLIM public vs operator-only.

### 5) Version pin drift

```
CRITIQUE: Hero + smoke "required strings" on an exact alpha+titanium version freezes a lie on a short half-life.
SEVERITY: RETHINK
CURRENT: Pin `0.147.0-alpha.11+titanium.1` on hero; CI requires version family strings; risk of brew divergence noted; judge may choose exact vs latest language.
ALTERNATIVE: Single machine-readable pin (`assets/version.json` or release badge URL) generated at release time from codex-titanium/tag; smoke asserts HTML embeds that pin; human prose says "install via brew" without baking N.M into three paragraphs. Or pin only major family (`0.147.x+titanium`) in prose.
TRADE-OFF: Slightly less "copy this exact version string" certainty; eliminates systematic drift between site, brew, and local binary.
FAILURE-MODE: M03 lands; two weeks later titanium.2 ships; smoke still green on stale pin because nobody updates index.html.
CONFIDENCE: high
```

**Kill moves:** Hard-code full version in hero, README, and smoke as three independent literals; no release checklist.  
**Keep moves:** Plan names version drift as risk; CI content smoke idea; judge escalation on exact vs latest — **execute that escalation before M03**, not after public Pages.

---

## What-if (reversible failure modes)

| If wrong… | Cost to reverse |
| --- | --- |
| Product name “CLI Builder” public for a quarter | Rename site + repo + cross-links; SEO scar; **medium-high** |
| React/Vercel dual stack early | Delete `src/`, keep static; **medium** if no custom domain glue |
| Danger-mode as brand | Copy rewrite only if no viral screenshot; **low code / high reputation** |
| Exact pin stale | One HTML edit if process exists; **chronic** if no process |
| Docs second brain | Hard to kill once inbound links depend on deep pages; **high** — avoid by thin funnel now |

---

## Kill moves vs keep moves (summary)

### Kill (do not do under this plan)

| # | Move | Why |
| --- | --- | --- |
| K1 | Ship H1/title as **“Titanium CLI Builder”** without rename lock | Collision with Grok Builder + Config Builder is already admitted in the plan |
| K2 | Treat `clibuilder` remote name as final before judge | Locks github.io path and mental model to a non-product word |
| K3 | Lead marketing with `approval_policy=never` + `sandbox_mode=danger-full-access` | Trust / audit failure mode; conflates operator preset with safe public default |
| K4 | Hard-code exact `0.147.0-alpha.11+titanium.1` in multiple independent strings | Guaranteed pin drift vs brew/releases |
| K5 | Land `package.json` / TanStack “because sister sites have it” | Premature capacity; maintenance axis loss, zero install_clarity gain |
| K6 | Restate full TITANIUM-HOST PATH matrix + monorepo changelog on this site | Second docs SSoT; monorepo scope creep without vendoring source |
| K7 | Vendor or mirror codex-rs / formula / binaries here | Explicitly out of scope; breaks product map |
| K8 | Dual Pages+Vercel before a named interactive need | Deploy tax without axis win |
| K9 | Proceed M07 public under advisory gate while name/deploy still open | Irreversible brand/path cheaply avoided by waiting on M01 |
| K10 | Frame value as “44k excision / full rebase drama” | Violates SLIM decision; plan already warns |

### Keep (sound; strengthen)

| # | Move | Why |
| --- | --- | --- |
| P1 | Site-only WD; no Rust monorepo copy | Correct boundary |
| P2 | Static hub v0 + smoke.sh + content gates | Cheap evidence; matches plazir/xbgst hub pattern |
| P3 | Explicit peer map and out-of-scope list | Prevents catalog/config-builder replacement |
| P4 | Brew install string single source of truth for install CTA | Real operator path |
| P5 | Not-OpenAI / Apache-2.0 disclaimer as required smoke string | Legal axis |
| P6 | Concurrency story 64 / 16 / 64 when stack section exists | Differentiates product if accurate |
| P7 | Config deep-link to config-builder (not reimplementation) | Correct product split **if** names stop colliding |
| P8 | SLIM-aligned messaging (hardened host + brew + L3), not excision cosplay | Matches 2026-08-06 decision |
| P9 | Judge locks on name, deploy, domain, version language, SLIM publicness | Right escalations — **must fire before public** |
| P10 | Secrets posture (no op reveals; install docs only) | Non-negotiable |

---

## Cross-decision tensions

1. **install_clarity vs product_disambiguation:** Exact brew CTA helps install; “CLI Builder” hurts disambiguation. Prefer rename over longer hero paragraphs.
2. **stack_fidelity vs trust:** Truthful preset includes full-auto; public fidelity without framing is self-harm. Prefer profile framing over omission **or** over swagger.
3. **evidence_quality vs pin honesty:** Smoke on a frozen version string looks green while product moves. Prefer one generated pin artifact.
4. **maintenance_cost vs sister-site envy:** Cloning xbgst dual surface maximizes tax; static funnel maximizes install job.

---

## Judge recommendations (for the-judge)

| Priority | Recommendation |
| --- | --- |
| P0 | **Rename:** drop “CLI Builder”; pick Host/install-hub language; lock repo name before git remote |
| P0 | **Messaging:** ban unqualified danger-full-access / approval never from hero; require risk ladder + config-builder for profiles |
| P0 | **Version policy:** decide exact pin vs release-tracked language **before M03**; single pin artifact if exact |
| P1 | **Demote M08** out of default milestone chain; capacity = new phase |
| P1 | **Thin funnel rule:** no page that duplicates TITANIUM-HOST more than one paragraph + link |
| P2 | **Pages-only** until interactive need is written down |

---

## Soundness note

The plan is **structurally competent** as a Phase 0 map: empty WD, peer honesty, static-first, monorepo non-vendor, smoke gates, SLIM awareness. The approach fails on **naming**, **public security posture framing**, and **version pin mechanics** — not on “should a thin install site exist.” Fix those three or the site becomes a confusing, stale, scary landing page next to better-named siblings.

**Overall severity:** **RETHINK** on name + danger messaging + version pin; **CONSIDER** on capacity milestone and docs dual-SSoT; **KEEP** skeleton/static/out-of-scope envelope once renames and messaging ladder land.

---

## evidence

- Plan SSoT: `/home/vgpnk1337/Projects/clibuilder/.xbgst/plan-phase0-titanium-cli-builder.md`
- Critique output: `/home/vgpnk1337/Projects/clibuilder/.xbgst/r1-critic.md`
