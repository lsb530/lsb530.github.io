@ECHO OFF
title 톰캣 포트 확인 후 죽이는(잔인) 프로그램
mode con cols=83 lines=20
color E2
echo ---------------------------------------------------------------------------------
echo 	       톰캣 KIll(80xx Port) 실행(.bat)파일 by 승복㈜
echo ---------------------------------------------------------------------------------
netstat -ano | find "LISTENING" | find "80"
echo            ★80이 붙은 동작하는 포트 목록 확인완료..★
echo  혹시 포트번호를 바꿨다면...? 다음줄에 입력해주세요(8080 그대로면 엔터입력)
SET killport=8080
SET /p killport=
:home
color 06
echo	                ※ 2초 뒤 %killport% 포트 K I L L ※
timeout /t 2
for /f "tokens=5" %%p in ('netstat -aon ^| find /i "listening" ^| find "%killport%"') do taskkill /F /PID %%p
color F4
echo			 성공과 오류 출력시 프로세스 종료된것
echo                         %killport% 포트 Kill 완료
pause