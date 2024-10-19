<#
Name: John Asare
Date: 09/11/2024

Des: Read more about this code from https://github.com/asarejohn001/change-username-AAD/edit/main/change-username.ps1
#>

# Import module
Import-Module Microsoft.Graph.Users

# Fucntion to log output
function Get-Log {
    param (
        [string]$LogFilePath,
        [string]$LogMessage
    )

    # Create the log entry with the current date and time
    $logEntry = "{0} - {1}" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss"), $LogMessage

    # Append the log entry to the log file
    Add-Content -Path $LogFilePath -Value $logEntry
}

# Set variables
$logFilePath = ".\log.txt" # location for the log file
$userId = "username@domain.com" # The current user-id
$newUPN = "newUPN@domain.com" # The new user-id

# Connect to AAD
try {
    # Attempt to connect to ADD
    Connect-MgGraph -Scopes "User.ReadWrite.All","Group.ReadWrite.All"
    Get-Log -LogFilePath $logFilePath -LogMessage "Successfully connected to AAD."
    
} catch {
    # Handle the error if connection fails
    Get-Log -LogFilePath $logFilePath -LogMessage "Failed to connect to AAD. Exiting script. Error details: $_"
    Write-Host "Couldn't connect to ADD. Check log file"
    exit
}

try {
    # Attempt to update the user's User Principal Name
    Update-MgUser -UserId $userId -UserPrincipalName $newUPN
    Get-Log -LogFilePath $logFilePath -LogMessage "User's User Principal Name updated successfully."
    Write-Host "Done, check the log file"
}
catch {
    # Handle the error
    Get-Log -LogFilePath $logFilePath -LogMessage "An error occurred while updating the user's User Principal Name. Error details: $($_.Exception.Message)"
    Write-Host "Done with errors, check log file"
}

# Disconnect from Microsoft Graph
Disconnect-MgGraph
Write-Host "Disconnected from Microsoft Graph."
