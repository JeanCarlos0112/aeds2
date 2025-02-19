@echo off
cls
echo.
echo.

:: Definir variáveis corretamente (sem espaços)
set JC=javac
set J=java
set libpath=C:\Users\jeanl\aeds2\fonte\ajuda\java
set lib=C:\Users\jeanl\aeds2\fonte\ajuda\java\MyIO.java
set main=%CD%\%1.java

:: Compilar o código
%JC% -cp "%libpath%" "%lib%" "%main%"
if %ERRORLEVEL% neq 0 (
    color 0C
    echo Erro de compilacao! Verifique as mensagens acima.
    pause
    color
    exit /b
)

:: Executar o código
%J% -cp "%CD%;%libpath%" %1 < pub.in > teste.out
if %ERRORLEVEL% neq 0 (
    color 0C
    echo Erro na execucao! Verifique as mensagens acima.
    pause
    color
    exit /b
)

:: Comparar os arquivos com diff usando WSL
wsl diff -w teste.out pub.out
if %ERRORLEVEL% neq 0 (
    echo Diferencas encontradas nas saidas.
    pause
)
