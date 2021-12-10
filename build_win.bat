
@echo off

if exist "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat" (
call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat" > NUL 2> NUL
) else if exist "C:\Program Files\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat" (
call "C:\Program Files\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat" > NUL 2> NUL
) else (
  rem "Could not find visual studio C++ build environment."
)

mkdir build
pushd build
cmake ..

if "%1"=="configure" exit

if [%1]==[] (cmake --build . --config RelWithDebInfo)

if not [%1]==[] (cmake --build . --config %1)

popd
