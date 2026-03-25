# System Application — Overview

**Path:** `System Application.Source/`  
**ID:** 63ca2fa4-4f03-4f2b-a480-172fef340d3f  
**Version:** 27.2 | **Dependencies:** none (platform only)  
**Purpose:** Foundation library of reusable, technology-focused modules — no business logic.

## Module List (each in its own subfolder)

| Module | Purpose |
|---|---|
| ActivityLog | Log user/system activities |
| Advanced Settings | Settings page extension hook |
| Agent / AI | Copilot/AI agent infrastructure, MCP integration |
| Azure AD Graph/Licensing/Plan/Tenant/User/User Management | Entra ID integration |
| Azure Blob/File Services API | Azure Storage client |
| Azure Function | HTTP-based Azure Function calls |
| Azure Key Vault | Secret retrieval from AKV |
| Azure Storage Services Authorization | SAS/SharedKey auth |
| Barcode | Barcode generation |
| Base64 Convert | Encode/decode Base64 |
| BLOB Storage | In-memory BLOB handling |
| Business Chart | Chart control infrastructure |
| Camera and Media Interaction | Device camera/media access |
| Caption Class | Dynamic caption resolution |
| Client Type Management | Detect client type (Web/Desktop/etc.) |
| Confirm Management | Confirm dialog abstraction |
| Cryptography Management | Hashing, encryption, X.509 cert support |
| Cues and KPIs | Role center cue setup |
| Customer Experience Survey | NPS/survey integration |
| Data Administration / Archive / Classification / Compression | Data lifecycle tools |
| Date and Time / Date-Time Dialog | Date/time utilities |
| Default Role Center | Role center assignment logic |
| Device | Mobile device capabilities |
| Document Sharing | OneDrive/SharePoint doc sharing |
| Edit in Excel | Excel buffer and export |
| Email | Email sending infrastructure with connectors |
| Encoding | Text encoding utilities |
| Entity Text / Copilot | AI-generated entity descriptions |
| Environment Cleanup / Information | Env detection, cleanup hooks |
| Extension Management | Install/uninstall/upgrade hooks |
| Feature Configuration / Feature Key | Feature flags |
| Field Selection | Generic field picker page |
| Filter Tokens | Filter expression tokenisation |
| Geolocation | Device GPS access |
| Guided Experience | Setup wizards / checklists |
| Headlines | Role center headline generation |
| Image | Image resize/compress utilities |
| Json | JSON parsing helpers |
| Language | Language code utilities |
| Math | Math functions |
| MCP | Model Context Protocol server integration |
| Microsoft User Feedback | In-product feedback |
| MicrosoftGraph | Graph API client |
| Navigation Bar Subscribers | Navigation bar customization |
| OAuth / OAuth2 | OAuth authentication flows |
| Object Selection | Generic object picker |
| Page Action Provider / Page Summary Provider | Page insights infrastructure |
| Password | Password field and policy |
| Pdf | PDF rendering |
| Performance Profiler | AL profiler integration |
| Permission Sets / Permissions | Permission set management UI |
| Printer Management | Printer selection and routing |
| Privacy Notice | GDPR privacy notice framework |
| Record Link Management / Reference / Selection | Record linking utilities |
| Recurrence Schedule | Recurring job schedule |
| Regex | Regular expression utilities |
| Rest Client | Generic HTTP REST client |
| Retention Policy | Data retention rule engine |
| Satisfaction Survey | CSAT survey prompts |
| Secrets | Secret provider abstraction |
| Security Groups | Windows/AAD security group sync |
| Server Settings | Read server configuration |
| SharePoint / SharePoint Authorization | SharePoint API client |
| SmartList Designer Subscribers | SmartList hooks |
| System Initialization | Startup/initialization subscriber |
| System Permissions | Built-in permission sets |
| Table Information / Table Keys | Table metadata utilities |
| Telemetry | Application Insights telemetry publisher |
| Tenant License State | License validation |
| Time Zone Selection | Time zone picker |
| Translation | Translation management |
| Upgrade Tags | Track upgrade execution per version |
| URI | URI parsing/building |
| User Details / Login Times / Permissions / Selection / Settings | User management UI |
| Video | Embedded video player |
| VS Code Integration | Dev tooling hooks |
| Web Service Management | Web service publishing |
| Word Templates | Word document generation |
| XML Validation | XSD schema validation |
| XmlWriter | XML writing utilities |

## Patterns
- Each module is self-contained with its own `app.json`, `src/`, `Permissions/`
- Public API codeunits expose facades; implementation hidden via `Access = Internal`
- `internalsVisibleTo` grants test projects access to internals
