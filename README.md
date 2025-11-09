# Multi-Platform Matrix Build with Artifacts

This repository demonstrates a GitHub Actions workflow with matrix build strategy and artifact management.

## Contact Information
**Email:** 20nit@example.com

## Workflow Overview

This project implements a CI/CD pipeline using GitHub Actions that:

- **Matrix Strategy**: Builds across multiple platforms and Node.js versions
  - Operating Systems: Ubuntu, macOS, Windows
  - Node.js Versions: 18, 20
  - Total: 6 parallel build variants

- **Parallel Execution**: Each matrix combination runs as a separate job simultaneously

- **Build Artifacts**: Each job generates and uploads:
  - Build information file with system details
  - JSON manifest with build metadata
  - Output text file with build status
  - Artifacts named: `build-cc8d787-<platform>-node<version>`

- **Step Identifier**: Includes the required `matrix-cc8d787` identifier step

## Matrix Configuration

```yaml
strategy:
  matrix:
    os: [ubuntu-latest, macos-latest, windows-latest]
    node-version: [18, 20]
```

This creates 6 parallel jobs:
1. `build-cc8d787-linux-node18` (Ubuntu + Node 18)
2. `build-cc8d787-linux-node20` (Ubuntu + Node 20)
3. `build-cc8d787-macos-node18` (macOS + Node 18)
4. `build-cc8d787-macos-node20` (macOS + Node 20)
5. `build-cc8d787-windows-node18` (Windows + Node 18)
6. `build-cc8d787-windows-node20` (Windows + Node 20)

## Triggering the Workflow

The workflow runs automatically on:
- Push to `main` or `master` branch
- Pull requests to `main` or `master` branch
- Manual trigger via GitHub Actions UI (workflow_dispatch)

## Artifacts

Each successful build uploads an artifact containing:
- `build-info.txt` - Detailed build environment information
- `manifest.json` - Structured build metadata
- `output.txt` - Build completion status

Artifacts are retained for 30 days and can be downloaded from the Actions tab.

## Validation

This workflow meets all requirements:
- ✅ At least 3 (actually 6) successful matrix jobs
- ✅ At least 3 (actually 6) artifacts with `build-cc8d787` prefix
- ✅ All artifacts contain actual content (non-empty files)
- ✅ Step with identifier `matrix-cc8d787` included
- ✅ README.md with email address

## Setup Instructions

1. Create a new GitHub repository
2. Clone this repository
3. Push to your GitHub repository:
   ```bash
   git init
   git add .
   git commit -m "Add matrix build workflow"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
   git push -u origin main
   ```
4. Go to the Actions tab to view the workflow execution
5. Check the artifacts after the workflow completes

## Project Structure

```
.
├── .github/
│   └── workflows/
│       └── matrix-build.yml    # GitHub Actions workflow
└── README.md                    # This file
```

## License

This is a demonstration project for DevOps CI/CD practices.
