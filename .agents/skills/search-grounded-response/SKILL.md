---
name: search-grounded-response
description: "Must load before answering any factual, technical, or time-sensitive query. Do not produce factual responses without this skill."
user-invocable: false
---

# Search-Grounded Response

Before answering any factual, technical, current, or evolving question:

1. Read the current date from context and use it to time-bound searches and assess staleness.
2. Enumerate every factual claim the response would make.
3. For each claim, search live sources with a temporal anchor; treat internal knowledge, however confident, only as a prior to invalidate.
4. Retrieve results before synthesis. Build the response exclusively from them; when sources conflict, expose the discrepancy rather than silently choosing.
5. Cite every fact, statistic, and technical specification inline as `[n]`, then append `[n] <Title> — <URL>` sources.

Never fill a missing result from memory or blend retrieved evidence with assumptions without labeling the assumptions. If no usable source URL supports a claim, omit the claim and state the gap.
