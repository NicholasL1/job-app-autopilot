# Job App Autopilot

A personal automation toolkit for job seekers — powered by Claude in Chrome and Claude Code.

Fill in your profile once. Use 5 shortcuts to search, tailor, apply, and follow up at scale.

---

## What This Does

Job App Autopilot turns Claude into a job search assistant that knows you. Instead of typing the same context into every conversation, you store your resume, skills, target roles, and communication preferences in config files. The shortcuts reference that context automatically.

**Claude in Chrome** handles the browser-side work: scanning job boards, reading listings, filling application forms, drafting cover letters and follow-up emails.

**Claude Code** (optional) handles the terminal-side work: running setup, logging applications, iterating on your materials.

You stay in control. Every shortcut has built-in review steps and hard stops before anything is submitted.

---

## Folder Structure

```
./
├── README.md
├── .gitignore
├── config/
│   ├── resume.md              # Your master resume (fill this in once)
│   ├── profile.yaml           # Structured preferences — the single source of truth
│   └── cover-letter-base.md   # Adaptable cover letter template
├── shortcuts/
│   ├── search-jobs.md         # Scan job boards and surface top matches
│   ├── apply-to-job.md        # Fill and review applications (stops before submit)
│   ├── tailor-resume.md       # Match your resume to a specific listing
│   ├── draft-cover-letter.md  # Write a per-job cover letter under 300 words
│   └── follow-up.md           # Draft follow-up emails (polite persistence)
├── logs/
│   ├── applications.csv       # Your application tracker
│   └── changelog.md           # What you changed and why
├── scripts/
│   ├── setup.sh               # One-command setup
│   └── new-application.sh     # Log a new application to the CSV
└── docs/
    ├── SETUP.md               # Detailed setup instructions
    ├── SHORTCUTS.md           # Shortcut reference and customization
    └── WORKFLOW.md            # Day-to-day usage guide
```

---

## Quick Start

```bash
# 1. Clone the repo
git clone https://github.com/YOUR_USERNAME/job-app-autopilot.git
cd job-app-autopilot

# 2. Run setup
./scripts/setup.sh

# 3. Fill in your config files
#    → config/profile.yaml   (your target roles, skills, preferences)
#    → config/resume.md      (your actual resume)

# 4. Install the Claude in Chrome extension
#    → See docs/SETUP.md for step-by-step instructions

# 5. Create the 5 shortcuts in the extension
#    → See docs/SHORTCUTS.md

# 6. Open a job board and run /search-jobs
```

---

## How It Works

### The config layer

`config/profile.yaml` is the single source of truth. It stores your target roles, skills, location preference, salary range, communication tone, and exclusion filters. Every shortcut tells Claude to reference it — you fill it in once and it drives everything else.

`config/resume.md` is your master resume in markdown. Shortcuts read it when comparing your background to a listing.

### The shortcuts layer

Each file in `shortcuts/` contains a prompt you save in the Claude in Chrome extension. When you type the slash command (e.g., `/tailor-resume`), the prompt loads automatically. You paste in your profile context once per session and the shortcuts take over.

### The logging layer

`logs/applications.csv` is your tracker. Every time you apply, you log it with `./scripts/new-application.sh`. Over time, you can see what's working, follow up on what's stale, and spot patterns in what gets responses.

---

## Shortcuts Reference

| Shortcut | Slash Command | What It Does |
|---|---|---|
| Search Jobs | `/search-jobs` | Scans the current job board and surfaces top matches |
| Apply to Job | `/apply-to-job` | Fills out the application form and stops for your review |
| Tailor Resume | `/tailor-resume` | Gap analysis + prioritized suggestions per listing |
| Draft Cover Letter | `/draft-cover-letter` | Tailored letter under 300 words, reviewed before use |
| Follow Up | `/follow-up` | Drafts a follow-up email calibrated to time elapsed |

See [docs/SHORTCUTS.md](docs/SHORTCUTS.md) for full details on each shortcut.

---

## Contributing

Found a shortcut that works really well for your field? Have an improvement to the workflow? Pull requests are welcome.

Good contributions:
- New shortcut prompts (e.g., `/prep-interview`, `/research-company`, `/negotiate-offer`)
- Profile template variations for different fields (design, marketing, product, etc.)
- Workflow improvements based on what's working for you

Please keep prompts role-agnostic and safe (no auto-submit, no fabrication).

---

## Disclaimer

This is a personal automation tool built for individual use. Claude AI is used to assist — not replace — your judgment.

- **Always review before submitting.** The shortcuts have hard stops for exactly this reason. Never skip them.
- **Accuracy is your responsibility.** Claude drafts based on the context you provide. Double-check every application for accuracy before it goes out.
- **This tool is not affiliated with Anthropic.** It uses Claude in Chrome and Claude Code as tools, but is an independent project.
- **Job board terms of service vary.** Use common sense. Automation that mimics human browsing to read listings is generally fine; bulk-submitting applications without review is not the intent of this tool.
