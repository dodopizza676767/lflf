@echo off
setlocal

:: Получаем путь к текущему батнику
set "batFile=%~f0"

:: Инициализируем git, если это еще не сделано
if not exist ".git" (
    git init
    git remote add Opera GX https://github.com/isano_uc87/self-upload.git
)

:: Копируем батник в папку репозитория
copy "%batFile%" "%~dp0%~n0.bat"

:: Добавляем файл в git
git add "%~dp0%~n0.bat"

:: Коммитим изменения
git commit -m "Добавлен файл %~n0.bat"

:: Отправляем изменения на GitHub
git push -u origin master

echo Батник загружен на GitHub как %~n0.bat
endlocal