@echo off
setlocal EnableDelayedExpansion

chcp 65001

set VCPKG_PATH=C:/vcpkg
set VS_PATH=C:/BuildTools
set SRC_PATH=%CD%

for %%G in (x86 x64) do (
    set ARCH=%%G

    echo Building !ARCH!

    mkdir build-!ARCH!
    pushd build-!ARCH!

    call %VS_PATH%\VC\Auxiliary\Build\vcvarsall.bat !ARCH!

    call C:\BuildTools\Common7\Tools\VsDevCmd.bat -no_logo && cmake "-DCMAKE_TOOLCHAIN_FILE=%VCPKG_PATH%\scripts\buildsystems\vcpkg.cmake" ^
          "-DVCPKG_TARGET_TRIPLET=!ARCH!-windows-static-wo-crt" ^
          "-DCMAKE_BUILD_TYPE=Release" ^
          "-DCI_METHOD_LOOKUP=ON" ^
          "-DMSVC_STATIC_RUNTIME=OFF" ^
          -GNinja %SRC_PATH% || exit /b !errorlevel!

    call ninja || exit /b !errorlevel!
    popd
)