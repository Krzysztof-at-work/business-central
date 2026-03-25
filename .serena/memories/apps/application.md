# Application (meta-app) — Overview

**Path:** `Application.Source/`  
**ID:** c1335042-3002-4257-bf8a-75c898ccb1b8  
**Purpose:** Thin "meta-app" that bundles System Application + Business Foundation + Base Application as a single deployable package.

## Key Facts
- `"propagateDependencies": true` — consumers automatically inherit all transitive dependencies
- Contains almost no AL source itself — primarily `app.json` + translations
- Used as the single deploy target for a full BC installation
- ID range: 1–1 (minimal, almost no own objects)
- Features: `NoImplicitWith`, `NoPromotedActionProperties`, `TranslationFile`, `GenerateCaptions`

## Dependencies
1. System Application (63ca2fa4)
2. Business Foundation (f3552374)
3. Base Application (437dbf0e)
