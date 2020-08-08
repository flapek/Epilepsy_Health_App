$repos = ("Epilepsy_Health_App.APIGateway", "Epilepsy_Health_App.Services.Identity")

$toRemoveFromLocation = "\\Epilepsy_Health_App\\Scripts"
$currentLocation = Get-Location

try {
    $reposLocation = $currentLocation -replace $toRemoveFromLocation, ""
    Set-Location $reposLocation  
    foreach($repo in $repos) {
        Write-Host "====================================================================================" -foreground blue
        Write-Host "Cloning the Repository: "$repo -foreground blue
        Write-Host "====================================================================================" -foreground blue
        $repo_url = "https://github.com/flapek/"+$repo+".git"
        git clone $repo_url
    }
    Set-Location $currentLocation

    Write-Host "Success!!" -foreground Green
}
catch {
    Write-Host "Error!!" -foreground Red    
    Write-Host "Scripts fail, check it!" -foreground Red
}

