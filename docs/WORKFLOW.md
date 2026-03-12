# Day-to-Day Workflow

A practical guide for using Job App Autopilot in your actual job search — not a once-and-done setup, but a repeatable system you run daily.

---

## The Core Loop

```
Search → Evaluate → Tailor → Apply → Log → Follow Up → Repeat
```

Every part of this loop has a shortcut. The system works best when you're consistent — even 30–45 minutes a day compounds quickly.

---

## Morning Routine (~15 minutes)

**Goal:** Find the best new listings before they get crowded.

1. **Open your job boards** — LinkedIn Jobs, Indeed, Wellfound, or whichever you use
2. **Set your filters** — recency (last 24–48 hours), location, job type
3. **Run `/search-jobs`** on each board
   - Paste your profile.yaml context into the conversation once per session
   - Let Claude scan and summarize
4. **Review the output** — check Claude's top recommendations
5. **Save anything promising** — bookmark it, or open it in a new tab to apply to later that day
6. **Note patterns** — if the same skill keeps appearing in strong matches, that's a signal

> Don't apply in the morning if you're rushed. Find the listings now, apply when you have focused time.

---

## Application Session (~30–60 minutes per application)

Run these steps for each role you've decided to pursue.

### Step 1: Tailor your resume

Open the job listing tab. Run `/tailor-resume`.

- Review the gap analysis
- Make the High-priority changes to `config/resume.md`
- You don't need to apply every suggestion — focus on what's honest and impactful

### Step 2: Draft the cover letter (if required)

Still on the listing tab. Run `/draft-cover-letter`.

- Read the draft out loud — edit any line that sounds robotic
- Save the final version: `logs/[company]-[role]-cover-letter.txt`
- If the application has a "why us" free-text field, use the body paragraph from the cover letter

### Step 3: Apply

Run `/apply-to-job`.

- Confirm you want to proceed after Claude's match assessment
- Review everything Claude fills in before it reaches the submit step
- Type `YES` only after you've read every field

### Step 4: Log it

Immediately after applying:

```bash
./scripts/new-application.sh "Company" "Role Title" "https://url" "Applied"
```

Or open `logs/applications.csv` and add a row manually.

---

## After Applying

- **Email confirmation:** If you receive one, note the confirmation number in your CSV
- **Check for an ATS confirmation page:** Some forms show a case number — log it in notes
- **Set a calendar reminder:** Add a reminder for 7 days out to consider following up

---

## Follow-Up Cadence

| Time Since Applying | Action |
|---|---|
| Day 0 | Applied → logged |
| Day 5–7 | Run `/follow-up` if no response |
| Day 14 | One more follow-up if still nothing |
| Day 21+ | Move on — update status to "Ghosted" in CSV |

One follow-up is respectful. Two is the maximum. More than that is counterproductive.

---

## Weekly Review (~20 minutes, end of week)

### 1. Review your application log

Open `logs/applications.csv` in a spreadsheet app or terminal:

```bash
cat logs/applications.csv
```

Ask yourself:
- How many did I apply to this week?
- What's the status distribution? (Applied / Interviewing / Rejected / Ghosted)
- Are certain companies or role types getting more traction?

### 2. Update statuses

Go through anything still marked "Applied" and update:
- Did you hear back? → `Interviewing`
- Did they reject? → `Rejected`
- No response after 2+ follow-ups? → `Ghosted`

### 3. Analyze rejection patterns (monthly)

If you're getting lots of rejections or no responses:
- Is your resume match score (from `/tailor-resume`) consistently below 6/10?
- Are you applying to the right level (junior vs. mid vs. senior)?
- Are cover letters too generic? Try a different tone in `profile.yaml`

### 4. Update your config if needed

If you've been refining your pitch, update `config/profile.yaml`:
- Add new skills you've gained
- Update your highlights if you have better examples
- Adjust your salary range based on what you're seeing in listings

Log what you changed in `logs/changelog.md`:

```markdown
### 2024-03-15 — Updated highlights and salary range
**Why:** Not seeing responses on mid-range listings; decided to widen range and sharpen highlights
**Result:** Checking in 2 weeks
```

---

## Cheat Sheet

| Situation | Shortcut | Notes |
|---|---|---|
| New day, checking boards | `/search-jobs` | Paste profile context once |
| Found a good listing | `/tailor-resume` | First, before applying |
| Need a cover letter | `/draft-cover-letter` | After tailoring resume |
| Ready to apply | `/apply-to-job` | Never skip the review step |
| 7 days, no response | `/follow-up` | One is enough |
| Logging an application | `./scripts/new-application.sh` | Do it immediately after applying |
| Seeing patterns, want to update | Edit `config/profile.yaml` | Log the change in changelog.md |

---

## Energy Management

Job searching is exhausting. A few things that help:

- **Set a daily application limit.** 2–3 quality applications beats 10 rushed ones.
- **Take days off.** You don't need to apply 7 days a week. Rest prevents desperation from showing.
- **Track momentum, not just outcomes.** Applications sent is something you control. Responses aren't.
- **Let Claude do the tedious parts.** That's the whole point. You should be spending your energy on the parts that require your judgment.
