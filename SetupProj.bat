::&commat;echo off
:: Check if UV is installed
if exist "C:\Users\%USERNAME%\.local\bin\uv.exe" GOTO CreateVenv
:: If not then install it
powershell -c "irm https://astral.sh/uv/install.ps1 | more"
:: Now invoke it to create a venv
:CreateVenv
uv venv --python 3.11.6
:: Activate the venv
CALL .venv/scripts/activate
:: Initialise project (create toml, etc), needed to create this template
uv init
:: Make the venv install everything from requirements.txt
uv add -r requirements.txt
pre-commit install
python get_spec.py
PAUSE
