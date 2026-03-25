# Base Application — Key Patterns & Navigation Tips

## Core Document Pattern (Sales/Purchase/Service/Assembly/Manufacturing)
All documents follow the same structure:
1. **Header table** — e.g. `SalesHeader.Table.al` — holds document-level fields
2. **Line table** — e.g. `SalesLine.Table.al` — holds line-level fields  
3. **Card/Order page** — e.g. `SalesOrder.Page.al` — document editing
4. **Subform page** — e.g. `SalesOrderSubform.Page.al` — line editing subpage
5. **Post codeunit** — e.g. `SalesPost.Codeunit.al` — posting logic
6. **Posted header/line tables** — e.g. `SalesInvoiceHeader.Table.al` / `SalesInvoiceLine.Table.al`
7. **Posted document pages** — e.g. `PostedSalesInvoice.Page.al`
8. **Archive tables** — e.g. `SalesHeaderArchive.Table.al` (in Archive sub-folder)

## Posting Preview Pattern
All document types support posting preview:
- `*PostPreview.Codeunit.al` hooks into `PostingPreviewEventHandler`
- Shows `GLPostingPreview.Page.al` with drill-down subpages

## Journal + Batch Pattern
- `*JournalTemplate.Table.al` — configures journal types
- `*JournalBatch.Table.al` — named batches within a template
- `*JournalLine.Table.al` — actual journal lines
- `*Journal.Page.al` — journal editing page
- `GenJnlPost*` codeunits handle posting

## Ledger Entry Pattern
Posted entries always have:
- `*LedgerEntry.Table.al` or `*Entry.Table.al`
- `*LedgerEntries.Page.al` — list page
- `*EntriesPreview.Page.al` — posting preview view
- Entry number = auto-incremented integer

## Setup Pattern
- Main setup: `*Setup.Table.al` + `*Setup.Page.al`
- Posting groups: `Gen*PostingGroup.Table.al` + `*PostingSetup.Table.al`

## Codeunit Access Pattern
In Base App, codeunits generally do NOT use the `Access = Public/Internal` split as strictly as System Application — most are implicitly public.

## Enum Usage
- Shared enums live in `Foundation/Enums/`
- Document-specific enums live alongside their objects
- Enums implement interfaces for extensibility (e.g. Pricing, Digital Vouchers)

## Report Selection
Document sending profiles and report selections managed via:
- `ReportSelections.Table.al` (in `Foundation/Reporting/`)
- `DocumentSendingProfile.Table.al`

## Key Cross-Cutting Tables (used everywhere)
| Table | Purpose |
|---|---|
| `GeneralLedgerSetup` | G/L configuration, currency, rounding |
| `SalesReceivablesSetup` | Sales configuration |
| `PurchasesPayablesSetup` | Purchases configuration |
| `InventorySetup` | Inventory configuration |
| `ManufacturingSetup` | Manufacturing configuration |
| `ServiceMgtSetup` | Service configuration |
| `GLSetup` | (alias for GeneralLedgerSetup) |
| `CompanyInformation` | Address, VAT no., etc. |
| `Currency` | Currency codes and exchange rates |
| `NoSeries` / `NoSeriesLine` | Document numbering |
| `DimensionValue` | Dimension codes |
| `PostCode` | Postal code validation |
| `ShippingAgent` | Shipping agent codes |

## Finding Objects Quickly
- Tables: search `*.Table.al` in relevant sub-folder
- Pages: search `*.Page.al` or `*.PageExt.al`
- Codeunits: search `*.Codeunit.al`
- Reports: search `*.Report.al`
- Enums: search `*.Enum.al`
- Interfaces: search `*.Interface.al`

## Namespace Convention in Base App
Base App uses `Microsoft.*` namespaces:
- `Microsoft.Finance.GeneralLedger.*`
- `Microsoft.Sales.Document.*`
- `Microsoft.Inventory.Item.*`
- `Microsoft.Manufacturing.Document.*`
etc. (mirrors folder hierarchy)
