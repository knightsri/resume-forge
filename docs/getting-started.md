# 🚀 Getting Started with Resume Forge

This guide will walk you through setting up Resume Forge and processing your first set of career documents.

## 📋 Prerequisites
 
Before you begin, ensure you have:

- **VSCode** installed ([Download here](https://code.visualstudio.com/))
- **Cline extension** for VSCode ([Install from marketplace](https://marketplace.visualstudio.com/items?itemName=saoudrizwan.claude-dev))
- **Claude API key** from Anthropic ([Get yours here](https://console.anthropic.com/))
- **Python 3.8+** (optional, for enhanced features)
- **Your career documents** (resumes, cover letters, CVs in any format)

## 🏗️ Step 1: Create GitHub Repository

### Option A: Use This as a Template (Recommended)

1. **Go to the Resume Forge repository** on GitHub
2. **Click "Use this template"** button (green button)
3. **Create your repository**:
   - Repository name: `resume-forge` (or your preferred name)
   - Description: "AI-powered career document analysis and targeting system"
   - Choose Public or Private (Private recommended for personal use)
4. **Clone your new repository**:

   ```bash
   git clone https://github.com/knightsri/resume-forge.git
   cd resume-forge
   ```

### Option B: Connect Existing Local Files (Your Situation)

If you already have Resume Forge files locally and just created an empty GitHub repository:

1. **Navigate to your existing Resume Forge folder**:

   ```bash
   cd /path/to/your/resume-forge-folder
   ```

2. **Initialize git and connect to your repository**:

   ```bash
   # Initialize git (if not already done)
   git init
   
   # Add your GitHub repository as remote
   git remote add origin https://github.com/knightsri/resume-forge.git
   
   # Add all files
   git add .
   
   # Make initial commit
   git commit -m "🔥 Initial commit: Resume Forge setup"
   
   # Push to GitHub
   git branch -M main
   git push -u origin main
   ```

3. **Verify connection**:

   ```bash
   git remote -v
   # Should show your GitHub repository URL
   ```

## 🏗️ Step 2: Local Setup

### Clone and Initialize

```bash
# Clone the repository
git clone https://github.com/knightsri/resume-forge.git
cd resume-forge

# Run the setup script
chmod +x setup.sh
./setup.sh
```

The setup script will:

- Create all necessary folders
- Set up .gitignore with API key exclusions
- Initialize the project structure
- Verify prerequisites

### Manual Setup (Alternative)

If you prefer manual setup:

```bash
# Create folder structure
mkdir -p {docs,prompts,examples,templates,scripts,extracted_data,opportunities,applications,linkedin_profiles}

# Copy your career documents to the main folder
# (Keep them in the root directory alongside the prompts folder)
```

## 📁 Step 3: Organize Your Documents

### Document Preparation

1. **Collect all career documents** from various locations:
   - Old resume versions (.doc, .docx, .pdf, .txt, .md)
   - Cover letters for different applications
   - CV files from academic or professional contexts
   - LinkedIn profile exports
   - Any career-related documents

2. **Place them in the mydocs/ folder**:

   ```markdown
   resume-forge/
   ├── mydocs/                                    # 🔒 Your personal documents
   │   ├── Resume_2023_Software_Engineer.docx
   │   ├── Resume_2022_Manager_Role.pdf
   │   ├── Cover_Letter_Tech_Company.txt
   │   ├── CV_Academic_2021.pdf
   │   └── LinkedIn_Profile_Export.md
   └── ... (rest of project structure)
   ```

3. **Privacy protection automatically handled**:
   - The entire `mydocs/` folder is in `.gitignore`
   - Your personal documents will NEVER be committed to git
   - Safe to add any career-related files

### File Organization Options

You can organize however you prefer:

**Option A: Organized by type**:

```markdown
mydocs/
├── resumes/
├── cover-letters/
└── other/
```

**Option B: Flat structure**:

```markdown
mydocs/
├── Resume_Latest.pdf
├── CoverLetter_Template.docx
└── CV_Complete.pdf
```

**Option C: By time period**:

```markdown
mydocs/
├── 2020-2021/
├── 2022-2023/
└── current/
```

The processing system will find and analyze all supported files regardless of organization.

## 🔧 Step 4: Configure API Access

### Get Your Claude API Key

1. Visit [Anthropic Console](https://console.anthropic.com/)
2. Create an account or sign in
3. Navigate to API keys section
4. Generate a new API key
5. Copy the key (starts with `sk-ant-`)

### Set Up API Key

**Note**: In the current Cline-based approach, you don't need a separate API key file. Cline handles Claude authentication through VSCode. The setup script may mention API keys for legacy compatibility, but you can ignore those steps.

Your Claude API access is managed through:

1. **Cline extension configuration** in VSCode
2. **Anthropic account** linked to Cline
3. **No separate api.key file needed**

## 🎯 Step 5: First Run - System Verification

Open the project in VSCode and start with system verification:

### Open in VSCode

```bash
code .
```

### Run System Verification (First Time Only)

1. **Open Cline** in VSCode (Command Palette → "Cline: Open")
2. **Copy and paste** the content from `prompts/Prompt0_System_Verification.md`
3. **Let Cline verify** your setup and dependencies
4. **Address any issues** it identifies before proceeding

This verification ensures:

- All folders are created correctly
- API access is working
- Your documents are properly organized
- No configuration issues exist

## 🔄 Step 6: Document Processing Pipeline

Now run the main processing pipeline in order:

### Phase 1: Initial Setup

1. **Open new Cline conversation**
2. **Use Prompt1**: Copy content from `prompts/Prompt1_Initial_Setup.md`
3. **Let Cline create** the extraction script
4. **This phase creates**: Basic processing script with duplicate detection

### Phase 2: Comprehensive Extraction  

1. **Continue with Prompt2**: Copy content from `prompts/Prompt2_Comprehensive_Extraction.md`
2. **Cline enhances** the script with detailed extraction logic
3. **This phase adds**: Resume and cover letter processing capabilities

### Phase 3: Quality Enhancements

1. **Apply Prompt3**: Copy content from `prompts/Prompt3_Quality_Enhancements.md`
2. **Cline adds** production-ready features
3. **This phase includes**: Error handling, progress tracking, recovery mechanisms

### Phase 4: Generate Summary

1. **Run Prompt4**: Copy content from `prompts/Prompt4_Generate_Summary.md`
2. **Cline creates** summary generation script
3. **This phase produces**: `DETAILED_SUMMARY.json` for interactive cleanup

## 🎨 Step 7: Interactive Cleanup

### Upload to Claude Web

1. **Go to** [claude.ai](https://claude.ai) in your browser
2. **Start new conversation**
3. **Upload** your `extracted_data/DETAILED_SUMMARY.json` file
4. **Copy and paste** content from `prompts/Prompt5_Interactive_Cleanup.md`

### Work Through Cleanup

The interactive session will:

- Identify duplicate information across documents
- Ask you to resolve conflicts and inconsistencies  
- Help merge similar experiences and achievements
- Optimize your career narrative and positioning
- Generate clean `Comprehensive_Resume.json`

### Save Final Output

At the end of the session:

1. **Copy the clean JSON** provided by Claude
2. **Save it as** `extracted_data/Comprehensive_Resume.json`
3. **This file is used** for all future targeted applications

## 🎯 Step 8: Generate Targeted Applications

### Create Job Opportunities

1. **Create opportunity files** in the `opportunities/` folder:

   ```markdown
   opportunities/opportunity_Google_Senior_Engineer.md
   opportunities/opportunity_Microsoft_Tech_Lead.md
   ```

2. **Use this format** for each opportunity:

   ```markdown
   # Company: Google
   # Role: Senior Software Engineer
   # Application Deadline: 2024-02-15
   
   ## Job Description:
   [Paste the full job description here]
   
   ## Company Research Notes:
   [Your research about the company]
   
   ## Application Strategy:
   [How you want to position yourself]
   ```

### Generate Applications

1. **Use Prompt6** with Cline: Copy content from `prompts/Prompt6_Targeted_Application_Generator.md`
2. **Cline processes** each opportunity and generates:
   - Targeted resume emphasizing relevant experience
   - Custom cover letter with company research
   - Application checklist with action items

### Optimize LinkedIn Profile

1. **Use Prompt7** with Cline: Copy content from `prompts/Prompt7_LinkedIn_Profile_Generator.md`
2. **Cline creates** optimized LinkedIn profiles:
   - Multiple profile variations for different strategies
   - Content templates for ongoing posting
   - Engagement and networking strategies

## 📊 Step 9: Review and Refine

### Quality Check Your Outputs

Review the generated materials:

- **Targeted resumes**: Ensure they emphasize relevant experience
- **Cover letters**: Verify company research and positioning
- **LinkedIn profiles**: Check for completeness and professional tone

### Iterate and Improve

- **Add new documents**: Simply run Prompt1-4 again (skips processed files)
- **Refine targeting**: Update opportunity files and re-run Prompt6
- **Update LinkedIn**: Modify strategy and re-run Prompt7

## 🔧 Troubleshooting First Run

### Common Issues

#### "API Key Not Found"

```bash
# Check if api.key file exists
ls -la api.key

# Verify content (should show your key)
cat api.key

# Recreate if needed
echo "your_actual_api_key" > api.key
```

#### "No Documents Found"

- Ensure career documents are in the main project folder (not in subfolders)
- Check file formats are supported (.pdf, .docx, .txt, .md, .doc)
- Verify files aren't hidden or system files

#### "Cline Not Responding"

- Check your internet connection
- Verify your Anthropic account has available credits
- Try starting a new Cline conversation
- Check VSCode output panel for error messages
- Restart VSCode if needed
- Ensure Cline extension is up to date

#### "Token Limit Errors"

- Use simplified extraction prompts (see docs/troubleshooting.md)
- Process documents in smaller batches
- Break complex prompts into chunks

### Getting Help

If you encounter issues:

1. **Check [troubleshooting guide](troubleshooting.md)** for common solutions
2. **Search [GitHub Issues](https://github.com/knightsri/resume-forge/issues)** for similar problems
3. **Open a new issue** with details about your setup and error messages
4. **Join discussions** in [GitHub Discussions](https://github.com/knightsri/resume-forge/discussions)

## 🎉 Success! What's Next?

Once you've completed your first run:

### Regular Usage

- **New documents**: Add them and run Prompt1-4 again
- **Job applications**: Create opportunity files and use Prompt6
- **LinkedIn updates**: Refresh profiles with Prompt7
- **Career updates**: Re-run cleanup session for major career changes

### Advanced Features

- Explore [advanced usage guide](advanced-usage.md)
- Learn about [prompt customization](prompt-reference.md)
- Set up [automation scripts](../scripts/) for regular processing

### Community

- **Share your success** in GitHub Discussions
- **Contribute improvements** with pull requests
- **Help others** by answering questions in Issues

---

**Congratulations!** You've successfully set up Resume Forge and processed your career documents. You now have a comprehensive career profile and the tools to generate targeted applications efficiently.

**Next recommended reading**: [Advanced Usage Guide](advanced-usage.md) for power user features and customization options.
