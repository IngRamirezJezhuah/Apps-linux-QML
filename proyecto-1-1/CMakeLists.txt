cmake_minimum_required(VERSION 3.16)

project(proyecto-1-1 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

//find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS Qml Quick QuickControls2)


qt_standard_project_setup()

qt_add_executable(appproyecto-1-1
    main.cpp
)

qt_add_qml_module(appproyecto-1-1
    URI proyecto-1-1
    VERSION 1.0
    QML_FILES
        Main.qml
)

set_target_properties(appproyecto-1-1 PROPERTIES
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appproyecto-1-1
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appproyecto-1-1
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
