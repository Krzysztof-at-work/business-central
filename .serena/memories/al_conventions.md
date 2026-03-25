# AL Code Style & Conventions

## File Naming
`ObjectName.ObjectType.al` — e.g. `NoSeries.Codeunit.al`, `NoSeriesLine.Table.al`, `NoSeries.Page.al`  
Page extensions: `SomeName.PageExt.al`; Table extensions: `SomeName.TableExt.al`

## Header
Every file starts with MIT license comment block:
```al
// -------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for
// license information.
// -------------------------------------------------------------------------
```

## Namespaces
Declared per module, e.g.:
- `namespace Microsoft.Foundation.NoSeries;`
- `namespace Microsoft.Finance.VAT.Group;`

## Codeunit Patterns
- **Public facade** (`Access = Public`) — thin, delegates to Impl
- **Internal implementation** (`Access = Internal`) — contains actual logic, named with ` - Impl.` suffix
- Both use `InherentEntitlements = X; InherentPermissions = X;` by default
- Explicit `Permissions = tabledata "..." = rimd;` declared on impl codeunits

## Interface Pattern
Used for extensible behavior (e.g. Digital Vouchers):
- Interface defined (`.Interface.al`)
- Multiple implementations (e.g. `VoucherAttachmentCheck.Codeunit.al`, `VoucherNoCheck.Codeunit.al`)
- Enum implementing the interface for type dispatch

## Procedures
- `procedure` = public; `local procedure` = private
- XML doc comments on all public procedures:
  ```al
  /// <summary>...</summary>
  /// <param name="Foo">...</param>
  /// <returns>...</returns>
  ```
- Overloads common for convenience (same name, different params)

## Error Labels
- Suffix `Err` for error message labels
- Always include `Comment` for translators: `Label 'Text %1...', Comment = '%1=...'`
- Error throwing delegated to error-handling codeunits (e.g. `"No. Series - Errors Impl."`)

## Region Blocks
`#region ProcedureGroupName` / `#endregion` used to group related procedures

## Features (app.json flags)
- `NoImplicitWith` — no implicit `with` record references
- `NoPromotedActionProperties` — use `ActionRef` instead of `Promoted`
- `TranslationFile` — XLIFF translation enabled
- `GenerateCaptions` — auto-generate captions

## Variables
- PascalCase naming (e.g. `NoSeriesImpl`, `WorkDate()`)
- Declared in `var` block before `begin`

## No `&&`, no `||` — use `and`, `or` (AL syntax)
