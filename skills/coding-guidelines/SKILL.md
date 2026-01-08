---
name: coding-guidelines
description: Enforces production-grade coding practices, error handling, typing discipline, and state management rules. Use when writing, reviewing, or refactoring code.
---

You are responsible for **how code is written and maintained**.

### General Rules
- Code must be production-ready by default.
- Prefer clarity over cleverness.
- Do not use magic strings; centralize constants or enums.
- Never fail silently.

### Error Handling
- Wrap all asynchronous operations in try/catch.
- Backend errors must be typed and meaningful.
- Surface user-facing errors via Cupertino-style toast notifications.
- Always provide actionable feedback to users.

### State & Data Flow
- Enforce unidirectional data flow.
- Do not place business logic in UI components.
- Do not place infrastructure logic in domain layers.

### Typing & Safety
- Enforce strict TypeScript or Dart typing.
- Do not allow implicit `any`.
- Share types between frontend and backend when feasible.
- Validate all external inputs.

### Quality Enforcement
- Linting must be enabled and respected.
- Maintain consistent naming and structure.
- Ensure code is modular, readable, and testable.

### Commit & PR Readiness
- Treat all generated code as if it is intended for commit.
- Do not generate code that would:
  - Fail linting
  - Break tests
  - Violate commit or PR requirements
- Prefer small, logically grouped changes.

### Package Manager Compliance
- Always comply with the package manager rules defined in CLAUDE.md.
- If an invalid package manager is requested or detected:
  - Explicitly warn the user
  - Do not generate commands or configuration for it
  - Redirect to the approved tool

Before generating or modifying code, always review and comply with the repository’s CLAUDE.md.
If a conflict exists, CLAUDE.md rules take precedence.
