# Base Application — Sales & Purchases

## Sales (`Sales/` — 568 files)

### Document (118 files) — Core sales document processing
- **Sales Order:** `SalesHeader.Table.al` (shared with all sales docs), `SalesLine.Table.al`, `SalesOrder.Page.al`, `SalesOrderSubform.Page.al`
- **Sales Invoice:** `SalesInvoice.Page.al`, `SalesInvoiceSubform.Page.al`
- **Sales Credit Memo:** `SalesCrMemo.Page.al`
- **Sales Quote:** `SalesQuote.Page.al`
- **Blanket Order:** `BlanketSalesOrder.Page.al`
- **Return Order:** `SalesReturnOrder.Page.al`
- Batch posting reports for all document types
- Background check: `CheckSalesDocBackgr.Codeunit.al`

### Posting (13 files)
- `SalesPost.Codeunit.al` — main sales posting engine
- `SalesPostPrint.Codeunit.al`, `SalesPostviaJobQueue.Codeunit.al`

### History (69 files) — Posted documents
- `SalesShipmentHeader.Table.al`, `SalesShipmentLine.Table.al`
- `SalesInvoiceHeader.Table.al`, `SalesInvoiceLine.Table.al`
- `SalesCrMemoHeader.Table.al`, `SalesCrMemoLine.Table.al`
- `ReturnReceiptHeader.Table.al`, `ReturnReceiptLine.Table.al`
- Posted document pages and reports

### Customer (60 files)
- `Customer.Table.al`, `CustomerCard.Page.al`, `CustomerList.Page.al`
- Customer ledger entries, detailed customer ledger, apply entries
- `CustLedgerEntry.Table.al`, `CustomerLedgerEntries.Page.al`

### Receivables (22 files)
- Cash receipt journal, customer payment application
- Cash receipt journals sub-pages

### Reminder (108 files)
- Reminder terms, reminder levels, issue/print reminders
- Reminder headers, reminder lines, issued reminders

### FinanceCharge (36 files)
- Finance charge terms, issue finance charge memos

### Other Sales sub-areas
- **Analysis (30):** Sales analysis views and reports
- **Archive (23):** Archived sales documents
- **Pricing (30):** Sales price lists integration
- **Setup (7):** Sales & Receivables Setup
- **Reports (23):** Sales statistics reports
- **Peppol (15):** PEPPOL BIS format export

---

## Purchases (`Purchases/` — 354 files)

### Document (101 files) — Core purchase document processing
- `PurchaseHeader.Table.al`, `PurchaseLine.Table.al`
- Purchase Order, Invoice, Credit Memo, Quote, Blanket Order, Return Order pages
- Batch posting for all document types

### Posting (11 files)
- `PurchPost.Codeunit.al`, `PurchPostPrint.Codeunit.al`, `PurchPostviaJobQueue.Codeunit.al`

### History (61 files) — Posted documents
- `PurchRcptHeader.Table.al`, `PurchRcptLine.Table.al`
- `PurchInvHeader.Table.al`, `PurchInvLine.Table.al`
- `PurchCrMemoHdr.Table.al`, `PurchCrMemoLine.Table.al`
- `ReturnShipmentHeader.Table.al`, `ReturnShipmentLine.Table.al`

### Vendor (46 files)
- `Vendor.Table.al`, `VendorCard.Page.al`, `VendorList.Page.al`
- `VendorLedgerEntry.Table.al`, vendor ledger entries pages
- Detailed vendor ledger entries

### Payables (29 files)
- Payment journal, vendor payment application, suggesting payments

### Other Purchase sub-areas
- **Analysis (17):** Purchase analysis
- **Archive (24):** Archived purchase documents
- **Setup (8):** Purchases & Payables Setup
- **Vendor (46):** Vendor master data
- **Remittance (4):** Remittance advice
- **Reports (23):** Purchase reports
- **Pricing (17):** Purchase price list integration

---

## Pricing (`Pricing/` — 77 files, cross-Sales/Purchase)
- **PriceList:** `PriceListHeader.Table.al`, `PriceListLine.Table.al`, price list pages
- **Asset (price source):** Items, resources, G/L accounts as price sources
- **Calculation:** `PriceCalculationMgt.Codeunit.al`, price calculation interfaces
- **Source:** Customer, vendor, job as price sources
- **Worksheet:** Price worksheet for mass updates
- **Reports:** Price list reports
