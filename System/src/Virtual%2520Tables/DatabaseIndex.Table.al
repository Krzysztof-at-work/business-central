// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------
namespace System.Diagnostics;

/// <summary>
/// Virtual table that presents detailed per-index data from the database.
/// </summary>
/// <remarks>
/// This table sources its data directly from the database instead of "just" metadata like the Key table,
/// as a consequence its data output should not be considered stable and may change due to database tuning or platform changes.
/// All output rows from this table should be considered implementation details and may change if the platform changes its physical database implementation.
/// </remarks>
table 2000000300 "Database Index"
{
    Scope = OnPrem; // TODO: We should likely make this public before release.
    Extensible = false;
    DataPerCompany = false;
    Access = Public;
    DataClassification = SystemMetadata;

    fields
    {
        field(1; TableId; Integer)
        {
            Caption = 'Table No';
            ToolTip = 'ID of the table this index belongs to.';

            DataClassification = SystemMetadata;
        }
        field(2; "Index Name"; Text[128])
        {
            Caption = 'Index Name';
            ToolTip = 'Name of the index either defined by metadata or automatically created by the database engine.';
            DataClassification = SystemMetadata;
        }
        field(3; "Company Name"; Text[30])
        {
            Caption = 'Company Name';
            ToolTip = 'Name of the company this index belongs to or empty if the index is not-per company.';

            DataClassification = OrganizationIdentifiableInformation;
        }
        field(4; "Source App ID"; Guid)
        {
            Caption = 'Source App ID';
            ToolTip = 'The application ID of the source of the index.';
            DataClassification = SystemMetadata;
        }
        field(5; "Column Names"; Text[2048])
        {
            Caption = 'Column Names';
            ToolTip = 'Comma-separated list of column names included in the index.';
        }
        field(6; "Included Fields"; Text[2048])
        {
            Caption = 'Included Fields';
            ToolTip = 'Comma-separated list of included column names.';
            DataClassification = SystemMetadata;
        }
        field(7; Enabled; Boolean)
        {
            Caption = 'Enabled';
            ToolTip = 'Indicates whether the index is enabled.';
            DataClassification = SystemMetadata;
        }
        field(8; "Metadata Defined"; Boolean)
        {
            Caption = 'AL Defined';
            ToolTip = 'Specifies whether the index is AL defined.';
            DataClassification = SystemMetadata;
        }
        field(9; Unique; Boolean)
        {
            Caption = 'Unique';
            ToolTip = 'Indicates whether the index is AL defined as unique.';
            DataClassification = SystemMetadata;
        }
        field(10; "Index Size (KB)"; BigInteger)
        {
            Caption = 'Index Size (KB)';
            ToolTip = 'The current size of the index in the database in kilobytes.';
            DataClassification = SystemMetadata;
        }
        field(11; "Fragmentation %"; Decimal)
        {

            Caption = 'Fragmentation %';
            ToolTip = 'Average fragmentation percentage of the index.';
            DataClassification = SystemMetadata;
        }
        field(12; "User Seeks"; BigInteger)
        {
            Caption = 'Number of user seeks';
            ToolTip = 'Number of user seeks on this index since the database was last started.';
            DataClassification = SystemMetadata;
        }
        field(13; "User Scans"; BigInteger)
        {
            Caption = 'Number of user scans';
            ToolTip = 'Number of user scans on this index since the database was last started.';
            DataClassification = SystemMetadata;
        }
        field(14; "User Lookups"; BigInteger)
        {
            Caption = 'Number of user lookups';
            ToolTip = 'Number of user lookups on this index since the database was last started.';
            DataClassification = SystemMetadata;
        }
        field(15; "User Updates"; BigInteger)
        {
            Caption = 'Number of user updates';
            ToolTip = 'Number of user updates on this index since the database was last started.';
            DataClassification = SystemMetadata;
        }
        field(16; "Last Seek"; DateTime)
        {
            Caption = 'Last user seek';
            ToolTip = 'Timestamp of the last user seek on this index since the database was last started.';
            DataClassification = SystemMetadata;
        }
        field(17; "Last Scan"; DateTime)
        {
            Caption = 'Last user scan';
            ToolTip = 'Timestamp of the last user scan on this index since the database was last started.';
            DataClassification = SystemMetadata;
        }
        field(18; "Last Lookup"; DateTime)
        {
            Caption = 'Last user lookup';
            ToolTip = 'Timestamp of the last user lookup on this index since the database was last started.';
            DataClassification = SystemMetadata;
        }
        field(19; "Last Update"; DateTime)
        {
            Caption = 'Last user update';
            ToolTip = 'Timestamp of the last user update on this index since the database was last started.';
            DataClassification = SystemMetadata;
        }
        field(20; "Database Start time"; DateTime)
        {
            Caption = 'Database start time';
            ToolTip = 'Timestamp when the database was last started.';
            DataClassification = SystemMetadata;
        }
        field(21; "Row count"; BigInteger)
        {
            Caption = 'Row count';
            ToolTip = 'Number of rows in the index.';
            DataClassification = SystemMetadata;
        }
#pragma warning disable AS0005
        // Changing the field name is not allowed, but since this table has not to be released yet, nobody can have taken a dependency on it, so we can we can rename it.
        field(22; "Statistics rebuild at"; DateTime)
        {
            Caption = 'Statistics rebuild at';
            ToolTip = 'The last time the index''s corresponding statistics was rebuild. Statistics are updated automatically by the database engine based on certain thresholds of data changes, or when an index is re-enabled.';
            DataClassification = SystemMetadata;
        }
#pragma warning restore AS0005
    }

    keys
    {
        key(PK; TableId, "Index Name", "Company Name", "Source App ID")
        {
            Clustered = true;
        }
    }
}