# Executor evidence — M02–M04 Titanium CLI Builder

**Role:** gx-executor-m02-m04  
**Date:** 2026-08-09  
**WD:** `/home/vgpnk1337/Projects/clibuilder`  
**Git commit:** not performed (judge owns ship)

## File list

| Path | Notes |
| --- | --- |
| `README.md` | product, brew install, local host, smoke, peer links |
| `index.html` | hero, what, install, config, stack, no-mcp, verify, related, disclaimer |
| `style.css` | dark hub (xbgst-site tone, single file) |
| `assets/.gitkeep` | placeholder |
| `scripts/smoke.sh` | executable; content + optional HTTP |
| `.gitignore` | node_modules, .DS_Store, .env*, dist, .vercel |
| `robots.txt` | Allow all (optional) |

## Gates

```text
test -f README.md && test -f index.html && test -f style.css && test -x scripts/smoke.sh
→ pass
```

### smoke output

```text
OK: required files present
OK: required strings in index.html
WARN: python3 blocked/unavailable for http.server — skip HTTP (content checks pass)
SMOKE PASS
exit=0
```

(Host wall blocks `python3 -m http.server` without `XBGST_ALLOW_PYTHON=1`. Content gates are authoritative for v0.)

## Product strings verified in index.html

- `brew install VeigaPunk/tap/codex-titanium`
- `codex-titanium` / `github.com/VeigaPunk/codex-titanium`
- `approval_policy` / `never` / `danger-full-access` / `64` / `multi_agent`
- `not an official OpenAI`
- Disambiguation: not Grok Builder / not grok-build-config-builder

## Status

M02 skeleton · M03 static hub · M04 smoke → **done** (no commit, no remote).
