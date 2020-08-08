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

        git checkout develop
        $currentBranch = git branch --show-current
        Write-Host "====================================================================================" -foreground blue
        Write-Host "Commit the Repository: "$repo -foreground Blue
        Write-Host "Current branch - "$currentBranch -foreground Yellow
        Write-Host "====================================================================================" -foreground blue
        Write-Host "Are you want commit changes on this branch?? (y/n)"
        $choose = Read-Host
        if ($choose.ToLower() -eq "y") {
            git add .
            git commit -m $commitComment
        }
        else {
            Write-Host "Script change branch on develop, then create new branch and push it to remote." -foreground Blue
            git branch
            Write-Host "Choose branch. (if name didn't exist, it will be created)" -foreground Blue
            $newBranch = Read-Host
            git checkout develop
            git checkout -b $newBranch
            git branch -u origin $newBranch    
            git add .
            git commit -m $commitComment
        }
        Write-Host "====================================================================================" -foreground blue
    }
    Set-Location $currentLocation

    Write-Host "Success!!" -foreground Green
}
catch {
    Set-Location $currentLocation
    Write-Host "Error!!" -foreground Red    
    Write-Host "Scripts fail, check it!" -foreground Red
}