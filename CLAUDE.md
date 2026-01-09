# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is the **Claude Standard Environment** - the single source of truth for Claude Code development environment configuration. It contains domain-specific skill definitions, workflow configurations, and quality standards that guide Claude's behavior when writing code. Each component enforces specific architectural patterns, design principles, and development best practices.

### Skills Structure

The repository contains skills organized in the `skills/` directory with four domain-focused skills:

- **`skills/architecture/`**: System architecture, cloud infrastructure (GCP), separation of concerns, end-to-end testing
- **`skills/backend/`**: REST APIs, authentication, data modeling, security patterns, testing responsibilities
- **`skills/frontend/`**: Cupertino (Apple HIG) design system, three-panel layouts, UI/UX patterns
- **`skills/coding-guidelines/`**: Code quality, error handling, typing, state management, commit/PR readiness

Each skill directory contains a `SKILL.md` file with YAML frontmatter defining:
- The skill's name and description
- Domain-specific rules and constraints
- When the skill should be invoked

### Installation

To install the complete Claude Standard Environment to your local Claude Code setup, run:

```bash
curl -fsSL https://raw.githubusercontent.com/RKInnovate/claude-standard-env/main/setup.sh | bash
```

Or clone the repository and run the setup script locally:

```bash
git clone https://github.com/RKInnovate/claude-standard-env.git
cd claude-standard-env
./setup.sh
```

The setup script will:
- Install skills to `~/.claude/skills/`
- Replace existing skills if already present
- Preserve other skills not in this repository
- Install `settings.json` to `~/.claude/settings.json` (with backup of existing file)
- Install global `CLAUDE.md` to `~/.claude/CLAUDE.md` (with backup of existing file)
- Configure API key helper at `~/.claude/anthropic_key.sh`

## Working with This Repository

### Testing Setup Script Changes

When modifying `setup.sh`, test installation to a temporary directory:

```bash
# Test installation without affecting your actual ~/.claude directory
CLAUDE_DIR="/tmp/claude-test" ./setup.sh

# Verify skills were installed correctly
ls -la /tmp/claude-test/skills/

# Verify settings were installed
cat /tmp/claude-test/settings.json

# Clean up test installation
rm -rf /tmp/claude-test
```

### Validating Skill Definitions

All `SKILL.md` files must include YAML frontmatter with:
- `name`: Skill identifier (lowercase, matches directory name)
- `description`: Brief description of when to use this skill

Validate frontmatter is parseable:

```bash
# Check YAML frontmatter in all skills
for skill in skills/*/SKILL.md; do
  echo "Checking $skill..."
  head -5 "$skill" | grep -E "^(name|description):" || echo "  ⚠️  Missing or invalid frontmatter"
done
```

### Testing Commit Hook Locally

Before committing, test that your commit message passes validation:

```bash
# Test a commit message format (from repo root)
echo "feat: add new skill for testing" | .git/hooks/commit-msg /dev/stdin

# Test with an invalid message (should fail)
echo "invalid commit message" | .git/hooks/commit-msg /dev/stdin
```

### Testing GitHub Workflows Locally

You cannot fully test GitHub Actions locally, but you can validate workflow syntax:

```bash
# Install act (GitHub Actions local runner) - optional
# brew install act  # macOS
# Then run workflows locally:
# act pull_request

# Or validate YAML syntax
yamllint .github/workflows/*.yml
```

## Commit Message Requirements

All commit messages **must** pass the git commit-msg hook validation enforcing Conventional Commits specification.

### Format

```
<type>(<scope>)?: <subject>
```

### Rules

- **Type** (required): `feat`, `fix`, `docs`, `chore`, `refactor`, `perf`, `test`, `ci`, `style`, `deploy`, `debug`
- **Scope** (optional): lowercase alphanumeric with `._-` allowed, wrapped in parentheses
- **Subject** (required):
  - Must start with lowercase letter (imperative mood)
  - Minimum 10 characters
  - Maximum 72 characters
  - No trailing period
  - Colon and space (`: `) after type/scope

### Examples

```
feat: add user authentication module
fix(api): resolve null pointer error
docs: update installation guide
refactor(backend): split monolithic service
```

### Breaking Changes

Use `BREAKING CHANGE: <description>` in the commit body with proper colon and description when introducing breaking changes.

## Branch Naming Requirements

All branches (except `main`, `master`, `develop`, and bot branches) must follow the conventional commit prefix format:

### Valid Prefixes

