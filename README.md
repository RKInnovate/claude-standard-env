# Claude Standard Environment

The **single source of truth** for [Claude Code](https://claude.ai/code) development environment configuration. A comprehensive collection of domain-specific skills, workflow configurations, and quality standards that enforce production-grade coding practices, architectural patterns, and development best practices.

## Overview

This repository contains four specialized skills that guide Claude's behavior when writing code:

- **architecture**: System architecture, cloud infrastructure (GCP), separation of concerns
- **backend**: REST APIs, authentication, data modeling, security patterns
- **frontend**: Cupertino (Apple HIG) design system, three-panel layouts
- **coding-guidelines**: Code quality, error handling, typing, state management

## Quick Install

Install the complete Claude Standard Environment to your local Claude Code setup:

```bash
curl -fsSL https://raw.githubusercontent.com/RKInnovate/claude-standard-env/main/setup.sh | bash
```

Or clone and run locally:

```bash
git clone https://github.com/RKInnovate/claude-standard-env.git
cd claude-standard-env
./setup.sh
```

**During installation**, you'll be prompted to enter your Anthropic API key. You can:
- Enter your API key for immediate setup
- Press Enter to skip and configure later

Get your API key from: https://console.anthropic.com/settings/keys

## What Gets Installed

- **Skills**: Installed to `~/.claude/skills/`
  - `architecture/` - System architecture and cloud infrastructure patterns
  - `backend/` - Backend services, APIs, and data modeling
  - `frontend/` - UI/UX design system and responsive layouts
  - `coding-guidelines/` - Code quality and best practices

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
│   └── coding-guidelines/    # Code quality standards
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
