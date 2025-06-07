# Phase 2: Add Comprehensive Extraction Logic

Now add the comprehensive extraction prompts to the script created in Phase 1. 

Please integrate TWO different extraction prompts based on document type detection:

## DOCUMENT TYPE DETECTION PROMPT:
First, analyze the document to determine its type using this prompt:

"Analyze this document and determine if it's primarily a RESUME/CV or a COVER LETTER based on structure and content.

RESUME indicators: job history sections, skills lists, education sections, structured format, bullet points with achievements
COVER LETTER indicators: addressed to specific person/company, narrative format, explains interest in specific role, persuasive tone

Content preview: {first_1000_chars}

Return only: 'RESUME' or 'COVER_LETTER'"


## COMPREHENSIVE RESUME EXTRACTION PROMPT:

For documents identified as resumes, use this extraction (captures EVERYTHING):

```
You are analyzing a RESUME/CV file to extract comprehensive career data. Your goal is to capture EVERY piece of information - err on the side of capturing MORE rather than less.

CRITICAL INSTRUCTIONS:
1. When you see "Present" in dates, interpret it as the time when this resume was written, NOT today's date
2. Extract ALL information comprehensively - do not summarize, skip, or lose ANY details
3. Include ALL variations of company names, job titles, descriptions found
4. Preserve ALL technical details, project names, achievements, and metrics exactly as written
5. Capture every technology, tool, framework, methodology mentioned
6. Include ALL education details, certifications, awards, publications
7. Note any personal branding statements, summaries, or objectives
8. Extract contact information completely - all emails, phones, addresses, social profiles
9. Preserve exact wording of achievements and accomplishments
10. Capture EVERYTHING - we will deduplicate later

RESUME CONTENT TO ANALYZE:
Filename: {filepath}
Content:
{content}

TASK: Extract and structure ALL information from this resume. Return a JSON object with this comprehensive structure:

{
  "document_type": "RESUME",
  "personal_info": {
    "names": ["all name variations found including nicknames, full names"],
    "professional_titles": ["all titles/taglines found on resume"],
    "phone_numbers": ["all phone numbers found"],
    "email_addresses": ["all email addresses found"],
    "physical_addresses": ["all addresses mentioned"],
    "locations": ["all locations/cities mentioned"],
    "linkedin_profiles": ["all LinkedIn URLs or handles"],
    "github_profiles": ["all GitHub URLs or handles"],  
    "websites": ["all personal websites, portfolios"],
    "social_media": ["Twitter, other social profiles"],
    "other_contact": [{"type": "contact_type", "value": "contact_value"}]
  },
  "professional_summary": {
    "objective_statements": ["career objectives if present"],
    "summary_statements": ["professional summaries"],
    "personal_branding": ["any branding statements or taglines"],
    "elevator_pitches": ["brief descriptions of expertise"]
  },
  "work_experiences": [
    {
      "company": "Exact company name as written",
      "company_variations": ["any alternate company names found"],
      "positions": ["all position titles for this company"],
      "employment_type": "full-time/part-time/contract/consultant/etc",
      "start_date": "start date exactly as written",
      "end_date": "end date exactly as written (including 'Present')",
      "duration": "if explicitly mentioned",
      "locations": ["all locations for this role"],
      "reporting_to": "manager/supervisor if mentioned",
      "team_size": "team size if mentioned",
      "budget_responsibility": "budget info if mentioned",
      "direct_reports": "number of direct reports if mentioned",
      "job_descriptions": ["ALL job descriptions found - capture every variation"],
      "key_responsibilities": ["all responsibilities listed"],
      "key_achievements": ["ALL achievements mentioned with exact wording"],
      "technologies_used": ["ALL technologies mentioned for this role"],
      "tools_used": ["ALL tools mentioned"],
      "methodologies": ["ALL methodologies/processes mentioned"],
      "notable_projects": ["ALL projects mentioned with descriptions"],
      "metrics_and_kpis": ["ALL quantifiable results mentioned"],
      "awards_recognition": ["any awards or recognition during this role"],
      "promotions": ["any promotions or role changes mentioned"]
    }
  ],
  "education": [
    {
      "institution": "Exact institution name",
      "institution_variations": ["any alternate names"],
      "degrees": ["ALL degrees from this institution"],
      "fields_of_study": ["ALL fields mentioned"],
      "majors": ["major subjects"],
      "minors": ["minor subjects"],
      "specializations": ["any specializations"],
      "graduation_dates": ["ALL graduation dates"],
      "attendance_dates": ["if different from graduation"],
      "locations": ["institution locations"],
      "gpa": "if mentioned",
      "honors": ["ALL honors, dean's list, etc."],
      "thesis_dissertation": "thesis/dissertation titles if mentioned",
      "relevant_coursework": ["relevant courses mentioned"],
      "academic_projects": ["academic projects described"],
      "additional_info": ["any other education details"]
    }
  ],
  "skills_comprehensive": {
    "programming_languages": ["ALL programming languages mentioned"],
    "markup_languages": ["HTML, XML, etc."],
    "technologies": ["ALL technologies mentioned"],
    "databases": ["ALL database systems"],
    "cloud_platforms": ["ALL cloud platforms"],
    "tools": ["ALL development tools"],
    "frameworks": ["ALL frameworks"],
    "libraries": ["ALL libraries mentioned"],
    "methodologies": ["ALL methodologies like Agile, Scrum"],
    "operating_systems": ["ALL OS experience"],
    "software": ["ALL software applications"],
    "hardware": ["any hardware experience"],
    "certifications_skills": ["skills mentioned in context of certifications"],
    "soft_skills": ["ALL soft skills like leadership, communication"],
    "language_skills": ["foreign languages and proficiency levels"],
    "other_skills": ["any other skills mentioned"]
  },
  "achievements_and_accomplishments": [
    {
      "achievement": "exact achievement description",
      "category": "work/academic/personal/volunteer",
      "date": "when achieved if mentioned",
      "context": "company/situation where achieved",
      "metrics": "ALL quantifiable results mentioned",
      "recognition": "any formal recognition received",
      "impact": "described impact if mentioned"
    }
  ],
  "patents_and_publications": [
    {
      "type": "patent/publication/paper/article",
      "title": "exact title",
      "patent_number": "patent number if applicable",
      "publication": "where published",
      "date": "filing/publication date",
      "description": "description if provided",
      "co_authors": ["other authors/inventors"],
      "url": "URL if provided",
      "status": "pending/granted/published"
    }
  ],
  "awards_and_honors": [
    {
      "award": "exact award title",
      "organization": "granting organization",
      "date": "date received",
      "description": "award description if provided",
      "level": "company/industry/national/international",
      "criteria": "award criteria if mentioned",
      "monetary_value": "if mentioned"
    }
  ],
  "conference_presentations": [
    {
      "title": "exact presentation title",
      "conference": "conference name",
      "location": "conference location",
      "date": "presentation date",
      "co_presenters": ["other presenters"],
      "type": "keynote/session/poster/workshop/panel",
      "description": "presentation description if provided",
      "audience_size": "if mentioned"
    }
  ],
  "certifications": [
    {
      "name": "exact certification name",
      "organization": "certifying body",
      "date_obtained": "date obtained",
      "expiration_date": "expiration date if applicable",
      "credential_id": "ID if mentioned",
      "description": "certification description",
      "related_skills": ["skills this certification covers"]
    }
  ],
  "projects": [
    {
      "name": "project name",
      "type": "personal/professional/academic/open-source",
      "description": "detailed project description",
      "technologies": ["ALL technologies used"],
      "tools": ["ALL tools used"],
      "company_context": "company if work project",
      "timeline": "project timeline",
      "duration": "project duration",
      "team_size": "if mentioned",
      "role": "your specific role",
      "achievements": "project outcomes and achievements",
      "challenges": "challenges overcome if mentioned",
      "url": "project URL if provided",
      "repository": "code repository if mentioned"
    }
  ],
  "entrepreneurship": [
    {
      "company": "company name",
      "role": "role/position (founder, co-founder, etc.)",
      "description": "what the company did",
      "industry": "industry/sector",
      "timeline": "when involved",
      "achievements": "specific achievements",
      "funding": "funding details if mentioned",
      "team_size": "team size if mentioned",
      "exit": "acquisition/IPO/closure details if mentioned",
      "technologies": ["technologies used"],
      "challenges": "challenges faced if mentioned"
    }
  ],
  "volunteer_work": [
    {
      "organization": "organization name",
      "role": "volunteer role/position",
      "description": "detailed description of what you did",
      "timeline": "when involved",
      "time_commitment": "hours per week/month if mentioned",
      "achievements": "impact and outcomes",
      "skills_used": ["skills utilized"],
      "recognition": "any recognition received"
    }
  ],
  "professional_memberships": [
    {
      "organization": "organization name",
      "membership_type": "member/board member/officer",
      "dates": "membership dates",
      "role": "specific role if applicable",
      "activities": "activities participated in"
    }
  ],
  "file_metadata": {
    "filename": "{filepath}",
    "document_type": "RESUME",
    "apparent_creation_timeframe": "estimate based on latest dates and content style",
    "target_role_focus": "what type of role this resume seems targeted for",
    "seniority_level": "entry/mid/senior/executive level based on content",
    "industry_focus": "primary industry focus",
    "format_type": "chronological/functional/combination",
    "length_assessment": "brief/standard/detailed",
    "unique_elements": "any unique sections or elements"
  }
}
```

