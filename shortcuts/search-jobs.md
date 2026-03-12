# Search Jobs

## Purpose
Scan the current job board tab, filter results to strong matches, and summarize the top listings with key details.

## How to Install
1. Open the Claude in Chrome extension
2. Go to Settings → Shortcuts (or "Saved Prompts")
3. Click "New Shortcut"
4. Set the slash command to `/search-jobs`
5. Paste the prompt below into the body
6. Save

## Prompt

```
I'm job hunting and I need your help scanning this job board. Here's my context:

**My target roles:** [paste your job_search.titles from profile.yaml]
**My primary skills:** [paste your primary_skills from profile.yaml]
**Location preference:** [paste your location_preference from profile.yaml]
**Preferred cities (if not remote):** [paste your preferred_cities]
**Exclude:** [paste your exclusions from profile.yaml, or "none"]
**Only show listings posted in the last:** [paste your posted_within_days] days

Please do the following on the job board currently open in this tab:

1. **Search** using my target job titles. Try multiple title variations if the board supports it (e.g., "Software Engineer" AND "Full-Stack Developer").
2. **Filter** results to match my location preference and recency requirement. If the board has salary filters, apply my range too.
3. **Scroll through** the results (at least the first 2–3 pages or 30–50 listings).
4. **Evaluate** each listing against my skills and exclusions. Skip anything in my excluded industries, companies, or containing excluded keywords.
5. **Summarize** the top 5–10 matches in a table with these columns:
   - Company
   - Role Title
   - Location / Work Style
   - Key Requirements (3–5 bullets)
   - Salary (if listed)
   - URL
   - Match Score (Strong / Good / Stretch) with a one-sentence reason

After the table, tell me:
- How many total listings you reviewed
- Any patterns you noticed (common requirements, hot skills, salary trends)
- Which 2–3 you'd recommend I apply to first and why

Be honest about stretch roles. I'd rather know upfront than be surprised.
```

## Tips
- Run this shortcut on LinkedIn Jobs, Indeed, Wellfound, or any standard job board — the prompt works on all of them.
- If a board requires you to log in, do that first, then run the shortcut.
- For LinkedIn specifically, use the "Jobs" tab with filters already set before running — Claude will pick up where your filters left off.
- Save the output somewhere (a note, your changelog) before navigating away — Claude can't scroll back.
- Run this daily or every other day for best results. New listings expire fast.
