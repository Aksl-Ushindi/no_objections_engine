@echo off
chcp 65001 >nul
cd /d "%~dp0"

REM --- CONFIG ---
set "USER=Aksl-Ushindi"
set "REPO=no_objections_engine"
set "BRANCH=main"
REM -------------

git init
git branch -M %BRANCH%
git remote add origin https://github.com/%USER%/%REPO%.git
git add .
git commit -m "Update"
git push -u origin %BRANCH%

pause
