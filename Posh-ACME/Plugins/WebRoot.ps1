function Get-CurrentPluginType { 'http-01' }

function Add-HttpChallenge {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,Position=0)]
        [string]$Domain,
        [Parameter(Mandatory,Position=1)]
        [string]$Token,
        [Parameter(Mandatory,Position=2)]
        [string]$Body,
        [Parameter(Mandatory)]
        [string]$WRPath,
        [switch]$WRExactPath,
        [Parameter(ValueFromRemainingArguments)]
        $ExtraParams
    )

    # expand any relative path params
    $WRPath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($WRPath)

    # build the appropriate output folder path
    if ($WRExactPath) {
        $outFolder = $WRPath
    } else {
        $outFolder = Join-Path $WRPath ".well-known/acme-challenge"
    }
    Write-Debug "Creating challenge file for $Domain in $outFolder"

    # attempt to create the folder if it doesn't exist
    if (-not (Test-Path $outFolder -PathType Container)) {
        Write-Debug "Folder doesn't exist, attempting to create it."
        New-Item -Path $outFolder -ItemType Directory -ErrorAction Stop
    }

    $outFile = Join-Path $outFolder $Token
    Write-Debug "Writing file $outFile"
    $Body | Out-File $outFile -Encoding ascii -Force

    <#
    .SYNOPSIS
        Publish an HTTP challenge to <My HTTP Server/Provider>

    .DESCRIPTION
        Description for <My HTTP Server/Provider>

    .PARAMETER Domain
        The fully qualified domain name to publish the challenge for.

    .PARAMETER Token
        The token value associated with this specific challenge.

    .PARAMETER Body
        The text that should make up the response body from the URL.

    .PARAMETER ExtraParams
        This parameter can be ignored and is only used to prevent errors when splatting with more parameters than this function supports.

    .EXAMPLE
        Remove-HttpChallenge 'example.com' 'TOKEN' 'body-value'

        Removes an HTTP challenge for the specified domain, token, and body value.
    #>
}

function Remove-HttpChallenge {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory,Position=0)]
        [string]$Domain,
        [Parameter(Mandatory,Position=1)]
        [string]$Token,
        [Parameter(Mandatory,Position=2)]
        [string]$Body,
        [Parameter(Mandatory)]
        [string]$WRPath,
        [switch]$WRExactPath,
        [Parameter(ValueFromRemainingArguments)]
        $ExtraParams
    )

    # expand any relative path params
    $WRPath = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($WRPath)

    # build the appropriate output file path
    if ($WRExactPath) {
        $outFile = Join-Path $WRPath $Token
    } else {
        $outFile = Join-Path $WRPath ".well-known/acme-challenge/$Token"
    }
    Write-Debug "Removing challenge file for $Domain at $outFile"

    # make sure it actually exists
    if (Test-Path $outFile -PathType Leaf) {
        Remove-Item -Path $outFile -Force -ErrorAction Stop
    } else {
        Write-Debug "File doesn't exist, nothing to do."
    }


    <#
    .SYNOPSIS
        Unpublish an HTTP challenge from <My HTTP Server/Provider>

    .DESCRIPTION
        Description for <My HTTP Server/Provider>

    .PARAMETER Domain
        The fully qualified domain name to publish the challenge for.

    .PARAMETER Token
        The token value associated with this specific challenge.

    .PARAMETER Body
        The text that should make up the response body from the URL.

    .PARAMETER ExtraParams
        This parameter can be ignored and is only used to prevent errors when splatting with more parameters than this function supports.

    .EXAMPLE
        Remove-HttpChallenge 'http://example.com/.well-known/acme-challenge/TOKEN' 'body-value'

        Removes an HTTP challenge from the specified site with the specified body.
    #>
}

function Save-HttpChallenge {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromRemainingArguments)]
        $ExtraParams
    )

    <#
    .SYNOPSIS
        Not required.

    .DESCRIPTION
        This provider does not require calling this function to commit changes to HTTP challenges.

    .PARAMETER ExtraParams
        This parameter can be ignored and is only used to prevent errors when splatting with more parameters than this function supports.
    #>
}

############################
# Helper Functions
############################

# Add additional functions here if necessary.

# Try to follow verb-noun naming guidelines.
# https://msdn.microsoft.com/en-us/library/ms714428

# Add a commented link to API docs if they exist.
