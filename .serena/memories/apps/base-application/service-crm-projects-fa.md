# Base Application — Service, CRM, Projects & Fixed Assets

## Service (`Service/` — 639 files)

### Contract (73 files) — Service contracts
- `ServiceContract.Table.al`, `ServiceContractHeader.Table.al`
- Contract invoicing, contract renewal
- Service contract templates

### Document (97 files) — Service orders, quotes, invoices
- `ServiceHeader.Table.al`, `ServiceLine.Table.al`
- Service orders, service quotes, service invoices, service credit memos

### History (46 files) — Posted service docs
- `ServiceShipmentHeader.Table.al`, `ServiceInvoiceHeader.Table.al`
- Posted service pages and reports

### Item (35 files) — Service items
- `ServiceItem.Table.al`, service item components, service BOM
- Service item warranties

### Maintenance (29 files)
- Troubleshooting, service item log, component management

### Foundation (18 files)
- Service hours, service zones, skill codes, resource skills

### Resources (20 files)
- `Resource.Table.al`, resource allocation, resource ledger
- Resource capacity, skill management

### Pricing (22 files)
- Service price groups, service price adjustment

### Other Service areas
- **Analysis (26):** Service analysis reports
- **Archive (18):** Archived service documents
- **Ledger (13):** Service ledger entries
- **Loaner (8):** Loaner items
- **Projects (19):** Service job integration
- **Posting (13):** Service posting codeunits (`ServContractPost`, `ServPost`)
- **Reports (31):** Service reports
- **RoleCenters (13):** Service Manager/Dispatcher RCs
- **Sales (25):** Service—sales integration
- **Setup (18):** Service management setup
- **Warehouse (9):** Service warehouse integration
- **Finance/CashFlow/Bank:** Service financial integration

---

## CRM (`CRM/` — 355 files)

### Contact (38 files)
- `Contact.Table.al`, `ContactCard.Page.al`, `ContactList.Page.al`
- Contact business relations, contact duplicates management

### Opportunity (30 files)
- `Opportunity.Table.al`, opportunity card, sales cycles
- `SalesCycle.Table.al`, `SalesCycleStage.Table.al`

### Interaction (36 files)
- `InteractionLogEntry.Table.al`, interaction templates
- Log interactions, create interactions

### Segment (35 files)
- `SegmentHeader.Table.al`, segment lines, logging segments
- Campaign target group management

### Campaign (11 files)
- `Campaign.Table.al`, campaign status, campaign entries

### Task (19 files)
- To-do list, task management for contacts/salespeople

### Outlook (56 files)
- Outlook add-in integration, exchange sync
- Contact/appointment sync

### BusinessRelation (21 files)
- `BusinessRelation.Table.al`, contact-company links

### Profiling (27 files)
- Contact profile questionnaires, profile answers

### Other CRM
- **Duplicates (15):** Duplicate contact detection/merging
- **Analysis (7):** CRM analysis views
- **Team (11):** Salesperson teams
- **Setup (20):** Marketing Setup
- **Reports (18):** CRM reports
- **RoleCenters (6):** Sales Manager/Relationship Manager RC

---

## Projects (`Projects/` — 330 files)

### Project (largest sub-area)
- `Job.Table.al`, `JobTask.Table.al`, `JobPlanningLine.Table.al`
- `JobJournalLine.Table.al`, job ledger entries
- WIP methods, WIP entries, post WIP to G/L
- Job quotes, project cards, sub-pages

### Resources (significant)
- `Resource.Table.al` (shared with Service), resource ledger
- `ResourceGroup.Table.al`, resource capacity
- Time sheet infrastructure

### TimeSheet
- `TimeSheetHeader.Table.al`, `TimeSheetLine.Table.al`
- Time sheet approval workflow
- Time sheet posting to jobs/absence

### RoleCenters
- Project Manager role center

---

## FixedAssets (`FixedAssets/` — 210 files)

### FixedAsset (core)
- `FixedAsset.Table.al`, `FixedAssetCard.Page.al`
- FA ledger entries, FA registers

### Depreciation (largest sub-area)
- `DepreciationBook.Table.al`, `FADepreciationBook.Table.al`
- Depreciation methods (SL, DB, SY, etc.)
- Calculate depreciation, `CalculateDepreciation.Report.al`
- FA journals, FA G/L journals, disposal

### Insurance
- `Insurance.Table.al`, insurance journals, coverage ledger

### Maintenance
- Maintenance ledger entries, maintenance registration

### Setup
- FA posting groups, FA classes, FA subclasses, FA locations

### Reports
- Fixed asset list, acquisition list, book value reports, depreciation projection

---

## HumanResources (`HumanResources/` — 115 files)

### Employee
- `Employee.Table.al`, `EmployeeCard.Page.al`, `EmployeeList.Page.al`
- Employee qualifications, relatives, confidential info, misc. articles

### Absence (significant sub-area)
- `EmployeeAbsence.Table.al`, absence registration
- Cause of absence codes, alternative addresses

### Payables
- Employee ledger entries, employee payments
- Employee payment journal

### Analysis
- HR analysis reports

### Setup
- Human resources setup

### RoleCenters
- HR Manager role center
