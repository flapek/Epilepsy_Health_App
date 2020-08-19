try {
    $repos = @("Epilepsy_Health_App", "Epilepsy_Health_App.APIGateway", "Epilepsy_Health_App.Services.Identity")

    $toRemoveFromLocation = "\\Scripts"
    $currentLocation = Get-Location

    Write-Host "=========================================="
    Write-Host "Start git checkout develop." -ForegroundColor Blue

    $reposLocation = $currentLocation -replace $toRemoveFromLocation, ""
    $lastRepo = "\\Epilepsy_Health_App"
    foreach($repo in $repos) {
        $currentRepo = "\\$($repo)"
        
        $reposLocation = $reposLocation -replace $lastRepo, "\$($repo)"  
        Set-Location $reposLocation
        $lastRepo = $currentRepo

        git checkout develop
    }
    Set-Location $currentLocation

    Write-Host "Success!!" -foreground Green
}
catch {
    Set-Location $currentLocation
    Write-Host "Error!!" -foreground Red    
    Write-Host "Scripts fail, check it!" -foreground Red
}