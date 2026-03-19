---
description: Analyze a whitepaper and suggest X.com articles, threads, and series
---

# Whitepaper to X.com Articles Workflow

This workflow takes a completed whitepaper and produces an article plan for X.com.

## Prerequisites

A completed whitepaper. No research or internet access needed.

## Skills Referenced

| Skill | Path | Purpose |
|-------|------|---------|
| X Articles | `.agents/skills/jenny/skills/x-articles/SKILL.md` | Article breakdown and planning |

---

## Workflow Steps

### 1. Discover Available Whitepapers

Find whitepapers using the discovery rules in `.agents/skills/jenny/SKILL.md`:
1. If the user provided a path, use it directly.
2. If `.agents/skills/beary/USER.md` exists, read the `OUTPUT_PATH` value.
3. Fall back to `whitepaper-output/`.

Scan the resolved path for topic directories. Each directory should contain `whitepaper/{TOPIC}-whitepaper.md`. List the available whitepapers with their topics and dates.

Present the list to the user:
*"I found the following whitepapers. Which one would you like to break down into X.com articles?"*

| # | Topic | Date | Path |
|---|-------|------|------|
| 1 | {{topic}} | {{date}} | {{path}} |

If only one whitepaper exists, confirm:
*"I found one whitepaper: {TOPIC}. Shall I use this one?"*

If no whitepapers are found, notify the user and stop:
*"No whitepapers found. You can point me to one directly, or run BEARY first to generate one."*

### 2. Execute X Articles Skill

Follow `.agents/skills/jenny/skills/x-articles/SKILL.md` with the selected whitepaper.

Output is written to `{WHITEPAPER_DIR}/../x-articles/{TOPIC}-x-articles-plan.md`, placing it alongside the whitepaper's topic folder.

// turbo
Create the `x-articles/` directory if it doesn't exist.

### 3. Present the Plan

Present a summary to the user:
- Number of articles suggested (by format: standalone / thread / series)
- The suggested posting order with hooks
- Any articles flagged with visual opportunities

Ask:
*"Would you like to adjust any articles, change the posting order, or draft any of these now?"*

### 4. Draft Articles (Optional)

If the user selects articles to draft:
- Write full post text for standalone posts
- Write full thread text (numbered posts) for threads
- Save drafts to `{TOPIC}/x-articles/drafts/`
- Each draft file: `{ORDER}-{slug}.md`

---

## Context Management Tips

This workflow is lightweight — it reads existing content and produces a plan. Context pressure should be minimal unless the whitepaper is very long.
