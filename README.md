# Claude Code Skills

A curated collection of domain-specific skills for [Claude Code](https://claude.ai/code) that enforce production-grade coding practices, architectural patterns, and quality standards.

## Overview

This repository contains four specialized skills that guide Claude's behavior when writing code:

- **architecture**: System architecture, cloud infrastructure (GCP), separation of concerns
- **backend**: REST APIs, authentication, data modeling, security patterns
- **frontend**: Cupertino (Apple HIG) design system, three-panel layouts
- **coding-guidelines**: Code quality, error handling, typing, state management

## Quick Install

Install all skills and settings to your local Claude Code environment:

```bash
curl -fsSL https://raw.githubusercontent.com/RKInnovate/claude-skills/main/setup.sh | bash
```

Or clone and run locally:

```bash
git clone https://github.com/RKInnovate/claude-skills.git
cd claude-skills
./setup.sh
```

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

The installer will:
- Create necessary directories if they don't exist
- Replace existing skills if already present
- Preserve other skills not in this repository
- Backup existing settings.json before replacing

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

This repository follows strict quality standards:

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

This repository enforces specific package managers:

- **Python**: `uv` only
- **Node.js**: `pnpm` only

Never use pip, poetry, npm, yarn, or alternatives.

## Documentation

- **CLAUDE.md**: Comprehensive guide for Claude Code when working in this repository
- **SKILL.md files**: Individual skill definitions with domain-specific rules
- **Workflow files**: GitHub Actions for validation and quality checks

## Contributing

When adding or modifying skills:

1. Ensure skill follows the SKILL.md format with YAML frontmatter
2. Update CLAUDE.md if architectural patterns change
3. Test the setup script works with your changes
4. Follow commit message and PR requirements
5. Run linters and tests before committing

## License

This repository is provided as-is for personal use with Claude Code.

## Links

- [Claude Code CLI](https://claude.ai/code)
- [Conventional Commits](https://www.conventionalcommits.org/)
- [Apple Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/)
