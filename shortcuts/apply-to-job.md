# Apply to Job (Prep)

## Purpose
Single-job prep shortcut: reads the listing visible in the current tab, tailors your resume, optionally drafts a cover letter, and logs the job to applications.csv with status "Ready to Apply". You apply manually.

## How to Install
1. Open the Claude in Chrome extension
2. Go to Settings → Shortcuts (or "Saved Prompts")
3. Click "New Shortcut"
4. Set the slash command to `/apply-to-job`
5. Paste the prompt below into the body
6. Save

## Prompt

```
Read config/resume.md, config/profile.yaml, and config/cover-letter-base.md from the local project.
Also read logs/applications.csv to check if I've already prepped for this company.

Read the job listing currently visible in this tab. Do not navigate to the company's own website — use the description as shown on this page.

**STEP 1 — Parse the listing**
- Company name and exact role title
- Must-have vs. nice-to-have requirements
- Any red flags worth knowing (e.g., excessive requirements, vague scope)
- Application URL (if visible on this page)

**STEP 2 — Fit assessment**
- Match rating: Strong / Moderate / Stretch
- Requirements I don't meet — list honestly
- Recommendation: proceed or skip

Ask: "Proceed with tailoring, or skip?" — wait for my reply.

**STEP 3 — Tailor resume**
Apply High and Medium priority changes. Save to:
`logs/resumes/YYYY-MM-DD-[company]-[role-slug].md`

Show me the key changes made.

**STEP 4 — Cover letter (optional)**
Ask: "Draft a cover letter too? (yes/no)"

If yes: draft using cover-letter-base.md structure and save to:
`logs/cover-letters/YYYY-MM-DD-[company]-[role-slug].md`

**STEP 5 — Log to CSV**
Append to logs/applications.csv:
`YYYY-MM-DD,[company],[role],[url],Ready to Apply,[match_score],logs/resumes/[file],[cover_letter_file_or_blank],,[YYYY-MM-DD+7]`

Confirm the row was written and show it.

---
Apply to this job manually using the saved resume. After you submit, update the status in logs/applications.csv from "Ready to Apply" → "Applied".
```

## Tips
- Works with any job board that shows the full JD inline (LinkedIn, Indeed, Wellfound, Glassdoor).
- Use `/autopilot` for bulk prep across multiple jobs in one session.
- Cover letter is optional — skip it for roles where it isn't required.
