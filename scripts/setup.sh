#!/usr/bin/env bash
# =============================================================================
# setup.sh — Job App Autopilot: First-time setup
#
# Safe to run multiple times (idempotent).
# Run from the repo root: ./scripts/setup.sh
# =============================================================================

set -euo pipefail

# ── Colors ────────────────────────────────────────────────────────────────────
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

info()    { echo -e "${CYAN}[info]${RESET}  $*"; }
success() { echo -e "${GREEN}[ok]${RESET}    $*"; }
warn()    { echo -e "${YELLOW}[warn]${RESET}  $*"; }
error()   { echo -e "${RED}[error]${RESET} $*"; }
header()  { echo -e "\n${BOLD}$*${RESET}"; }

# ── Verify: inside a git repo ─────────────────────────────────────────────────
header "Checking environment..."

if ! command -v git &>/dev/null; then
  error "git is not installed. Please install git and re-run this script."
  exit 1
fi
success "git is installed"

if ! git rev-parse --git-dir &>/dev/null; then
  error "Not inside a git repository."
  error "Make sure you cloned this repo first, then run this script from the repo root."
  exit 1
fi
success "Inside a git repository"

# ── Verify: running from repo root ────────────────────────────────────────────
if [ ! -d "config" ] || [ ! -d "scripts" ]; then
  error "Run this script from the repo root directory, not from inside scripts/."
  error "Usage: ./scripts/setup.sh"
  exit 1
fi
success "Running from repo root"

# ── Check: config files have been filled in ───────────────────────────────────
header "Checking config files..."

NEEDS_SETUP=0

if grep -q "Your Full Name" config/profile.yaml 2>/dev/null; then
  warn "config/profile.yaml still has placeholder values."
  warn "  → Open config/profile.yaml and replace all placeholder values with your info."
  NEEDS_SETUP=1
else
  success "config/profile.yaml looks filled in"
fi

if grep -q "\[Your Full Name\]" config/resume.md 2>/dev/null; then
  warn "config/resume.md still has placeholder values."
  warn "  → Open config/resume.md and replace all [bracketed] placeholders with your info."
  NEEDS_SETUP=1
else
  success "config/resume.md looks filled in"
fi

# ── Create applications.csv if it doesn't exist ───────────────────────────────
header "Checking logs/..."

if [ ! -f "logs/applications.csv" ]; then
  echo "date,company,role,url,status,notes" > logs/applications.csv
  success "Created logs/applications.csv with headers"
else
  # Check if headers are correct; if empty beyond header, that's fine
  HEADER=$(head -1 logs/applications.csv)
  EXPECTED="date,company,role,url,status,notes"
  if [ "$HEADER" != "$EXPECTED" ]; then
    warn "logs/applications.csv has unexpected headers: $HEADER"
    warn "  → Expected: $EXPECTED"
    warn "  → Back up and recreate if needed."
  else
    success "logs/applications.csv exists with correct headers"
  fi
fi

# ── Make scripts executable ───────────────────────────────────────────────────
header "Making scripts executable..."

chmod +x scripts/setup.sh
chmod +x scripts/new-application.sh
success "scripts/ are executable"

# ── Summary ───────────────────────────────────────────────────────────────────
header "Setup complete!"
echo ""

if [ "$NEEDS_SETUP" -eq 1 ]; then
  echo -e "${YELLOW}${BOLD}Action required — complete these steps before you start applying:${RESET}"
  echo ""
  echo "  1. ${BOLD}Fill in config/profile.yaml${RESET}"
  echo "     → Your target roles, skills, location, salary range, and tone"
  echo ""
  echo "  2. ${BOLD}Fill in config/resume.md${RESET}"
  echo "     → Replace all [bracketed] placeholders with your actual info"
  echo ""
  echo "  3. ${BOLD}Review config/cover-letter-base.md${RESET}"
  echo "     → Adjust the structure and voice to match how you write"
  echo ""
else
  echo -e "${GREEN}${BOLD}Your config files look filled in. Nice work.${RESET}"
  echo ""
fi

echo "  4. ${BOLD}Install the Claude in Chrome extension${RESET}"
echo "     → See docs/SETUP.md for step-by-step instructions"
echo ""
echo "  5. ${BOLD}Create your shortcuts in the extension${RESET}"
echo "     → See docs/SHORTCUTS.md for all 5 shortcuts"
echo ""
echo "  6. ${BOLD}Start your first search session${RESET}"
echo "     → Open a job board, run /search-jobs"
echo "     → Read docs/WORKFLOW.md for the full day-to-day guide"
echo ""
echo -e "${CYAN}Happy hunting.${RESET}"
echo ""
