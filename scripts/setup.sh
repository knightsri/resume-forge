#!/bin/bash

# Resume Forge - Simple Setup Script
echo "🔥 Resume Forge Simple Setup"
echo "============================"

# Create directories
echo "📁 Creating directories..."
mkdir -p docs prompts examples templates scripts extracted_data opportunities applications linkedin_profiles mydocs

# Create .gitkeep only for folders that need to be tracked
echo "📌 Creating .gitkeep files..."
touch opportunities/.gitkeep
touch examples/.gitkeep
touch templates/.gitkeep

# Create mydocs README only if missing
if [ ! -f "mydocs/README.md" ]; then
    echo "📄 Creating mydocs/README.md..."
    cat > mydocs/README.md << 'MYDOCS_EOF'
# My Career Documents

This folder contains your personal career documents (resumes, cover letters, CVs).

## ⚠️ PRIVACY WARNING
- This folder contains PERSONAL CAREER INFORMATION
- Never share this folder or its contents publicly
- Ensure this folder is properly ignored by git
- Double-check before any git commits or pushes

## Privacy Protection
- This entire folder is ignored by git (see .gitignore)
- Your personal documents will never be committed to the repository
- Safe to add all your career documents here

## Usage
1. Copy all your career documents to this folder
2. Run the Resume Forge prompts to process them
3. The system will automatically find and analyze all supported files

## Supported Formats
- PDF (*.pdf)
- Word (*.docx, *.doc)  
- Text (*.txt)
- Markdown (*.md)

## Security Best Practices
- Regularly verify git status before committing
- Use private repositories for Resume Forge projects
- Be cautious when sharing generated outputs
- Keep backups of original documents in secure locations
MYDOCS_EOF
else
    echo "mydocs/README.md already exists - skipping"
fi

# Create .gitignore only if missing
if [ ! -f ".gitignore" ]; then
    echo "📝 Creating .gitignore..."
    cat > .gitignore << 'GITIGNORE_EOF'
# Personal Documents (Privacy Protection)
mydocs/

# Generated Data (Complete privacy protection)
extracted_data/
applications/
linkedin_profiles/

# Processing temp files (may contain personal data)
*.processing
*.partial
checkpoint_*
state_*
progress_*
backup_*
*_temp.json
*_working.json

# Credentials and secrets
*.pem
*.key
*.p12
*.pfx
credentials.json
secrets.json
config.local.*
.env*
*token*
*secret*
*credential*

# SSH keys
id_rsa*
id_dsa*
id_ed25519*

# Logs and Temp Files
*.log
*.tmp
*.backup
tmp/
temp/
.cache/
cache/

# Development
.vscode/settings.json
.vscode/launch.json
.idea/workspace.xml
.idea/tasks.xml
__pycache__/
*.pyc

# System Files
.DS_Store
Thumbs.db
*~
.Trashes
.Spotlight-V100

