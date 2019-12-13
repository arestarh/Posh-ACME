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
        [string]$WSHPort = 80,
        [switch]$WSHTimeout = 120,
        [Parameter(ValueFromRemainingArguments)]
        $ExtraParams
    )


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
        [string]$WSHPort = 80,
        [switch]$WSHTimeout = 120,
        [Parameter(ValueFromRemainingArguments)]
        $ExtraParams
    )


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
