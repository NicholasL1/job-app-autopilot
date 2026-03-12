#!/usr/bin/env bash
# =============================================================================
# new-application.sh — Log a new job application to applications.csv
#
# Usage:
#   ./scripts/new-application.sh "Company Name" "Role Title" "https://url" "Status"
#
# Status options: Applied | Interviewing | Offer | Rejected | Withdrawn | Ghosted
#
# Examples:
#   ./scripts/new-application.sh "Stripe" "Software Engineer II" "https://stripe.com/jobs/123" "Applied"
#   ./scripts/new-application.sh "Notion" "Product Designer" "https://notion.so/careers/456" "Interviewing"
#
# The date is auto-filled. Add notes as a 5th argument (optional, use quotes):
#   ./scripts/new-application.sh "Figma" "Frontend Engineer" "https://..." "Applied" "Referred by Jane"
# =============================================================================

set -euo pipefail

CSV_FILE="logs/applications.csv"

# ── Validate arguments ────────────────────────────────────────────────────────
if [ "$#" -lt 4 ]; then
  echo "Usage: ./scripts/new-application.sh \"Company\" \"Role\" \"URL\" \"Status\" [\"Notes\"]"
  echo ""
  echo "Status options: Applied | Interviewing | Offer | Rejected | Withdrawn | Ghosted"
  echo ""
  echo "Example:"
  echo "  ./scripts/new-application.sh \"Stripe\" \"Software Engineer II\" \"https://stripe.com/jobs/123\" \"Applied\""
  exit 1
fi

COMPANY="$1"
ROLE="$2"
URL="$3"
STATUS="$4"
NOTES="${5:-}"
DATE=$(date +"%Y-%m-%d")

# ── Verify CSV exists ─────────────────────────────────────────────────────────
if [ ! -f "$CSV_FILE" ]; then
  echo "logs/applications.csv not found. Run ./scripts/setup.sh first."
  exit 1
fi

# ── Escape commas in fields (simple CSV safety) ───────────────────────────────
# Wrap any field containing a comma in double quotes
escape_csv() {
  local field="$1"
  if [[ "$field" == *","* || "$field" == *'"'* || "$field" == *$'\n'* ]]; then
    # Escape internal double quotes and wrap in double quotes
    field="${field//\"/\"\"}"
    echo "\"$field\""
  else
    echo "$field"
  fi
}

COMPANY_ESC=$(escape_csv "$COMPANY")
ROLE_ESC=$(escape_csv "$ROLE")
URL_ESC=$(escape_csv "$URL")
STATUS_ESC=$(escape_csv "$STATUS")
NOTES_ESC=$(escape_csv "$NOTES")

# ── Append row ────────────────────────────────────────────────────────────────
echo "${DATE},${COMPANY_ESC},${ROLE_ESC},${URL_ESC},${STATUS_ESC},${NOTES_ESC}" >> "$CSV_FILE"

echo "Logged: ${DATE} | ${COMPANY} | ${ROLE} | ${STATUS}"
echo "File: ${CSV_FILE}"
echo ""
echo "To view your applications:"
echo "  cat logs/applications.csv"
echo ""
echo "To update a status later, open logs/applications.csv in any text editor or spreadsheet app."
