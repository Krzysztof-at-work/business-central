// ------------------------------------------------------------------------------------------------
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// ------------------------------------------------------------------------------------------------

namespace System.Runtime;

/// <summary>
/// Provides an API for handling Base64 conversion from buffers and streams.
/// </summary>
codeunit 2000000024 Base64Convert
{
    Access = Public;
    InherentEntitlements = X;
    InherentPermissions = X;

    /// <summary>
    /// Build the Base64 representation of a text string.
    /// </summary>
    /// <param name="String">The input text string to convert.</param>
    /// <param name="InsertLineBreaks">Whether to insert line breaks in the output.</param>
    /// <param name="TextEncoding">The encoding of the input text.</param>
    /// <param name="Codepage">The codepage to use for the conversion.</param>
    [Native]
    procedure ToBase64(String: Text; InsertLineBreaks: Boolean; TextEncoding: TextEncoding; Codepage: Integer): Text
    begin
    end;

    /// <summary>
    /// Build the Base64 representation of a text string.
    /// </summary>
    /// <param name="String">The input text string to convert.</param>
    /// <param name="InsertLineBreaks">Whether to insert line breaks in the output.</param>
    /// <param name="TextEncoding">The encoding of the input text.</param>
    /// <param name="Codepage">The codepage to use for the conversion.</param>
    /// <param name="OutStream">The output stream to write the Base64 data to.</param>
    [Native]
    procedure ToBase64(String: Text; InsertLineBreaks: Boolean; TextEncoding: TextEncoding; Codepage: Integer; OutStream: OutStream)
    begin
    end;


    /// <summary>
    /// Build the Base64 representation of the stream content.
    /// </summary>
    /// <param name="InStream">The input stream to convert.</param>
    /// <param name="InsertLineBreaks">Whether to insert line breaks in the output.</param>
    [Native]
    procedure ToBase64(InStream: InStream; InsertLineBreaks: Boolean): Text
    begin
    end;

    /// <summary>
    /// Build the Base64 representation of the stream content.
    /// </summary>
    /// <param name="InStream">The input stream to convert.</param>
    /// <param name="InsertLineBreaks">Whether to insert line breaks in the output.</param>
    /// <param name="OutStream">The output stream to write the Base64 data to.</param>
    [Native]
    procedure ToBase64(InStream: InStream; InsertLineBreaks: Boolean; OutStream: OutStream)
    begin
    end;


    /// <summary>
    /// Decode the base64 string to a text string.
    /// </summary>
    /// <param name="Base64String">The base64 string to decode.</param>
    /// <param name="TextEncoding">The encoding to use for the output text.</param>
    /// <param name="CodePage">The codepage to use for the output text.</param>
    [Native]
    procedure FromBase64(Base64String: Text; TextEncoding: TextEncoding; CodePage: Integer): Text
    begin
    end;

    /// <summary>
    /// Decode the base64 string to a stream.
    /// </summary>
    /// <param name="Base64String">The base64 string to decode.</param>
    /// <param name="TextEncoding">The encoding to use for the output text.</param>
    /// <param name="CodePage">The codepage to use for the output text.</param>
    [Native]
    procedure FromBase64(Base64String: Text; TextEncoding: TextEncoding; CodePage: Integer; OutStream: OutStream)
    begin
    end;

    /// <summary>
    /// Decode the base64 string to a stream.
    /// </summary>
    /// <param name="Base64String">The base64 string to decode.</param>
    /// <param name="OutStream">The output stream to write the decoded data to.</param>
    [Native]
    procedure FromBase64(Base64String: Text; OutStream: OutStream)    
    begin
    end;

    /// <summary>
    /// Decode the base64 stream to a string.
    /// </summary>
    /// <param name="InStream">The base64 stream data to decode.</param>
    [Native]
    procedure FromBase64(InStream: InStream) : Text
    begin
    end;

    /// <summary>
    /// Decode the base64 data in the InStream to an OutSttream.
    /// </summary>
    /// <param name="InStream">The base64 stream to decode.</param>
    /// <param name="OutStream">The output stream to write the decoded data to.</param>
    [Native]
    procedure FromBase64(InStream: InStream; OutStream: OutStream)    
    begin
    end;

}