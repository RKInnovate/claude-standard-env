#!/usr/bin/env bash

#
# Claude Standard Environment Installation Script
#
# This script installs the complete Claude Code development environment configuration
# from the claude-standard-env repository. It can be run locally or remotely via curl:
#
#   curl -fsSL https://raw.githubusercontent.com/RKInnovate/claude-standard-env/main/setup.sh | bash
#
# Features:
# - Installs skills to ~/.claude/skills/
# - Replaces existing skills if already present
# - Preserves other skills not in this repository
# - Installs settings.json to ~/.claude/settings.json
# - Creates necessary directories if they don't exist
#

set -e  # Exit on error

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Repository information
REPO_URL="https://github.com/RKInnovate/claude-standard-env.git"
REPO_RAW_URL="https://raw.githubusercontent.com/RKInnovate/claude-standard-env/main"
BRANCH="main"

# Target directories
CLAUDE_DIR="$HOME/.claude"
SKILLS_DIR="$CLAUDE_DIR/skills"

# Temporary directory for cloning
TEMP_DIR=""

# Function to print colored messages
print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✖${NC} $1"
}

print_header() {
    echo -e "\n${BLUE}========================================${NC}"
    echo -e "${BLUE}  Claude Standard Environment Setup${NC}"
    echo -e "${BLUE}========================================${NC}\n"
}

# Cleanup function
cleanup() {
    if [ -n "$TEMP_DIR" ] && [ -d "$TEMP_DIR" ]; then
        print_info "Cleaning up temporary files..."
        rm -rf "$TEMP_DIR"
    fi
}

# Set trap to cleanup on exit
trap cleanup EXIT

# Check if git is installed
check_git() {
    if ! command -v git &> /dev/null; then
        print_error "git is not installed. Please install git and try again."
        exit 1
    fi
}

# Create necessary directories
create_directories() {
    print_info "Creating directories..."

    if [ ! -d "$CLAUDE_DIR" ]; then
        mkdir -p "$CLAUDE_DIR"
        print_success "Created $CLAUDE_DIR"
    else
        print_info "Directory $CLAUDE_DIR already exists"
    fi

    if [ ! -d "$SKILLS_DIR" ]; then
        mkdir -p "$SKILLS_DIR"
        print_success "Created $SKILLS_DIR"
    else
        print_info "Directory $SKILLS_DIR already exists"
    fi
}

# Clone repository to temporary directory
clone_repository() {
    print_info "Cloning repository..."

    TEMP_DIR=$(mktemp -d)

    if git clone --depth 1 --branch "$BRANCH" "$REPO_URL" "$TEMP_DIR" &> /dev/null; then
        print_success "Repository cloned successfully"
    else
        print_error "Failed to clone repository"
        exit 1
    fi
}

# Install skills
install_skills() {
    print_info "Installing skills..."

    local skills_source="$TEMP_DIR/skills"

    if [ ! -d "$skills_source" ]; then
        print_error "Skills directory not found in repository"
        exit 1
    fi

    # List of skills in this repository
    local skills=("architecture" "backend" "coding-guidelines" "frontend")
    local installed_count=0
    local updated_count=0

    for skill in "${skills[@]}"; do
        local source_skill="$skills_source/$skill"
        local target_skill="$SKILLS_DIR/$skill"

        if [ ! -d "$source_skill" ]; then
            print_warning "Skill '$skill' not found in repository, skipping"
            continue
        fi

        if [ -d "$target_skill" ]; then
            # Skill exists, remove and replace
            rm -rf "$target_skill"
            cp -r "$source_skill" "$target_skill"
            print_success "Updated skill: $skill"
            ((updated_count++))
        else
            # New skill installation
            cp -r "$source_skill" "$target_skill"
            print_success "Installed skill: $skill"
            ((installed_count++))
        fi
    done

    echo ""
    if [ $installed_count -gt 0 ]; then
        print_success "Installed $installed_count new skill(s)"
    fi
    if [ $updated_count -gt 0 ]; then
        print_success "Updated $updated_count existing skill(s)"
    fi
}

# Install settings.json
install_settings() {
    print_info "Installing settings.json..."

    local settings_source="$TEMP_DIR/settings.json"
    local settings_target="$CLAUDE_DIR/settings.json"

    if [ ! -f "$settings_source" ]; then
        print_warning "settings.json not found in repository, skipping"
        return
    fi

    if [ -f "$settings_target" ]; then
        # Remove old backup files
        if ls "$settings_target.backup."* 1> /dev/null 2>&1; then
            rm -f "$settings_target.backup."*
            print_info "Removed old backup files"
        fi

        # Backup existing settings
        local backup_file="$settings_target.backup.$(date +%Y%m%d_%H%M%S)"
        cp "$settings_target" "$backup_file"
        print_info "Backed up existing settings to: $backup_file"
    fi

    cp "$settings_source" "$settings_target"
    print_success "Installed settings.json"
}

