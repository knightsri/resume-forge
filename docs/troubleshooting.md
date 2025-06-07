# 🔧 Troubleshooting Guide

This guide covers common issues you might encounter while using Resume Forge and how to resolve them.

## 🚨 Common Setup Issues

### VSCode and Cline Issues

#### Cline Extension Not Found
1. Open VSCode Extensions (Ctrl+Shift+X)
2. Search for "Cline" or "claude-dev"
3. Install by Saoud Rizwan
4. Restart VSCode
5. Open Command Palette (Ctrl+Shift+P) → "Cline: Open"

#### Cline Not Responding
- Check internet connection
- Verify API key has credits
- Restart VSCode
- Start new Cline conversation
- Check VSCode Output panel for errors

#### "Claude API Unavailable"
- Check [Anthropic Status Page](https://status.anthropic.com/)
- Wait a few minutes and retry
- Verify your API key is active
- Check if you've hit rate limits

### File and Directory Issues

#### "No Documents Found"
```bash
# Check current directory
pwd
ls -la *.pdf *.docx *.doc *.txt *.md

# Ensure documents are in project root, not subfolders
# Move files if needed
mv documents/*.pdf .
mv documents/*.docx .
```

#### "Permission Denied" Errors
```bash
# Fix script permissions
chmod +x setup.sh
chmod +x init-git.sh

# Fix directory permissions
chmod 755 extracted_data/
chmod 755 opportunities/
```

#### "File Encoding Issues"
- Save files as UTF-8 encoding
- Avoid special characters in filenames
- Check for hidden characters or BOM markers

## 🤖 AI Processing Issues

### Token Limit Errors

#### "Context Length Exceeded"
**Solution 1: Use Simplified Extraction**
```markdown
# Replace Prompt2 with simplified version
# Focus on essential data only:
- Basic personal info
- Work history (company, role, dates)
- Core skills (top 10-15)
- Major achievements (3-5 per role)
```

**Solution 2: Process in Batches**
```bash
# Move files to separate folders
mkdir batch1 batch2 batch3
mv *.pdf batch1/
mv *.docx batch2/
# Process each batch separately
```

**Solution 3: Use Chunked Processing**
- Use Prompt2A for basic extraction
- Use Prompt2B for enhanced details
- Combine results with Prompt4

#### "Output Truncated"
- Start new Cline conversation
- Use "Continue from where you left off" prompt
- Break complex prompts into smaller pieces
- Process fewer files at once

### Data Quality Issues

#### "Duplicate Information Extracted"
This is expected! The cleanup phase (Prompt5) handles deduplication:
- Upload DETAILED_SUMMARY.json to Claude web
- Use interactive cleanup to resolve duplicates
- Make decisions about which version to keep

#### "Missing Information"
- Check if files were processed (look in RAW_DATA.json)
- Verify file formats are supported
- Check for password-protected files
- Try re-processing specific files

#### "Incorrect Document Classification"
```markdown
# Manually specify document type in Prompt2:
# Add this override to the extraction prompt:
"Override document type detection: This file is a RESUME"
# or
"Override document type detection: This file is a COVER_LETTER"
```

## 📄 File Processing Issues

### PDF Problems

#### "Cannot Extract Text from PDF"
```bash
# Install PDF processing libraries
pip install PyPDF2 pdfplumber

# For image-based PDFs, use OCR tools:
pip install pytesseract
# Note: Requires tesseract-ocr system installation
```

#### "Password-Protected PDF"
- Remove password protection manually
- Use PDF tools to unlock: `qpdf --password=PASSWORD input.pdf output.pdf`
- Skip these files and note in processing log

### Word Document Issues

#### "Cannot Read .docx Files"
```bash
# Install document processing libraries
pip install python-docx mammoth

# Convert manually if needed:
# Open in Word → Save As → Plain Text (.txt)
```

#### "Formatting Lost in Extraction"
- This is expected - focus on content, not formatting
- Visual formatting will be recreated in final output
- Check if content was extracted correctly in RAW_DATA.json

### Large File Issues

#### "File Too Large"
- Split large documents into smaller sections
- Extract text manually and save as .txt
- Use document compression tools
- Process large files separately

#### "Out of Memory"
```bash
# Process in smaller batches
# Restart Python/Cline between large files
# Monitor system memory usage
# Close other applications while processing
```

## 🔄 Workflow Issues

### Resume Processing Stuck

#### "Script Stops Responding"
1. Check for error messages in console
2. Look for infinite loops in file processing
3. Restart Cline conversation
4. Use simpler prompts for problematic files

#### "Processing Takes Too Long"
- Reduce batch size
- Use simplified extraction prompts
- Skip problematic files temporarily
- Monitor API rate limits

### Interactive Cleanup Problems

#### "Claude Web Session Expires"
- Save progress frequently
- Break cleanup into multiple sessions
- Copy important decisions to notes
- Resume with partial DETAILED_SUMMARY.json

#### "File Upload Fails"
- Check file size (Claude has upload limits)
- Compress JSON file if very large
- Split into smaller sections if needed
- Try different browser/clear cache

### Output Generation Issues

#### "Generated Resume Looks Wrong"
- Review Comprehensive_Resume.json for data quality
- Check if cleanup session completed properly
- Verify job description formatting in opportunity files
- Regenerate with updated targeting

#### "Cover Letter Too Generic"
- Add more company research to opportunity files
- Include specific job requirements in opportunity file
- Use more detailed application strategy
- Run cleanup session again for better positioning

## 🛠️ Advanced Troubleshooting

### Debug Mode

#### Enable Detailed Logging
```python
# Add to any Python scripts:
import logging
logging.basicConfig(level=logging.DEBUG)

# For API calls:
print(f"API Request: {request_data}")
print(f"API Response: {response_data}")
```

#### Check API Usage
```bash
# Monitor API calls and costs
# Add to extraction script:
echo "API call count: $call_count"
echo "Estimated cost: $estimated_cost"
```

### Performance Optimization

#### Speed Up Processing
- Use faster API model if available
- Reduce extraction detail level
- Process files in parallel (file reading only)
- Cache API responses for retries

#### Reduce Costs
- Use simplified extraction prompts
- Process fewer files at once
- Remove duplicate files before processing
- Use shorter prompts when possible

### Recovery Procedures

#### Corrupt RAW_DATA.json
```bash
# Backup existing file
cp extracted_data/RAW_DATA.json extracted_data/RAW_DATA_backup.json

# Try to fix JSON syntax
# Use online JSON validators
# Restore from backup if needed
```

#### Lost Progress
```bash
# Check for backup files
ls -la extracted_data/*.json
ls -la *.log

# Resume from last good state
# Re-run from specific prompt number
# Use checkpoint files if available
```

#### System Crash During Processing
```bash
# Check for partial outputs
ls -la extracted_data/
grep "completed" extracted_data/RAW_DATA.json

# Resume processing:
# Script should skip completed files automatically
# Verify with system verification (Prompt0)
```

## 🆘 Getting Help

### Before Asking for Help

1. **Check this troubleshooting guide** for your specific issue
2. **Search [GitHub Issues](https://github.com/knightsri/resume-forge/issues)** for similar problems
3. **Try the suggested solutions** and note which ones you've attempted
4. **Gather information** about your setup and error messages

### Information to Include

When reporting issues, include:

#### System Information
```bash
# Operating system and version
uname -a  # Linux/Mac
# or check Windows version

# Python version
python3 --version

# VSCode version
code --version

# Git version
git --version
```

#### Error Details
- Exact error message (copy/paste)
- Which prompt/step was running
- Number and types of files being processed
- Screenshot of error if helpful

#### File Information
```bash
# Number and types of documents
ls -la *.pdf *.docx *.doc *.txt *.md | wc -l
ls -la *.pdf | wc -l  # PDF count
ls -la *.docx | wc -l # Word count
```

#### Processing State
```bash
# Check what was completed
grep -c "completed" extracted_data/RAW_DATA.json
ls -la extracted_data/
```

### Where to Get Help

1. **[GitHub Issues](https://github.com/knightsri/resume-forge/issues)** - Bug reports and technical issues
2. **[GitHub Discussions](https://github.com/knightsri/resume-forge/discussions)** - Questions and community help
3. **[README.md](../README.md)** - General information and quick start
4. **[Getting Started Guide](getting-started.md)** - Detailed setup instructions

### Community Support

- **Share solutions** if you solve a problem others might face
- **Help newcomers** by answering questions in Issues and Discussions
- **Contribute fixes** via pull requests
- **Improve documentation** based on your experience

## 📊 Monitoring and Maintenance

### Regular Maintenance

#### Keep System Updated
```bash
# Update Cline extension in VSCode
# Check for Resume Forge updates
git pull origin main

# Update Python dependencies if using scripts
pip install --upgrade -r requirements.txt
```

#### Clean Up Old Files
```bash
# Remove old backup files
find . -name "*.backup" -mtime +30 -delete

# Clean up temporary files
rm -f *.tmp *.log

# Archive old extractions
mkdir archive/
mv extracted_data/old_*.json archive/
```

### Performance Monitoring

#### Track Processing Times
- Note how long each phase takes
- Monitor API response times
- Track file processing rates
- Document optimal batch sizes

#### Cost Monitoring
- Track API usage and costs
- Monitor token consumption
- Optimize prompts for efficiency
- Use cost-effective processing strategies

---

**Still having issues?** Don't hesitate to [open an issue](https://github.com/knightsri/resume-forge/issues) with detailed information about your problem. The community is here to help! 🤝