# _Exclude_APIV2_ — Overview

**Path:** `_Exclude_APIV2_.Source/`  
**ID:** 10cb69d9-bc8a-4d27-970a-9e110e9db2a5  
**Purpose:** REST API v2 OData pages for Business Central — exposes BC entities as web services.

## Structure
```
src/
  pages/       — All APIV2 page objects (one per entity)
  codeunits/   — API helper codeunits
  Entitlements/
  permissions/
```

## Coverage (pages in `src/pages/`)
Full CRUD API for all major BC entities including:
- **Master data:** Customers, Vendors, Items, Employees, Contacts, BankAccounts, Currencies, Locations, UoM, PaymentMethods/Terms
- **Sales:** SalesOrders, SalesInvoices, SalesCreditMemos, SalesQuotes, SalesShipments (+ line sub-pages)
- **Purchase:** PurchaseOrders, PurchaseInvoices, PurchaseCreditMemos, PurchaseReceipts (+ line sub-pages)
- **Finance:** GLEntries, Journals, JournalLines, Accounts, TrialBalance, BalanceSheet, IncomeStatement, CashFlowStatement
- **Dimensions:** Dimensions, DimensionValues, DimensionSetLines, DefaultDimensions
- **Fixed Assets:** FixedAssets, FALocations
- **Jobs/Projects:** Jobs, JobQueueEntries, JobQueueLogEntries
- **Other:** Pictures, Attachments, DocumentAttachments, PDFDocument, TimeRegistrationEntries, Opportunities
- **Admin (Aut prefix):** Users, UserPermissions, PermissionSets, Extensions, ConfigPackages, ScheduledJobs, SecurityGroups

## ID Ranges
- 2145–2149, 20766, 30000–30099

## Notes
- Pages prefixed `APIV2` (e.g. `APIV2Customers`)
- Queries used for aggregates (e.g. `APIV2CustomerSales.Query.al`, `APIV2VendorPurchases.Query.al`)
- Target: OnPrem (but serves Cloud too)
