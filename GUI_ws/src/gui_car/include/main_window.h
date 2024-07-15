#ifndef MAIN_WINDOW_H
#define MAIN_WINDOW_H

#include "q_node.h"
#include "ugv_msgs/toUGV.h"

#include <QMainWindow>
#include <QTime>
#include <QQuickView>
#include <QQuickItem>
#include <boost/array.hpp>
#include <QGeoCoordinate>
#include <iostream>
#include <fstream>
#include <cstdlib>
#include <vector>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include "trajectory_path.h"
//#include <ros/ros.h>

QT_BEGIN_NAMESPACE
namespace Ui { class Main_Window; }
QT_END_NAMESPACE

class Main_Window : public QMainWindow
{
    Q_OBJECT

public:
  explicit Main_Window(int argc, char** argv, QWidget* parent = nullptr);
  ~Main_Window();
    void keyPressEvent(QKeyEvent *event);

private slots:
    void on_Start_Manual_Button_clicked();

    void on_Stop_Manual_Button_clicked();

    void on_ColorChange_keyboard_Timeout();

    void on_sendButton_MPC_clicked();

    void on_startButton_MPC_clicked();

    void on_stopButton_MPC_clicked();

    void on_sendButton_LQR_clicked();

    void on_startButton_LQR_clicked();

    void on_stopButton_LQR_clicked();

    void on_map_viewButton_clicked();

    void on_clear_pathButton_clicked();

    void saveWaypointsToTable(const QVariant& waypointList);

    void on_Save_to_fileButton_clicked();

    void on_load_from_fileButton_clicked();

    void on_load_from_tableButton_clicked();

    void on_Generate_path_Button_clicked();
     
    void Send_Map();

    void on_defaultSetting_Button_clicked();

    void on_defaultButton_MPC_clicked();

    void on_defaultButton_LQR_clicked();

    void processMeasures();

private:
    Ui::Main_Window *ui;
    QNode qnode;
    QTime timer;
    bool isTimerStarted;
    double lat_position;
    double lng_position;
    float heading;
    double set_speed, set_angle, step_speed_manual, step_angle_manual;
    boost::array<double, 11> latitudeCoords;
    boost::array<double, 11> longitudeCoords;
    //Read and write Data tool
    std::ofstream save_data;
    std::ofstream save_log;
    std::ifstream in_data;
    //ros::NodeHandlePtr nh_;
    void ConverttoXY(double lat, double lon, double ref_lat,
                                            double ref_lon, double& x, double& y);
    void ConverttoLatLong(double x, double y, double ref_lat,
                            double ref_lon, double& lat, double& lon);

signals:
    void change_maptype(QVariant maptype);

    void waypointsLoadFromTableRequested(QVariant waypointList);

    void desiredPathGenerated(QVariant pointList);

    void newPointReceived(QVariant point);

    void newIMUrecieved(QVariant rotation, QVariant sin, QVariant cos);

    void newRefpointRecieved(QVariant);
};

class rotation_yaw
{
public:
  int yaw;
  std::string yaw_txt;
};
#endif // MAIN_WINDOW_H
