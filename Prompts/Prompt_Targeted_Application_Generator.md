# Generate Targeted Resume & Cover Letter

Create a script that takes your comprehensive career data and generates targeted resumes and cover letters for specific job opportunities.

## Input Requirements:

1. **Comprehensive Resume Data**: `extracted_data/Comprehensive_Resume.json` (from WebPrompt_Cleanup.md)
2. **Job Opportunity Files**: Place in `opportunities/` folder with format:
   - `opportunity_<company-name>_<role-name>.md` or `.txt`
   - Example: `opportunity_Microsoft_Senior_Engineering_Manager.md`

## Job Opportunity File Format:
Each opportunity file should contain:

```
Company: [Company Name]
Role: [Position Title]
Application Deadline: [Date if known]
Salary Range: [Range if known]
Source: [Where you found this job]
Job Description:
[Full job description text]
Company Research Notes:
[Any additional research about the company, culture, recent news, etc.]
Application Strategy:
[Any specific positioning or emphasis you want for this application]
Personal Notes:
[Connections at company, referrals, specific interests, etc.]
```

## Script Requirements:

Please create a Python script that:

1. **Reads the comprehensive career data** from `extracted_data/Comprehensive_Resume.json`
2. **Scans the opportunities folder** for job description files
3. **For each opportunity file**:
   - Parse the job requirements and company information
   - Generate a targeted resume emphasizing relevant experience
   - Generate a customized cover letter
   - Create placeholders for missing information
4. **Output targeted documents** in `applications/[company-name]/` folder:
   - `targeted_resume_[company]_[role].md`
   - `cover_letter_[company]_[role].md`
   - `application_checklist_[company]_[role].md`

## Targeted Resume Generation Prompt:

Use this prompt with Claude API for resume generation:
```
You are creating a targeted resume for a specific job opportunity. Analyze the job description and comprehensive career data to create a focused, relevant resume.

JOB OPPORTUNITY:
Company: {company}
Role: {role}
Job Description: {job_description}
Company Research: {company_research}

COMPREHENSIVE CAREER DATA:
{comprehensive_resume_json}

TASK: Create a targeted resume that:

1. **Emphasizes most relevant experiences** for this specific role
2. **Highlights matching skills and technologies** mentioned in job description
3. **Quantifies achievements** that align with job requirements
4. **Positions career progression** to show readiness for this role
5. **Uses keywords** from job description naturally
6. **Maintains authenticity** - only includes true experiences
7. **Optimizes length** - focuses on most relevant 10-15 years unless earlier experience is highly relevant

OUTPUT FORMAT: Professional markdown resume with:
- Contact information
- Professional summary (3-4 lines targeting this role)
- Core competencies (skills matching job requirements)
- Professional experience (emphasizing relevant roles/achievements)
- Education (if relevant to role)
- Key projects (if relevant)
- Certifications (if relevant)
- [PLACEHOLDER] sections for any information that would strengthen application but isn't in career data

Include brief comments explaining positioning choices.
```

## Cover Letter Generation Prompt:

Use this prompt with Claude API for cover letter generation:

```
You are creating a targeted cover letter for a specific job opportunity. Analyze the job description and career data to create a compelling, personalized cover letter.

JOB OPPORTUNITY:
Company: {company}
Role: {role}
Job Description: {job_description}
Company Research: {company_research}
Application Strategy: {application_strategy}
Personal Notes: {personal_notes}

COMPREHENSIVE CAREER DATA:
{comprehensive_resume_json}

TASK: Create a targeted cover letter that:

1. **Opens with strong positioning** for this specific role
2. **Demonstrates company research** and genuine interest
3. **Highlights 2-3 most relevant experiences** with specific achievements
4. **Addresses key job requirements** with concrete examples
5. **Shows cultural fit** based on company research
6. **Includes call to action** and next steps
7. **Maintains professional but engaging tone**
8. **Optimizes for hiring manager perspective**

COVER LETTER STRUCTURE:
- Header with contact information
- Date and employer address [PLACEHOLDER if not provided]
- Compelling opening paragraph
- 2-3 body paragraphs with specific examples
- Strong closing with call to action
- Professional signature

Include [PLACEHOLDER] sections for:
- Hiring manager name (if not provided)
- Specific company address (if not provided)
- Any connections or referrals (if applicable)
- Salary requirements (if requested)
- Start date availability

Include brief comments explaining positioning and customization choices.
```

## Application Checklist Generation:

Create a checklist file for each application with:

```markdown
# Application Checklist: {company} - {role}

## Pre-Application:
- [ ] Research hiring manager name
- [ ] Find company address for cover letter
- [ ] Review company recent news/updates
- [ ] Check for connections on LinkedIn
- [ ] Prepare 2-3 questions for interview

## Application Materials:
- [ ] Targeted resume completed
- [ ] Cover letter customized
- [ ] Portfolio/work samples prepared (if relevant)
- [ ] References list updated
- [ ] LinkedIn profile optimized for this role

## Application Submission:
- [ ] Application deadline: {deadline}
- [ ] Preferred application method: [PLACEHOLDER]
- [ ] Follow-up timeline: [PLACEHOLDER]
- [ ] Thank you note contacts: [PLACEHOLDER]

## Placeholders to Fill:
{list_of_placeholders_found}

## Research Notes:
- Company size: [PLACEHOLDER]
- Recent company news: [PLACEHOLDER]
- Team you'd be joining: [PLACEHOLDER]
- Interview process: [PLACEHOLDER]
```

#### Script Features:
```
Batch Processing: Process multiple opportunities at once
Placeholder Tracking: List all placeholders that need manual completion
Version Control: Timestamp outputs and track changes
Resume Optimization: Different resume versions for different role types
Cover Letter Variations: Adjust tone based on company culture research
Quality Checks: Validate that key job requirements are addressed
```

#### Output Structure:
```
applications/
├── Microsoft_Senior_Engineering_Manager/
│   ├── targeted_resume_Microsoft_Senior_Engineering_Manager.md
│   ├── cover_letter_Microsoft_Senior_Engineering_Manager.md
│   └── application_checklist_Microsoft_Senior_Engineering_Manager.md
├── Google_Technical_Lead/
│   ├── targeted_resume_Google_Technical_Lead.md
│   ├── cover_letter_Google_Technical_Lead.md
│   └── application_checklist_Google_Technical_Lead.md
└── 
```


