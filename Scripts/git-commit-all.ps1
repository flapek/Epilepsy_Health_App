$repos = @("Epilepsy_Health_App", "Epilepsy_Health_App.APIGateway", "Epilepsy_Health_App.Services.Identity")

$toRemoveFromLocation = "\\Scripts"
$currentLocation = Get-Location

try {
    Write-Host "=========================================="
    Write-Host "Write commit message:"
    $commitComment = Read-Host
    $reposLocation = $currentLocation -replace $toRemoveFromLocation, ""
    $lastRepo = "\\Epilepsy_Health_App"
    foreach($repo in $repos) {
        $currentRepo = "\\$($repo)"
        
        $reposLocation = $reposLocation -replace $lastRepo, "\$($repo)"  
        Set-Location $reposLocation
        $lastRepo = $currentRepo

        $currentBranch = git branch --show-current
        Write-Host "====================================================================================" -foreground blue
        Write-Host "Commit the Repository: "$repo -foreground Blue
        Write-Host "Current branch - "$currentBranch -foreground Yellow
        Write-Host "====================================================================================" -foreground blue
        Write-Host "Are you want commit changes on this branch?? (y/n)"
        $choose Read-Host
        if ($choose.ToLower() == "y") {
            # git commit -m $commitComment
        }
        else {
            Write-Host "Script change branch on develop and then create new branch." -foreground Blue
            git branch
            Write-Host "Choose branch. (if name didn't exist, it will be created)" -foreground Blue
            $newBranch Read-Host
            git
        }
        # Write-Host "====================================================================================" -foreground blue
        
    }
    Set-Location $currentLocation

    Write-Host "Success!!" -foreground Green
}
catch {
    Write-Host "Error!!" -foreground Red    
    Write-Host "Scripts fail, check it!" -foreground Red
}