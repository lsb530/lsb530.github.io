@ECHO OFF
title ��Ĺ ��Ʈ Ȯ�� �� ���̴�(����) ���α׷�
mode con cols=83 lines=20
color E2
echo ---------------------------------------------------------------------------------
echo 	       ��Ĺ KIll(80xx Port) ����(.bat)���� by �º���
echo ---------------------------------------------------------------------------------
netstat -ano | find "LISTENING" | find "80"
echo            ��80�� ���� �����ϴ� ��Ʈ ��� Ȯ�οϷ�..��
echo  Ȥ�� ��Ʈ��ȣ�� �ٲ�ٸ�...? �����ٿ� �Է����ּ���(8080 �״�θ� �����Է�)
SET killport=8080
SET /p killport=
:home
color 06
echo	                �� 2�� �� %killport% ��Ʈ K I L L ��
timeout /t 2
for /f "tokens=5" %%p in ('netstat -aon ^| find /i "listening" ^| find "%killport%"') do taskkill /F /PID %%p
color F4
echo			 ������ ���� ��½� ���μ��� ����Ȱ�
echo                         %killport% ��Ʈ Kill �Ϸ�
pause