# Job App Autopilot — Claude Code Context

This is Nicholas Lachhman's personal job application automation project. When running in this directory, you have full access to all config files, logs, and saved artifacts.

## Project Structure

```
config/
  profile.yaml          ← Job search preferences, skills, personal info
  resume.tex            ← Master resume (source of truth) — single unified LaTeX file
  cover-letter-base.md  ← Cover letter template and structure guide

logs/
  applications.csv      ← All job applications tracked here
  resumes/              ← Tailored .tex resume versions per application
  cover-letters/        ← Tailored cover letters per application (.md)

shortcuts/              ← Shortcut prompt source files (for reference)
scripts/                ← Shell utility scripts
```

## How to Start a Session

```bash
claude --chrome
```

Starts Claude Code with Chrome extension access — browser automation + local file read/write in one session.

## Workflow Overview

1. **Find & prep** — search job boards, collect listings, tailor resumes for each
2. **Track** — log every application to `applications.csv`

Claude never submits applications. After the session you have tailored resumes ready to go, and you apply yourself.

**Typical session:**
1. Open LinkedIn Jobs (or Indeed, Wellfound, Glassdoor)
2. Run `/autopilot` → Claude searches, filters, and tailors resumes for 5–10 jobs
3. Review saved resumes in `logs/resumes/`
4. Apply manually to the ones you want
5. Update `status` in `logs/applications.csv` from "Ready to Apply" → "Applied"

> **Job board note:** Claude reads job descriptions inline from the board — it never navigates to company career sites.

## Resume Workflow (LaTeX)

The master resume is `config/resume.tex` — a single self-contained LaTeX file (Awesome-CV template).

To compile it, you need `awesome-cv.cls` and `fonts/` in the same directory as the `.tex` file (from the original Awesome-CV download).

When tailoring for a specific application:
- Claude copies and modifies `config/resume.tex` → `logs/resumes/[Company]-[Job]-[Date].tex`
- Changes are kept to bullet reordering, summary rewording, and skill emphasis — no fabrication
- The file must stay one page and preserve the existing styling

## File Naming Convention

- Tailored resumes: `logs/resumes/[Company]-[Job]-[Date].tex`
- Cover letters: `logs/cover-letters/[Company]-[Job]-[Date].md`
- Format: TitleCase company name, TitleCase job title (hyphens for spaces), YYYY-MM-DD date (e.g., `Stripe-SoftwareEngineerII-2026-03-15.tex`)

## applications.csv Columns

```
date,company,role,url,status,match_score,resume_file,cover_letter_file,notes,follow_up_date
```

- `status`: Applied | Interviewing | Offer | Rejected | Withdrawn | No Response | Ready to Apply
- `match_score`: Strong / Good / Stretch
- `resume_file`: e.g., `logs/resumes/Stripe-SoftwareEngineerII-2026-03-15.tex`
- `follow_up_date`: YYYY-MM-DD, typically 7 days after applying

## Shortcut Commands

| Command | What it does |
|---|---|
| `/autopilot` | Full pipeline: search job board → evaluate matches → tailor resumes → log to CSV |
| `/search-jobs` | Phase 1 only: scan job board, apply filters, return top matches |
| `/tailor-resume` | Tailor resume for a single listing visible in the current tab |
| `/draft-cover-letter` | Draft a tailored cover letter for the listing in the current tab |
| `/follow-up` | Draft a follow-up email for a past application from logs/applications.csv |
