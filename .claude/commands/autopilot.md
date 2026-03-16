Read config/profile.yaml, config/resume.tex, and config/cover-letter-base.md from the local project. Also read logs/applications.csv to know which companies I've already applied to — skip any duplicates.

We are running the full job application pipeline. Follow these phases in order.

---

**PHASE 1 — Search**

On the job board currently open in this tab:
1. Search using my target titles from profile.yaml (job_search.titles)
2. Filter by location preference and posted_within_days
3. Scroll through at least 2–3 pages of results
4. Skip: anything matching exclusions in profile.yaml, and any company already in applications.csv
5. Identify the top 3–5 strongest matches

Show me a summary table:
| # | Company | Role | Location | Salary | Match Score | URL |

Ask me: "Which of these do you want to apply to? Reply with numbers (e.g., '1 3') or 'all' for all Strong/Good matches."

Wait for my reply before continuing.

---

**PHASE 2 — Prepare (for each selected job)**

For each job I selected, run the following before touching any application form:

2a. **Fit check**
- Open the job listing
- How well do I match? (Strong / Moderate / Stretch)
- List any requirements I don't meet honestly
- Recommend proceed or skip

If Stretch or weak match, tell me and ask: "Proceed anyway or skip?" before continuing.

2b. **Tailor resume**
- Apply High and Medium priority changes to produce a tailored resume
- Save to: `logs/resumes/[Company]-[Job]-[Date].tex` (e.g., `Stripe-SoftwareEngineerII-2026-03-15.tex`)
- Save a companion job info file to: `logs/resumes/[Company]-[Job]-[Date].md` containing:
  - Date posted, apply URL, location, salary
  - Key requirements (bullet list from the JD)
  - Match assessment (Strong/Good/Stretch + reasoning)
  - Resume modifications made (every change from config/resume.tex)
  - Any other notes (recruiter, deadline, referral, quirks)

2c. **Save job info**
- Save a companion file to `logs/resumes/[Company]-[Job]-[Date].md` containing:
  - Date posted, apply URL, location, salary
  - Key requirements (bullet list from the JD)
  - Match assessment (Strong/Good/Stretch + reasoning)
  - Resume modifications made (every change from config/resume.tex)
  - Any other notes (recruiter, deadline, referral, quirks)

2d. **Draft cover letter**
- Write a tailored cover letter using cover-letter-base.md structure and my communication preferences from profile.yaml
- Save to: `logs/cover-letters/[Company]-[Job]-[Date].md` (e.g., `Stripe-SoftwareEngineerII-2026-03-15.md`)

Show me both files for this job. Ask: "Ready to apply to [Company] — [Role]? Type YES to proceed or tell me what to change."

Wait for YES before moving to Phase 3 for this job.

---

**PHASE 3 — Apply (for each confirmed job)**

3a. Navigate to the application URL
3b. Fill out the form field by field:
- Personal info from profile.yaml (personal section)
- Work history from resume.md (exact dates, titles, companies)
- Education from resume.md
- Free-text answers based on my real experience — no fabrication
- Skills only from profile.yaml
- Stop and ask if any field needs info you don't have

3c. **HARD STOP before submission**
Show a complete pre-submission summary:
- Every field filled in
- All free-text answers written
- Any uncertain fields flagged

Ask: "Everything look accurate for [Company] — [Role]? Type YES to submit or tell me what to change."

Do NOT submit until I explicitly type YES.

3d. **After submission**
- Note the confirmation number/message if visible
- Append to logs/applications.csv:
  `YYYY-MM-DD,[company],[role],[url],Applied,[match_score],logs/resumes/[file],logs/cover-letters/[file],[notes],YYYY-MM-DD+7`
- Confirm the row was written

---

**PHASE 4 — Session summary**

After all selected jobs are processed, output a summary:
- Applications submitted this session (company, role, match score)
- Applications skipped and why
- Files saved (resumes and cover letters)
- Recommended follow-up dates
- Any patterns noticed across the listings (recurring skills gaps, salary trends, etc.)

---

**Rules that apply throughout:**
- Never fabricate experience, skills, or accomplishments
- Never submit without an explicit YES from me
- Never apply to a company already in applications.csv
- Always save artifacts before moving to the next job
- If anything is ambiguous or missing, stop and ask rather than guess
