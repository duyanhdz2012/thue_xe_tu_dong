@echo off
chcp 65001 >nul
echo ========================================================
echo   KHỞI ĐỘNG HỆ THỐNG THUÊ XE TỰ LÁI (DRIVENOW)
echo ========================================================
echo.

set MAVEN_CMD="C:\Program Files\JetBrains\IntelliJ IDEA 2026.1.4\plugins\maven\lib\maven3\bin\mvn.cmd"
cd /d "%~dp0"

echo [1/5] Khởi động Auth Service (Port 8081)...
start "Auth Service (Port 8081)" cmd /k "java -jar auth-service\target\auth-service-1.0.0.jar"
timeout /t 3 >nul

echo [2/5] Khởi động Car Service (Port 8082)...
start "Car Service (Port 8082)" cmd /k "java -jar car-service\target\car-service-1.0.0.jar"
timeout /t 3 >nul

echo [3/5] Khởi động Booking Service (Port 8083)...
start "Booking Service (Port 8083)" cmd /k "java -jar booking-service\target\booking-service-1.0.0.jar"
timeout /t 3 >nul

echo [4/5] Khởi động API Gateway (Port 8080)...
start "API Gateway (Port 8080)" cmd /k "java -jar api-gateway\target\api-gateway-1.0.0.jar"
timeout /t 4 >nul

echo [5/5] Khởi động Frontend Next.js (Port 3000)...
cd /d "%~dp0car-rental-frontend"
start "Frontend Next.js (Port 3000)" cmd /k "npm.cmd run dev"

echo.
echo ========================================================
echo   TẤT CẢ DỊCH VỤ ĐÃ ĐƯỢC KHỞI ĐỘNG!
echo   Mở trình duyệt tại: http://localhost:3000
echo   API Gateway tại:    http://localhost:8080
echo ========================================================
timeout /t 5 >nul
start http://localhost:3000
