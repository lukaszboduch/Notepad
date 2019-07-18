$inputjson = Get-Content .\GetPolicy1.json | out-string | ConvertFrom-Json

$policyname = $inputjson.value.properties.policydefinitions.policyDefinitionReferenceId | ConvertFrom-Json

$policyvalue = $inputjson.value.properties.parameters

ConvertFrom-Json

$alamakota= Get-Content -Raw -Path .\policies_input.json | ConvertFrom-Json
foreach ($dupa in $alamakota.value.properties.policyDefinitions.policyDefinitionReferenceId){
    $dupa
    $dupa=$dupa+"Effect"
    $alamakota.value.properties.parameters."${dupa}".defaultValue
}

$importjson= Get-Content -Raw -Path .\policies_input.json | ConvertFrom-Json
foreach ($policyname in $importjson.value.properties.policyDefinitions.policyDefinitionReferenceId){
    $policyname=$policyname+"Effect"
    $policyvalue=$importjson.value.properties.parameters."${policyname}".defaultValue 
    Write-Output  ""$policyname": {value: "$policyvalue"}" | ConvertTo-Json 
}

$gitUri = "https://raw.githubusercontent.com/lukaszboduch/SecurityCenterPolicy/master/body_input.json"
$body = Invoke-WebRequest -Uri $gitUri 
$content.Content


$inputjson = Get-Content .\GetPolicy1.json | out-string | ConvertFrom-Json
$inputjson = Get-Content .\GetPolicy1.json

$Policy = Get-AzPolicyAssignment | where {$_.Properties.displayName -EQ '[Preview]: Enable Monitoring in Azure Security Center'}

