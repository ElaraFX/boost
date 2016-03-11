@echo off

:: build
call bootstrap.bat
bjam -j4 architecture=x86 address-model=64 variant=release link=static runtime-link=static threading=multi toolset=msvc-10.0 --with-filesystem --with-locale --with-thread --with-regex --with-system --with-date_time stage --with-wave
bjam -j4 architecture=x86 address-model=64 variant=debug link=static runtime-link=static threading=multi toolset=msvc-10.0 --with-filesystem --with-locale --with-thread --with-regex --with-system --with-date_time stage --with-wave

:: copy files
mkdir ..\elara_deps\boost\lib
mkdir ..\elara_deps\boost\include\boost
xcopy /E /Y stage\lib ..\elara_deps\boost\lib
xcopy /E /Y boost ..\elara_deps\boost\include\boost
