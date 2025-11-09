#!/bin/bash
# Git Initialization Script for Bash/Zsh
# Run this script to initialize and push to GitHub

echo "=== Matrix Build GitHub Actions Setup ==="
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "ERROR: Git is not installed or not in PATH"
    exit 1
fi

# Prompt for email to update README
echo "Step 1: Update README with your email"
read -p "Enter your email address: " email

if [ -n "$email" ]; then
    sed -i.bak "s/20nit@example.com/$email/" README.md
    rm -f README.md.bak
    echo "✓ README.md updated with email: $email"
else
    echo "⚠ Skipping email update. Please update README.md manually."
fi

echo ""

# Initialize git repository
echo "Step 2: Initialize Git repository"
if [ -d ".git" ]; then
    echo "✓ Git repository already initialized"
else
    git init
    echo "✓ Git repository initialized"
fi

# Add files
echo ""
echo "Step 3: Add files to Git"
git add .
echo "✓ Files added to staging"

# Commit
echo ""
echo "Step 4: Create initial commit"
git commit -m "Initial commit: Add matrix build workflow with artifacts"
echo "✓ Initial commit created"

# Rename branch to main
echo ""
echo "Step 5: Rename branch to main"
git branch -M main
echo "✓ Branch renamed to main"

# Prompt for GitHub repository URL
echo ""
echo "Step 6: Connect to GitHub remote"
echo "Please create a new repository on GitHub first (https://github.com/new)"
echo "Then enter your repository URL below:"
read -p "GitHub repository URL (e.g., https://github.com/username/repo.git): " repoUrl

if [ -n "$repoUrl" ]; then
    # Remove existing remote if it exists
    git remote remove origin 2>/dev/null
    
    git remote add origin "$repoUrl"
    echo "✓ Remote origin added: $repoUrl"
    
    echo ""
    echo "Step 7: Push to GitHub"
    echo "Pushing to remote repository..."
    
    git push -u origin main
    
    if [ $? -eq 0 ]; then
        echo "✓ Successfully pushed to GitHub!"
        echo ""
        echo "=== Setup Complete! ==="
        echo ""
        echo "Next steps:"
        echo "1. Go to your repository on GitHub: ${repoUrl%.git}"
        echo "2. Click on the 'Actions' tab"
        echo "3. Watch the matrix build workflow run"
        echo "4. Check for 6 artifacts with prefix 'build-cc8d787-'"
        echo ""
        echo "Your repository URL: ${repoUrl%.git}"
    else
        echo "✗ Push failed. Please check your credentials and repository URL."
    fi
else
    echo "⚠ Skipping remote setup. Run these commands manually:"
    echo "  git remote add origin <your-repo-url>"
    echo "  git push -u origin main"
fi
