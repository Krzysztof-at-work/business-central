# Base Application — Overview

**Path:** `Base Application.Source/`  
**ID:** 437dbf0e-84ff-417a-965d-ed2bb9650972  
**Brief:** "Base Application (DK)" — business processes for SMB/mid-market companies  
**Version:** `$(app_currentVersion)` | **Target:** OnPrem  
**Depends on:** System Application + Business Foundation  
**`propagateDependencies: true`** — consumers inherit all transitive deps

## Size
~6,000+ AL files across 25 top-level folders. Largest areas:
| Area | AL files | Topic |
|---|---|---|
| Finance | 930 | G/L, VAT, Dimensions, Intercompany, Deferral, Currency… |
| Inventory | 909 | Items, Costing, Tracking, Planning, BOM… |
| Service | 639 | Service orders, contracts, maintenance… |
| Sales | 568 | Sales orders, invoices, credit memos, reminders… |
| System | 561 | Workflow, RapidStart, DataExchange, Job Queue… |
| Manufacturing | 514 | Production orders, routing, BOM, capacity… |
| Warehouse | 354 | WMS activity, ADCS, receipts, shipments… |
| Purchases | 354 | Purchase orders, invoices, vendors… |
| CRM | 355 | Contacts, campaigns, opportunities, interactions… |
| Integration | 328 | Dataverse, D365 Sales, Field Service, PowerBI, Graph |
| Projects | 330 | Jobs, resources, timesheets |
| Modules | 270 | Foundation (comments, user tasks) + System |
| Permissions | 235 | OnPrem permission sets |
| Bank | 236 | Bank accounts, reconciliation, payment, check… |
| FixedAssets | 210 | Depreciation, insurance, maintenance… |
| HumanResources | 115 | Employees, absence, payroll analysis |
| Assembly | 109 | Assembly orders, BOM, posting |
| OtherCapabilities | 99 | Approvals, Email, Headlines, Booking, Portal |
| CostAccounting | 82 | Cost centers/types/objects, allocation, budget |
| Pricing | 77 | Price lists, assets, calculation, worksheet |
| Utilities | 69 | Miscellaneous utilities |
| CashFlow | 49 | Cash flow forecast, worksheet, accounts |
| eServices | 62 | EDI/E-Documents, Online Map |
| Invoicing | 21 | Simplified invoicing |
| FinancialMgt | 1 | VAT extended logic (very thin) |

## Key Technical Facts
- **Only `NoImplicitWith`** feature flag (unlike Business Foundation which also has `NoPromotedActionProperties`)
- ID ranges: primary 1–49999; plus several legacy ranges in 99000000s and 5000000s
- `internalsVisibleTo` includes ~25 test apps + Manufacturing, Service, BC Cloud Migration
- `resourceFolders: [".resources"]` — DataExchangeDefinitions, ExcelTemplates
