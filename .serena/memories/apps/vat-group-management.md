# VAT Group Management — Overview

**Path:** `VAT Group Management.Source/`  
**ID:** c50a4bf0-db51-4ad2-88d5-fe2287da0eb8  
**Target:** OnPrem | **Purpose:** Enables a group of companies to consolidate VAT returns. Members submit to a representative who files the aggregated return with tax authorities.

## Concepts
- **Member company:** Submits VAT calculations to the representative via REST API
- **Representative company:** Receives submissions from all members, aggregates, and files

## Structure
```
src/
  API/         — OData pages for member submission
  Codeunits/   — Business logic
  Enums/       — VAT group enums
  Pages/       — UI pages and extensions
  Tables/      — Data model
  Permission/
```

## Tables (`src/Tables/`)
| Table | Purpose |
|---|---|
| `VATGroupApprovedMember.table.al` | List of approved member companies |
| `VATGroupCalculation.Table.al` | Calculation aggregation per member |
| `VATGroupSubmissionHeader.table.al` | Submission document header |
| `VATGroupSubmissionLine.table.al` | Submission line (per VAT entry) |
| `VATReportHeaderExtension.TableExt.al` | Extends VAT Report Header |
| `VATReportSetupExtension.TableExt.al` | Extends VAT Report Setup |
| `VATStmtRepLineExtension.TableExt.al` | Extends VAT Statement Report Line |

## Codeunits (`src/Codeunits/`)
| Codeunit | Purpose |
|---|---|
| `VATGroupCommunication` | HTTP REST communication (member→representative) |
| `VATGroupHelperFunctions` | Shared helper utilities |
| `VATGroupRetrieveFromSub` | Representative retrieves from members |
| `VATGroupSerialization` | JSON serialization of submissions |
| `VATGroupSettlement` | Settlement of approved submissions |
| `VATGroupSubmissionStatus` | Status polling |
| `VATGroupSubmitToRepresent` | Member submission workflow |
| `VATGroupSubStatusJobQueue` | Background job for status updates |
| `InstallVATGroup` | Install codeunit |
| `VATGroupUpgrade` / `VATGroupUpgradeTags` | Upgrade logic |

## Pages (`src/Pages/`)
- `VATGroupApprovedMemberList`, `VATGroupMemberCalculation`
- `VATGroupSetupGuide` — assisted setup
- `VATGroupSubmission`, `VATGroupSubmissionList`, `VATGroupSubLinesSubform`
- `VATReportsConfigurationPart`
- PageExt: extends VAT Period List, VAT Report, VAT Report List, VAT Report Setup, VAT Statement Report

## API (`src/API/`)
OData pages for submission workflow:
- `VATGroupSubmissions.page.al`, `VATGroupSubmissionLines.page.al`
- `VATGroupSubmissionStatus.query.al`

## ID Range: 4700–4720
