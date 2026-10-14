@echo off
chcp 65001 >nul
cd /d "%~dp0"
title 饮食记录

where python >nul 2>nul
if errorlevel 1 (
    echo [错误] 未检测到 Python，请先安装 Python 3.10 或更高版本：
    echo        https://www.python.org/downloads/
    echo        安装时务必勾选 "Add Python to PATH"
    pause
    exit /b 1
)

if not exist "venv\Scripts\python.exe" (
    echo 首次运行：正在创建虚拟环境并安装依赖，请稍候...
    python -m venv venv
    call venv\Scripts\python.exe -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt
    if errorlevel 1 (
        echo [错误] 依赖安装失败，请检查网络后重试。
        pause
        exit /b 1
    )
)

echo 启动服务：http://127.0.0.1:8080  （关闭本窗口即停止服务）
venv\Scripts\python.exe launcher.py
pause
