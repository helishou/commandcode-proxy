@echo off
chcp 65001 >nul
title Command Code Proxy

:: 检查 node 是否可用
where node >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [错误] 未找到 Node.js，请先安装 Node.js 18+：https://nodejs.org/
    pause
    exit /b 1
)

:: 检查 config.json 存在
if not exist config.json (
    echo [提示] 未找到 config.json，已从示例复制一个模板。
    echo [提示] 请编辑 config.json，填入你的 apiKey（user_ 开头）
    copy config.json.example config.json
)

echo ================================
echo   Command Code Proxy 启动
echo   监听: http://127.0.0.1:3050
echo   API:   https://api.commandcode.ai
echo ================================
echo.

node proxy.mjs
