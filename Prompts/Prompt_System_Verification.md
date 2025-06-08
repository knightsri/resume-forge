# System Verification & Setup

Before running the career analysis system, you may need to verify that all components are properly configured and will work together seamlessly.

## Pre-Flight Checklist

### 1. File Structure Verification

Please verify and create the following folder structure:

```markdown
career-analysis/
├── CAREER_ANALYZER_INSTRUCTIONS.md
├── prompts/
│   ├── Prompt_LinkedIn_Profile_Generation.md
│   ├── Prompt_System_Verification.md
│   ├── Prompt_Targeted_Application_Generator.md
│   ├── Prompt1_Initial_Setup.md
│   ├── Prompt2_Comprehensive_Extraction.md
│   ├── Prompt3_Professional_Enhancements.md
│   ├── Prompt4_Generate_Summary.md
│   └── WebPrompt_Cleanup.md
├── extracted_data/ (will be created)
├── opportunities/ (will be created)
├── applications/ (will be created)
├── linkedin_profiles/ (will be created)
└── mydocs/
    [Your career documents - resumes, cover letters, etc.]
```

### 2. Environment Setup Verification

Check that you have:

- [ ] VSCode with Cline extension installed and working
- [ ] Python 3.8+ installed
- [ ] Claude API key available (from Anthropic console)
- [ ] Internet connectivity for API calls
- [ ] Sufficient disk space (estimate 10-50MB for outputs)

### 3. Document Preparation Check

Verify your career documents:

- [ ] All resumes and cover letters are in the main folder
- [ ] File formats are supported (.md, .txt, .doc, .docx, .pdf)
- [ ] No critical documents are missing
- [ ] Documents span your full career timeline
- [ ] Files have reasonable names (avoid special characters if possible)

### 4. Prompt File Validation

Please check each prompt file for:

#### Prompt1_Initial_Setup.md

- [ ] Contains complete script requirements
- [ ] Has proper JSON structure definition
- [ ] Includes file exclusion logic
- [ ] Specifies duplicate detection requirements

#### Prompt2_Comprehensive_Extraction.md

- [ ] Has document type detection logic
- [ ] Contains complete resume extraction JSON structure
- [ ] Contains complete cover letter extraction JSON structure
- [ ] Includes error handling requirements

#### Prompt3_Professional_Enhancements.md

- [ ] Lists all 10 enhancement categories
- [ ] Includes robust error handling requirements
- [ ] Specifies progress tracking features
- [ ] Contains file format handling instructions

#### Prompt4_Generate_Summary.md

- [ ] Has complete DETAILED_SUMMARY.json structure
- [ ] Includes comprehensive data consolidation logic
- [ ] Specifies cross-referencing requirements
- [ ] Contains data quality flagging instructions

#### WebPrompt_Cleanup.md

- [ ] Contains complete interactive session prompt
- [ ] Specifies file attachment approach
- [ ] Includes systematic cleanup methodology
- [ ] Has clear output requirements

#### Prompt_Targeted_Application_Generator.md

- [ ] Defines opportunity file format
- [ ] Contains resume generation logic
- [ ] Contains cover letter generation logic
- [ ] Includes application checklist creation

#### Prompt_LinkedIn_Profile_Generator.md

- [ ] Has LinkedIn strategy file format
- [ ] Contains complete profile generation logic
- [ ] Includes content template creation
- [ ] Specifies multiple profile variations

### 5. API Configuration Test

Before processing large batches:

- [ ] Test Claude API connection with a simple request
- [ ] Verify API key has sufficient credits/usage allowance
- [ ] Test rate limiting behavior
- [ ] Confirm API model access (Claude 3.5 Sonnet recommended)

### 6. Small-Scale Test Run

Before processing your full document set:

- [ ] Create a test folder with 2-3 sample documents
- [ ] Run Prompt1 to create initial script
- [ ] Test script with sample documents
- [ ] Verify RAW_DATA.json is created correctly
- [ ] Test Prompt4 summary generation
- [ ] Confirm all outputs are properly formatted

### 7. Markdown Formatting Check

Verify that when copying prompts to Cline:

- [ ] Code blocks (```) are properly formatted
- [ ] JSON structures are valid and complete
- [ ] No extra markdown artifacts from VSCode
- [ ] Bullet points and numbering display correctly
- [ ] Special characters don't break the prompt

### 8. Integration Points Verification

Check that the workflow connections work:

- [ ] Prompt1 → Prompt2: Script accepts extraction logic
- [ ] Prompt2 → Prompt3: Enhancements integrate properly
- [ ] Prompt3 → Prompt4: RAW_DATA.json format is compatible
- [ ] Prompt4 → Prompt5: DETAILED_SUMMARY.json uploads correctly
- [ ] WebPrompt : Clean data works for targeting
- [ ] Prompt_LinkedIn_Profile_Generation : LinkedIn profiles and templates are created correctly
- [ ] Prompt_Targeted_Application_Generation : Targetd applications are created correctly

### 9. Error Recovery Testing

Simulate potential issues:

- [ ] Test behavior when Cline hits token limits
- [ ] Verify script handles file reading errors
- [ ] Check recovery from API call failures
- [ ] Test resuming interrupted processing
- [ ] Confirm backup and logging work properly

### 10. Output Quality Verification

After test run, verify:

- [ ] Extracted data looks complete and accurate
- [ ] No obvious information loss or corruption
- [ ] Duplicate detection worked correctly
- [ ] Summary consolidation makes sense
- [ ] File organization is logical and clean

## Common Issues and Solutions

### VSCode Markdown Artifacts

- **Issue**: Extra ``` or formatting when copying
- **Solution**: Copy from raw file view or paste as plain text

### Cline Token Limits

- **Issue**: Conversation gets cut off mid-prompt
- **Solution**: Each prompt is self-contained, restart with same prompt

### API Rate Limiting

- **Issue**: Too many requests too quickly
- **Solution**: Scripts include delays, but monitor and adjust if needed

### File Path Issues

- **Issue**: Scripts can't find files with special characters
- **Solution**: Rename problematic files or update script path handling

### JSON Parsing Errors

- **Issue**: API returns malformed JSON
- **Solution**: Scripts include retry logic and error handling

### Memory Issues

- **Issue**: Large document sets cause memory problems
- **Solution**: Process in smaller batches, restart if needed

## Pre-Processing Recommendations

1. **Backup your documents** before starting
2. **Start with a small test set** (5-10 documents)
3. **Review first few extractions** to ensure quality
4. **Monitor API usage** to avoid unexpected costs
5. **Check intermediate outputs** before proceeding to next phase

## Success Criteria

System is ready when:

- ✅ All prompt files are complete and properly formatted
- ✅ Test run completes successfully on sample documents
- ✅ All output files are created in correct locations
- ✅ No critical errors in logs
- ✅ API integration works smoothly
- ✅ File format handling works for your document types

Run this verification before starting your full document processing to ensure a smooth, successful experience.
