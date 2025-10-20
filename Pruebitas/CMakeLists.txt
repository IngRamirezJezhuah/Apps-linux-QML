cmake_minimum_required(VERSION 3.16)

project(Pruebitas VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Así debe quedar:
find_package(Qt6 6.9 REQUIRED COMPONENTS Core Gui Widgets Qml Quick)

qt_standard_project_setup(REQUIRES 6.9)

#!Agregar esta linea es necesario para que pueda importar los
#auocompletados que necesito para copilar xdd
set(QT_QML_GENERATE_QMLLS_INI ON) 

qt_add_executable(appPruebitas
    main.cpp
)

qt_add_qml_module(appPruebitas
    URI Pruebitas
    VERSION 1.0
    QML_FILES
        Main.qml
)


set_target_properties(appPruebitas PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appPruebitas
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appPruebitas
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
