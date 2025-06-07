#!/bin/bash

# Resume Forge Git Initialization Script
# This script initializes git repository and makes initial commit

set -e  # Exit on any error

echo "🔥 Resume Forge Git Initialization"
echo "=================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✅${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠️${NC} $1"
}

print_error() {
    echo -e "${RED}❌${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ️${NC} $1"
}

# Check if git is installed
if ! command -v git >/dev/null 2>&1; then
    print_error "Git is not installed. Please install Git first."
    print_info "Download from: https://git-scm.com/downloads"
    exit 1
fi

# Check if we're in the right directory
if [ ! -f "README.md" ] || ! grep -q "Resume Forge" README.md; then
    print_error "Please run this script from the resume-forge project root directory"
    exit 1
fi

# Check if already a git repository
if [ -d ".git" ]; then
    print_warning "Git repository already exists"
    read -p "Do you want to reinitialize? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Exiting without changes"
        exit 0
    fi
    rm -rf .git
    print_info "Removed existing .git directory"
fi

# Initialize git repository
echo ""
print_info "Initializing Git repository..."
git init
print_status "Git repository initialized"

# Set up git configuration (optional)
echo ""
print_info "Setting up Git configuration..."

# Check if user has global git config
if ! git config --global user.name >/dev/null 2>&1 || ! git config --global user.email >/dev/null 2>&1; then
    print_warning "Git user configuration not found"
    echo ""
    read -p "Enter your name for git commits: " git_name
    read -p "Enter your email for git commits: " git_email
    
    git config user.name "$git_name"
    git config user.email "$git_email"
    print_status "Git user configuration set for this repository"
else
    git_name=$(git config user.name)
    git_email=$(git config user.email)
    print_info "Using existing git configuration: $git_name <$git_email>"
fi

# Verify .gitignore exists and api.key is excluded
echo ""
print_info "Verifying .gitignore configuration..."

if [ ! -f ".gitignore" ]; then
    print_error ".gitignore file not found. Run setup.sh first."
    exit 1
fi

if ! grep -q "api.key" .gitignore; then
    print_error ".gitignore doesn't exclude api.key. This is a security risk."
    exit 1
fi

print_status ".gitignore properly configured"

# Check for sensitive files that shouldn't be committed
echo ""
print_info "Checking for sensitive files..."

sensitive_files_found=false

if [ -f "api.key" ]; then
    # Check if api.key would be committed (shouldn't be)
    if git check-ignore api.key >/dev/null 2>&1; then
        print_status "api.key properly ignored by git"
    else
        print_error "api.key is NOT ignored by git! This is a security risk."
        print_info "Make sure api.key is listed in .gitignore"
        sensitive_files_found=true
    fi
fi

# Check for other potential sensitive files
sensitive_patterns=("*.key" ".env" "*.secret" "*.token")
for pattern in "${sensitive_patterns[@]}"; do
    if ls $pattern 1> /dev/null 2>&1; then
        for file in $pattern; do
            if ! git check-ignore "$file" >/dev/null 2>&1; then
                print_warning "Sensitive file not ignored: $file"
                sensitive_files_found=true
            fi
        done
    fi
done

if [ "$sensitive_files_found" = true ]; then
    print_error "Sensitive files found that are not ignored by git"
    read -p "Do you want to continue anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Please fix .gitignore and run this script again"
        exit 1
    fi
fi

# Add all files to staging
echo ""
print_info "Adding files to git staging area..."

# Add all files
git add .

# Show what will be committed
echo ""
print_info "Files to be committed:"
git status --short

# Check if there are any files to commit
if ! git diff --cached --quiet; then
    echo ""
    read -p "Continue with initial commit? (Y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Nn]$ ]]; then
        print_info "Commit cancelled. Files remain staged."
        exit 0
    fi
    
    # Make initial commit
    print_info "Creating initial commit..."
    git commit -m "🔥 Initial commit: Resume Forge setup

