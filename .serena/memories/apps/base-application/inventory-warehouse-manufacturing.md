# Base Application — Inventory, Warehouse & Supply Chain

## Inventory (`Inventory/` — 909 files)

### Item (113 files) — Item master data
- `Item.Table.al`, `ItemCard.Page.al`, `ItemList.Page.al`
- Item variants, item attributes, item categories
- Item cross-references, item units of measure
- `ItemUnitOfMeasure.Table.al`, `ItemVariant.Table.al`

### Costing (86 files)
- `ValueEntry.Table.al`, `ItemLedgerEntry.Table.al`
- Adjust cost item entries: `AdjustCostItemEntries.Report.al`
- Post inventory cost to G/L
- Average cost calculation, FIFO/LIFO/Standard/Specific costing methods
- Item charges: `ItemCharge.Table.al`, item charge assignment

### Tracking (97 files)
- Serial number, lot number, package number tracking
- `ItemTrackingLines.Page.al`, `ReservationEntry.Table.al`
- Item tracking specification, lot/serial info buffers
- Expiration dates, tracking in transfers and documents

### Counting (83 files)
- Physical inventory journal, counting periods
- `PhysInvtOrderHeader.Table.al`, `PhysInvtOrderLine.Table.al`
- Posted physical inventory documents

### Analysis (81 files)
- Inventory analysis views, analysis reports
- Statistical account setup

### Availability (47 files)
- Item availability by period, location, variant, BOM level
- Available-to-promise (`ATP`) calculation

### BOM (28 files) — Assembly/Production BOM
- `BOMBuffer.Table.al`, BOM explosion pages

### Planning (29 files)
- Requisition lines, planning parameters
- Order tracking, action messages

### Requisition (36 files)
- Requisition worksheets, carry-out action messages
- `RequisitionLine.Table.al`, `RequisitionWkshName.Table.al`

### Journal (31 files)
- Item journal, output journal, consumption journal, reclassification journal
- `ItemJournalLine.Table.al`, `ItemJournalBatch.Table.al`

### Ledger (39 files)
- `ItemLedgerEntry.Table.al`, `ItemLedgerEntries.Page.al`
- Capacity ledger entries

### History (10 files)
- Posted item journals

### Other Inventory sub-areas
- **Forecast (13):** Demand forecasts
- **Intrastat (21):** Intrastat reporting for EU
- **Location (17):** `Location.Table.al`, Transfer Routes
- **MarketingText (7):** AI-generated item marketing text (Copilot)
- **Posting (7):** Item posting codeunits
- **Reconciliation (6):** Inventory reconciliation
- **Document (23):** Inventory documents (non-journal posting)
- **Setup (12):** Inventory Setup, Posting Groups

---

## Warehouse (`Warehouse/` — 354 files)

### Activity (76 files) — Warehouse picks, puts, movements
- `WarehouseActivityHeader.Table.al`, `WarehouseActivityLine.Table.al`
- Create picks/puts, register activity, zone/bin management

### Structure (41 files) — Zones, bins, bin contents
- `Zone.Table.al`, `Bin.Table.al`, `BinContent.Table.al`
- Bin templates, warehouse class

### Document (30 files) — Warehouse receipts and shipments
- `WarehouseReceiptHeader.Table.al`, `WarehouseShipmentHeader.Table.al`
- Post warehouse receipt/shipment

### InternalDocument (19 files) — Internal picks/puts
- `WhseInternalPickHeader.Table.al`, `WhseInternalPutAwayHeader.Table.al`

### InventoryDocument (18 files)
- Inventory put-ways and picks (basic WMS)

### Journal (21 files)
- Warehouse journal, physical inventory for WH
- `WarehouseJournalLine.Table.al`

### Request (25 files)
- Warehouse requests, source documents integration

### ADCS (28 files)
- Automated Data Capture System (barcode scanner integration)

### Other WH sub-areas
- **Ledger (8):** Warehouse entries
- **History (15):** Posted warehouse docs
- **CrossDock (3):** Cross-docking functionality
- **RoleCenters (13):** Warehouse Manager RC
- **Setup (19):** Warehouse setup, locations
- **Reports (12):** WH picking lists, bin lists

---

## Assembly (`Assembly/` — 109 files)
- **Document:** `AssemblyHeader.Table.al`, `AssemblyLine.Table.al`, assembly order pages
- **Posting:** `AssemblyPost.Codeunit.al`
- **History:** Posted assembly orders
- **BOM:** Assembly BOM, exploded BOM
- **Inventory:** Assembly item availability

---

## Manufacturing (`Manufacturing/` — 514 files)

### Document (88 files)
- Production orders (planned, firm planned, released, finished)
- `ProductionOrder.Table.al`, `ProdOrderLine.Table.al`, `ProdOrderComponent.Table.al`
- `ProdOrderRoutingLine.Table.al`

### ProductionBOM (32 files)
- `ProductionBOMHeader.Table.al`, `ProductionBOMLine.Table.al`
- BOM status, BOM versions, BOM where-used

### Routing (38 files)
- `RoutingHeader.Table.al`, `RoutingLine.Table.al`
- Routing link codes, routing versions

### Capacity (24 files)
- Capacity ledger entries, capacity constraints, load calculation

### WorkCenter (17 files)
- `WorkCenter.Table.al`, work center load, efficiency

### MachineCenter (11 files)
- `MachineCenter.Table.al`, machine center card

### Inventory (78 files)
- Output journal, consumption journal, flushing
- Production journal

### Planning (2 files)
- Planning components

### Finance (9 files)
- Manufacturing G/L integration

### Setup (20 files)
- Manufacturing Setup, shop calendars, calendar entries

### Reports (29 files)
- Prod. order statistics, shortage list, routing sheet, work center load

### Other MFG
- **RoleCenters (17):** Production Manager/Planner RCs
- **Warehouse (37):** Warehouse integration for production
- **Purchases (28):** Subcontracting
- **StandardCost (6):** Standard cost worksheet
- **Upgrade / Utilities:** Migration helpers
