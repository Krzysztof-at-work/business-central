# Task Completion Checklist

When completing a coding task in this project:

1. **Verify AL syntax** — ensure no implicit `with` (feature `NoImplicitWith` is active in most apps)
2. **Check namespace** — new objects must use the correct namespace for their app/module
3. **Access modifier** — public façade codeunits use `Access = Public`; implementation codeunits use `Access = Internal`
4. **XML doc comments** — all public procedures need `/// <summary>` comments
5. **Label Comments** — all labels with placeholders must have `Comment = '%1=...'` for translators
6. **Permissions** — impl codeunits must declare explicit `Permissions = tabledata ...` for table access
7. **ID range** — new objects must use an ID within the app's reserved range (see `app.json`)
8. **File naming** — follow `ObjectName.ObjectType.al` convention
9. **No promoted actions** — use `ActionRef` pattern (feature `NoPromotedActionProperties` active)
10. **Run AL Build** — compile via VS Code AL extension to catch errors (requires BC server connection)

## Base Application
Base Application onboarding is **deferred** — do not make assumptions about its internal structure without exploring first.
