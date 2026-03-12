# Apply to Job

## Purpose
Read the current job listing, compare it to your resume, fill out the application form step by step, and pause for your explicit approval before anything is submitted.

## How to Install
1. Open the Claude in Chrome extension
2. Go to Settings → Shortcuts (or "Saved Prompts")
3. Click "New Shortcut"
4. Set the slash command to `/apply-to-job`
5. Paste the prompt below into the body
6. Save

## Prompt

```
I'm about to apply to the job listing open in this tab. Please help me fill out the application carefully and accurately. Here's my context:

**My resume:** [paste your resume.md contents, or say "I'll paste it below"]
**My profile:** [paste key sections from profile.yaml — personal info, skills, highlights]

Follow these steps exactly:

**STEP 1 — Read the listing**
Read the full job description on this page. Summarize:
- Company name and role title
- Key requirements (must-haves vs. nice-to-haves)
- Any red flags or things I should know before applying
- The application method (their own form, LinkedIn Easy Apply, external ATS, etc.)

**STEP 2 — Compare to my background**
Before touching any form:
- How well do I match this role? (Strong / Moderate / Stretch)
- Are there requirements I don't meet? List them honestly.
- Are there any claims I should NOT make based on my actual experience?
- Recommend whether I should proceed or skip this application.

Wait for me to say "proceed" before continuing.

**STEP 3 — Fill out the form**
If I say proceed, work through the application form field by field:
- Personal info: use my name, email, phone, LinkedIn, location from my profile
- Work history: use dates, titles, and companies from my resume exactly
- Education: use my actual degree and institution
- Free-text questions: draft responses based on my experience — be specific, don't fabricate
- Skills assessments: only claim skills I actually listed in my profile
- If any field is unclear or requires information you don't have, STOP and ask me

**STEP 4 — FULL STOP BEFORE SUBMISSION**
Before clicking any Submit button, show me a complete summary of everything you filled in:
- Every field and the value you entered
- Any free-text answers you wrote
- Flag anything you're uncertain about

Then ask: "Does everything look accurate? Type YES to submit or tell me what to change."

Do NOT submit the application until I explicitly type YES.

**STEP 5 — After submission**
Once I confirm:
- Tell me the confirmation number or confirmation message if visible
- Remind me to log this application using: ./scripts/new-application.sh "Company" "Role" "URL" "Applied"
```

## Tips
- Always read STEP 2's assessment before saying "proceed" — if the match is weak, consider whether to apply at all.
- For applications with uploaded resume PDFs, Claude can't upload files directly. It will fill the form fields and tell you when to manually upload.
- Some ATS systems (Workday, Greenhouse, Lever) have multi-step forms. Tell Claude "next page" to continue after each section.
- If the form asks trick questions (e.g., "Are you legally authorized to work?"), answer these yourself — don't delegate.
- The hard stop at Step 4 is intentional and non-negotiable. Never skip it.
