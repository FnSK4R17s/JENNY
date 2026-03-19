---
name: x-articles
description: Analyze a whitepaper and suggest a breakdown into X.com articles (threads, standalone posts, series).
license: MIT
compatibility: Requires file read capabilities. No internet access needed.
metadata:
  author: sk4r
  version: "1.0"
---

# X Articles Skill

This skill takes a completed whitepaper and produces an article plan — a set of suggested X.com posts and threads that distill the whitepaper's key ideas for a technical audience on social media.

# Prerequisites

You need:
- A whitepaper markdown file
- Its accompanying references file (if available)

# Execution Steps

## 1. Read the Whitepaper

Read the whitepaper and its references. As you read, identify:

- **Core claims** — the 3-5 most important findings or arguments
- **Surprising or counterintuitive points** — these perform best on X
- **Concrete data points** — numbers, benchmarks, comparisons that stand on their own
- **Debates or tensions** — opposing viewpoints within the research
- **Practical takeaways** — things the reader can do or apply immediately

## 2. Classify Article Types

For each idea worth posting, classify it into one of these formats:

| Format | When to use | Structure |
|--------|-------------|-----------|
| **Standalone post** | A single insight that is self-contained and punchy. Works when the point needs no buildup. | 1 post, under 280 chars. Lead with the insight, not the context. |
| **Thread** | An idea that needs a narrative arc — setup, evidence, conclusion. Most whitepaper sections map to this. | 1/ hook + 3-8 posts + final takeaway. Each post must stand alone if someone reads only that one. |
| **Series** | A multi-day campaign across related but independent threads. Use for whitepapers with distinct subtopics. | 2-5 threads posted over consecutive days, with a recurring label (e.g., "AI Chip Wars 1/4"). |

## 3. Generate the Article Plan

Write the plan into the output file using the `.agents/skills/jenny/templates/x-articles-plan.md` template. For each suggested article:

1. **Title** — a working title for internal reference (not posted)
2. **Format** — standalone / thread / series entry
3. **Source section** — which whitepaper section(s) it draws from
4. **Hook** — the opening line. This is the most important part. It must:
   - Lead with a claim, number, or question — never "In this thread I will..."
   - Create curiosity or mild disagreement
   - Be under 280 characters
   - For threads, prefix the hook with 🧵 to signal it's a thread
5. **Outline** — for threads, a 1-line summary of each post in the thread. For standalone posts, the full draft text.
6. **Key references** — which citations from the whitepaper to link or credit
7. **Visual opportunity** — flag if this article would benefit from a diagram, chart, terminal screenshot, or code snippet (for future use)

## 4. Suggest a Posting Order

After listing all articles, suggest a posting order that:
- Leads with the most attention-grabbing piece (highest curiosity or controversy)
- Builds context progressively — don't assume readers saw earlier posts
- Spaces related threads across days to avoid fatigue
- Ends with the most actionable or forward-looking piece

## 5. Review

Review the plan for:
- **Redundancy** — two articles covering the same ground should be merged or one should be cut
- **Dependency** — no article should require reading another to make sense
- **Hook quality** — every hook must pass the "would I stop scrolling?" test
- **Accuracy** — claims in hooks and outlines must be traceable to the whitepaper content

# Writing Guidelines

- Write for technical practitioners, not academics. Drop jargon unless the term is the point.
- Threads should tell a story, not summarize a document. "Here are 7 things I learned" is lazy. "Everyone says X but the data shows Y" is a thread.
- Each post in a thread should end with tension or a transition — give people a reason to keep reading.
- Prefer concrete over abstract. "Latency dropped 40%" beats "significant performance improvements."
- Attribute claims. If a finding comes from a specific source, name it. Credibility matters on X.
- Flag where a terminal screenshot, code snippet, or diagram would elevate the post - tag these as `[VISUAL: description]` in the outline.
- Never use em dashes (—). Use regular hyphens (-) or rewrite the sentence. Output must be directly copy-pasteable.
