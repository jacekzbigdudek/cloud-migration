# Question: We don't need the backtick (`) in powershell script, do we?
# Read the introductory section of a powershell in month of lunches to 
# learn basic syntax and script structure.

$resourceGroupName = Read-Host -Prompt "Enter the resource group name: "
$location = Read-Host -Prompt "Enter the location (for example: eastus): "
$adminUsername = Read-Host -Prompt "Enter the administrator username: "
$adminPassword = Read-Host -Prompt "Enter the administrator password: " -AsSecureString
$dnsLabelPrefix = Read-Host -Prompt "Enter a unique DNS name for the public IP"

# We cannot create resource groups declaratively, as part of the template, for some reason.
New-AzResourceGroup -Name $resourceGroupName -Location $location

# Now we create a powershell object of type ResourceGroupDeployment, and reference the template file there.
New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    # Let's just baby step it, and try using the URI method first:
    -TemplateUri "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/quickstarts/microsoft.compute/vm-simple-windows/azuredeploy.json" `
    # -TemplateFile "
    -adminUsername $adminUsername `
    -adminPassword $adminPassword `
    -dnsLabelPrefix $dnsLabelPrefix

(Get-AzVm -ResourceGroupName $resourceGroupName).name




# New-AzVirtualNetwork 
#     -ResourceGroupName
#     -Location
#     -Name

