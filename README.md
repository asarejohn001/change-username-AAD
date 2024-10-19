# Azure Active Directory Username
Entra username is the key identity factor for the users in your environment. Learn more about the user principal name from the [Enta documentation](https://learn.microsoft.com/en-us/entra/fundamentals/how-to-create-delete-users).

# About the script
The [change-username.ps1](change-username.ps1) script will help you change the user principal name (UPN) for a user in your Entra.
It imports the [Microsoft.Graph.Users](https://learn.microsoft.com/en-us/graph/overview?context=graph%2Fapi%2F1.0&view=graph-rest-1.0) REST API module. Connects to 365 your environment using [Connect-MgGraph](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.authentication/connect-mggraph?view=graph-powershell-1.0) and then uses the [Update-MgUser](https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.users/update-mguser?view=graph-powershell-1.0) cmdlet/parameter to update the properties of a user object - like the username/UPN. The script will need you to provide the current and new username.



