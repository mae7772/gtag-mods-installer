@echo off
title II INSTALLER BOOSTED
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrator rights...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)
set "URL=https://github.com/iiDk-the-actual/iis.Stupid.Menu/releases/latest/download/iis_Stupid_Menu.dll"
set "DEST=C:\Program Files (x86)\Steam\steamapps\common\Gorilla Tag\BepInEx\plugins\iis_Stupid_Menu.dll"
echo Loading from %URL% to %DEST% ...
curl -L "%URL%" -o "%DEST%"
cls
if %errorlevel% neq 0 (
    echo Download failed! Please report the issue in the discord.
) else (
    echo Menu Installed
    powershell -command "[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] > $null; $template = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent([Windows.UI.Notifications.ToastTemplateType]::ToastText01); $template.GetElementsByTagName('text').Item(0).AppendChild($template.CreateTextNode('II stupid downloaded Successfully!')) > $null; $toast = [Windows.UI.Notifications.ToastNotification]::new($template); [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier('II INSTALLER BOOSTED').Show($toast)"
)
pause
