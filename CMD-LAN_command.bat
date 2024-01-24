@echo off
setlocal enabledelayedexpansion

REM Demande du NOM_DU_POSTE
set /p NOM_DU_POSTE="Entrez le NOM_DU_POSTE: "

REM Demande de la COMMAND
set /p COMMAND="Entrez la COMMAND: "

REM Exécution de la commande wmic avec redirection de la sortie vers un fichier temporaire sur le poste distant
start /WAIT wmic /node:!NOM_DU_POSTE! process call create "cmd /c !COMMAND! ^> \\!NOM_DU_POSTE!\C$\Temp\temp_output.txt"

@PAUSE

REM Lecture du fichier temporaire pour afficher les résultats (sur le poste distant)
type \\!NOM_DU_POSTE!\C$\Temp\temp_output.txt

@PAUSE

REM Suppression du fichier temporaire sur le poste distant
del \\!NOM_DU_POSTE!\C$\Temp\temp_output.txt

endlocal

@PAUSE