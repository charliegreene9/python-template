::&commat;echo off
:: Check if UV is installed
if exist "C:\Users\%USERNAME%.local\bin\uv.exe" GOTO CreateVenv
:: If not then install it
powershell -c "irm https://astral.sh/uv/install.ps1 | more"
:: Now invoke it to create a venv
:CreateVenv
uv venv
:: Activate the venv
venv/scripts/activate
:: Make the venv install everything from requirements.txt
uv add -r requirements.txt