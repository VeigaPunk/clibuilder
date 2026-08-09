#!/usr/bin/env bash
# Titanium Host — fail-closed content, version-truth, and workflow smoke
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
README="$ROOT/README.md"
WORKFLOW="$ROOT/.github/workflows/smoke.yml"

# Product identity and safety posture.
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
  grep -qF "$s" "$HTML" || fail "index.html missing required string: $s"
done
ok "required product and posture needles in index.html"

grep -qF "Titanium Host" "$README" || fail "README.md missing Titanium Host"
grep -qF "clibuilder" "$README" || fail "README.md missing repo name clibuilder"
ok "README brand lock"

# Pull the current public declarations. Network or parse failure is a hard failure:
# a stale version claim must never be reported green.
command -v curl >/dev/null 2>&1 || fail "curl required for authoritative version check"
SOURCE_TOML="$(curl -fsSL --retry 3 --retry-all-errors \
  https://raw.githubusercontent.com/VeigaPunk/codex-titanium/main/codex-rs/Cargo.toml)"
FORMULA_RB="$(curl -fsSL --retry 3 --retry-all-errors \
  https://raw.githubusercontent.com/VeigaPunk/homebrew-tap/master/Formula/codex-titanium.rb)"

SOURCE_VERSION="$(awk '
  /^\[workspace\.package\]$/ { in_workspace = 1; next }
  in_workspace && /^\[/ { exit }
  in_workspace && /^[[:space:]]*version[[:space:]]*=/ {
    sub(/^[^"]*"/, ""); sub(/".*$/, ""); print; exit
  }
' <<<"$SOURCE_TOML")"
FORMULA_VERSION="$(awk -F'"' '
  /^[[:space:]]*version[[:space:]]+"/ { print $2; exit }
' <<<"$FORMULA_RB")"

[[ "$SOURCE_VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+-alpha\.[0-9]+(\.[0-9]+)?\+titanium\.1$ ]] \
  || fail "could not parse authoritative default-branch source version"
[[ "$FORMULA_VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+-alpha\.[0-9]+(\.[0-9]+)?\+titanium\.1$ ]] \
  || fail "could not parse authoritative Homebrew formula version"

for file in "$HTML" "$README"; do
  grep -qF "Default-branch source: $SOURCE_VERSION" "$file" \
    || fail "$file missing current labeled source version: $SOURCE_VERSION"
  grep -qF "Homebrew formula: $FORMULA_VERSION" "$file" \
    || fail "$file missing current labeled formula version: $FORMULA_VERSION"
done

mapfile -t FOUND_VERSIONS < <(
  grep -Eho '[0-9]+\.[0-9]+\.[0-9]+-alpha\.[0-9]+(\.[0-9]+)?\+titanium\.1' "$HTML" "$README" | sort -u
)
for version in "${FOUND_VERSIONS[@]}"; do
  if [[ "$version" != "$SOURCE_VERSION" && "$version" != "$FORMULA_VERSION" ]]; then
    fail "stale or unsupported exact Titanium version in public docs: $version"
  fi
done
ok "public source/formula claims match current authoritative declarations"

# Keep the CI wrapper immutable and least-privileged.
grep -Eq '^permissions:[[:space:]]*$' "$WORKFLOW" \
  || fail "workflow missing top-level permissions"
grep -Eq '^  contents:[[:space:]]*read[[:space:]]*$' "$WORKFLOW" \
  || fail "workflow must grant contents: read"
if grep -Eq '^[[:space:]]+[A-Za-z0-9_-]+:[[:space:]]*write([[:space:]]|$)' "$WORKFLOW"; then
  fail "workflow must not grant write permissions"
fi
grep -Eq 'uses:[[:space:]]+actions/checkout@[0-9a-f]{40}([[:space:]]+#.*)?$' "$WORKFLOW" \
  || fail "actions/checkout must be pinned to an immutable 40-hex commit"
if grep -Eq 'uses:[[:space:]]+actions/checkout@v[0-9]' "$WORKFLOW"; then
  fail "mutable actions/checkout major tag is forbidden"
fi
grep -Eq '^    timeout-minutes:[[:space:]]*[1-9][0-9]*[[:space:]]*$' "$WORKFLOW" \
  || fail "workflow job needs a positive timeout"
ok "workflow pin, permissions, and timeout contract"

# Optional local HTTP probe. Content/version/workflow gates above remain authoritative.
PORT=8765
if command -v curl >/dev/null 2>&1; then
  code="$(curl -s -o /dev/null -w '%{http_code}' --max-time 1 "http://127.0.0.1:${PORT}/" 2>/dev/null || true)"
  if [[ "$code" == "200" ]]; then
    ok "HTTP 200 at http://127.0.0.1:${PORT}/"
  elif command -v python3 >/dev/null 2>&1 && python3 -c 'import http.server' >/dev/null 2>&1; then
    python3 -m http.server "$PORT" --bind 127.0.0.1 >/tmp/clibuilder-smoke-http.log 2>&1 &
    PID=$!
    sleep 0.5
    code="$(curl -s -o /dev/null -w '%{http_code}' --max-time 2 "http://127.0.0.1:${PORT}/" 2>/dev/null || true)"
    kill "$PID" 2>/dev/null || true
    wait "$PID" 2>/dev/null || true
    [[ "$code" == "200" ]] && ok "HTTP 200 at http://127.0.0.1:${PORT}/" \
      || echo "WARN: local HTTP probe code=${code:-none} (hard gates still pass)"
  else
    echo "WARN: python3 unavailable for local HTTP probe (hard gates still pass)"
  fi
fi

echo "SMOKE PASS"
