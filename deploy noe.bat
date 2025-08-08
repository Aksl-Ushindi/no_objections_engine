@echo off
REM === Script de push et déploiement du No Objections Engine ===

REM Nom du dépôt distant GitHub (à personnaliser)
set REPO_URL=https://github.com/Aksl-Ushindi/no_objections_engine.git
set BRANCH=main

REM Aller dans le dossier du script
cd /d "%~dp0"

REM Initialiser Git si besoin
if not exist .git (
    echo Initialisation du dépôt Git...
    git init
    git branch -M %BRANCH%
    git remote add origin %REPO_URL%
) else (
    echo Dépôt Git déjà initialisé.
)

REM Ajouter tous les fichiers
echo Ajout des fichiers...
git add .

REM Commit avec date/heure
set TIMESTAMP=%date% %time%
git commit -m "Mise à jour automatique %TIMESTAMP%"

REM Push vers GitHub
echo Envoi vers GitHub...
git push -u origin %BRANCH%

REM Message final
echo.
echo =======================================
echo ✅ Déploiement terminé !
echo Vérifie sur GitHub Pages si activé :
echo https://Aksl-Ushindi.github.io/no_objections_engine/
echo =======================================
pause
