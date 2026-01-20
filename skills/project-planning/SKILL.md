---
name: project-planning
description: Enforces creation and maintenance of PLAN.md and TODO.md files for structured project implementation tracking. Use at project start and when planning major features.
---

You are responsible for **project planning and implementation tracking**.

## Purpose

Ensure every project has structured planning documents (PLAN.md and TODO.md) that provide:
- Clear implementation roadmap
- Granular task tracking
- Progress visibility
- Dependency management
- Quality gate enforcement

---

## Mandatory Project Files

### PLAN.md - Implementation Roadmap

**Required at**: Project initialization or when starting major features

**Structure**:

```markdown
# [Project Name] - Implementation Plan

## Overview

Brief description of what will be built, implementation strategy, and key constraints.

**Strategy**: [Describe approach - incremental branches, phases, etc.]
**Package Manager**: [pnpm for Node.js, uv for Python - enforced]

---

## Implementation Plan

### Phase/Branch 1: [Name]
**Purpose**: [What this phase accomplishes]

**Tasks**:
- [Specific task with commands if applicable]
- [Specific task with commands if applicable]
- [Installation commands]
- [Configuration steps]
- [Implementation steps]

**Key Files**:
- `/path/to/file.ext` - Description
- `/path/to/file.ext` - Description

**Testing**:
- [How to verify this phase works]
- [Commands to run]
- [Expected outcomes]

**Dependencies**: [None, or list prerequisite phases]

---

### Phase/Branch 2: [Name]
[Repeat structure]

---

[Continue for all phases/branches]
```

**Mandatory Elements**:
- Overview with strategy and constraints
- Package manager enforcement (pnpm/uv)
- Each phase/branch clearly defined
- Specific, actionable tasks (not vague)
- Key files with descriptions
- Testing verification steps
- Explicit dependency chain

---

### TODO.md - Task Tracker

**Required at**: Project initialization, updated continuously

**Structure**:

```markdown
# [Project Name] Implementation Tracker

**Project**: [Full project name]
**Strategy**: [Brief strategy description]
**Package Manager**: [pnpm/uv - strictly enforced]
**Start Date**: YYYY-MM-DD
**Current Phase**: [Phase name]

---

## Progress Overview

- [ ] Phase/Branch 1: [Name] (X/Y tasks)
- [ ] Phase/Branch 2: [Name] (X/Y tasks)
- [ ] Phase/Branch 3: [Name] (X/Y tasks)

**Total Progress**: X/Y tasks completed

---

## Phase/Branch 1: `[branch-name]`
**Status**: [Not Started | In Progress | Completed | Blocked]
**Dependencies**: [None or list prerequisites]
**Branch Command**: `git checkout -b [branch-name]`

### Tasks

#### 1.1 [Task Group Name]
- [ ] Specific actionable task
- [ ] Specific actionable task with command: `command here`
- [ ] Verification step

#### 1.2 [Task Group Name]
- [ ] Task
- [ ] Task
- [ ] Task

#### 1.X Documentation
- [ ] Add file-level DocStrings to all created files
- [ ] Add function-level DocStrings where applicable
- [ ] Add inline comments for complex logic

#### 1.X Commit & PR
- [ ] Commit with message: `type: description`
- [ ] Create PR to [target branch]
- [ ] Merge after review

---

## Phase/Branch 2: `[branch-name]`
[Repeat structure]

---

[Continue for all phases/branches]
```

**Mandatory Elements**:
- Project metadata (name, strategy, package manager, dates)
- Progress overview with task counts
- Status tracking per phase
- Checkbox-based task lists
- Specific, verifiable tasks
- Git branch commands
- Documentation tasks for every phase
- Commit and PR tasks for every phase

---

## Enforcement Rules

### Project Initialization

When starting a new project or major feature:

1. **Stop immediately** if PLAN.md and TODO.md do not exist
2. Do not proceed with implementation
3. Explain to user that planning files are required
4. Offer to create both files based on project requirements

### During Implementation

Before implementing any phase/feature:

1. Verify the phase exists in PLAN.md
2. Verify corresponding TODO.md section exists
3. Check that dependencies are completed
4. Do not skip phases or implement out of order

### Task Completion

After completing each task:

1. Mark the checkbox in TODO.md as completed: `- [x]`
2. Update progress counts
3. Update phase status if all tasks complete
4. Commit TODO.md updates with code changes

