# Search Jobs

## Purpose
Scan the current job board tab, apply filters from your profile, and summarize the top 5–10 matching listings. Use this as a standalone scouting step before running `/autopilot`, or when you just want to see what's out there.

## How to Install
1. Open the Claude in Chrome extension
2. Go to Settings → Shortcuts (or "Saved Prompts")
3. Click "New Shortcut"
4. Set the slash command to `/search-jobs`
5. Paste the prompt below into the body
6. Save

## Prompt

```
Read config/profile.yaml and logs/applications.csv from the local project.

On the job board currently open in this tab:

1. **Search** using my target job titles from profile.yaml (job_search.titles). Try multiple title variations if the board supports it.
2. **Filter** results: location preference, posted_within_days, and salary range from profile.yaml. Apply whatever filters the board supports.
3. **Scroll** through at least 2–3 pages of results (30–50 listings).
4. **Skip** anything matching exclusions in profile.yaml, and any company already in logs/applications.csv.
5. **Summarize** the top 5–10 matches:

| # | Company | Role | Location / Style | Salary | Match Score | URL |
|---|---|---|---|---|---|---|

Match Score: Strong / Good / Stretch — one-sentence reason for each.

After the table:
- How many total listings reviewed
- Any patterns noticed (recurring requirements, salary trends, hot skills)
- Top 2–3 picks and why

Do not navigate to any company websites. Read listings inline from the job board only.
```

## Tips
- Run this first to scout, then run `/autopilot` to tailor resumes for the ones you want.
- Log in to the job board before running this.
- LinkedIn Jobs, Indeed, Wellfound, and Glassdoor all work well with this shortcut.
