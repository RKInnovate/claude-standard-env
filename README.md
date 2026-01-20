# Claude Standard Environment

The **single source of truth** for [Claude Code](https://claude.ai/code) development environment configuration. A comprehensive collection of domain-specific skills, workflow configurations, and quality standards that enforce production-grade coding practices, architectural patterns, and development best practices.

## Overview

This repository contains specialized skills that guide Claude's behavior when writing code:

- **architecture**: System architecture, cloud infrastructure (GCP), separation of concerns
- **backend**: REST APIs, authentication, data modeling, security patterns
- **frontend**: Cupertino (Apple HIG) design system, three-panel layouts
- **coding-guidelines**: Code quality, error handling, typing, state management
- **mantine-ui**: Mantine UI component library reference with 120+ React components and hooks
- **project-planning**: Enforces PLAN.md and TODO.md for structured implementation tracking
- **ux**: Core UX principles and responsibility-driven interface design
- **ux-review**: Pre-output UX validation and self-review enforcement
- **ux-diff**: UX intent vs implementation comparison and alignment
- **ux-playwright**: UX rules encoded as Playwright test assertions

## Quick Install

Install the complete Claude Standard Environment with **interactive setup**:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/RKInnovate/claude-standard-env/main/setup.sh)"
```

Or clone and run locally:

```bash
git clone https://github.com/RKInnovate/claude-standard-env.git
cd claude-standard-env
./setup.sh
```

### Interactive Installation Features

The setup script provides an interactive experience:
- **Claude CLI Check**: Automatically detects if Claude Code CLI is installed and offers to install it
- **API Key Configuration**: Prompts for your Anthropic API key during setup (can skip and configure later)
- **All Skills Installed**: Installs all available skills automatically

Get your API key from: https://console.anthropic.com/settings/keys

## What Gets Installed

- **Skills**: Installed to `~/.claude/skills/`
  - `architecture/` - System architecture and cloud infrastructure patterns
  - `backend/` - Backend services, APIs, and data modeling
  - `frontend/` - UI/UX design system and responsive layouts
  - `coding-guidelines/` - Code quality and best practices
  - `mantine-ui/` - Mantine UI component library reference (120+ components)
  - `project-planning/` - PLAN.md and TODO.md project management
  - `ux/` - Core UX principles and responsibility-driven design
  - `ux-review/` - Pre-output UX validation enforcement
  - `ux-diff/` - UX intent vs implementation comparison
  - `ux-playwright/` - UX testing with Playwright assertions

- **Settings**: Installed to `~/.claude/settings.json`
  - API key helper configuration
  - Enabled plugins (frontend-design, playwright)
  - Thinking mode settings

- **Global CLAUDE.md**: Installed to `~/.claude/CLAUDE.md`
  - Repository-agnostic guidance for Claude Code
  - Package manager enforcement (uv for Python, pnpm for Node.js)
  - Code documentation and quality standards

- **API Key Helper**: Installed to `~/.claude/anthropic_key.sh` (only if not present)
  - **Interactive setup**: Script prompts for your API key during installation
  - Can skip and configure later by editing the file
  - Preserves existing configuration if already set up
  - Get your API key from: https://console.anthropic.com/settings/keys

The installer will:
- Check if Claude Code CLI is installed (offer to install if missing)
- Create necessary directories if they don't exist
- Replace existing skills if already present
- Preserve other skills not in this repository
- Backup existing settings.json and CLAUDE.md before replacing
- Skip API key helper installation if already configured

## Skills Details

### Architecture

Enforces clean, scalable, cloud-native system architecture on Google Cloud Platform. Maintains strict separation between presentation, application, domain, and infrastructure layers.

**Key patterns:**
- Clean Architecture with layer separation
- GCP-focused infrastructure (Cloud Run, Cloud SQL, GCS)
- Multi-tenant data safety with owner-based access control
- Horizontal scalability and environment parity

### Backend

Implements secure, typed, scalable backend services and REST APIs. Ensures proper authentication, authorization, and data modeling.

**Key patterns:**
- RESTful APIs with typed contracts
- Firebase Auth or JWT authentication
- Hierarchical entity design (parent → child → meta)
- Batch operations and real-time updates

### Frontend

Builds Apple-native-feeling user interfaces using Cupertino design and a responsive three-panel layout optimized for list → detail → inspector workflows.

**Key patterns:**
- Cupertino (Apple HIG) design system exclusively
- Three-panel responsive layout (nav/list/detail)
- System fonts, colors, and native spacing
- React/Next.js (web) or Flutter (mobile)

### Coding Guidelines

Enforces production-grade coding practices, error handling, typing discipline, and state management rules across all code.

**Key patterns:**
- Strict typing (no implicit any)
- Comprehensive error handling
- Unidirectional data flow
- Production-ready code by default

### Mantine UI

Comprehensive reference guide for the Mantine UI component library with 120+ React components and 50+ hooks.

**Key features:**
- Complete component catalog organized by category
- Import examples for all components
- Detailed use cases for complex components (AppShell, Authentication, Forms, etc.)
- Common UI patterns and responsive design guidelines
- Official documentation references and package installation guide
- Support for forms, dates, notifications, charts, and more extensions

### Project Planning

Enforces structured project management through mandatory PLAN.md and TODO.md files for implementation tracking.

**Key features:**
- **PLAN.md**: Implementation roadmap with phases, tasks, testing, and dependencies
- **TODO.md**: Granular task tracker with checkboxes and progress counts
- Enforces incremental development with quality gates
- Prevents implementation without planning
- Tracks dependencies between phases
- Ensures documentation and testing for every phase
- Synchronization between planning files required

**Structure enforced:**
- Overview with implementation strategy and constraints
- Phase-by-phase breakdown with specific tasks
- Key files listing per phase
- Testing verification steps
- Progress tracking with task counts
- Status monitoring (Not Started, In Progress, Completed, Blocked)
- Documentation and commit tasks for every phase

**Quality gates:**
- Testing must pass before phase completion
- Documentation required (DocStrings, comments)
- Linting must pass
- Conventional commits enforced
- PR creation required

### UX Skills

A collection of four complementary skills that enforce UX best practices throughout the development lifecycle:

#### UX (Core Principles)
Establishes responsibility-driven interface design with strict separation of concerns.

**Key principles:**
- Every UI region has exactly one primary responsibility
- Strict separation between navigation, primary work, and contextual details
- Progressive disclosure (show only what's needed at current step)
- Information density control with single focal points
- Consistent mental models and interaction patterns
- Mode and role awareness for UI behavior changes

#### UX Review
Forces mandatory self-review before generating any UI output to prevent regressions.

**Key enforcement:**
- Pre-output validation checklist (every region describable in one sentence)
- Single primary workflow verification per screen
- Blocks output if UX violations detected
- No deferral of UX issues to "later refinement"

#### UX Diff
Compares intended UX with actual implementation to prevent silent UX drift.

**Key validation:**
- Verifies UI regions match intended responsibilities
- Detects unauthorized feature relocations
- Prevents implicit UX behavior changes
- Ensures alignment between specs and implementation

#### UX Playwright
Encodes UX rules as automated Playwright test assertions.

**Key testing:**
- Visibility rules enforcement
- Separation of concerns validation
- Progressive disclosure verification
- Role and mode-based UI behavior testing
- Treats UX as a contract, not just styling

## Repository Standards

The Claude Standard Environment enforces strict quality standards across all development work:

### Commit Messages

All commits must follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>)?: <subject>

Types: feat, fix, docs, chore, refactor, perf, test, ci, style, deploy, debug
```

