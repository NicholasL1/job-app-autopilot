# Job App Autopilot

Nicholas Lachhman's personal job search automation toolkit — powered by Claude Code with Chrome browser access.

---

## What This Does

Turns Claude into a job search assistant that knows my background. Instead of re-explaining context in every conversation, my resume, skills, target roles, and preferences live in config files. The shortcuts reference them automatically.

- **Claude in Chrome** handles the browser side: scanning job boards, reading listings, reading job descriptions
- **Claude Code** handles the local side: tailoring resumes, drafting cover letters, logging applications

I stay in control. Every shortcut has review steps and stops before anything is submitted.

---

## Folder Structure

```
./
├── config/
│   ├── resume.tex             # Master resume — single unified LaTeX file (Awesome-CV)
│   ├── profile.yaml           # Target roles, skills, salary range, preferences
│   └── cover-letter-base.md   # Cover letter template
├── shortcuts/
│   ├── autopilot.md           # Full pipeline (search → tailor → log)
│   ├── search-jobs.md         # Scan job boards and surface top matches
│   ├── tailor-resume.md       # Tailor resume.tex to a specific listing
│   ├── draft-cover-letter.md  # Write a per-job cover letter
│   └── follow-up.md           # Draft follow-up emails
├── logs/
│   ├── applications.csv       # Application tracker
│   ├── resumes/               # Tailored .tex resume per application
│   └── cover-letters/         # Tailored cover letter per application
├── scripts/
│   ├── setup.sh
│   └── new-application.sh
└── docs/
    ├── SETUP.md
    ├── SHORTCUTS.md
    └── WORKFLOW.md
```

---

## Quick Start

```bash
# From this directory
claude --chrome
```

Then run `/autopilot` with a job board open in Chrome.

---

## Resume Workflow

The master resume is `config/resume.tex` — a single self-contained file using the Awesome-CV LaTeX template. No `\input{}` dependencies.

To compile: place `awesome-cv.cls` and `fonts/` in the same directory as the `.tex` file.

For each application, Claude creates a tailored copy at:
```
logs/resumes/YYYY-MM-DD-[company]-[role-slug].tex
```

Changes per tailored copy are limited to bullet reordering, summary adjustments, and skill emphasis — always one page, always the same styling.

---

## Shortcuts

| Command | What it does |
|---|---|
| `/autopilot` | Full pipeline: search → filter → tailor resumes → log to CSV |
| `/search-jobs` | Scan job board, return top matches |
| `/tailor-resume` | Tailor resume for the listing in the current tab |
| `/draft-cover-letter` | Write a cover letter for the listing in the current tab |
| `/follow-up` | Draft a follow-up email from applications.csv |
