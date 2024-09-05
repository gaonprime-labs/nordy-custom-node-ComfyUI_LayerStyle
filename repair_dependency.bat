@echo off

set "requirements_txt=%~dp0\repair_dependency_list.txt"
set "python_exec=..\..\..\python_embeded\python.exe"

echo Fixing Dependency Package...

echo Installing with ComfyUI Portable
%python_exec% -s -m pip install "inference-cli[yolo-world]>=0.13.0"
%python_exec% -s -m pip install "inference-gpu[yolo-world]>=0.13.0"
%python_exec% -s -m pip uninstall -y opencv-python opencv-contrib-python opencv-python-headless opencv-contrib-python-headless
for /f "delims=" %%i in (%requirements_txt%) do (
    %python_exec% -s -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple "%%i"
    )

pause