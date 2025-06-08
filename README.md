# 🔥 Resume Forge

> Transform your scattered career documents into targeted job applications using AI

**Stop maintaining dozens of resume versions.** Resume Forge processes your entire career document collection once, then generates unlimited targeted resumes, cover letters, and LinkedIn profiles for any opportunity.

[![GitHub stars](https://img.shields.io/github/stars/knightsri/resume-forge?style=social)](https://github.com/knightsri/resume-forge)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude AI](https://img.shields.io/badge/Powered%20by-Claude%20AI-blue)](https://claude.ai)

## 🎯 What Resume Forge Does

### Before Resume Forge 

- 📁 Scattered resume files across years
- ✏️ Manual customization for each application  
- 🔄 Inconsistent information across documents
- ⏰ Hours spent on each job application
- 🤔 Forgetting key achievements and experiences

### After Resume Forge

- 🚀 **One-time processing** of all career documents
- 🎯 **Instant targeted resumes** for any job posting
- 💼 **Custom cover letters** with company research
- 📈 **Optimized LinkedIn profiles** for different strategies
- 📊 **Career timeline analysis** and progression insights

## ✨ Key Features

### 🤖 **AI-Powered Extraction**

- Processes resumes, cover letters, CVs in any format (.pdf, .docx, .md, .txt)
- Extracts ALL career information without losing details
- Handles decades of career documents automatically
- Eliminates duplicates and consolidates variations

### 🎯 **Smart Targeting**

- Analyzes job descriptions to emphasize relevant experience
- Generates custom resumes highlighting matching skills
- Creates compelling cover letters with company research
- Adapts messaging for different role types and seniority levels

### 💼 **Professional Optimization**

- Executive-level resume formatting and structure
- LinkedIn profile variations for different career strategies
- Achievement quantification and impact measurement
- Skills evolution tracking and technology progression

### 🔧 **Production Ready**

- Robust error handling and recovery mechanisms
- Progress tracking and resumable processing
- Duplicate detection and intelligent consolidation
- Comprehensive logging and quality assurance

## 🚀 Quick Start

### Prerequisites

- VSCode with [Cline extension](https://marketplace.visualstudio.com/items?itemName=saoudrizwan.claude-dev)
- Claude API key from [Anthropic](https://console.anthropic.com/)
- Python 3.8+ (for enhanced features)

### 1. Setup

```bash
# Create your repository on GitHub first (see getting started guide)

# Clone your repository
git clone https://github.com/knightsri/resume-forge.git
cd resume-forge

# Run setup script
./scripts/setup.sh

# Add your career documents to the mydocs/ folder
cp ~/Documents/MyResumes/* mydocs/
cp ~/Documents/CoverLetters/* mydocs/
```

### 2. Process Your Documents

```bash
# Open in VSCode
code .

# Follow the step-by-step prompts:
# Prompt_System_Verification → System verification (first time only)
# Prompt1 → Initial setup and duplicate detection  
# Prompt2 → Comprehensive data extraction
# Prompt3 → Production enhancements
# Prompt4 → Generate detailed summary
```

### 3. Interactive Cleanup

- Upload `DETAILED_SUMMARY.json` to [Claude.ai](https://claude.ai)
- Use **Prompt5** for interactive deduplication and optimization
- Get your comprehensive career profile

### 4. Generate Targeted Applications

```bash
# Add job opportunities to opportunities/ folder
# Use Prompt6 for targeted resumes and cover letters
# Use Prompt7 for LinkedIn profile optimization
```

## 📊 Example Results

### Input 

- 47 resume files spanning 15 years
- 23 cover letters for various positions
- Scattered achievements and project descriptions

### Output

- **1 comprehensive career profile** with timeline analysis
- **Targeted resume** emphasizing relevant experience (2 minutes)
- **Custom cover letter** with company research (3 minutes)  
- **3 LinkedIn profile variations** for different strategies
- **Career progression insights** and skill evolution mapping

## 🏗️ Architecture

Resume Forge uses a modular prompt-based architecture:

```
📂 prompts/
├── 🔍 Prompt_System_Verification.md     # Pre-flight checks
├── 🏗️ Prompt1_Initial_Setup.md          # Document scanning & deduplication  
├── 📖 Prompt2_Comprehensive_Extraction.md # AI-powered data extraction
├── 🛡️ Prompt3_Quality_Enhancements.md    # Production features
├── 📊 Prompt4_Generate_Summary.md        # Data consolidation
├── 🎯 Prompt5_Interactive_Cleanup.md     # Human-guided optimization
├── 📄 Prompt6_Targeted_Applications.md   # Job-specific materials
└── 💼 Prompt7_LinkedIn_Optimization.md   # Professional branding
```

Each prompt is self-contained and handles token limits gracefully.

## 📁 Project Structure

```
resume-forge/
├── 📋 README.md                          # You are here
├── 📂 prompts/                           # Step-by-step processing prompts
├── 📂 docs/                              # Comprehensive documentation
├── 📂 mydocs/                            # 🔒 Your personal career documents
├── 📂 examples/                          # Sample documents and outputs
├── 📂 templates/                         # Document templates
├── 📂 scripts/                           # Optional automation scripts
├── 📂 extracted_data/                    # Generated career profiles
├── 📂 opportunities/                     # Job descriptions for targeting
├── 📂 applications/                      # Generated resumes and cover letters
└── 📂 linkedin_profiles/                 # LinkedIn optimization outputs
```

## 🎯 Use Cases

### For Job Seekers

- **Career changers**: Highlight transferable skills across industries
- **Senior professionals**: Showcase decades of experience strategically  
- **Recent graduates**: Organize internships, projects, and academic work
- **Freelancers**: Consolidate diverse client work and achievements

### For Career Professionals  

- **Recruiters**: Help candidates organize and optimize their materials
- **Career coaches**: Systematic approach to client career management
- **HR professionals**: Standardize resume evaluation and comparison
- **Professional writers**: Streamline resume writing service delivery

## 🔧 Advanced Features

### Token Limit Handling

- Automatic chunked processing for large document collections
- Graceful fallback to simplified extraction modes
- Resumable processing with progress tracking

### Quality Assurance

- Duplicate detection across different file formats
- Timeline consistency validation
- Achievement quantification verification
- Skills standardization and categorization

### Extensibility

- Add custom prompts for industry-specific optimization
- Plugin architecture for different AI providers
- Template system for various career stages and roles

## 📚 Documentation

- **[Getting Started Guide](docs/getting-started.md)** - Detailed setup and first run
- **[Troubleshooting](docs/troubleshooting.md)** - Common issues and solutions
- **[Prompt Reference](docs/prompt-reference.md)** - Detailed prompt documentation
- **[Advanced Usage](docs/advanced-usage.md)** - Power user features and customization
- **[API Reference](docs/api-reference.md)** - Claude API integration details

## 🤝 Contributing

We welcome contributions! Resume Forge thrives on community input.

### Quick Contributions

- 🐛 **Bug reports**: Found an issue? [Open an issue](https://github.com/knightsri/resume-forge/issues)
- 💡 **Feature requests**: Have an idea? [Start a discussion](https://github.com/knightsri/resume-forge/discussions)
- 📝 **Documentation**: Improve our docs with PRs

### Development Contributions

- 🔧 **New prompts**: Add industry-specific or role-specific prompts
- 🎯 **Enhanced targeting**: Improve job description analysis
- 🤖 **AI improvements**: Better extraction and consolidation logic
- 🌐 **Integrations**: Connect with job boards, ATS systems, LinkedIn API

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

## 📈 Roadmap

### v1.0 - Core Functionality ✅

- [x] Document processing and extraction
- [x] Interactive cleanup and optimization  
- [x] Targeted resume and cover letter generation
- [x] LinkedIn profile optimization

### v1.1 - Enhanced Features 🚧

- [ ] Web interface for non-technical users
- [ ] Integration with popular job boards
- [ ] Real-time collaboration for career coaches
- [ ] Advanced analytics and career insights

### v1.2 - Enterprise Features 🔄

- [ ] Team/organization deployment
- [ ] SSO and enterprise security
- [ ] Bulk processing and management
- [ ] Custom branding and templates

### v2.0 - AI Evolution 🌟

- [ ] Multi-modal document analysis (images, videos)
- [ ] Interview preparation and practice
- [ ] Salary negotiation insights
- [ ] Career path prediction and recommendations

## 🏆 Success Stories

> *"Resume Forge helped me organize 12 years of scattered resume files into a comprehensive career profile. I went from spending hours on each application to generating targeted materials in minutes."* - **Sarah M., Software Engineering Manager**

> *"As a career coach, Resume Forge has transformed how I help clients. The systematic approach and AI-powered insights save hours while delivering better results."* - **Michael R., Professional Career Coach**

> *"The LinkedIn optimization alone was worth it. Three different profile strategies helped me connect with the right opportunities in my field."* - **Dr. Jennifer L., Research Scientist**

## 💬 Community & Support

- **💬 Discussions**: [GitHub Discussions](https://github.com/knightsri/resume-forge/discussions)
- **🐛 Issues**: [GitHub Issues](https://github.com/knightsri/resume-forge/issues)  
- **📧 Email**: <resume-forge@yourorg.com>
- **🐦 Twitter**: [@ResumeForge](https://twitter.com/ResumeForge)

## 📄 License

Resume Forge is open source software licensed under the [MIT License](LICENSE).

## 🙏 Acknowledgments

- **[Anthropic](https://anthropic.com)** for Claude AI that powers the intelligent extraction
- **[Cline](https://github.com/saoudrizwan/claude-dev)** for the excellent VSCode integration
- **Contributors** who make Resume Forge better every day
- **Career professionals** who provided feedback and real-world testing

---

**Ready to forge your career success?** [Get started now](docs/getting-started.md) → 

⭐ **Star this repo** if Resume Forge helps your career journey!