# Install anthropic_key.sh
install_api_key_helper() {
    print_info "Setting up API key helper..."

    local api_key_source="$TEMP_DIR/anthropic_key.sh"
    local api_key_target="$CLAUDE_DIR/anthropic_key.sh"

    if [ ! -f "$api_key_source" ]; then
        print_warning "anthropic_key.sh template not found in repository, skipping"
        return
    fi

    if [ -f "$api_key_target" ]; then
        print_info "API key helper already exists, skipping (preserving existing configuration)"
        return
    fi

    # Prompt for API key
    echo ""
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${BLUE}  Anthropic API Key Setup${NC}"
    echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
    echo "Enter your Anthropic API key to complete the setup."
    echo "Get your API key from: https://console.anthropic.com/settings/keys"
    echo ""
    echo -e "${YELLOW}Note: Press Enter to skip and configure later${NC}"
    echo ""

    # Read API key with prompt
    read -r -p "Anthropic API Key: " user_api_key
    echo ""

    if [ -n "$user_api_key" ]; then
        # User provided an API key
        # Create the file with the user's API key
        cat > "$api_key_target" << 'EOF'
#!/usr/bin/env bash

#
# Anthropic API Key Helper Script
#
# This script is called by Claude Code to retrieve your Anthropic API key.
# Claude Code expects this script to output the API key to stdout.
#

EOF
        echo "# API key configured during setup on $(date)" >> "$api_key_target"
        echo "API_KEY=\"$user_api_key\"" >> "$api_key_target"
        echo "" >> "$api_key_target"
        echo "# Output the API key" >> "$api_key_target"
        echo 'echo "$API_KEY"' >> "$api_key_target"

        chmod +x "$api_key_target"
        print_success "API key configured successfully!"
    else
        # User skipped, install template
        cp "$api_key_source" "$api_key_target"
        chmod +x "$api_key_target"
        print_warning "Skipped API key setup. Edit ~/.claude/anthropic_key.sh to add your key later."
        echo -e "${YELLOW}    Run: nano ~/.claude/anthropic_key.sh${NC}"
    fi
}

# Install CLAUDE.md to ~/.claude/
install_claude_md() {
    print_info "Installing global CLAUDE.md..."

    local claude_md_source="$TEMP_DIR/GLOBAL_CLAUDE.md"
    local claude_md_target="$CLAUDE_DIR/CLAUDE.md"

    if [ ! -f "$claude_md_source" ]; then
        print_warning "GLOBAL_CLAUDE.md not found in repository, skipping"
        return
    fi

    if [ -f "$claude_md_target" ]; then
        # Backup existing CLAUDE.md
        if ls "$claude_md_target.backup."* 1> /dev/null 2>&1; then
            rm -f "$claude_md_target.backup."*
            print_info "Removed old CLAUDE.md backup files"
        fi

        local backup_file="$claude_md_target.backup.$(date +%Y%m%d_%H%M%S)"
        cp "$claude_md_target" "$backup_file"
        print_info "Backed up existing CLAUDE.md to: $backup_file"
    fi

    cp "$claude_md_source" "$claude_md_target"
    print_success "Installed CLAUDE.md"
}

# List installed skills
list_installed_skills() {
    echo ""
    print_info "Installed skills in $SKILLS_DIR:"

    if [ -d "$SKILLS_DIR" ]; then
        local skills_found=0
        for skill in "$SKILLS_DIR"/*; do
            if [ -d "$skill" ]; then
                local skill_name=$(basename "$skill")
                echo "  • $skill_name"
                ((skills_found++))
            fi
        done

        if [ $skills_found -eq 0 ]; then
            print_warning "No skills found"
        fi
    else
        print_warning "Skills directory does not exist"
    fi
}

# Main installation function
main() {
    print_header

    # Check prerequisites
    check_git

    # Create directories
    create_directories

    # Clone repository
    clone_repository

    # Install skills
    install_skills

    # Install settings
    install_settings

    # Install API key helper
    install_api_key_helper

    # Install CLAUDE.md
    install_claude_md

    # List installed skills
    list_installed_skills

    echo ""
    print_success "Installation completed successfully!"
    echo ""
    print_info "Installed files:"
    print_info "  • Skills: $SKILLS_DIR"
    print_info "  • Settings: $CLAUDE_DIR/settings.json"
    print_info "  • Global CLAUDE.md: $CLAUDE_DIR/CLAUDE.md"
    print_info "  • API key helper: $CLAUDE_DIR/anthropic_key.sh"
    echo ""
}

# Run main function
main
