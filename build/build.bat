@echo off
setlocal enabledelayedexpansion

where darklua >nul 2>nul || (
    echo Error: darklua not found. Ensure it's in your PATH.
    exit /b 1
)

darklua process ..\src\init.luau dist.luau -c .darklua.json || exit /b

if not exist dist.luau (
    echo Error: dist.luau not found
    exit /b 1
)

set "split_key=--!DARKLUA_BUILD: [SPLIT_END]"
set "pre_split=true"
set "split_start_file=_split_start.tmp"
set "split_end_file=_split_end.tmp"

findstr /n "^" "split.luau" > "_temp.tmp"
break > "%split_start_file%"
break > "%split_end_file%"

for /f "usebackq delims=" %%A in ("_temp.tmp") do (
    set "fullline=%%A"
    set "line=!fullline:*:=!"
    
    if "!line:~0,2!"=="--" (
        if "!line!"=="%split_key%" (
            set "pre_split=false"
        )
    ) else (
        if "!pre_split!"=="true" (
            echo(!line!>>"%split_start_file%"
        ) else (
            echo(!line!>>"%split_end_file%"
        )
    )
)

del "_temp.tmp"

type header.luau > dist.luau.new || exit /b
type "%split_start_file%" >> dist.luau.new || exit /b
type dist.luau >> dist.luau.new || exit /b
type "%split_end_file%" >> dist.luau.new || exit /b

del "%split_start_file%"
del "%split_end_file%"
move /Y dist.luau.new dist.luau || exit /b
move /Y dist.luau ..\dist.luau || exit /b

endlocal
