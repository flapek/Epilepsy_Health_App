try {
    $repos = @("Epilepsy_Health_App", "Epilepsy_Health_App.APIGateway", "Epilepsy_Health_App.Services.Identity", "Epilepsy_Health_App.Services.HealthData", "SCL")

    $toRemoveFromLocation = "\\Scripts"
    $currentLocation = Get-Location

    Write-Host "=========================================="
    Write-Host "Start git status." -ForegroundColor Blue

    $repoLocation = $currentLocation -replace $toRemoveFromLocation, ""
    $lastRepo = "\\Epilepsy_Health_App"
    foreach($repo in $repos) {
        $currentRepo = "\\$($repo)"
        
        $repoLocation = $repoLocation -replace $lastRepo, "\$($repo)"  
        Set-Location $repoLocation
        $lastRepo = $currentRepo
        Write-Host $repoLocation -ForegroundColor Blue
        Write-Host "==========================================" -ForegroundColor Yellow
        git status
        Write-Host "==========================================" -ForegroundColor Yellow
    }
    Set-Location $currentLocation

    Write-Host "Finish!!" -foreground Green
}
catch {
    Set-Location $currentLocation
    Write-Host "Error!!" -foreground Red    
    Write-Host "Scripts fail, check it!" -foreground Red
}