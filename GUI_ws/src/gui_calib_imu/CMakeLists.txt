cmake_minimum_required(VERSION 2.8.3)
project(gui_calib_imu)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

set(Qt5Core_DIR "/home/tu/Qt5.14.0/5.14.0/gcc_64/lib/cmake/Qt5Core")
set(Qt5Gui_DIR "/home/tu/Qt5.14.0/5.14.0/gcc_64/lib/cmake/Qt5Gui")
set(Qt5Widgets_DIR "/home/tu/Qt5.14.0/5.14.0/gcc_64/lib/cmake/Qt5Widgets")
set(Qt5Quick_DIR "/home/tu/Qt5.14.0/5.14.0/gcc_64/lib/cmake/Qt5Quick")
set(Qt5Qml_DIR "/home/tu/Qt5.14.0/5.14.0/gcc_64/lib/cmake/Qt5Qml")
set(Qt5Positioning_DIR "/home/tu/Qt5.14.0/5.14.0/gcc_64/lib/cmake/Qt5Positioning")
set(Qt5PrintSupport_DIR "/home/tu/Qt5.14.0/5.14.0/gcc_64/lib/cmake/Qt5PrintSupport")
set(Qt5_DIR "/home/tu/Qt5.14.0/5.14.0/gcc_64/lib/cmake/Qt5")
set(QT_QMAKE_EXECUTABLE "/home/tu/Qt5.14.0/5.14.0/gcc_64/bin/qmake")

find_package(Qt5 REQUIRED
  COMPONENTS
    Core
    Gui
    Widgets
    Quick
    Qml
    Positioning
    PrintSupport
)

find_package(catkin REQUIRED
  COMPONENTS
    roscpp
    sensor_msgs
    std_msgs
    ugv_msgs
)

include_directories(include ${catkin_INCLUDE_DIRS})
include_directories(
  ${Qt5Core_INCLUDE_DIRS}
  ${Qt5Gui_INCLUDE_DIRS}
  ${Qt5Widgets_INCLUDE_DIRS}
  ${Qt5Quick_INCLUDE_DIRS}
  ${Qt5Qml_INCLUDE_DIRS}
  ${Qt5Positioning_INCLUDE_DIRS}
  ${Qt5PrintSupport_INCLUDE_DIRS}

)

file(GLOB QT_FORMS RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} ui/*.ui)
file(GLOB QT_RESOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} resources/*.qrc)
file(GLOB_RECURSE QT_MOC RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} include/*.h)
file(GLOB_RECURSE QT_SOURCES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} src/*.cpp)

QT5_ADD_RESOURCES(QT_RESOURCES_CPP ${QT_RESOURCES})
QT5_WRAP_UI(QT_FORMS_HPP ${QT_FORMS})
QT5_WRAP_CPP(QT_MOC_HPP ${QT_MOC})

# catkin_package( ugv_msgs)
catkin_package(
  INCLUDE_DIRS include
#  LIBRARIES usv_1000
  CATKIN_DEPENDS roscpp std_msgs 
 ugv_msgs
#  DEPENDS system_lib
)

# add_executable(gui_calib_imu ${QT_SOURCES} ${QT_RESOURCES_CPP} ${QT_FORMS_HPP} ${QT_MOC_HPP} src/bspline_path.cpp src/joypad.cpp)
add_executable(gui_calib_imu ${QT_SOURCES} ${QT_RESOURCES_CPP} ${QT_FORMS_HPP} ${QT_MOC_HPP})
target_link_libraries(gui_calib_imu ${catkin_LIBRARIES})
target_link_libraries(gui_calib_imu
  Qt5::Core
  Qt5::Gui
  Qt5::Widgets
  Qt5::Quick
  Qt5::Qml
  Qt5::Positioning
  Qt5::PrintSupport
)
