# ManageUsersSharedMailbox
Add users (via .CSV file) to a Exchange Online mailbox.


CSV file should contain only the field "Mailbox" At A1, and all e-mail addresses below that e.g. A2, A3 and the like in full e-mail format, so user@domain.com

Be sure to have already installed the Exchange Online Module

Install-Module PowershellGet -Force
Update-Module PowershellGet
Set-ExecutionPolicy RemoteSigned
Install-Module -Name ExchangeOnlineManagement 
