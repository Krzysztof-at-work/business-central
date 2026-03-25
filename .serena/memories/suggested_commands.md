# Suggested Commands

## AL Development (VS Code + AL Language Extension)

This is a **read-only reference workspace** — no active BC server is configured here.
Commands below apply when working with the source.

## File System (Windows PowerShell)
```powershell
# List files in an app
Get-ChildItem "System Application.Source" -Recurse -Filter "*.al" | Select-Object FullName

# Search for a symbol/text across all apps
Select-String -Path "**\*.al" -Pattern "procedure GetNextNo" -Recurse

# Count AL files per app
Get-ChildItem ".\*.Source" -Directory | ForEach-Object { $d = $_; $c = (Get-ChildItem $d -Recurse -Filter "*.al").Count; "$($d.Name): $c" }

# Find all codeunits with a specific access modifier
Select-String -Path "**\*.al" -Pattern "Access = Public" -Recurse | Select-Object -ExpandProperty Path
```

## Serena Project
```
Project path: C:/Development/AL/Standard/Business Central
.serena/ location: C:/Development/AL/Standard/Business Central/.serena
MCP config: common/.vscode/mcp.json
```

## AL Lint / Compile
AL compilation happens via the AL Language VS Code extension (`ms-dynamics-smb.al`).
Use `Ctrl+Shift+P → AL: Build` or the AL build task if a `launch.json` / server is configured.
No standalone CLI build available without a BC server connection.

## No. Series / Object IDs
Each app has reserved ID ranges in `app.json`. Check before creating new objects.
