# Base Application — System, Integration & Foundation

## System (`System/` — 561 files)

### Workflow (97 files) — largest System sub-area
- `WorkflowStepArgument.Table.al`, `WorkflowRule.Table.al`
- Workflow templates, workflow event/response library
- Approval workflow (purchase, sales, payment), approval users setup
- Workflow notification, workflow step instances

### RapidStart (90 files)
- Configuration packages, configuration templates
- `ConfigPackage.Table.al`, `ConfigPackageRecord.Table.al`
- Import/export via Excel, data migration wizard

### DataExchange (81 files)
- Data exchange framework for file-based integration
- `DataExchDef.Table.al`, `DataExchMapping.Table.al`
- Handles bank statement import, SEPA, payment export, EDI
- XML/CSV/fixed-width reading/writing

### ChangeLog (24 files)
- `ChangeLogEntry.Table.al`, change log setup
- Monitor field changes on any table

### DataMigration (25 files)
- Cloud migration framework, migration dashboard
- Extension-based migration hooks

### DevTools (24 files)
- Permission recorder, plan configuration tools

### Notifications (19 files)
- In-page notifications, my notifications setup
- `MyNotifications.Table.al`

### GenericChart (19 files)
- Chart definition framework, chart customisation

### User (13 files)
- User setup, user time registers
- `UserSetup.Table.al`

### SecurityGroups (9 files)
- Security group synchronization

### API (18 files)
- Internal API helper codeunits

### Other System sub-areas
- **AI (23):** AI function calling, copilot integration
- **AadApplication (5):** Azure AD registered apps
- **AnalysisView (7):** Analysis view management
- **JobQueue (4):** Job queue entries (thin, delegates to System App)
- **ErrorMessage (3):** Error message framework
- **Exchange (6):** Exchange sync setup
- **IsolatedStorage (6):** Isolated storage management
- **OAuth (4):** OAuth setup for integrations
- **OData (9):** OData query helpers
- **OnboardingSignal (1):** Onboarding events
- **Privacy (3):** Privacy notice hooks
- **RetentionPolicy (4):** Base App retention policy registrations
- **XML (8):** XML helper codeunits
- **Text (2):** Text utilities
- **Telemetry (1):** Telemetry publisher hooks
- **Utilities (1):** Misc system utils
- **UserGroups (6):** Legacy user group management
- **PlanConfiguration (2):** License plan configuration
- **Security (1):** Security-related utilities

---

## Integration (`Integration/` — 328 files)

### D365Sales (92 files) — largest integration area
- Dynamics 365 Sales connector
- `CRMConnectionSetup.Table.al`, synchronisation jobs
- Entity mapping: CRM Account↔Customer, CRM Opportunity↔Opportunity, etc.

### Dataverse (63 files)
- Microsoft Dataverse (Power Platform) integration
- `CDSConnectionSetup.Table.al`
- Virtual tables, environment connection

### SynchEngine (37 files)
- The core integration synchronisation engine
- `IntegrationRecord.Table.al`, `IntegrationSynchJob.Table.al`
- Coupling records, conflict resolution

### Entity (44 files)
- Integration entities for BC objects (customers, items, contacts, resources…)

### Graph (37 files)
- Microsoft Graph integration (contacts, events)

### PowerBI (33 files)
- Power BI setup, report embedding
- `PowerBIReportConfiguration.Table.al`

### FieldService (22 files)
- Dynamics 365 Field Service connector

---

## Foundation (`Foundation/` — 207 files)
Shared base objects used across the whole app.

### Key sub-areas
| Sub-area | Content |
|---|---|
| Address | Country/region, post codes, address formats |
| AuditCodes | Source codes, reason codes (extends Business Foundation AuditCodes) |
| BatchProcessing | Background batch posting parameters |
| Calendar | Base calendar, working days, customised calendars |
| Company | Company information, company-level setup |
| Enums (25 files) | Shared enums: AnalysisAmountType, FlushingMethod, NavigateAfterPosting, PostingDate defaults, etc. |
| ExtendedText | Extended text lines for items, G/L accounts, resources |
| Navigate | Navigate page (find all related entries for a document) |
| NoSeries | Base App wrapper over Business Foundation No. Series |
| PaymentTerms | Payment terms, payment discount setup |
| Period | Accounting periods, fiscal year management |
| Reporting | Report selection setup, document sending profiles |
| Shipping | Shipping agents, shipping methods |
| UOM | Base UOM definitions |
| Attachment | Incoming document attachments, document attachment framework |

---

## OtherCapabilities (`OtherCapabilities/` — 99 files)
| Sub-area | Content |
|---|---|
| Approvals (19) | Generic approval request management, approval comments |
| Email (11) | Email merge setup, document sending via email |
| Headlines (13) | Role center headlines calculation |
| AccountantPortal (10) | Accountant Portal integration |
| Booking (13) | Microsoft Bookings integration |
| RetentionPolicy (7) | Retention policy configuration for BC tables |
| Telemetry (1) | Business telemetry hooks |

---

## Modules (`Modules/` — 270 files)
### Foundation (20 files)
- `CommentLine.Table.al`, `CommentSheet.Page.al` — Generic comment lines used by almost all documents
- `UserTask.Table.al`, User Task Group — My User Tasks management

### System (250 files)
- Platform-level system objects and utilities used internally
