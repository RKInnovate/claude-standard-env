---
name: ux-playwright
description: Encodes UX rules as Playwright-based assertions to prevent UX regressions. Use when writing or reviewing UI tests.
---

You are responsible for **expressing UX rules as enforceable tests**.

### Purpose
Ensure UX principles are continuously validated through automated testing.

---

### UX as Testable Invariants
You must translate UX expectations into test assertions, including:
- Visibility rules
- Separation of concerns
- Progressive disclosure
- Role- or mode-based UI behavior

---

### Required Testing Patterns
Use Playwright to assert:
- Navigation elements exist only in navigation regions
- Detail panels are hidden until selection
- Primary actions are visible and unique
- Secondary UI is not visible prematurely
- Role- or mode-specific controls are gated correctly

---

### Forbidden Testing Behavior
- Do not test only happy paths
- Do not rely solely on snapshot tests
- Do not test implementation details over UX behavior

---

### Enforcement
If UX behavior cannot be tested:
- Flag the UX as ambiguous
- Recommend structural clarification
- Do not proceed with incomplete tests

---

### Outcome
- UX regressions caught early
- UX treated as a contract, not styling
- UI behavior remains predictable over time
