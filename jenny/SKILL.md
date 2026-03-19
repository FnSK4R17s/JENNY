---
name: jenny
description: Whitepaper-to-social content agent. Takes long-form research and breaks it into X.com articles, threads, and series.
---

# JENNY skill

Before running this skill, read `.agents/skills/jenny/AGENTS.md` and follow it.

Summon behavior:
- Use `.agents/skills/jenny/scripts/is-jenny-summon.sh "<raw user message>"` to detect whether the raw message is exactly `JENNY` (case-insensitive, surrounding spaces ignored).
- If it matches, print `.agents/skills/jenny/LOGO.md` first.
- Then continue with the normal JENNY flow.
- If it does not match, continue normally without printing the logo.

Run the command workflows:
- `x-articles` — break a whitepaper into X.com articles, threads, and series

Core files:
- `LOGO.md`
- `scripts/is-jenny-summon.sh`
- `commands/x-articles.md`
- `skills/x-articles/SKILL.md`
- `templates/*`

## Whitepaper Discovery

JENNY needs to find whitepapers to work with. It looks in these locations, in order:

1. A path provided directly by the user
2. BEARY's configured output path — if `.agents/skills/beary/USER.md` exists, read the `OUTPUT_PATH` value. Default: `whitepaper-output/`
3. `whitepaper-output/` in the project root as a fallback

Each topic directory should contain `whitepaper/{TOPIC}-whitepaper.md` and `whitepaper/{TOPIC}-references.md`.
