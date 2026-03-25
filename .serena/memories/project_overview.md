# Business Central — Project Overview

Microsoft Dynamics 365 Business Central source code, version **27.2** (BC 2025 Wave 1).  
Read-only reference workspace — no build/publish pipeline is set up here.  
Platform: AL language, targeting OnPrem/Cloud.

## App Dependency Chain

```
System → [no deps]
Business Foundation → System Application
Base Application → (deferred, large)
Application → System Application + Business Foundation + Base Application
_Exclude_APIV2_ → Application (via platform)
Enforced Digital Vouchers → Application (via platform, Cloud target)
VAT Group Management → Application (via platform)
```

## Apps in This Workspace

| Folder | App Name | ID | Notes |
|---|---|---|---|
| `System Application.Source/` | System Application | 63ca2fa4 | Foundation modules, no business deps |
| `Business Foundation.Source/` | Business Foundation | f3552374 | No Series, Audit Codes, Copilot |
| `Base Application.Source/` | Base Application | 437dbf0e | **Deferred — very large** |
| `Application.Source/` | Application | c1335042 | Thin meta-app, propagates dependencies |
| `_Exclude_APIV2_.Source/` | _Exclude_APIV2_ | 10cb69d9 | REST API v2 pages only |
| `Enforced Digital Vouchers.Source/` | Enforced Digital Vouchers | e2ae191d | Digital voucher compliance, Cloud |
| `VAT Group Management.Source/` | VAT Group Management | c50a4bf0 | VAT group member/representative workflow |
| `System/` | System symbols | — | Platform symbol reference (binary/xml) |

## Key Facts
- All apps published by Microsoft, open-source under MIT License
- Version placeholder `$(app_currentVersion)` used in non-fixed apps
- `internalsVisibleTo` pattern used for test app access
- Features commonly enabled: `NoImplicitWith`, `NoPromotedActionProperties`, `TranslationFile`, `GenerateCaptions`
