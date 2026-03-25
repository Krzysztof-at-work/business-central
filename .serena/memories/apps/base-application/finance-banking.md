# Base Application — Finance & Banking

## Finance (`Finance/` — 930 AL files)

### GeneralLedger (168 files)
Core G/L engine:
- **G/L Account:** `GLAccount.Table.al`, `GLAccountCard.Page.al`, `ChartofAccounts.Page.al`
- **G/L Account Categories:** `GLAccountCategory.Table.al`, `GLAccountCategories.Page.al`, `GLAccountCategoryMgt.Codeunit.al`
- **Budget:** `GLBudgetName.Table.al`, `GLBudgetEntry.Table.al`, `GLBudgetEntries.Page.al`, `GLBudgetOpen.Codeunit.al`; import/export via Excel
- **General Journals:** `GenJournalLine.Table.al`, `GenJournalBatch.Table.al`, `GenJournalTemplate.Table.al`, `GeneralJournal.Page.al`; journal posting: `GenJnlPost.Codeunit.al`, `GenJnlPostBatch.Codeunit.al`, `GenJnlPostLine.Codeunit.al`
- **G/L Entries:** `GLEntry.Table.al`, `GeneralLedgerEntries.Page.al`, `GLRegister.Table.al`
- **Posting Preview:** `GLPostingPreview.Page.al`, `GenJnlPostPreview.Codeunit.al`, `PostingPreviewEventHandler.Codeunit.al`
- **Reversal:** `ReversalEntry.Table.al`, `GenJnlPostReverse.Codeunit.al`
- **Setup:** `GeneralLedgerSetup.Table.al`, `GeneralPostingSetup.Table.al`, `GenBusinessPostingGroup.Table.al`, `GenProductPostingGroup.Table.al`
- **Reports:** Trial Balance, Detail Trial Balance, Closing Trial Balance, Budget, G/L Register, Chart of Accounts, Fiscal Year Balance
- **Standard Journals:** `StandardGeneralJournal.Table.al`, recurring journal support
- **Error checking:** `CheckGenJnlLineBackgr.Codeunit.al`, `JournalErrorsMgt.Codeunit.al`

### VAT (158 files)
- VAT entries, VAT return, VAT statement, EC sales list, VAT registration number validation
- Reverse charge, unrealized VAT, VAT reporting

### Dimension (100 files)
- `Dimension.Table.al`, `DimensionValue.Table.al`, dimension set entries
- Default dimensions, dimension combinations, analysis views

### Intercompany (148 files)
- IC partners, IC transactions, IC inbox/outbox journals

### Deferral (27 files)
- Deferral templates, deferral schedules, posting

### Currency (39 files)
- Currency table, exchange rates, adjustment

### Analysis (49 files)
- Account Schedules / Financial Reports: `FinancialReport.Table.al`, `AccScheduleLine.Table.al`

### Other Finance areas
- **AllocationAccount (21):** G/L allocation accounts
- **Consolidation (47):** Multi-company consolidation
- **ReceivablesPayables (32):** Aged reports, statement, application
- **SalesTax (20):** US/CA tax setup and groups
- **Payroll (9):** Basic payroll integration hooks
- **FinancialReports (82):** Reports framework

## Bank (`Bank/` — 236 files)
- **BankAccount:** `BankAccount.Table.al`, bank account cards, bank account ledger
- **Reconciliation:** Bank account reconciliation, automatic matching
- **Payment:** Payment journal, payment export/import
- **Check:** Check ledger, print check, void check
- **DirectDebit:** SEPA direct debit setup and export
- **Deposit:** Bank deposit documents
- **Statement:** Bank statement import
- **PositivePay:** Positive pay export

## CashFlow (`CashFlow/` — 49 files)
- Cash flow forecast, manual revenue/expense entries
- Cash flow worksheet, setup
- Reports: Cash Flow Date List, Statement of Cash Flows

## CostAccounting (`CostAccounting/` — 82 files)
- Cost types, cost centers, cost objects
- Cost allocation, budget, journal
- Cost entries, cost registers
- Reports: Cost Accounting P&L, Cost Allocation, Cost Budget
