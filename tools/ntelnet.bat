@echo off
set arg1=%1
set arg2=%2

node %~dp0\nodeTelnet\index.js %arg1% %arg2%