provider "azurerm" {
   features {}
}

//create a Resource Group to test policy in 1st before applying to Subscription
resource "azurerm_resource_group" "sizepolicyassign" {
  name     = "rgPolicyBeta"
  location = "East US"
}

// Scope set to RG for testing, change scope to assign and apply to Subscription level
resource "azurerm_policy_assignment" "restrictvmsizes" {
  depends_on          = [azurerm_resource_group.sizepolicyassign]
  name                 = "Corp Restrict VM Sizes Assignment"
  scope                = "/subscriptions/SUBIDHERE/resourceGroups/rgPolicyBeta"
  policy_definition_id = "/providers/Microsoft.Authorization/policyDefinitions/cccc23c7-8427-4f53-ad12-b6a63eb452b3"
  display_name         = "Corp Restrict VM Sizes Assignment"

  metadata = <<METADATA
    {
    "category": "Compute"
    }
METADATA

// Parameters the policy takes in, sometimes in a array format like below
  parameters = <<PARAMETERS
{
  "listOfAllowedSKUs": {
    "value": [ "standard_a1_v2", "standard_a10", "standard_a11" ]
  }
}
PARAMETERS

}