### Quality Gates

Every phase must include:

- [ ] Testing verification
- [ ] Documentation (DocStrings, comments)
- [ ] Linting passes
- [ ] Commit with conventional message
- [ ] PR creation

Do not mark a phase complete unless all quality gates pass.

---

## Task Granularity

### Good Tasks (Specific, Actionable)
- ✅ Install dependencies: `pnpm add react-router-dom`
- ✅ Create `src/types/user.types.ts` with User, UserRole types
- ✅ Implement login API adapter with mock data
- ✅ Add unit tests for UserContext hook
- ✅ Run linting: `pnpm lint` - verify passes

### Bad Tasks (Vague, Unmeasurable)
- ❌ Set up the project
- ❌ Create types
- ❌ Add tests
- ❌ Make it work
- ❌ Fix bugs

---

## Sync Requirements

PLAN.md and TODO.md must stay synchronized:

- Every phase in PLAN.md has a corresponding section in TODO.md
- Task descriptions match between files
- Dependencies are consistent
- Phase names and numbers align

If a mismatch is detected, stop and reconcile before continuing.

---

## File Location

Both files must be at project root:
- `/PLAN.md`
- `/TODO.md`

Never create in subdirectories or with different names.

---

## Progress Tracking

### Status Values (TODO.md)
- **Not Started**: No tasks begun
- **In Progress**: Some tasks complete, some pending
- **Completed**: All tasks complete and merged
- **Blocked**: Cannot proceed due to external dependency

### Progress Calculation

Update counts automatically:
```
- [x] Phase 1: Project Foundation (10/10) ✓
- [ ] Phase 2: Type Definitions (3/9)
- [ ] Phase 3: Components (0/12)

**Total Progress**: 13/31 tasks completed
```

---

## Violation Conditions

You must stop and flag if:

- PLAN.md or TODO.md is missing at project start
- Implementation begins without planning files
- Tasks are vague or unmeasurable
- Dependencies are violated (later phase before earlier)
- Quality gates are skipped
- Documentation tasks are omitted
- Files are out of sync

When violation detected:
- Do not proceed with implementation
- Explain the planning violation clearly
- Offer to create or fix planning files
- Wait for user confirmation before continuing

---

## Creation Workflow

When user starts a new project:

1. **Gather Requirements**:
   - Project name and description
   - Technology stack
   - Implementation approach (phases/branches)
   - Key features and constraints

2. **Create PLAN.md**:
   - Write overview with strategy
   - Break down into logical phases (8-15 phases typical)
   - Define tasks, key files, testing per phase
   - Establish dependency chain

3. **Create TODO.md**:
   - Add project metadata
   - Mirror PLAN.md phases as task sections
   - Convert tasks to checkboxes
   - Add documentation and commit tasks
   - Initialize all as unchecked

4. **Present to User**:
   - Show both files for review
   - Explain implementation approach
   - Get approval before starting Phase 1

5. **Track Progress**:
   - Update TODO.md as tasks complete
   - Keep PLAN.md as reference (rarely changes)
   - Commit TODO.md updates with implementation

---

## Integration with Other Skills

This skill works with:
- **architecture**: Phases must respect architectural layers
- **coding-guidelines**: Quality gates enforce code standards
- **ux**: UI phases must respect UX principles
- **backend**: API phases must follow backend patterns

Planning files are not optional styling - they are **project management contracts**.

---

## Outcomes

- **Clear roadmap**: Everyone knows what to build and when
- **Incremental progress**: Small, mergeable phases reduce risk
- **Quality enforcement**: No phase complete without tests/docs
- **Dependency tracking**: Phases build on each other correctly
- **Progress visibility**: Always know what's done and what's next
- **Reduced rework**: Planning prevents architectural mistakes

---

## When to Use This Skill

Use `project-planning` skill when:
- Starting a new project from scratch
- Beginning a major feature or refactor
- User requests planning or roadmap
- Implementation feels chaotic or unstructured
- Need to track multi-phase work
- Working on complex projects requiring coordination

Do not use for:
- Trivial bug fixes
- Single-file changes
- Exploratory coding or prototypes
- Documentation-only changes

---

**Before generating any implementation code for a new project, always verify PLAN.md and TODO.md exist and are current.**

Planning violations are considered **project management failures**, not optional documentation.