## COMPREHENSIVE COVER LETTER EXTRACTION PROMPT:

For documents identified as cover letters, use this specialized extraction:

```
You are analyzing a COVER LETTER to extract career insights and contextual information. Your goal is to capture EVERY piece of information - err on the side of capturing MORE rather than less.

CRITICAL INSTRUCTIONS:
1. Cover letters reveal motivation, context, and storytelling around specific opportunities
2. Extract the target role/company being applied to with ALL details
3. Capture complete career narrative and positioning statements
4. Note any achievements or experiences mentioned with full context
5. Preserve the "why" behind career moves and interests
6. Extract ALL contact information, company research, and personal details
7. Capture exact quotes and phrasing used for positioning
8. Note any salary expectations, availability, or logistical details
9. Extract ALL skills, technologies, and experiences mentioned
10. Preserve complete narrative flow and argumentation

COVER LETTER CONTENT TO ANALYZE:
Filename: {filepath}
Content:
{content}

TASK: Extract and structure ALL information from this cover letter. Return a JSON object:

{
  "document_type": "COVER_LETTER",
  "target_application": {
    "company": "company being applied to",
    "company_variations": ["any alternate company names used"],
    "position": "exact position title being applied for",
    "department": "department if mentioned",
    "job_req_number": "job requisition number if mentioned",
    "application_date": "application date if mentioned",
    "deadline": "application deadline if mentioned",
    "job_posting_source": "where job was found",
    "hiring_manager": "hiring manager name if mentioned",
    "recruiter": "recruiter name if mentioned",
    "referral": "who referred you if mentioned"
  },
  "personal_info": {
    "name": "name as written in letter",
    "contact_details": ["ALL contact details mentioned"],
    "current_location": "current location if mentioned",
    "preferred_location": "preferred work location",
    "availability": "start date or availability mentioned",
    "salary_expectations": "salary range if mentioned",
    "work_preferences": "remote/hybrid/onsite preferences"
  },
  "career_positioning": {
    "opening_statement": "how the letter opens",
    "positioning_statements": ["ALL ways you position yourself"],
    "value_propositions": ["ALL value statements made"],
    "unique_selling_points": ["what makes you unique"],
    "career_summary": "brief career overview provided",
    "years_experience": "total years mentioned",
    "expertise_claims": ["areas of claimed expertise"],
    "passion_statements": ["what you're passionate about"]
  },
  "motivation_and_interest": {
    "why_this_company": ["ALL reasons given for interest in company"],
    "why_this_role": ["ALL reasons given for interest in role"],
    "company_research": ["what you know about the company"],
    "cultural_alignment": ["how you show cultural fit"],
    "mission_alignment": ["alignment with company mission/values"],
    "growth_interests": ["what you want to learn/grow into"],
    "career_goals": ["career goals mentioned"]
  },
  "experience_highlights": [
    {
      "experience_type": "job/project/achievement/education",
      "company_or_context": "where this experience happened",
      "role_or_description": "your role or what you did",
      "specific_details": "detailed description provided",
      "achievements": ["specific achievements mentioned"],
      "technologies": ["technologies mentioned"],
      "skills_demonstrated": ["skills this experience shows"],
      "relevance_explanation": "why this is relevant to target role",
      "metrics": ["any quantifiable results"],
      "timeframe": "when this happened"
    }
  ],
  "skills_and_capabilities": {
    "technical_skills": ["ALL technical skills mentioned"],
    "software_tools": ["ALL software/tools mentioned"],
    "programming_languages": ["programming languages mentioned"],
    "methodologies": ["methodologies mentioned"],
    "certifications": ["certifications mentioned"],
    "leadership_skills": ["leadership capabilities mentioned"],
    "communication_skills": ["communication abilities highlighted"],
    "problem_solving": ["problem-solving examples"],
    "industry_knowledge": ["industry expertise mentioned"],
    "soft_skills": ["ALL soft skills mentioned"]
  },
  "achievements_and_results": [
    {
      "achievement": "specific achievement described",
      "context": "where/when this was achieved",
      "impact": "impact or result described",
      "metrics": "quantifiable results if mentioned",
      "recognition": "any recognition received",
      "relevance": "why mentioned for this application",
      "timeframe": "when this occurred"
    }
  ],
  "education_mentioned": [
    {
      "institution": "school name if mentioned",
      "degree": "degree if mentioned",
      "field": "field of study",
      "relevance": "why education is relevant",
      "specific_coursework": "relevant courses mentioned",
      "projects": "academic projects mentioned"
    }
  ],
  "closing_and_next_steps": {
    "closing_statement": "how the letter concludes",
    "call_to_action": "what action you're requesting",
    "interview_availability": "interview availability mentioned",
    "follow_up_intentions": "follow-up plans mentioned",
    "additional_materials": "portfolio/references/samples mentioned",
    "contact_preferences": "preferred contact method"
  },
  "tone_and_style": {
    "overall_tone": "formal/casual/enthusiastic/professional",
    "writing_style": "concise/detailed/creative/technical",
    "personality_indicators": "personality traits that come through",
    "confidence_level": "confident/humble/assertive assessment"
  },
  "file_metadata": {
    "filename": "{filepath}",
    "document_type": "COVER_LETTER",
    "apparent_creation_timeframe": "estimate based on content and context",
    "application_context": "what type of opportunity this was for",
    "industry_context": "industry being targeted",
    "seniority_level": "level of role being pursued",
    "length_assessment": "brief/standard/detailed cover letter",
    "customization_level": "highly customized/template-based assessment"
  }
}

Return ONLY the JSON object, no other text.
```

---


Integrate both prompts into the script with automatic document type detection and ensure robust error handling for both extraction types.

The script should now be able to process documents and extract comprehensive data. We'll add production enhancements in the next prompt.