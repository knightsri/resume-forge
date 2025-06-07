# Phase 3: Quality Enhancements

Enhance the extraction script from Phases 1-2 with production-ready features:

## Script Enhancement Prompt

```
Please enhance the extraction script with the following production-ready features:

1. **Robust Error Handling**:
   - Retry failed API calls (up to 3 times with exponential backoff: 2s, 4s, 8s)
   - Handle different file encoding issues (UTF-8, Latin-1, CP1252)
   - Gracefully handle corrupted or unreadable files
   - Continue processing even if individual files fail
   - Log all errors with detailed context to error.log

2. **Progress Tracking & Monitoring**:
   - Real-time progress display (X of Y files processed)
   - Estimated time remaining based on current processing speed
   - Success/failure counts with percentages
   - Processing speed metrics (files per minute)
   - Memory usage monitoring for large batches

3. **Advanced File Format Handling**:
   - For PDF files: Extract text using PyPDF2 or pdfplumber libraries
   - For DOC files: Extract text using python-docx or mammoth libraries
   - For DOCX files: Handle complex formatting, tables, and embedded content
   - Handle password-protected files gracefully (skip with warning)
   - Support for various text encodings and international characters

4. **Enhanced Output Organization**:
   - Use single JSON file: `extracted_data/RAW_DATA.json` (consistent with workflow)
   - Create timestamped backup before each run
   - Generate processing summary report with statistics and insights
   - Separate error log with detailed failure information
   - Progress checkpoint file for ultra-reliable resuming

5. **Smart Resume Capability**:
   - Detect partially processed files and resume extraction
   - Skip files with status "completed" in RAW_DATA.json
   - Option to reprocess specific files by changing status to "pending"
   - Option to reprocess failed files only
   - Ability to add new files to existing extraction set
   - Validate existing JSON structure on startup

6. **Performance Optimizations**:
   - Configurable batch processing for large file sets
   - Parallel processing option for file reading (not API calls)
   - Memory-efficient handling of large documents
   - Smart rate limiting that adapts to API response times
   - Automatic garbage collection for memory management

7. **Configuration Management**:
   - Support for environment variables (API_KEY, API_ENDPOINT, etc.)
   - Configuration file support for processing parameters
   - Command-line arguments for common options
   - Different API models/endpoints support
   - Configurable delays and batch sizes

8. **Quality Assurance Features**:
   - Validate JSON structure before saving
   - Check for minimum required fields in extractions
   - Detect and flag potentially problematic extractions
   - Automatic backup before overwriting data
   - Data integrity checks and validation

9. **Enhanced Duplicate Detection**:
   - SHA-256 hash calculation with file size comparison
   - Similar content detection (fuzzy matching for near-duplicates)
   - Cross-format duplicate detection (same content in .txt and .docx)
   - Detailed duplicate analysis reporting
   - Option to review and manually confirm duplicates

10. **Advanced Logging & Monitoring**:
    - Structured logging with different levels (DEBUG, INFO, WARNING, ERROR)
    - Processing time tracking per file and per extraction type
    - API usage tracking (tokens used, cost estimation)
    - Performance bottleneck identification
    - Memory and disk space monitoring

## File Exclusion & Handling:
- Skip files with keywords: "INSTRUCTION", "README", "ANALYZER", "GUIDE", "LOG"
- Skip files in output directories ("extracted_data", "prompts", "opportunities", "applications", "linkedin_profiles")
- Skip previously generated files (*.json outputs)
- Robust path handling for files with spaces, parentheses, and special characters
- Unicode support for international characters in filenames
- Log excluded files with reasons for transparency

## API Integration Requirements:
- Use Claude 3.5 Sonnet model for best results
- Implement proper error codes handling (rate limits, timeouts, etc.)
- Token usage optimization and monitoring
- Automatic retry with different parameters if needed
- Graceful degradation if API is temporarily unavailable

## Output Requirements:
- Maintain compatibility with RAW_DATA.json structure from Phase 1
- Generate processing summary with statistics by document type
- Create detailed error report with actionable recommendations
- Provide performance metrics and optimization suggestions
- Include data quality assessment and recommendations

Add comprehensive error handling, make the script bulletproof for processing large document collections reliably, and ensure it can handle edge cases gracefully. Include detailed documentation and help functionality.
```

This should be the final version of the extraction script ready for production use with any size document collection.