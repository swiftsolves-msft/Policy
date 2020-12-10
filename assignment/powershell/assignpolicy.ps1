$loc = "eastus"
$rgname = "rgPolicyBeta2"
$policyassignname = "Corp Restrict VM Sizes Assignment"
$policydefid = Get-AzPolicyDefinition -Id "/providers/Microsoft.Authorization/policyDefinitions/cccc23c7-8427-4f53-ad12-b6a63eb452b3"

#Scope set to RG for testing, change scope to assign and apply to Subscription level
$scope = "/subscriptions/SUBIDHERE/resourceGroups/rgPolicyBeta2"

#Parameters the policy takes in, sometimes in a array format like below
$policyparamobj = @{'listOfAllowedSKUs'=('standard_a1_v2', 'standard_a10', 'standard_a11' )}

# create a Resource Group to test policy in 1st before applying to Subscription
New-AzResourceGroup -ResourceGroupName $rgname -Location $loc

New-AzPolicyAssignment -Name $policyassignname -PolicyDefinition $policydefid -Scope $scope -PolicyParameterObject $policyparamobj