Enforced by git commit-msg hook and CI workflows.

### Branch Naming

All branches must use conventional commit prefixes:

```
feat/add-new-skill
fix/update-documentation
docs/improve-readme
```

### Pull Requests

PRs must include:
- Title following conventional commit format
- Description section with motivation
- "How to test / QA" section
- Checklist section

Automated validation via GitHub Actions provides detailed feedback.

## Package Managers

The Claude Standard Environment enforces specific package managers:

- **Python**: `uv` only
- **Node.js**: `pnpm` only

Never use pip, poetry, npm, yarn, or alternatives.

## Documentation

- **CLAUDE.md** (project-level): Comprehensive guide for Claude Code when working in this repository
- **GLOBAL_CLAUDE.md**: Universal rules applied to all projects via `~/.claude/CLAUDE.md`
- **SKILL.md files**: Individual skill definitions with domain-specific rules
- **Workflow files**: GitHub Actions for validation and quality checks
- **settings.json**: Claude Code configuration and plugin settings

## Contributing

When adding or modifying skills:

1. Ensure skill follows the SKILL.md format with YAML frontmatter
2. Update CLAUDE.md if architectural patterns change
3. Test the setup script works with your changes
4. Follow commit message and PR requirements
5. Run linters and tests before committing

## Repository Structure

```
claude-standard-env/
├── skills/                    # Domain-specific skill definitions
│   ├── architecture/          # System architecture patterns
│   ├── backend/              # Backend services and APIs
│   ├── frontend/             # UI/UX design system
│   ├── coding-guidelines/    # Code quality standards
│   ├── mantine-ui/           # Mantine UI component library reference
│   ├── project-planning/     # PLAN.md and TODO.md enforcement
│   ├── ux/                   # Core UX principles
│   ├── ux-review/            # UX validation enforcement
│   ├── ux-diff/              # UX intent comparison
│   └── ux-playwright/        # UX testing with Playwright
├── .github/
│   └── workflows/            # CI/CD validation workflows
├── CLAUDE.md                 # Project-level Claude Code guidance
├── GLOBAL_CLAUDE.md          # Universal rules for ~/.claude/CLAUDE.md
├── settings.json             # Claude Code settings
├── anthropic_key.sh          # API key helper template
└── setup.sh                  # Installation script
```

## License

This repository is provided as-is for personal use with Claude Code.

## Links

- [Claude Code CLI](https://claude.ai/code)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Apple Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)
