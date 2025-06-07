echo ""
echo "📚 Documentation:"
echo "- Getting Started: docs/getting-started.md"
echo "- Troubleshooting: docs/troubleshooting.md"
echo "- Advanced Usage: docs/advanced-usage.md"
echo "- Contributing: CONTRIBUTING.md"

echo ""
print_info "Ready to forge your career success! 🔥"#!/bin/bash

# Resume Forge Setup Script
# This script initializes the project structure and verifies prerequisites

set -e  # Exit on any error

echo "🔥 Resume Forge Setup"
echo "===================="
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

# Check if we're in the right directory
if [ ! -f "README.md" ] || ! grep -q "Resume Forge" README.md; then
    print_error "Please run this script from the resume-forge project root directory"
    exit 1
fi

print_info "Setting up Resume Forge project structure..."

# Create directory structure
echo ""
echo "📁 Creating directory structure..."

directories=(
    "docs"
    "prompts" 
    "examples"
    "templates"
    "scripts"
    "extracted_data"
    "opportunities"
    "applications"
    "linkedin_profiles"
)

for dir in "${directories[@]}"; do
    if [ ! -d "$dir" ]; then
        mkdir -p "$dir"
        print_status "Created directory: $dir/"
    else
        print_info "Directory already exists: $dir/"
    fi
done

# Move this script to scripts/ if it's not already there
if [ -f "setup.sh" ] && [ ! -f "scripts/setup.sh" ]; then
    cp setup.sh scripts/setup.sh
    chmod +x scripts/setup.sh
    print_status "Moved setup.sh to scripts/ folder"
    print_info "You can delete the root setup.sh file now"
fi

# Create .gitignore if it doesn't exist
echo ""
echo "📝 Setting up .gitignore..."

if [ ! -f ".gitignore" ]; then
    cat > .gitignore << 'EOF'
# API Keys and Secrets (legacy - not used in current Cline approach)
api.key
*.key
.env
.env.local
.env.*.local

