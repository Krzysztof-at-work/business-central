# Enforced Digital Vouchers — Overview

**Path:** `Enforced Digital Vouchers.Source/`  
**ID:** e2ae191d-8829-44c3-a373-3749a2742d4e  
**Target:** Cloud | **Purpose:** Enforce that every GL register entry has a digital voucher (document attachment) attached.

## Structure
```
src/
  EntrySetup/      — Configuration tables/pages
  Implementation/  — Interface + implementations
  Extensions/      — PageExt/TableExt integrations
Permissions/
```

## EntrySetup (`src/EntrySetup/`)
| Object | Purpose |
|---|---|
| `DigitalVoucherEntryType.Enum.al` | Voucher entry types |
| `DigitalVoucherEntrySetup.Table.al` | Per-entry-type setup (check type) |
| `DigitalVoucherEntrySetup.Page.al` | Setup page |
| `DigitalVoucherSetup.Table.al` | Global digital voucher setup |
| `DigitalVoucherSetup.Page.al` | Global setup page |
| `DigitalVoucherGuide.Page.al` | Assisted setup guide |
| `VoucherEntrySourceCode.Table.al` | Maps source codes to entry types |
| `VoucherEntrySourceCodes.Page.al` | Source code mapping page |

## Implementation (`src/Implementation/`)
Interface-based pattern:
- `DigitalVoucherCheck.Interface.al` — defines `Check(...)` method
- `DigitalVoucherCheckType.Enum.al` — enum implementing the interface
- Concrete check codeunits:
  - `VoucherAttachmentCheck` — require attachment
  - `VoucherAttachOrNoteCheck` — require attachment or note
  - `VoucherNoCheck` — no check (disabled)
  - `VoucherUnknownCheck` — fallback/unknown
- `DigitalVoucherEntry.Codeunit.al` — entry point called on posting
- `DigitalVoucherFeature.Codeunit.al` — feature flag integration
- `DigitalVoucherImpl.Codeunit.al` — main orchestration
- `DigVoucherManualSubscriber.Codeunit.al` — manual posting event subscriber

## Extensions (`src/Extensions/`)
Integrates with pages via PageExt:
- GL Entries list, Purchase Order, Purchase Return Order
- Service Order, Service Invoice, Service Credit Memo, Posted Service pages
- Incoming Document attachments (Sales Order, Invoice, Credit Memo)
- `DigVoucherIncDocAttach.TableExt.al` — extends Incoming Document table

## Key Patterns
- Interface + Enum dispatch for check strategy (Strategy pattern)
- Feature flag via `DigitalVoucherFeature.Codeunit.al`
- ID range: 5579–5597
