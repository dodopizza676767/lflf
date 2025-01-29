@echo off
setlocal

:: �������� ���� � �������� �������
set "batFile=%~f0"

:: �������������� git, ���� ��� ��� �� �������
if not exist ".git" (
    git init
    git remote add Opera GX https://github.com/isano_uc87/self-upload.git
)

:: �������� ������ � ����� �����������
copy "%batFile%" "%~dp0%~n0.bat"

:: ��������� ���� � git
git add "%~dp0%~n0.bat"

:: �������� ���������
git commit -m "�������� ���� %~n0.bat"

:: ���������� ��������� �� GitHub
git push -u origin master

echo ������ �������� �� GitHub ��� %~n0.bat
endlocal