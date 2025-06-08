# Phase 1: Initial Extraction Script Setup

We have a collection of mixed career documents including BOTH resumes AND cover letters in various formats (.md, .txt, .doc, .docx, .pdf). These documents span my entire career and provide different perspectives on my career:

- **Resumes**: Structured career data, skills, achievements
- **Cover letters**: Context, motivations, specific opportunity focus, storytelling 

I want to extract ALL information from each unique file (eliminating duplicates upfront) and store it in a single JSON file for easy management and resumability.

Please create a Python script that:

1. **Scans the current directory** for career documents (*.md,*.txt, *.doc,*.docx, *.pdf)
   - **EXCLUDE** files containing "INSTRUCTION", "README", "ANALYZER", or "GUIDE" in filename
   - **EXCLUDE** any files in "extracted_data" or "prompts" folders
2. **Eliminates duplicate files upfront** using SHA-256 hash comparison
   - Calculate hash for each file's content (not filename)
   - Skip duplicate files and log them as "duplicate of [original_filename]"
   - Only process unique files to save API costs and time
3. **Uses a single consolidated JSON file** (`extracted_data/RAW_DATA.json`) to store all data
4. **Identifies document type** (resume vs cover letter) automatically based on content analysis
5. **Processes each unique file individually** using Claude API calls with type-specific prompts
6. **Tracks progress in the JSON file** - skips already processed files on restart
7. **Handles different file formats** and complex filenames (spaces, parentheses, unicode)
8. **Rate limits** API calls (1-2 second delays between requests)
9. **Provides detailed logging** of progress, duplicates found, and any errors
10. **Uses environment variable or file** for API key management

JSON Structure for RAW_DATA.json:

```json
{
  "metadata": {
    "created": "timestamp",
    "last_updated": "timestamp", 
    "total_files_found": 120,
    "duplicate_files_found": 15,
    "unique_files_to_process": 105,
    "files_completed": 85,
    "files_failed": 0,
    "processing_statistics": {
      "resumes": 65,
      "cover_letters": 20,
      "errors": 0
    }
  },
  "file_hashes": {
    "sha256_hash_1": {
      "primary_file": "Resume_v1.docx",
      "duplicate_files": ["Resume_copy.docx", "Resume_backup.docx"],
      "file_size": 12345,
      "status": "completed",
      "processed_date": "timestamp",
      "document_type": "RESUME"
    }
  },
  "extractions": {
    "Resume_v1.docx": {
      "hash": "sha256_hash_1",
      "status": "completed",
      "processed_date": "timestamp",
      "document_type": "RESUME",
      "processing_time_seconds": 12.5,
      "extraction_data": {...}
    }
  }
}
```

Create a robust script that can handle your collection of mixed career documents efficiently, eliminate duplicates automatically, and provide comprehensive progress tracking.

Focus on the basic structure and file handling first. We'll add the extraction logic in the next prompt.
