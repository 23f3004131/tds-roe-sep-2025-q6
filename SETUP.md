# Matrix Build Setup Instructions

## Quick Start

### 1. Update README.md with Your Email
Edit the `README.md` file and replace `20nit@example.com` with your actual email address.

### 2. Initialize Git Repository
```bash
git init
git add .
git commit -m "Initial commit: Add matrix build workflow"
```

### 3. Create GitHub Repository
1. Go to https://github.com/new
2. Create a new repository (public or private)
3. Do NOT initialize with README, .gitignore, or license

### 4. Push to GitHub
```bash
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git push -u origin main
```

### 5. Verify Workflow Execution
1. Go to your repository on GitHub
2. Click on the "Actions" tab
3. You should see the "Multi-Platform Matrix Build" workflow running
4. Wait for all 6 jobs to complete
5. Click on a completed workflow run to see the artifacts

### 6. Check Artifacts
In the workflow run details page:
- Scroll down to the "Artifacts" section
- You should see 6 artifacts:
  - build-cc8d787-linux-node18
  - build-cc8d787-linux-node20
  - build-cc8d787-macos-node18
  - build-cc8d787-macos-node20
  - build-cc8d787-windows-node18
  - build-cc8d787-windows-node20

### 7. Submit Your Repository URL
Use the format: `https://github.com/YOUR_USERNAME/YOUR_REPO`

## Workflow Features

✅ **6 Matrix Jobs**: 3 OS × 2 Node versions
✅ **Parallel Execution**: All jobs run simultaneously
✅ **Unique Artifacts**: Each with `build-cc8d787-` prefix
✅ **Non-empty Content**: Each artifact contains 3 files
✅ **Matrix Identifier**: Step named `matrix-cc8d787`
✅ **README with Email**: Contains your contact information

## Troubleshooting

**Workflow doesn't trigger?**
- Make sure you pushed to `main` or `master` branch
- Try manually triggering via Actions tab → Select workflow → Run workflow

**Jobs fail?**
- Check the job logs for specific error messages
- Ensure the workflow file is in `.github/workflows/` directory
- Verify YAML syntax is correct

**No artifacts?**
- Artifacts only appear after successful job completion
- Check if the upload step succeeded in the logs
- Artifacts may take a few seconds to appear after completion

## Manual Trigger

You can also trigger the workflow manually:
1. Go to Actions tab
2. Select "Multi-Platform Matrix Build"
3. Click "Run workflow"
4. Select branch (main)
5. Click "Run workflow" button
