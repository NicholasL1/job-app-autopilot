# Setup Guide

Everything you need to get Job App Autopilot running from scratch.

---

## Prerequisites

Before you start, make sure you have:

- **A Claude subscription** (Pro or higher recommended — you'll be using it heavily)
- **Google Chrome** (the Claude Chrome extension only runs in Chromium-based browsers)
- **Git** (to clone the repo)
- **Bash** (macOS/Linux built-in; on Windows, use Git Bash or WSL)

Optional but useful:
- **Claude Code** (`npm install -g @anthropic-ai/claude-code`) — for terminal-based automation and running the helper scripts

---

## Step 1: Install the Claude in Chrome Extension

1. Open Chrome and go to the [Chrome Web Store](https://chromewebstore.google.com)
2. Search for **"Claude"** — look for the official Anthropic extension
3. Click **"Add to Chrome"** → **"Add Extension"**
4. Pin the extension to your toolbar (click the puzzle icon → pin Claude)
5. Click the Claude icon and sign in with your Anthropic account

The extension lets Claude read and interact with the page you're on. This is what makes the shortcuts work.

---

## Step 2: Clone the Repo

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
cd YOUR_REPO_NAME
```

Replace `YOUR_USERNAME` and `YOUR_REPO_NAME` with your actual GitHub username and repo name.

---

## Step 3: Run the Setup Script

```bash
./scripts/setup.sh
```

This script:
- Verifies you're inside a git repo
- Checks whether your config files still have placeholder values
- Creates `logs/applications.csv` with the correct headers (if it doesn't exist)
- Makes all scripts executable
- Prints your next-step checklist

It's idempotent — safe to run multiple times.

---

## Step 4: Fill In Your Config Files

This is the most important step. The shortcuts only work as well as the context you give them.

### `config/profile.yaml`

Open the file and replace every placeholder:

```bash
# On macOS
open config/profile.yaml

# In VS Code
code config/profile.yaml

# Or any text editor
nano config/profile.yaml
```

Fill in:
- Your personal info (name, email, phone, LinkedIn, etc.)
- Target job titles and level
- Location preference and salary range
- Primary and secondary skills
- Job boards you use
- Anything you want excluded from searches
- Your communication tone and highlight bullets

**Tip:** Be specific in `highlights`. Instead of "strong communicator", write "led 3 cross-functional meetings per sprint and documented all decisions in Confluence." Claude uses these when drafting cover letters.

### `config/resume.md`

Replace all `[bracketed placeholders]` with your actual info:
- Contact info (should match profile.yaml)
- Summary (2–3 sentences, specific to your background)
- Skills (should match profile.yaml)
- Work experience (use real dates, titles, companies, and bullet points)
- Education
- Projects (1–3 that show skills your work history doesn't cover)

**Tip:** Quantify everything. "Reduced load time by 35%" beats "improved performance."

### `config/cover-letter-base.md`

This one's optional to edit. The default template works. But if you have a preferred structure or voice, adjust the paragraph guidance comments to match how you write. The `{{placeholders}}` will be filled in by Claude.

---

## Step 5: Create Your Shortcuts

See **[docs/SHORTCUTS.md](SHORTCUTS.md)** for the full shortcuts reference, including the exact slash commands and when to use each one.

**General steps to install a shortcut:**

1. Click the Claude icon in Chrome
2. Open **Settings** (gear icon or menu)
3. Find **Shortcuts** or **Saved Prompts**
4. Click **New Shortcut**
5. Set the slash command (e.g., `/search-jobs`)
6. Open the corresponding file in `shortcuts/` (e.g., `shortcuts/search-jobs.md`)
7. Copy the text under `## Prompt` and paste it into the shortcut body
8. Save

Repeat for all 5 shortcuts:
- `/search-jobs`
- `/apply-to-job`
- `/tailor-resume`
- `/draft-cover-letter`
- `/follow-up`

---

## Step 6: Test Your Setup

1. Open [LinkedIn Jobs](https://www.linkedin.com/jobs/) in Chrome
2. Click the Claude extension icon to open a Claude sidebar
3. Type `/search-jobs` — the shortcut should auto-complete
4. Before running it, paste in your profile.yaml contents as context (one time per session is enough)
5. Hit enter and watch Claude scan the listings

If the shortcut doesn't appear, make sure you saved it correctly in the extension settings.

---

## Optional: Connect Claude Code

Claude Code lets you run automation from your terminal. Once installed:

```bash
npm install -g @anthropic-ai/claude-code
claude login
```

Then from your repo root, you can run sessions like:

```bash
claude "Review my resume.md and suggest improvements based on these 3 job listings: [URLs]"
```

Or use it to run the helper scripts and explore your application logs.

---

## Troubleshooting

**Shortcuts don't appear when I type `/`**
- Make sure the shortcut was saved in the extension, not just typed in chat
- Try clicking the extension icon again to refresh the session

**Claude says it can't read the page**
- Some pages block extension access (PDFs, internal tools). Use copy-paste in those cases.
- Make sure the extension has permission for the site: click the puzzle icon → Claude → "Allow on this site"

**The form-fill shortcut isn't reading all fields**
- Some ATS systems render form fields in iframes that extensions can't access. In those cases, use the shortcut to draft what to type, then fill manually.
- Multi-page forms: run the shortcut on each page, or tell Claude "continue to the next section"

**I can't run the scripts on macOS**
- Run `chmod +x scripts/*.sh` to make them executable
- If you get "permission denied", you may need to allow scripts in System Preferences → Security

**Git isn't recognizing my changes**
- Make sure you're in the repo root
- Run `git status` to confirm what's tracked