`feat/`, `fix/`, `docs/`, `chore/`, `style/`, `refactor/`, `perf/`, `test/`, `build/`, `ci/`, `revert/`

### Examples

```
feat/add-login
fix/auth-bug
docs/update-readme
chore/update-deps
```

The `.github/workflows/branch-name-validation.yml` workflow enforces this on all pushes and pull requests.

## Pull Request Requirements

Pull requests are validated by `.github/workflows/pr_checks.yml` and must include:

### PR Title

- Must follow conventional commit format (same as commit messages)
- Maximum 100 characters recommended
- Will be used as the final commit message if using "Squash and merge"

### PR Body Sections (Required)

1. **Description**: Detailed explanation of changes and motivation (minimum 10 characters)
2. **How to test / QA**: Step-by-step testing instructions
3. **Checklist**: Required items to verify before merge

### Optional but Recommended

- Issue references using `Closes #123` or `Fixes #456`
- Type of change selection
- Security considerations (if applicable)
- Performance considerations (if applicable)
- Database migrations (if applicable)
- Screenshots/recordings (for UI changes)

The PR validation workflow posts automated comments on PRs showing validation status in a table format with errors, warnings, and passed checks.

## Commit Message Validation in PRs

The `.github/workflows/commit-msg-validation.yml` workflow validates all commits in a PR:

- Checks each commit follows conventional commit format
- Warns about commits longer than 100 characters
- Posts automated table showing commit validation status
- This is a **warning only** - if using "Squash and merge", the PR title will be used for the final commit

## Architecture Principles

This repository enforces specific architectural patterns across all skills:

### Separation of Concerns

- **Presentation Layer**: UI components only
- **Application Layer**: Orchestration and workflow
- **Domain Layer**: Business logic (no infrastructure)
- **Infrastructure Layer**: External services, APIs, storage

**Never** allow:
- Business logic in UI components
- Infrastructure details in domain logic
- UI concerns leaking into backend code

### Repository & Workflow Constraints

- Treat commit hooks and CI workflows as architectural constraints
- Do not propose architectural changes that violate commit-msg hooks or CI validation pipelines
- Architectural decisions must be compatible with existing tooling and workflows

### Cloud Infrastructure (GCP Focus)

All architecture assumes **Google Cloud Platform**:
- **Compute**: Cloud Run, App Engine (stateless services preferred)
- **Data**: Cloud SQL (PostgreSQL), Firestore
- **Storage**: Google Cloud Storage for media/assets
- **Auth**: Firebase Auth or custom JWT

### Data Security

- **Multi-tenant safety**: Owner-based access control on all data
- **Row-level security**: Enforced at application or database level
- **Encryption at rest**: Required for sensitive fields
- **No IDOR**: Prevent insecure direct object references

## Design System (Frontend)

### Cupertino Design (Apple HIG)

- **Only** Cupertino design patterns allowed
- Reject Material Design, Bootstrap, or other design systems
- Use system fonts (SF Pro / San Francisco equivalents)
- Use system colors, hairline separators, native spacing
- Full system-compliant dark mode support

### Three-Panel Layout Pattern

All UI follows this responsive layout optimized for list → detail → inspector workflows:

```
┌────────────────┬──────────────────────┬─────────────────┐
│  Left Panel    │   Center Panel       │  Right Panel    │
│  Navigation    │   List View          │  Detail         │
│  Filters       │   Search             │  Inspector      │
│                │   Batch Actions      │  CRUD           │
└────────────────┴──────────────────────┴─────────────────┘
```

- **Left**: Navigation, filters (fixed width)
- **Center**: List view, search, sorting, batch actions (flexible)
- **Right**: Detail inspector, context-aware CRUD operations

**Responsive behavior**: Panels collapse right-to-left on smaller screens. On mobile, detail panel becomes full-screen pushed view.

### Tooling

- **Web**: React or Next.js with strict TypeScript
- **Mobile**: Flutter with Dart
- **Icons**:
  - Web: SF-symbol-style icons (e.g., Lucide)
  - Flutter: CupertinoIcons

## Backend Principles

### API Design

- Use RESTful APIs exclusively with predictable CRUD semantics
- Implement typed request and response contracts
- Explicit error handling on every endpoint

### Authentication & Authorization

- Use Firebase Auth or custom JWT authentication
- Validate authentication context on every request
- Enforce owner-based access to all data
- Prevent IDOR and privilege escalation

### Data Modeling

- Design hierarchical entities (parent → child → meta)
- Maintain referential integrity
- Optimize schemas for list → detail → inspector workflows
- Avoid circular dependencies

