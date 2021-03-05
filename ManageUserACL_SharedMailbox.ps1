# Script made by Yoeri de Rooij
# This script will add bulk users to an shared mailbox and sets all rights (Full Access, Send As, Send on Behalf).

 

#First step is connecting to the Exchange Online service
Connect-ExchangeOnline

 

#Creating a variable parameter for shared mailboxes
#prompts for Shared Mailbox Name
$DGroup = Read-Host 'Insert Shared Mailbox Name'

 

#Importing a CSV with members to add
Import-Csv  C:\scripts\Members.csv |

 

#Granting full control on the Shared Mailbox to members specified in CSV
 foreach { Add-MailboxPermission $DGroup  -User  $_.Mailbox  -AccessRights  FullAccess -Confirm:$false;
#Granting Send As rights on the Shared Mailbox specified at the start of the script to members specified in CSV
 Add-RecipientPermission -Identity $DGroup -Trustee $_.Mailbox -AccessRights "SendAs" -Confirm:$false;
#Setting Send On Behalf rights on the Shared Mailbox specified at the start of the script to members specified in CSV
 Set-Mailbox $DGroup -GrantSendOnBehalfTo @{Add=$_.Mailbox} -Confirm:$false
 } 
