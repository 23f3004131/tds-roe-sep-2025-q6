# Quick Start Guide - Matrix Build

## 🚀 Fastest Way to Deploy

### Step 1: Update Email (30 seconds)
Open `README.md` and replace `20nit@example.com` with your actual email.

### Step 2: Run Setup Script (2 minutes)
```powershell
# In PowerShell (Windows)
cd c:\Users\20nit\23f3004131\tds-roe-sep-2025\q-6
.\setup.ps1
```

OR manually:
```powershell
git init
git add .
git commit -m "Initial commit: Add matrix build workflow"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git push -u origin main
```

### Step 3: Verify (3-5 minutes)
1. Go to https://github.com/YOUR_USERNAME/YOUR_REPO
2. Click **Actions** tab
3. Watch workflow run
4. Wait for completion
5. Check **Artifacts** section

### Step 4: Submit
Format: `https://github.com/YOUR_USERNAME/YOUR_REPO`

---

## 📋 What You'll See

### Actions Tab
6 parallel jobs:
- ✅ Build on ubuntu-latest with Node 18
- ✅ Build on ubuntu-latest with Node 20
- ✅ Build on macos-latest with Node 18
- ✅ Build on macos-latest with Node 20
- ✅ Build on windows-latest with Node 18
- ✅ Build on windows-latest with Node 20

### Artifacts (after completion)
- 📦 build-cc8d787-linux-node18
- 📦 build-cc8d787-linux-node20
- 📦 build-cc8d787-macos-node18
- 📦 build-cc8d787-macos-node20
- 📦 build-cc8d787-windows-node18
- 📦 build-cc8d787-windows-node20

---

## ✅ Requirements Checklist

Before submitting, verify:
- [ ] README.md has your email
- [ ] Pushed to GitHub
- [ ] Workflow ran successfully
- [ ] 6 jobs completed (all green)
- [ ] 6 artifacts uploaded
- [ ] All artifacts are non-empty
- [ ] Repository URL is correct format

---

## 🎯 Core Files

| File | Purpose |
|------|---------|
| `.github/workflows/matrix-build.yml` | **Main workflow** - Matrix build configuration |
| `README.md` | **Contains your email** - Main documentation |
| `setup.ps1` | Quick setup script (PowerShell) |
| `SETUP.md` | Detailed setup instructions |
| `SUMMARY.md` | Implementation summary |
| `WORKFLOW-DIAGRAM.md` | Visual workflow explanation |

---

## 🔧 Troubleshooting

**No workflow run?**
→ Make sure you pushed to `main` branch

**Jobs failing?**
→ Check job logs in Actions tab for details

**No artifacts?**
→ Artifacts appear only after job completion

**Wrong repo URL?**
→ Format: `https://github.com/username/repo` (no .git)

---

## 📖 Documentation

- **SETUP.md** - Step-by-step setup guide
- **SUMMARY.md** - Complete implementation details
- **WORKFLOW-DIAGRAM.md** - Visual workflow explanation
- **README.md** - Main project documentation

---

## 🎓 What This Demonstrates

✅ **Matrix Strategy** - 6 build variants (3 OS × 2 Node)
✅ **Parallel Execution** - All jobs run simultaneously
✅ **Artifact Management** - Unique artifacts per build
✅ **Modern CI/CD** - GitHub Actions best practices
✅ **Cross-Platform** - Linux, macOS, Windows

---

**Total Time: ~10 minutes from zero to deployed workflow!**
