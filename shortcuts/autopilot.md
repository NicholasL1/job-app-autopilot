# Autopilot

## Purpose
Two-phase pipeline: searches the current job board, collects 5–10 matching listings, tailors a resume for each job using its inline description, and logs everything to applications.csv. You apply manually using the saved resumes.

## How to Install
1. Open the Claude in Chrome extension
2. Go to Settings → Shortcuts (or "Saved Prompts")
3. Click "New Shortcut"
4. Set the slash command to `/autopilot`
5. Paste the prompt below into the body
6. Save

## Prompt

```
Read config/profile.yaml, config/resume.tex, and logs/applications.csv from the local project.

We are running a two-phase job prep pipeline. Do not navigate away from the job board at any point — read all job descriptions inline from the board itself.

---

**PHASE 1 — Search & Filter**

On the job board currently open in this tab:
1. Search using my target titles from profile.yaml (job_search.titles). Try multiple title variations if the board supports it.
2. Apply filters: location preference, posted_within_days, and salary range from profile.yaml.
3. Scroll through at least 2–3 pages of results (30–50 listings minimum).
4. Skip anything matching exclusions in profile.yaml (industries, companies, keywords).
5. Skip any company already in logs/applications.csv.
6. Identify the top 5–10 strongest matches. Read each listing inline on the job board — do not navigate to the company's own website.

Show me a summary table:
| # | Company | Role | Location | Salary | Match Score | URL |

Match Score: Strong / Good / Stretch — one-sentence reason.

Ask: "Which of these do you want resumes tailored for? Reply with numbers (e.g. '1 3 5'), 'all', or 'skip' to cancel."

Wait for my reply before continuing.

---

**PHASE 2 — Tailor Resumes**

For each job I selected, working one at a time:

2a. Read the full job description inline from the job board (expand the listing if needed — do not navigate to the company site).

2b. Tailor my resume for this specific role:
- Reorder or reframe bullets to match the listing's priorities
- Surface keywords from the JD that exist in my experience but aren't prominent
- Apply High and Medium priority changes only
- Never fabricate experience, skills, or accomplishments
- If a keyword appears in the listing but I have no relevant experience, skip it

2c. Save the tailored resume to:
`logs/resumes/[Company]-[Job]-[Date].tex` (e.g., `Stripe-SoftwareEngineerII-2026-03-15.tex`)

2d. Save a companion job info file to:
`logs/resumes/[Company]-[Job]-[Date].md`
Include: date posted, apply URL, location, salary, key requirements (bullet list), match assessment (Strong/Good/Stretch + reasoning), resume modifications made (every change from config/resume.tex), and any other notes (recruiter, deadline, referral, quirks).

2e. Append a row to logs/applications.csv:
`YYYY-MM-DD,[company],[role],[url],Ready to Apply,[match_score],logs/resumes/[file],,,[YYYY-MM-DD+7]`

Show me: "Tailored resume saved for [Company] — [Role]. Match score: X/10."

Then move to the next job without stopping.

---

**PHASE 3 — Session Summary**

After all selected jobs are processed:

| # | Company | Role | Match Score | Resume File | URL |
|---|---|---|---|---|---|

- Total tailored: X
- Skipped and why (if any)
- Top recommendation to apply to first
- Any recurring skills gaps or patterns worth noting across listings

---

**Rules throughout:**
- Never navigate to company websites — read JDs only from the job board
- Never fabricate anything
- Never log a company already in applications.csv
- Save each resume file before moving to the next job
- If a listing can't be read inline, skip it and note it in the summary
```

## Tips
- Have the job board open and logged in before running `/autopilot`.
- LinkedIn Jobs, Indeed, Wellfound, and Glassdoor all show full JDs inline — use one of these.
- After the session, open each tailored resume from `logs/resumes/` to review before applying.
- You control which jobs get tailored — after Phase 1 you choose the subset.
- Run `/draft-cover-letter` separately for any role you want a cover letter for.
- After you manually submit an application, update its status in applications.csv from "Ready to Apply" → "Applied".
