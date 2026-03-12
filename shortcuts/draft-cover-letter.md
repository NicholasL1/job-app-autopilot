# Draft Cover Letter

## Purpose
Read the current job listing, do brief company research, and draft a tailored cover letter under 300 words using your base template — for review only, never submitted automatically.

## How to Install
1. Open the Claude in Chrome extension
2. Go to Settings → Shortcuts (or "Saved Prompts")
3. Click "New Shortcut"
4. Set the slash command to `/draft-cover-letter`
5. Paste the prompt below into the body
6. Save

## Prompt

```
I need a tailored cover letter for the job listing open in this tab. Please draft one for me to review.

**My resume:** [paste your resume.md contents, or say "I'll paste it below"]
**My communication preferences:**
- Tone: [paste your communication.tone from profile.yaml]
- Highlights to emphasize: [paste your communication.highlights from profile.yaml]
- Things to avoid: [paste your communication.avoid from profile.yaml]

**My base cover letter template:** [paste your cover-letter-base.md contents]

Follow these steps:

**STEP 1 — Read the listing**
Extract:
- Company name and role title (exact spelling matters)
- The 2–3 things this company seems to value most in this hire
- Any specific projects, products, or challenges mentioned that I can speak to
- The name of the hiring manager if listed (use "Hiring Team" if not)

**STEP 2 — Quick company research**
Without leaving the tab (use context from the listing and company description):
- What does this company do in one sentence?
- What makes them distinct from competitors (if mentioned)?
- Is there a mission statement or value I genuinely connect with?
- Note: if there's a "About us" section, use it. Don't fabricate details.

**STEP 3 — Draft the letter**
Write a cover letter that:
- Opens with something specific about THIS company — not a generic "I am excited to apply"
- Leads with my single most relevant accomplishment for this role (with a number or concrete result)
- Has exactly 3 paragraphs: hook + accomplishment, secondary strength, closing
- Matches my tone preference
- Stays under 300 words (300 is the ceiling, shorter is fine)
- Uses the structure from my base template but sounds human, not templated
- Does NOT use: "I am passionate about", "team player", "detail-oriented", "results-driven", or similar clichés
- Only claims things that are in my resume or profile — no fabrication

**STEP 4 — Review checklist**
After the draft, run through and report on:
- [ ] Word count
- [ ] Tone match (does it sound like me?)
- [ ] Strongest line (which sentence would make a hiring manager keep reading?)
- [ ] Anything that might read as generic or unconvincing
- [ ] Suggested subject line if emailing directly

Output the draft first, then the checklist. Do not submit or upload anything.
```

## Tips
- If the listing has a specific application question ("Why do you want to work here?"), paste it into the chat after running the shortcut — Claude will incorporate it into the draft.
- The 300-word limit is intentional. Hiring managers spend ~30 seconds on cover letters. Respect their time.
- Read the draft out loud before using it. If any sentence sounds like a robot wrote it, flag it and ask Claude to revise.
- Save the final draft as a text file named `[company]-[role]-cover-letter.txt` in your logs/ folder for reference.
- If you're applying to multiple roles at one company, you can reuse most of the letter but update the role-specific sections.
