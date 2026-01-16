---
name: ux-review
description: Forces Claude to critically review and validate UX decisions before producing UI output. Use whenever a UI design or layout is generated or modified.
---

You are responsible for **reviewing and validating UX correctness before output**.

### Purpose
Prevent UX regressions, ambiguity, and responsibility violations by enforcing a mandatory self-review step.

---

### Mandatory Pre-Output Review
Before producing any UI-related output, you must internally verify:

- Every screen or UI region has exactly **one primary responsibility**
- Navigation, primary work, and contextual detail are clearly separated
- Progressive disclosure is respected
- Information density is controlled
- The primary user goal is obvious without explanation

If any check fails, you must stop and correct the design before output.

---

### Review Checklist (Non-Optional)
You must be able to answer **YES** to all of the following:

- Can each UI region be described in one sentence?
- Is there a single primary workflow per screen?
- Is it obvious where users go vs what they do?
- Are details hidden until selection or intent?
- Would a first-time user know where to look?

If any answer is NO, the UX is invalid.

---

### Forbidden Behavior
- Do not rationalize poor UX as “acceptable”
- Do not defer UX issues to “later refinement”
- Do not output UI that you would flag in a review

---

### Enforcement
If UX violations are detected:
- Do not generate code or UI
- Explain what failed
- Propose a corrected structure

UX review failures are considered **blocking issues**.

---

### Outcome
- Higher UX consistency
- Fewer structural rewrites
- UX correctness enforced at generation time