- Add project structure and documentation
- Add comprehensive prompt system for AI-powered career document processing
- Include setup scripts and configuration files
- Add examples and templates for job targeting
- Configure gitignore for API keys and sensitive data

Features:
- Document extraction and consolidation
- Targeted resume and cover letter generation  
- LinkedIn profile optimization
- Interactive cleanup and quality assurance
- Modular prompt-based architecture"

    print_status "Initial commit created successfully"
    
    # Show commit details
    echo ""
    print_info "Commit details:"
    git log --oneline -1
    git show --stat HEAD
    
else
    print_warning "No changes to commit"
fi

# Set up remote repository (optional)
echo ""
print_info "Setting up remote repository..."
read -p "Do you want to add a GitHub remote? (y/N): " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo ""
    print_info "To add a GitHub remote:"
    echo "1. Create a new repository on GitHub named 'resume-forge'"
    echo "2. Copy the repository URL"
    echo ""
    read -p "Enter GitHub repository URL (https or ssh): " repo_url
    
    if [ -n "$repo_url" ]; then
        git remote add origin "$repo_url"
        print_status "Remote 'origin' added: $repo_url"
        
        # Check if we can connect to remote
        print_info "Testing connection to remote repository..."
        if git ls-remote origin >/dev/null 2>&1; then
            print_status "Successfully connected to remote repository"
            
            # Ask about pushing
            read -p "Push to remote repository now? (y/N): " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                print_info "Pushing to remote repository..."
                git branch -M main
                git push -u origin main
                print_status "Successfully pushed to remote repository"
            else
                print_info "You can push later with: git push -u origin main"
            fi
        else
            print_warning "Could not connect to remote repository"
            print_info "Make sure the repository exists and you have access"
            print_info "You can push later with: git push -u origin main"
        fi
    else
        print_info "No remote URL provided"
    fi
else
    print_info "Skipping remote repository setup"
fi

# Create useful git aliases (optional)
echo ""
read -p "Create helpful git aliases for this project? (y/N): " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]; then
    git config alias.st "status --short"
    git config alias.co "checkout"
    git config alias.br "branch"
    git config alias.ci "commit"
    git config alias.unstage "reset HEAD --"
    git config alias.last "log -1 HEAD --stat"
    git config alias.visual "!gitk"
    git config alias.graph "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
    
    print_status "Git aliases created:"
    print_info "  git st     -> git status --short"
    print_info "  git co     -> git checkout"
    print_info "  git br     -> git branch"
    print_info "  git ci     -> git commit"
    print_info "  git unstage -> git reset HEAD --"
    print_info "  git last   -> git log -1 HEAD --stat"
    print_info "  git graph  -> pretty commit graph"
fi

echo ""
echo "🎉 Git Initialization Complete!"
echo "==============================="
print_status "Git repository initialized"
print_status "Initial commit created"
print_status "Files properly configured and staged"

if git remote get-url origin >/dev/null 2>&1; then
    remote_url=$(git remote get-url origin)
    print_status "Remote repository: $remote_url"
fi

echo ""
echo "📋 Git Commands Summary:"
echo "========================"
echo "# Check status"
echo "git status"
echo ""
echo "# Add new files"
echo "git add ."
echo ""
echo "# Commit changes"
echo "git commit -m 'Your commit message'"
echo ""
echo "# Push to remote (if configured)"
echo "git push"
echo ""
echo "# Pull latest changes"
echo "git pull"
echo ""
echo "# Create new branch"
echo "git checkout -b feature-branch-name"
echo ""
echo "# Switch branches"
echo "git checkout main"

echo ""
echo "🔒 Security Reminders:"
echo "======================"
print_warning "NEVER commit your api.key file"
print_warning "Check .gitignore before committing sensitive data"
print_warning "Review files with 'git status' before committing"

echo ""
print_info "Your Resume Forge repository is ready! 🔥"
print_info "Next: Follow docs/getting-started.md to process your documents"