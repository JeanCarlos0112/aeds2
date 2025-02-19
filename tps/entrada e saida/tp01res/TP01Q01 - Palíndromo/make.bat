REM
REM Autor: Jean Carlos Lopes Lellis
REM make: compilar e executar testes automaticos em java
REM 
REM Uso: make programa
REM      (sem usar extensao)
REM
@echo off
cls

REM Definir variáveis corretamente (sem espaços)
set JC=javac
set J=java
set libpath=C:\Users\jeanl\aeds2\fonte\ajuda\java
set lib=C:\Users\jeanl\aeds2\fonte\ajuda\java\MyIO.java
set main=%CD%\%1.java

REM Limpar para compilacao
if exist %1.class del %1.class
if exist teste.out del teste.out

REM Compilar o codigo
if exist %1.java %JC% -cp "%libpath%" "%lib%" "%main%"
if %ERRORLEVEL% neq 0 (
    color 0C
    echo Erro de compilacao! Verifique as mensagens acima.
    pause
    color
    exit /b
)

REM Executar o codigo
if exist %1.class %J% -cp "%CD%;%libpath%" %1 < pub.in > teste.out
if %ERRORLEVEL% neq 0 (
    color 0C
    echo Erro na execucao! Verifique as mensagens acima.
    pause
    color
    exit /b
)

REM Comparar os arquivos com diff usando WSL
wsl diff -w teste.out pub.out

REM Caso precisar para comparacao nativa do windows
REM fc /L teste.out pub.out

if %ERRORLEVEL% neq 0 (
    echo.
    echo DIFERENCAS ENCONTRADAS NAS SAIDAS
    REM Exibir arquivo ao final se desejar
    REM echo EXIBICAO DO ARQUIVO teste.out:
    REM echo.
    REM type teste.out
    pause
)