# Generated Data
extracted_data/*.json
!extracted_data/.gitkeep
applications/*/
!applications/.gitkeep
linkedin_profiles/*.md
!linkedin_profiles/.gitkeep

# Logs
*.log
logs/
error.log
processing.log

# Python
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# Virtual Environment
venv/
env/
ENV/

# IDE
.vscode/settings.json
.vscode/launch.json
.idea/
*.swp
*.swo
*~

# OS
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Temporary files
tmp/
temp/
*.tmp
*.bak
*.backup

# Large document files (keep originals private)
*.pdf
*.docx
*.doc
!examples/*.pdf
!examples/*.docx
!examples/*.doc
!templates/*.pdf
!templates/*.docx
!templates/*.doc
EOF
    print_status "Created .gitignore file"
else
    print_info ".gitignore already exists"
fi

# Create .gitkeep files for empty directories
echo ""
echo "📌 Creating .gitkeep files..."

gitkeep_dirs=(
    "extracted_data"
    "opportunities"
    "applications"
    "linkedin_profiles"
    "examples"
    "templates"
    "scripts"
)

for dir in "${gitkeep_dirs[@]}"; do
    if [ ! -f "$dir/.gitkeep" ]; then
        touch "$dir/.gitkeep"
        print_status "Created $dir/.gitkeep"
    fi
done

# Check prerequisites
echo ""
echo "🔍 Checking prerequisites..."

# Check for VSCode
if command -v code >/dev/null 2>&1; then
    print_status "VSCode found"
else
    print_warning "VSCode not found. Please install VSCode and add 'code' command to PATH"
    print_info "Download: https://code.visualstudio.com/"
fi

# Check for Python
if command -v python3 >/dev/null 2>&1; then
    python_version=$(python3 --version | cut -d' ' -f2)
    print_status "Python found: $python_version"
    
    # Check if version is 3.8+
    if python3 -c "import sys; exit(0 if sys.version_info >= (3, 8) else 1)" 2>/dev/null; then
        print_status "Python version is compatible (3.8+)"
    else
        print_warning "Python 3.8+ recommended. Current version: $python_version"
    fi
elif command -v python >/dev/null 2>&1; then
    python_version=$(python --version | cut -d' ' -f2)
    print_info "Python found: $python_version (using 'python' command)"
else
    print_warning "Python not found. Some advanced features may not work"
    print_info "Install Python 3.8+: https://python.org/downloads/"
fi

# Check for Git
if command -v git >/dev/null 2>&1; then
    print_status "Git found"
else
    print_warning "Git not found. Install Git to use version control features"
fi

# Create init-git.sh in scripts folder
echo ""
echo "📄 Creating helper scripts..."

if [ ! -f "scripts/init-git.sh" ]; then
    cat > scripts/init-git.sh << 'EOF'
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

# Go to project root (this script should be run from project root)
if [ ! -f "README.md" ] || ! grep -q "Resume Forge" README.md; then
    print_error "Please run this script from the resume-forge project root directory"
    print_info "Usage: ./scripts/init-git.sh"
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

# Add all files to staging
echo ""
print_info "Adding files to git staging area..."
git add .

# Show what will be committed
echo ""
print_info "Files to be committed:"
git status --short

# Make initial commit
if ! git diff --cached --quiet; then
    echo ""
    read -p "Continue with initial commit? (Y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Nn]$ ]]; then
        print_info "Commit cancelled. Files remain staged."
        exit 0
    fi
    
    print_info "Creating initial commit..."
    git commit -m "🔥 Initial commit: Resume Forge setup

- Add project structure and documentation
- Add comprehensive prompt system for AI-powered career document processing
- Include setup scripts and configuration files
- Add examples and templates for job targeting
- Configure gitignore for sensitive data

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
else
    print_warning "No changes to commit"
fi

echo ""
print_status "Git initialization complete!"
print_info "Next: Add remote repository and push to GitHub"
print_info "Commands: git remote add origin <url> && git push -u origin main"
EOF

    chmod +x scripts/init-git.sh
    print_status "Created scripts/init-git.sh"
fi

# Create example opportunity file
if [ ! -f "opportunities/example_opportunity.md" ]; then
    cat > opportunities/example_opportunity.md << 'EOF'
# Company: Example Tech Corp
# Role: Senior Software Engineer
# Application Deadline: 2024-03-15
# Salary Range: $120k-$180k
# Source: Company website

## Job Description:
We are seeking a Senior Software Engineer to join our platform team. You will be responsible for designing and implementing scalable backend services, mentoring junior developers, and contributing to our technical strategy.

**Requirements:**
- 5+ years of software development experience
- Strong experience with Python, Java, or Go
- Experience with cloud platforms (AWS, GCP, or Azure)
- Knowledge of microservices architecture
- Experience with Docker and Kubernetes
- Strong communication and leadership skills

**Nice to Have:**
- Experience with machine learning frameworks
- Previous startup experience
- Open source contributions

## Company Research Notes:
Example Tech Corp is a fast-growing SaaS company focused on developer tools. They recently raised Series B funding and are scaling their engineering team. Known for strong engineering culture and remote-first approach.

Recent news:
- Launched new AI-powered code review tool
- Expanded internationally to Europe
- Named "Best Places to Work" by TechCrunch

## Application Strategy:
Emphasize my backend architecture experience and team leadership. Highlight the microservices project I led at previous company and any open source contributions. Connect my experience with their developer tools focus.

## Personal Notes:
- Know Sarah Johnson (former colleague) who works there now
- Interested in their technical blog and engineering practices
- Align with their remote-first culture
EOF
    print_status "Created example opportunity file"
fi

# Create example README for opportunities
if [ ! -f "opportunities/README.md" ]; then
    cat > opportunities/README.md << 'EOF'
# Job Opportunities

This folder contains job descriptions and research for positions you're targeting.

## File Format

Create one file per opportunity using this naming convention:
`opportunity_[Company]_[Role].md`

Example: `opportunity_Google_Senior_Engineer.md`

## Template

```markdown
# Company: [Company Name]
# Role: [Position Title]
# Application Deadline: [Date if known]
# Salary Range: [Range if known]
# Source: [Where you found this job]

## Job Description:
[Full job description text]

## Company Research Notes:
[Research about company, culture, recent news, etc.]

## Application Strategy:
[How you want to position yourself for this role]

## Personal Notes:
[Connections, referrals, specific interests, etc.]
```

## Usage

1. Create opportunity files using the template above
2. Run `Prompt6_Targeted_Application_Generator.md` with Cline
3. Generated applications will appear in `../applications/[Company_Role]/`
EOF
    print_status "Created opportunities README"
fi

# Create contributing guidelines
if [ ! -f "CONTRIBUTING.md" ]; then
    cat > CONTRIBUTING.md << 'EOF'
# Contributing to Resume Forge

We love your input! We want to make contributing to Resume Forge as easy and transparent as possible.

## Ways to Contribute

### 🐛 Bug Reports
- Use GitHub Issues to report bugs
- Include detailed steps to reproduce
- Provide your system information and error messages
- Check existing issues before creating new ones

### 💡 Feature Requests  
- Open GitHub Discussions for feature ideas
- Describe the problem you're trying to solve
- Explain how the feature would help users
- Consider implementation complexity

### 📝 Documentation
- Improve existing documentation
- Add examples and use cases
- Fix typos and formatting
- Translate documentation to other languages

### 🔧 Code Contributions
- Fork the repository
- Create a feature branch from `main`
- Make your changes with clear commit messages
- Add tests if applicable
- Update documentation for new features
- Submit a pull request

## Development Setup

1. Fork and clone the repository
2. Run `./scripts/setup.sh` to initialize the project
3. Make your changes
4. Test with your own career documents
5. Submit a pull request

## Community Guidelines

- **Be respectful** and constructive in all interactions
- **Help others** by answering questions in Issues and Discussions
- **Share your experience** - success stories help improve the project
- **Follow the Code of Conduct** (treat everyone with respect)

Thank you for contributing to Resume Forge! 🔥
EOF
    print_status "Created CONTRIBUTING.md"
fi

# Create license file
echo ""
echo "⚖️ Creating license file..."

if [ ! -f "LICENSE" ]; then
    cat > LICENSE << 'EOF'
MIT License

Copyright (c) 2024 Resume Forge

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF
    print_status "Created LICENSE file"
fi

# Final setup verification
echo ""
echo "✅ Setup verification..."

# Check if all required directories exist
all_dirs_exist=true
for dir in "${directories[@]}"; do
    if [ ! -d "$dir" ]; then
        print_error "Directory missing: $dir/"
        all_dirs_exist=false
    fi
done

if [ "$all_dirs_exist" = true ]; then
    print_status "All directories created successfully"
else
    print_error "Some directories are missing"
    exit 1
fi

# Check if .gitignore exists
if [ -f ".gitignore" ]; then
    print_status ".gitignore properly configured"
else
    print_error ".gitignore missing"
    exit 1
fi

echo ""
echo "🎉 Setup Complete!"
echo "=================="
print_status "Resume Forge project structure initialized"
print_status "Directory structure created"
print_status "Helper scripts created in scripts/ folder"
print_status "Example files created"

echo ""
echo "📋 Next Steps:"
echo "1. Copy your career documents to this folder"
echo "2. Open in VSCode: code ."
echo "3. Install Cline extension if not already installed"
echo "4. Start with Prompt0_System_Verification.md"
        echo "5. Initialize git: ./scripts/init-git.sh (optional)" Complete!"
echo "=================="
print_status "Resume Forge project structure initialized"
print_status "Directory structure created"
print_status "Git configuration set up"
print_status "Example files created"

echo ""
echo "📋 Next Steps:"
echo "1. Add your Claude API key: echo 'your-api-key' > api.key"
echo "2. Copy your career documents to this folder"
echo "3. Open in VSCode: code ."
echo "4. Install Cline extension if not already installed"
echo "5. Start with Prompt0_System_Verification.md"

echo ""
echo "📚 Documentation:"
echo "- Getting Started: docs/getting-started.md"
echo "- Troubleshooting: docs/troubleshooting.md"
echo "- Contributing: CONTRIBUTING.md"

echo ""
print_info "Ready to forge your career success! 🔥"