1. Automatic deployment based on change set


Below is a basic example usage of a few commands within the TerraformTaskV4 task.

- task: TerraformTaskV4@4
  displayName: Initialize Terraform
  inputs:
    provider: 'azurerm'
    command: 'init'
    backendServiceArm: 'your-backend-service-connection'
    backendAzureRmResourceGroupName: 'your-rg-name'
    backendAzureRmStorageAccountName: 'your-stg-name'
    backendAzureRmContainerName: 'your-container-name'
    backendAzureRmKey: 'state.tfstate'

- task: TerraformTaskV4@4
  name: terraformPlan
  displayName: Create Terraform Plan
  inputs:
    provider: 'azurerm'
    command: 'plan'
    commandOptions: '-out main.tfplan'
    environmentServiceNameAzureRM: 'your-environment-service-connection'

# Only runs if the 'terraformPlan' task has detected changes the in state. 
- task: TerraformTaskV4@4
  displayName: Apply Terraform Plan
  condition: and(succeeded(), eq(variables['terraformPlan.changesPresent'], 'true'))
  inputs:
    provider: 'azurerm'
    command: 'apply'
    commandOptions: 'main.tfplan'
    environmentServiceNameAzureRM: 'your-environment-service-connection'



2. Multi Environment Deployment
https://oneuptime.com/blog/post/2026-02-23-how-to-use-the-terraform-extension-for-azure-devops/view


Terraform's -detailed-exitcode gives you:

Exit code	Meaning
0	Successful plan, no changes
1	Terraform error
2	Successful plan, changes detected


environment: prod
destroy: true
confirmDestroy: DESTROY-PROD

Then your pipeline has three possible behaviours:

environment	destroy	confirmDestroy	Result
dev	false	—	Plan → Apply if changes
stage	false	—	Plan → Apply if changes
prod	false	—	Plan → Approval → Apply
dev	true	—	Destroy
stage	true	—	Destroy/approval
prod	true	DESTROY-PROD	Protected Destroy
prod	true	anything else	Destroy skipped