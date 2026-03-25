# Business Foundation — Overview

**Path:** `Business Foundation.Source/`  
**ID:** f3552374-a1f2-4356-848e-196002525837  
**Version:** 27.2 | **Depends on:** System Application  
**Purpose:** Low-level business foundation modules — building blocks for business apps.

## Modules

### AuditCodes (`AuditCodes/src/`)
Source code audit trail infrastructure:
- `SourceCode.Table.al` / `SourceCodes.Page.al` / `SourceCodeSetup.Table.al` / `SourceCodeSetup.Page.al`
- `ReasonCode.Table.al` / `ReasonCodes.Page.al`
- `ReturnReason.Table.al` / `ReturnReasons.Page.al`
- `Legacy/` — backward-compat code

### NoSeries (`NoSeries/src/`)
Number Series engine — generates sequential numbers for documents, entries, etc.
- `Single/` — real-time number retrieval (`No. Series`, `No. Series - Impl.`, Batch)
- `Batch/` — buffered/batch number requests
- `GlobalNoSeries/` — cross-company/global series
- `Setup/` — configuration and setup pages
- `Legacy/` — legacy code path
- `Upgrade/` — data upgrade codeunits
- Public facade: `"No. Series"` (Access = Public) → delegates to `"No. Series - Impl."` (Access = Internal)
- Namespace: `Microsoft.Foundation.NoSeries`

### NoSeriesCopilot (`NoSeriesCopilot/src/`)
AI-powered No. Series suggestions using Copilot:
- `Copilot/` — prompt engineering, suggestion generation
- `Register/` — Copilot feature registration
- `Upgrade/` — upgrade hooks

## Key Patterns
- Features: `NoImplicitWith`, `NoPromotedActionProperties`, `TranslationFile`, `GenerateCaptions`
- ID ranges: 1–9999 and 12145–12146
