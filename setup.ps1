# Git Initialization Script for PowerShell
# Run this script to initialize and push to GitHub

Write-Host "=== Matrix Build GitHub Actions Setup ===" -ForegroundColor Cyan
Write-Host ""

# Check if git is installed
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: Git is not installed or not in PATH" -ForegroundColor Red
    exit 1
}

# Prompt for email to update README
Write-Host "Step 1: Update README with your email" -ForegroundColor Yellow
$email = Read-Host "Enter your email address"

if ($email) {
    $readmePath = "README.md"
    $content = Get-Content $readmePath -Raw
    $content = $content -replace "20nit@example.com", $email
    Set-Content $readmePath -Value $content
    Write-Host "✓ README.md updated with email: $email" -ForegroundColor Green
} else {
    Write-Host "⚠ Skipping email update. Please update README.md manually." -ForegroundColor Yellow
}

Write-Host ""

# Initialize git repository
Write-Host "Step 2: Initialize Git repository" -ForegroundColor Yellow
if (Test-Path ".git") {
    Write-Host "✓ Git repository already initialized" -ForegroundColor Green
} else {
    git init
    Write-Host "✓ Git repository initialized" -ForegroundColor Green
}

# Add files
Write-Host ""
Write-Host "Step 3: Add files to Git" -ForegroundColor Yellow
git add .
Write-Host "✓ Files added to staging" -ForegroundColor Green

# Commit
Write-Host ""
Write-Host "Step 4: Create initial commit" -ForegroundColor Yellow
git commit -m "Initial commit: Add matrix build workflow with artifacts"
Write-Host "✓ Initial commit created" -ForegroundColor Green

# Rename branch to main
Write-Host ""
Write-Host "Step 5: Rename branch to main" -ForegroundColor Yellow
git branch -M main
Write-Host "✓ Branch renamed to main" -ForegroundColor Green

# Prompt for GitHub repository URL
Write-Host ""
Write-Host "Step 6: Connect to GitHub remote" -ForegroundColor Yellow
Write-Host "Please create a new repository on GitHub first (https://github.com/new)" -ForegroundColor Cyan
Write-Host "Then enter your repository URL below:" -ForegroundColor Cyan
$repoUrl = Read-Host "GitHub repository URL (e.g., https://github.com/username/repo.git)"

if ($repoUrl) {
    # Remove existing remote if it exists
    git remote remove origin 2>$null
    
    git remote add origin $repoUrl
    Write-Host "✓ Remote origin added: $repoUrl" -ForegroundColor Green
    
    Write-Host ""
    Write-Host "Step 7: Push to GitHub" -ForegroundColor Yellow
    Write-Host "Pushing to remote repository..." -ForegroundColor Cyan
    
    git push -u origin main
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ Successfully pushed to GitHub!" -ForegroundColor Green
        Write-Host ""
        Write-Host "=== Setup Complete! ===" -ForegroundColor Green
        Write-Host ""
        Write-Host "Next steps:" -ForegroundColor Cyan
        Write-Host "1. Go to your repository on GitHub: $repoUrl" -ForegroundColor White
        Write-Host "2. Click on the 'Actions' tab" -ForegroundColor White
        Write-Host "3. Watch the matrix build workflow run" -ForegroundColor White
        Write-Host "4. Check for 6 artifacts with prefix 'build-cc8d787-'" -ForegroundColor White
        Write-Host ""
        Write-Host "Your repository URL: $($repoUrl -replace '\.git$', '')" -ForegroundColor Yellow
    } else {
        Write-Host "✗ Push failed. Please check your credentials and repository URL." -ForegroundColor Red
    }
} else {
    Write-Host "⚠ Skipping remote setup. Run these commands manually:" -ForegroundColor Yellow
    Write-Host "  git remote add origin <your-repo-url>" -ForegroundColor White
    Write-Host "  git push -u origin main" -ForegroundColor White
}
