# Tailor Resume

## Purpose
Compare the current job listing to your resume and produce a prioritized list of suggested changes — keywords to add, bullets to rephrase, sections to emphasize — without modifying any files.

## How to Install
1. Open the Claude in Chrome extension
2. Go to Settings → Shortcuts (or "Saved Prompts")
3. Click "New Shortcut"
4. Set the slash command to `/tailor-resume`
5. Paste the prompt below into the body
6. Save

## Prompt

```
I'm preparing to apply to the job listing open in this tab and I want to tailor my resume for it. This is advisory only — don't modify any files.

**My resume:** [paste your resume.md contents, or say "I'll paste it below"]
**My profile:** [paste your primary_skills and highlights from profile.yaml]

Please do the following:

**STEP 1 — Extract the job's requirements**
Read the listing carefully and extract:
- Must-have skills/experience (listed as required)
- Nice-to-have skills/experience (preferred/bonus)
- Keywords that appear in the listing (specific tools, methodologies, domain terms)
- The "hidden" priorities — what does the role actually seem to value most based on how it's written?

**STEP 2 — Gap analysis**
Compare the listing to my resume and tell me:
- Skills/keywords in the listing that are missing from my resume entirely
- Skills I have but haven't highlighted enough
- Bullets that are weak or vague and could be made more relevant to this role
- Sections that are out of order (e.g., should Skills come before Experience for this role?)

**STEP 3 — Prioritized recommendations**
Give me a ranked list of changes to make, from highest to lowest impact:

For each recommendation, provide:
- **What to change:** (specific bullet, section, or phrasing)
- **Why:** (what it addresses in the listing)
- **Suggested revision:** (the actual rewrite, using my real experience — no fabrication)
- **Priority:** High / Medium / Low

Format this as a numbered list I can work through one by one.

**STEP 4 — Summary**
- After making the recommended changes, how strong would my resume be for this role? (1–10)
- Is there anything about my background I should proactively address in a cover letter?
- Are there any requirements I genuinely don't meet that I should be upfront about?

Important: Only suggest changes that are truthful based on my actual resume and profile. If a keyword appears in the listing but I have no relevant experience, say so — don't suggest adding it.
```

## Tips
- Run this before `/draft-cover-letter` — the gap analysis often reveals things your cover letter should address.
- You don't have to make every recommended change. High-priority ones are usually worth it; low-priority ones are optional.
- If you're applying to many similar roles, you'll start to notice the same changes coming up — that's a signal to update your master resume.md permanently.
- Save the output for this application in a note or add it to your logs/ folder for reference.
- This shortcut does NOT edit your resume file. Make changes manually to resume.md yourself.
