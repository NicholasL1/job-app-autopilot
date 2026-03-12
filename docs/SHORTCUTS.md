# Shortcuts Reference

All 5 shortcuts for Job App Autopilot, with slash commands, use cases, and customization tips.

---

## Overview Table

| Shortcut | Slash Command | When to Use |
|---|---|---|
| Search Jobs | `/search-jobs` | Start of a session — find new listings |
| Apply to Job | `/apply-to-job` | When you've found a listing you want to apply to |
| Tailor Resume | `/tailor-resume` | Before applying — adjust for the specific role |
| Draft Cover Letter | `/draft-cover-letter` | When a cover letter is required or recommended |
| Follow Up | `/follow-up` | 5–14 days after applying with no response |

---

## `/search-jobs`

**File:** `shortcuts/search-jobs.md`

**What it does:** Reads the current job board tab, applies your search criteria from profile.yaml, scrolls through listings, and surfaces the top 5–10 matches in a table with company, title, requirements, salary, and URL.

**When to use it:**
- Every morning to check for new listings
- When exploring a new job board for the first time
- After updating your titles or skills in profile.yaml

**Works on:** LinkedIn Jobs, Indeed, Wellfound, Glassdoor, and most standard job boards

**Output format:**
- Ranked table of top matches
- Match score (Strong / Good / Stretch) with reasoning
- Summary of patterns and trends
- Recommended top 2–3 to prioritize

---

## `/apply-to-job`

**File:** `shortcuts/apply-to-job.md`

**What it does:** Reads the listing in the current tab, compares it to your resume, fills out the application form step by step, and stops for your explicit approval before any submission.

**When to use it:**
- When you're ready to apply to a specific role
- Works on any web-based application form (ATS, company career pages, LinkedIn Easy Apply)

**Hard stops built in:**
1. After reading the listing — Claude gives a match assessment and asks you to confirm before proceeding
2. Before any submission — Claude shows everything it filled in and waits for your "YES"

**Note:** Claude cannot upload file attachments. It will fill all form fields and notify you when to upload a resume PDF manually.

---

## `/tailor-resume`

**File:** `shortcuts/tailor-resume.md`

**What it does:** Reads the job listing, runs a gap analysis against your resume, and provides a prioritized list of specific changes to make — with suggested rewrites using your actual experience.

**When to use it:**
- Before applying to any role you care about
- After `/search-jobs` identifies a strong match
- To understand how your resume reads for a specific type of role

**Output format:**
- Extracted requirements (must-have vs. nice-to-have)
- Gap analysis
- Numbered list of changes ranked High / Medium / Low priority
- Each change includes: what to change, why, and a suggested rewrite
- Overall match score (1–10) after applying changes

**Important:** This shortcut is advisory only. It does not modify your resume.md. You apply the changes yourself.

---

## `/draft-cover-letter`

**File:** `shortcuts/draft-cover-letter.md`

**What it does:** Reads the listing, does brief company research from the page, and drafts a tailored cover letter under 300 words using your base template and tone preferences.

**When to use it:**
- When a cover letter is explicitly required
- When applying to a role you really want (a strong letter can tip the scales)
- Before using `/apply-to-job` on roles with open-text "why us" fields

**Output format:**
- Full draft cover letter (ready to copy-paste or edit)
- Post-draft checklist: word count, tone assessment, strongest line, suggested subject line

**Note:** Always read the draft out loud before using it. Edit any line that sounds templated.

---

## `/follow-up`

**File:** `shortcuts/follow-up.md`

**What it does:** Asks you a few quick questions about the application, then drafts a short follow-up email calibrated to how long it's been since you applied.

**When to use it:**
- 5–7 days after applying: short check-in
- 2 weeks after applying: slightly more direct
- 3+ weeks: one final note or skip it

**Output format:**
- Drafted follow-up email (under 150 words)
- Suggested subject line
- Sending time recommendation
- Honest advice on whether following up is worth it at this stage

---

## Customization

### Changing tone or style
Edit `config/profile.yaml` → `communication.tone`. Options like "formal", "professional but warm", or "conversational" change how Claude writes cover letters and follow-ups.

### Adapting shortcuts for different fields
The prompts in `shortcuts/` are role-agnostic by design. If you're in a non-technical field:
- Update `config/profile.yaml` with your actual titles and skills
- The shortcut prompts automatically use whatever's in your profile

### Adding new shortcuts
Clone any `.md` file in `shortcuts/`, update the slash command name, and rewrite the `## Prompt` section for your use case (e.g., `/prep-interview`, `/research-company`, `/negotiate-offer`). Submit it as a PR to share with others.

### Using a different base resume per role type
If you have multiple resume versions (e.g., `resume-eng.md`, `resume-design.md`), note which to use in your profile.yaml under a `resume_variant` field. Then adjust the shortcut prompts to reference that field.
