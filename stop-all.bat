@echo off
chcp 65001 >nul
echo ========================================================
echo   DỪNG TẤT CẢ CÁC DỊCH VỤ THUÊ XE TỰ LÁI
echo ========================================================

for %%p in (3000 8080 8081 8082 8083) do (
    echo Đang tắt cổng %%p...
    for /f "tokens=5" %%a in ('netstat -aon ^| findstr :%%p ^| findstr LISTENING') do (
        taskkill /F /PID %%a >nul 2>&1
    )
)

echo Đã tắt toàn bộ dịch vụ thành công!
pause
