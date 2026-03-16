# Tailor Resume

## Purpose
Tailor your resume for a single job listing currently open or visible in the tab. Reads the JD inline from the job board — does not navigate to the company's website. Saves the tailored version to logs/resumes/.

## How to Install
1. Open the Claude in Chrome extension
2. Go to Settings → Shortcuts (or "Saved Prompts")
3. Click "New Shortcut"
4. Set the slash command to `/tailor-resume`
5. Paste the prompt below into the body
6. Save

## Prompt

```
Read config/resume.tex and config/profile.yaml from the local project.

Read the job listing currently visible in this tab. Do not navigate to the company's website — use the description as shown on this page.

**STEP 1 — Extract the job's requirements**
- Must-have skills/experience
- Nice-to-have skills/experience
- Keywords that appear in the listing (specific tools, methodologies, domain terms)
- The "hidden" priorities — what does the role actually seem to value most?

**STEP 2 — Gap analysis**
Compare the listing to my resume.md:
- Skills/keywords in the listing missing from my resume
- Skills I have but haven't highlighted enough for this role
- Bullets that are weak or vague relative to this listing
- Any section ordering changes worth making

**STEP 3 — Prioritized recommendations**
Ranked by impact. For each:
- **What to change:** specific bullet, section, or phrasing
- **Why:** what it addresses in the listing
- **Suggested revision:** actual rewrite using my real experience — no fabrication
- **Priority:** High / Medium / Low

**STEP 4 — Save the tailored resume**
Apply all High and Medium priority changes and save to:
`logs/resumes/[Company]-[Job]-[Date].tex`

Company = TitleCase company name. Job = TitleCase role title, hyphens for spaces. Date = YYYY-MM-DD. Example: `Stripe-SoftwareEngineerII-2026-03-15.tex`.

**STEP 5 — Summary**
- Match score for this role (1–10)
- Anything worth addressing in a cover letter
- Requirements I genuinely don't meet
- Path where the tailored resume was saved

Only suggest changes truthful to my actual experience. If a keyword appears in the listing but I have no relevant experience, say so — do not invent it.
```

## Tips
- Works best when the full JD is visible on the current page (LinkedIn, Indeed, Wellfound, Glassdoor).
- Run before `/draft-cover-letter` — the gap analysis informs what the cover letter should address.
- Use `/autopilot` to tailor resumes for multiple jobs in one session.