### Storage & Media

- Structured data: Cloud SQL or Firestore
- Media assets: Google Cloud Storage
- Strict separation of metadata and binary data
- Secure upload and download flows

### Advanced Capabilities

- Support batch operations
- Generate reports (PDF / CSV)
- Enable real-time updates (WebSockets or streams)
- Support offline synchronization when required

## Code Quality Standards

### Error Handling

- Wrap all async operations in try/catch
- Never fail silently
- Backend errors must be typed and meaningful
- Surface user-facing errors via Cupertino-style toast notifications
- Always provide actionable feedback

### Type Safety

- Enforce strict TypeScript or Dart typing
- No implicit `any` allowed
- Share types between frontend/backend when feasible
- Validate all external inputs

### State Management

- **Global state** only for: authentication, user preferences, app-wide settings
- **Local state** for: forms, transient UI interactions
- Enforce unidirectional data flow
- Keep business logic out of UI components and state management

### Documentation Requirements

- **File-level documentation** (DocStrings or header comments) for every file explaining:
  - Purpose of the file
  - Problem it solves
  - Role in overall architecture
  - How and when it should be used
  - Important design decisions or assumptions

- **Function/method documentation** (DocStrings) for every function explaining:
  - What the function does and why it exists
  - Parameters (name, type, purpose)
  - Return value
  - Example usage (where meaningful)
  - Edge cases or constraints

- **Inline comments** explaining non-obvious logic, complex conditions, and important side effects (focus on "why", not just "what")

### Code Style

- Production-ready by default
- Prefer clarity over cleverness
- No magic strings; centralize constants or enums
- Modular, readable, and testable
- Consistent naming and structure

## Package Manager Enforcement

**Critical**: This repository enforces specific package managers in the global CLAUDE.md:

| Language | Required Tool |
|----------|--------------|
| Python   | `uv`         |
| Node.js  | `pnpm`       |

**Never** use `pip`, `poetry`, `pipenv`, `npm`, `yarn`, `bun`, or other alternatives. If an invalid package manager is requested or detected:
- Explicitly warn that this is not allowed
- Do not generate commands or configuration for it
- Redirect to the approved tool

## Testing Requirements

### Backend Testing

Backend logic must be accompanied by appropriate tests validating:
- Request validation
- Authorization logic
- Error paths

Do not introduce or modify endpoints without testing.

### End-to-End Testing

End-to-end tests are considered part of system architecture and must validate:
- Complete user workflows
- List → detail → inspector patterns
- Multi-panel UI interactions

### Quality Gates

Before any commit:
1. Run all linters (no warnings or errors)
2. Run all test suites (all passing)
3. Ensure no security vulnerabilities introduced
4. Validate commit message format
5. Verify code is production-ready

## Development Workflow

### Before Creating Commits

1. Review and comply with this CLAUDE.md file
2. Review and comply with relevant SKILL.md files
3. Validate commit message format locally
4. Run linters and tests
5. Ensure code follows architectural patterns
6. Add appropriate documentation

### Before Creating PRs

1. Ensure branch name follows `<type>/<description>` format
2. Write PR title in conventional commit format
3. Include all required PR body sections:
   - Description (detailed)
   - How to test / QA
   - Checklist
4. Reference related issues
5. Add security/performance considerations if applicable
6. Include screenshots for UI changes

### Commit Quality

- Commits must be small, focused, and logically grouped
- Never commit code that introduces:
  - Breaking changes to tests
  - Lint violations
  - Security vulnerabilities
  - Unrelated changes

## Skills Invocation

When working in this repository, invoke the appropriate skill based on the task:

- **architecture** - System design, layering, infrastructure decisions, e2e testing strategy
- **backend** - API endpoints, data models, authentication logic, backend testing
- **frontend** - UI components, layouts, user interactions, design system compliance
- **coding-guidelines** - Code reviews, refactoring, quality enforcement, error handling

Each skill's guidance is authoritative for its domain. If conflicts exist between this CLAUDE.md and a SKILL.md, this CLAUDE.md takes precedence.

## CI/CD Workflows

The repository uses GitHub Actions workflows that automatically:

1. **Branch name validation** - Validates branch names on push/PR
2. **Commit message validation** - Validates all commits in PRs (warning only)
3. **PR checks** - Validates PR title and body structure (required for merge)
4. **Issue validation** - Validates issue format and required fields

All workflows post automated comments on PRs with detailed tables showing validation status, errors, warnings, and passed checks.
