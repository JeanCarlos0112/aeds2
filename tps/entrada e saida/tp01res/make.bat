@echo off
cls
echo.
echo.

:: Definir variáveis corretamente (sem espacos)
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
    color
    pause
    exit /b
)

:: Executar o código
%J% -cp "%CD%;%libpath%" %1 < pub.in > teste.out
if %ERRORLEVEL% neq 0 (
    color 0C
    echo Erro na execucao! Verifique as mensagens acima.
    color
    pause
    exit /b
)

:: Comparar as saídas
fc teste.out pub.out
if %ERRORLEVEL% neq 0 (
    color 0C
    echo Diferenças encontradas nas saídas.
    color
    pause
)