# Legacy (root level documents)
*.pdf
*.docx
*.doc
!examples/**
!templates/**
!docs/**
!prompts/**
!README.md
!CONTRIBUTING.md
!LICENSE
!.github/**
GITIGNORE_EOF
else
    echo ".gitignore already exists - skipping"
    echo "Note: Ensure mydocs/, extracted_data/, applications/, linkedin_profiles/ are ignored for privacy"
fi

# Create pre-commit hook for security
echo "🔒 Setting up pre-commit security hook..."

# Initialize git if not already done
if [ ! -d ".git" ]; then
    echo "Initializing git repository..."
    git init
fi

# Create hooks directory if it doesn't exist
mkdir -p .git/hooks

if [ ! -f ".git/hooks/pre-commit" ]; then
        cat > .git/hooks/pre-commit << 'PRECOMMIT_EOF'
#!/bin/sh
# Resume Forge Pre-commit Security Hook
# Prevents accidental commits of personal career data

echo "🔍 Checking for personal data in commit..."

# Check for personal document files
personal_files=$(git diff --cached --name-only | grep -E "\.(pdf|docx|doc|txt|md)$" | grep -v -E "(examples|templates|docs|[Pp]rompts|README|CONTRIBUTING|LICENSE|\.github)")

if [ ! -z "$personal_files" ]; then
    echo ""
    echo "🚨 SECURITY WARNING: Personal document files detected!"
    echo "======================================================"
    echo "The following files might contain personal career data:"
    echo ""
    echo "$personal_files" | sed 's/^/  ❌ /'
    echo ""
    echo "If these are personal documents, they should be in mydocs/ folder."
    echo "If these are project files, they should be in examples/ or templates/."
    echo ""
    echo "To bypass this check (if you're sure), run:"
    echo "git commit --no-verify"
    echo ""
    exit 1
fi

# Check if mydocs/ folder contents are being committed
mydocs_files=$(git diff --cached --name-only | grep "^mydocs/" | grep -v "README.md")

if [ ! -z "$mydocs_files" ]; then
    echo ""
    echo "🚨 CRITICAL SECURITY WARNING: mydocs/ content detected!"
    echo "======================================================="
    echo "Personal documents from mydocs/ folder are being committed:"
    echo ""
    echo "$mydocs_files" | sed 's/^/  ❌ /'
    echo ""
    echo "This folder should contain personal career documents and be ignored by git."
    echo "Check your .gitignore file and ensure 'mydocs/' is properly excluded."
    echo ""
    echo "NEVER commit personal career documents to git!"
    echo ""
    exit 1
fi

# Check for generated personal data
generated_files=$(git diff --cached --name-only | grep -E "(extracted_data|applications|linkedin_profiles)/" | grep -v -E "(\.gitkeep|README\.md)$")

if [ ! -z "$generated_files" ]; then
    echo ""
    echo "🚨 SECURITY WARNING: Generated personal data detected!"
    echo "====================================================="
    echo "Generated files containing personal data are being committed:"
    echo ""
    echo "$generated_files" | sed 's/^/  ❌ /'
    echo ""
    echo "These folders should be ignored by git as they contain personal information."
    echo "Check your .gitignore file and ensure these folders are properly excluded:"
    echo "  - extracted_data/"
    echo "  - applications/"
    echo "  - linkedin_profiles/"
    echo ""
    exit 1
fi

# Check for potential credentials or secrets
secret_files=$(git diff --cached --name-only | grep -E "\.(key|pem|p12|pfx)$|credentials|secrets|token")

if [ ! -z "$secret_files" ]; then
    echo ""
    echo "🚨 SECURITY WARNING: Potential credentials detected!"
    echo "==================================================="
    echo "Files that might contain credentials or secrets:"
    echo ""
    echo "$secret_files" | sed 's/^/  ❌ /'
    echo ""
    echo "These files should never be committed to git."
    echo "Add them to .gitignore or remove them from the commit."
    echo ""
    exit 1
fi

echo "✅ Security check passed - no personal data detected"
echo ""
PRECOMMIT_EOF
        chmod +x .git/hooks/pre-commit
        echo "✅ Pre-commit security hook installed"
    else
        echo "Pre-commit hook already exists - skipping"
    fi

echo ""
echo "✅ Setup Complete!"
echo "=================="
echo "📂 Created all directories"
echo "🔒 Configured privacy protection"
echo "🛡️  Installed pre-commit security hook"
echo ""
echo "🔐 Security Features Active:"
echo "- Personal documents protected in mydocs/"
echo "- Generated data folders ignored"
echo "- Pre-commit hook prevents data leaks"
echo "- Credential and secret file protection"
echo ""
echo "🔐 Security Reminders:"
echo "- Use PRIVATE repositories for Resume Forge projects"
echo "- Never share mydocs/ folder contents"
echo "- Always verify 'git status' before committing"
echo "- Keep original documents backed up separately"
echo ""
echo "Next Steps:"
echo "1. Copy your documents to mydocs/ folder"
echo "2. Open in VSCode: code ."
echo "3. Start with the prompts!"
echo ""
echo "🔥 Ready to forge your career success!"