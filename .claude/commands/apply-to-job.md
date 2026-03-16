Read config/resume.md and config/profile.yaml from the local project.

I'm about to apply to the job listing open in this tab. Follow these steps exactly.

**STEP 1 — Read the listing**
Summarize:
- Company name and role title (exact)
- Key requirements (must-haves vs. nice-to-haves)
- Any red flags or things I should know before applying
- Application method (their own form, LinkedIn Easy Apply, external ATS, etc.)

**STEP 2 — Fit assessment**
Before touching any form:
- How well do I match this role? (Strong / Moderate / Stretch)
- Requirements I don't meet — list them honestly
- Any claims I should NOT make based on my actual experience
- Recommend whether to proceed or skip

Wait for me to say "proceed" before continuing.

**STEP 3 — Tailor and save resume**
If proceeding, quickly tailor my resume for this role (High/Medium priority changes only) and save to:
`logs/resumes/YYYY-MM-DD-[company]-[role-slug].md`

**STEP 4 — Draft and save cover letter**
Draft a tailored cover letter using config/cover-letter-base.md and save to:
`logs/cover-letters/YYYY-MM-DD-[company]-[role-slug].md`

Show me both files. Wait for me to say "looks good" or request changes before continuing.

**STEP 5 — Fill out the form**
Work through the application form field by field:
- Personal info: use name, email, phone, LinkedIn from profile.yaml (personal section)
- Work history: use exact dates, titles, and companies from resume.md
- Education: use exact degree and institution from resume.md
- Free-text questions: draft responses from my actual experience — no fabrication
- Skills: only claim skills listed in profile.yaml
- If any field requires info you don't have, STOP and ask me

**STEP 6 — FULL STOP BEFORE SUBMISSION**
Show a complete summary of everything filled in:
- Every field and value entered
- All free-text answers written
- Flag anything uncertain

Ask: "Does everything look accurate? Type YES to submit or tell me what to change."

Do NOT submit until I explicitly type YES.

**STEP 7 — After submission**
Once confirmed and submitted:
- Note the confirmation number or message if visible
- Append a new row to logs/applications.csv:
  `YYYY-MM-DD,[company],[role],[url],Applied,[match_score],logs/resumes/[file],logs/cover-letters/[file],[any notes],YYYY-MM-DD+7`
- Confirm the row was written and show it to me
