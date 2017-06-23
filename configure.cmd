@echo off
rmdir /q /s build
mkdir build
pushd build
set CMAKE_MAKE_PROGRAM=1
set CMAKE_C_COMPILER=cl.exe
set CMAKE_CXX_COMPILER=cl.exe
set CORRADE_BUILD=-DUTILITY_USE_ANSI_COLORS=OFF
set MAGNUM_BUILD=-DWITH_AUDIO=OFF -DWITH_SDL2APPLICATION=ON -DWITH_OBJIMPORTER=ON -DWITH_TGAIMPORTER=ON
:: set SDL2_BUILD=-DSDL_STATIC=OFF -DSDL_SHARED=ON -DFORCE_STATIC_VCRT=OFF -DLIBC=ON
set VCPKG=-DCMAKE_TOOLCHAIN_FILE=%VCPKG_ROOT%/scripts/buildsystems/vcpkg.cmake ..
set ADDON=-DCMAKE_PREFIX_PATH=3rd/SDL
set OPT=-DTESTS=ON
cmake .. %OPT% %CORRADE_BUILD% %MAGNUM_BUILD% %SDL2_BUILD% %VCPKG% %ADDON% -G "Visual Studio 14 2015" 
:: cmake .. %OPT% %CORRADE_BUILD% %MAGNUM_BUILD% %SDL2_BUILD% %VCPKG% -G Ninja 
:: cmake .. %CORRADE_BUILD% %MAGNUM_BUILD% %SDL2_BUILD% %VCPKG% -G "Sublime Text 2 - Ninja"
popd