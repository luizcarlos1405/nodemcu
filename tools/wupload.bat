@echo off
set arg1=%1
set arg2=%2

lua %~dp0\wifiUpload\upload.lua %cd%\%arg1% %arg2%