#!/usr/bin/env bash
# Titanium Host — content smoke (files + required index.html family needles)
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

fail() { echo "FAIL: $*" >&2; exit 1; }
ok() { echo "OK: $*"; }

test -f README.md || fail "missing README.md"
test -f index.html || fail "missing index.html"
test -f style.css || fail "missing style.css"
test -f .gitignore || fail "missing .gitignore"
test -d assets || fail "missing assets/"
test -x scripts/smoke.sh || fail "scripts/smoke.sh not executable"
test -f .github/workflows/smoke.yml || fail "missing .github/workflows/smoke.yml"
ok "required files present"

HTML="$ROOT/index.html"
# Family needles (product identity — not a brittle monorepo triple that can diverge from brew)
need_strings=(
  "brew install VeigaPunk/tap/codex-titanium"
  "codex-titanium"
  "Titanium Host"
  "titanium"
  "titanium.1"
  "64"
  "not an official OpenAI"
  "independent fork"
  "danger-full-access"
  "approval_policy"
  "never"
  "github.com/VeigaPunk/codex-titanium"
  "multi_agent"
  "risk ladder"
  "veigapunk.github.io/xbgst-site"
  "ds4cc.com"
  "TITANIUM-HOST"
  "xbrd-spark"
  "grok-build-config-builder"
  "homebrew-tap"
  "Not</strong> Grok Builder"
  "Config Builder"
  "codex-titanium --version"
)

for s in "${need_strings[@]}"; do
  if ! grep -qF "$s" "$HTML"; then
    fail "index.html missing required string: $s"
  fi
done
ok "required family needles in index.html"

# Honest version story: monorepo tip and brew may diverge — require channel language and/or verify --version
if ! grep -qF "titanium.1 channel" "$HTML" && ! grep -qE 'brew.*(lag|formula|published formula)' "$HTML"; then
  fail "index.html missing honest brew/monorepo divergence language (channel or brew lag/formula)"
fi
if ! grep -qE 'verify with|trust.*--version|codex-titanium --version' "$HTML"; then
  fail "index.html missing verify codex-titanium --version language"
fi
# Optional: either monorepo 0.147 or brew-family 0.146 may appear; neither is required alone
if grep -qE '0\.14[67]' "$HTML"; then
  ok "version digits present (0.146 and/or 0.147 family — informational)"
else
  ok "no exact 0.146/0.147 pin in HTML — family + verify --version path is acceptable"
fi

# README brand lock
grep -qF "Titanium Host" README.md || fail "README.md missing Titanium Host"
grep -qF "clibuilder" README.md || fail "README.md missing repo name clibuilder"
ok "README brand lock"

# Optional local HTTP probe (non-fatal: python may be wall-blocked)
PORT=8765
if command -v curl >/dev/null 2>&1; then
  code="$(curl -s -o /dev/null -w '%{http_code}' --max-time 1 "http://127.0.0.1:${PORT}/" 2>/dev/null || true)"
  if [[ "$code" == "200" ]]; then
    ok "HTTP 200 at http://127.0.0.1:${PORT}/"
  else
    if command -v python3 >/dev/null 2>&1; then
      if python3 -c 'import http.server' >/dev/null 2>&1; then
        python3 -m http.server "$PORT" --bind 127.0.0.1 >/tmp/clibuilder-smoke-http.log 2>&1 &
        PID=$!
        sleep 0.5
        code="$(curl -s -o /dev/null -w '%{http_code}' --max-time 2 "http://127.0.0.1:${PORT}/" 2>/dev/null || true)"
        kill "$PID" 2>/dev/null || true
        wait "$PID" 2>/dev/null || true
        if [[ "$code" == "200" ]]; then
          ok "HTTP 200 at http://127.0.0.1:${PORT}/"
        else
          echo "WARN: local HTTP probe code=${code:-none} (content checks still pass)"
        fi
      else
        echo "WARN: python3 blocked/unavailable for http.server — skip HTTP (content checks pass)"
      fi
    else
      echo "WARN: no python3 — skip HTTP (content checks pass)"
    fi
  fi
fi

echo "SMOKE PASS"
exit 0
