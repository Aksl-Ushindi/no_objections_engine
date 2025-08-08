@echo off
chcp 65001 >nul
cd /d "%~dp0"

REM --- CONFIG ---
set "USER=Aksl-Ushindi"
set "REPO=no_objections_engine"
set "BRANCH=main"
REM -------------

REM Init Git si besoin
if not exist .git (
    git init
    git branch -M %BRANCH%
    git remote add origin https://github.com/%USER%/%REPO%.git
) else (
    git remote set-url origin https://github.com/%USER%/%REPO%.git
)

REM Sauvegarder les changements non commités avant pull
git add .
git commit -m "Auto-save before pull" >nul 2>&1

REM Mettre à jour depuis GitHub
git fetch origin %BRANCH%
git pull origin %BRANCH% --rebase

REM Ajouter tes changements finaux et commit
git add .
git commit -m "Update" >nul 2>&1

REM Pousser vers GitHub
git push -u origin %BRANCH%

pause
